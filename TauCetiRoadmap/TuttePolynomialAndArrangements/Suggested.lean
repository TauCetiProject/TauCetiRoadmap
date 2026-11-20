import Mathlib
import TauCeti.RepresentationTheory.Quiver.Zigzag.Orientation

/-!
# The Tutte polynomial and hyperplane arrangements: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
few definitions they need; every definition has a real body. Every headline theorem of the README
is statable at the pins and is stated here. The README's remaining targets, API lists and Checks
are not restated.

Matroids are Mathlib's `Matroid α` with a finite ground set (`[M.Finite]`); the rank of a set `A`
is the natural number `(M.eRk A).toNat`, deletion and contraction of an element `e` are
`M ＼ {e}` and `M ／ {e}`, and loops, coloops and circuits are Mathlib's. The Tutte polynomial is
an element of `MvPolynomial (Fin 2) ℤ`, with `X 0` the variable `x` and `X 1` the variable `y`.
Graphs are Mathlib's `SimpleGraph V`, on a finite vertex type except in the existence of the cycle
matroid; the number of connected components of the spanning subgraph with edge set `A` is
`numComponents A`. Orientations of a graph are Tau
Ceti's `TauCeti.DoubledQuiver.Orientation`, acyclic when their quiver is `TauCeti.Quiver.IsAcyclic`.
A real hyperplane arrangement is a finite family of affine hyperplanes `{x | a i ⬝ᵥ x = c i}` in
`d → ℝ` with nonzero normals `a i`; repeated hyperplanes are allowed.
-/

noncomputable section

open Finset MvPolynomial
open scoped Matroid

namespace TauCetiRoadmap.TuttePolynomialAndArrangements

/-! ## Layer 1: the Tutte polynomial of a finite matroid -/

section Tutte

variable {α : Type*}

/-- 1.1 The Tutte polynomial of a finite matroid, its rank generating function:
`T_M(x, y) = ∑_{A ⊆ E} (x - 1)^(r(E) - r(A)) (y - 1)^(|A| - r(A))`. -/
def tuttePolynomial (M : Matroid α) [M.Finite] : MvPolynomial (Fin 2) ℤ :=
  ∑ A ∈ M.ground_finite.toFinset.powerset,
    (X 0 - 1) ^ ((M.eRk M.E).toNat - (M.eRk A).toNat) *
      (X 1 - 1) ^ (#A - (M.eRk A).toNat)

/-- 1.2 Deletion–contraction: for an element `e` of the ground set that is neither a loop nor a
coloop, `T_M = T_(M ＼ e) + T_(M ／ e)`. -/
theorem tuttePolynomial_eq_delete_add_contract (M : Matroid α) [M.Finite] {e : α}
    (he : e ∈ M.E) (hl : ¬M.IsLoop e) (hc : ¬M.IsColoop e) :
    tuttePolynomial M = tuttePolynomial (M ＼ {e}) + tuttePolynomial (M ／ {e}) := by
  sorry

/-- 1.2 Deleting a loop: `T_M = y · T_(M ＼ e)`. -/
theorem tuttePolynomial_eq_X_one_mul_of_isLoop (M : Matroid α) [M.Finite] {e : α}
    (he : M.IsLoop e) : tuttePolynomial M = X 1 * tuttePolynomial (M ＼ {e}) := by
  sorry

/-- 1.2 Contracting a coloop: `T_M = x · T_(M ／ e)`. -/
theorem tuttePolynomial_eq_X_zero_mul_of_isColoop (M : Matroid α) [M.Finite] {e : α}
    (he : M.IsColoop e) : tuttePolynomial M = X 0 * tuttePolynomial (M ／ {e}) := by
  sorry

/-- 1.3 Duality: `T_(M✶)(x, y) = T_M(y, x)`. -/
theorem tuttePolynomial_dual (M : Matroid α) [M.Finite] :
    tuttePolynomial M✶ = rename (Equiv.swap (0 : Fin 2) 1) (tuttePolynomial M) := by
  sorry

/-- 1.4 Universality of the Tutte polynomial (Brylawski's recipe theorem), in a form without
division. Let `f` assign to every matroid on a finite type `α` a value in a commutative ring, with
`f M = 1` when the ground set is empty, `f M = y₀ · f (M ＼ e)` for a loop `e`,
`f M = x₀ · f (M ／ e)` for a coloop `e`, and `f M = a · f (M ＼ e) + b · f (M ／ e)` for an
element `e` that is neither. Then
`f M = ∑_{A ⊆ E} a^((|E| - |A|) - (r(E) - r(A))) b^(r(A)) (x₀ - b)^(r(E) - r(A)) (y₀ - a)^(|A| - r(A))`,
which is `a^(|E| - r(E)) b^(r(E)) T_M(x₀ / b, y₀ / a)` when `a` and `b` are units. -/
theorem eq_sum_of_tutteGrothendieck [Finite α] {R : Type*} [CommRing R]
    (f : Matroid α → R) (a b x₀ y₀ : R)
    (h_empty : ∀ M : Matroid α, M.E = ∅ → f M = 1)
    (h_loop : ∀ (M : Matroid α) (e : α), M.IsLoop e → f M = y₀ * f (M ＼ {e}))
    (h_coloop : ∀ (M : Matroid α) (e : α), M.IsColoop e → f M = x₀ * f (M ／ {e}))
    (h_dc : ∀ (M : Matroid α) (e : α), e ∈ M.E → ¬M.IsLoop e → ¬M.IsColoop e →
      f M = a * f (M ＼ {e}) + b * f (M ／ {e}))
    (M : Matroid α) :
    f M = ∑ A ∈ M.ground_finite.toFinset.powerset,
      a ^ ((M.ground_finite.toFinset.card - #A) - ((M.eRk M.E).toNat - (M.eRk A).toNat)) *
        b ^ (M.eRk A).toNat * (x₀ - b) ^ ((M.eRk M.E).toNat - (M.eRk A).toNat) *
          (y₀ - a) ^ (#A - (M.eRk A).toNat) := by
  sorry

/-- 1.5 `T_M(1, 1)` is the number of bases of `M`. -/
theorem eval_tuttePolynomial_one_one (M : Matroid α) [M.Finite] :
    eval ![1, 1] (tuttePolynomial M) = ({B | M.IsBase B}.ncard : ℤ) := by
  sorry

/-- 1.5 `T_M(2, 1)` is the number of independent sets of `M`. -/
theorem eval_tuttePolynomial_two_one (M : Matroid α) [M.Finite] :
    eval ![2, 1] (tuttePolynomial M) = ({I | M.Indep I}.ncard : ℤ) := by
  sorry

end Tutte

/-! ## Layer 2: the characteristic polynomial and broken circuits -/

section Characteristic

variable {α : Type*}

/-- 2.1 The characteristic polynomial of a finite matroid in Whitney's form,
`χ_M(q) = ∑_{A ⊆ E} (-1)^|A| q^(r(E) - r(A))`. -/
def characteristicPolynomial (M : Matroid α) [M.Finite] : Polynomial ℤ :=
  ∑ A ∈ M.ground_finite.toFinset.powerset,
    (-1) ^ #A * Polynomial.X ^ ((M.eRk M.E).toNat - (M.eRk A).toNat)

/-- 2.2 For a linear order on `α`, a broken circuit of `M` is a circuit with its largest element
removed. -/
def IsBrokenCircuit [LinearOrder α] (M : Matroid α) (S : Finset α) : Prop :=
  ∃ C : Finset α, M.IsCircuit C ∧ ∃ h : C.Nonempty, S = C.erase (C.max' h)

open Classical in
/-- 2.2 Whitney's broken circuit theorem for matroids: `χ_M(q) = ∑_S (-1)^|S| q^(r(E) - |S|)`, the
sum over the subsets `S` of the ground set that contain no broken circuit. So
`(-1)^i` times the coefficient of `q^(r(E) - i)` is the number of such sets with `i` elements. -/
theorem characteristicPolynomial_eq_sum_noBrokenCircuit [LinearOrder α] (M : Matroid α)
    [M.Finite] :
    characteristicPolynomial M =
      ∑ S ∈ M.ground_finite.toFinset.powerset with ∀ T ⊆ S, ¬IsBrokenCircuit M T,
        (-1) ^ #S * Polynomial.X ^ ((M.eRk M.E).toNat - #S) := by
  sorry

end Characteristic

/-! ## Layer 3: real hyperplane arrangements -/

section Arrangements

/-- 3.1 A real hyperplane arrangement in `d → ℝ`: hyperplanes `{x | normal i ⬝ᵥ x = offset i}`
indexed by `ι`, with nonzero normals. -/
structure Arrangement (ι d : Type*) where
  /-- The normal vector of the `i`-th hyperplane. -/
  normal : ι → d → ℝ
  /-- The right-hand side of the equation of the `i`-th hyperplane. -/
  offset : ι → ℝ
  /-- Every normal vector is nonzero. -/
  normal_ne_zero : ∀ i, normal i ≠ 0

namespace Arrangement

variable {ι d : Type*} [Fintype ι] [Fintype d] (A : Arrangement ι d)

/-- 3.1 The intersection of the hyperplanes indexed by `B`; the whole space when `B = ∅`. -/
def flat (B : Finset ι) : Set (d → ℝ) :=
  {x | ∀ i ∈ B, A.normal i ⬝ᵥ x = A.offset i}

/-- 3.1 The complement of the union of the hyperplanes. -/
def complement : Set (d → ℝ) :=
  {x | ∀ i, A.normal i ⬝ᵥ x ≠ A.offset i}

/-- 3.1 The regions: the connected components of the complement. -/
def regions : Set (Set (d → ℝ)) :=
  {R | ∃ x ∈ A.complement, R = connectedComponentIn A.complement x}

/-- 3.1 The intersection poset `L(A)`: the nonempty intersections of hyperplanes of `A`,
ordered by reverse inclusion, so that the whole space is its least element. -/
def IntersectionPoset : Set (Set (d → ℝ))ᵒᵈ :=
  Set.range fun B : {B : Finset ι // (A.flat B).Nonempty} ↦ OrderDual.toDual (A.flat B.1)

instance : Finite A.IntersectionPoset := (Set.finite_range _).to_subtype

instance : Fintype A.IntersectionPoset := Fintype.ofFinite _

instance : LocallyFiniteOrder A.IntersectionPoset := by
  classical
  exact Fintype.toLocallyFiniteOrder

/-- 3.1 The whole space as the least element of the intersection poset. -/
def IntersectionPoset.space : A.IntersectionPoset :=
  ⟨OrderDual.toDual (A.flat ∅), ⟨∅, by simp [flat]⟩, rfl⟩

open Classical in
/-- 3.1 The characteristic polynomial `χ_A(q) = ∑_{X ∈ L(A)} μ(ℝ^d, X) q^(dim X)`, with `μ` the
Möbius function of the intersection poset and `dim X` the dimension of the direction of `X`. -/
def charPoly : Polynomial ℤ :=
  ∑ X : A.IntersectionPoset,
    Polynomial.C (IncidenceAlgebra.mu ℤ (IntersectionPoset.space A) X) *
      Polynomial.X ^ Module.finrank ℝ (vectorSpan ℝ (OrderDual.ofDual X.1))

open Classical in
/-- 3.2 Whitney's theorem for arrangements: `χ_A(q) = ∑_B (-1)^|B| q^(dim ∩B)`, the sum over the
subfamilies `B` whose hyperplanes have a common point. -/
theorem charPoly_eq_sum (A : Arrangement ι d) :
    A.charPoly = ∑ B ∈ (univ : Finset (Finset ι)) with (A.flat B).Nonempty,
      (-1) ^ #B * Polynomial.X ^ Module.finrank ℝ (vectorSpan ℝ (A.flat B)) := by
  sorry

/-- 3.3 Zaslavsky's theorem: an arrangement in `ℝ^n` has finitely many regions, and
`(-1)^n χ_A(-1)` of them. -/
theorem regions_finite_and_ncard (A : Arrangement ι d) :
    A.regions.Finite ∧ (A.regions.ncard : ℤ) = (-1) ^ Fintype.card d * A.charPoly.eval (-1) := by
  sorry

/-- 3.3 Zaslavsky's theorem for relatively bounded regions: if `W` is the span of the normals and
`r` its dimension, the rank of `A`, then exactly `(-1)^r χ_A(1)` regions `R` have `R ∩ W`
bounded. When `A` is essential (`W` is the whole space) these are the bounded regions. -/
theorem ncard_relativelyBounded_regions (A : Arrangement ι d) :
    ({R ∈ A.regions |
        Bornology.IsBounded (R ∩ (Submodule.span ℝ (Set.range A.normal) : Set (d → ℝ)))}.ncard :
        ℤ) =
      (-1) ^ Module.finrank ℝ (Submodule.span ℝ (Set.range A.normal)) * A.charPoly.eval 1 := by
  sorry

end Arrangement

end Arrangements

/-! ## Layer 4: graphs: colourings, acyclic orientations and flows -/

section Graphs

variable {V : Type*}

/-- 4.1 The number of connected components of the spanning subgraph of the complete vertex set
`V` with edge set `A`. -/
def numComponents (A : Set (Sym2 V)) : ℕ :=
  Nat.card (SimpleGraph.fromEdgeSet A).ConnectedComponent

/-- 4.1 `M` is the cycle matroid of `G`: its ground set is the edge set of `G` and its independent
sets are the edge sets of the forests of `G`. -/
def IsGraphicMatroid (M : Matroid (Sym2 V)) (G : SimpleGraph V) : Prop :=
  M.E = G.edgeSet ∧ ∀ I, M.Indep I ↔ I ⊆ G.edgeSet ∧ (SimpleGraph.fromEdgeSet I).IsAcyclic

/-- 4.1 Every simple graph has a cycle matroid. -/
theorem exists_isGraphicMatroid (G : SimpleGraph V) :
    ∃ M : Matroid (Sym2 V), IsGraphicMatroid M G := by
  sorry

variable [Fintype V]

/-- 4.1 The rank of a set `A` of edges in the cycle matroid is `|V| - c(A)`. -/
theorem IsGraphicMatroid.eRk_add_numComponents {M : Matroid (Sym2 V)} {G : SimpleGraph V}
    (hM : IsGraphicMatroid M G) {A : Set (Sym2 V)} (hA : A ⊆ G.edgeSet) :
    M.eRk A + numComponents A = Fintype.card V := by
  sorry

/-- 4.2 The chromatic polynomial of `G` in Whitney's form,
`P_G(q) = ∑_{A ⊆ E(G)} (-1)^|A| q^(c(A))`. -/
def chromaticPolynomial (G : SimpleGraph V) [DecidableRel G.Adj] : Polynomial ℤ :=
  ∑ A ∈ G.edgeFinset.powerset, (-1) ^ #A * Polynomial.X ^ numComponents (A : Set (Sym2 V))

/-- 4.2 For every natural number `k`, `P_G(k)` is the number of proper colourings of `G` with `k`
colours. -/
theorem eval_chromaticPolynomial (G : SimpleGraph V) [DecidableRel G.Adj] (k : ℕ) :
    (chromaticPolynomial G).eval (k : ℤ) = Nat.card (G.Coloring (Fin k)) := by
  sorry

/-- 4.2 The chromatic polynomial as an evaluation of the Tutte polynomial of the cycle matroid:
`P_G(q) = (-1)^(|V| - c(G)) q^(c(G)) T_M(1 - q, 0)`. -/
theorem chromaticPolynomial_eq_tuttePolynomial {G : SimpleGraph V} [DecidableRel G.Adj]
    {M : Matroid (Sym2 V)} (hM : IsGraphicMatroid M G) :
    chromaticPolynomial G =
      (-1) ^ (Fintype.card V - numComponents G.edgeSet) *
        Polynomial.X ^ numComponents G.edgeSet *
          aeval ![1 - Polynomial.X, 0] (tuttePolynomial M) := by
  sorry

section Graphic

variable [LinearOrder V]

/-- 4.3 The graphic arrangement of `G`: the hyperplanes `x u = x v`, one for each edge `uv` with
`u < v`. -/
def graphicArrangement (G : SimpleGraph V) :
    Arrangement {p : V × V // p.1 < p.2 ∧ G.Adj p.1 p.2} V where
  normal p := Pi.single p.1.1 1 - Pi.single p.1.2 1
  offset _ := 0
  normal_ne_zero p h := by
    have := congrFun h p.1.1
    simp [p.2.1.ne] at this

/-- 4.3 The characteristic polynomial of the graphic arrangement is the chromatic polynomial. -/
theorem charPoly_graphicArrangement (G : SimpleGraph V) [DecidableRel G.Adj] :
    (graphicArrangement G).charPoly = chromaticPolynomial G := by
  sorry

end Graphic

/-- 4.4 Stanley's theorem: the number of acyclic orientations of `G` is `(-1)^|V| P_G(-1)`. -/
theorem ncard_isAcyclic_orientation (G : SimpleGraph V) [DecidableRel G.Adj] :
    ({o : TauCeti.DoubledQuiver.Orientation G |
        TauCeti.Quiver.IsAcyclic (TauCeti.DoubledQuiver.OrientedQuiver G o)}.ncard : ℤ) =
      (-1) ^ Fintype.card V * (chromaticPolynomial G).eval (-1) := by
  sorry

/-- 4.5 A nowhere-zero `ℤ/k`-flow of `G`, written without choosing an orientation: a function
`f` on ordered pairs of vertices that vanishes off the edges, is skew-symmetric, is nonzero on
every edge and sums to zero around every vertex. Fixing an orientation and keeping the values on
the chosen direction of each edge identifies these with the nowhere-zero flows of that
orientation. -/
def IsNowhereZeroFlow (G : SimpleGraph V) (k : ℕ) (f : V → V → ZMod k) : Prop :=
  (∀ u v, ¬G.Adj u v → f u v = 0) ∧ (∀ u v, f v u = -f u v) ∧
    (∀ u v, G.Adj u v → f u v ≠ 0) ∧ ∀ u, ∑ v, f u v = 0

/-- 4.5 The flow polynomial: for `k ≥ 1`, the number of nowhere-zero `ℤ/k`-flows of `G` is
`(-1)^(|E| - |V| + c(G)) T_M(0, 1 - k)`. -/
theorem card_isNowhereZeroFlow {G : SimpleGraph V} [DecidableRel G.Adj]
    {M : Matroid (Sym2 V)} (hM : IsGraphicMatroid M G) {k : ℕ} (hk : 1 ≤ k) :
    (Nat.card {f : V → V → ZMod k // IsNowhereZeroFlow G k f} : ℤ) =
      (-1) ^ (#G.edgeFinset + numComponents G.edgeSet - Fintype.card V) *
        eval ![0, 1 - (k : ℤ)] (tuttePolynomial M) := by
  sorry

end Graphs

end TauCetiRoadmap.TuttePolynomialAndArrangements
