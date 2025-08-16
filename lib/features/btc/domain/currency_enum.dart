enum Currency {
  usd(r'$'),
  gbp('£'),
  eur('€');

  final String symbol;

  const Currency(this.symbol);
}
