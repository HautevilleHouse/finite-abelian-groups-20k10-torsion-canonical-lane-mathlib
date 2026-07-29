import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteAbelianGroups20k10TorsionCanonicalLaneLean

structure PrimaryDecompositionPackage (G : Type u) [AddCommGroup G] [Finite G] where
  pGroups : List (AddSubgroup G)
  isPrimary : ∀ H ∈ pGroups, IsPGroup (Nat.prime?) H
  directSumDecomposition : DirectSum (Subgroup.toAddCommGroup) ≃+ G
  decompositionUnique : Prop

structure PrimaryDecompositionEvidence {G : Type u} [AddCommGroup G] [Finite G]
    (P : PrimaryDecompositionPackage G) where
  isPrimaryClosed : ∀ H ∈ P.pGroups, P.isPrimary H
  directSumDecompositionClosed : P.directSumDecomposition
  decompositionUniqueClosed : P.decompositionUnique

def PrimaryDecompositionClosed {G : Type u} [AddCommGroup G] [Finite G]
    (P : PrimaryDecompositionPackage G) : Prop :=
  (∀ H ∈ P.pGroups, P.isPrimary H) ∧ P.directSumDecomposition ∧ P.decompositionUnique

theorem primary_decomposition_closed_from_evidence
    {G : Type u} [AddCommGroup G] [Finite G]
    (P : PrimaryDecompositionPackage G) (E : PrimaryDecompositionEvidence P) :
    PrimaryDecompositionClosed P := by
  exact And.intro E.isPrimaryClosed
    (And.intro E.directSumDecompositionClosed E.decompositionUniqueClosed)

end FiniteAbelianGroups20k10TorsionCanonicalLaneLean
end HautevilleHouse
