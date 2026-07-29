import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuumModelsSystemsParticlesArisingTheoremCanonicalLaneLean

structure AnalyticCertificate where
  pdeLayerClosed : Prop
  particleLayerClosed : Prop
  continuumLimitClosed : Prop
  pdeLayerClosedProof : pdeLayerClosed
  particleLayerClosedProof : particleLayerClosed
  continuumLimitClosedProof : continuumLimitClosed

def sourceAnalyticCertificate : AnalyticCertificate := {
  pdeLayerClosed := PDEClosed sourcePDEEnvelope
  particleLayerClosed := InteractionClosed sourceParticleInteractionCertificate
  continuumLimitClosed := ContinuumLimitClosed sourceContinuumLimitCertificate
  pdeLayerClosedProof := source_pde_closed
  particleLayerClosedProof := source_interaction_closed
  continuumLimitClosedProof := source_continuum_limit_closed
}

def AnalyticCertificateClosed (C : AnalyticCertificate) : Prop :=
  C.pdeLayerClosed ∧ C.particleLayerClosed ∧ C.continuumLimitClosed

theorem source_analytic_certificate_closed : AnalyticCertificateClosed sourceAnalyticCertificate :=
  And.intro sourceAnalyticCertificate.pdeLayerClosedProof
    (And.intro sourceAnalyticCertificate.particleLayerClosedProof sourceAnalyticCertificate.continuumLimitClosedProof)

end ContinuumModelsSystemsParticlesArisingTheoremCanonicalLaneLean
end HautevilleHouse