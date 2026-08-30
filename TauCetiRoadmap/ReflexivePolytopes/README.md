# Roadmap: reflexive polytopes and Batyrev mirror pairs

Batyrev's construction is the source of most explicitly known Calabi–Yau manifolds. A reflexive
lattice polytope determines a Gorenstein Fano toric variety whose anticanonical hypersurfaces have
trivial canonical class; polar duality of polytopes exchanges the two members of a mirror pair.
(Calling those hypersurfaces Calabi–Yau outright is too strong for a singular ambient: smoothness
needs nondegeneracy of the generic member and usually a crepant resolution, both out of scope.) The
Kreuzer–Skarke enumeration of the 473,800,776 four-dimensional reflexive polytopes is the standard
supply of Calabi–Yau threefolds in string compactification, and the combinatorics is what everything
downstream is computed from.

Almost all of that is **lattice combinatorics**, not scheme theory. Torus-invariant divisors are
indexed by rays, the class group is the cokernel of a map out of the character lattice, the
anticanonical divisor is the sum of all the rays, reflexivity is a condition on facet lattice
distances, and Batyrev's mirror involution is polar duality. This roadmap builds that combinatorial
core and stops where the scheme theory would begin.

## Summit

**Polar duality is an involution on reflexive polytopes, and it induces Batyrev's mirror pairing.**
Concretely: for a lattice polytope `Δ` with the origin in its interior, `Δ` is reflexive exactly when
its polar dual `Δ°` is again a lattice polytope; then `(Δ°)° = Δ`, faces correspond
inclusion-reversingly with `dim F + dim F° = n − 1`, the face fan of `Δ°` gives a Gorenstein Fano
toric variety, and `(Δ, Δ°)` is the Batyrev mirror pair.

## Scope and completion criterion

The roadmap is complete when Tau Ceti supplies:

1. Lattice polytopes over the character lattice `M`, embedded in `M ⊗ ℝ`, with the face lattice,
   vertices, facets and lattice points, and unimodular equivalence. Facets are a predicate in their
   own right: quantifying over "nonempty exposed faces" admits `Δ` itself, and no functional is
   constantly `−1` on a full-dimensional polytope, so the facet characterization stated that way is
   unprovable.
2. Polar duality for compact convex sets containing the origin in the interior, with the bipolar
   identity, order reversal, and the vertex-facet correspondence.
3. Reflexivity, in the two standard forms — `Δ°` is a lattice polytope, and every facet lies at
   lattice distance one from the origin — proved equivalent.
4. Polar duality as an involution on reflexive polytopes, with the face correspondence and its
   dimension count.
5. The face fan of a reflexive polytope as a complete fan of toric cones, and the normal-fan
   identification `normalFan Δ = faceFan Δ°`.
6. Torus-invariant divisors of a fan as the free abelian group on rays; the divisor exact sequence
   `M → ℤ^{Σ(1)} → Cl(Σ) → 0`; the anticanonical class as the sum of the ray divisors; and the
   characterization of Gorenstein Fano fans as face fans of reflexive polytopes.
7. The Batyrev pairing: the mirror map on reflexive polytopes, its involutivity, and the statement
   that the two anticanonical families are the mirror candidates — as a definition and its
   structural properties, not as a Hodge-theoretic theorem.

**Out of scope.** Hodge numbers of the hypersurfaces and Batyrev's formulas for them; the mirror
conjecture as a statement about Hodge diamonds or quantum cohomology; nef partitions and the
Batyrev–Borisov generalization; maximal projective crepant partial desingularizations; the
Kreuzer–Skarke enumeration itself; coherent sheaf cohomology; symplectic moment maps and the gauged
linear sigma model. These are the natural sequels and each is larger than this roadmap.

## Ownership and dependencies

- **This roadmap owns lattice polytopes, polar duality, reflexivity, and the Batyrev pairing.**
- **The `AnalyticToricGeometry` roadmap owns the cone-and-fan supplier** (`IsToricCone`, `Fan`,
  primitive rays, dual semigroups, affine toric schemes, gluing, subdivisions, fan morphisms). Those
  objects are stated there for *general* toric cones, with regularity only a predicate consumed by
  its analytic layers, so this roadmap consumes them unchanged. It does not consume that roadmap's
  analytic realization: **reflexive polytopes are overwhelmingly singular**, and its complex-manifold
  realization is restricted to regular fans by design.
- **Mathlib owns convex geometry.** Use `convexHull`, `IsExposed`, extreme points, and
  `PointedCone` with its face lattice. A lattice polytope is a predicate on those carriers, not a
  replacement carrier.
- **Tau Ceti owns scheme divisors.** `AlgebraicGeometry.WeilDivisor` and `CartierDivisor` exist and
  are consumed where the toric divisor group is compared to them. The combinatorial divisor group is
  built here and connected to those, not rebuilt inside them.
- **Nothing here claims intersection theory.** Chow groups exist in neither Mathlib nor Tau Ceti nor
  any roadmap. The class group built here is the toric one, presented by generators and relations
  from the fan.

## Pinned conventions

- **Two lattices, named.** `N` is the cocharacter lattice, `M = Hom(N, ℤ)` the character lattice.
  Fans live in `N ⊗ ℝ`, polytopes in `M ⊗ ℝ`. State which lattice every object lives in; the single
  commonest error in this subject is a polytope silently living in the wrong one.
- **Polar duality sign.** `Δ° = {y : ⟨y, x⟩ ≥ −1 for all x ∈ Δ}`, the convention under which
  reflexivity reads "every facet is at lattice distance one" and the anticanonical divisor is the sum
  of the ray divisors with coefficient `+1`. The opposite sign convention (`≤ 1`) appears in the
  literature and differs by a global negation; record the translation once, where the dual is
  defined.
- **Reflexive polytopes contain the origin in their interior**, which already forces
  full-dimensionality — do not carry both as separate hypotheses. Interiority is what makes the
  polar dual bounded, and it is a hypothesis rather than a consequence.
- **Singular by default.** No layer may assume the fan is regular or simplicial. Where a statement
  needs smoothness it says so, and it is then a statement about a proper subclass.

## Statements that must not enter the library

- **"The polar dual of a lattice polytope is a lattice polytope."** False, and its failure is exactly
  what reflexivity asks for. `Δ = conv{(±2, 0), (0, ±1)}` is a lattice polytope containing the origin
  in its interior; the facet through `(2,0)` and `(0,1)` forces the dual vertex `(−1/2, −1)`, which is
  not integral.
- **"A lattice polytope whose only interior lattice point is the origin is reflexive."** False in
  dimension three and above. Reflexivity implies a unique interior lattice point; the converse needs
  the facet-distance condition, which is the actual definition.
- **"The toric variety of a reflexive polytope is smooth."** False, and this is why the analytic
  roadmap's regular-fan restriction does not cover this material. Of the sixteen reflexive polygons
  only five are smooth Fano; in higher dimension smoothness is rare. Every statement here must hold
  for singular fans.
- **"Reflexivity is preserved by dilation."** False: `kΔ` for `k ≥ 2` acquires interior lattice
  points and its dual `(1/k)Δ°` is not a lattice polytope.
- **"Every Fano toric variety comes from a reflexive polytope."** Gorenstein is needed. Reflexive
  polytopes correspond to *Gorenstein* Fano toric varieties, and dropping that gives the larger class
  of fake-weighted-projective and canonical Fano varieties.
- **"Mirror symmetry is an isomorphism."** The pairing is a duality on polytopes, and the geometric
  statement it is evidence for is about Hodge numbers of two different families. Nothing here asserts
  the varieties are related by a map.
- **"The face fan of the square is the fan of `ℙ¹ × ℙ¹`."** False, and the error is invisible
  without computing a determinant. The square `conv{(±1,±1)}` has adjacent primitive rays of
  determinant `2`, so its face fan is singular; `ℙ¹ × ℙ¹` comes from the face fan of the polar dual
  diamond `conv{±e₁, ±e₂}`. Face fan and normal fan of a reflexive polytope are exchanged by
  duality, and confusing them is the standard way to state a false acceptance criterion.
- **"`Δ` determines its Calabi–Yau."** The anticanonical family is a linear system; its generic
  member is the object of interest, and singular members exist. State the family, not "the"
  hypersurface.

## The build, in layers

### Layer 0: lattice polytopes

Consumes Mathlib's `convexHull` and extreme-point API.

- **0.1** `IsLatticePolytope i P`: `P` is the convex hull of a finite set of lattice points, for a
  lattice embedding `i : M →+ VM` of the character lattice. Vertices, faces as exposed subsets, facets, and the face lattice.
  Prove faces of lattice polytopes are lattice polytopes.
- **0.2** Lattice points of a polytope; interior lattice points; the predicate "the origin is the
  unique interior lattice point".
- **0.3** Unimodular equivalence: the action of `GL(N)` on lattice polytopes, preservation of the
  face lattice, of lattice-point counts, and of everything below.

*Acceptance:* the standard simplex and the cube are lattice polytopes with the expected vertex
counts; unimodular images agree.

### Layer 1: polar duality

- **1.1** `polarDual`: for `P ⊆ M_ℝ`, the set `{y ∈ N_ℝ : ⟨y, x⟩ ≥ −1 for all x ∈ P}`. Convexity,
  closedness, order reversal, and boundedness when the origin is interior to `P`.
- **1.2** The bipolar identity `(P°)° = P` for compact convex `P` containing the origin.
- **1.3** The vertex–facet correspondence: vertices of `P°` correspond to facets of `P`, with the
  explicit formula for the dual vertex of a facet.

*Acceptance:* the dual of the unit cube is the cross-polytope, and back.

### Layer 2: reflexivity

- **2.1** `IsReflexive`: `IsLatticePolytope` together with the origin interior and `P°` again a
  lattice polytope.
- **2.2** The facet-distance characterization: `P` is reflexive iff every facet lies in a hyperplane
  `{x : ⟨u, x⟩ = −1}` with `u ∈ N`. This is the working definition and the one to use downstream.
- **2.3** Reflexivity implies the origin is the unique interior lattice point. State the converse as
  false, with the dimension-three refutation recorded rather than proved.
- **2.4** Reflexivity is invariant under unimodular equivalence.

*Acceptance:* `conv{(1,0), (0,1), (−1,−1)}` is reflexive with dual `conv{(−1,−1), (2,−1), (−1,2)}`;
the square and the diamond are reflexive and mutually dual; `conv{(±2,0), (0,±1)}` is **not**
reflexive.

### Layer 3: the mirror involution on polytopes

- **3.1** Polar duality restricts to an involution on reflexive polytopes: if `P` is reflexive so is
  `P°`, and `(P°)° = P` as lattice polytopes.
- **3.2** The face correspondence `F ↦ F° := {y ∈ P° : ⟨y, x⟩ = −1 for all x ∈ F}`, an
  inclusion-reversing bijection between the face lattices with `dim F + dim F° = n − 1`.
- **3.3** Finiteness in each dimension, up to unimodular equivalence — stated, and proved if the
  bounding argument is within reach; otherwise recorded as a target for a later roadmap, since the
  proof is a genuine piece of work and nothing below depends on it.

*Acceptance:* the face correspondence on the reflexive polygons matches vertex counts, and the
dimension count holds; there are sixteen reflexive polygons up to unimodular equivalence.

### Layer 4: fans from polytopes

Consumes `AnalyticToricGeometry` Layer 0.

- **4.1** The face fan of a full-dimensional polytope containing the origin: cones over proper faces.
  Prove it is a `Fan` in the sense of that roadmap, that it is complete, and that it is regular
  exactly in the unimodular case.
- **4.2** The normal fan of a lattice polytope. **Pin the sign here.** The identity in 4.3 holds
  only for the *inner* normal fan — the cone attached to a face `F` is generated by the functionals
  *minimized* on `F`. Under the outward/maximizer convention, which is at least as common in the
  literature, the identity acquires a global negation and `normalFan P = −faceFan P°`. This
  roadmap's `≥ −1` polar forces the inner convention; state the translation where the normal fan is
  defined, exactly as the polar-duality sign is translated.
- **4.3** `normalFan P = faceFan P°` for reflexive `P`, with the inner convention of 4.2. This is
  the bridge that makes the mirror involution visible on the toric side.

*Acceptance:* the face fan of `conv{(1,0),(0,1),(−1,−1)}` is the fan of `ℙ²`; the face fan of the
**diamond** `conv{±e₁, ±e₂}` — equivalently the *normal* fan of the square — is the fan of
`ℙ¹ × ℙ¹`. ⚠ The face fan of the **square** `conv{(±1,±1)}` is **not** that fan and is singular:
adjacent primitive ray generators there have determinant `2`. The square and the diamond are polar
duals of each other, so this is exactly the place where getting the direction wrong is easiest and
least visible.

### Layer 5: toric divisors and the class group

All combinatorial; consumes only the fan.

- **5.1** `ToricDivisor Σ`, the free abelian group on the rays of `Σ`, with the ray divisors `D_ρ`.
- **5.2** The character map `M → ToricDivisor Σ`, `m ↦ Σ_ρ ⟨m, u_ρ⟩ D_ρ`, and the divisor exact
  sequence `M → ToricDivisor Σ → Cl Σ → 0`, with injectivity of the first map when the rays span.
- **5.3** The polytope of a divisor, `P_D = {m : ⟨m, u_ρ⟩ ≥ −a_ρ}`, and its basic properties.
- **5.4** The anticanonical class `−K_Σ = Σ_ρ D_ρ`, and `P_{−K}` for a complete fan.
- **5.5** Comparison with Tau Ceti's `WeilDivisor` on the toric scheme of the fan: the combinatorial
  group maps to torus-invariant Weil divisors, compatibly with the class group.

*Acceptance:* for `ℙⁿ`, `Cl ≅ ℤ` and `−K = (n+1)H`; for `ℙ¹ × ℙ¹`, `Cl ≅ ℤ²`.

### Layer 6: Gorenstein Fano and the Batyrev pairing

- **6.1** A complete fan is **Gorenstein Fano** when `−K` is Cartier and ample. Prove: `Σ` is
  Gorenstein Fano iff `Σ = faceFan P°` for a reflexive `P`, and then `P_{−K} = P`.
- **6.2** `batyrevMirror`, the map `P ↦ P°` on reflexive polytopes, and its involutivity; the
  induced correspondence on Gorenstein Fano fans.
- **6.3** The anticanonical linear system of the toric variety of a reflexive polytope, and the
  **Batyrev mirror pair**: `(P, P°)` with its two anticanonical families, together with the
  statement that the generic member has trivial canonical class. The Calabi–Yau condition is stated
  at the level of the anticanonical class; anything Hodge-theoretic is out of scope.

*Acceptance:* for `P` the reflexive polygon of `ℙ²`, `P_{−K} = P` and the anticanonical family is the
cubics; the mirror of the `ℙ³` polytope is the polytope of the quartic family; `batyrevMirror` applied
twice is the identity.

## Relation to sibling roadmaps

- **AnalyticToricGeometry** supplies Layer 0's cones and fans and is a hard prerequisite. Its
  analytic layers are not consumed: reflexive polytopes give singular fans, outside its regular-fan
  scope. Its Layer 0 is already stated for general toric cones, so no change is asked of it.
- **HodgeStructures** would own anything Hodge-theoretic about the hypersurfaces. Nothing here
  crosses into it, which is why Batyrev's Hodge-number formulas are excluded rather than deferred.
- **AlgebraicCurves** and **EllipticCurves** own divisors on curves; the toric divisor group here is
  presented from the fan and connected to Tau Ceti's scheme divisors, not to theirs.
- No roadmap currently owns **Chow groups or intersection theory**, and this roadmap does not
  introduce them. The class group here is the toric presentation only.

## Ordering

Layers 0–3 are pure lattice combinatorics and depend on nothing outside Mathlib; they can start
immediately and carry the summit's combinatorial half. Layer 4 needs `AnalyticToricGeometry` Layer 0.
Layer 5 needs Layer 4 and, for 5.5 only, Tau Ceti's scheme divisors. Layer 6 needs 3, 4 and 5.

The hardest items are 1.2 (the bipolar identity, if Mathlib's convex-duality API does not already
give it), 2.2 (the equivalence of the two definitions of reflexivity, which is where the lattice
condition does its work) and 6.1 (the Gorenstein Fano characterization). Start each early within its
layer.

## References

- Batyrev, *Dual polyhedra and mirror symmetry for Calabi–Yau hypersurfaces in toric varieties*,
  J. Algebraic Geom. 3 (1994).
- Cox, Little, Schenck, *Toric Varieties*, chapters 2, 4 and 8.
- Kreuzer, Skarke, *Complete classification of reflexive polyhedra in four dimensions*,
  Adv. Theor. Math. Phys. 4 (2000).
- Fulton, *Introduction to Toric Varieties*, chapters 1 and 3.
