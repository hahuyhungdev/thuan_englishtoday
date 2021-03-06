import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:Learn_English_Today/data/model/quote.dart';
import 'package:Learn_English_Today/data/repository/quote_repository.dart';
import 'package:share_plus/share_plus.dart';

part 'saved_quote_event.dart';

part 'saved_quote_state.dart';

///Bloc handles the events and states in [SavedQuotesScreen]
///Currently this Bloc only fetches all quotes from the local database
class SavedQuotesBloc extends Bloc<SavedQuoteEvent, SavedQuoteState> {
  QuoteRepository quoteRepository;

  SavedQuotesBloc({required this.quoteRepository}) : super(SavedQuoteInit());

  @override
  Stream<SavedQuoteState> mapEventToState(SavedQuoteEvent event) async* {
    if (event is CheckSavedQuotesCount) {
      yield* _mapCheckSavedQuotesCountToState();
    } else if (event is GetAllSavedQuotes) {
      yield* _mapGetAllSavedQuotesToState();
    } else if (event is ShareSavedQuote) {
      yield* _mapShareQuoteToState(event);
    } else if (event is DeleteAllSavedQuotes) {
      yield* _mapDeleteAllSavedQuotesToState();
    }
  }

  //Delete All Quotes
  Stream<SavedQuoteState> _mapCheckSavedQuotesCountToState() async* {
    var savedQuotes = await quoteRepository.getSavedQuotes();

    if (savedQuotes != null) {
      add(GetAllSavedQuotes());
    } else {
      yield NoSavedQuotes();
    }
  }

  Stream<SavedQuoteState> _mapGetAllSavedQuotesToState() async* {
    yield LoadingSavedQuotes();

    //Get Quote Response
    var savedQuotes = await quoteRepository.getSavedQuotes();

    yield SavedQuotesLoaded(savedQuotes);
  }

  //Share current quote
  Stream<SavedQuoteState> _mapShareQuoteToState(ShareSavedQuote event) async* {
    Share.share("\"${event.savedQuote.quote}\"\n - ${event.savedQuote.author}");
  }

  //Delete All Quotes
  Stream<SavedQuoteState> _mapDeleteAllSavedQuotesToState() async* {
    await quoteRepository.removeAllQuotes();
    yield NoSavedQuotes();
  }
}
