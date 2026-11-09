import Mathlib
import TauCeti.Algebra.Quaternion.BrauerClass
import TauCeti.Algebra.Quaternion.SplittingCriterion
import TauCeti.FieldTheory.GaloisCohomology.MuTwo.CupNorm
import TauCeti.FieldTheory.QuadraticForm.StiefelWhitney.Evens.Kummer.Value
import TauCeti.FieldTheory.QuadraticForm.StiefelWhitney.QuadraticExtension
import TauCeti.LinearAlgebra.QuadraticForm.RegularFormClass.Discriminant
import TauCeti.LinearAlgebra.QuadraticForm.RegularFormClass.Hasse.Basic
import TauCeti.NumberTheory.HilbertSymbol.Basic
import TauCeti.NumberTheory.LocalField.QuadraticForm.Brauer
import TauCeti.NumberTheory.LocalField.QuadraticForm.Classification

/-!
# Quadratic forms and cohomological invariants: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's five
headline theorems against the pinned Mathlib and Tau Ceti, as examples: the four-fold splitting
criterion of Layer 2, the classification of local forms by `(dim, d, s)` of Layer 6D, the cup-norm
theorem of Layer 7C, and, in Layer 9, the value of the Evens norm on a Kummer class and the
degree-two relative Stiefel–Whitney formula. Every headline is statable at the pins, and each is
discharged by the Tau Ceti declaration that its docstring names.

The file also declares the names that a roadmap on main imports from this namespace:
`OrthogonalSpinGroups` imports `hilbertSymbol`, `localHasse` (Layer 6C) and
`hasseInvariant_eq_localHasse` (Layer 6E). `hilbertSymbol` is a reducible alias of Tau Ceti's
symbol, `localHasse` is the pairwise product on a diagonal tuple `Fin n → Kˣ`, and
`hasseInvariant_eq_localHasse` is proved from Tau Ceti with no admitted step. `RegularFormClass`
and `formClass` are exported from Tau Ceti. Every other name that a roadmap cites from this
namespace is Tau Ceti's, and the README's scope section gives the Tau Ceti name for each.
-/

namespace TauCetiRoadmap.QuadraticFormInvariants

open QuadraticMap
open scoped Quaternion

universe u v

/-! `RegularFormClass` and `formClass` are Tau Ceti's carrier for isometry classes of regular forms
and the class of a regular form (`TauCeti/LinearAlgebra/QuadraticForm/RegularFormClass/Basic.lean`),
the carrier of the README's Conventions and Layer 0. The `export` makes the two names of this
namespace denote the same constants. -/

export TauCeti (RegularFormClass formClass)

/-! ## Layer 2: quaternion algebras and the four-fold splitting criterion -/

section Layer2

variable {K : Type u} [Field K]

/-- **Layer 2, the four-fold splitting criterion** (Lam III.2.7, Serre *CiA* III.1.1–1.2),
Tau Ceti's `TauCeti.QuaternionAlgebra.nonempty_algEquiv_matrix_tfae`: `ℍ[K,a,b]` splits, `b` is a
norm from `K[√a]`, `b = x² − a y²` is solvable, `⟨1, −a, −b⟩` is isotropic, and the norm form
`⟨⟨a,b⟩⟩` is isotropic, are equivalent. -/
example [Invertible (2 : K)] (a b : Kˣ) :
    [Nonempty (ℍ[K, (a : K), (b : K)] ≃ₐ[K] Matrix (Fin 2) (Fin 2) K),
      ∃ z : QuadraticAlgebra K (a : K) 0, z.norm = b,
      ∃ x y : K, (b : K) = x ^ 2 - a * y ^ 2,
      ¬ (weightedSumSquares K ![1, -(a : K), -(b : K)]).Anisotropic,
      ¬ (QuaternionAlgebra.normForm (a : K) 0 (b : K)).Anisotropic].TFAE :=
  TauCeti.QuaternionAlgebra.nonempty_algEquiv_matrix_tfae a b

end Layer2

/-! ## Layer 6C: the Hilbert symbol and the local Hasse invariant -/

section Layer6C

variable {K : Type u} [Field K]

/-- **The Hilbert symbol**, Tau Ceti's `TauCeti.hilbertSymbol`: `+1` when `b = x² − a y²` has a
solution in `K` and `−1` otherwise. It is defined over every field. -/
noncomputable abbrev hilbertSymbol (a b : Kˣ) : ℤˣ :=
  TauCeti.hilbertSymbol a b

/-- **The local Hasse invariant of a diagonal tuple**, `∏_{i<j} (aᵢ, aⱼ)`, with the empty product
in ranks `0` and `1`. On the class of the tuple it is Tau Ceti's
`TauCeti.RegularFormClass.localHasse` (`TauCeti.RegularFormClass.localHasse_mk`), so over a
nonarchimedean local field with `2` invertible isometric tuples have the same value, by
`TauCeti.RegularFormClass.localHasse_congr`. -/
noncomputable def localHasse {n : ℕ} (w : Fin n → Kˣ) : ℤˣ :=
  ∏ ij ∈ Finset.univ.filter fun ij : Fin n × Fin n => ij.1 < ij.2,
    hilbertSymbol (w ij.1) (w ij.2)

end Layer6C

/-! ## Layer 6D: the classification and its corollaries -/

section Layer6D

variable {K : Type u} [Field K]

/-- **Layer 6D, the local classification** (O'Meara 63:20, Serre *CiA* IV.2.3), Tau Ceti's
`QuadraticForm.equivalent_iff_finrank_eq_and_discr_eq_and_localHasse_eq`: over a nonarchimedean
local field two regular forms are isometric exactly when their dimensions, discriminants and local
Hasse invariants agree. The class-level form is
`TauCeti.RegularFormClass.eq_iff_rank_eq_and_discr_eq_and_localHasse_eq`. -/
example [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Invertible (2 : K)] {V W : Type v} [AddCommGroup V] [Module K V] [FiniteDimensional K V]
    [AddCommGroup W] [Module K W] [FiniteDimensional K W]
    (Q : QuadraticForm K V) (hQ : Q.Nondegenerate) (R : QuadraticForm K W)
    (hR : R.Nondegenerate) :
    Q.Equivalent R ↔ Module.finrank K V = Module.finrank K W ∧
      TauCeti.RegularFormClass.discr (formClass Q hQ) =
        TauCeti.RegularFormClass.discr (formClass R hR) ∧
      TauCeti.RegularFormClass.localHasse (formClass Q hQ) =
        TauCeti.RegularFormClass.localHasse (formClass R hR) :=
  QuadraticForm.equivalent_iff_finrank_eq_and_discr_eq_and_localHasse_eq Q hQ hR

end Layer6D

/-! ## Layer 6E: the two Hasse invariants agree -/

section Layer6E

variable {K : Type u} [Field K]

/-- The pairwise product over the pairs `i < j` is the iterated product over `j ∈ Ioi i`, which is
how Tau Ceti's `TauCeti.RegularFormClass.localHasse_mk` writes it. -/
private theorem localHasse_eq_prod_prod_Ioi {n : ℕ} (w : Fin n → Kˣ) :
    localHasse w = ∏ i, ∏ j ∈ Finset.Ioi i, TauCeti.hilbertSymbol (w i) (w j) := by
  rw [localHasse, Finset.prod_filter, Fintype.prod_prod_type]
  refine Finset.prod_congr rfl fun i _ => ?_
  rw [← Finset.prod_filter]
  congr 1
  ext j
  simp

/-- **The two Hasse invariants agree** (Layer 6E, Milestone 1): over a nonarchimedean local field
in which `2` is invertible, Tau Ceti's sign isomorphism
`TauCeti.BrauerGroup.quaternionSubgroupSignEquiv` on the subgroup generated by quaternion classes
carries the Brauer-valued Hasse invariant to the local Hasse invariant
(`TauCeti.RegularFormClass.quaternionSubgroupSignEquiv_apply_hasseInvariant`). -/
theorem hasseInvariant_eq_localHasse [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] [Invertible (2 : K)] :
    ∃ ε : Subgroup.closure
        (Set.range fun ab : Kˣ × Kˣ => TauCeti.BrauerGroup.quaternionClass ab.1 ab.2) →* ℤˣ,
      Function.Injective ε ∧
      ∀ {n : ℕ} (w : Fin n → Kˣ) (h : TauCeti.RegularFormClass.hasseInvariant
          (Quotient.mk (TauCeti.regularFormSetoid K) ⟨n, w⟩) ∈
        Subgroup.closure
          (Set.range fun ab : Kˣ × Kˣ => TauCeti.BrauerGroup.quaternionClass ab.1 ab.2)),
        ε ⟨_, h⟩ = localHasse w := by
  refine ⟨(TauCeti.BrauerGroup.quaternionSubgroupSignEquiv (K := K)).toMonoidHom,
    (TauCeti.BrauerGroup.quaternionSubgroupSignEquiv (K := K)).injective, fun w h => ?_⟩
  have := TauCeti.RegularFormClass.quaternionSubgroupSignEquiv_apply_hasseInvariant
    (Quotient.mk (TauCeti.regularFormSetoid K) ⟨_, w⟩)
  rw [TauCeti.RegularFormClass.localHasse_mk] at this
  rw [localHasse_eq_prod_prod_Ioi]
  exact this

end Layer6E

/-! ## Layer 7C: the cup-norm theorem -/

section Layer7C

variable {K : Type u} [Field K]

/-- **Layer 7C, the cup-norm theorem** (Serre, *Local Fields* XIV §2, Props. 4–5;
Gille–Szamuely 4.7), Tau Ceti's `TauCeti.cup_kummerClass_eq_zero_iff`: over every field in which
`2` is invertible, `(a) ∪ (b) = 0` in `H²(G_K, 𝔽₂)` exactly when `b = x² − a y²` is solvable. -/
example [Invertible (2 : K)] (a b : Kˣ) :
    (TauCeti.trivialF2TopPairing (TauCeti.AbsoluteGaloisGroup K)).cup 1 1
        (TauCeti.kummerClass a) (TauCeti.kummerClass b) = 0 ↔
      ∃ x y : K, (b : K) = x ^ 2 - a * y ^ 2 :=
  TauCeti.cup_kummerClass_eq_zero_iff a b

end Layer7C

/-! ## Layer 9: transfer and the relative Stiefel-Whitney formula -/

section Layer9

variable {K : Type u} [Field K] {L : Type u} [Field L] [Algebra K L]

/-- **Layer 9, the value of the Evens norm on a Kummer class** (Kahn, Lemme II.2.1), Tau Ceti's
`TauCeti.galoisEvens2_kummerClass`: for `L = K(x)` with `x² = d` and `a ∈ Lˣ` of trace `t ≠ 0`,
`N^Ev((a)) = (t) ∪ (−d · N a) + (2) ∪ (d)`. -/
example [Invertible (2 : K)] [FiniteDimensional K L] [Algebra.IsSeparable K L]
    [Invertible (2 : L)] (σ : L →ₐ[K] SeparableClosure K) (hdeg : Module.finrank K L = 2)
    (d : Kˣ) {x : L} (hx : x ∉ Set.range (algebraMap K L))
    (hx2 : x ^ 2 = algebraMap K L (d : K)) (a : Lˣ) (t : Kˣ)
    (ht : (t : K) = Algebra.trace K L (a : L)) :
    TauCeti.galoisEvens K L σ hdeg (TauCeti.kummerClass a) =
      (TauCeti.trivialF2TopPairing (TauCeti.AbsoluteGaloisGroup K)).cup 1 1
          (TauCeti.kummerClass t)
          (TauCeti.kummerClass (-(d * Units.map (Algebra.norm K : L →* K) a))) +
        (TauCeti.trivialF2TopPairing (TauCeti.AbsoluteGaloisGroup K)).cup 1 1
          (TauCeti.kummerClass (unitOfInvertible (2 : K))) (TauCeti.kummerClass d) :=
  TauCeti.galoisEvens2_kummerClass σ hdeg d hx hx2 a t ht

/-- **Layer 9, the relative Stiefel–Whitney formula in degree two** (Kahn, Théorème 2 in degree
two), Tau Ceti's `TauCeti.sw2Class_formClass_traceTransfer_smul_sq`: for a quadratic extension
`L/K` and `a ∈ Lˣ`,
`w₂(Tr_*⟨a⟩) = w₂(Tr_*⟨1⟩) + N^Ev((a)) + w₁(Tr_*⟨1⟩) ∪ cor (a)`. -/
example [Invertible (2 : K)] [FiniteDimensional K L] [Invertible (2 : L)]
    (σ : L →ₐ[K] SeparableClosure K) (hfin : Module.finrank K L = 2) (a : Lˣ)
    (ha : (((a : L) • QuadraticMap.sq (R := L) (A := L)).traceTransfer K).Nondegenerate)
    (h1 : ((QuadraticMap.sq (R := L) (A := L)).traceTransfer K).Nondegenerate) :
    TauCeti.sw2Class (formClass _ ha) =
      TauCeti.sw2Class (formClass _ h1) +
          TauCeti.galoisEvens K L σ hfin (TauCeti.kummerClass a) +
        (TauCeti.trivialF2TopPairing (TauCeti.AbsoluteGaloisGroup K)).cup 1 1
          (TauCeti.sw1Class (formClass _ h1)) (TauCeti.galoisCor K L σ 1 (TauCeti.kummerClass a)) :=
  TauCeti.sw2Class_formClass_traceTransfer_smul_sq σ hfin a ha h1

end Layer9

end TauCetiRoadmap.QuadraticFormInvariants
