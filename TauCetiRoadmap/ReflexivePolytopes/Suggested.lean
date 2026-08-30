import Mathlib

/-!
# Targets — reflexive polytopes and Batyrev mirror pairs

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
The statements here suggest Lean forms for particular milestones, so that contributors and
reviewers converge on names and signatures; discharging all of them finishes neither a layer nor
the roadmap.

Representative milestones for layers 0–3 and 6, the combinatorial spine. Layers 4–5 are stated in
`README.md` only: their types are not expressible until the `AnalyticToricGeometry` roadmap's
Layer 0 supplies `Fan` and the toric-cone API, and this repository's policy is that a milestone
whose type cannot yet be written is prose, never a `Prop`-valued placeholder.

## The ambient setup, and why it is shaped this way

`M` and `N` are **distinct** lattices, dual to one another, sitting in **distinct** real vector
spaces `VM` and `VN`, paired by a bilinear form. Polytopes live in `VM`, and their polar duals —
and hence fans — live in `VN`. Getting this wrong is the commonest error in the subject, and it is
not repairable later: a single ambient space with two lattice embeddings silently identifies `M`
with `N` through a Riesz isomorphism, which is extra structure that reflexivity does not have.

Three hypotheses carry the content, and each is load-bearing rather than decorative:

* `IsLatticeEmbedding` pins the images as genuine lattices — injective, discrete, and spanning
  over `ℝ`. This is Mathlib's `IsZLattice` unfolded: that class takes `DiscreteTopology` as an
  instance argument and so cannot be stated bare of one, but the content is the same and an
  implementer should register the instance and use `IsZLattice` directly.
  Without it `Set.range i` is merely an additive image and nothing below is true.
* `pairing.IsPerfPair` makes `VM` and `VN` genuinely dual, so `polarDual` lands in the right space.
* `IsDualLattice` says the two lattices are exact duals under that pairing — integrality in both
  directions. This is what makes `polarDual` of a lattice polytope even a candidate for being a
  lattice polytope, and it is load-bearing rather than cosmetic: take `VM = VN = ℝ` with the
  product pairing, `i` with image `(1/2)ℤ` and `j` with image `ℤ`. Both are perfectly good
  `IsLatticeEmbedding`s — `(1/2)ℤ` is discrete and spanning — but they are not dual to each other
  (the dual of `(1/2)ℤ` is `2ℤ`), and `IsDualLattice` fails already in its first conjunct, since
  `(1/2) · 1 ∉ ℤ`. With that pair `P = [-1, 1]` satisfies every field of `IsReflexive`, yet has
  three interior lattice points `0, ±1/2` rather than one. So `IsLatticeEmbedding` on each side
  separately is not enough; the two lattices must be dual.

Polar duality is taken in the sign convention `P° = {y : ⟪y, x⟫ ≥ -1}`, under which reflexivity
reads as facets at lattice distance one and the anticanonical divisor is the sum of the ray
divisors with coefficient `+1`.
-/

namespace TauCetiRoadmap.ReflexivePolytopes

variable {M N : Type*} [AddCommGroup M] [AddCommGroup N]
variable {VM VN : Type*}
  [NormedAddCommGroup VM] [NormedSpace ℝ VM] [FiniteDimensional ℝ VM]
  [NormedAddCommGroup VN] [NormedSpace ℝ VN] [FiniteDimensional ℝ VN]

/-! ## Layer 0: the lattice setup -/

/-- The image of a lattice embedding, as a `ℤ`-submodule — the carrier `IsZLattice` expects. -/
def latticeSubgroup (i : M →+ VM) : Submodule ℤ VM :=
  LinearMap.range i.toIntLinearMap

/-- **0.0** A lattice embedding: the image is a genuine `ℤ`-lattice — discrete, cocompact and
spanning. This is what `Set.range i` alone does not give. -/
def IsLatticeEmbedding (i : M →+ VM) : Prop :=
  Function.Injective i ∧
    DiscreteTopology (latticeSubgroup i) ∧
    Submodule.span ℝ (latticeSubgroup i : Set VM) = ⊤

/-- **0.0** The two lattices are exact duals under the pairing: pairing one against the other lands
in `ℤ`, and every functional integral on one lattice is realized by the other. Both directions are
needed; the first alone gives only a sublattice of the dual. -/
def IsDualLattice (i : M →+ VM) (j : N →+ VN) (p : VM →ₗ[ℝ] VN →ₗ[ℝ] ℝ) : Prop :=
  (∀ m : M, ∀ n : N, ∃ k : ℤ, p (i m) (j n) = k) ∧
    (∀ y : VN, (∀ m : M, ∃ k : ℤ, p (i m) y = k) → ∃ n : N, y = j n) ∧
    (∀ x : VM, (∀ n : N, ∃ k : ℤ, p x (j n) = k) → ∃ m : M, x = i m)

omit [FiniteDimensional ℝ VM] [FiniteDimensional ℝ VN] in
/-- Duality of lattices is symmetric: the conjuncts of `IsDualLattice` simply permute under
flipping the pairing. Having this means no theorem needs to carry the flipped form as a separate
hypothesis. -/
theorem IsDualLattice.flip {i : M →+ VM} {j : N →+ VN} {p : VM →ₗ[ℝ] VN →ₗ[ℝ] ℝ}
    (hd : IsDualLattice i j p) : IsDualLattice j i p.flip :=
  ⟨fun n m => hd.1 m n, fun y hy => hd.2.2 y hy, fun x hx => hd.2.1 x hx⟩

/-! ## Layer 0: lattice polytopes -/

/-- **0.1** A lattice polytope is the convex hull of a finite set of lattice points. -/
def IsLatticePolytope (i : M →+ VM) (P : Set VM) : Prop :=
  ∃ S : Finset VM, ↑S ⊆ (latticeSubgroup i : Set VM) ∧ P = convexHull ℝ (↑S : Set VM)

theorem IsLatticePolytope.convex {i : M →+ VM} {P : Set VM} (h : IsLatticePolytope i P) :
    Convex ℝ P := sorry

theorem IsLatticePolytope.isCompact {i : M →+ VM} {P : Set VM} (h : IsLatticePolytope i P) :
    IsCompact P := sorry

/-- **0.2** The lattice points of a set. -/
def latticePoints (i : M →+ VM) (P : Set VM) : Set VM := P ∩ (latticeSubgroup i : Set VM)

/-- **0.2** The origin is the only lattice point in the interior. -/
def OriginOnlyInteriorLatticePoint (i : M →+ VM) (P : Set VM) : Prop :=
  latticePoints i (interior P) = {0}

/-- **0.1** A **facet**: a proper exposed face of maximal dimension. Stated as a predicate because
the naive "nonempty exposed face" includes `P` itself, and no functional is constantly `-1` on a
full-dimensional `P` — a facet characterization quantified over all exposed faces is unprovable. -/
def IsFacet (P F : Set VM) : Prop :=
  IsExposed ℝ P F ∧ F.Nonempty ∧ F ≠ P ∧
    ∀ G, IsExposed ℝ P G → G ≠ P → F ⊆ G → F = G

/-! ## Layer 1: polar duality -/

/-- **1.1** The polar dual of `P ⊆ VM`, living in `VN`, in the `⟪y, x⟫ ≥ -1` convention. -/
def polarDual (p : VM →ₗ[ℝ] VN →ₗ[ℝ] ℝ) (P : Set VM) : Set VN :=
  {y | ∀ x ∈ P, -1 ≤ p x y}

theorem convex_polarDual (p : VM →ₗ[ℝ] VN →ₗ[ℝ] ℝ) (P : Set VM) :
    Convex ℝ (polarDual p P) := sorry

theorem isClosed_polarDual (p : VM →ₗ[ℝ] VN →ₗ[ℝ] ℝ) (P : Set VM) :
    IsClosed (polarDual p P) := sorry

theorem polarDual_antitone (p : VM →ₗ[ℝ] VN →ₗ[ℝ] ℝ) {P Q : Set VM} (h : P ⊆ Q) :
    polarDual p Q ⊆ polarDual p P := sorry

/-- The polar dual taken back from `VN` to `VM`, through the flipped pairing. -/
def polarDual' (p : VM →ₗ[ℝ] VN →ₗ[ℝ] ℝ) (Q : Set VN) : Set VM :=
  {x | ∀ y ∈ Q, -1 ≤ p x y}

/-- **1.2** The bipolar identity. Needs the pairing to be perfect: with a degenerate pairing the
double dual collapses a subspace. -/
theorem polarDual'_polarDual (p : VM →ₗ[ℝ] VN →ₗ[ℝ] ℝ) (hp : p.IsPerfPair) {P : Set VM}
    (hconv : Convex ℝ P) (hcomp : IsCompact P) (hzero : (0 : VM) ∈ interior P) :
    polarDual' p (polarDual p P) = P := sorry

/-- **1.1** The dual of a compact set with the origin interior is compact. -/
theorem isCompact_polarDual (p : VM →ₗ[ℝ] VN →ₗ[ℝ] ℝ) (hp : p.IsPerfPair) {P : Set VM}
    (hcomp : IsCompact P) (hzero : (0 : VM) ∈ interior P) :
    IsCompact (polarDual p P) := sorry

/-! ## Layer 2: reflexivity -/

/-- **2.1** A reflexive polytope. Note that `0 ∈ interior P` already forces `P` to be
full-dimensional, so full-dimensionality is not a separate hypothesis. -/
structure IsReflexive (i : M →+ VM) (j : N →+ VN) (p : VM →ₗ[ℝ] VN →ₗ[ℝ] ℝ) (P : Set VM) :
    Prop where
  latticePolytope : IsLatticePolytope i P
  originInterior : (0 : VM) ∈ interior P
  dualLatticePolytope : IsLatticePolytope j (polarDual p P)

/-- **2.2** The facet-distance characterization: `P` is reflexive exactly when every **facet** lies
on a hyperplane `⟪u, ·⟫ = -1` with `u` in the dual lattice. Quantifying over facets rather than
over all exposed faces is essential — see `IsFacet`. -/
theorem isReflexive_iff_facets_lattice_distance_one
    (i : M →+ VM) (j : N →+ VN) (p : VM →ₗ[ℝ] VN →ₗ[ℝ] ℝ)
    (hi : IsLatticeEmbedding i) (hj : IsLatticeEmbedding j)
    (hp : p.IsPerfPair) (hd : IsDualLattice i j p)
    (P : Set VM) (hP : IsLatticePolytope i P) (hzero : (0 : VM) ∈ interior P) :
    IsReflexive i j p P ↔
      ∀ F, IsFacet P F → ∃ u ∈ (latticeSubgroup j : Set VN), ∀ x ∈ F, p x u = (-1 : ℝ) := sorry

/-- **2.3** Reflexivity implies the origin is the unique interior lattice point. `IsDualLattice` is
load-bearing here, not just `IsLatticeEmbedding` on each side: the non-dual pair `((1/2)ℤ, ℤ)` in
`ℝ` refutes the statement, and both of its embeddings are genuine lattices. See the module
docstring. The converse fails in dimension three and above; see
*Statements that must not enter the library*. -/
theorem IsReflexive.originOnlyInteriorLatticePoint
    {i : M →+ VM} {j : N →+ VN} {p : VM →ₗ[ℝ] VN →ₗ[ℝ] ℝ}
    (hi : IsLatticeEmbedding i) (hj : IsLatticeEmbedding j) (hd : IsDualLattice i j p)
    {P : Set VM} (h : IsReflexive i j p P) :
    OriginOnlyInteriorLatticePoint i P := sorry

/-! ## Layer 3: the mirror involution -/

/-- **3.1** The dual of a reflexive polytope is reflexive, with the roles of the two lattices
exchanged. Stated with the flipped pairing, since `polarDual p P` lives in `VN`. -/
theorem IsReflexive.dual {i : M →+ VM} {j : N →+ VN} {p : VM →ₗ[ℝ] VN →ₗ[ℝ] ℝ}
    (hp : p.IsPerfPair) (hd : IsDualLattice i j p)
    {P : Set VM} (h : IsReflexive i j p P) :
    IsReflexive j i p.flip (polarDual p P) := sorry

/-- **3.1** Polar duality is an involution on reflexive polytopes. -/
theorem IsReflexive.dual_dual {i : M →+ VM} {j : N →+ VN} {p : VM →ₗ[ℝ] VN →ₗ[ℝ] ℝ}
    (hp : p.IsPerfPair) {P : Set VM} (h : IsReflexive i j p P) :
    polarDual' p (polarDual p P) = P := sorry

/-- **3.2** The dual face of a face of `P`. -/
def dualFace (p : VM →ₗ[ℝ] VN →ₗ[ℝ] ℝ) (P F : Set VM) : Set VN :=
  {y ∈ polarDual p P | ∀ x ∈ F, p x y = (-1 : ℝ)}

theorem dualFace_antitone (p : VM →ₗ[ℝ] VN →ₗ[ℝ] ℝ) {P F G : Set VM} (h : F ⊆ G) :
    dualFace p P G ⊆ dualFace p P F := sorry

/-- **3.2** The face correspondence is involutive on faces of a reflexive polytope. -/
theorem dualFace_dualFace {i : M →+ VM} {j : N →+ VN} {p : VM →ₗ[ℝ] VN →ₗ[ℝ] ℝ}
    (hp : p.IsPerfPair) {P F : Set VM} (h : IsReflexive i j p P) (hF : IsExposed ℝ P F) :
    dualFace p.flip (polarDual p P) (dualFace p P F) = F := sorry

/-! ## Layer 6: the Batyrev pairing

Layers 4 and 5 — face fans, normal fans, toric divisors and the class group — are stated in
`README.md` only, pending the `Fan` API from the `AnalyticToricGeometry` roadmap. -/

/-- **6.2** The Batyrev mirror of a reflexive polytope is its polar dual. -/
def batyrevMirror (i : M →+ VM) (j : N →+ VN) (p : VM →ₗ[ℝ] VN →ₗ[ℝ] ℝ)
    (hp : p.IsPerfPair) (hd : IsDualLattice i j p)
    (P : {P : Set VM // IsReflexive i j p P}) :
    {Q : Set VN // IsReflexive j i p.flip Q} :=
  ⟨polarDual p P.1, P.2.dual hp hd⟩

/-- **6.2 — the summit, combinatorial half.** The Batyrev mirror map is an involution. -/
theorem batyrevMirror_batyrevMirror (i : M →+ VM) (j : N →+ VN) (p : VM →ₗ[ℝ] VN →ₗ[ℝ] ℝ)
    (hp : p.IsPerfPair) (hd : IsDualLattice i j p)
    (P : {P : Set VM // IsReflexive i j p P}) :
    (batyrevMirror j i p.flip hp.flip hd.flip (batyrevMirror i j p hp hd P)).1 = P.1 := sorry

end TauCetiRoadmap.ReflexivePolytopes
