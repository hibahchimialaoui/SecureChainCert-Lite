// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SecureChainCert {
    address public schoolAdmin;

    struct Certificate {
        string studentName;
        string major;
        string year;
        bool isReal;
    }

    // Association entre le Hash SHA-256 (bytes32) et les données du diplôme
    mapping(bytes32 => Certificate) private certificates;

    event CertificateAdded(bytes32 indexed certHash, string studentName, string major);

    modifier onlyAdmin() {
        require(msg.sender == schoolAdmin, "Erreur Cybersecurite : Acces refuse, adresse non autorisee !");
        _;
    }

    constructor() {
        schoolAdmin = msg.sender; // L'Account 1 devient l'Admin officiel au deploiement
    }

    // Fonction d'ecriture RESERVEE à l'ecole (Account 1)
    function addCertificate(
        bytes32 _certHash,
        string memory _studentName,
        string memory _major,
        string memory _year
    ) public onlyAdmin {
        require(!certificates[_certHash].isReal, "Ce certificat est deja enregistre dans le registre.");
        
        certificates[_certHash] = Certificate(_studentName, _major, _year, true);
        emit CertificateAdded(_certHash, _studentName, _major);
    }

    // Fonction de lecture PUBLIQUE et GRATUITE (Accessible par tous, meme le Pirate)
    function verifyCertificate(bytes32 _certHash) public view returns (string memory, string memory, string memory, bool) {
        Certificate memory cert = certificates[_certHash];
        return (cert.studentName, cert.major, cert.year, cert.isReal);
    }
}