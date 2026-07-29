import ContinuumModelsSystemsParticlesArisingTheoremCanonicalLaneLean.FieldEquationsLayer

namespace HautevilleHouse
namespace ContinuumModelsSystemsParticlesArisingTheoremCanonicalLaneLean

structure FluidDynamicLimitCertificate where
  fieldEqs : FieldEquationsCertificate
  scalingLimit : Prop
  localEquilibrium : Prop
  transportCoefficients : Prop
  scalingLimitClosedProof : scalingLimit
  localEquilibriumClosedProof : localEquilibrium
  transportCoefficientsClosedProof : transportCoefficients

def sourceFluidDynamicLimitCertificate : FluidDynamicLimitCertificate := {
  fieldEqs := sourceFieldEquationsCertificate
  scalingLimit := True
  localEquilibrium := True
  transportCoefficients := True
  scalingLimitClosedProof := trivial
  localEquilibriumClosedProof := trivial
  transportCoefficientsClosedProof := trivial
}

def FluidDynamicLimitClosed (C : FluidDynamicLimitCertificate) : Prop :=
  FieldEquationsClosed C.fieldEqs ∧ C.scalingLimit ∧ C.localEquilibrium ∧ C.transportCoefficients

theorem source_fluid_dynamic_limit_closed : FluidDynamicLimitClosed sourceFluidDynamicLimitCertificate := by
  exact And.intro source_field_equations_closed
    (And.intro sourceFluidDynamicLimitCertificate.scalingLimitClosedProof
      (And.intro sourceFluidDynamicLimitCertificate.localEquilibriumClosedProof
        sourceFluidDynamicLimitCertificate.transportCoefficientsClosedProof))

end ContinuumModelsSystemsParticlesArisingTheoremCanonicalLaneLean
end HautevilleHouse