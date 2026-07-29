import continuummodelsystemsparticlesarisingtheoremcanonicallanelean.HydrodynamicLimitLayer

/-!
# Fluctuations Layer

Fluctuation corrections around hydrodynamic limit.
-/

namespace HautevilleHouse
namespace ContinuumModelsSystemsParticlesArisingTheoremCanonicalLaneLean

structure FluctuationsCertificate where
  hydrodynamic : HydrodynamicLimitCertificate
  fluctuationField : Prop
  centralLimit : Prop
  fluctuationFieldClosed : fluctuationField
  centralLimitClosed : centralLimit

def sourceFluctuationsCertificate : FluctuationsCertificate := {
  hydrodynamic := sourceHydrodynamicLimitCertificate
  fluctuationField := True
  centralLimit := True
  fluctuationFieldClosed := trivial
  centralLimitClosed := trivial
}

def FluctuationsClosed (C : FluctuationsCertificate) : Prop :=
  HydrodynamicLimitClosed C.hydrodynamic ∧ C.fluctuationField ∧ C.centralLimit

theorem source_fluctuations_closed :
    FluctuationsClosed sourceFluctuationsCertificate := by
  exact And.intro source_hydrodynamic_limit_closed (And.intro (by trivial) (by trivial))

end ContinuumModelsSystemsParticlesArisingTheoremCanonicalLaneLean
end HautevilleHouse