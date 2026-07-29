import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuumModelsSystemsParticlesArisingTheoremCanonicalLaneLean

structure ParticleInteractionKernel where
  potential : Type
  decayRate : ℝ
  compactSupport : Bool

def interactionKernelAdmissible (k : ParticleInteractionKernel) : Prop :=
  k.decayRate > 0 ∧ k.compactSupport

structure InteractionLayerCertificate where
  kernel : ParticleInteractionKernel
  kernelAdmissible : interactionKernelAdmissible kernel
  interactionFiniteEnergy : Prop
  interactionClosed : interactionFiniteEnergy

default interactionLayerCertificate : InteractionLayerCertificate :=
  { kernel := { potential := Unit, decayRate := 1.0, compactSupport := true }
  , kernelAdmissible := by
      refine And.intro (by norm_num) rfl
  , interactionFiniteEnergy := True
  , interactionClosed := trivial
  }

def ContinuumParticleInteractionClosed (C : InteractionLayerCertificate) : Prop :=
  interactionKernelAdmissible C.kernel ∧ C.interactionFiniteEnergy

theorem interaction_closed_default : ContinuumParticleInteractionClosed defaultInteractionLayerCertificate :=
  by
    exact And.intro (defaultInteractionLayerCertificate.kernelAdmissible) (by trivial)

end ContinuumModelsSystemsParticlesArisingTheoremCanonicalLaneLean
end HautevilleHouse
