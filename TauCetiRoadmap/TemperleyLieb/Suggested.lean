import Mathlib

/-!
# Temperley–Lieb diagrams, categories, and algebras: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap.

Mathlib has `catalan` and `DyckWord` (with `card_dyckWord_semilength_eq_catalan`), the
rescaled Chebyshev polynomials `Polynomial.Chebyshev.S`, the monoidal/braided/rigid category
API, `Karoubi` and `Mat_`, `IsSemisimpleRing`, `TwoSidedIdeal`, and `StarRing`. It has **no**
diagram category of any kind, **no** pivotal/spherical/ribbon/dagger structure, **no**
monoidal categories presented by generating morphisms, **no** cellular algebras, and **no**
fusion categories. The general pivotal/spherical/ribbon API is the pivotal and spherical
categories roadmap's target (`../PivotalSpherical/README.md`), consumed here; the rest we
build in `TauCeti/TemperleyLieb/` and the reusable infrastructure homes named in
`README.md`.

This file pins the load-bearing **definitions** (`qInt`, `PlanarMatching`, `TLDiagram`, the
categories `TLDiagCat` and `TLCat R δ`, the algebras `TLAlg R δ n`, cell modules, tensor
ideals, Jones–Wenzl projections) and **named milestones** as `sorry`-targets (`sorry` is
allowed in this human-owned roadmap library; these are goals, not proofs). Some structure
(the universal property of the presented monoidal category, pivotal/spherical/ribbon
instances, the single-clasp recursion and the coefficient formula, the fusion-category
summit) is deliberately *not* pinned here, because its Lean form depends on infrastructure
this roadmap itself creates; `README.md` remains definitive for all of it.

Conventions (see `README.md`): the loop parameter is `δ = q + q⁻¹`; the quantum integer
`[n]` is `qInt R δ n`, this roadmap's one deliberate wrapper over
`Polynomial.Chebyshev.S`, absorbing the off-by-one between the literature's `[n]` and
`S`'s index (still no bracket notation); boundary points are read cyclically (bottom left-to-right, then top
right-to-left); `f ≫ g` stacks `g` on top of `f`; circles are data (`ℕ`) in the diagram
category and `δ`-exponents in `TL(R, δ)`; the Markov trace is unnormalized, `tr̂ 1 = δ ^ n`.
-/

namespace TauCetiRoadmap.TemperleyLieb

open CategoryTheory MonoidalCategory Limits

/-! ## Layer 0: quantum integers -/

/-- The **quantum integer** `[n]` at the loop parameter `δ`. This is this roadmap's one
deliberate wrapper: `Polynomial.Chebyshev.S k` evaluated at `δ` is `[k+1]`, and `qInt`
exists exactly to absorb that off-by-one at a single point instead of at every use site.
`[0] = 0`, `[1] = 1`, `[2] = δ`, `[n+2] = δ·[n+1] − [n]`; when `δ = q + q⁻¹` this is
`q^{n−1} + q^{n−3} + ⋯ + q^{1−n}`. No bracket notation. -/
noncomputable def qInt (R : Type*) [CommRing R] (δ : R) (n : ℕ) : R :=
  (Polynomial.Chebyshev.S R ((n : ℤ) - 1)).eval δ

section QuantumIntegers

variable {R : Type*} [CommRing R]

theorem qInt_zero (δ : R) : qInt R δ 0 = 0 := sorry

theorem qInt_one (δ : R) : qInt R δ 1 = 1 := sorry

theorem qInt_two (δ : R) : qInt R δ 2 = δ := sorry

theorem qInt_add_two (δ : R) (n : ℕ) :
    qInt R δ (n + 2) = δ * qInt R δ (n + 1) - qInt R δ n := sorry

/-- The dictionary to the `q`-side: for a unit `q` with `δ = q + q⁻¹`,
`[n] = Σ_{i<n} q^{n−1−2i}`. -/
theorem qInt_eq_sum_zpow (q : Rˣ) (n : ℕ) :
    qInt R ((q : R) + ((q⁻¹ : Rˣ) : R)) n
      = ∑ i ∈ Finset.range n, ((q ^ ((n : ℤ) - 1 - 2 * (i : ℤ)) : Rˣ) : R) := sorry

/-- The two evaluations that make `ζ = ±1` exceptional in the root-of-unity dictionary:
`[n](2) = n` and `[n](-2) = (-1)^{n-1} · n`. In characteristic zero neither ever vanishes for
`n ≥ 1`, so "some `[n]` vanishes iff `δ = ζ + ζ⁻¹` for a root of unity `ζ`" is false without
the side condition `ζ ≠ ±1`; in characteristic `p` both vanish at `n = p`. -/
theorem qInt_two_eq (n : ℕ) : qInt R (2 : R) n = (n : R) := sorry

theorem qInt_neg_two_eq (n : ℕ) : qInt R (-2 : R) n = (-1) ^ (n - 1) * (n : R) := sorry

/-- A computable evaluator for the quantum integers. `qInt` is an evaluation of
`Polynomial.Chebyshev.S` and Mathlib's `Polynomial` is noncomputable, so `qInt` itself can
never be `#eval`ed; the milestones below that ask for evaluation mean this. -/
def qIntAux {R : Type*} [CommRing R] (δ : R) : ℕ → R
  | 0 => 0
  | 1 => 1
  | (n + 2) => δ * qIntAux δ (n + 1) - qIntAux δ n

theorem qIntAux_eq (δ : R) (n : ℕ) : qIntAux δ n = qInt R δ n := sorry

end QuantumIntegers

/-! ## Layer 1: planar matchings, counting, operations -/

/-- A **planar matching** on `k` cyclically ordered boundary points: a fixed-point-free
involution of `Fin k` whose pairs do not interleave in the linear order (a condition that is
in fact invariant under rotation, which is a theorem below, not part of the definition).
The definitional model of the roadmap; `DyckWord` is the computational encoding. -/
def PlanarMatching (k : ℕ) : Type := sorry

/-- The underlying fixed-point-free involution. The encoding is faithful
(`toPerm_injective`). -/
noncomputable def PlanarMatching.toPerm {k : ℕ} (x : PlanarMatching k) :
    Equiv.Perm (Fin k) := sorry

theorem PlanarMatching.toPerm_involutive {k : ℕ} (x : PlanarMatching k) :
    Function.Involutive x.toPerm := sorry

theorem PlanarMatching.toPerm_ne {k : ℕ} (x : PlanarMatching k) (i : Fin k) :
    x.toPerm i ≠ i := sorry

theorem PlanarMatching.toPerm_injective {k : ℕ} :
    Function.Injective (PlanarMatching.toPerm (k := k)) := sorry

/-- **Planarity**, the defining condition: the pairs of the involution do not interleave. Stated
on the linear order, because that is how the underlying type is built. -/
theorem PlanarMatching.not_interleaved {k : ℕ} (x : PlanarMatching k) (a b : Fin k)
    (hab : a < b) (hb : b < x.toPerm a) : a < x.toPerm b ∧ x.toPerm b < x.toPerm a := sorry

/-- **Planarity is cyclic**: non-interleaving is invariant under rotation, so the circular
picture of the standing conventions is a theorem and not a decree. This is what makes
`rotate`, `reflect` and corner-dragging well defined. -/
theorem PlanarMatching.rotate_mem {k : ℕ} [NeZero k] (x : PlanarMatching k) :
    ∃ y : PlanarMatching k, ∀ i : Fin k, y.toPerm (i + 1) = x.toPerm i + 1 := sorry

/-- Layer 1 is the computational bedrock, so these are requirements, not conveniences: `Finite`
would not support `decide`. The requirement is on the coefficient-free combinatorics only; see
`README.md` on why it does not extend to `TLAlg R δ n` over an arbitrary `R`. -/
instance instDecidableEqPlanarMatching (k : ℕ) : DecidableEq (PlanarMatching k) := sorry

instance instFintypePlanarMatching (k : ℕ) : Fintype (PlanarMatching k) := sorry

/-- Counting: planar matchings on `2k` points are counted by `catalan k`
(via `card_dyckWord_semilength_eq_catalan`). -/
theorem card_planarMatching (k : ℕ) :
    Fintype.card (PlanarMatching (2 * k)) = catalan k := sorry

theorem isEmpty_planarMatching_odd (k : ℕ) : IsEmpty (PlanarMatching (2 * k + 1)) := sorry

/-- The Dyck-word encoding, by innermost-cup induction. This equivalence is also the
efficient composition algorithm later (a stack machine that counts the circles it closes). -/
noncomputable def planarMatchingEquivDyckWord (k : ℕ) :
    PlanarMatching (2 * k) ≃ { p : DyckWord // p.semilength = k } := sorry

/-- Rotation by one click of the cyclic order. -/
noncomputable def PlanarMatching.rotate (k : ℕ) : Equiv.Perm (PlanarMatching k) := sorry

theorem PlanarMatching.rotate_pow_eq_one (k : ℕ) : PlanarMatching.rotate k ^ k = 1 := sorry

/-- Reflection (reversal of the cyclic order). -/
noncomputable def PlanarMatching.reflect (k : ℕ) : Equiv.Perm (PlanarMatching k) := sorry

theorem PlanarMatching.reflect_mul_self (k : ℕ) :
    PlanarMatching.reflect k * PlanarMatching.reflect k = 1 := sorry

/-- The dihedral relation between rotation and reflection. -/
theorem PlanarMatching.reflect_mul_rotate_mul_reflect (k : ℕ) :
    PlanarMatching.reflect k * PlanarMatching.rotate k * PlanarMatching.reflect k
      = (PlanarMatching.rotate k)⁻¹ := sorry

/-- **The innermost cup lemma**: every matching on at least two points pairs some cyclically
adjacent boundary points. Powers the Dyck equivalence, the Layer 2 normal form, and most
inductions. -/
theorem PlanarMatching.exists_adjacent_pair {k : ℕ} [NeZero k] (hk : 1 < k)
    (x : PlanarMatching k) : ∃ i : Fin k, x.toPerm i = i + 1 := sorry

/-- A **Temperley–Lieb diagram** `n → m`: a planar matching on the `n + m` boundary points
(bottom `0, …, n−1` left to right, then top `n, …, n+m−1` right to left) together with the
number of closed circles, *not* remembering where the circles are. -/
structure TLDiagram (n m : ℕ) where
  matching : PlanarMatching (n + m)
  circles : ℕ

/-- The number of through-strands (strands connecting bottom to top). -/
noncomputable def TLDiagram.through {n m : ℕ} (D : TLDiagram n m) : ℕ := sorry

/-- All bottom points connect through to the top. -/
def TLDiagram.StringInjective {n m : ℕ} (D : TLDiagram n m) : Prop := D.through = n

/-- All top points connect through to the bottom. -/
def TLDiagram.StringSurjective {n m : ℕ} (D : TLDiagram n m) : Prop := D.through = m

/-- `halfCount n k`: the number of half-diagrams (cup diagrams) on `n` points with `k`
defects, i.e. of diagrams `n → k` that are `StringSurjective` with no circles. -/
noncomputable def halfCount (n k : ℕ) : ℕ := sorry

/-- ⚠ The parity hypothesis is not decoration: at `n = 4`, `k = 1` the right-hand side is
`C(4,1) - C(4,0) = 3`, while there is no half-diagram at all. -/
theorem halfCount_eq {n k : ℕ} (hk : k < n) (hpar : (n - k) % 2 = 0) :
    halfCount n k = n.choose ((n - k) / 2) - n.choose ((n - k) / 2 - 1) := sorry

theorem halfCount_self (n : ℕ) : halfCount n n = 1 := sorry

/-- The vanishing that `sum_halfCount_sq`, `card_tlDiagram_through` and the Gram determinant
statements all rest on. Name it, rather than leaving it inside the definition. -/
theorem halfCount_eq_zero {n k : ℕ} (h : n < k ∨ (n - k) % 2 = 1) : halfCount n k = 0 := sorry

/-- The through-strand refinement of the Catalan count. -/
theorem card_tlDiagram_through (n m k : ℕ) :
    Nat.card { D : TLDiagram n m // D.circles = 0 ∧ D.through = k }
      = halfCount n k * halfCount m k := sorry

theorem sum_halfCount_sq (n : ℕ) :
    ∑ k ∈ Finset.range (n + 1), halfCount n k ^ 2 = catalan n := sorry

/-! ## Layer 2: the diagram category -/

/-- The Temperley–Lieb **diagram category**: objects wrap a number of boundary points,
morphisms are Temperley–Lieb diagrams with their circle counts as data (discarding the
count would silently impose `δ = 1`; the circle must stay a nontrivial endomorphism of the
unit for the universal property to hold at every `δ`). Composition glues along the middle
boundary and adds the circle counts, including the newly formed circles; associativity of
this gluing is the hard theorem of Layer 2. -/
structure TLDiagCat : Type where
  /-- Build an object of the diagram category from its number of boundary points. -/
  of ::
  /-- The number of boundary points. -/
  points : ℕ

noncomputable instance : Category.{0} TLDiagCat := sorry

/-- Morphisms are diagrams. -/
noncomputable def TLDiagCat.homEquiv (n m : ℕ) :
    (TLDiagCat.of n ⟶ TLDiagCat.of m) ≃ TLDiagram n m := sorry

/-- Diagram-level composition (gluing, counting new circles), the content of `homEquiv`
being functorial. -/
noncomputable def TLDiagram.comp {n k m : ℕ} (D : TLDiagram n k) (E : TLDiagram k m) :
    TLDiagram n m := sorry

theorem TLDiagCat.homEquiv_symm_comp {n k m : ℕ} (D : TLDiagram n k) (E : TLDiagram k m) :
    (TLDiagCat.homEquiv n m).symm (D.comp E)
      = (TLDiagCat.homEquiv n k).symm D ≫ (TLDiagCat.homEquiv k m).symm E := sorry

/-- Juxtaposition: the (strict) monoidal structure, adding boundary points. -/
noncomputable instance : MonoidalCategory TLDiagCat := sorry

theorem TLDiagCat.of_tensorObj (n m : ℕ) :
    TLDiagCat.of n ⊗ TLDiagCat.of m = TLDiagCat.of (n + m) := sorry

/-- Every object is self-dual via nested cups and caps; the zigzags are diagram
computations. -/
noncomputable instance : RigidCategory TLDiagCat := sorry

/-- **Through-strand factorization**, existence: every diagram factors through
`TLDiagCat.of D.through` as a `StringSurjective` diagram (carrying all the circles) followed
by a circle-free `StringInjective` one. Uniqueness, and the re-factorization of a composite
of factored forms, are companion targets. -/
theorem TLDiagram.exists_through_factorization {n m : ℕ} (D : TLDiagram n m) :
    ∃ (P : TLDiagram n D.through) (I : TLDiagram D.through m),
      P.StringSurjective ∧ I.StringInjective ∧ I.circles = 0 ∧
      D = P.comp I := sorry

/-! ## Layer 3: the linear category `TL(R, δ)` -/

/-- The `R`-linear Temperley–Lieb category at loop parameter `δ`: objects wrap a number of
boundary points, hom-modules are free on circle-free matchings, composition inserts
`δ ^ #(new circles)`. -/
structure TLCat (R : Type*) [CommRing R] (δ : R) : Type where
  /-- Build an object of `TL(R, δ)` from its number of boundary points. -/
  of ::
  /-- The number of boundary points. -/
  points : ℕ

section Linear

universe u

variable (R : Type u) [CommRing R] (δ : R)

noncomputable instance : Category.{u} (TLCat R δ) := sorry
noncomputable instance : Preadditive (TLCat R δ) := sorry
noncomputable instance : CategoryTheory.Linear R (TLCat R δ) := sorry
noncomputable instance : MonoidalCategory (TLCat R δ) := sorry
instance : MonoidalPreadditive (TLCat R δ) := sorry
instance : MonoidalLinear R (TLCat R δ) := sorry
noncomputable instance : RigidCategory (TLCat R δ) := sorry

/-- The identity-on-objects linearization, sending a circle to a factor of `δ`. (It is
monoidal; the monoidal-functor form is pinned once the presentation infrastructure fixes
how we say that.) -/
noncomputable def linearize : TLDiagCat ⥤ TLCat R δ := sorry

/-- Each hom-module is free with basis the circle-free matchings. -/
noncomputable def diagBasis (n m : ℕ) :
    Module.Basis (PlanarMatching (n + m)) R
      ((TLCat.of n : TLCat R δ) ⟶ TLCat.of m) := sorry

/-- Corner-dragging (Frobenius reciprocity for the self-duality): drag the rightmost bottom
point to the top. Compatible with Layer 1's cyclic reindexing along `diagBasis`. -/
noncomputable def bendRight (n m : ℕ) :
    ((TLCat.of (n + 1) : TLCat R δ) ⟶ TLCat.of m)
      ≃ₗ[R] ((TLCat.of n : TLCat R δ) ⟶ TLCat.of (m + 1)) := sorry

/-- The **Kauffman braiding** `σ = A·1 + A⁻¹·(cap ≫ cup)` (that is, `A·1 + A⁻¹·e₁`; in the
other order `cup ≫ cap` is the closed circle `δ · 1_𝟙`), available after base change: it
needs a unit `A` with `δ = −A² − A⁻²` (that is, `q = −A²`; this hypothesis is where
Tingley's minus sign lives, and the only place the roadmap leaves the bare `δ = q + q⁻¹`
convention). The second braiding is `A ↦ A⁻¹`; the ribbon twist is `θ₁ = −A³`. -/
noncomputable def braidedOfKauffman (A : Rˣ)
    (hA : δ = -((A : R) ^ 2) - (((A⁻¹ : Rˣ) : R) ^ 2)) :
    BraidedCategory (TLCat R δ) := sorry

/-- The image of a single diagram: `δ ^ circles` times the basis vector of its matching. -/
noncomputable def TLDiagram.toHom {n m : ℕ} (D : TLDiagram n m) :
    (TLCat.of n : TLCat R δ) ⟶ TLCat.of m := sorry

/-- **Monos among diagrams**: for `δ` a non-zero-divisor, a diagram is a monomorphism iff
all its bottom points are through-strands. Forward (mono ⟹ through-strands) by contraposition,
via the innermost arc among the bottom points and `e_i ≫ D = δ·D = (δ·1) ≫ D`; converse via
`D ≫ D̄ = δ^c·1`, where `c` counts the arcs among `D`'s top points and twice its stored circles.
⚠ `hδ` is needed, but not because of `cup : 0 ⟶ 2`, which is mono for *every* `δ`
(precomposition adjoins a disjoint arc and closes no circle). It is needed because `TLDiagram`
carries a circle count: the empty diagram `0 ⟶ 0` with `circles = 1` is `StringInjective` and
has `toHom = δ • 𝟙`, which is `0` at `δ = 0` and is multiplication by `2` over `ℤ/6`. -/
theorem TLDiagram.mono_toHom_iff [Nontrivial R] (hδ : δ ∈ nonZeroDivisors R) {n m : ℕ}
    (D : TLDiagram n m) : Mono (D.toHom R δ) ↔ D.StringInjective := sorry

theorem TLDiagram.epi_toHom_iff [Nontrivial R] (hδ : δ ∈ nonZeroDivisors R) {n m : ℕ}
    (D : TLDiagram n m) : Epi (D.toHom R δ) ↔ D.StringSurjective := sorry

end Linear

/-! ## Layer 4: the algebras, the tower, and the Markov trace -/

/-- The **Temperley–Lieb algebra** `TL_n(R, δ)`: literally the endomorphism algebra of `n` in
`TLCat R δ`, so that `Ring` and `Algebra R` come from `CategoryTheory.Preadditive` and
`CategoryTheory.Linear` rather than being rebuilt. ⚠ Mathlib's `End` multiplication reverses
composition (`x * y = y ≫ x`, `Mathlib/CategoryTheory/Endomorphism.lean`), so `x * y` stacks
`x` on top of `y`; see the conventions in `README.md`. -/
noncomputable abbrev TLAlg (R : Type u) [CommRing R] (δ : R) (n : ℕ) : Type u :=
  End (TLCat.of n : TLCat R δ)

/-- The algebra abstractly presented on generators `E_1, …, E_{n−1}` and the Jones
relations (via `FreeAlgebra` and `RingQuot`). -/
noncomputable def PresentedTL (R : Type*) [CommRing R] (δ : R) (n : ℕ) : Type := sorry

section Algebras

variable (R : Type u) [CommRing R] (δ : R)

instance {n : ℕ} : Module.Free R (TLAlg R δ n) := sorry

/-- Vertical reflection is an anti-automorphism of order two. -/
noncomputable instance {n : ℕ} : StarRing (TLAlg R δ n) := sorry

/-- `StarRing` constrains only the ring structure; the reflection is also `R`-linear, and that
has to be said separately. (`StarModule R _` is the wrong vehicle: it wants a `Star R`, and `R`
here carries no involution.) -/
theorem star_smul_tlAlg {n : ℕ} (r : R) (x : TLAlg R δ n) :
    star (r • x) = r • star x := sorry

/-- ⚠ `[Nontrivial R]` is required: over the trivial ring Mathlib's `Module.finrank` is `1`
(`finrank_subsingleton`), while `catalan 2 = 2`. -/
theorem finrank_tlAlg [Nontrivial R] (n : ℕ) :
    Module.finrank R (TLAlg R δ n) = catalan n := sorry

/-- The generator `e_i = cap_i ≫ cup_i`, where `cap_i : n+1 ⟶ n-1` joins the adjacent points
`i`, `i+1` and `cup_i` is its reflection. ⚠ In the other order, `cup_i ≫ cap_i` is `δ • 1`, not
`e_i`; it type-checks, so it will not be caught by elaboration. Indexed by `Fin n` inside
`TLAlg R δ (n + 1)` rather than by `Fin (n - 1)` inside `TLAlg R δ n`, so that truncated
subtraction never appears and the last generator is literally `Fin.last`. -/
noncomputable def e {n : ℕ} (i : Fin n) : TLAlg R δ (n + 1) := sorry

theorem e_mul_self {n : ℕ} (i : Fin n) : e R δ i * e R δ i = δ • e R δ i := sorry

theorem e_mul_e_mul_e_of_adjacent {n : ℕ} (i j : Fin n)
    (h : (i : ℕ) + 1 = j ∨ (j : ℕ) + 1 = i) :
    e R δ i * e R δ j * e R δ i = e R δ i := sorry

theorem commute_e_of_far {n : ℕ} (i j : Fin n)
    (h : (i : ℕ) + 1 < j ∨ (j : ℕ) + 1 < i) :
    Commute (e R δ i) (e R δ j) := sorry

noncomputable instance {n : ℕ} : Ring (PresentedTL R δ n) := sorry
noncomputable instance {n : ℕ} : Algebra R (PresentedTL R δ n) := sorry

/-- **The presentation theorem**: the diagram algebra is the abstractly presented one. The
proof forces the Jones normal form for reduced words and consumes the Catalan count. -/
noncomputable def presentedTLEquiv (n : ℕ) : PresentedTL R δ n ≃ₐ[R] TLAlg R δ n := sorry

/-- The tower inclusion (add a through-strand on the right), injective for every `R` and
`δ`. -/
noncomputable def incl {n : ℕ} : TLAlg R δ n →ₐ[R] TLAlg R δ (n + 1) := sorry

theorem incl_injective (n : ℕ) :
    Function.Injective (incl R δ (n := n)) := sorry

/-- The unnormalized **Markov trace**: close the diagram to the right and evaluate circles;
`tr̂ 1 = δ ^ n`, with no divisions anywhere in this layer. -/
noncomputable def diagTrace (n : ℕ) : TLAlg R δ n →ₗ[R] R := sorry

theorem diagTrace_one (n : ℕ) : diagTrace R δ n 1 = δ ^ n := sorry

theorem diagTrace_mul_comm {n : ℕ} (x y : TLAlg R δ n) :
    diagTrace R δ n (x * y) = diagTrace R δ n (y * x) := sorry

theorem diagTrace_star {n : ℕ} (x : TLAlg R δ n) :
    diagTrace R δ n (star x) = diagTrace R δ n x := sorry

theorem diagTrace_incl {n : ℕ} (x : TLAlg R δ n) :
    diagTrace R δ (n + 1) (incl R δ x) = δ * diagTrace R δ n x := sorry

/-- **The Markov property.** -/
theorem diagTrace_markov {n : ℕ} (x : TLAlg R δ (n + 1)) :
    diagTrace R δ (n + 2) (incl R δ x * e R δ (Fin.last n))
      = diagTrace R δ (n + 1) x := sorry

/-- The conditional expectation: close the last strand only. An `TLAlg R δ n`-bimodule map
with `condExp (incl x) = δ • x` and `diagTrace ∘ condExp = diagTrace`. -/
noncomputable def condExp (n : ℕ) : TLAlg R δ (n + 1) →ₗ[R] TLAlg R δ n := sorry

theorem condExp_incl {n : ℕ} (x : TLAlg R δ n) :
    condExp R δ n (incl R δ x) = δ • x := sorry

theorem diagTrace_condExp {n : ℕ} (x : TLAlg R δ (n + 1)) :
    diagTrace R δ n (condExp R δ n x) = diagTrace R δ (n + 1) x := sorry

/-- **Uniqueness of the Markov trace**: traciality, compatibility with the tower, the
Markov property, and the degree-`0` normalization determine `diagTrace`. -/
theorem markovTrace_unique (tr : ∀ n, TLAlg R δ n →ₗ[R] R)
    (h0 : tr 0 1 = 1)
    (hmul : ∀ n (x y : TLAlg R δ n), tr n (x * y) = tr n (y * x))
    (hincl : ∀ n (x : TLAlg R δ n), tr (n + 1) (incl R δ x) = δ * tr n x)
    (hmarkov : ∀ n (x : TLAlg R δ (n + 1)),
      tr (n + 2) (incl R δ x * e R δ (Fin.last n)) = tr (n + 1) x) :
    ∀ n, tr n = diagTrace R δ n := sorry

end Algebras

/-! ## Layer 5: cell modules, Gram determinants, semisimplicity

The general cellular-algebra infrastructure (Graham–Lehrer) lives in
`TauCeti/Algebra/Cellular/` and is specified in `README.md`; here we pin only its TL
instance. -/

/-- The cell (standard, link) module `W_{n,k}`, with the half-diagram basis; the cell
structure is the through-strand filtration. -/
noncomputable def CellModule (R : Type u) [CommRing R] (δ : R) (n k : ℕ) : Type u := sorry

/-- The Gram matrix of `cellForm` in the half-diagram basis (in a pinned order). -/
noncomputable def gramMatrix (R : Type u) [CommRing R] (δ : R) (n k : ℕ) :
    Matrix (Fin (halfCount n k)) (Fin (halfCount n k)) R := sorry

/-- **The Gram determinant, universally.** The determinant is the evaluation at `δ` of an
explicit integer polynomial, characterized in `ℤ[X]` — a domain, where every quantum integer
is nonzero — by `det_gramPoly_mul` below, and transported to any `R` by base change.

⚠ This universal form, not its specialization, is the milestone. Cross-multiplied and then
evaluated at a particular `δ`, the identity says nothing as soon as some `[j]` with
`j ≤ (n−k)/2` vanishes: both sides are then `0`, and every exponent in range is positive. That
is not a corner case, it is exactly the root-of-unity regime the classification below lives in.
At `δ = 0` it already fails to deliver `det G_{4,0} = [2]²[3]` (denominator `[1]³[2]`) or
`det G_{5,1} = [3]⁴·(δ²−2)` (denominator `[1]⁴[2]`). -/
noncomputable def gramPoly (n k : ℕ) : Polynomial ℤ := sorry

theorem det_gramPoly_mul (n k : ℕ) :
    gramPoly n k
        * ∏ j ∈ Finset.Icc 1 ((n - k) / 2),
            qInt (Polynomial ℤ) Polynomial.X j ^ halfCount n (k + 2 * j)
      = ∏ j ∈ Finset.Icc 1 ((n - k) / 2),
          qInt (Polynomial ℤ) Polynomial.X (k + j + 1) ^ halfCount n (k + 2 * j) := sorry

section Cells

variable (R : Type u) [CommRing R] (δ : R)

noncomputable instance (n k : ℕ) : AddCommGroup (CellModule R δ n k) := sorry
noncomputable instance (n k : ℕ) : Module R (CellModule R δ n k) := sorry
noncomputable instance (n k : ℕ) : Module (TLAlg R δ n) (CellModule R δ n k) := sorry

/-- Without this the two actions above are formally unrelated, and `cellForm` being an
`R`-bilinear form on a `TLAlg`-module says less than intended. -/
instance (n k : ℕ) : IsScalarTower R (TLAlg R δ n) (CellModule R δ n k) := sorry

/-- ⚠ `[Nontrivial R]` for the same reason as `finrank_tlAlg`. -/
theorem finrank_cellModule [Nontrivial R] (n k : ℕ) :
    Module.finrank R (CellModule R δ n k) = halfCount n k := sorry

/-- The cell form: `ū ≫ v = ⟨u, v⟩ · 1 + (lower through-strand terms)`. -/
noncomputable def cellForm (n k : ℕ) : LinearMap.BilinForm R (CellModule R δ n k) := sorry

/-- **The Gram determinant formula** (Westbury; Ridout–Saint-Aubin): the specialization of
`gramPoly` at `δ`. Anchors: `det G_{2,0} = [2]`, `det G_{3,1} = [3]`, `det G_{4,2} = [4]`,
`det G_{4,0} = [2]²[3]`, `det G_{5,1} = [3]⁴·(δ²−2)`. -/
theorem det_gramMatrix (n k : ℕ) :
    (gramMatrix R δ n k).det
      = Polynomial.eval δ ((gramPoly n k).map (Int.castRingHom R)) := sorry

end Cells

section Semisimplicity

variable (K : Type*) [Field K] (δ : K)

/-- **Semisimplicity via Gram determinants** (through the general cellular criterion):
`TL_n(K, δ)` is semisimple iff every cell form in its through-strand range is
nondegenerate. -/
theorem isSemisimpleRing_tlAlg_iff (n : ℕ) :
    IsSemisimpleRing (TLAlg K δ n)
      ↔ ∀ k ∈ Finset.range (n + 1), (n - k) % 2 = 0 → (gramMatrix K δ n k).det ≠ 0 := sorry

/-- The generic direction, over any field: `[1], …, [n]` nonzero gives semisimplicity. ⚠ This
is **not** an iff: `TL_3(0)` is semisimple although `[2](0) = 0`. -/
theorem isSemisimpleRing_tlAlg (n : ℕ)
    (h : ∀ k ∈ Finset.Icc 1 n, qInt K δ k ≠ 0) :
    IsSemisimpleRing (TLAlg K δ n) := sorry

/-- **The classification**, in characteristic zero: semisimple iff the quantum order exceeds
`n`, or `δ = 0` with `n` odd. Phrased without naming `ℓ(δ)`: "`[k] ≠ 0` for `1 ≤ k ≤ n`" is
`ℓ(δ) > n`. ⚠ The characteristic hypothesis is real, not defensive — see
`not_isSemisimpleRing_tlAlg_five_zero_charTwo`. -/
theorem isSemisimpleRing_tlAlg_iff_of_charZero [CharZero K] (n : ℕ) :
    IsSemisimpleRing (TLAlg K δ n)
      ↔ (∀ k ∈ Finset.Icc 1 n, qInt K δ k ≠ 0) ∨ (δ = 0 ∧ Odd n) := sorry

/-- The `δ = 0` acceptance tests that keep the classification honest. The first two are the
parity phenomenon; the third is why it is a characteristic-zero statement, since
`det G_{5,1} = [3]⁴·(δ²−2)` is `−2` at `δ = 0`. -/
theorem not_isSemisimpleRing_tlAlg_two_zero :
    ¬ IsSemisimpleRing (TLAlg K (0 : K) 2) := sorry

theorem isSemisimpleRing_tlAlg_three_zero : IsSemisimpleRing (TLAlg K (0 : K) 3) := sorry

theorem isSemisimpleRing_tlAlg_five_zero [CharZero K] :
    IsSemisimpleRing (TLAlg K (0 : K) 5) := sorry

theorem not_isSemisimpleRing_tlAlg_five_zero_charTwo (hK : ringChar K = 2) :
    ¬ IsSemisimpleRing (TLAlg K (0 : K) 5) := sorry

end Semisimplicity

section Nondegeneracy

variable (R : Type u) [CommRing R] (δ : R)

/-- The closure pairing `Hom(n, m) ⊗ Hom(m, n) → R`, `(f, g) ↦ tr̂(f ≫ g)`. -/
noncomputable def homPairing (n m : ℕ) :
    ((TLCat.of n : TLCat R δ) ⟶ TLCat.of m)
      →ₗ[R] ((TLCat.of m : TLCat R δ) ⟶ TLCat.of n) →ₗ[R] R := sorry

end Nondegeneracy

section NondegeneracyField

variable (K : Type u) [Field K] (δ : K)

/-- **Nondegeneracy of the category**: all closure pairings are nondegenerate iff every
quantum integer is nonzero. This `δ`-side form holds over any field, and has no parity
exception, unlike the algebra-by-algebra statement. -/
theorem homPairing_nondegenerate_iff :
    (∀ n m, (homPairing K δ n m).Nondegenerate)
      ↔ ∀ k, 1 ≤ k → qInt K δ k ≠ 0 := sorry

/-- The translation into root-of-unity language. ⚠ Algebraically closed **and characteristic
zero**: in characteristic `p`, `δ = 2 = ζ + ζ⁻¹` for `ζ = 1` has `[p] = 0`, while `ζ = 1` is
excluded by `ζ ≠ ±1`, so the right-hand side is false there. In characteristic zero the
condition already excludes `δ = 0`, which is the case `ζ = ±i`. -/
theorem homPairing_nondegenerate_iff_of_charZero [IsAlgClosed K] [CharZero K] :
    (∀ n m, (homPairing K δ n m).Nondegenerate)
      ↔ ∀ ζ : Kˣ, (∃ m : ℕ, 0 < m ∧ ζ ^ m = 1) → ζ ≠ 1 → ζ ≠ -1 →
          δ ≠ (ζ : K) + ((ζ⁻¹ : Kˣ) : K) := sorry

end NondegeneracyField

/-! ## Layer 6: Jones–Wenzl projections and tensor ideals -/

/-- The **Jones–Wenzl projection** `f_n`, defined when `[1], …, [n]` are invertible. -/
noncomputable def jonesWenzl (R : Type u) [CommRing R] (δ : R) (n : ℕ)
    (h : ∀ k ∈ Finset.Icc 1 n, IsUnit (qInt R δ k)) : TLAlg R δ n := sorry

section JonesWenzl

variable {R : Type u} [CommRing R] {δ : R} {n : ℕ}

/-- The restriction lemma that lets a hypothesis at `n` be reused at any `m ≤ n`. Mechanical,
but every statement below needs it, so it is named once here rather than reproved inline. -/
theorem jonesWenzl_hyp_mono {m n : ℕ} (hmn : m ≤ n)
    (h : ∀ k ∈ Finset.Icc 1 n, IsUnit (qInt R δ k)) :
    ∀ k ∈ Finset.Icc 1 m, IsUnit (qInt R δ k) := sorry

variable (h : ∀ k ∈ Finset.Icc 1 n, IsUnit (qInt R δ k))

theorem jonesWenzl_idem : IsIdempotentElem (jonesWenzl R δ n h) := sorry

theorem star_jonesWenzl : star (jonesWenzl R δ n h) = jonesWenzl R δ n h := sorry

/-- `tr̂ f_n = [n+1]`. -/
theorem diagTrace_jonesWenzl :
    diagTrace R δ n (jonesWenzl R δ n h) = qInt R δ (n + 1) := sorry

end JonesWenzl

section JonesWenzlAnnihilation

variable {R : Type u} [CommRing R] {δ : R} {n : ℕ}
variable (h : ∀ k ∈ Finset.Icc 1 (n + 1), IsUnit (qInt R δ k))

theorem e_mul_jonesWenzl (i : Fin n) : e R δ i * jonesWenzl R δ (n + 1) h = 0 := sorry

theorem jonesWenzl_mul_e (i : Fin n) : jonesWenzl R δ (n + 1) h * e R δ i = 0 := sorry

end JonesWenzlAnnihilation

section JonesWenzlField

variable (K : Type u) [Field K] (δ : K)

/-- Over a field, `f_n` is the unique nonzero idempotent killed on both sides by every
`e_i`. -/
theorem jonesWenzl_unique {n : ℕ} (h : ∀ k ∈ Finset.Icc 1 (n + 1), IsUnit (qInt K δ k))
    (f : TLAlg K δ (n + 1)) (hf : IsIdempotentElem f) (hf0 : f ≠ 0)
    (hl : ∀ i : Fin n, e K δ i * f = 0) (hr : ∀ i : Fin n, f * e K δ i = 0) :
    f = jonesWenzl K δ (n + 1) h := sorry

/-- **The quadratic (Wenzl) recursion**
`f_{n+2} = f_{n+1} − ([n+1]/[n+2])·f_{n+1} e f_{n+1}`. The single-clasp linear recursion
and the coefficient formula (Morrison, arXiv:1503.00384) are companion targets whose Lean
form waits on the tilted-basis bookkeeping; `README.md` is definitive. -/
theorem jonesWenzl_succ (n : ℕ)
    (h : ∀ k ∈ Finset.Icc 1 (n + 2), IsUnit (qInt K δ k))
    (h' : ∀ k ∈ Finset.Icc 1 (n + 1), IsUnit (qInt K δ k)) :
    jonesWenzl K δ (n + 2) h
      = incl K δ (jonesWenzl K δ (n + 1) h')
        - (qInt K δ (n + 1) / qInt K δ (n + 2))
            • (incl K δ (jonesWenzl K δ (n + 1) h') * e K δ (Fin.last n)
                * incl K δ (jonesWenzl K δ (n + 1) h')) := sorry

/-- The partial trace of a Jones–Wenzl projection: `condExp f_{n+1} = ([n+2]/[n+1])·f_n`. -/
theorem condExp_jonesWenzl (n : ℕ)
    (h : ∀ k ∈ Finset.Icc 1 (n + 1), IsUnit (qInt K δ k))
    (h' : ∀ k ∈ Finset.Icc 1 n, IsUnit (qInt K δ k)) :
    condExp K δ n (jonesWenzl K δ (n + 1) h)
      = (qInt K δ (n + 2) / qInt K δ (n + 1)) • jonesWenzl K δ n h' := sorry

end JonesWenzlField

section TensorIdeals

/-- A **tensor ideal**: hom-submodules closed under composition on both sides and under
whiskering. Stated for a general monoidal `S`-linear category rather than for `TLCat` alone,
because Layer 7 has to push it along `Mat_` and `Karoubi` and quotient by it, and because the
same shape is what imposes relations on a presented monoidal category in Layer 2. The two
composition fields are named for which factor lies in the ideal, not for its position in
`f ≫ g`. -/
structure MonoidalIdeal (S : Type*) [CommRing S] (C : Type*) [Category C] [Preadditive C]
    [MonoidalCategory C] [CategoryTheory.Linear S C] where
  /-- The submodule of ideal morphisms in each hom-module. -/
  submod : ∀ X Y : C, Submodule S (X ⟶ Y)
  /-- Post-composing an ideal morphism keeps it in the ideal. -/
  comp_mem_of_mem_left : ∀ {X Y Z : C} (f : X ⟶ Y) (g : Y ⟶ Z),
    f ∈ submod X Y → f ≫ g ∈ submod X Z
  /-- Pre-composing an ideal morphism keeps it in the ideal. -/
  comp_mem_of_mem_right : ∀ {X Y Z : C} (f : X ⟶ Y) (g : Y ⟶ Z),
    g ∈ submod Y Z → f ≫ g ∈ submod X Z
  whiskerLeft_mem : ∀ (W : C) {X Y : C} (f : X ⟶ Y),
    f ∈ submod X Y → W ◁ f ∈ submod (W ⊗ X) (W ⊗ Y)
  whiskerRight_mem : ∀ {X Y : C} (f : X ⟶ Y) (W : C),
    f ∈ submod X Y → f ▷ W ∈ submod (X ⊗ W) (Y ⊗ W)

variable (R : Type u) [CommRing R] (δ : R)

/-- A tensor ideal of `TL(R, δ)` is the special case. -/
abbrev TensorIdeal := MonoidalIdeal R (TLCat R δ)

/-- The negligible ideal: morphisms invisible to the closure pairings. -/
noncomputable def negligibleIdeal : TensorIdeal R δ := sorry

theorem mem_negligibleIdeal_iff (n m : ℕ) (f : (TLCat.of n : TLCat R δ) ⟶ TLCat.of m) :
    f ∈ (negligibleIdeal R δ).submod (TLCat.of n) (TLCat.of m)
      ↔ ∀ g, homPairing R δ n m f g = 0 := sorry

end TensorIdeals

section GoodmanWenzl

/-! Goodman–Wenzl is a characteristic-zero theorem: the appendix it comes from works over `ℂ`,
and in characteristic `p` both the Jones–Wenzl projections and the lattice of tensor ideals
genuinely differ. The hypothesis is carried on the statements rather than assumed away; the
modular theory is declared out of scope in `README.md`. -/

variable (K : Type u) [Field K] [CharZero K] (δ : K)

/-- At quantum order `ℓ` (that is, `[ℓ] = 0` and `[1], …, [ℓ−1]` nonzero), the Jones–Wenzl
projection `f_{ℓ−1}` is negligible (`tr̂ f_{ℓ−1} = [ℓ] = 0`). -/
theorem jonesWenzl_mem_negligibleIdeal (ℓ : ℕ) (h2 : 2 ≤ ℓ)
    (hℓ : qInt K δ ℓ = 0)
    (hjw : ∀ k ∈ Finset.Icc 1 (ℓ - 1), IsUnit (qInt K δ k)) :
    jonesWenzl K δ (ℓ - 1) hjw
      ∈ (negligibleIdeal K δ).submod (TLCat.of (ℓ - 1)) (TLCat.of (ℓ - 1)) := sorry

/-- **Goodman–Wenzl, generation**: at quantum order `ℓ`, any tensor ideal containing
`f_{ℓ−1}` contains every negligible morphism. -/
theorem negligibleIdeal_le_of_jonesWenzl_mem (ℓ : ℕ) (h2 : 2 ≤ ℓ)
    (hℓ : qInt K δ ℓ = 0)
    (hjw : ∀ k ∈ Finset.Icc 1 (ℓ - 1), IsUnit (qInt K δ k))
    (I : TensorIdeal K δ)
    (hI : jonesWenzl K δ (ℓ - 1) hjw
      ∈ I.submod (TLCat.of (ℓ - 1)) (TLCat.of (ℓ - 1))) :
    ∀ X Y, (negligibleIdeal K δ).submod X Y ≤ I.submod X Y := sorry

/-- **Goodman–Wenzl, uniqueness**: at quantum order `ℓ`, every tensor ideal is zero, the
negligible ideal, or everything. -/
theorem tensorIdeal_trichotomy (ℓ : ℕ) (h2 : 2 ≤ ℓ)
    (hℓ : qInt K δ ℓ = 0)
    (hℓ' : ∀ k ∈ Finset.Icc 1 (ℓ - 1), qInt K δ k ≠ 0)
    (I : TensorIdeal K δ) :
    (∀ X Y, I.submod X Y = ⊥)
      ∨ (∀ X Y, I.submod X Y = (negligibleIdeal K δ).submod X Y)
      ∨ (∀ X Y, I.submod X Y = ⊤) := sorry

/-- The generic complement: with every quantum integer nonzero the category has no
interesting tensor ideals. -/
theorem tensorIdeal_bot_or_top (hK : ∀ k, 1 ≤ k → qInt K δ k ≠ 0)
    (I : TensorIdeal K δ) :
    (∀ X Y, I.submod X Y = ⊥) ∨ (∀ X Y, I.submod X Y = ⊤) := sorry

end GoodmanWenzl

/-! ## Layer 7: the envelope, and the Karoubi envelope of `TL`

The root-of-unity quotient, the semisimple-category predicate, and the fusion summit are
specified in `README.md`; their Lean forms depend on infrastructure this roadmap itself
creates, so they are not pinned here. What *is* pinned here is that infrastructure, because
its absence is easy to miss: Mathlib supplies `Mat_` and `Karoubi` as **plain categories
only**, with no monoidal and no `Linear` structure on either. -/

section Envelope

open CategoryTheory.Idempotents

universe v u₁

variable (S : Type*) [CommRing S]
variable (C : Type u₁) [Category.{v} C] [Preadditive C] [MonoidalCategory C]
  [MonoidalPreadditive C]

/-- **Reusable infrastructure, not `TL`-specific**: the monoidal structure induced on the
additive envelope. Nothing in Mathlib provides this. -/
noncomputable instance : MonoidalCategory (Mat_ C) := sorry

/-- And on the idempotent completion. -/
noncomputable instance : MonoidalCategory (Karoubi C) := sorry

/-- The `S`-linear structures likewise: Layer 7 promises a `K`-linear fusion category, and a
monoidal instance alone does not give one. -/
noncomputable instance [CategoryTheory.Linear S C] : CategoryTheory.Linear S (Mat_ C) := sorry

noncomputable instance [CategoryTheory.Linear S C] :
    CategoryTheory.Linear S (Karoubi C) := sorry

/-- Rigidity descends too; this is what lets Layer 7 speak of duals and quantum dimensions in
the envelope at all. -/
noncomputable instance [RigidCategory C] : RigidCategory (Karoubi (Mat_ C)) := sorry

variable [CategoryTheory.Linear S C]

/-- Extension of an ideal along the additive envelope, and along the idempotent completion.
Layer 6 builds `negligibleIdeal` inside `TLCat`; the quotient below is taken in
`Karoubi (Mat_ TLCat)`, and the passage between them is not automatic. -/
noncomputable def MonoidalIdeal.mat (I : MonoidalIdeal S C) : MonoidalIdeal S (Mat_ C) := sorry

noncomputable def MonoidalIdeal.karoubi (I : MonoidalIdeal S C) :
    MonoidalIdeal S (Karoubi C) := sorry

/-- **The quotient.** Mathlib has general categorical quotients but no monoidal quotient. -/
def MonoidalQuotient (I : MonoidalIdeal S C) : Type u₁ := sorry

noncomputable instance (I : MonoidalIdeal S C) : Category.{v} (MonoidalQuotient S C I) := sorry
noncomputable instance (I : MonoidalIdeal S C) :
    Preadditive (MonoidalQuotient S C I) := sorry
noncomputable instance (I : MonoidalIdeal S C) :
    CategoryTheory.Linear S (MonoidalQuotient S C I) := sorry
noncomputable instance (I : MonoidalIdeal S C) :
    MonoidalCategory (MonoidalQuotient S C I) := sorry

/-- The quotient functor, full and identity-on-objects, killing exactly `I`. -/
noncomputable def toMonoidalQuotient (I : MonoidalIdeal S C) :
    C ⥤ MonoidalQuotient S C I := sorry

/-- Rigidity descends. So do the pivotal, spherical, braided and ribbon structures, against the
pivotal and spherical categories roadmap's definitions; those are companion targets whose Lean
form waits on that roadmap, and `README.md` is definitive for them. -/
noncomputable instance (I : MonoidalIdeal S C) [RigidCategory C] :
    RigidCategory (MonoidalQuotient S C I) := sorry

/-- Quotienting can destroy idempotent completeness, so it has to be recovered. -/
instance (I : MonoidalIdeal S C) [IsIdempotentComplete C] :
    IsIdempotentComplete (MonoidalQuotient S C I) := sorry

end Envelope

section Karoubi

open CategoryTheory.Idempotents

/-- The additive Karoubi envelope of the Temperley–Lieb category: idempotent-complete and
additive, the home of the Jones–Wenzl images. Its monoidal, linear and rigid structure comes
from the `Envelope` section above, not from Mathlib. -/
abbrev TLKar (K : Type u) [Field K] (δ : K) :=
  Karoubi (Mat_ (TLCat K δ))

variable (K : Type u) [Field K] (δ : K)

instance : HasBinaryBiproducts (TLKar K δ) := sorry

/-- The image `X_n` of the Jones–Wenzl projection `f_n` in the Karoubi envelope, in the
generic case where every `f_n` exists. -/
noncomputable def jwObject (hδ : ∀ k, 1 ≤ k → qInt K δ k ≠ 0) (n : ℕ) :
    TLKar K δ := sorry

/-- Generic case: the Jones–Wenzl images are simple. -/
theorem simple_jwObject (hδ : ∀ k, 1 ≤ k → qInt K δ k ≠ 0) (n : ℕ) :
    Simple (jwObject K δ hδ n) := sorry

/-- Generic case: they exhaust the simples. Semisimplicity (every object a finite biproduct
of these) and the general Clebsch–Gordan decomposition are companion targets. -/
theorem exists_iso_jwObject (hδ : ∀ k, 1 ≤ k → qInt K δ k ≠ 0) (X : TLKar K δ)
    (hX : Simple X) : ∃ n, Nonempty (X ≅ jwObject K δ hδ n) := sorry

/-- **Clebsch–Gordan**, the generating case: `X_{n+1} ⊗ X_1 ≅ X_n ⊞ X_{n+2}`. -/
noncomputable def clebschGordanOne (hδ : ∀ k, 1 ≤ k → qInt K δ k ≠ 0) (n : ℕ) :
    jwObject K δ hδ (n + 1) ⊗ jwObject K δ hδ 1
      ≅ jwObject K δ hδ n ⊞ jwObject K δ hδ (n + 2) := sorry

end Karoubi

end TauCetiRoadmap.TemperleyLieb
