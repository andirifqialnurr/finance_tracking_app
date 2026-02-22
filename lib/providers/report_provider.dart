import 'package:flutter/foundation.dart';
import '../models/report.dart';
import '../services/report_service.dart';
import '../services/api_client.dart';

/// Provider for Reports Screen
/// Manages monthly and yearly reports and export functionality
class ReportProvider with ChangeNotifier {
  final ReportService _reportService;

  ReportProvider({ReportService? reportService})
    : _reportService = reportService ?? ReportService();

  // Loading states
  bool _isLoadingMonthlyReport = false;
  bool _isLoadingYearlyReport = false;
  bool _isExporting = false;

  // Data
  MonthlyReport? _monthlyReport;
  YearlyReport? _yearlyReport;

  // Errors
  String? _monthlyReportError;
  String? _yearlyReportError;
  String? _exportError;

  // Success messages
  String? _exportSuccess;

  // Getters - Loading States
  bool get isLoadingMonthlyReport => _isLoadingMonthlyReport;
  bool get isLoadingYearlyReport => _isLoadingYearlyReport;
  bool get isExporting => _isExporting;

  // Getters - Data
  MonthlyReport? get monthlyReport => _monthlyReport;
  YearlyReport? get yearlyReport => _yearlyReport;

  // Getters - Errors
  String? get monthlyReportError => _monthlyReportError;
  String? get yearlyReportError => _yearlyReportError;
  String? get exportError => _exportError;

  // Getters - Success
  String? get exportSuccess => _exportSuccess;

  /// Fetch monthly report
  ///
  /// [month] - Month (1-12)
  /// [year] - Year
  Future<void> fetchMonthlyReport({
    required int month,
    required int year,
  }) async {
    _isLoadingMonthlyReport = true;
    _monthlyReportError = null;
    notifyListeners();

    try {
      _monthlyReport = await _reportService.getMonthlyReport(
        month: month,
        year: year,
      );
      _monthlyReportError = null;
    } on ApiException catch (e) {
      _monthlyReportError = e.message;
      _monthlyReport = null;
    } catch (e) {
      _monthlyReportError = 'Failed to load monthly report: $e';
      _monthlyReport = null;
    } finally {
      _isLoadingMonthlyReport = false;
      notifyListeners();
    }
  }

  /// Fetch yearly report
  ///
  /// [year] - Year
  Future<void> fetchYearlyReport({required int year}) async {
    _isLoadingYearlyReport = true;
    _yearlyReportError = null;
    notifyListeners();

    try {
      _yearlyReport = await _reportService.getYearlyReport(year: year);
      _yearlyReportError = null;
    } on ApiException catch (e) {
      _yearlyReportError = e.message;
      _yearlyReport = null;
    } catch (e) {
      _yearlyReportError = 'Failed to load yearly report: $e';
      _yearlyReport = null;
    } finally {
      _isLoadingYearlyReport = false;
      notifyListeners();
    }
  }

  /// Export monthly report as PDF
  ///
  /// [month] - Month (1-12)
  /// [year] - Year
  Future<String?> exportMonthlyReportPDF({
    required int month,
    required int year,
  }) async {
    _isExporting = true;
    _exportError = null;
    _exportSuccess = null;
    notifyListeners();

    try {
      final filePath = await _reportService.exportMonthlyReportPDF(
        month: month,
        year: year,
      );
      _exportSuccess = 'Monthly report exported as PDF successfully!';
      _exportError = null;
      return filePath;
    } on ApiException catch (e) {
      _exportError = e.message;
      _exportSuccess = null;
      return null;
    } catch (e) {
      _exportError = 'Failed to export monthly report: $e';
      _exportSuccess = null;
      return null;
    } finally {
      _isExporting = false;
      notifyListeners();
    }
  }

  /// Export monthly report as Excel
  ///
  /// [month] - Month (1-12)
  /// [year] - Year
  Future<String?> exportMonthlyReportExcel({
    required int month,
    required int year,
  }) async {
    _isExporting = true;
    _exportError = null;
    _exportSuccess = null;
    notifyListeners();

    try {
      final filePath = await _reportService.exportMonthlyReportExcel(
        month: month,
        year: year,
      );
      _exportSuccess = 'Monthly report exported as Excel successfully!';
      _exportError = null;
      return filePath;
    } on ApiException catch (e) {
      _exportError = e.message;
      _exportSuccess = null;
      return null;
    } catch (e) {
      _exportError = 'Failed to export monthly report: $e';
      _exportSuccess = null;
      return null;
    } finally {
      _isExporting = false;
      notifyListeners();
    }
  }

  /// Export yearly report as PDF
  ///
  /// [year] - Year
  Future<String?> exportYearlyReportPDF({required int year}) async {
    _isExporting = true;
    _exportError = null;
    _exportSuccess = null;
    notifyListeners();

    try {
      final filePath = await _reportService.exportYearlyReportPDF(year: year);
      _exportSuccess = 'Yearly report exported as PDF successfully!';
      _exportError = null;
      return filePath;
    } on ApiException catch (e) {
      _exportError = e.message;
      _exportSuccess = null;
      return null;
    } catch (e) {
      _exportError = 'Failed to export yearly report: $e';
      _exportSuccess = null;
      return null;
    } finally {
      _isExporting = false;
      notifyListeners();
    }
  }

  /// Export yearly report as Excel
  ///
  /// [year] - Year
  Future<String?> exportYearlyReportExcel({required int year}) async {
    _isExporting = true;
    _exportError = null;
    _exportSuccess = null;
    notifyListeners();

    try {
      final filePath = await _reportService.exportYearlyReportExcel(year: year);
      _exportSuccess = 'Yearly report exported as Excel successfully!';
      _exportError = null;
      return filePath;
    } on ApiException catch (e) {
      _exportError = e.message;
      _exportSuccess = null;
      return null;
    } catch (e) {
      _exportError = 'Failed to export yearly report: $e';
      _exportSuccess = null;
      return null;
    } finally {
      _isExporting = false;
      notifyListeners();
    }
  }

  /// Clear export messages
  void clearExportMessages() {
    _exportError = null;
    _exportSuccess = null;
    notifyListeners();
  }

  /// Clear all data
  void clearAll() {
    _monthlyReport = null;
    _yearlyReport = null;
    _monthlyReportError = null;
    _yearlyReportError = null;
    _exportError = null;
    _exportSuccess = null;
    notifyListeners();
  }

  @override
  void dispose() {
    _reportService.dispose();
    super.dispose();
  }
}
