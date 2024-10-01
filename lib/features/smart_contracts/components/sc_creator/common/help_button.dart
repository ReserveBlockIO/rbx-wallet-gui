import 'package:flutter/material.dart';

import '../../../../../core/app_constants.dart';
import '../../../../../core/dialogs.dart';

enum HelpType {
  unknown,
  baselineProperties,
  smartContractName,
  description,
  minterName,
  ownerAddress,
  primaryAsset,
  features,
  royaltyPercent,
  royaltyFlat,
  royaltyAddress,
  evolveMode,
  evolveType,
  evolveDatetime,
  evolveBlockHeight,
  evolveStageName,
  evolveAsset,
  evolveStageDescription,
  smartContract,
  saveAsDraft,
  compile,
  mint,
  delete,
  burn,
  transfer,
  minting,
  setEvolution,
  manageProperties,
  configuration,
  apiPort,
  apiCallUrl,
  walletUnlockTime,
  nftTimeout,
  passwordClearTime,
  autoDownloadNftAsset,
  ignoreIncomingNfts,
  rejectAssetExtensionTypes,
  allowedAssetExtensionTypes,
  motherAddress,
  motherPassword,
  mintQuantity,
  properties,
  propertyTyes,
}

class HelpButton extends StatelessWidget {
  final HelpType type;
  final bool subtle;
  final Color? color;
  final bool mini;
  const HelpButton(
    this.type, {
    Key? key,
    this.subtle = false,
    this.color,
    this.mini = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      constraints: mini ? const BoxConstraints() : null,
      visualDensity: mini ? VisualDensity.compact : VisualDensity.standard,
      icon: Icon(
        Icons.help,
        color: color != null ? color! : Theme.of(context).colorScheme.secondary.withOpacity(subtle ? 0.7 : 1),
        size: subtle ? 16 : 22,
      ),
      onPressed: () {
        InfoDialog.show(title: _title, body: _body, closeText: "Close", icon: Icons.help, headerColor: Theme.of(context).colorScheme.secondary);
      },
    );
  }

  String get _title {
    switch (type) {
      case HelpType.unknown:
        return "Not implemented";
      case HelpType.smartContractName:
        return "Smart Contract Name";
      case HelpType.description:
        return "Description";
      case HelpType.ownerAddress:
        return "Owner Address";
      case HelpType.baselineProperties:
        return "Properties";
      case HelpType.minterName:
        return "Minter Name";
      case HelpType.primaryAsset:
        return "Primary Asset";
      case HelpType.features:
        return "Features";
      case HelpType.royaltyPercent:
        return "Royalty Percentage Fee Amount";
      case HelpType.royaltyFlat:
        return "Royalty Flat Fee Amount";
      case HelpType.royaltyAddress:
        return "Payee Address";

      case HelpType.evolveMode:
        return "Evolution Mode";
      case HelpType.evolveType:
        return "Evolution Type";
      case HelpType.evolveDatetime:
        return "Date/Time Variable";
      case HelpType.evolveBlockHeight:
        return "Block Height Variable";
      case HelpType.evolveStageName:
        return "Evolve Stage Name";
      case HelpType.evolveStageDescription:
        return "Evolve Stage Description";
      case HelpType.evolveAsset:
        return "Evolve Stage Asset";
      case HelpType.smartContract:
        return "Smart Contract";
      case HelpType.saveAsDraft:
        return "Save as Draft";
      case HelpType.compile:
        return "Compile";
      case HelpType.mint:
        return "Mint";
      case HelpType.delete:
        return "Delete";
      case HelpType.burn:
        return "Burn NFT";
      case HelpType.transfer:
        return "Transfer NFT";
      case HelpType.minting:
        return "Minting";
      case HelpType.setEvolution:
        return "Set Evolution";
      case HelpType.manageProperties:
        return "Properties";

      case HelpType.configuration:
        return "Configuration";
      case HelpType.apiPort:
        return "Api Port";
      case HelpType.apiCallUrl:
        return "Api Call Url";
      case HelpType.walletUnlockTime:
        return "Account Unlock Time";
      case HelpType.nftTimeout:
        return "Nft Timeout";
      case HelpType.passwordClearTime:
        return "Password Clear Time";
      case HelpType.autoDownloadNftAsset:
        return "Auto Download NFT Asset";
      case HelpType.ignoreIncomingNfts:
        return "Ignore Incoming NFTs";
      case HelpType.rejectAssetExtensionTypes:
        return "Reject Asset Extension Types";
      case HelpType.allowedAssetExtensionTypes:
        return "Allowed Asset Extension Types";
      case HelpType.motherAddress:
        return "Mother Address";
      case HelpType.motherPassword:
        return "Mother Password";
      case HelpType.mintQuantity:
        return "Quantity to Mint";
      case HelpType.properties:
        return "Properties";
      case HelpType.propertyTyes:
        return "Property Types";
    }
  }

  String get _body {
    switch (type) {
      case HelpType.unknown:
        return "Not implemented.";
      case HelpType.smartContractName:
        return "Name your smart contract. This field is required and is publicly visible.";
      case HelpType.ownerAddress:
        return "This should be the account address that will be used to compile and mint the smart contract.";
      case HelpType.description:
        return "Provide a text-based description of your smart contract/NFT. This field is required and will be publicly visible.";
      case HelpType.baselineProperties:
        return "Fill out the baseline info required by all smart contracts. Choose a name, the minter's name (optional), and the account you want to use. Then, give your smart contract/NFT a detailed description.";
      case HelpType.minterName:
        return "This field is optional but will be displayed publicly if set. This can be your name/persona, or just leave it blank.";
      case HelpType.primaryAsset:
        return "This is the primary file asset contained in the smart contract/NFT. It can be an image, audio, video or any file.";
      case HelpType.features:
        return "Add a feature to your smart contract such as royalties or evolving functionality.";
      case HelpType.royaltyPercent:
        return "Type in the percent that will be paid to the address provided and is enforced on-chain upon any trade. This fee is remitted to the royalty holder upon transaction finality.";
      case HelpType.royaltyFlat:
        return "Type in the amount of VFX that will be paid to the address provided and is enforced on-chain upon any trade. This fee is remitted to the royalty holder upon transaction finality.";
      case HelpType.royaltyAddress:
        return "Provide the VFX public address that the royalty will be paid to upon transaction finality.";
      case HelpType.evolveMode:
        return "You decide how the evolution will be controlled.\n\nIssuer/Minter Controlled: The minter will be able to evolve/devolve the smart contract at any point.\n\nAutomated/Application Controlled: Automatically evolves based on time/date, on-chain variables, and/or application induced variables.";
      case HelpType.evolveType:
        return "Choose the variable type that can dynamically affect the evolution state.\n\nDate/Time: The smart contract will automatically evolve at a certain point of time.\n\nBlock Height: The smart contract will evolve when the chain reaches a particular block height.\n\nManual Only: The smart contract will not evolve unless manually told to by the issuer or user/application (depending on which mode is selected).";
      case HelpType.evolveBlockHeight:
        return "The smart contract will evolve when the VFX chain reaches this block height.";
      case HelpType.evolveStageName:
        return "Provide a name for this evolution stage.";
      case HelpType.evolveStageDescription:
        return "Provide a description for this evolution stage.";
      case HelpType.evolveAsset:
        return "Overide the asset when the smart contract evolves to this stage. This field is optional.";
      case HelpType.evolveDatetime:
        return "The date and time the smart contract will evolve (UTC).";
      case HelpType.smartContract:
        return "Configure the parameters of your smart contract then compile and mint it.";
      case HelpType.saveAsDraft:
        return "Save your smart contract as a draft locally to come back and work on it later.";
      case HelpType.compile:
        return "Compile the Trilliam code based on the parameters you've configured and then mint when ready.";
      case HelpType.mint:
        return "Mint and deploy the smart contract to the chain.";
      case HelpType.delete:
        return "Delete your smart contract";
      case HelpType.burn:
        return "Burn (destroy) this NFT permanently.";
      case HelpType.transfer:
        return "Transfer this NFT to another account.";
      case HelpType.minting:
        return "This action occurs after you have successfully compiled and minted but requires the transaction to be authenticated by the network which takes approximately 30 seconds for finality as well as your wallet to be synced with the block that includes this transaction.";
      case HelpType.setEvolution:
        return "With an NFT that has more than 2 phases the user can go directly from one stage to another with the “Set Evolution” button instead of evolving and devolving stage by stage";
      case HelpType.manageProperties:
        return "Create label & value pairs.\nFor example:\n\nLabel: Color\nValue: Blue";

      case HelpType.configuration:
        return "This values will modify the config.txt file located in the CLIs database, for this changes to take effect the CLI needs to be restarted";
      case HelpType.apiPort:
        return "This is the port to call the API. This may be changed to whatever you want. \n\nDefault value: 7292";
      case HelpType.apiCallUrl:
        return "This URL is used to send incoming transactions to an outside URL. This is something used for like incoming deposits or other notification. services. \n\nDefault value: null";
      case HelpType.walletUnlockTime:
        return "This is the amount of time once a password has been entered the wallet will remain unlocked and not need password again \n\nDefault value: 15";
      case HelpType.nftTimeout:
        return "This will control the timeout for processing an incoming NFT \n\nDefault value: 15";
      case HelpType.passwordClearTime:
        return "This will control the clear time for an ecrypted wallets password \n\nDefault value: 10";
      case HelpType.autoDownloadNftAsset:
        return "This will control whether or not an NFT's asset is automatically downloaded \n\nDefault value: true";
      case HelpType.ignoreIncomingNfts:
        return "This will control whether or not incoming NFTs are processed or just added as a TX record \n\nDefault value: false";
      case HelpType.rejectAssetExtensionTypes:
        return "This will add extension types to the already defined list and will reject any NFT assets with these known extension types \nEx: exe,zip,pdf... (ensure there are no spaces between types) \n\nDefault value: (leave blank)\n\nIf left blank, this is the default:\n${DEFAULT_REJECTED_EXTENIONS.join(',')}";
      case HelpType.allowedAssetExtensionTypes:
        return "This will remove extension types to the already defined list and will allow any NFT assets with these known extension types to be downloaded \nEx: pdf,doc,xls \n\nDefault value: (leave blank)";
      case HelpType.motherAddress:
        return "The IP address of the HOST wallet. \n\n Default value: (leave blank)";
      case HelpType.motherPassword:
        return "The password set in your HOST wallet when configuring MOTHER.\n\n Default value: (leave blank)";
      case HelpType.mintQuantity:
        return "The number of Smart Contracts / NFTs you want to mint from this template.";
      case HelpType.properties:
        return "Define and assign values to assets in your smart contract. This can be a rare trait as an example.";
      case HelpType.propertyTyes:
        return "Define the kind of value that your property will have \nThis types are: \n- Text: alphanumeric value \n- Number: numerical value \n- Color: Hexadecimal value of a color of your choice";
    }
  }
}
