import Mathlib
import TauCeti.Algebra.BrauerGroup.Group
import TauCeti.NumberTheory.ClassFieldTheory.Brauer.Basic
import TauCeti.RingTheory.Valuation.Discrete.Order
import TauCeti.FieldTheory.FunctionField.Divisor.Eval

/-!
# Symbols, Milnor K-theory and reciprocity: headline statements

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. These statements give Lean forms for headline results; discharging them
finishes neither a layer nor the roadmap.

The finite-rank Steinberg presentation makes unique splitting of central extensions in rank
at least five statable. The tensor-algebra quotient and its native homogeneous images make
the Milnor calculations
statable: finite-field vanishing, unique divisibility over algebraically closed fields, the
real decomposition, and the Bass–Tate calculations for number fields and fields of
transcendence degree one over a finite field. The field Dennis–Stein presentation, tame-symbol
Weil reciprocity over all places of any one-variable function field, its disjoint-divisor
form, and the algebraic/cohomological Brauer-group isomorphism are also stated.

The pinned libraries have no stable matrix/Steinberg carriers or classical and Quillen
K-groups. Thus the stable universal-extension, finite-rank matrix, Matsumoto, classical/plus
and product
comparisons (Layers 0–4, 6–8), localization and tame-kernel sequences, integer and rational
classical K₂ calculations (Layers 11–12), and local/relative Dennis–Stein, homotopy-fibre,
dual-number and dyadic K₂ theorems (Layer 13) cannot be stated on their intended carriers.
Higher Milnor residue and norm maps are also absent: the Bass–Tate sequence, Kato's generator
independence, complete norm–residue square and integral Weil–Suslin reciprocity in all degrees
(Layers 9–10) require those constructions. The local/global cyclic-algebra symbol comparisons
of §§10.32a–10.32b require their cyclic algebras and symbol maps. These results have no
substitute statements here.
-/

namespace TauCetiRoadmap.K2SymbolsBrauer

open scoped TensorProduct WithZero Classical commutatorElement

universe u

namespace Steinberg

variable (R : Type u) [Ring R] (n : ℕ)

/-- Root generators with distinct indices, over an arbitrary associative unital ring. -/
def Root : Type u := {g : Fin n × Fin n × R // g.1 ≠ g.2.1}

/-- A root letter in the free group used by the finite Steinberg presentation. -/
def rootWord (i j : Fin n) (hij : i ≠ j) (a : R) : FreeGroup (Root R n) :=
  FreeGroup.of ⟨(i, j, a), hij⟩

/-- The four Steinberg relation families of §0.3; opposite roots have no imposed relation. -/
def relators : Set (FreeGroup (Root R n)) :=
  {w | (∃ (i j : Fin n) (hij : i ≠ j) (a b : R),
      w = rootWord R n i j hij a * rootWord R n i j hij b *
        (rootWord R n i j hij (a + b))⁻¹) ∨
    (∃ (i j k l : Fin n) (hij : i ≠ j) (hkl : k ≠ l) (a b : R),
      j ≠ k ∧ i ≠ l ∧ w = ⁅rootWord R n i j hij a, rootWord R n k l hkl b⁆) ∨
    (∃ (i j k : Fin n) (hij : i ≠ j) (hjk : j ≠ k) (hik : i ≠ k) (a b : R),
      w = ⁅rootWord R n i j hij a, rootWord R n j k hjk b⁆ *
        (rootWord R n i k hik (a * b))⁻¹) ∨
    (∃ (i j k : Fin n) (hij : i ≠ j) (hki : k ≠ i) (hkj : k ≠ j) (a b : R),
      w = ⁅rootWord R n i j hij a, rootWord R n k i hki b⁆ *
        (rootWord R n k j hkj (-b * a))⁻¹)}

/-- The finite-rank Steinberg group on Mathlib's presented-group carrier (§0.3). -/
abbrev FiniteRank : Type u := PresentedGroup (relators R n)

/-- Every central extension of the finite-rank Steinberg group has a unique homomorphic
section in rank at least five (§3.2), without a centrality assumption on its matrix kernel. -/
theorem centralExtension_splits (hn : 5 ≤ n) {Y : Type*} [Group Y]
    (q : Y →* FiniteRank R n) (hq : Function.Surjective q)
    (hcentral : q.ker ≤ Subgroup.center Y) :
    ∃! σ : FiniteRank R n →* Y, q.comp σ = MonoidHom.id (FiniteRank R n) := by
  sorry

end Steinberg

section Milnor

variable (F : Type u) [Field F]

/-- The span of the tensors `a ⊗ b` with `a + b = 1`. -/
def steinbergRelations : Submodule ℤ (Additive Fˣ ⊗[ℤ] Additive Fˣ) :=
  Submodule.span ℤ {x | ∃ a b : Fˣ, (a : F) + b = 1 ∧ x = Additive.ofMul a ⊗ₜ Additive.ofMul b}

/-- The degree-two symbol group `(Fˣ ⊗ Fˣ) / ⟨a ⊗ b : a + b = 1⟩`, the universal target of
Steinberg pairings; it is `K₂ᴹ(F)`. -/
abbrev SymbolGroup : Type u := (Additive Fˣ ⊗[ℤ] Additive Fˣ) ⧸ steinbergRelations F

variable {F}

/-- The class `{a, b}` of `a ⊗ b`. -/
def symbol (a b : Fˣ) : SymbolGroup F :=
  Submodule.Quotient.mk (Additive.ofMul a ⊗ₜ Additive.ofMul b)

variable (F)

/-- The relation generating the Steinberg ideal of the tensor algebra. -/
def milnorRel : TensorAlgebra ℤ (Additive Fˣ) → TensorAlgebra ℤ (Additive Fˣ) → Prop :=
  fun x y => ∃ a b : Fˣ, (a : F) + b = 1 ∧
    x = TensorAlgebra.ι ℤ (Additive.ofMul a) * TensorAlgebra.ι ℤ (Additive.ofMul b) ∧ y = 0

/-- Milnor K-theory `K_*ᴹ(F)`, the quotient of the tensor algebra of `Additive Fˣ` over `ℤ` by
the two-sided ideal generated by the Steinberg products (Weibel, III.7.1). -/
abbrev MilnorK : Type u := RingQuot (milnorRel F)

variable {F}

/-- The degree-one class of a unit. -/
def MilnorK.ofUnit (a : Fˣ) : MilnorK F :=
  RingQuot.mkRingHom (milnorRel F) (TensorAlgebra.ι ℤ (Additive.ofMul a))

/-- The Milnor symbol `{a₁, …, aₙ}`, the ordered product of degree-one classes. -/
def MilnorK.symbol (l : List Fˣ) : MilnorK F :=
  (l.map MilnorK.ofUnit).prod

variable (F)

/-- The image of Mathlib's degree-n tensor-algebra submodule in the Steinberg ring quotient. -/
def MilnorK.degree (n : ℕ) : Submodule ℤ (MilnorK F) :=
  Submodule.map (RingQuot.mkRingHom (milnorRel F)).toIntAlgHom.toLinearMap
    ((TensorAlgebra.ι ℤ : Additive Fˣ →ₗ[ℤ] TensorAlgebra ℤ (Additive Fˣ)).range ^ n)

/-- Milnor K-groups of finite fields vanish in every degree at least two (§5.12). -/
theorem MilnorK.finiteField_vanishing [Finite F] (n : ℕ) (hn : 2 ≤ n) :
    Subsingleton (MilnorK.degree F n) := by
  sorry

/-- Milnor K-groups of algebraically closed fields are uniquely divisible in degrees at
least two (§5.14). -/
theorem MilnorK.uniqueDivisible_of_isAlgClosed [IsAlgClosed F] (n : ℕ) (hn : 2 ≤ n)
    (m : ℕ) (hm : 0 < m) :
    Function.Bijective (fun x : MilnorK.degree F n => m • x) := by
  sorry

/-- The positive-entry subgroup in the actual degree-n real Milnor group (§5.15). -/
noncomputable def MilnorK.realPositive (n : ℕ) : Submodule ℤ (MilnorK.degree ℝ n) :=
  Submodule.comap (MilnorK.degree ℝ n).subtype
    (Submodule.span ℤ {x | ∃ a : List ℝˣ, a.length = n ∧
      (∃ b ∈ a, 0 < (b : ℝ)) ∧ x = MilnorK.symbol a})

/-- Over ℝ the positive-entry subgroup is divisible and complements the order-two class
`{−1,…,−1}`, in every positive degree (§5.15). -/
theorem MilnorK.real_decomposition (n : ℕ) (hn : 1 ≤ n) :
    (∀ m : ℕ, 0 < m → Function.Surjective (fun x : MilnorK.realPositive n => m • x)) ∧
    ∃ e : MilnorK.degree ℝ n ≃+ ZMod 2 × MilnorK.realPositive n,
      (∀ d : MilnorK.realPositive n, e d.val = (0, d)) ∧
      ∀ x : MilnorK.degree ℝ n,
        x.val = MilnorK.symbol (List.replicate n (-1 : ℝˣ)) → e x = (1, 0) := by
  sorry

/-- The real Milnor ring modulo two is the polynomial ring on the degree-one negative
unit class (§5.15). -/
theorem MilnorK.real_modTwo_equiv_polynomial :
    let r : MilnorK ℝ → MilnorK ℝ → Prop := fun x y => x = 2 ∧ y = 0
    ∃ e : RingQuot r ≃+* Polynomial (ZMod 2),
      e (RingQuot.mkRingHom r (MilnorK.ofUnit (-1 : ℝˣ))) = Polynomial.X := by
  sorry

/-- Bass–Tate: in degrees at least three the real signatures give the entire Milnor group
of a number field (§10.32). -/
theorem MilnorK.numberField_realSign_equiv [NumberField F] (n : ℕ) (hn : 3 ≤ n) :
    ∃ e : MilnorK.degree F n ≃+ ((F →+* ℝ) → ZMod 2),
      ∀ (a : List Fˣ), a.length = n → ∀ x : MilnorK.degree F n,
        x.val = MilnorK.symbol a → ∀ σ : F →+* ℝ,
          e x σ = if ∀ b ∈ a, σ (b : F) < 0 then 1 else 0 := by
  sorry

/-- Bass–Tate vanishing for every field of transcendence degree one over a finite field,
without a finite-generation hypothesis (§10.33). -/
theorem MilnorK.transcendenceDegreeOne_vanishing {k : Type*} [Field k] [Finite k]
    [Algebra k F] (htrdeg : Algebra.trdeg k F = 1) (n : ℕ) (hn : 3 ≤ n) :
    Subsingleton (MilnorK.degree F n) := by
  sorry

end Milnor

section Tame

variable {F : Type*} [Field F]

open Valuation in
/-- The unit part of the tame symbol, `(-1)^{v(f)v(g)} f^{v(g)} g^{-v(f)}`, whose residue is
`∂_v{f, g}`; it is a unit of the valuation ring. -/
noncomputable def tameUnit (v : Valuation F ℤᵐ⁰) (f g : Fˣ) : Fˣ :=
  (-1) ^ (ord v (f : F) * ord v (g : F)) * f ^ ord v (g : F) * g ^ (-ord v (f : F))

end Tame

section Reciprocity

variable {k F : Type*} [Field k] [Field F] [Algebra k F]

/-- Weil reciprocity for the signed tame symbol on every one-variable function field
(§10.30). Each norm is taken in the actual residue field; inseparable residues are allowed. -/
theorem weil_reciprocity_tameSymbol (hF : TauCeti.IsFunctionField k F) (f g : Fˣ) :
    (Function.mulSupport (fun P : TauCeti.Place k F =>
      P.normResidueOrOne (tameUnit P.valuation f g))).Finite ∧
    (∏ᶠ P : TauCeti.Place k F, P.normResidueOrOne (tameUnit P.valuation f g)) = 1 := by
  sorry

/-- **Weil reciprocity for disjoint supports**, the degree-two disjoint case of Suslin's
reciprocity law for any function field of one variable: `f(div g) = g(div f)`. -/
theorem weil_reciprocity_of_disjoint (hF : TauCeti.IsFunctionField k F) (f g : Fˣ)
    (h : Disjoint (TauCeti.Divisor.principal hF f).support
      (TauCeti.Divisor.principal hF g).support) :
    TauCeti.Divisor.eval (TauCeti.Divisor.principal hF g) f =
      TauCeti.Divisor.eval (TauCeti.Divisor.principal hF f) g := by
  sorry

end Reciprocity

/-- The algebraic Brauer group of a field is isomorphic to its continuous-cohomology
Brauer group, after reading the tensor-product group additively. -/
theorem algebraicBrauer_equiv_cohomologicalBrauer (F : Type u) [Field F] :
    Nonempty (Additive (BrauerGroup.{u, u} F) ≃+ TauCeti.ClassFieldTheory.Br F) := by
  sorry

namespace K2

section DennisStein

variable (A : Type u) [CommRing A]

/-- Admissible Dennis–Stein pairs: `(r, s)` with `1 - r s` a unit. -/
def DSPair : Type u := {p : A × A // IsUnit (1 - p.1 * p.2)}

/-- The Dennis–Stein relations D1–D3 (modern convention, §13.2) among admissible pairs:
`D(r,s) + D(s,r)`, `D(r,s) + D(r,t) - D(r, s + t - r s t)` and `D(r, s t) - D(r s, t) - D(r t, s)`,
each imposed exactly when all displayed pairs are admissible. -/
def dsRel : Set (FreeAbelianGroup (DSPair A)) :=
  {x | (∃ p q : DSPair A, q.1 = p.1.swap ∧ x = .of p + .of q) ∨
    (∃ p q w : DSPair A, p.1.1 = q.1.1 ∧
      w.1 = (p.1.1, p.1.2 + q.1.2 - p.1.1 * p.1.2 * q.1.2) ∧ x = .of p + .of q - .of w) ∨
    (∃ p q w : DSPair A, ∃ r s t : A, p.1 = (r, s * t) ∧ q.1 = (r * s, t) ∧ w.1 = (r * t, s) ∧
      x = .of p - .of q - .of w)}

/-- The Dennis–Stein group `D(A)`: the free abelian group on admissible pairs modulo D1–D3. -/
abbrev DennisSteinGroup : Type u :=
  FreeAbelianGroup (DSPair A) ⧸ AddSubgroup.closure (dsRel A)

/-- **The field case of the Dennis–Stein presentation** (Weibel, III.5.11.1(a)): for a field,
`D(F)` is the degree-two symbol group, with `D(r, s) ↦ {r, 1 - r s}` for a unit `r`. -/
theorem dennisSteinGroup_equiv_symbolGroup (F : Type u) [Field F] :
    ∃ e : DennisSteinGroup F ≃+ SymbolGroup F, ∀ (r : Fˣ) (s : F) (h : IsUnit (1 - (r : F) * s)),
      e (QuotientAddGroup.mk (FreeAbelianGroup.of ⟨((r : F), s), h⟩)) = symbol r h.unit := by
  sorry

end DennisStein

end K2

end TauCetiRoadmap.K2SymbolsBrauer
