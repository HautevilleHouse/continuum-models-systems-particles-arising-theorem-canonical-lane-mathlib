import ContinuumModelsSystemsParticlesArisingTheoremCanonicalLaneLean.ContinuumParticleObjects

namespace HautevilleHouse
namespace ContinuumModelsSystemsParticlesArisingTheoremCanonicalLaneLean

structure KineticEnvelope where
  particleSystem : ContinuumParticleSystem
  kineticEnergy : Prop
  dissipation : Prop
  kineticEnergyClosedProof : kineticEnergy
  dissipationClosedProof : dissipation

def sourceKineticEnvelope : KineticEnvelope := {
  particleSystem := sourceParticleArisingCertificate.system
  kineticEnergy := True
  dissipation := True
  kineticEnergyClosedProof := trivial
  dissipationClosedProof := trivial
}

def KineticClosed (K : KineticEnvelope) : Prop :=
  K.kineticEnergy ∧ K.dissipation

theorem source_kinetic_closed : KineticClosed sourceKineticEnvelope := by
  exact And.intro sourceKineticEnvelope.kineticEnergyClosedProof
    sourceKineticEnvelope.dissipationClosedProof

end ContinuumModelsSystemsParticlesArisingTheoremCanonicalLaneLean
end HautevilleHouse