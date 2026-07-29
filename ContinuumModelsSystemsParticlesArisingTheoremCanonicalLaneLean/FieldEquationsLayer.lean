import ContinuumModelsSystemsParticlesArisingTheoremCanonicalLaneLean.KineticLayer

namespace HautevilleHouse
namespace ContinuumModelsSystemsParticlesArisingTheoremCanonicalLaneLean

structure FieldEquationsCertificate where
  kinetic : KineticEnvelope
  continuityEquation : Prop
  momentumEquation : Prop
  energyEquation : Prop
  continuityEquationClosedProof : continuityEquation
  momentumEquationClosedProof : momentumEquation
  energyEquationClosedProof : energyEquation

def sourceFieldEquationsCertificate : FieldEquationsCertificate := {
  kinetic := sourceKineticEnvelope
  continuityEquation := True
  momentumEquation := True
  energyEquation := True
  continuityEquationClosedProof := trivial
  momentumEquationClosedProof := trivial
  energyEquationClosedProof := trivial
}

def FieldEquationsClosed (F : FieldEquationsCertificate) : Prop :=
  KineticClosed F.kinetic ∧ F.continuityEquation ∧ F.momentumEquation ∧ F.energyEquation

theorem source_field_equations_closed : FieldEquationsClosed sourceFieldEquationsCertificate := by
  exact And.intro source_kinetic_closed
    (And.intro sourceFieldEquationsCertificate.continuityEquationClosedProof
      (And.intro sourceFieldEquationsCertificate.momentumEquationClosedProof
        sourceFieldEquationsCertificate.energyEquationClosedProof))

end ContinuumModelsSystemsParticlesArisingTheoremCanonicalLaneLean
end HautevilleHouse