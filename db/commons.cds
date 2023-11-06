namespace anubhav.common;
using { Currency } from '@sap/cds/common';


type Gender : String(1) enum{
    male = 'M';
    female = 'F';
    undisclosed = 'U';
};

type AmountT : Decimal(10,2)@(
    Semantics.amount.currencyCode: 'CURRENCY_CODE',
    sap.unit:'CURRENCY_CODE'
);

aspect Amount: {
    CURRENCY: Currency;
    @title : '{i18n>GrossAmount}'
    GROSS_AMOUNT: AmountT;
    NET_AMOUNT: AmountT @(title : '{i18n>NetAmount}');
    TAX_AMOUNT: AmountT @(title : '{i18n>TaxAmount}');
}


type Guid: String(32);
type PhoneNumber: String(30);
type Email: String(255)@assert.format : '^[\w\.-]+@[a-zA-Z\d\.-]+\.[a-zA-Z]{2,}$';