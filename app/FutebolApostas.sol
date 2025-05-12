// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FutebolApostas {
    struct ResultadoRodada {
        address tokenVencedor;
        address carteiraDestino;
        uint256 recompensa;
    }

    mapping(uint256 => ResultadoRodada) public resultados;

    event RecompensaEnviada(uint256 rodada, address token, address wallet, uint256 recompensa);

    function setRoundResult(
        uint256 rodada,
        address token,
        address wallet,
        uint256 recompensa
    ) public {
        resultados[rodada] = ResultadoRodada(token, wallet, recompensa);
        emit RecompensaEnviada(rodada, token, wallet, recompensa);
    }

    function getRoundResult(uint256 rodada) public view returns (address, address, uint256) {
        ResultadoRodada memory resultado = resultados[rodada];
        return (resultado.tokenVencedor, resultado.carteiraDestino, resultado.recompensa);
    }
}
