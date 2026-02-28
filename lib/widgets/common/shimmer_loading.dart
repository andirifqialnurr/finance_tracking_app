import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';

/// A shimmer placeholder for a list of cards.
///
/// Usage:
/// ```dart
/// loading: () => const ShimmerList(),
/// ```
class ShimmerList extends StatelessWidget {
  const ShimmerList({
    super.key,
    this.itemCount = 5,
    this.itemHeight = 80.0,
    this.padding,
  });

  final int itemCount;
  final double itemHeight;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.cardDisabled,
      highlightColor: AppColors.surface,
      child: ListView.builder(
        padding: padding ?? AppDimensions.screenPadding,
        itemCount: itemCount,
        itemBuilder: (_, __) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Container(
            height: itemHeight,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );
  }
}

/// A shimmer placeholder for a single card (used inside custom layouts).
class ShimmerCard extends StatelessWidget {
  const ShimmerCard({
    super.key,
    this.height = 80.0,
    this.width = double.infinity,
    this.borderRadius = 12.0,
    this.margin,
  });

  final double height;
  final double width;
  final double borderRadius;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.cardDisabled,
      highlightColor: AppColors.surface,
      child: Container(
        height: height,
        width: width,
        margin: margin ?? const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}

/// A shimmer for the detail/stats grid layout (e.g. AccountDetail).
class ShimmerGrid extends StatelessWidget {
  const ShimmerGrid({
    super.key,
    this.rows = 2,
    this.columns = 2,
    this.cellHeight = 80.0,
  });

  final int rows;
  final int columns;
  final double cellHeight;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.cardDisabled,
      highlightColor: AppColors.surface,
      child: Padding(
        padding: AppDimensions.screenPadding,
        child: Column(
          children: List.generate(rows, (row) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: List.generate(columns, (col) {
                  return Expanded(
                    child: Container(
                      height: cellHeight,
                      margin: EdgeInsets.only(
                        right: col < columns - 1 ? 12 : 0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  );
                }),
              ),
            );
          }),
        ),
      ),
    );
  }
}
