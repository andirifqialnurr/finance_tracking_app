import '../core/constants/api_endpoints.dart';
import '../models/report.dart';
import 'api_client.dart';

class ReportService {
  final ApiClient _apiClient;

  ReportService({ApiClient? apiClient}) : _apiClient = apiClient ?? ApiClient();

  /// Get monthly financial report
  ///
  /// [month] - Month (1-12)
  /// [year] - Year
  Future<MonthlyReport> getMonthlyReport({
    required int month,
    required int year,
  }) async {
    try {
      final queryParams = {'month': month.toString(), 'year': year.toString()};

      final response = await _apiClient.get(
        ApiEndpoints.getMonthlyReport,
        queryParams: queryParams,
      );

      return MonthlyReport.fromJson(response['data'] as Map<String, dynamic>);
    } catch (e) {
      throw ApiException('Failed to get monthly report: ${e.toString()}');
    }
  }

  /// Get yearly financial report
  ///
  /// [year] - Year
  Future<YearlyReport> getYearlyReport({required int year}) async {
    try {
      final queryParams = {'year': year.toString()};

      final response = await _apiClient.get(
        ApiEndpoints.getYearlyReport,
        queryParams: queryParams,
      );

      return YearlyReport.fromJson(response['data'] as Map<String, dynamic>);
    } catch (e) {
      throw ApiException('Failed to get yearly report: ${e.toString()}');
    }
  }

  /// Export monthly report as PDF
  ///
  /// [month] - Month (1-12)
  /// [year] - Year
  /// Returns the file path or URL where the PDF is saved
  Future<String> exportMonthlyReportPDF({
    required int month,
    required int year,
  }) async {
    try {
      final queryParams = {
        'month': month.toString(),
        'year': year.toString(),
        'format': 'pdf',
      };

      final response = await _apiClient.get(
        ApiEndpoints.exportMonthlyReport,
        queryParams: queryParams,
      );

      // Backend returns the file path or download URL
      return response['file_path'] as String? ??
          response['download_url'] as String? ??
          'monthly_report_${year}_${month.toString().padLeft(2, '0')}.pdf';
    } catch (e) {
      throw ApiException(
        'Failed to export monthly report as PDF: ${e.toString()}',
      );
    }
  }

  /// Export monthly report as Excel
  ///
  /// [month] - Month (1-12)
  /// [year] - Year
  /// Returns the file path or URL where the Excel file is saved
  Future<String> exportMonthlyReportExcel({
    required int month,
    required int year,
  }) async {
    try {
      final queryParams = {
        'month': month.toString(),
        'year': year.toString(),
        'format': 'excel',
      };

      final response = await _apiClient.get(
        ApiEndpoints.exportMonthlyReport,
        queryParams: queryParams,
      );

      return response['file_path'] as String? ??
          response['download_url'] as String? ??
          'monthly_report_${year}_${month.toString().padLeft(2, '0')}.xlsx';
    } catch (e) {
      throw ApiException(
        'Failed to export monthly report as Excel: ${e.toString()}',
      );
    }
  }

  /// Export yearly report as PDF
  ///
  /// [year] - Year
  /// Returns the file path or URL where the PDF is saved
  Future<String> exportYearlyReportPDF({required int year}) async {
    try {
      final queryParams = {'year': year.toString(), 'format': 'pdf'};

      final response = await _apiClient.get(
        ApiEndpoints.exportYearlyReport,
        queryParams: queryParams,
      );

      return response['file_path'] as String? ??
          response['download_url'] as String? ??
          'yearly_report_$year.pdf';
    } catch (e) {
      throw ApiException(
        'Failed to export yearly report as PDF: ${e.toString()}',
      );
    }
  }

  /// Export yearly report as Excel
  ///
  /// [year] - Year
  /// Returns the file path or URL where the Excel file is saved
  Future<String> exportYearlyReportExcel({required int year}) async {
    try {
      final queryParams = {'year': year.toString(), 'format': 'excel'};

      final response = await _apiClient.get(
        ApiEndpoints.exportYearlyReport,
        queryParams: queryParams,
      );

      return response['file_path'] as String? ??
          response['download_url'] as String? ??
          'yearly_report_$year.xlsx';
    } catch (e) {
      throw ApiException(
        'Failed to export yearly report as Excel: ${e.toString()}',
      );
    }
  }

  void dispose() {
    _apiClient.dispose();
  }
}
