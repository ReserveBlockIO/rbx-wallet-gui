import 'package:flutter/material.dart';
import 'package:rbx_wallet/core/dialogs.dart';

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
}

class HelpButton extends StatelessWidget {
  final HelpType type;
  final bool subtle;
  final Color? color;
  const HelpButton(this.type, {Key? key, this.subtle = false, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      icon: Icon(
        Icons.help,
        color: color != null
            ? color!
            : Theme.of(context)
                .colorScheme
                .secondary
                .withOpacity(subtle ? 0.7 : 1),
        size: subtle ? 16 : 22,
      ),
      onPressed: () {
        InfoDialog.show(
            title: _title,
            body: _body,
            closeText: _closeText,
            icon: Icons.help,
            headerColor: Theme.of(context).colorScheme.secondary);
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
        return "Baseline Properties";
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
    }
  }

  String get _body {
    switch (type) {
      case HelpType.unknown:
        return "Not implemented.";
      case HelpType.smartContractName:
        return "Name your smart contract. This field is required and is publicly visible.";
      case HelpType.ownerAddress:
        return "This should be the wallet address that will be used to compile and mint the smart contract.";
      case HelpType.description:
        return "Provide a text-based description of your smart contract/NFT. This field is required and will be publicly visible.";
      case HelpType.baselineProperties:
        return "Fill out the baseline info required by all smart contracts. Choose a name, the minter's name (optional), and the wallet you want to use. Then, give your smart contract/NFT a detailed description.";
      case HelpType.minterName:
        return "This field is optional but will be displayed publicly if set. This can be your name/persona, or just leave it blank.";
      case HelpType.primaryAsset:
        return "This is the primary file asset contained in the smart contract/NFT. It can be an image, audio, video or any file.";
      case HelpType.features:
        return "Add a feature to your smart contract such as royalties or evolving functionality.";
      case HelpType.royaltyPercent:
        return "Type in the percent that will be paid to the address provided and is enforced on-chain upon any trade. This fee is remitted to the royalty holder upon transaction finality.";
      case HelpType.royaltyFlat:
        return "Type in the amount of RBX that will be paid to the address provided and is enforced on-chain upon any trade. This fee is remitted to the royalty holder upon transaction finality.";
      case HelpType.royaltyAddress:
        return "Provide the RBX public address that the royalty will be paid to upon transaction finality.";
      case HelpType.evolveMode:
        return "You decide how the evolution will be controlled.\n\nIssuer/Minter Controlled: The minter will be able to evolve/devolve the smart contract at any point.\n\nAutomated/Application Controlled: Automatically evolves based on time/date, on-chain variables, and/or application induced variables.";
      case HelpType.evolveType:
        return "Choose the variable type that can dynamically affect the evolution state.\n\nDate/Time: The smart contract will automatically evolve at a certain point of time.\n\nBlock Height: The smart contract will evolve when the chain reaches a particular block height.\n\nManual Only: The smart contract will not evolve unless manually told to by the issuer or user/application (depending on which mode is selected).";
      case HelpType.evolveBlockHeight:
        return "The smart contract will evolve when the RBX chain reaches this block height.";
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
        return "Transfer this NFT to another wallet.";
    }
  }

  String get _closeText {
    return "Close";
    final list = [
      'Thanks!',
      'Close',
      "Alright",
      "Cheers!",
      "Ok",
      "Okay",
    ];
    return (list..shuffle()).first;
  }
}
