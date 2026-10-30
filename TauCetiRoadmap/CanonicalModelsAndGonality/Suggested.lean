import Mathlib
import TauCeti.FieldTheory.FunctionField.Basic
import TauCeti.FieldTheory.FunctionField.ConstantField
import TauCeti.FieldTheory.FunctionField.Divisor.Principal
import TauCeti.FieldTheory.FunctionField.RiemannRoch.Genus
import TauCeti.FieldTheory.FunctionField.Differential.CanonicalDivisor
import TauCeti.FieldTheory.FunctionField.Differential.Dimension
import TauCeti.FieldTheory.FunctionField.Hyperelliptic.Basic
import TauCeti.FieldTheory.FunctionField.ConstantExtension.RiemannRoch
import TauCeti.FieldTheory.FunctionField.Automorphism.FixedField
import TauCeti.FieldTheory.FunctionField.Different.Hurwitz
import TauCeti.FieldTheory.Galois.FixedField

/-!
# Canonical models, plane models and gonality: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`. The file states only what can be stated over Mathlib and the pinned Tau Ceti: the
load-bearing milestones of Layers 1–7, so that contributors and reviewers converge on the carrier,
the conventions and the shape of the main theorems. The other targets, with their definitions and
Checks, are specified in `README.md` only. Every definition here has its real body; theorem proofs
are `sorry` (these are targets, not implementations), and discharging every declaration here would
finish neither a layer nor the roadmap.

The carrier is Tau Ceti's algebraic function field of one variable: fields `k`, `F` with
`[Algebra k F]`, the explicit proposition `TauCeti.IsFunctionField k F`, and exactness of the
constant field `IsIntegrallyClosedIn k F` as an explicit hypothesis wherever a divisor appears.
Places, divisors, `L(D)`, `ℓ(D) = Divisor.dim D`, the genus, the canonical class, the different
and the constant-field-extension setup (`constantCompositum F k' F' = ⊤`) are consumed from
`TauCeti.FieldTheory.FunctionField.*` and never restated. "The curve" is the regular projective
model of `F`; it appears only in the README's Layer 9, which has no declaration here.

Four conventions are visible in the signatures. First, **gonality is an infimum of field
degrees**, `sInf {[F : k(x)] ∣ x transcendental}`, never a minimum over morphisms to `ℙ¹`, and
geometric notions are stated over an algebraically closed constant field `k'` carried by Tau
Ceti's compositum setup, or with `[IsAlgClosed k]` directly. Second, **a projective model is a
tuple of coordinates in `F`** generating `F` by their ratios; its divisor, degree, homogeneous
ideal and Hilbert function are defined from that tuple, and `arithmeticGenus` is the constant
term the Hilbert polynomial is proved to have. Third, **very ampleness quantifies over effective
divisors of degree at most two on every finite constant extension**, because quantifying over
`k`-divisors alone is false (a double cover of a conic without rational points). Fourth, the
LMFDB's booleans are **predicates on finite subgroups of `k`-automorphisms**: bielliptic means a
subgroup `H ≤ F ≃ₐ[k] F` of order two (the group of an involution defined over `k`) with a
genus-one quotient, cyclic trigonal a subgroup of order three with a rational quotient, and the
quotient is `IntermediateField.fixedField H` with `[Finite H]`, as Tau Ceti's automorphism
modules carry it. A divisor of a place is `WeilDivisor.ofPoint P` (`Divisor k F` is
`WeilDivisor (Place k F)`).

The exceptions to "every proof is `sorry`" are the proof fields of `canonicalModel` (its
generation law is the named theorem `adjoin_basis_div_eq_top`) and the bridge checks: `gonality_le_finrank` and
`exists_finrank_eq_gonality` (the infimum is attained), `finrank_regularDifferentials`
(Tau Ceti's `Ω(0)` has dimension `g`), `isFunctionField_fixedField` and
`isIntegrallyClosedIn_fixedField` (the quotient curve is a curve with exact constants), and
`hurwitz_fixedField`, which applies Tau Ceti's Hurwitz genus formula to `F / F^H` with the
instance list the README's 6.2 promises (`IntermediateField.finiteDimensional_fixedField`,
`isGalois_fixedField` and Artin's `finrank_fixedField_eq_natCard` from
`TauCeti.FieldTheory.Galois.FixedField`), so that the elaborator checks it.
-/

open TauCeti AlgebraicGeometry
open scoped IntermediateField

namespace TauCetiRoadmap.CanonicalModelsAndGonality

universe u v

variable {k : Type u} {F : Type v} [Field k] [Field F] [Algebra k F]

/-! ## Layer 1: gonality -/

/-- `README.md`, Layer 1, 1.1. The **gonality** of `F / k`: the least degree `[F : k(x)]` of `F`
over a rational subfield. The junk value `0` occurs only when no element is transcendental, that
is, when `F / k` is not a function field. -/
noncomputable def gonality (k F : Type*) [Field k] [Field F] [Algebra k F] : ℕ :=
  sInf {n : ℕ | ∃ x : F, Transcendental k x ∧ Module.finrank k⟮x⟯ F = n}

/-- `README.md`, Layer 1, 1.1 (bridge check): the gonality is bounded by every field degree. -/
theorem gonality_le_finrank {x : F} (hx : Transcendental k x) :
    gonality k F ≤ Module.finrank k⟮x⟯ F :=
  Nat.sInf_le ⟨x, hx, rfl⟩

/-- `README.md`, Layer 1, 1.1 (bridge check): for a function field the infimum is attained. -/
theorem exists_finrank_eq_gonality (hF : IsFunctionField k F) :
    ∃ x : F, Transcendental k x ∧ Module.finrank k⟮x⟯ F = gonality k F := by
  obtain ⟨x, hx⟩ := hF.exists_transcendental
  exact Nat.sInf_mem (s := {n : ℕ | ∃ x : F, Transcendental k x ∧ Module.finrank k⟮x⟯ F = n})
    ⟨_, x, hx, rfl⟩

/-- `README.md`, Layer 1, 1.1: a function field has gonality at least one. -/
theorem one_le_gonality (hF : IsFunctionField k F) : 1 ≤ gonality k F := by
  sorry

/-- `README.md`, Layer 1, 1.2: **the pencil description**. The gonality is the least degree of a
divisor whose Riemann–Roch space has dimension at least two. -/
theorem gonality_eq_sInf_degree (hF : IsFunctionField k F) (hex : IsIntegrallyClosedIn k F) :
    gonality k F =
      sInf {n : ℕ | ∃ D : Divisor k F, Divisor.degree D = n ∧ 2 ≤ Divisor.dim D} := by
  sorry

/-- `README.md`, Layer 1, 1.3(a): gonality one means rational. -/
theorem gonality_eq_one_iff (hF : IsFunctionField k F) (hex : IsIntegrallyClosedIn k F) :
    gonality k F = 1 ↔ Nonempty (F ≃ₐ[k] RatFunc k) := by
  sorry

/-- `README.md`, Layer 1, 1.3(b): a divisor of degree one bounds the gonality by `g + 1`. -/
theorem gonality_le_genus_add_one (hF : IsFunctionField k F) (hex : IsIntegrallyClosedIn k F)
    {D : Divisor k F} (hD : Divisor.degree D = 1) : gonality k F ≤ genus k F + 1 := by
  sorry

/-- `README.md`, Layer 1, 1.3(c): the canonical pencil bounds the gonality by `2g − 2`. -/
theorem gonality_le_two_mul_genus_sub_two (hF : IsFunctionField k F)
    (hex : IsIntegrallyClosedIn k F) (hg : 2 ≤ genus k F) :
    gonality k F ≤ 2 * genus k F - 2 := by
  sorry

/-- `README.md`, Layer 1, 1.3(d): every function field of genus two has gonality two, over
every exact constant field. -/
theorem gonality_eq_two_of_genus_eq_two (hF : IsFunctionField k F)
    (hex : IsIntegrallyClosedIn k F) (hg : genus k F = 2) : gonality k F = 2 := by
  sorry

/-- `README.md`, Layer 1, 1.4. The **index**: the positive generator of the image of the degree
map on divisors (`sInf` of the positive degrees). -/
noncomputable def index (k F : Type*) [Field k] [Field F] [Algebra k F] : ℕ :=
  sInf {n : ℕ | 0 < n ∧ ∃ D : Divisor k F, Divisor.degree D = n}

/-- `README.md`, Layer 1, 1.4: the index divides every degree. -/
theorem index_dvd_degree (hF : IsFunctionField k F) (D : Divisor k F) :
    (index k F : ℤ) ∣ Divisor.degree D := by
  sorry

/-- `README.md`, Layer 1, 1.4(a): in genus zero the gonality is one when the index is one and two
otherwise (the index of a genus-zero field divides two). -/
theorem gonality_of_genus_eq_zero (hF : IsFunctionField k F) (hex : IsIntegrallyClosedIn k F)
    (hg : genus k F = 0) : gonality k F = if index k F = 1 then 1 else 2 := by
  sorry

/-- `README.md`, Layer 1, 1.4(b): in genus one the gonality is `max 2 index`. -/
theorem gonality_of_genus_eq_one (hF : IsFunctionField k F) (hex : IsIntegrallyClosedIn k F)
    (hg : genus k F = 1) : gonality k F = max 2 (index k F) := by
  sorry

/-- `README.md`, Layer 1, 1.5(b): over a perfect field, gonality two in genus at least two is
Tau Ceti's hyperelliptic predicate (whose separability clause is automatic there). -/
theorem gonality_eq_two_iff_isHyperellipticFunctionField [PerfectField k]
    (hF : IsFunctionField k F) (hex : IsIntegrallyClosedIn k F) (hg : 2 ≤ genus k F) :
    gonality k F = 2 ↔ IsHyperellipticFunctionField k F := by
  sorry

/-- `README.md`, Layer 1, 1.10: for a geometrically disconnected curve the `k`-gonality is the
degree of the constant field times the gonality over the constant field. -/
theorem gonality_eq_finrank_mul_gonality_algebraicClosure (hF : IsFunctionField k F) :
    gonality k F =
      Module.finrank k (algebraicClosure k F) * gonality (algebraicClosure k F) F := by
  sorry

section FiniteMaps

variable {F' : Type*} [Field F'] [Algebra k F'] [Algebra F F'] [IsScalarTower k F F']
  [FiniteDimensional F F']

/-- `README.md`, Layer 1, 1.6. The **norm (pushforward) of divisors** along a finite extension
`F' / F` of function fields over the same constant field: `P' ↦ f(P'∣P) · P`, extended
additively; it preserves degrees. The base field `F` is explicit, as the top field is in Tau
Ceti's `Divisor.conorm k' F'`, because nothing else determines it. -/
noncomputable def Divisor.norm (F : Type v) [Field F] [Algebra k F] [Algebra F F']
    [IsScalarTower k F F'] [FiniteDimensional F F'] : Divisor k F' →+ Divisor k F :=
  Finsupp.liftAddHom fun P' : Place k F' =>
    zmultiplesHom (Divisor k F)
      (Place.relativeDegree k F P' • WeilDivisor.ofPoint (P'.restrict k F))

/-- `README.md`, Layer 1, 1.6: the norm of divisors preserves the degree, by Tau Ceti's
`degree_eq_degree_restrict_mul_relativeDegree` on each place. -/
theorem Divisor.degree_norm (hF' : IsFunctionField k F') (D' : Divisor k F') :
    Divisor.degree (Divisor.norm F D') = Divisor.degree D' := by
  sorry

/-- `README.md`, Layer 1, 1.6: gonality is monotone along finite maps (Poonen, Prop. A.1(vii)),
proved with the norm of divisors and the symmetric functions of the fibre. -/
theorem gonality_le_gonality_of_finiteDimensional (hF : IsFunctionField k F)
    (hF' : IsFunctionField k F') (hex : IsIntegrallyClosedIn k F)
    (hex' : IsIntegrallyClosedIn k F') : gonality k F ≤ gonality k F' := by
  sorry

/-- `README.md`, Layer 1, 1.6: composing with a pencil of the base. -/
theorem gonality_le_finrank_mul_gonality (hF : IsFunctionField k F)
    (hF' : IsFunctionField k F') : gonality k F' ≤ Module.finrank F F' * gonality k F := by
  sorry

end FiniteMaps

/-- `README.md`, Layer 1, 1.8: **the finite-field point-count bound**. Over a field with `q`
elements, the rational places number at most `[F : k(x)] · (q + 1)`. -/
theorem card_degree_eq_one_le [Finite k] (hF : IsFunctionField k F) {x : F}
    (hx : Transcendental k x) :
    Nat.card {P : Place k F // P.degree = 1} ≤ Module.finrank k⟮x⟯ F * (Nat.card k + 1) := by
  sorry

section ConstantExtension

variable {k' : Type*} {F' : Type*} [Field k'] [Field F'] [Algebra k k'] [Algebra k F']
  [Algebra k' F'] [Algebra F F'] [IsScalarTower k k' F'] [IsScalarTower k F F']

/-- `README.md`, Layer 1, 1.7: gonality does not increase under a constant-field extension
(Tau Ceti's compositum setup: `F'` is generated by `F` and `k'`). -/
theorem gonality_le_gonality_of_constantCompositum_eq_top (hF : IsFunctionField k F)
    (hF' : IsFunctionField k' F') (h : constantCompositum F k' F' = ⊤) :
    gonality k' F' ≤ gonality k F := by
  sorry

end ConstantExtension

/-! ## Layer 2: linear systems and projective models -/

/-- `README.md`, Layer 2, 2.1. A **projective model** of `F` in `ℙⁿ`: coordinates in `F`, not all
zero, whose ratios generate `F` over `k` (the model is birational). Scaling by `Fˣ` and linear
changes of coordinates in `GL_{n+1}(k)` give the same model. -/
structure Model (k F : Type*) [Field k] [Field F] [Algebra k F] (n : ℕ) where
  /-- The homogeneous coordinates, as elements of the function field. -/
  coords : Fin (n + 1) → F
  /-- Not all coordinates vanish. -/
  coords_ne_zero : coords ≠ 0
  /-- The ratios of coordinates generate the function field: the model is birational. -/
  generates :
    IntermediateField.adjoin k {y : F | ∃ i j, coords j ≠ 0 ∧ y = coords i / coords j} = ⊤

/-- `README.md`, Layer 2, 2.1 (non-vacuity): the projective line `(x : 1)` is a model of `k(x)`.
The `generates` law is discharged by `RatFunc.adjoin_X`. -/
noncomputable example : Model k (RatFunc k) 1 where
  coords := ![RatFunc.X, 1]
  coords_ne_zero := by
    intro h
    have := congrFun h 1
    simp at this
  generates := by
    refine top_le_iff.mp ?_
    rw [← RatFunc.adjoin_X (K := k)]
    refine IntermediateField.adjoin_le_iff.mpr ?_
    rintro _ rfl
    refine IntermediateField.subset_adjoin k _ ⟨0, 1, by simp, by simp⟩

namespace Model

variable {n : ℕ}

open Classical in
/-- `README.md`, Layer 2, 2.1. The **divisor of a model**: the least divisor `D` with every
coordinate in `L(D)`, that is `⨆_{i, xᵢ ≠ 0} (−div xᵢ)` in the `Finsupp` lattice. -/
noncomputable def divisor (hF : IsFunctionField k F) (x : Model k F n) : Divisor k F :=
  (Finset.univ.filter fun i => x.coords i ≠ 0).sup'
    (by
      obtain ⟨i, hi⟩ := Function.ne_iff.mp x.coords_ne_zero
      exact ⟨i, Finset.mem_filter.mpr ⟨Finset.mem_univ i, hi⟩⟩)
    fun i => if h : x.coords i = 0 then 0 else -Divisor.principal hF (Units.mk0 _ h)

/-- `README.md`, Layer 2, 2.1: the coordinates lie in the Riemann–Roch space of the model
divisor. -/
theorem coords_mem_riemannRochSpace (hF : IsFunctionField k F) (x : Model k F n)
    (i : Fin (n + 1)) : x.coords i ∈ riemannRochSpace (x.divisor hF) := by
  sorry

/-- `README.md`, Layer 2, 2.1. The **degree** of a model: the degree of its divisor, which is
the degree of the image curve (Layer 9, 9.2). -/
noncomputable def degree (hF : IsFunctionField k F) (x : Model k F n) : ℤ :=
  Divisor.degree (x.divisor hF)

/-- `README.md`, Layer 2, 2.2. The **homogeneous ideal** of a model: generated by the homogeneous
polynomials vanishing at the coordinates. -/
noncomputable def homogeneousIdeal (x : Model k F n) : Ideal (MvPolynomial (Fin (n + 1)) k) :=
  Ideal.span {G | (∃ d, G.IsHomogeneous d) ∧ MvPolynomial.aeval x.coords G = 0}

/-- `README.md`, Layer 2, 2.2: the homogeneous ideal of a model is prime. -/
theorem homogeneousIdeal_isPrime (x : Model k F n) : x.homogeneousIdeal.IsPrime := by
  sorry

/-- `README.md`, Layer 2, 2.2. The **Hilbert function**: the dimension of the space `S_m` of
values at the coordinates of the homogeneous polynomials of degree `m`, a subspace of `L(m·D)`. -/
noncomputable def hilbertFunction (x : Model k F n) (m : ℕ) : ℕ :=
  Module.finrank k (Submodule.map (MvPolynomial.aeval x.coords).toLinearMap
    (MvPolynomial.homogeneousSubmodule (Fin (n + 1)) k m))

/-- `README.md`, Layer 2, 2.3: **the Hilbert polynomial**. For large `m` the Hilbert function
is `m · deg + 1 − p_a` for a unique integer `p_a`, the arithmetic genus of the model. -/
theorem exists_arithmeticGenus (hF : IsFunctionField k F) (hex : IsIntegrallyClosedIn k F)
    (x : Model k F n) :
    ∃ p : ℤ, ∃ N : ℕ, ∀ m, N ≤ m → (x.hilbertFunction m : ℤ) = m * x.degree hF + 1 - p := by
  sorry

/-- `README.md`, Layer 2, 2.3. The **arithmetic genus** `p_a` of a model, the constant term of
its Hilbert polynomial. -/
noncomputable def arithmeticGenus (hF : IsFunctionField k F) (hex : IsIntegrallyClosedIn k F)
    (x : Model k F n) : ℤ :=
  (exists_arithmeticGenus hF hex x).choose

/-- `README.md`, Layer 2, 2.3: the genus is at most the arithmetic genus of every model. -/
theorem genus_le_arithmeticGenus (hF : IsFunctionField k F) (hex : IsIntegrallyClosedIn k F)
    (x : Model k F n) : (genus k F : ℤ) ≤ x.arithmeticGenus hF hex := by
  sorry

/-- `README.md`, Layer 2, 2.3. The **deficiency** `δ = p_a − g` of a model. -/
noncomputable def delta (hF : IsFunctionField k F) (hex : IsIntegrallyClosedIn k F)
    (x : Model k F n) : ℤ :=
  x.arithmeticGenus hF hex - genus k F

end Model

/-- `README.md`, Layer 2, 2.4. A complete linear system is **base-point-free** when removing any
place lowers `ℓ`. -/
def IsBasePointFree (D : Divisor k F) : Prop :=
  ∀ P : Place k F, Divisor.dim (D - WeilDivisor.ofPoint P) < Divisor.dim D

/-- `README.md`, Layer 2, 2.4. A divisor is **very ample** when, over every finite constant
extension `k' / k` (Tau Ceti's compositum setup, `k'` exact in `F'`), every effective divisor `E`
of degree at most two imposes `deg E` independent conditions on the conorm of `D`. Quantifying
only over divisors of `F` itself is not very ampleness: see the README's convention table. -/
def IsVeryAmple (D : Divisor k F) : Prop :=
  ∀ (k' : Type u) (F' : Type v) [Field k'] [Field F'] [Algebra k k'] [Algebra k F']
    [Algebra k' F'] [Algebra F F'] [IsScalarTower k k' F'] [IsScalarTower k F F']
    [FiniteDimensional k k'] [FiniteDimensional F F'],
    constantCompositum F k' F' = ⊤ → IsIntegrallyClosedIn k' F' →
      ∀ E : Divisor k' F', 0 ≤ E → Divisor.degree E ≤ 2 →
        (Divisor.dim (Divisor.conorm k' F' D - E) : ℤ) + Divisor.degree E = Divisor.dim D

/-- `README.md`, Layer 2, 2.4: very ample implies base-point-free. -/
theorem IsBasePointFree.of_isVeryAmple (hF : IsFunctionField k F)
    (hex : IsIntegrallyClosedIn k F) {D : Divisor k F} (hD : IsVeryAmple D) :
    IsBasePointFree D := by
  sorry

/-- `README.md`, Layer 2, 2.5: degree at least `2g` is base-point-free. -/
theorem isBasePointFree_of_two_mul_genus_le (hF : IsFunctionField k F)
    (hex : IsIntegrallyClosedIn k F) {D : Divisor k F}
    (hD : 2 * (genus k F : ℤ) ≤ Divisor.degree D) : IsBasePointFree D := by
  sorry

/-- `README.md`, Layer 2, 2.5: degree at least `2g + 1` is very ample, over a perfect field. -/
theorem isVeryAmple_of_two_mul_genus_add_one_le [PerfectField k] (hF : IsFunctionField k F)
    (hex : IsIntegrallyClosedIn k F) {D : Divisor k F}
    (hD : 2 * (genus k F : ℤ) + 1 ≤ Divisor.degree D) : IsVeryAmple D := by
  sorry

/-! ## Layer 3: the canonical map and canonical models -/

/-- `README.md`, Layer 3, 3.1. The **regular differentials**: Tau Ceti's Weil differentials
bounded by the zero divisor. -/
noncomputable abbrev regularDifferentials (k F : Type*) [Field k] [Field F] [Algebra k F] :=
  weilDifferentialFiltration (k := k) (F := F) 0

/-- `README.md`, Layer 3, 3.1 (bridge check): the space of regular differentials has
dimension `g`. -/
theorem finrank_regularDifferentials (hF : IsFunctionField k F)
    (hex : IsIntegrallyClosedIn k F) :
    Module.finrank k (regularDifferentials k F) = genus k F :=
  finrank_weilDifferentialFiltration_zero hF hex

/-- `README.md`, Layer 3, 3.1: in genus at least one there is an effective canonical divisor. -/
theorem exists_isRiemannRochDivisor_nonneg (hF : IsFunctionField k F)
    (hex : IsIntegrallyClosedIn k F) (hg : 1 ≤ genus k F) :
    ∃ W : Divisor k F, W.IsRiemannRochDivisor (genus k F) ∧ 0 ≤ W := by
  sorry

/-- `README.md`, Layer 3, 3.2: **the canonical system has no base points** in genus at least
one, at places of every degree. -/
theorem isBasePointFree_of_isRiemannRochDivisor (hF : IsFunctionField k F)
    (hex : IsIntegrallyClosedIn k F) (hg : 1 ≤ genus k F) {W : Divisor k F}
    (hW : W.IsRiemannRochDivisor (genus k F)) : IsBasePointFree W := by
  sorry

/-- `README.md`, Layer 3, 3.3. The **canonical field**: the subfield generated by the ratios of
elements of `L(W)` for a canonical divisor `W` (any choice gives the same field). -/
noncomputable def canonicalField (hF : IsFunctionField k F) (hex : IsIntegrallyClosedIn k F) :
    IntermediateField k F :=
  IntermediateField.adjoin k {y : F |
    ∃ a ∈ riemannRochSpace (exists_isRiemannRochDivisor hF hex).choose,
      ∃ b ∈ riemannRochSpace (exists_isRiemannRochDivisor hF hex).choose, b ≠ 0 ∧ y = a / b}

/-- `README.md`, Layer 3, 3.3: the canonical field does not depend on the canonical divisor. -/
theorem canonicalField_eq_adjoin (hF : IsFunctionField k F) (hex : IsIntegrallyClosedIn k F)
    {W : Divisor k F} (hW : W.IsRiemannRochDivisor (genus k F)) :
    canonicalField hF hex = IntermediateField.adjoin k {y : F |
      ∃ a ∈ riemannRochSpace W, ∃ b ∈ riemannRochSpace W, b ≠ 0 ∧ y = a / b} := by
  sorry

/-- `README.md`, Layer 3, 3.4: **Noether's theorem**, over an algebraically closed field (the
geometric statement; the general form is the README's). For `g ≥ 2` the canonical divisor is
very ample iff `F` is not hyperelliptic iff the gonality is at least three iff the canonical
map is birational. -/
theorem noether [IsAlgClosed k] (hF : IsFunctionField k F) (hex : IsIntegrallyClosedIn k F)
    (hg : 2 ≤ genus k F) {W : Divisor k F} (hW : W.IsRiemannRochDivisor (genus k F)) :
    (IsVeryAmple W ↔ ¬ IsHyperellipticFunctionField k F) ∧
      (¬ IsHyperellipticFunctionField k F ↔ 3 ≤ gonality k F) ∧
      (3 ≤ gonality k F ↔ canonicalField hF hex = ⊤) := by
  sorry

/-- `README.md`, Layer 3, 3.5: for a hyperelliptic function field the canonical field is the
rational subfield of index two, and has genus zero. -/
theorem finrank_canonicalField_eq_two (hF : IsFunctionField k F) (hex : IsIntegrallyClosedIn k F)
    (hhyp : IsHyperellipticFunctionField k F) :
    Module.finrank (canonicalField hF hex) F = 2 ∧ genus k (canonicalField hF hex) = 0 := by
  sorry

/-- `README.md`, Layer 3, 3.6: a function field of even genus whose canonical field has index
two (a geometrically hyperelliptic curve of even genus) is hyperelliptic over `k`. -/
theorem isHyperellipticFunctionField_of_even_genus [PerfectField k] (hF : IsFunctionField k F)
    (hex : IsIntegrallyClosedIn k F) (hg : 2 ≤ genus k F) (heven : Even (genus k F))
    (hK : Module.finrank (canonicalField hF hex) F = 2) : IsHyperellipticFunctionField k F := by
  sorry

/-- `README.md`, Layer 3, 3.7: **Max Noether's theorem**. For a non-hyperelliptic field of genus
at least three, `L(m·W)` is spanned by `m`-fold products of elements of `L(W)`. -/
theorem noether_projectiveNormality [IsAlgClosed k] (hF : IsFunctionField k F)
    (hex : IsIntegrallyClosedIn k F) (hg : 3 ≤ genus k F)
    (hnh : ¬ IsHyperellipticFunctionField k F) {W : Divisor k F}
    (hW : W.IsRiemannRochDivisor (genus k F)) (m : ℕ) (hm : 1 ≤ m) :
    Submodule.span k {y : F | ∃ f : Fin m → riemannRochSpace W, y = ∏ i, (f i : F)} =
      riemannRochSpace (m • W) := by
  sorry

/-- `README.md`, Layer 3, 3.3: when the canonical field is `F`, the ratios of a basis of `L(W)`
generate `F`, for every canonical divisor `W` (the field they generate is the canonical field). -/
theorem adjoin_basis_div_eq_top (hF : IsFunctionField k F) (hex : IsIntegrallyClosedIn k F)
    {n : ℕ} {W : Divisor k F} (hW : W.IsRiemannRochDivisor (genus k F))
    (b : Module.Basis (Fin (n + 1)) k (riemannRochSpace W))
    (htop : canonicalField hF hex = ⊤) :
    IntermediateField.adjoin k {y : F | ∃ i j, (b j : F) ≠ 0 ∧ y = (b i : F) / (b j : F)} = ⊤ := by
  sorry

/-- `README.md`, Layer 3, 3.3. The **canonical model**: the model given by a basis of `L(W)` for
an effective canonical divisor, when the canonical field is the whole of `F`. -/
noncomputable def canonicalModel (hF : IsFunctionField k F) (hex : IsIntegrallyClosedIn k F)
    {n : ℕ} (_hn : n + 1 = genus k F) {W : Divisor k F}
    (hW : W.IsRiemannRochDivisor (genus k F))
    (b : Module.Basis (Fin (n + 1)) k (riemannRochSpace W))
    (htop : canonicalField hF hex = ⊤) : Model k F n where
  coords i := (b i : F)
  coords_ne_zero h := b.ne_zero 0 (Subtype.ext (congrFun h 0))
  generates := adjoin_basis_div_eq_top hF hex hW b htop

/-- `README.md`, Layer 3, 3.3: the canonical model has degree `2g − 2` and divisor `W`. -/
theorem canonicalModel_divisor (hF : IsFunctionField k F) (hex : IsIntegrallyClosedIn k F)
    {n : ℕ} (hn : n + 1 = genus k F) {W : Divisor k F} (hW : W.IsRiemannRochDivisor (genus k F))
    (hW0 : 0 ≤ W) (b : Module.Basis (Fin (n + 1)) k (riemannRochSpace W))
    (htop : canonicalField hF hex = ⊤) :
    (canonicalModel hF hex hn hW b htop).divisor hF = W := by
  sorry

/-- `README.md`, Layer 3, 3.8: **Petri's theorem**. For genus at least four, unless `F` is
trigonal or a plane quintic of genus six (a plane model of degree five with `δ = 0`), the
homogeneous ideal of the canonical model is generated by its quadrics. -/
theorem petri [IsAlgClosed k] (hF : IsFunctionField k F) (hex : IsIntegrallyClosedIn k F)
    {n : ℕ} (hn : n + 1 = genus k F) (hg : 4 ≤ genus k F) {W : Divisor k F}
    (hW : W.IsRiemannRochDivisor (genus k F))
    (b : Module.Basis (Fin (n + 1)) k (riemannRochSpace W))
    (htop : canonicalField hF hex = ⊤) (htrig : gonality k F ≠ 3)
    (hquintic : ¬ (genus k F = 6 ∧ ∃ x : Model k F 2, x.degree hF = 5 ∧ x.delta hF hex = 0)) :
    (canonicalModel hF hex hn hW b htop).homogeneousIdeal =
      Ideal.span {G | G.IsHomogeneous 2 ∧ G ∈ (canonicalModel hF hex hn hW b htop).homogeneousIdeal} := by
  sorry

/-! ## Layer 4: plane models -/

/-- `README.md`, Layer 4, 4.3. A homogeneous equation in three variables is **smooth** when its
Jacobian ideal contains a power of the irrelevant ideal: the ideal form of "no common zero of
`G` and its partial derivatives in `ℙ²(k̄)`". -/
def IsSmoothPlaneEquation (G : MvPolynomial (Fin 3) k) : Prop :=
  ∃ N : ℕ, ∀ i : Fin 3, MvPolynomial.X i ^ N ∈
    Ideal.span ({G} ∪ Set.range fun j => MvPolynomial.pderiv j G)

/-- `README.md`, Layer 4, 4.1: the homogeneous ideal of a plane model is generated by one
irreducible homogeneous polynomial, of degree the degree of the model. -/
theorem Model.exists_generator (hF : IsFunctionField k F) (x : Model k F 2) :
    ∃ G : MvPolynomial (Fin 3) k, Irreducible G ∧ G.IsHomogeneous (x.degree hF).toNat ∧
      x.homogeneousIdeal = Ideal.span {G} := by
  sorry

/-- `README.md`, Layer 4, 4.2: **the genus–degree formula with deficiency**,
`2g = (d − 1)(d − 2) − 2δ` for a plane model of degree `d`. -/
theorem Model.two_mul_genus_eq (hF : IsFunctionField k F) (hex : IsIntegrallyClosedIn k F)
    (x : Model k F 2) :
    2 * (genus k F : ℤ) = (x.degree hF - 1) * (x.degree hF - 2) - 2 * x.delta hF hex := by
  sorry

/-- `README.md`, Layer 4, 4.3: a smooth plane model has `δ = 0`, so `2g = (d − 1)(d − 2)`. -/
theorem Model.delta_eq_zero_of_isSmoothPlaneEquation (hF : IsFunctionField k F)
    (hex : IsIntegrallyClosedIn k F) (x : Model k F 2) {G : MvPolynomial (Fin 3) k}
    (hG : x.homogeneousIdeal = Ideal.span {G}) (hs : IsSmoothPlaneEquation G) :
    x.delta hF hex = 0 := by
  sorry

/-! ## Layer 5: Clifford's equality case and Brill–Noether -/

/-- `README.md`, Layer 5, 5.1: **Clifford's equality case**. A special divisor of positive degree
attaining Clifford's bound lives on a hyperelliptic field. -/
theorem isHyperellipticFunctionField_of_two_mul_dim_eq [IsAlgClosed k]
    (hF : IsFunctionField k F) (hex : IsIntegrallyClosedIn k F) {D : Divisor k F}
    (h0 : 0 < Divisor.degree D) (h1 : Divisor.degree D < 2 * (genus k F : ℤ) - 2)
    (heq : 2 * (Divisor.dim D : ℤ) = Divisor.degree D + 2) :
    IsHyperellipticFunctionField k F := by
  sorry

/-- `README.md`, Layer 5, 5.4: **Brill–Noether existence** (Kempf, Kleiman–Laksov): when
`ρ = g − (r+1)(g − d + r) ≥ 0` there is a divisor of degree `d` with `ℓ ≥ r + 1`. -/
theorem exists_dim_ge_of_brillNoether [IsAlgClosed k] (hF : IsFunctionField k F)
    (hex : IsIntegrallyClosedIn k F) (d r : ℕ)
    (hρ : ((r : ℤ) + 1) * (genus k F - d + r) ≤ genus k F) :
    ∃ D : Divisor k F, Divisor.degree D = d ∧ r + 1 ≤ Divisor.dim D := by
  sorry

/-- `README.md`, Layer 5, 5.4: **the Brill–Noether gonality bound** `gon ≤ ⌊(g + 3)/2⌋`. -/
theorem gonality_le_genus_add_three_div_two [IsAlgClosed k] (hF : IsFunctionField k F)
    (hex : IsIntegrallyClosedIn k F) : gonality k F ≤ (genus k F + 3) / 2 := by
  sorry

/-! ## Layer 6: quotient curves, bielliptic and cyclic trigonal curves -/

section Quotient

variable (H : Subgroup (F ≃ₐ[k] F)) [Finite H]

/-- `README.md`, Layer 6, 6.1 (bridge check): the quotient `F ⧸ H = F^H` is a function field. -/
theorem isFunctionField_fixedField (hF : IsFunctionField k F) :
    IsFunctionField k (IntermediateField.fixedField H) :=
  hF.fixedField H

omit [Finite H] in
/-- `README.md`, Layer 6, 6.1 (bridge check): the quotient has exact constants. -/
theorem isIntegrallyClosedIn_fixedField (hex : IsIntegrallyClosedIn k F) :
    IsIntegrallyClosedIn k (IntermediateField.fixedField H) :=
  isIntegrallyClosedIn_intermediateField hex _

/-- `README.md`, Layer 6, 6.2 (bridge check): **Riemann–Hurwitz for the quotient**,
`2g − 2 = |H| (2 g_H − 2) + deg Diff(F / F^H)`, is Tau Ceti's Hurwitz genus formula applied to
the Galois extension `F / F^H` with Tau Ceti's instances `IntermediateField.isGalois_fixedField`
and `finiteDimensional_fixedField`; the degree `[F : F^H] = |H|` is Artin's theorem
`IntermediateField.finrank_fixedField_eq_natCard`, which needs no hypothesis on `F / k`. -/
theorem hurwitz_fixedField (hF : IsFunctionField k F) (hex : IsIntegrallyClosedIn k F) :
    (2 * (genus k F : ℤ) - 2) =
      Nat.card H * (2 * (genus k (IntermediateField.fixedField H) : ℤ) - 2) +
        Divisor.degree (Divisor.different k F (hF.fixedField H)) := by
  have h := hurwitz_genus_formula (k := k) (k' := k) (F := IntermediateField.fixedField H)
    (F' := F) (hF.fixedField H) hF (isIntegrallyClosedIn_intermediateField hex _) hex
  rw [Module.finrank_self, IntermediateField.finrank_fixedField_eq_natCard H, Nat.cast_one,
    one_mul, one_mul] at h
  exact h

/-- `README.md`, Layer 6, 6.2: in characteristic zero the different is the tame different
`∑ (e_P − 1) · P`, giving the orbit form of the quotient genus formula. -/
theorem hurwitz_fixedField_tame [CharZero k] (hF : IsFunctionField k F)
    (hex : IsIntegrallyClosedIn k F) :
    (2 * (genus k F : ℤ) - 2) =
      Nat.card H * (2 * (genus k (IntermediateField.fixedField H) : ℤ) - 2) +
        Divisor.degree (Divisor.tameDifferent k F (hF.fixedField H)) := by
  sorry

end Quotient

/-- `README.md`, Layer 6, 6.4. **Bielliptic over `k`**: a subgroup of order two of the
`k`-automorphisms (the group `⟨σ⟩` of an involution defined over `k`) whose quotient has genus
one. -/
def IsBielliptic (k F : Type*) [Field k] [Field F] [Algebra k F] : Prop :=
  ∃ H : Subgroup (F ≃ₐ[k] F), Nat.card H = 2 ∧ genus k (IntermediateField.fixedField H) = 1

/-- `README.md`, Layer 6, 6.6. **Cyclic trigonal**: a subgroup of order three of the
`k`-automorphisms with rational quotient. -/
def IsCyclicTrigonal (k F : Type*) [Field k] [Field F] [Algebra k F] : Prop :=
  ∃ H : Subgroup (F ≃ₐ[k] F), Nat.card H = 3 ∧
    Nonempty (IntermediateField.fixedField H ≃ₐ[k] RatFunc k)

/-- `README.md`, Layer 6, 6.3: **fixed points of an involution**. Away from characteristic two the
tame different of `F / F^H`, for `H = ⟨σ⟩` of order two, is the fixed-point divisor of `σ`, of
degree `2g + 2 − 4 g_H`. -/
theorem degree_tameDifferent_of_natCard_eq_two (h2 : (2 : k) ≠ 0) (hF : IsFunctionField k F)
    (hex : IsIntegrallyClosedIn k F) (H : Subgroup (F ≃ₐ[k] F)) [Finite H]
    (hH : Nat.card H = 2) :
    Divisor.degree (Divisor.tameDifferent k F (hF.fixedField H)) =
      2 * (genus k F : ℤ) + 2 - 4 * genus k (IntermediateField.fixedField H) := by
  sorry

/-- `README.md`, Layer 6, 6.4: the LMFDB's third condition, an involution over `k` with exactly
`2g − 2` fixed points, is bielliptic over `k`, away from characteristic two. -/
theorem isBielliptic_iff_exists_degree_tameDifferent (h2 : (2 : k) ≠ 0) (hF : IsFunctionField k F)
    (hex : IsIntegrallyClosedIn k F) :
    IsBielliptic k F ↔ ∃ (H : Subgroup (F ≃ₐ[k] F)) (_ : Finite H), Nat.card H = 2 ∧
      Divisor.degree (Divisor.tameDifferent k F (hF.fixedField H)) = 2 * (genus k F : ℤ) - 2 := by
  sorry

/-- `README.md`, Layer 5, 5.2(c): hyperelliptic and bielliptic together force `g ≤ 3`
(Castelnuovo–Severi, consumed from Tau Ceti main's `Consequences/Castelnuovo.lean`). -/
theorem genus_le_three_of_isHyperelliptic_of_isBielliptic [PerfectField k] (h2 : (2 : k) ≠ 0)
    (hF : IsFunctionField k F) (hex : IsIntegrallyClosedIn k F)
    (hhyp : IsHyperellipticFunctionField k F) (hbi : IsBielliptic k F) : genus k F ≤ 3 := by
  sorry

/-- `README.md`, Layer 5, 5.2(d): for `g ≥ 6` the bielliptic involution is unique: two subgroups
of order two with genus-one quotients coincide. -/
theorem eq_of_isBielliptic_of_six_le_genus [PerfectField k] (h2 : (2 : k) ≠ 0)
    (hF : IsFunctionField k F) (hex : IsIntegrallyClosedIn k F) (hg : 6 ≤ genus k F)
    {H₁ H₂ : Subgroup (F ≃ₐ[k] F)} (h₁ : Nat.card H₁ = 2) (h₂ : Nat.card H₂ = 2)
    (hg₁ : genus k (IntermediateField.fixedField H₁) = 1)
    (hg₂ : genus k (IntermediateField.fixedField H₂) = 1) : H₁ = H₂ := by
  sorry

/-- `README.md`, Layer 5, 5.2(e): a bielliptic field of genus at least five has gonality four
over an algebraically closed field. -/
theorem gonality_eq_four_of_isBielliptic [IsAlgClosed k] (h2 : (2 : k) ≠ 0)
    (hF : IsFunctionField k F) (hex : IsIntegrallyClosedIn k F) (hg : 5 ≤ genus k F)
    (hbi : IsBielliptic k F) : gonality k F = 4 := by
  sorry

/-- `README.md`, Layer 6, 6.6: cyclic trigonal implies gonality at most three. -/
theorem gonality_le_three_of_isCyclicTrigonal (hF : IsFunctionField k F)
    (hct : IsCyclicTrigonal k F) : gonality k F ≤ 3 := by
  sorry

/-! ## Layer 7: points of low degree -/

/-- `README.md`, Layer 7, 7.2. A place is **`ℙ¹`-parametrized** when its complete linear system
is positive-dimensional. -/
def IsP1Parametrized (P : Place k F) : Prop :=
  2 ≤ Divisor.dim (WeilDivisor.ofPoint P)

/-- `README.md`, Layer 7, 7.2: a point of degree below the gonality is `ℙ¹`-isolated. -/
theorem not_isP1Parametrized_of_degree_lt_gonality (hF : IsFunctionField k F)
    (hex : IsIntegrallyClosedIn k F) {P : Place k F} (h : P.degree < gonality k F) :
    ¬ IsP1Parametrized P := by
  sorry

/-- `README.md`, Layer 7, 7.2: a point of degree at least `g + 1` is `ℙ¹`-parametrized. -/
theorem isP1Parametrized_of_genus_add_one_le (hF : IsFunctionField k F)
    (hex : IsIntegrallyClosedIn k F) {P : Place k F} (h : genus k F + 1 ≤ P.degree) :
    IsP1Parametrized P := by
  sorry

/-- `README.md`, Layer 7, 7.2: a `ℙ¹`-parametrized point lies in an infinite family of places of
degree at most its own (over an infinite field; no Hilbert irreducibility is used). -/
theorem infinite_setOf_degree_le_of_isP1Parametrized [Infinite k] (hF : IsFunctionField k F)
    (hex : IsIntegrallyClosedIn k F) {P : Place k F} (h : IsP1Parametrized P) :
    Set.Infinite {Q : Place k F | Q.degree ≤ P.degree} := by
  sorry

/-- `README.md`, Layer 7, 7.4: **Frey's criterion**. Over a number field, infinitely many points
of degree at most `d` force the gonality to be at most `2d` (Faltings on `W_d`, consumed from the
heights roadmap §5.9, and the Abramovich–Harris lemma). -/
theorem gonality_le_two_mul_of_infinite_setOf_degree_le [NumberField k]
    (hF : IsFunctionField k F) (hex : IsIntegrallyClosedIn k F) (d : ℕ)
    (h : Set.Infinite {P : Place k F | P.degree ≤ d}) : gonality k F ≤ 2 * d := by
  sorry

end TauCetiRoadmap.CanonicalModelsAndGonality
