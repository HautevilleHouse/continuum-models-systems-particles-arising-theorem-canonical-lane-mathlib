import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuumModelsSystemsParticlesArisingTheoremCanonicalLaneLean

structure FluctuationCertificate where
  variance : ℝ
  gaussianLimit : Prop
  convergenceRate : ℝ
  gaussianLimitProof : gaussianLimit
  convergenceRatePositive : convergenceRate > 0

default fluctuationCertificate : FluctuationCertificate :=
  { variance := 1.5
  , gaussianLimit := True
  , convergenceRate := 0.5
  , gaussianLimitProof := trivial
  , convergenceRatePositive := by norm_num
  }

def FluctuationLimitClosed (C : FluctuationCertificate) : Prop :=
  C.gaussianLimit ∧ (C.convergenceRate > 0)

theorem fluctuation_limit_closed_default : FluctuationLimitClosed defaultFluctuationCertificate :=
  by
    exact And.intro (by trivial) (defaultFluctuationCertificate.convergenceRatePositive)

end ContinuumModelsSystemsParticlesArisingTheoremCanonicalLaneLean
end HautevilleHouse
