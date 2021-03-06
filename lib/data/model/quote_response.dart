import 'package:Learn_English_Today/data/model/quote.dart';

/// Abstract Response class that contains a quote or error message
abstract class QuoteResponse {
  final Quote? newQuote;
  final String? message;

  QuoteResponse(this.newQuote, this.message);
}

// On Succes -> return only quote
class SuccesResponse extends QuoteResponse {
  SuccesResponse(Quote? newQuote) : super(newQuote, null);
}

// On Error -> return only an error message
class ErrorResponse extends QuoteResponse {
  ErrorResponse(String message) : super(null, message);
}
