import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteAbelianGroups20k10TorsionCanonicalLaneLean

structure TorsionFreeRank (A : Type u) [AddCommGroup A] where
  rank : ℕ
  basis : Fin rank → A
  independent : LinearIndependent ℤ basis
  spanning : Submodule.span ℤ (Set.range basis) = ⊤

theorem rank_well_defined (A : Type u) [AddCommGroup A] [Fintype A] (r1 r2 : TorsionFreeRank A) : r1.rank = r2.rank := by
  have h1 : Submodule.span ℤ (Set.range r1.basis) = ⊤ := r1.spanning
  have h2 : Submodule.span ℤ (Set.range r2.basis) = ⊤ := r2.spanning
  have card_eq : Fintype.card (Submodule.span ℤ (Set.range r1.basis)) = Fintype.card (Submodule.span ℤ (Set.range r2.basis)) := by
    simp [h1, h2]
  have h_ind1 : LinearIndependent ℤ r1.basis := r1.independent
  have h_ind2 : LinearIndependent ℤ r2.basis := r2.independent
  have card_span_eq_rank1 : Fintype.card (Submodule.span ℤ (Set.range r1.basis)) = r1.rank := by
    have h_iso : Submodule.span ℤ (Set.range r1.basis) ≃ₗ[ℤ] ℤ ^ r1.rank := by
      have h_basis : Basis (Fin r1.rank) ℤ (Submodule.span ℤ (Set.range r1.basis)) :=
        Submodule.basisOfTopSpan ℤ (Set.range r1.basis) r1.independent r1.spanning
      exact h_basis.repr.symm
    have card_iso : Fintype.card (Submodule.span ℤ (Set.range r1.basis)) = Fintype.card (ℤ ^ r1.rank) :=
      Fintype.card_congr h_iso.toEquiv
    calc
      Fintype.card (Submodule.span ℤ (Set.range r1.basis)) = Fintype.card (ℤ ^ r1.rank) := card_iso
      _ = r1.rank := by simp
  have card_span_eq_rank2 : Fintype.card (Submodule.span ℤ (Set.range r2.basis)) = r2.rank := by
    have h_iso : Submodule.span ℤ (Set.range r2.basis) ≃ₗ[ℤ] ℤ ^ r2.rank := by
      have h_basis : Basis (Fin r2.rank) ℤ (Submodule.span ℤ (Set.range r2.basis)) :=
        Submodule.basisOfTopSpan ℤ (Set.range r2.basis) r2.independent r2.spanning
      exact h_basis.repr.symm
    have card_iso : Fintype.card (Submodule.span ℤ (Set.range r2.basis)) = Fintype.card (ℤ ^ r2.rank) :=
      Fintype.card_congr h_iso.toEquiv
    calc
      Fintype.card (Submodule.span ℤ (Set.range r2.basis)) = Fintype.card (ℤ ^ r2.rank) := card_iso
      _ = r2.rank := by simp
  calc
    r1.rank = Fintype.card (Submodule.span ℤ (Set.range r1.basis)) := by symm; exact card_span_eq_rank1
    _ = Fintype.card (Submodule.span ℤ (Set.range r2.basis)) := card_eq
    _ = r2.rank := card_span_eq_rank2

end FiniteAbelianGroups20k10TorsionCanonicalLaneLean
end HautevilleHouse