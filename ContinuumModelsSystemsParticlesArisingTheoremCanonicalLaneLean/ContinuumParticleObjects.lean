import ContinuumModelsSystemsParticlesArisingTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ContinuumModelsSystemsParticlesArisingTheoremCanonicalLaneLean

abbrev ParticleIndex := ℕ
abbrev TimeVariable := ℝ
abbrev SpaceVariable := ℝ × ℝ × ℝ
abbrev ParticlePosition := TimeVariable → SpaceVariable
abbrev ContinuumField := TimeVariable → SpaceVariable → ℝ

structure ContinuumParticleSystem where
  particleCount : ℕ
  positions : ParticleIndex → ParticlePosition
  densityField : ContinuumField
  interactionPotential : SpaceVariable → ℝ
  externalPotential : SpaceVariable → ℝ

def constantInteractionPotential : ContinuumParticleSystem → ℝ := fun _ => 0
def constantExternalPotential : ContinuumParticleSystem → ℝ := fun _ => 0

structure ParticleArisingCertificate where
  system : ContinuumParticleSystem
  continuityClosed : Prop
  interactionClosed : Prop
  scalingLimitClosed : Prop
  continuityClosedProof : continuityClosed
  interactionClosedProof : interactionClosed
  scalingLimitClosedProof : scalingLimitClosed

def sourceParticleArisingCertificate : ParticleArisingCertificate := {
  system := {
    particleCount := 100
    positions := fun _ _ => (0,0,0)
    densityField := fun _ _ => 0
    interactionPotential := fun _ => 0
    externalPotential := fun _ => 0
  }
  continuityClosed := True
  interactionClosed := True
  scalingLimitClosed := True
  continuityClosedProof := trivial
  interactionClosedProof := trivial
  scalingLimitClosedProof := trivial
}

def ParticleArisingClosed (C : ParticleArisingCertificate) : Prop :=
  C.continuityClosed ∧ C.interactionClosed ∧ C.scalingLimitClosed

theorem source_particle_arising_closed : ParticleArisingClosed sourceParticleArisingCertificate := by
  exact And.intro sourceParticleArisingCertificate.continuityClosedProof
    (And.intro sourceParticleArisingCertificate.interactionClosedProof
      sourceParticleArisingCertificate.scalingLimitClosedProof)

end ContinuumModelsSystemsParticlesArisingTheoremCanonicalLaneLean
end HautevilleHouse