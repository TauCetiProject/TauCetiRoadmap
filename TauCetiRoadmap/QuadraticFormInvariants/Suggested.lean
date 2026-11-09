import Mathlib
import TauCeti.Algebra.Quaternion.BrauerClass
import TauCeti.Algebra.Quaternion.SplittingCriterion
import TauCeti.FieldTheory.GaloisCohomology.MuTwo.CupNorm
import TauCeti.FieldTheory.GaloisCohomology.MuTwo.LocalSymbol
import TauCeti.FieldTheory.QuadraticForm.StiefelWhitney.Evens.Kummer.Value
import TauCeti.FieldTheory.QuadraticForm.StiefelWhitney.QuadraticExtension
import TauCeti.LinearAlgebra.QuadraticForm.RegularFormClass.Discriminant
import TauCeti.LinearAlgebra.QuadraticForm.RegularFormClass.Hasse.Basic
import TauCeti.LinearAlgebra.QuadraticForm.Witt.Ring
import TauCeti.NumberTheory.HilbertSymbol.Basic
import TauCeti.NumberTheory.LocalField.QuadraticForm.Bimultiplicativity
import TauCeti.NumberTheory.LocalField.QuadraticForm.Brauer
import TauCeti.NumberTheory.LocalField.QuadraticForm.Classification
import TauCeti.NumberTheory.LocalField.QuadraticForm.Realization
import TauCeti.NumberTheory.LocalField.QuadraticForm.UnramifiedClass
import TauCeti.NumberTheory.QuadraticForm.Global.ProductFormula

/-!
# Quadratic forms and cohomological invariants: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers agree on names and signatures. Discharging all of them
finishes neither a layer nor the roadmap.

Every object of this roadmap is Tau Ceti's at the pinned commit, and the README's supplier
contracts name the native declaration and file for each layer. This file therefore restates
nothing that Tau Ceti already has. It contains two kinds of declaration.

* **The names other roadmaps consume.** `GlobalQuadraticForms`, `IntegralLattices` and
  `OrthogonalSpinGroups` import or cite this namespace for `RegularFormClass`, `formClass`,
  `discr`, `wittRing`, `toWittRing`, `hilbertSymbol`, `hilbertSymbol_neg_self`,
  `hilbertSymbol_comm`, `hilbertSymbol_mul`, `hilbertSymbol_unramified`,
  `exists_hilbertSymbol_eq_neg_one`, `localHasse`, `exists_of_realization`,
  `hasseInvariant_eq_localHasse`, `hilbertSymbol_eq_cohomological` and
  `hilbertSymbol_productFormula`. Each is an alias of a Tau Ceti declaration or is proved from
  one, with no admitted step. `localHasse` and `hilbertSymbol` keep the bodies that their
  consumers unfold.
* **The headline theorems, as examples discharged by Tau Ceti.** The four-fold splitting
  criterion of Layer 2, the classification of local forms by `(dim, d, s)` of Layer 6D, the
  cup-norm theorem of Layer 7C, the value of the Evens norm on a Kummer class of Layer 9 and the
  degree-two relative Stiefel–Whitney formula of Layer 9.
-/

namespace TauCetiRoadmap.QuadraticFormInvariants

/-- The tensor-product group law on the Brauer group, `TauCeti.BrauerGroup.instCommGroup`. -/
noncomputable local instance qfiNativeBrauerCommGroup (F : Type*) [Field F] :
    CommGroup (BrauerGroup F) := TauCeti.BrauerGroup.instCommGroup

open QuadraticMap
open scoped Quaternion

universe u v

/-! ## Layers 0 and 3: the carrier and the discriminant, under the names consumers use -/

/-! `RegularFormClass` and `formClass` are Tau Ceti's carrier for isometry classes of regular forms
and the class of a regular form (`TauCeti/LinearAlgebra/QuadraticForm/RegularFormClass/Basic.lean`).
The `export` makes the two names of this namespace denote the same constants. -/

export TauCeti (RegularFormClass formClass)

section Discriminant

variable {K : Type u} [Field K]

/-- **The discriminant in `Kˣ ⧸ (Kˣ)²`**: Tau Ceti's additive `TauCeti.RegularFormClass.discr`, read
through Tau Ceti's `TauCeti.multiplicativeSquareClassEquiv`. -/
noncomputable def discr [Invertible (2 : K)] (x : RegularFormClass K) :
    Kˣ ⧸ Subgroup.square Kˣ :=
  TauCeti.multiplicativeSquareClassEquiv.symm
    (Multiplicative.ofAdd (TauCeti.RegularFormClass.discr x))

end Discriminant

/-! ## Layer 4: the Witt ring, under the names consumers use -/

/-- **The Witt ring** `W(K)`, Tau Ceti's `TauCeti.WittRing K`: the Witt–Grothendieck ring modulo
the hyperbolic ideal. -/
abbrev wittRing (K : Type u) [Field K] [Invertible (2 : K)] : Type u :=
  TauCeti.WittRing K

/-- **The quotient map** `Ŵ(K) → W(K)`, Tau Ceti's `TauCeti.WittRing.mk`. -/
noncomputable abbrev toWittRing {K : Type u} [Field K] [Invertible (2 : K)] :
    TauCeti.WittGrothendieckRing K →+* wittRing K :=
  TauCeti.WittRing.mk

/-! ## Layer 6C: the Hilbert symbol and the local Hasse invariant, under the names consumers use -/

section HilbertSymbol

variable {K : Type u} [Field K]

/-- **The Hilbert symbol**, Tau Ceti's `TauCeti.hilbertSymbol`: `+1` when `b = x² − a y²` has a
solution in `K` and `−1` otherwise. It is defined over every field. -/
noncomputable abbrev hilbertSymbol (a b : Kˣ) : ℤˣ :=
  TauCeti.hilbertSymbol a b

/-- **The local Hasse invariant of a diagonal tuple**, `∏_{i<j} (aᵢ, aⱼ)`, with the empty product
in ranks `0` and `1`. On the class of the tuple it is Tau Ceti's
`TauCeti.RegularFormClass.localHasse`. -/
noncomputable def localHasse {n : ℕ} (w : Fin n → Kˣ) : ℤˣ :=
  ∏ ij ∈ Finset.univ.filter fun ij : Fin n × Fin n => ij.1 < ij.2,
    hilbertSymbol (w ij.1) (w ij.2)

/-- `(a, −a) = +1` over every field, Tau Ceti's `TauCeti.hilbertSymbol_neg_self`. -/
theorem hilbertSymbol_neg_self (a : Kˣ) : hilbertSymbol a (-a) = 1 :=
  TauCeti.hilbertSymbol_neg_self a

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

/-- **Symmetry**, Tau Ceti's `TauCeti.hilbertSymbol_comm`, which holds over every field in which
`2` is invertible. -/
theorem hilbertSymbol_comm [Invertible (2 : K)] (a b : Kˣ) :
    hilbertSymbol a b = hilbertSymbol b a :=
  TauCeti.hilbertSymbol_comm a b

variable [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]

/-- **Evaluation against the unramified class**, Tau Ceti's `TauCeti.hilbertSymbol_unramified`:
if the norms from `K(√Δ)` are exactly the elements of even valuation, then
`(Δ, b)_K = (−1)^(v_K(b))`. -/
theorem hilbertSymbol_unramified (Δ : Kˣ)
    (hΔ : ∀ b : Kˣ, (∃ x y : K, (b : K) = x ^ 2 - Δ * y ^ 2) ↔
      Even (TauCeti.normalizedValuation K b).toAdd) (b : Kˣ) :
    hilbertSymbol Δ b = if Even (TauCeti.normalizedValuation K b).toAdd then 1 else -1 :=
  TauCeti.hilbertSymbol_unramified hΔ b

variable [Invertible (2 : K)]

/-- **Bimultiplicativity** over a nonarchimedean local field, Tau Ceti's
`TauCeti.hilbertSymbol_mul_right`. -/
theorem hilbertSymbol_mul (a b c : Kˣ) :
    hilbertSymbol a (b * c) = hilbertSymbol a b * hilbertSymbol a c :=
  TauCeti.hilbertSymbol_mul_right (Invertible.ne_zero (2 : K)) a b c

/-- **Nondegeneracy** over a nonarchimedean local field, Tau Ceti's
`TauCeti.exists_hilbertSymbol_eq_neg_one`. -/
theorem exists_hilbertSymbol_eq_neg_one (a : Kˣ) (ha : ¬ IsSquare a) :
    ∃ b : Kˣ, hilbertSymbol a b = -1 :=
  TauCeti.exists_hilbertSymbol_eq_neg_one (Invertible.ne_zero (2 : K)) ha

/-- **Realization of local invariants** (O'Meara 63:23, Serre *CiA* IV Prop 6), Tau Ceti's
`TauCeti.RegularFormClass.exists_of_realization`: every triple `(n, d, s)` with `n ≥ 1` is the
rank, discriminant and local Hasse invariant of a regular form, except `n = 1` with `s = −1`, and
`n = 2` with `d = [−1]` and `s = −1`. -/
theorem exists_of_realization {n : ℕ} (hn : 1 ≤ n) (d : TauCeti.SquareClassGroup K) (s : ℤˣ)
    (h₁ : n = 1 → s = 1) (h₂ : n = 2 → d = TauCeti.squareClass (-1 : Kˣ) → s = 1) :
    ∃ x : RegularFormClass K, x.rank = n ∧ TauCeti.RegularFormClass.discr x = d ∧
      TauCeti.RegularFormClass.localHasse x = s :=
  TauCeti.RegularFormClass.exists_of_realization hn d s h₁ h₂

/-- **The two Hasse invariants agree** (Layer 6E): Tau Ceti's sign isomorphism
`TauCeti.BrauerGroup.quaternionSubgroupSignEquiv` on the subgroup generated by quaternion classes
carries the Brauer-valued Hasse invariant to the local Hasse invariant
(`TauCeti.RegularFormClass.quaternionSubgroupSignEquiv_apply_hasseInvariant`). -/
theorem hasseInvariant_eq_localHasse :
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

end HilbertSymbol

/-! ## Layer 6C: Hilbert reciprocity for the norm-equation symbol, under the name consumers use -/

open IsDedekindDomain NumberField in
open scoped Classical in
/-- **Hilbert's product formula** for the norm-equation symbol, Tau Ceti's
`TauCeti.hilbertSymbol_productFormula`: over a number field the symbols at the finite places, read
in the completions, and at the real places multiply to `1`. Tau Ceti derives it from its
cohomological Hilbert reciprocity. -/
theorem hilbertSymbol_productFormula (F : Type) [Field F] [NumberField F] (a b : Fˣ) :
    (∏ᶠ v : HeightOneSpectrum (𝓞 F),
        hilbertSymbol (v.unitAtFinitePlace a) (v.unitAtFinitePlace b)) *
      ∏ w : {w : InfinitePlace F // w.IsReal},
        hilbertSymbol (TauCeti.unitAtRealPlace w a) (TauCeti.unitAtRealPlace w b) = 1 :=
  TauCeti.hilbertSymbol_productFormula a b

/-- **The norm-equation symbol is the cohomological symbol** (Layers 6C and 7C), Tau Ceti's
`TauCeti.hilbertSymbol_eq_cohomological`: over every field in which `2` is invertible, the Hilbert
symbol is the sign of Class Field Theory's Kummer-cup local symbol, read through
`TauCeti.hilbertSign`. -/
theorem hilbertSymbol_eq_cohomological {F : Type u} [Field F] [Invertible (2 : F)] {ζ : F}
    (hζ : IsPrimitiveRoot ζ 2)
    (tr : continuousCohomology 2 (TauCeti.ClassFieldTheory.muNRep 2 F) ≃+ ZMod 2) (a b : Fˣ) :
    hilbertSymbol a b =
      TauCeti.hilbertSign (TauCeti.ClassFieldTheory.localSymbol
        (TauCeti.ClassFieldTheory.kummerCupPairing ζ hζ) tr
        (TauCeti.ClassFieldTheory.kummerClass F (isUnit_of_invertible (2 : F)) a)
        (TauCeti.ClassFieldTheory.kummerClass F (isUnit_of_invertible (2 : F)) b)) :=
  TauCeti.hilbertSymbol_eq_cohomological hζ tr a b

/-! ## The headline theorems, discharged by Tau Ceti -/

section Headlines

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

/-- **Layer 7C, the cup-norm theorem** (Serre, *Galois Cohomology* II.§1 and Gille–Szamuely 4.7),
Tau Ceti's `TauCeti.cup_kummerClass_eq_zero_iff`: over every field in which `2` is invertible,
`(a) ∪ (b) = 0` in `H²(G_K, 𝔽₂)` exactly when `b = x² − a y²` is solvable. -/
example [Invertible (2 : K)] (a b : Kˣ) :
    (TauCeti.trivialF2TopPairing (TauCeti.AbsoluteGaloisGroup K)).cup 1 1
        (TauCeti.kummerClass a) (TauCeti.kummerClass b) = 0 ↔
      ∃ x y : K, (b : K) = x ^ 2 - a * y ^ 2 :=
  TauCeti.cup_kummerClass_eq_zero_iff a b

variable {L : Type u} [Field L] [Algebra K L]

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

end Headlines

end TauCetiRoadmap.QuadraticFormInvariants
