# CurrentCurrency

CurrentCurrency is a simple iOS app that allows you to calculate currency conversions based on real-time exchange rates. It uses the CurrencyAPI to fetch the latest exchange rates.

## Features

- Convert an amount from one currency to another.
- Automatically fetches the latest exchange rates from the CurrencyAPI.
- Supports a wide range of currencies.

## Requirements

- iOS 13.0+
- Xcode 11.0+
- Swift 5.0+

## Installation

1. Clone or download the repository.
2. Open the project in Xcode.
3. Build and run the app on a simulator or device.

## Usage

1. Launch the app on your iOS device.
2. Enter the amount you want to convert in the "Amount" text field.
3. Select the source currency from the "From" dropdown.
4. Select the target currency from the "To" dropdown.
5. Tap the "Calculate" button to perform the currency conversion.
6. The converted amount will be displayed in the "Result" label.

## API Key

This app uses the CurrencyAPI to fetch the latest exchange rates. To use the API, you need to obtain an API key from [CurrencyAPI](https://www.currencyapi.com/). Once you have the API key, replace the placeholder in the code (`cur_live_wlXfwWuhcWjdW84STfHawkDzS2M7NqA2JARriOZP`) with your actual API key in the `url` constant in `ViewController.swift` file.

## License

This project is licensed under the [MIT License](LICENSE).

## Acknowledgments

- CurrencyAPI for providing the currency exchange rate data.
