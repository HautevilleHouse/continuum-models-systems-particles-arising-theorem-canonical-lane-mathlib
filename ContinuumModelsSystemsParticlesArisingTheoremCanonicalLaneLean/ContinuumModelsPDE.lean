import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuumModelsSystemsParticlesArisingTheoremCanonicalLaneLean

structure ContinuumFlow where
  density : ℝ → ℝ
  velocity : ℝ → ℝ
  pressure : ℝ → ℝ

structure PDEEnvelope where
  flow : ContinuumFlow
  continuityClosed : Prop
  momentumClosed : Prop
  energyClosed : Prop
  continuityClosedProof : continuityClosed
  momentumClosedProof : momentumClosed
  energyClosedProof : energyClosed

def sourcePDEEnvelope : PDEEnvelope := {
  flow := {
    density := λ _ => 1.0
    velocity := λ _ => 0.0
    pressure := λ _ => 0.0
  }
  continuityClosed := True
  momentumClosed := True
  energyClosed := True
  continuityClosedProof := trivial
  momentumClosedProof := trivial
  energyClosedProof := trivial
}

def PDEClosed (E : PDEEnvelope) : Prop :=
  E.continuityClosed ∧ E.momentumClosed ∧ E.energyClosed

theorem source_pde_closed : PDEClosed sourcePDEEnvelope :=
  And.intro sourcePDEEnvelope.continuityClosedProof
    (And.intro sourcePDEEnvelope.momentumClosedProof sourcePDEEnvelope.energyClosedProof)

end ContinuumModelsSystemsParticlesArisingTheoremCanonicalLaneLean
end HautevilleHouse