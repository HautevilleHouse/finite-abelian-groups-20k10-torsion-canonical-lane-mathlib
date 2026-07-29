import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteAbelianGroups20k10TorsionCanonicalLaneLean

structure PrimaryDecompositionPackage (A : AdmissibleClass) where
  primePowerFactors : Prop
  cyclicComponents : Prop
  uniquenessOfDecomposition : Prop
  compatibilityWithTorsion : Prop

structure PrimaryDecompositionEvidence {A : AdmissibleClass} (P : PrimaryDecompositionPackage A) where
  primePowerFactorsClosed : P.primePowerFactors
  cyclicComponentsClosed : P.cyclicComponents
  uniquenessOfDecompositionClosed : P.uniquenessOfDecomposition
  compatibilityWithTorsionClosed : P.compatibilityWithTorsion

def PrimaryDecompositionClosed {A : AdmissibleClass} (P : PrimaryDecompositionPackage A) : Prop :=
  P.primePowerFactors ∧ P.cyclicComponents ∧ P.uniquenessOfDecomposition ∧ P.compatibilityWithTorsion

theorem primary_decomposition_closed_from_evidence
    {A : AdmissibleClass} (P : PrimaryDecompositionPackage A)
    (E : PrimaryDecompositionEvidence P) : PrimaryDecompositionClosed P := by
  exact And.intro E.primePowerFactorsClosed
    (And.intro E.cyclicComponentsClosed
      (And.intro E.uniquenessOfDecompositionClosed E.compatibilityWithTorsionClosed))

end FiniteAbelianGroups20k10TorsionCanonicalLaneLean
end HautevilleHouse
