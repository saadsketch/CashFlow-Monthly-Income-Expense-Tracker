import 'package:flutter/material.dart';
import 'package:cash_flow/core/theme/colors.dart';

class CommonBackground extends StatelessWidget {
  final Widget child;
  final bool showTopPattern;
  final bool showBottomPattern;

  const CommonBackground({
    super.key,
    required this.child,
    this.showTopPattern = true,
    this.showBottomPattern = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primary.withOpacity(0.1),
            AppColors.lightBackground,
            AppColors.primaryVariant.withOpacity(0.05),
          ],
          stops: const [0.0, 0.5, 1.0],
        ),
      ),
      child: Stack(
        children: [
          // Top decorative pattern
          if (showTopPattern) ...[
            Positioned(
              top: -100,
              right: -100,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      AppColors.primary.withOpacity(0.1),
                      AppColors.primary.withOpacity(0.05),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 50,
              right: 20,
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.lightAccent.withOpacity(0.1),
                ),
              ),
            ),
          ],

          // Bottom decorative pattern
          if (showBottomPattern) ...[
            Positioned(
              bottom: -150,
              left: -150,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      AppColors.primaryVariant.withOpacity(0.1),
                      AppColors.primaryVariant.withOpacity(0.05),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 100,
              left: 30,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.primary.withOpacity(0.1),
                ),
              ),
            ),
          ],

          // Floating money icons
          Positioned(
            top: 120,
            left: 30,
            child: Transform.rotate(
              angle: 0.2,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.lightAccent.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.attach_money,
                  color: AppColors.lightAccent.withOpacity(0.6),
                  size: 24,
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 200,
            right: 40,
            child: Transform.rotate(
              angle: -0.3,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.trending_up,
                  color: AppColors.primary.withOpacity(0.6),
                  size: 20,
                ),
              ),
            ),
          ),

          // Main content
          child,
        ],
      ),
    );
  }
}
