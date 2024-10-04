import { ethers } from "hardhat";

async function main() {
  // On récupère le contrat ExerciseSolution
  const ExerciseSolution = await ethers.getContractFactory("ExerciseSolution");

  // On déploie le contrat
  const exerciseSolution = await ExerciseSolution.deploy();

  // Attendre que la transaction de déploiement soit minée
  await exerciseSolution.deployTransaction.wait();

  // Affiche l'adresse du contrat déployé
  console.log("ExerciseSolution deployed to:", exerciseSolution.address);
}

// On capture les erreurs éventuelles lors du déploiement
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});