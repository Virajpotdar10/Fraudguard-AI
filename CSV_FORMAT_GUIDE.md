# CSV Format Guide for Fraud Detection Batch Processing

## Required CSV Format

The CSV file must contain the following columns in this exact order:

### Column Headers (First Row)
```
transactionAmount,transactionAmountDeviation,timeAnomaly,locationDistance,merchantNovelty,transactionFrequency
```

### Column Descriptions

| Column Name | Type | Description | Example Values |
|------------|------|-------------|----------------|
| `transactionAmount` | Number (decimal) | The transaction amount | 150.50, 2500.00, 6200.00 |
| `transactionAmountDeviation` | Number (decimal) | Amount deviation from normal spending patterns (0.0 to 1.0+) | 0.15, 0.65, 0.35 |
| `timeAnomaly` | Number (decimal) | Time anomaly score (0.0 to 1.0) | 0.2, 0.85, 0.0 |
| `locationDistance` | Number (decimal) | Distance from usual location in kilometers | 5.0, 45.0, 28.0 |
| `merchantNovelty` | Number (decimal) | Merchant novelty score (0.0 to 1.0) | 0.1, 0.9, 1.0 |
| `transactionFrequency` | Number (decimal/integer) | Transaction frequency count | 8, 2, 6 |

### Important Notes

1. **Header Row**: The first row must contain the column headers exactly as shown above
2. **Data Types**: All values must be numeric (decimal numbers)
3. **Order**: Columns must be in the exact order listed above
4. **Separator**: Use comma (`,`) as the field separator
5. **No Spaces**: Avoid spaces around column names in the header row

### Example CSV Content

```csv
transactionAmount,transactionAmountDeviation,timeAnomaly,locationDistance,merchantNovelty,transactionFrequency
150.50,0.15,0.2,5.0,0.1,8
2500.00,0.65,0.85,45.0,0.9,2
75.25,0.10,0.1,3.0,0.05,12
6200.00,0.35,0.0,28.0,1.0,6
```

### Sample Data Ranges

**Legitimate Transactions (Low Risk):**
- transactionAmount: 50-500
- transactionAmountDeviation: 0.0-0.3
- timeAnomaly: 0.0-0.3
- locationDistance: 0-15 km
- merchantNovelty: 0.0-0.3
- transactionFrequency: 5-20

**Fraudulent Transactions (High Risk):**
- transactionAmount: 2000-10000+
- transactionAmountDeviation: 0.5-1.0+
- timeAnomaly: 0.6-1.0
- locationDistance: 30-100+ km
- merchantNovelty: 0.7-1.0
- transactionFrequency: 1-3

### Example Test CSV Files

1. **sample_transactions.csv** - Contains mixed legitimate and fraudulent transactions
2. You can create your own CSV file using Excel, Google Sheets, or any text editor

### How to Use

1. Create a CSV file following the format above
2. In the Fraud Detection app, click "Upload CSV / Excel"
3. Select your CSV file
4. The app will automatically process all transactions and display results

### Common Errors to Avoid

❌ Missing header row
❌ Wrong column order
❌ Non-numeric values
❌ Empty rows in the middle of data
❌ Missing commas or extra spaces
❌ Special characters in numeric fields

✅ Include header row
✅ Use exact column names
✅ All values are numbers
✅ One row per transaction
✅ Clean formatting
✅ Only numeric data in value columns


