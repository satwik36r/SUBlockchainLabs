function last_block(n){

var newblock = web3.eth.blockNumber;

for (var i=0; i < n; i++) {

console.log(JSON.stringify(web3.eth.getBlock(newblock - i))); console.log("\n");

}

}

function get_latest_transcation(){

var newblock = web3.eth.blockNumber;

var present = 0;

while (web3.eth.getBlockTransactionCount(web3.eth.getBlock(newblock -present)['hash'])==0) {

var

complete_transactions

=

web3.eth.getBlockTransactionCount(web3.eth.getBlock(newblock-

present)['hash'])

console.log("Satwik Hosamani all trasncation "+complete_transactions);

for(var i=0;i<complete_transactions;i++){

console.log(JSON.stringify(web3.eth.getTransactionFromBlock(web3.eth.getBlock(ne wblock-

present)['hash'], i))); console.log("\n");

}

}