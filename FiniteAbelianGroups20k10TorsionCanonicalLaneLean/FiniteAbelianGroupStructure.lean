import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteAbelianGroups20k10TorsionCanonicalLaneLean

structure FiniteAbelianGroup (A : Type u) where
  carrier : AddCommGroup A
  finite : Fintype A

structure TorsionSubgroupStructure (A : Type u) [AddCommGroup A] where
  torsionSubgroup : AddSubgroup A
  everyElementTorsion : ∀ x : A, x ∈ torsionSubgroup
  exponent : ℕ
  exponentAnnihilates : exponent • (1 : A) = 0
  exponentMinimal : ∀ n : ℕ, n • (1 : A) = 0 → exponent ∣ n

structure PrimaryDecomposition (A : Type u) [AddCommGroup A] (p : ℕ) where
  pPrimaryComponent : AddSubgroup A
  isPGroup : ∀ x : pPrimaryComponent, ∃ k : ℕ, p ^ k • x = 0
  complement : AddSubgroup A
  directSumDecomposition : A ≃+ pPrimaryComponent × complement

theorem primary_decomposition_unique (A : Type u) [AddCommGroup A] [Fintype A] (p : ℕ) (D1 D2 : PrimaryDecomposition A p) : D1.pPrimaryComponent = D2.pPrimaryComponent := by
  let f : A ≃+ D1.pPrimaryComponent × D1.complement := D1.directSumDecomposition
  let g : A ≃+ D2.pPrimaryComponent × D2.complement := D2.directSumDecomposition
  have h1 : ∀ x : A, x ∈ D1.pPrimaryComponent := by
    intro x
    have : (f x).1 ∈ D1.pPrimaryComponent := by
      simp
    simpa using this
  have h2 : ∀ x : A, x ∈ D2.pPrimaryComponent := by
    intro x
    have : (g x).1 ∈ D2.pPrimaryComponent := by
      simp
    simpa using this
  have : D1.pPrimaryComponent = D2.pPrimaryComponent := by
    apply SetLike.ext
    intro x
    constructor
    · intro hx
      have hx' : x ∈ D1.pPrimaryComponent := hx
      have : x ∈ D2.pPrimaryComponent := by
        apply h2
      exact this
    · intro hx
      have hx' : x ∈ D2.pPrimaryComponent := hx
      have : x ∈ D1.pPrimaryComponent := by
        apply h1
      exact this
  exact this

end FiniteAbelianGroups20k10TorsionCanonicalLaneLean
end HautevilleHouse