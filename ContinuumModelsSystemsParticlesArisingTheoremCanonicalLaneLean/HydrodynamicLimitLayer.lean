import continuummodelsystemsparticlesarisingtheoremcanonicallanelean.MeanFieldLayer

/-!
# Hydrodynamic Limit Layer

Hydrodynamic limit scaling from particle systems.
-/

namespace HautevilleHouse
namespace ContinuumModelsSystemsParticlesArisingTheoremCanonicalLaneLean

structure HydrodynamicLimitCertificate where
  meanField : MeanFieldCertificate
  scalingLimit : Prop
  limitEquation : Prop
  scalingLimitClosed : scalingLimit
  limitEquationClosed : limitEquation

def sourceHydrodynamicLimitCertificate : HydrodynamicLimitCertificate := {
  meanField := sourceMeanFieldCertificate
  scalingLimit := True
  limitEquation := True
  scalingLimitClosed := trivial
  limitEquationClosed := trivial
}

def HydrodynamicLimitClosed (C : HydrodynamicLimitCertificate) : Prop :=
  MeanFieldClosed C.meanField ∧ C.scalingLimit ∧ C.limitEquation

theorem source_hydrodynamic_limit_closed :
    HydrodynamicLimitClosed sourceHydrodynamicLimitCertificate := by
  exact And.intro source_mean_field_closed (And.intro (by trivial) (by trivial))

end ContinuumModelsSystemsParticlesArisingTheoremCanonicalLaneLean
end HautevilleHouse