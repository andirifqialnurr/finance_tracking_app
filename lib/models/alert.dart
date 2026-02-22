/// Alert Models

/// Budget Alert — matches GET /alerts response from backend
class BudgetAlert {
  final String id;
  final String categoryId;
  final String categoryName;
  final int threshold; // threshold_percentage on DB, "threshold" in response
  final double currentUsage; // current usage percentage
  final bool isEnabled;
  final String status; // "active" / "triggered"
  final String? level; // "warning" / "critical"
  final String? message;
  final DateTime createdAt;
  final DateTime? triggeredAt; // last_triggered

  BudgetAlert({
    required this.id,
    required this.categoryId,
    required this.categoryName,
    required this.threshold,
    required this.currentUsage,
    required this.isEnabled,
    required this.status,
    this.level,
    this.message,
    required this.createdAt,
    this.triggeredAt,
  });

  factory BudgetAlert.fromJson(Map<String, dynamic> json) {
    // Handle category - can be an embedded object or just id/name at root
    String catId = '';
    String catName = '';
    if (json['category'] is Map<String, dynamic>) {
      final cat = json['category'] as Map<String, dynamic>;
      catId = cat['id'] as String? ?? '';
      catName = cat['name'] as String? ?? '';
    } else {
      catId = json['category_id'] as String? ?? '';
      catName = json['category_name'] as String? ?? '';
    }

    // Backend returns "threshold" or "threshold_percentage"
    final threshold =
        json['threshold'] as int? ?? json['threshold_percentage'] as int? ?? 0;
    // Backend returns "current_usage" or "current_amount"
    final currentUsage =
        (json['current_usage'] as num? ?? json['current_amount'] as num? ?? 0)
            .toDouble();

    return BudgetAlert(
      id: json['id'] as String,
      categoryId: catId,
      categoryName: catName,
      threshold: threshold,
      currentUsage: currentUsage,
      isEnabled: json['is_enabled'] as bool? ?? true,
      status: json['status'] as String? ?? 'active',
      level: json['level'] as String?,
      message: json['message'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      triggeredAt: json['triggered_at'] != null
          ? DateTime.parse(json['triggered_at'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category_id': categoryId,
      'category_name': categoryName,
      'threshold': threshold,
      'current_usage': currentUsage,
      'is_enabled': isEnabled,
      'status': status,
      'level': level,
      'message': message,
      'created_at': createdAt.toIso8601String(),
      'triggered_at': triggeredAt?.toIso8601String(),
    };
  }

  BudgetAlert copyWith({
    String? id,
    String? categoryId,
    String? categoryName,
    int? threshold,
    double? currentUsage,
    bool? isEnabled,
    String? status,
    String? level,
    String? message,
    DateTime? createdAt,
    DateTime? triggeredAt,
  }) {
    return BudgetAlert(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      categoryName: categoryName ?? this.categoryName,
      threshold: threshold ?? this.threshold,
      currentUsage: currentUsage ?? this.currentUsage,
      isEnabled: isEnabled ?? this.isEnabled,
      status: status ?? this.status,
      level: level ?? this.level,
      message: message ?? this.message,
      createdAt: createdAt ?? this.createdAt,
      triggeredAt: triggeredAt ?? this.triggeredAt,
    );
  }

  bool get isTriggered => status == 'triggered';
  bool get isActive => isEnabled && status == 'active';
  bool get isWarning => level == 'warning';
  bool get isCritical => level == 'critical';
}

/// Request to create a new alert — POST /alerts
class CreateAlertRequest {
  final String categoryId;
  final int thresholdPercentage;
  final bool isEnabled;

  CreateAlertRequest({
    required this.categoryId,
    required this.thresholdPercentage,
    this.isEnabled = true,
  });

  Map<String, dynamic> toJson() {
    return {
      'category_id': categoryId,
      'threshold_percentage': thresholdPercentage,
      'is_enabled': isEnabled,
    };
  }
}

/// Request to update an alert — PATCH /alerts/:id
class UpdateAlertRequest {
  final int? thresholdPercentage;
  final bool? isEnabled;

  UpdateAlertRequest({this.thresholdPercentage, this.isEnabled});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    if (thresholdPercentage != null)
      json['threshold_percentage'] = thresholdPercentage;
    if (isEnabled != null) json['is_enabled'] = isEnabled;
    return json;
  }
}
