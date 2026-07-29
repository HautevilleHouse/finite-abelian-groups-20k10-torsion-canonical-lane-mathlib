import canonicalLaneMathlib.DualGroupPackage

namespace HautevilleHouse
namespace FiniteAbelianGroups20k10TorsionCanonicalLaneLean

structure DualGroupPackage where
  group : FiniteAbelianGroup
  dual : FiniteAbelianGroup
  pairingExists : Prop
  nondegenerate : Prop
  dualityIsIsomorphism : Prop

structure DualGroupEvidence (D : DualGroupPackage) where
  pairingExistsClosed : D.pairingExists
  nondegenerateClosed : D.nondegenerate
  dualityIsIsomorphismClosed : D.dualityIsIsomorphism

def DualGroupClosed (D : DualGroupPackage) : Prop :=
  D.pairingExists ∧ D.nondegenerate ∧ D.dualityIsIsomorphism

theorem dual_group_closed_from_evidence
    (D : DualGroupPackage) (E : DualGroupEvidence D) :
    DualGroupClosed D := by
  exact And.intro E.pairingExistsClosed
    (And.intro E.nondegenerateClosed E.dualityIsIsomorphismClosed)

end FiniteAbelianGroups20k10TorsionCanonicalLaneLean
end HautevilleHouse