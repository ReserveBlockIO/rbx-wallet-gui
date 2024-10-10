
function _responseOutput(obj) {
    return JSON.stringify(obj, null);
}


function init() {

    const keypairService = new btc.KeypairService(false);
    const accountService = new btc.AccountService(false);
    const transactionService = new btc.TransactionService(false);

    // KEYPAIRS

    window.btcKeypairFromRandom = function () {
        const result = keypairService.keypairFromRandom();
        return _responseOutput(result);
    }

    window.btcKeypairFromWif = function (wif) {
        const result = keypairService.keypairFromWif(wif);
        return _responseOutput(result);
    }

    window.btcKeypairFromRandomMnemonic = function () {
        const result = keypairService.keypairFromRandomMnemonic();
        return _responseOutput(result);
    }

    window.btcKeypairFromMnemonic = function (mnemonic) {
        const result = keypairService.keypairFromMnemonic(mnemonic);
        return _responseOutput(result);
    }

    window.btcKeypairFromEmailPassword = function (email, password) {
        const result = keypairService.keypairFromEmailPassword(email, password);
        return _responseOutput(result);
    }


    window.btcSignMessage = function (wif, message) {
        const result = keypairService.signMessage(wif, message);
        return result;
    }


    // ACCOUNTS

    window.btcAddressInfo = async function (address) {
        const result = await accountService.addressInfo(address);
        return _responseOutput(result);
    }


    // TRANSACTIONS

    window.btcTransactions = async function (address, limit, before) {
        const result = await accountService.transactions(address, limit, before);
        return _responseOutput(result);
    }



    window.btcSendTransaction = async function (senderWif, senderAddress, amount, feeRate) {
        const createData = await transactionService.createTransaction(senderWif, senderAddress, amount, feeRate);
        if (!createData.success) {
            return _responseOutput(createData);
        }

        const broadcastData = await transactionService.broadcastTransaction(createData.result);
        return _responseOutput(broadcastData);
    }



}

init();