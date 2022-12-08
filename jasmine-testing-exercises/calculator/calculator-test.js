
it('should calculate the monthly rate correctly', function () {
  const values = {
    amount: 2500,
    years: 5,
    rate: 6.8
  };
  expect(calculateMonthlyPayment(values)).toEqual('49.27')
});


it("should return a result with 2 decimal places", function() {
  const values = {
    amount: 6000,
    years: 6000,
    rate: 1
  };
  expect(calculateMonthlyPayment(values)).toEqual('5.00')
});

