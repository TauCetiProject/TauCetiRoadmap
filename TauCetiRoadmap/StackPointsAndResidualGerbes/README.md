# Roadmap: points of algebraic stacks, stabilisers and residual gerbes

**Summary.** This roadmap develops the local structure of an algebraic stack at a point, in the
conventions of the Stacks Project. It starts from the algebraic stacks, inertia stacks, underlying
topological spaces, quotient stacks and quasi-coherent modules of SchemeAndStackFoundations
§§1.18–1.22 and from the site-level gerbes of AlgebraicModuliForArithmeticGeometry §4.1. It builds
monomorphisms, immersions and closed substacks with their quasi-coherent ideals and reduced induced
structures (Layer 0); finite type points and the automorphism group algebraic space `G_x` of a
field-valued point (Layer 1); gerbes as morphisms of algebraic stacks, with the classifying-stack,
flatness, smoothness, inertia and universal-homeomorphism theorems and the dense open gerbe of a
reduced stack with quasi-compact inertia (Layer 2); reduced one-point stacks, their rigidity and the
residual gerbe `𝒵_x` with its characterisation, uniqueness, regularity and functoriality (Layer 3);
the existence of residual gerbes at finite type points, on stacks with a flat locally quasi-finite
presentation, on gerbes, on stacks with quasi-compact inertia and on locally Noetherian stacks, with
the closed-immersion criterion at closed points (Layer 4); decent stacks, the residue field `κ(x)`,
the algebraicity of points (a gerbe over an integral affine scheme through every point of a decent
stack with quasi-compact inertia, immersed quasi-compactly when the diagonal is quasi-compact) and
the fppf image of a representative (Layer 5); the presentation of `𝒵_x` by a representative and its
identification with `BG_x` (Layer 6); and the infinitesimal neighbourhoods, the normal space `N_x`
and its comparison with the tangent space at a closed rational point (Layer 7). The end theorems are the
characterisation of finite type points (1.1, 4.1), the existence of residual gerbes (4.2–4.4), the
residual gerbe as a gerbe over its residue field with `𝒵_x ×_{κ(x)} k ≃ BG_x` (5.3, 6.2, 6.3), the
canonical identification `𝒵_x ≃ BG_x` at every rational point of a stack over a field (6.4), the
closed-immersion criterion at closed points (4.5), and the exact sequence
`0 → T_{BG_x} → T_{𝒳,x} → N_x → 0`, so that `T_{𝒳,x} ≅ N_x` exactly when `G_x` is smooth (7.3).

## Scope and ownership

**This roadmap owns** the following, each at the generality of the Stacks Project:

- properties of algebraic stacks defined by smooth-local properties of schemes, for reducedness and
  regularity (0.1); monomorphisms of algebraic stacks and their characterisation by full
  faithfulness and by the diagonal (0.2); open, closed and locally closed immersions and substacks
  and their description on a presentation (0.3); the correspondence between closed substacks and
  quasi-coherent ideals, and the infinitesimal neighbourhoods of a closed substack (0.4); the
  reduced induced closed substack and the reduction (0.5);
- finite type points (1.1), closed and field-valued points (1.2), the automorphism group algebraic
  space of a field-valued point and the morphisms inducing isomorphisms on it (1.3), and the
  criteria for it to be a scheme (1.4);
- gerbes as morphisms of algebraic stacks (Stacks, Morphisms of Stacks, Section 101.28) and the
  dense open gerbe (Proposition 101.29.1) (Layer 2);
- reduced one-point stacks and residual gerbes (Stacks, Properties of Stacks, Section 100.11;
  Morphisms of Stacks, Sections 101.18, 101.31 and 101.51) (Layers 3–4);
- decent algebraic stacks, the residue field of a point, the algebraicity of points on decent stacks
  with quasi-compact inertia (Morphisms of Stacks, Lemma 101.50.2) and on stacks with quasi-compact
  diagonal (Rydh 2011, Appendix B), and the fppf image of a representative (Layer 5);
- the presentation of a residual gerbe by a representative, its base change to `BG_x`, neutrality
  and rational points (Layer 6);
- the infinitesimal neighbourhoods of a closed point, the normal space `N_x`, and the comparison map
  from the tangent space to the normal space (Layer 7).

Closed substacks, their description on a presentation, their quasi-coherent ideals, the reduced
induced closed substack and the factorisation of morphisms from reduced stacks are owned here for
every algebraic stack (0.3–0.5). The roadmap VirtualFundamentalClasses (under Downstream
consumers) states, in its §1.2, closed substacks of Deligne–Mumford stacks of finite type over a
field with their description on an étale presentation, the reduced induced closed substack and the
factorisation of morphisms from reduced stacks: these are 0.3 and 0.5 for such stacks, owned here
for every algebraic stack. Its closed substacks are closed immersions taken up to equivalence over
the stack, and by 0.3 each such class contains exactly one substack in the sense of Convention 4, so
the two carriers agree. What that roadmap builds on them, intersections and reduced unions,
integral closed substacks, irreducible components, dimension and cycles, is its own; it does not use
the ideals of 0.4. No other roadmap states any of the objects above.
SchemeAndStackFoundations stops at the topological space `|𝒳|`, inertia, `SmoothLocal` morphism
properties, locally Noetherian and separated stacks, presentations and quotient stacks (§§1.19–1.22);
AlgebraicModuliForArithmeticGeometry states gerbes only on a site (§4.1) and uses closed substacks of
Deligne–Mumford stacks without defining them (§5.4). Residual spaces of algebraic spaces (Stacks,
Decent Spaces, Definition 68.13.6) are the residual gerbes of 3.3 on algebraic spaces (3.4); they
have no second carrier.

**Imported, not restated.**

- SchemeAndStackFoundations §§1.18–1.22: stacks in groupoids and 2-fibre products, representable
  morphisms, algebraic and Deligne–Mumford stacks, inertia and `automorphismGroup`, `SmoothLocal`
  and `QuasiCompactStack`, `Stacks.points` with its topology, locally Noetherian and separated
  stacks, smooth presentations, quotient stacks `[U/R]`, `[X/G]` and `BG`, and quasi-coherent
  modules with their description on a presentation (giving `QCoh(BG)` as comodules, Convention 9);
  §§1.7–1.9, 1.13–1.15 and 1.17 for algebraic spaces, group spaces, groupoids, stabilizers, torsors
  and Artin's bootstrap; §1.23's moduli functor for the base of a gerbe; §4.8's infinitesimal
  neighbourhoods `V(I^{n+1})` of a closed subscheme, which 0.4 extends to stacks; §4.12 generic
  flatness.
- Tau Ceti's regular schemes `TauCeti.AlgebraicGeometry.IsRegular`, with ascent of regularity along
  smooth morphisms and its descent along flat surjective morphisms to a locally Noetherian scheme;
  0.1 transfers them to stacks.
- AlgebraicModuliForArithmeticGeometry §4.1: the gerbe predicates `IsGerbe` and `relativeGerbe` on a
  site with base change, composition and descent. A gerbe of algebraic stacks (2.1) is the fppf
  instance of `relativeGerbe`. Bands, banded gerbes and their `H²` classification and rigidification
  stay in that roadmap's Layers 4–5.
- AlgebraicModuliForArithmeticGeometry §§8.1 and 8.3: framed deformation groupoids, the deformation
  functor of a point, the stabiliser action on deformations and the framed tangent exact sequence.
  The tangent space `T_{𝒳,x}` of Layer 7 is that deformation functor on the dual numbers; this
  roadmap owns only the normal space and the comparison map.
- ReductiveGroups Layer 1 with Tau Ceti's `TauCeti.Comodule`: finite-dimensional representations of
  affine group schemes over a field as comodules. Tau Ceti's closed embedding of an affine group of
  finite type into some `GLₙ`, its fppf quotients `G/H` with their torsor property and its
  Lie-dimension smoothness criterion, with the representability of `G/H` from ReductiveGroups Layer 3,
  give the dimension of `T_{BG_x}` in 7.3.

**Owned elsewhere, and outside the scope.** Banded gerbes, their classification and
rigidification belong to AlgebraicModuliForArithmeticGeometry Layers 4–5; where its §5.1 defines the
rigidification `𝒳▹I_𝒳` by the whole inertia, it is the base `𝒳^♭` of 2.1 (2.1's comparison bullet),
which 2.1 builds for every gerbe. Coarse spaces, Keel–Mori and tame stacks belong to
SchemeAndStackFoundations §1.23 and appear here only in Checks. The Luna étale slice theorems of
Alper–Hall–Rydh (Theorems 1.1 and 1.2) are outside the scope of this roadmap: they are stated in the
vocabulary of Layer 7 (the normal space, the stabiliser and the comparison map) and appear here only
in a Check of 7.4.
Dimension theory of stacks is not used: the normal space is finite-dimensional because the ideal of
a closed point pulls back to a finitely generated ideal on a locally Noetherian smooth chart (7.2).

## Conventions

1. **Stacks.** Algebraic stacks are those of SchemeAndStackFoundations §1.19: stacks in groupoids
   on `Scheme.{u}` for the fppf topology with diagonal representable by algebraic spaces and a
   smooth surjective morphism from a scheme. The Lean carrier is §1.18's stack in groupoids: Tau
   Ceti's `TauCeti.AlgebraicGeometry.SchPseudofunctor` with groupoid fibres and Mathlib's
   `CategoryTheory.Pseudofunctor.IsStack` for `AlgebraicGeometry.Scheme.fppfTopology`. Algebraic
   spaces are Tau Ceti's `TauCeti.AlgebraicGeometry.Spaces.IsAlgebraicSpace`, viewed as stacks in
   setoids. Notions are absolute unless a base is named, as in Stacks, Definition 101.4.2 (5)–(8);
   a stack over a scheme `S` is a stack with a 1-morphism to `S`. "Isomorphic" means equivalent and
   "fibre product" means the 2-fibre product of §1.18.
2. **Points.** `|𝒳|` is §1.20's `Stacks.points 𝒳` and `|f|` its functoriality. A field-valued point
   `x : Spec K → 𝒳` is an object of the fibre over `Spec K`; it is a *representative* of its class
   in `|𝒳|`.
3. **Morphism properties.** For `f` representable by algebraic spaces and `P` a property of
   morphisms of algebraic spaces stable under base change and fppf local on the target, "`f` has
   `P`" is §1.19's `RepresentableProperty P f`. For arbitrary `f`, flat, locally of finite
   presentation, locally of finite type and smooth are §1.20's `SmoothLocal`, surjective means `|f|`
   surjective and quasi-compact is §1.20's `QuasiCompactStack`. "The inertia `I_𝒳 → 𝒳` is
   quasi-compact, quasi-separated or locally separated", and the same of the diagonal, are
   `RepresentableProperty` of §1.9's `QuasiCompactSpace`, `QuasiSeparatedSpace` or
   `LocallySeparatedSpace` (the diagonal of the morphism of algebraic spaces is an immersion) for
   these representable morphisms; the three are stable under base change and fppf local on the
   target (stacks-04XE lines 142–206, items (1), (2) and (31)). DM, quasi-DM and quasi-separated
   morphisms and stacks are those of Stacks, Definitions 101.4.1–101.4.2 (the diagonal is
   unramified, locally quasi-finite, quasi-compact and quasi-separated); separated is §1.20's
   `IsSeparatedStack`.
4. **Substacks.** A substack of `𝒳` is strictly full: for every scheme `T` a full subgroupoid of
   `𝒳(T)` closed under isomorphism and pullback. Two substacks are equal when they have the same
   objects; every uniqueness statement for substacks is equality in this sense. Witness: for
   `𝒳 = Spec k ⊔ Spec k`, the two open substacks `Spec k ⊔ ∅` and `∅ ⊔ Spec k` are equivalent
   stacks and different substacks.
5. **Automorphism groups and their action.** For `x : Spec k → 𝒳`,
   `G_x := Isom_𝒳(x, x) = Spec k ×_{x,𝒳} I_𝒳`, a group algebraic space over `k` whose `T`-points
   are the automorphisms of `x|_T`, with multiplication `g·h = g ∘ h`. `G_x(k)` acts on the left on
   framed deformations by `g·(τ, α) := (τ, α ∘ g⁻¹)`, where `α : x → τ|_k`.
   AlgebraicModuliForArithmeticGeometry §8.3 (`FramedDeformation`) reframes by `g` through
   `α ↦ α ∘ g`, a right action; the left action used here is its inverse, `g ↦ (τ, α ∘ g⁻¹)`.
   Functions transform contragrediently. Witness: on `[𝔸¹/𝔾_m]` with `λ·t = λt`, at `x = 0` with
   `G_x = 𝔾_m`, the coordinate function `t` has weight `−1`, the conormal line `I/I² = k·t` has
   weight `−1`, and both `N_x` and `T_{𝒳,x}` are the weight-one character; with the right action
   `(τ, α ∘ g)` the tangent line would have weight `−1` and the comparison 7.3 would not be
   equivariant.
6. **Infinitesimal neighbourhoods.** For a closed substack `𝒵 ⊆ 𝒳` with quasi-coherent ideal `ℐ`,
   the `n`-th infinitesimal neighbourhood `𝒳^{[n]}_𝒵` is cut out by `ℐ^{n+1}`, so that
   `𝒳^{[0]}_𝒵 = 𝒵`, the indexing of the levels `V(I^{n+1})` of SchemeAndStackFoundations §4.8's
   *Scheme.formalCompletion*. Witness: for `𝒳 = 𝔸¹_k` and `𝒵` the origin, `𝒳^{[1]}_𝒵 = Spec k[t]/(t²)`,
   of length 2.
7. **Residue field.** For a point `x` of a decent stack whose residual gerbe exists, `κ(x)` is the
   field with `Spec κ(x) ≅` the one-point base of the gerbe `𝒵_x` (5.3); every representative
   `Spec k → 𝒳` of `x` gives a field homomorphism `κ(x) → k`. Witness: for `𝒳 = 𝔸¹_ℚ` and `x` the
   point `t² + 1 = 0`, `κ(x) = ℚ(i)`, and the representative `t ↦ i` over `ℂ` gives the inclusion
   `ℚ(i) ⊂ ℂ`.
8. **Dual numbers and tangent spaces.** `k[ε] := k[ε]/(ε²)`. For `𝒳` over a locally Noetherian
   scheme `S` and `k` of finite type over `S`, `T_{𝒳,x}` is the value at `k[ε]` of
   AlgebraicModuliForArithmeticGeometry §8.1's `deformationFunctorOfPoint`: framed deformations of
   `x` over `k[ε]` up to framed isomorphism. §8.1 writes them `(τ : Spec k[ε] → 𝒳, β : τ|_k ≅ x)`
   and §8.3's `FramedDeformation` writes them `(τ, α : x ≅ τ|_k)`; the two are identified by
   `α = β⁻¹`, and this roadmap uses `α`. In §8.1's form the left action of Convention 5 is
   `g·(τ, β) = (τ, g ∘ β)`. Witness: on `[𝔸¹/𝔾_m]` at `0`, with `τ = bε`, the class of `(bε, α)` is
   `α⁻¹b`, and `g·(bε, α) = (bε, α g⁻¹)` has class `g α⁻¹ b`; in §8.1's form `β = α⁻¹`, `g ∘ β = g α⁻¹`
   and the class is again `g α⁻¹ b`, of weight `+1` in both notations.
9. **Representations.** For `G` affine of finite type over a field `k`, `Rep(G)` is the category of
   comodules over `O(G)` (Tau Ceti `TauCeti.Comodule`, ReductiveGroups Layer 1), and
   `QCoh(BG) ≃ Rep(G)` by pullback along `Spec k → BG`: SchemeAndStackFoundations §1.22's
   *QCoh.presentationEquiv* for the presentation `BG = [Spec k/G]` (groupoid `G ⇉ Spec k`, both
   maps the structure map) identifies `QCoh(BG)` with `k`-vector spaces `V` with descent data, an
   `O(G)`-linear automorphism of `V ⊗_k O(G)` satisfying the cocycle condition, and such descent
   data are exactly the `O(G)`-comodule structures `V → V ⊗_k O(G)` on `V` (the Check of
   SchemeAndStackFoundations §1.22 that `QCoh(BG)` is the category of `O(G)`-comodules records this
   instance). The dual of a finite-dimensional
   representation carries the contragredient action.
10. **Names.** Names set in italics are proposed names for the library's declarations, extending
   the `Stacks` namespace of SchemeAndStackFoundations §1.20; `Suggested.lean` declares none of
   them.

## Exact supplier contracts

### From Mathlib

Declarations and line numbers are those of the pinned revision
`1b1ccf4b088b32fa3f23f2de1127433254a81e1e`.

- `CategoryTheory.Pseudofunctor.IsStack` (`Mathlib/CategoryTheory/Sites/Descent/IsStack.lean:49`):
  effective descent for a pseudofunctor on a site; with groupoid fibres it is the stack condition of
  §1.18. It does not impose groupoid fibres or any algebraicity.
- `AlgebraicGeometry.Scheme.fppfTopology` (`Mathlib/AlgebraicGeometry/Sites/Fpqc.lean:54`): the fppf
  topology on `Scheme.{u}`.
- `AlgebraicGeometry.Scheme.residueField` (`Mathlib/AlgebraicGeometry/ResidueField.lean:45`): the
  residue field of a scheme point, which 3.3 identifies with the residual gerbe of a scheme.
- `AlgebraicGeometry.IsClosedImmersion` (`Mathlib/AlgebraicGeometry/Morphisms/ClosedImmersion.lean:44`),
  `AlgebraicGeometry.Flat` (`Morphisms/Flat.lean:42`), `AlgebraicGeometry.LocallyOfFiniteType`
  (`Morphisms/FiniteType.lean:42`), `AlgebraicGeometry.LocallyOfFinitePresentation`
  (`Morphisms/FinitePresentation.lean:46`), `AlgebraicGeometry.Smooth` (`Morphisms/Smooth.lean:59`)
  and `AlgebraicGeometry.LocallyQuasiFinite` (`Morphisms/QuasiFinite.lean:72`): the scheme morphism
  classes from which the properties of Convention 3 are built.
- `AlgebraicGeometry.IsReduced` (`Mathlib/AlgebraicGeometry/Properties.lean:68`) and
  `AlgebraicGeometry.IsLocallyNoetherian` (`Mathlib/AlgebraicGeometry/Noetherian.lean:54`): the
  scheme properties transferred to stacks in 0.1.
- `AlgebraicGeometry.GeometricallyReduced.isReduced_of_flat_of_isLocallyNoetherian`
  (`Mathlib/AlgebraicGeometry/Geometrically/Reduced.lean:109`): a scheme flat and geometrically
  reduced over a reduced, locally Noetherian scheme is reduced. The Noetherian hypothesis is part of
  the statement at the pin; with Tau Ceti's `TauCeti.AlgebraicGeometry.Smooth.geometricallyReduced`
  it gives the ascent of reducedness along smooth morphisms to a locally Noetherian scheme, and no
  more.
- `AlgebraicGeometry.Scheme.IdealSheafData.vanishingIdeal`
  (`Mathlib/AlgebraicGeometry/IdealSheaf/Basic.lean:564`), `AlgebraicGeometry.Scheme.IdealSheafData.subscheme`
  and `AlgebraicGeometry.Scheme.IdealSheafData.subschemeι` (`IdealSheaf/Subscheme.lean:453, 470`): the
  reduced induced closed subscheme on a closed subset, the scheme case of 0.5, and the closed
  subscheme of an ideal sheaf, the scheme case of 0.4.
- `AlgebraicGeometry.LocallyOfFiniteType.jacobsonSpace` (`Morphisms/FiniteType.lean:112`) with
  `JacobsonSpace` (`Mathlib/Topology/JacobsonSpace.lean:70`): a scheme locally of finite type over a
  Jacobson base is Jacobson; it gives the scheme Checks of 1.1–1.2.
- `finite_of_finite_type_of_isJacobsonRing` (`Mathlib/RingTheory/Jacobson/Ring.lean:691`):
  Zariski's lemma, a field finitely generated as an algebra over a Jacobson ring `R` is a finite
  `R`-module; a field is a Jacobson ring through the instance for Artinian rings (same file, line
  102), and so is `k[t]` through the instance for polynomial rings over a Jacobson ring (line 438).
  It gives the finiteness of `k` over `κ(x)` in 5.5 and, with `isField_of_isIntegral_of_isField`
  (`Mathlib/RingTheory/IntegralClosure/IsIntegralClosure/Basic.lean:675`: a ring with an injective
  integral map to a field is a field), the Check of 1.1 on the generic point of `𝔸¹_k`.
- `AlgebraicGeometry.FormallyUnramified` (`Mathlib/AlgebraicGeometry/Morphisms/FormallyUnramified.lean:54`:
  the ring maps between affine opens are formally unramified),
  `Algebra.FormallyUnramified.finite_of_free` (`Mathlib/RingTheory/Unramified/Finite.lean:167`: a
  formally unramified algebra essentially of finite type over `R` and free as an `R`-module is finite
  over `R`; over a field every module is free) and
  `Algebra.FormallyUnramified.bijective_of_isAlgClosed_of_isLocalRing`
  (`Mathlib/RingTheory/Unramified/Field.lean:61`: a local, formally unramified algebra essentially of
  finite type over an algebraically closed field `K` is `K`). They make `G_x` finite and constant in
  6.4's API bullet.
- `AlgebraicGeometry.LocallyOfFinitePresentation.iff_locallyOfFiniteType`
  (`Mathlib/AlgebraicGeometry/Noetherian.lean:271`): over a locally Noetherian target a morphism
  of schemes is locally of finite presentation iff it is locally of finite type. With the
  square-independence of SchemeAndStackFoundations §1.8's `Spaces.EtaleLocal` (an étale cover of
  the spectrum of a field is locally Noetherian) it gives the case used in 3.2, 4.1, 4.2, 4.4 and 6.1: a
  morphism of algebraic spaces locally of finite type over a disjoint union of spectra of fields is
  locally of finite presentation.
- The instance `DescendsAlong @Etale (@Surjective ⊓ @Flat ⊓ @QuasiCompact)`
  (`Mathlib/AlgebraicGeometry/Morphisms/LocalFlatDescent.lean:48`), for the class
  `CategoryTheory.MorphismProperty.DescendsAlong`
  (`Mathlib/CategoryTheory/MorphismProperty/Descent.lean:32`): a morphism of schemes whose base
  change along a flat, surjective, quasi-compact morphism is étale is étale. It gives the descent
  step of the rigidity in 0.2, for schemes only.
- `retractionKerCotangentToTensorEquivSection` (`Mathlib/RingTheory/Smooth/Kaehler.lean:324`): for a
  surjection `P → A` of `R`-algebras with kernel `I`, `P`-linear retractions of
  `I/I² → A ⊗_P Ω[P/R]` correspond to `R`-algebra sections of `P/I² → A`; no smoothness of `P` is
  assumed. With `Algebra.FormallySmooth.exists_lift` (`Mathlib/RingTheory/Smooth/Basic.lean:125`,
  lifting along nilpotent ideals for formally smooth `A`) it gives the split injectivity used in 7.3.
  Mathlib's `Algebra.FormallySmooth.iff_split_injection` (same file, line 290) assumes `P` formally
  smooth and does not apply to the chart of 7.3.

### From Tau Ceti

Declarations and line numbers are those of the pinned revision
`2fd255d997f47c0b5d834ee416c7015d55444ce5`.

- `TauCeti.AlgebraicGeometry.SchPseudofunctor` (`TauCeti/AlgebraicGeometry/Stack/Basic.lean:37`): the
  type of `Cat`-valued pseudofunctors on `Scheme.{u}ᵒᵖ`, the carrier of stacks. It carries no stack
  condition.
- `TauCeti.AlgebraicGeometry.SchemePresheaf`, `TauCeti.AlgebraicGeometry.Spaces.RepresentableDiagonal`,
  `TauCeti.AlgebraicGeometry.Spaces.EtaleAtlas` and `TauCeti.AlgebraicGeometry.Spaces.IsAlgebraicSpace`
  (`TauCeti/AlgebraicGeometry/AlgebraicSpace/Basic.lean:68, 74, 113, 195`): algebraic spaces, with
  no separation axiom.
- `TauCeti.AlgebraicGeometry.IsRegular` (`TauCeti/AlgebraicGeometry/Scheme/Regular/Scheme.lean:68`):
  regular schemes. The class extends Mathlib's `IsLocallyNoetherian` and asks every stalk to be a
  regular local ring, so a regular scheme is locally Noetherian by definition.
  `TauCeti.AlgebraicGeometry.IsRegular.of_smooth` (same file, line 90): the source of a smooth
  morphism to a regular scheme is regular (Stacks, Descent, Lemma 35.18.4, stacks-descent line 2306,
  ascent half). `TauCeti.AlgebraicGeometry.IsRegular.of_flat_of_surjective`
  (`TauCeti/AlgebraicGeometry/Scheme/Regular/Descent.lean:56`): regularity descends along a flat
  surjective morphism `X → Y` of schemes provided `Y` is locally Noetherian; that hypothesis is part
  of the statement. In 0.1 the target is a scheme with a smooth surjective cover by a locally
  Noetherian scheme, hence locally Noetherian by the atlas independence of SchemeAndStackFoundations
  §1.20's locally Noetherian stacks; so the two theorems make regularity of schemes local in the
  smooth topology. The algebraic-space clause of gap:reduced-regular-smooth-local that 3.1 and 3.4
  use (a smooth algebraic space over a field is regular) reduces on an étale atlas to `of_smooth`
  over `Spec k`, which is regular (a field is a principal ideal domain, hence a regular local
  ring).
- `TauCeti.AlgebraicGeometry.Smooth.geometricallyReduced`
  (`TauCeti/AlgebraicGeometry/Morphisms/Smooth/GeometricallyReduced.lean:56`): every smooth morphism
  of schemes is geometrically reduced; with Mathlib's
  `AlgebraicGeometry.GeometricallyReduced.isReduced_of_flat_of_isLocallyNoetherian` it is the
  locally Noetherian case of the smooth ascent of reducedness.
- `TauCeti.Comodule` (`TauCeti/Algebra/Coalgebra/Comodule/Basic.lean:50`) and `TauCeti.ComoduleCat`
  (`TauCeti/Algebra/Coalgebra/Comodule/Cat.lean:50`): comodules over a coalgebra, the carrier of
  representations in 7.2.
- `TauCeti.linearlyReductiveAffineGroupSchemeProperty`
  (`TauCeti/AlgebraicGeometry/AffineGroupScheme/LinearlyReductive.lean:60`): used only in the Checks
  of 7.4 that mention linear reductivity.
- `TauCeti.AffineGroupSchemeCat.exists_isClosedImmersion_generalLinear`
  (`TauCeti/Algebra/AlgebraicGroup/Representation/Embedding.lean:212`): an affine group scheme over a
  field `k`, locally of finite type, has a homomorphism to the general linear group scheme `GLₙ` over
  `k`, for some `n`, that is a closed immersion; `k` and the coordinate ring live in one universe. 7.3 applies it to `G_x`.
- `TauCeti.HopfAlgebra.smooth_iff_finrank_lie_eq_ringKrullDim`
  (`TauCeti/Algebra/AlgebraicGroup/Tangent/Regularity.lean:112`): a commutative Hopf algebra `H` of
  finite type over a field `k` is smooth over `k` iff the dimension of its Lie algebra (the
  `k`-derivations `H → k` at the counit) equals `ringKrullDim H`; no reducedness, connectedness or
  perfectness of `k` is assumed. 7.3 uses it as `T_{BG_x} = 0` iff `G_x` is smooth.
- `AlgebraicGeometry.Scheme.Hom.exists_finite_isSeparable_comp_eq`
  (`TauCeti/AlgebraicGeometry/Morphisms/Smooth/SeparablePoint.lean:43`): a nonempty scheme smooth
  over a field `k` has a point over `Spec k` with values in a finite separable extension of `k`; no
  perfectness of `k` is assumed. 7.3 applies it to a nonempty scheme étale over the algebraic space
  `U ×_𝒳 Spec k`, which is smooth over `k` for a smooth `U → 𝒳` whose image contains `x`.
- `CommHopfAlgCat.fppfHomogeneousQuotient`
  (`TauCeti/Algebra/AlgebraicGroup/Fppf/Quotient/Homogeneous/Basic.lean:217`): for an affine group
  `G = Spec H` over a commutative ring and the closed subgroup cut out by a Hopf ideal, the fppf
  sheafification of the left cosets on commutative algebras; no normality and no representability.
  `CommHopfAlgCat.isPullback_fppfHomogeneousQuotientTorsor` and
  `CommHopfAlgCat.isLocallySurjective_fppfHomogeneousQuotientSheafProjection`
  (`.../Fppf/Quotient/Homogeneous/Torsor.lean:160, 154`): the projection `G → G/H` is locally
  surjective with kernel pair `G × H`, that is an `H`-torsor. Representability is proved there only
  for linearly reductive `H` and, over a field of characteristic zero, for reductive `H`
  (`.../Homogeneous/Coinvariants.lean`, `.../Homogeneous/GeneralLinear.lean`), which `G_x` need
  not be; the general case is gap:homogeneous-quotient-scheme.

### From TauCetiRoadmap.SchemeAndStackFoundations

- §1.7 (`points`, `points_atlas_surjective`, `opensEquiv`) and §1.8 (`Spaces.EtaleLocal`,
  `spacePresentation`, fibre products of spaces): points and open subspaces of algebraic spaces, the
  open image of an étale atlas, the presentation of a space as the quotient of an étale atlas by its
  relation, and étale-local properties of morphisms of spaces.
- §1.9 (`IsSeparatedSpace`, `QuasiSeparatedSpace`, `LocallySeparatedSpace`, `QuasiCompactSpace`,
  `IsProperSpace`): separation, local separation and quasi-compactness of morphisms of spaces.
- §1.13 (`Groups.GroupSpace`), §1.14 (`Groupoid`, `Groupoid.restrict`, `stabilizer`, `stabilizerAt`),
  §1.15 (`Groups.IsTorsor`), §1.17 (`artinBootstrap`): group spaces, groupoids with their
  restriction and stabilizers, torsors, and Artin's bootstrap theorem.
- §1.18 (*StackInGroupoids*, `twoFiberProduct`, `Stack.stackification`): the carrier and
  2-fibre products.
- §1.19 (`IsRepresentableBySpaces`, `RepresentableProperty`, `IsAlgebraicStack`,
  `IsDeligneMumford`, `IsDeligneMumford.iff_unramified_diagonal`): representable morphisms with
  their properties, algebraic and Deligne–Mumford stacks (with an étale atlas).
- §1.20 (`inertia`, `inertia.representable`, `automorphismGroup`, `setoid_criterion`, `SmoothLocal`,
  `SmoothLocal.atlas_independent`, `Stacks.points` with `.map`, `.pullbackSurjective`,
  `.baseChangeImage`, `.atlasOpenSurjective`, `.ofSpace`, `QuasiCompactStack`, `IsSeparatedStack`,
  the locally Noetherian stacks, `stack_presentation`): everything of Convention 2–3.
- §1.21 (`Stack.quotient`, `quotientStack`, `quotientStack.π`, `actionQuotient`,
  `actionQuotient.torsorEquiv`, `quotientStack_algebraic`): quotient stacks of groupoids in fppf
  sheaves (`Stack.quotient`) and of actions, with `BG = [S/G]` for the trivial action, and `[U/R]`
  algebraic for flat locally finitely presented groupoid schemes. Algebraicity for groupoids in
  algebraic spaces, such as `u ×_𝒳 u` in 4.1, is gap:flat-groupoid-quotients.
- §1.22 (`Stacks.QCoh`, *QCoh.presentationEquiv*): quasi-coherent modules and their description on
  a presentation `[U/R]` as modules on `U` with descent data along `R` (Stacks, Proposition
  96.14.3). Applied to `BG = [Spec k/G]` for affine `G` over a field it gives `QCoh(BG)` as
  `O(G)`-comodules (Convention 9); the Check of §1.22 that `QCoh(BG)` is the category of
  `O(G)`-comodules is that instance. The abelian structure of `Stacks.QCoh`, its structure sheaf,
  its tensor products and the exactness properties of *QCoh.pullback* used in 0.4 and 7.2 are
  gap:qcoh-stacks-abelian-tensor.
- §1.23 (`moduliFunctor`, `toModuliSheaf`): the fppf sheafification of isomorphism classes, the base
  of a gerbe in 2.1.
- §4.8 (*Scheme.formalCompletion*, with its levels `toScheme n : V(I^{n+1}) → X` for
  `I : X.IdealSheafData`): the infinitesimal neighbourhoods of a closed subscheme, the scheme case of
  0.4 and 7.1.
- §4.12 (`generic_flatness`): generic flatness over an integral base. §4.13 records regular schemes
  as Tau Ceti's (From Tau Ceti above); this roadmap consumes it only through
  gap:reduced-regular-smooth-local.

What SchemeAndStackFoundations must provide (gap:stack-morphism-permanence): §1.20 must prove, for
its `SmoothLocal` properties flat, locally of finite presentation, locally of finite type and smooth,
for surjectivity and for `QuasiCompactStack`, stability under composition and base change, descent
along a surjective, flat, locally finitely presented base change, agreement with
`RepresentableProperty` for morphisms representable by algebraic spaces, the implications smooth ⇒
locally of finite presentation ⇒ locally of finite type, the cancellation laws for local finite type
and local finite presentation, and that a surjective, flat, locally finitely presented morphism is
fppf-locally essentially surjective; that a morphism of algebraic stacks is representable by
algebraic spaces, and has `RepresentableProperty P` for a property `P` of morphisms of algebraic
spaces stable under base change and fppf local on the target, as soon as its base change along one
surjective, flat, locally finitely presented morphism from an algebraic space is so; and that an
algebraic stack locally of finite type over a locally Noetherian algebraic stack is locally
Noetherian (Stacks, Properties of Stacks, Lemmas 100.3.1–100.3.3 and 100.5.2–100.5.5; Morphisms of
Stacks, Lemmas 101.7.3–101.7.7, 101.7.10, 101.17.2–101.17.8 with 101.17.5 for the last clause,
101.25.2–101.25.5, 101.27.2–101.27.14, 101.27.16 and 101.33.2–101.33.5).

What SchemeAndStackFoundations must provide (gap:flat-lfp-open): §1.20 must prove that for a flat,
locally finitely presented morphism `f` of algebraic stacks the map `|f|` is open, so that such
morphisms are universally open (Stacks, Morphisms of Stacks, Lemma 101.27.15).

What SchemeAndStackFoundations must provide (gap:inertia-of-presentations): §1.20 must prove that the
inertia `I_𝒳 → 𝒳` and the relative inertia `I_{𝒳/𝒴} → 𝒳` are locally of finite type, and that for a
presentation `[U/R] ≃ 𝒳` the stabilizer `G → U` of the groupoid (§1.14's `stabilizer`) is the
pullback `U ×_𝒳 I_𝒳` (Stacks, Morphisms of Stacks, Lemmas 101.5.1 and 101.5.7).

What SchemeAndStackFoundations must provide (gap:stack-separation-axioms): §1.20 must define DM,
quasi-DM and quasi-separated morphisms of algebraic stacks, and quasi-DM and quasi-separated algebraic
stacks, by the diagonal (Stacks, Morphisms of Stacks, Definitions 101.4.1–101.4.2), a DM stack being
§1.19's `IsDeligneMumford` through `IsDeligneMumford.iff_unramified_diagonal`, and prove separated ⇒
quasi-separated, DM ⇒ quasi-DM and representable by algebraic spaces ⇒ DM for morphisms, stability
under base change and composition, the permanence Lemma 101.4.11 and the comparison of the diagonal
with the inertia, Lemma 101.6.1 (Lemmas 101.4.3, 101.4.4, 101.4.10).

What SchemeAndStackFoundations must provide (gap:quasi-dm-flat-presentation): §1.19 must prove that an
algebraic stack is quasi-DM iff it admits a surjective, flat, locally finitely presented, locally
quasi-finite morphism from a scheme (Stacks, Morphisms of Stacks, Theorem 101.21.3), alongside its
`IsDeligneMumford.iff_unramified_diagonal`.

What SchemeAndStackFoundations must provide (gap:flat-groupoid-quotients): §1.21 must prove that for a
groupoid `(U, R, s, t, c)` in algebraic spaces (not only a groupoid scheme, for which §1.21 states
`quotientStack_algebraic`) with `s, t` flat and locally of finite presentation, `[U/R]` is algebraic
(Stacks, Criteria for Representability, Theorem 97.17.2) and the projection `U → [U/R]` is surjective,
flat and locally of finite presentation (Lemma 97.17.1), that `[B/G]` is algebraic iff `G → B` is flat and locally of finite
presentation (Lemma 97.18.3) and is then a gerbe over `B` (Groupoids in Spaces, Lemmas 78.27.1–78.27.2),
that the canonical `[U/R] → 𝒳` attached to a morphism `U → 𝒳` with `R = U ×_𝒳 U` is fully faithful and
is an equivalence when `U → 𝒳` is surjective, flat and locally of finite presentation (Algebraic
Stacks, Lemma 94.16.1, Remark 94.16.3), and that restricting a groupoid along `U' → U` gives a fully
faithful `[U'/R'] → [U/R]` (Groupoids in Spaces, Lemma 78.25.1).

What SchemeAndStackFoundations must provide (gap:qcoh-stacks-abelian-tensor): §1.22 must prove, for
an algebraic stack `𝒳`, that `Stacks.QCoh 𝒳` is abelian, with kernels and cokernels computed on `U`
under *QCoh.presentationEquiv* for a presentation `[U/R] ≃ 𝒳` with `s, t` flat (Sheaves on Stacks,
Lemma 96.15.1 (1)–(2), stacks-sheaves-on-stacks lines 1068–1071; Groupoids in Spaces, Lemma 78.12.6,
stacks-groupoids-spaces lines 593–603); that the structure sheaf `O_𝒳` (Definition 96.6.1,
stacks-sheaves-on-stacks lines 374–375) is an object of `Stacks.QCoh 𝒳` (Lemma 96.11.3, lines
740–742); that the tensor product over `O_𝒳` of two quasi-coherent modules is quasi-coherent (Lemma
96.15.1 (5), lines 1076–1077); and that *QCoh.pullback* along a morphism `f` of algebraic stacks is
the restriction `f^{-1}`, which preserves colimits and tensor products of quasi-coherent modules
and is therefore right exact (Lemma 96.11.2, lines 733–735; Lemma 96.12.5 (1)–(2), lines 869–874).

What SchemeAndStackFoundations must provide (gap:decent-algebraic-spaces): §1.7 must define decent
algebraic spaces (Stacks, Decent Spaces, Definition 68.6.1) and prove that quasi-separated and locally
separated spaces are decent (Section 68.6 and Lemma 68.15.2), that every point of a decent space is
represented by a monomorphism from the spectrum of a field (Lemma 68.11.1), that decent spaces are
sober (Proposition 68.12.4), the specialisation Lemma 68.7.2 and the stratification Lemma 68.8.3.

What SchemeAndStackFoundations must provide (gap:decent-space-schematic-locus): §1.7 must prove that
every decent algebraic space contains a dense open subspace representable by a scheme (Stacks, Decent
Spaces, Theorem 68.10.2, stacks-decent-spaces lines 1094–1096; for a quasi-separated space,
Properties of Spaces, Proposition 66.13.3).

What SchemeAndStackFoundations must provide (gap:reduced-scheme-residue-field-factorisation): §1.7
must prove that a morphism of schemes `Y → X` with `Y` reduced and image contained in `{x}` factors
through `Spec κ(x) → X`, and that for `X` locally Noetherian and a set `E` of points of `X` without
nontrivial specialisations among them a morphism from a reduced scheme with image in `E` factors
through `⊔_{x ∈ E} Spec κ(x)` (Stacks, Morphisms, Lemmas 29.59.1–29.59.2,
stacks-morphisms-schemes lines 7102–7125).

What SchemeAndStackFoundations must provide (gap:group-spaces-over-fields): §1.13 must prove that a
group algebraic space over a field which is locally quasi-finite, quasi-separated or locally
separated is a scheme (Stacks, Spaces over Fields, Lemma 72.10.8; More on Groupoids in Spaces, Lemma
79.9.4 and Proposition 79.10.3).

What SchemeAndStackFoundations must provide (gap:quasi-finite-over-fields): §1.8 must prove that a
morphism of algebraic spaces to a disjoint union of spectra of fields which factors as a
monomorphism followed by a locally quasi-finite morphism is locally quasi-finite (Stacks, Spaces over
Fields, Lemma 72.10.9).

What SchemeAndStackFoundations must provide (gap:isomorphism-fpqc-local-spaces): §1.2 must prove that
being an isomorphism is fpqc local on the target for morphisms of algebraic spaces, in particular
that a morphism of algebraic spaces over `Spec k` whose base change along a field extension `k'/k`
is an isomorphism is an isomorphism (Stacks, Descent on Spaces, Lemma 74.11.15).

What SchemeAndStackFoundations must provide (gap:generic-flatness-spaces): §4.12 must extend
`generic_flatness` to a quasi-compact morphism of algebraic spaces locally of finite type over a
reduced algebraic space, giving a dense open of the base over which it is flat and locally of finite
presentation (stacks-morphisms-spaces lines 3050–3057, Proposition 67.32.1; stacks-morphisms-schemes
lines 2319–2326, Proposition 29.28.2).

What SchemeAndStackFoundations must provide (gap:reduced-regular-smooth-local): §4.13 must prove that
reducedness of schemes is local in the smooth topology over an arbitrary base and descends along flat
surjective morphisms (Stacks, Descent, Lemmas 35.18.1 and 35.19.1, stacks-descent lines 2277 and
2320–2321); that reducedness of algebraic spaces ascends along smooth morphisms and descends along
flat surjective ones, and regularity of algebraic spaces ascends along smooth morphisms and descends
along flat, surjective, locally finitely presented ones (Descent on Spaces, Lemmas 74.9.2, 74.9.4 and
74.9.5, stacks-spaces-descent lines 424–425, 442–443 and 451–452; the smooth ascent of regularity
reduces on étale atlases to the scheme case); and that a smooth algebraic space over a field is
regular (Spaces over Fields, Lemma 72.16.1, stacks-spaces-over-fields lines 1213–1214). For schemes,
regularity is Tau Ceti's `TauCeti.AlgebraicGeometry.IsRegular.of_smooth` and
`TauCeti.AlgebraicGeometry.IsRegular.of_flat_of_surjective`, and the ascent of reducedness along
smooth morphisms to a locally Noetherian scheme is Mathlib's
`AlgebraicGeometry.GeometricallyReduced.isReduced_of_flat_of_isLocallyNoetherian` with Tau Ceti's
`TauCeti.AlgebraicGeometry.Smooth.geometricallyReduced`; neither is asked for here.

### From TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry

- §4.1: `IsGerbe`, `IsGerbe.equivalence_iff`, `relativeGerbe`, `relativePullback`,
  `relativeComposition` and `relativeDescent` on a site `(C, J)` with groupoid fibres. Layer 2 takes
  `(C, J) = (Scheme.{u}, fppf)`. Nothing about bands is assumed.
- §5.1: `ArithmeticModuli.Rigidification.stack`, `ArithmeticModuli.Rigidification.stabilizer_kernel`
  and `ArithmeticModuli.Rigidification.geometry`, for an algebraic stack locally of finite
  presentation over a scheme and a closed subgroup of its inertia flat and of finite presentation
  over it; used only in 2.1's comparison of the rigidification by the whole inertia with the base of
  a gerbe.
- §8.1: `deformationGroupoid`, `deformationFunctorOfPoint` and `stabiliserActionOnDeformations`, for
  `𝒳` fibred in groupoids over a locally Noetherian `S` and `k` of finite type over `S`, with the
  change-of-residue-field API; and §8.3's `framedDeformation_twoFibre` and
  `framedTangent_exactSequence` (framed tangent spaces of a 2-fibre product, and smooth
  representable morphisms are smooth on framed deformations).

What AlgebraicModuliForArithmeticGeometry must provide (gap:algebraic-stacks-satisfy-rs): §8.1 must
prove that an algebraic stack over a locally Noetherian base satisfies the Rim–Schlessinger condition
(Stacks, Artin's Axioms, Lemma 98.5.2, stacks-artin lines 292–294), so that its framed tangent
spaces, defined in Section 98.8 (lines 393–415), are `k`-vector spaces, and that for a finite
extension `k'/k` (7.3 uses finite separable ones) the framed tangent space at the induced `k'`-point
is the base change to `k'` of the tangent space at the `k`-point: under (RS) the deformation
category over `k'` is the change of residue field of the one over `k` (Artin's Axioms, Lemma 98.7.1,
lines 354–392), it satisfies Schlessinger's (S2) (Lemma 98.6.1 and Remark 98.6.2, lines 323–348),
and the tangent space of a change of residue field is the base change of the tangent space (Formal
Deformation Theory, Lemma 90.29.3, stacks-formal-defos lines 3512–3528); its deformation-category
clause and change-of-residue-field API state these without a target.

### From TauCetiRoadmap.ReductiveGroups

Layer 1 (representations of affine group schemes of finite type over a field as comodules, and the
finite-dimensional comodule category). Nothing about reductivity is assumed. Layer 3A's orbit
geometry is stated over an algebraically closed field and is not an input: 7.4 defines the orbit
`G·x` over `k` itself, as the reduced image of the orbit map, and under 7.4's hypotheses `G·x` is
smooth over `k`, so its base change to `k̄` is reduced and, when `G` and `V` have quasi-compact
underlying spaces (Layer 3A's finiteness), is the orbit of Layer 3A for the induced `k̄`-point. Layer 3 takes the quotient `G/H` first as an fppf sheaf and makes its
representability a theorem with hypotheses; 7.3 needs that theorem for `GLₙ/G_x`.

What ReductiveGroups must provide (gap:homogeneous-quotient-scheme): Layer 3 must prove that for a
smooth affine group scheme `G` of finite type over a field `k` and a closed subgroup scheme `H`, the
fppf quotient `G/H` (Tau Ceti `CommHopfAlgCat.fppfHomogeneousQuotient`) is represented by a separated
scheme of finite type over `k`, smooth over `k`, all of whose irreducible components have dimension
`dim G − dim H` (SGA 3, Exposé VI_A, Théorème 3.2 (i), (ii), (ii′) and (iv)(a′)–(c), sga3-vi-a lines
871–894, stated there for the left quotient `H\G ≅ G/H`, `g ↦ g⁻¹`); the torsor property of
`G → G/H` is Tau Ceti's `CommHopfAlgCat.isPullback_fppfHomogeneousQuotientTorsor`.

## How to read the build

Layer 0 builds the substack vocabulary on SchemeAndStackFoundations' stacks: smooth-local properties,
monomorphisms, immersions with their presentation description, closed substacks of quasi-coherent
ideals with their infinitesimal neighbourhoods, and the reduced induced structure. Layer 1 defines
finite type points and the automorphism group algebraic space `G_x`. Layer 2 builds gerbes of
algebraic stacks on AlgebraicModuliForArithmeticGeometry §4.1 and proves their geometric theory up
to the dense open gerbe. Layer 3 defines the residual gerbe through reduced one-point stacks and
proves its properties; Layer 4 proves its existence at finite type points, on stacks with a flat,
locally finitely presented, locally quasi-finite presentation, on gerbes, on stacks with
quasi-compact inertia and on locally Noetherian stacks, and the closed-immersion criterion at closed
points. Layer 5 adds decency, which is exactly what makes the base of a residual
gerbe the spectrum of a field. Layer 6 computes residual gerbes from representatives and identifies
them with classifying stacks at rational points. Layer 7 uses Layers 0–4 and 6 at a closed rational
point to define the normal space and compare it with the tangent space. Layers 1 and 2 each use
Layer 0 only and are independent of each other; Layer 3 uses 0 and 2; Layer 4 uses 0–3; Layer 5
uses 0 and 2–4; Layer 6 uses 0–5; Layer 7 uses 0.1, 0.2, 0.3, 0.4, 1.3, 2.2, 2.3, 3.4, 4.5 and 6.4.

## Layer 0: monomorphisms, immersions and reduced substacks

### 0.1 Reduced and regular algebraic stacks

Fix a smooth-local property `P` of schemes (one that is local in the smooth topology). Say that an
algebraic stack `𝒳` *has `P`* (*Stacks.HasSmoothLocalProperty*) if some scheme `U` with a smooth
surjective `U → 𝒳` has `P`. Prove that this is equivalent to: every scheme smooth over `𝒳` has
`P`; some, and every, algebraic space smooth over `𝒳` (surjective in the first case) has `P`; for `𝒳`
a scheme or an algebraic space it is `P` of `𝒳` (stacks-04XE lines 625–653, Lemma 100.7.1,
Definition 100.7.2).
Apply it to `P` = reduced (Mathlib `AlgebraicGeometry.IsReduced`), regular (Tau Ceti
`TauCeti.AlgebraicGeometry.IsRegular`) and locally Noetherian, which are smooth local (stacks-04XE
lines 654–665, Remark 100.7.3). *Needs:* SchemeAndStackFoundations §1.19 (`IsAlgebraicStack`, smooth
atlas), §1.20 (locally Noetherian stacks, `SmoothLocal`); Tau Ceti
`TauCeti.AlgebraicGeometry.IsRegular`, `TauCeti.AlgebraicGeometry.IsRegular.of_smooth`,
`TauCeti.AlgebraicGeometry.IsRegular.of_flat_of_surjective` (regularity of schemes is smooth local);
Mathlib `AlgebraicGeometry.IsReduced`, `AlgebraicGeometry.IsLocallyNoetherian`;
gap:reduced-regular-smooth-local (reducedness over an arbitrary base, and algebraic spaces);
gap:stack-morphism-permanence (for the second API bullet: smooth morphisms, and smooth surjective
morphisms, of algebraic stacks are stable under composition).

The API consists of the following facts.

- The definition does not depend on the atlas: if one smooth surjective `U → 𝒳` from a scheme has
  `P`, every smooth `V → 𝒳` from a scheme has `P`.
- If `𝒳` has `P` and `𝒴 → 𝒳` is smooth, then `𝒴` has `P`; if `𝒴 → 𝒳` is smooth and surjective and
  `𝒴` has `P`, then `𝒳` has `P`.
- For `P` locally Noetherian the notion is SchemeAndStackFoundations §1.20's locally Noetherian
  stack; for a scheme it is Mathlib's `IsReduced`, `IsLocallyNoetherian` and Tau Ceti's
  `TauCeti.AlgebraicGeometry.IsRegular`.
- A regular algebraic stack is reduced and locally Noetherian.

**Checks.**

- `B(ℤ/2)` over a field `k` is reduced and regular: its smooth atlas `Spec k` is regular.
- `[Spec k[t]/(t²) / 𝔾_m]`, with `t` of weight one, is not reduced: its smooth atlas
  `Spec k[t]/(t²)` is not reduced.
- Over `𝔽_p`, `Bμ_p` is regular, while the flat locally finitely presented morphism
  `μ_p → Spec 𝔽_p → Bμ_p` has the nonreduced source `μ_p = Spec 𝔽_p[λ]/((λ − 1)^p)`. A definition
  testing every flat locally finitely presented scheme over `𝒳` would declare `Bμ_p` nonreduced; the
  smooth atlas `𝔾_m → Bμ_p` (the quotient `𝔾_m → 𝔾_m/μ_p ≅ 𝔾_m`) is what is tested.
- `𝔸¹_k` is regular as an algebraic stack iff it is regular as a scheme, and `Spec k[x,y]/(xy)` is
  reduced and not regular in both senses.

### 0.2 Monomorphisms

Define a *monomorphism* (*Stacks.IsMonomorphism*) of algebraic stacks as a morphism `f : 𝒳 → 𝒴`
representable by algebraic spaces whose base change `T ×_𝒴 𝒳 → T` along every morphism from a scheme
is a monomorphism of algebraic spaces, that is `RepresentableProperty` for monomorphisms (stacks-04XE
line 707, Definition 100.8.1). Prove that the following are equivalent: `f` is a monomorphism; `f` is
fully faithful on fibre categories; the diagonal `Δ_f : 𝒳 → 𝒳 ×_𝒴 𝒳` is an equivalence; for some
algebraic space `W` and surjective, flat, locally finitely presented `W → 𝒴`, the 2-fibre product
`W ×_𝒴 𝒳` is an algebraic space and `W ×_𝒴 𝒳 → W` is a monomorphism (stacks-04XE lines 718–744,
Lemma 100.8.4). Prove the rigidity of monomorphisms into a field: a monomorphism `T → Spec k` from a
nonempty algebraic space is an isomorphism (stacks-morphisms-spaces lines 904–905, Lemma 67.10.8).
For the proof take a nonempty affine open `V` of a scheme étale and surjective over `T`, so that
`V → T` is étale with image an open subspace `T' ⊆ T`; since `T ×_k T = T`, the relation
`V ×_{T'} V = V ×_T V` equals `V ×_k V`, whose first projection is therefore étale, so `V → Spec k`
is étale by fpqc descent of étaleness along the flat, surjective, quasi-compact `V → Spec k`; then
`V` is an étale atlas of both `T'` and `Spec k` with the same relation `V ×_k V`, so `T' ≅ Spec k`
over `k`, and `T → Spec k` is a monomorphism with the section `Spec k ≅ T' ⊆ T`, hence an
isomorphism. *Needs:* SchemeAndStackFoundations §1.18 (`twoFiberProduct`), §1.19
(`IsRepresentableBySpaces`, `RepresentableProperty`), §1.7 (`points_atlas_surjective`, `opensEquiv`:
the image `T'` is an open subspace), §1.8 (`Spaces.EtaleLocal`, `spacePresentation`: an algebraic
space is the quotient of an étale atlas by its relation), §1.20 (`Stacks.points` and `inertia`, for
the API's `|f|` and `I_𝒳`); Mathlib's instance
`DescendsAlong @Etale (@Surjective ⊓ @Flat ⊓ @QuasiCompact)` (fpqc descent of étaleness, for the
rigidity); gap:stack-morphism-permanence
(representability and the monomorphism property are checked after the base change along `W → 𝒴`,
Lemmas 100.3.1 and 100.3.3); for the last clause of the API gap:stack-separation-axioms.

The API consists of the following facts.

- Base change and composition: if `𝒵 → 𝒴` is a monomorphism then so is `𝒵 ×_𝒴 𝒳 → 𝒳`; a composite of
  monomorphisms is a monomorphism; equivalences are monomorphisms (stacks-04XE lines 711–717,
  Lemmas 100.8.2–100.8.3).
- A monomorphism is injective on points: `|f|` is injective (stacks-04XE lines 745–752, Lemma 100.8.5).
- For `𝒳 → 𝒳' → 𝒴` with `𝒳 → 𝒳'` a monomorphism, the square formed by the diagonals
  `𝒳 → 𝒳 ×_𝒴 𝒳` and `𝒳' → 𝒳' ×_𝒴 𝒳'` is 2-cartesian (stacks-04XE lines 753–762, Lemma 100.8.6).
- For a monomorphism `f`, `I_𝒳 = I_𝒴 ×_𝒴 𝒳` (stacks-06RD lines 591–608, Lemma 101.5.6); hence
  `G_x = G_{f∘x}` for every field-valued point `x` of `𝒳`.
- A monomorphism is separated and DM (stacks-06RD lines 445–451, Lemma 101.4.15).

**Checks.**

- For a nontrivial group scheme `G` flat and locally of finite presentation over `k`, `Spec k → BG`
  is not a monomorphism: `Spec k ×_{BG} Spec k = G ≠ Spec k`, so its diagonal is not an
  equivalence (alper-moduli lines 6955–6957).
- The open immersion `𝔾_m → 𝔸¹` is a monomorphism; `Spec ℂ → Spec ℝ` is injective on points and is
  not a monomorphism, since `Spec ℂ ×_ℝ Spec ℂ` has two points.
- The rigidity statement needs the target to be a field: `Spec k → Spec k[ε]` is a monomorphism from
  a nonempty scheme and not an isomorphism.
- For `X = U/G` of stacks-06ML lines 1238–1256 (Example 100.11.6), with `U = Spec(ℚ̄ ⊗_ℚ ℚ̄)` and
  `G = Gal(ℚ̄/ℚ)` discrete acting freely and transitively on the points of `U` through the second
  factor, `X` is an algebraic space over `Spec ℚ̄` through the first factor and every residue field
  of `U` is `ℚ̄`. The point `x : Spec ℚ̄ → U → X`, through the multiplication `ℚ̄ ⊗_ℚ ℚ̄ → ℚ̄`, is a
  section of `X → Spec ℚ̄`, hence a monomorphism between one-point spaces, and it is not an
  isomorphism (`U ×_X Spec ℚ̄ = G × Spec ℚ̄` is discrete, `U` is not); one-point source and target do
  not make a monomorphism an isomorphism (compare 3.2). There is no morphism `Spec ℚ → X` at all: it
  would give a ring map `ℚ̄ → ℚ`.

### 0.3 Immersions and substacks

Define open immersions, closed immersions and immersions of algebraic stacks as morphisms
representable by algebraic spaces with `RepresentableProperty` for open immersions, closed
immersions and immersions of algebraic spaces, and open, closed and locally closed *substacks*
(Convention 4) as substacks `𝒳' ⊆ 𝒳` that are algebraic stacks with the inclusion an open immersion,
a closed immersion, an immersion (stacks-04XE lines 765–776 and 853–859, Definitions 100.9.1 and
100.9.9) (*Stacks.IsImmersion*, *Stacks.IsClosedImmersion*, *Stacks.IsOpenImmersion*,
*Stacks.ClosedSubstack*). Prove:

- base change, composition, and fppf-locality on the target: `f` is an (open, closed) immersion iff
  `W ×_𝒴 𝒳 → W` is one for some surjective, flat, locally finitely presented `W → 𝒴` from an
  algebraic space (stacks-04XE lines 780–795, Lemmas 100.9.2–100.9.4);
- an immersion is a monomorphism, and `|i|` is a homeomorphism onto a locally closed subset, closed
  or open for closed or open immersions (stacks-04XE lines 796–801, Lemmas 100.9.5–100.9.6; the source
  omits the proof of the second, which follows from the presentation description below and the
  quotient topology of SchemeAndStackFoundations §1.20);
- every immersion factors uniquely as an equivalence onto a locally closed substack followed by its
  inclusion (stacks-04XE lines 865–868, Lemma 100.9.10; the essential image of a fully faithful
  functor closed under isomorphism);
- for a presentation `𝒳 = [U/R]` by a smooth groupoid in algebraic spaces, `𝒵 ↦ U ×_𝒳 𝒵` is a
  bijection from locally closed (closed, open) substacks of `𝒳` to `R`-invariant locally closed
  (closed, open) subspaces of `U`, with inverse `Z ↦ [Z/R_Z]`; a morphism `𝒴 → 𝒳` factors through
  `𝒵` iff `𝒴 ×_𝒳 U → U` factors through `U ×_𝒳 𝒵` (stacks-04XE lines 804–851 and 872–888,
  Lemmas 100.9.7, 100.9.8, 100.9.11);
- `𝒰 ↦ |𝒰|` is an inclusion-preserving bijection from open substacks of `𝒳` to open subsets of
  `|𝒳|` (stacks-04XE lines 889–894, Lemma 100.9.12), agreeing with SchemeAndStackFoundations §1.7's
  `opensEquiv` on algebraic spaces;
- an open substack `𝒰` of an algebraic stack `𝒳` with a smooth-local property `P` (0.1) has `P`: the
  open immersion `𝒰 → 𝒳` is smooth, its base change along a scheme being an open immersion of
  algebraic spaces (compare stacks-06RD lines 3551–3556, Lemma 101.35.4, where it is shown étale),
  and 0.1's API passes `P` along smooth morphisms.

*Needs:* 0.1 (the open-substack bullet), 0.2; SchemeAndStackFoundations §1.19
(`RepresentableProperty`), §1.20 (`Stacks.points`, `stack_presentation`), §1.14 (`Groupoid.restrict`),
§1.7 (`opensEquiv`); gap:flat-groupoid-quotients (restriction of a groupoid gives a fully faithful
functor of quotients); gap:stack-morphism-permanence (fppf-locality on the target, Lemmas 100.3.1 and
100.3.3; agreement of smoothness with `RepresentableProperty`, so that an open immersion is smooth).

**Checks.**

- `B𝔾_m = [{0}/𝔾_m] → [𝔸¹/𝔾_m]` is a closed immersion with image the closed point, and its
  complement is the open substack `[𝔾_m/𝔾_m] = Spec k`; under the presentation correspondence they
  are the `𝔾_m`-invariant subschemes `{0}` and `𝔾_m` of `𝔸¹`.
- The generic point `Spec k(t) → 𝔸¹_k` is a monomorphism and not an immersion: `{η}` is not locally
  closed in `𝔸¹_k`, since its complement, the set of closed points, is not closed.
- Uniqueness in the factorisation is equality of substacks: for `𝒳 = Spec k ⊔ Spec k`, the open
  immersion of `Spec k` onto the first copy factors through the substack `Spec k ⊔ ∅` and not
  through the equivalent substack `∅ ⊔ Spec k`.
- For `𝒳` an algebraic space, the open substacks are the open subspaces of SchemeAndStackFoundations
  §1.7, under `opensEquiv`.
- Open substacks inherit a smooth-local property and closed ones need not: the open substack
  `Spec k = [𝔾_m/𝔾_m]` of `[𝔸¹/𝔾_m]` has the atlas `𝔾_m ⊆ 𝔸¹`, reduced, regular and locally
  Noetherian as `𝔸¹` is, while the closed substack `[Spec k[t]/(t²) / 𝔾_m]` of the regular
  `[𝔸¹/𝔾_m]` has the atlas `Spec k[t]/(t²)` and is neither reduced nor regular (0.1's second
  Check); the bullet cannot be stated for all immersions.

### 0.4 Closed substacks, quasi-coherent ideals and infinitesimal neighbourhoods

Prove that `𝒵 ↦ ℐ_𝒵` and `ℐ ↦ V(ℐ)` are inverse inclusion-reversing bijections between closed
substacks of `𝒳` and quasi-coherent ideals of `𝒳`, that is subobjects `ℐ → O_𝒳` in
`Stacks.QCoh 𝒳` (SchemeAndStackFoundations §1.22), an abelian category containing `O_𝒳` by
gap:qcoh-stacks-abelian-tensor (*Stacks.closedSubstackEquivIdeal*).
Here, for the closed immersion `i : 𝒵 → 𝒳` (quasi-compact and quasi-separated, so that §1.22's
*QCoh.pushforward* applies), `ℐ_𝒵` is the kernel, taken in `Stacks.QCoh 𝒳`, of the unit
`O_𝒳 → i_* O_𝒵` (Sheaves on Stacks, Lemma 96.15.1 (1)–(3), stacks-sheaves-on-stacks lines
1068–1073); under *QCoh.presentationEquiv* for a smooth presentation `[U/R] ≃ 𝒳` it is the
`R`-invariant ideal sheaf of the closed subscheme `U ×_𝒳 𝒵` of `U`, kernels in the category of
modules with descent data being computed on `U` because `s` and `t` are flat. The inclusion of
quasi-coherent modules into all `O_𝒳`-modules on the fppf site is right exact and not exact in
general (Lemma 96.15.1 (3), stacks-sheaves-on-stacks line 1072), so the kernel of the same map
among all modules need not be quasi-coherent; when it is not, it differs from `ℐ_𝒵`, and
`ℐ_𝒵 → O_𝒳` is a monomorphism in `Stacks.QCoh 𝒳` that is not injective on the sections over some
test scheme (Checks: the origin of `𝔸¹`). When the unit `O_𝒳 → i_* O_𝒵` is split in
`Stacks.QCoh 𝒳`, as for a closed immersion that is also open, the two kernels agree, a split exact
sequence staying exact among all modules (Checks). Images and powers of ideals are taken in
`Stacks.QCoh` as well: `ℐ^{n+1}` is the image of `ℐ^{⊗(n+1)} → O_𝒳`, the tensor power being
quasi-coherent (gap:qcoh-stacks-abelian-tensor). A morphism `x : T → 𝒳`
from a scheme factors through `V(ℐ)` iff the map `x^* ℐ → O_T` of quasi-coherent `O_T`-modules is
zero, and for every morphism `f : 𝒴 → 𝒳` of algebraic stacks `V(ℐ) ×_𝒳 𝒴 = V(ℐ·O_𝒴)`, where
`ℐ·O_𝒴` is the image of `f^* ℐ → O_𝒴` in `Stacks.QCoh 𝒴`. For the proof combine the presentation correspondence of 0.3 for a smooth atlas
`U → 𝒳` from a scheme (closed substacks are `R`-invariant closed subspaces of `U`) with the
description of quasi-coherent modules on `[U/R]` as modules on `U` with descent data (stacks-04XE
lines 872–888, Lemma 100.9.11; stacks-sheaves-on-stacks lines 953–955, Proposition 96.14.3) and the
scheme case, Mathlib's `AlgebraicGeometry.Scheme.IdealSheafData.subscheme` and `subschemeι`.

Define, for a closed substack `𝒵` with ideal `ℐ`, the *`n`-th infinitesimal neighbourhood*
`𝒳^{[n]}_𝒵 := V(ℐ^{n+1})` (*Stacks.infinitesimalNeighbourhood*) (ahr2020 lines 248–252, §1.5).

*Needs:* 0.3; SchemeAndStackFoundations §1.20 (`stack_presentation`), §1.22 (`Stacks.QCoh`,
*QCoh.presentationEquiv*, *QCoh.pushforward*), §4.8 (*Scheme.formalCompletion*, for the scheme
bullet of the API); Mathlib
`AlgebraicGeometry.Scheme.IdealSheafData.subscheme`,
`AlgebraicGeometry.Scheme.IdealSheafData.subschemeι`; gap:qcoh-stacks-abelian-tensor (kernels and
images in `Stacks.QCoh 𝒳`, the structure sheaf `O_𝒳`, tensor powers of `ℐ`, and right exactness of
pullback for `x^* ℐ` and `ℐ·O_𝒴`).

The API consists of the following facts.

- `𝒳^{[0]}_𝒵 = 𝒵`, and `𝒳^{[n]}_𝒵 ⊆ 𝒳^{[n+1]}_𝒵` are closed immersions whose ideal
  `ℐ^{n+1}/ℐ^{n+2}` squares to zero; `|𝒳^{[n]}_𝒵| = |𝒵|` for every `n`.
- For every `f : 𝒴 → 𝒳`, `𝒳^{[n]}_𝒵 ×_𝒳 𝒴 = 𝒴^{[n]}_{𝒵 ×_𝒳 𝒴}`.
- A morphism `T → 𝒳` from a scheme with `(x^* ℐ · O_T)^{n+1} = 0` factors through `𝒳^{[n]}_𝒵`.
- For `𝒳` a scheme and `𝒵 = V(I)` for `I : 𝒳.IdealSheafData`, `𝒳^{[n]}_𝒵` is the level-`n` term
  `toScheme n : V(I^{n+1}) → 𝒳` of SchemeAndStackFoundations §4.8's *Scheme.formalCompletion*, the
  closed subscheme of the `(n+1)`-st power ideal; both indexings start with `V(I)` at `n = 0`.

**Checks.**

- For `𝒳 = 𝔸¹_k` and `𝒵` the origin, `𝒳^{[n]}_𝒵 = Spec k[t]/(t^{n+1})`, of length `n + 1`, so
  lengths `1, 2, 3` for `n = 0, 1, 2`; an indexing by `ℐ^n` would give lengths `0, 1, 2`, its zeroth
  term being `V(ℐ⁰) = V(O_𝒳) = ∅` rather than `𝒵` (the whole of `𝒳` is `V(0)`).
- For `𝒳 = Spec k[ε]` and `𝒵` its reduced point, `ℐ = (ε)` and `ℐ² = 0`, so `𝒳^{[n]}_𝒵 = 𝒳` for every
  `n ≥ 1` while `𝒳^{[0]}_𝒵 = Spec k`.
- For `B𝔾_m ⊆ [𝔸¹/𝔾_m]`, `𝒳^{[n]} = [Spec k[t]/(t^{n+1}) / 𝔾_m]`, computed on the atlas `𝔸¹` through
  the presentation correspondence.
- The ideal of `V(ℐ)` is `ℐ` again: for `ℐ = (t²) ⊆ k[t]` the closed subscheme `Spec k[t]/(t²)` has
  ideal `(t²)`, not its radical `(t)`; a correspondence through supports only would lose it.
- The kernel must be taken in `Stacks.QCoh`: for `𝒳 = 𝔸¹_k` and `𝒵` the origin, the kernel of
  `O_𝒳 → i_* O_𝒵` among all modules on the fppf site has sections `(t)` over `id : 𝔸¹ → 𝔸¹` and `0`
  over the origin `Spec k → 𝔸¹`, whereas the pullback of `(t)` to the origin is `(t) ⊗_{k[t]} k = k·t`,
  one-dimensional, so that sheaf is not quasi-coherent. The kernel in `Stacks.QCoh 𝒳` is the module of
  `(t)`, whose value `k·t` over the origin maps to `0` in `k`, as the factorisation criterion requires
  of a point of `V(ℐ)`.
- The two kernels can agree: for `𝒳 = Spec(k × k)` and `𝒵 = Spec k` its first component, a closed
  immersion that is also open, the unit is the split surjection `(a, b) ↦ a`, and over a test scheme
  `T = T₁ ⊔ T₂` (the preimages of the two components) the kernel among all modules has sections
  `O(T₂)`, the value of the quasi-coherent ideal `0 × k`; for the identity immersion both kernels are
  `0`. A warning that the kernel among all modules is never quasi-coherent would be refuted here.

### 0.5 The reduced induced closed substack

Prove that for every closed subset `T ⊆ |𝒳|` there is a unique reduced closed substack `𝒵 ⊆ 𝒳` with
`|𝒵| = T` (stacks-04XE lines 1073–1091, Lemma 100.10.1). Define the *reduced induced closed
substack* on `T` and the *reduction* `𝒳_red` (*Stacks.reducedInduced*, *Stacks.reduction*), and for a
locally closed `T` the reduced induced locally closed substack, the reduced closed substack of the
open substack `|𝒳| ∖ (T̄ ∖ T)` (stacks-04XE lines 1107–1125, Definition 100.10.4, Remark 100.10.5).
For the proof, take a smooth presentation `[U/R]` with `U` a scheme, the closed subset `T' ⊆ |U|`
over `T` (which is `R`-invariant by the quotient description of `|𝒳|`), and the reduced induced
closed subscheme `Z ⊆ U` (Mathlib's `vanishingIdeal`); the two pullbacks of `Z` to `R` are reduced
closed subspaces with the same points, hence equal, which is checked on an étale atlas of `R`; then
apply 0.3. *Needs:* 0.1, 0.3; SchemeAndStackFoundations §1.20 (`Stacks.points`,
`stack_presentation`); Mathlib `AlgebraicGeometry.Scheme.IdealSheafData.vanishingIdeal`;
gap:reduced-regular-smooth-local; gap:stack-morphism-permanence (for the locally Noetherian clause of
the API, Lemma 101.17.5).

The API consists of the following facts.

- A closed substack `𝒳' ⊆ 𝒳` of a reduced `𝒳` with `|𝒳'| = |𝒳|` is `𝒳` (stacks-04XE lines 1092–1099,
  Lemma 100.10.2).
- For `𝒴` reduced and `𝒵 ⊆ 𝒳` closed, `f : 𝒴 → 𝒳` factors through `𝒵` iff `|f|(|𝒴|) ⊆ |𝒵|`
  (stacks-04XE lines 1100–1106, Lemma 100.10.3).
- `𝒳_red → 𝒳` is a closed immersion which is a homeomorphism on points.
- Closed and locally closed substacks of a locally Noetherian stack, in particular `𝒳_red`, are
  locally Noetherian, an immersion being locally of finite type (stacks-06RD lines 1484–1500, Lemmas
  101.17.4–101.17.5).
- For a scheme, the reduced induced closed substack is the closed subscheme of Mathlib's
  `vanishingIdeal`.

**Checks.**

- `(Spec k[ε])_red = Spec k`, and `[Spec k[t]/(t²) / 𝔾_m]_red = B𝔾_m`.
- Reducedness is what makes the structure unique: `Spec k` and `Spec k[t]/(t²)` are closed substacks
  of `𝔸¹_k` with the same support `{0}`, and only the first is reduced.
- The factorisation criterion needs a reduced source: `Spec k[ε] → 𝔸¹_k`, `t ↦ ε`, has image the
  origin and does not factor through the reduced origin `Spec k`.
- On `[𝔸¹/𝔾_m]`, the reduced induced closed substack on the closed point is `B𝔾_m`, and on the open
  point (locally closed) it is `Spec k`.

### Examples

On `𝒳 = [𝔸¹/𝔾_m]` over a field `k`: the closed point `0` and the open point `1`; the closed
substack `B𝔾_m` with ideal `(t)` and neighbourhoods `[Spec k[t]/(t^{n+1}) / 𝔾_m]`; the open substack
`Spec k`. On `Bμ_p` over `𝔽_p`: reduced and regular although `μ_p` is not reduced.

### Dependencies

SchemeAndStackFoundations §§1.7–1.8, 1.14, 1.18–1.20, 1.22, 4.8, 4.13 (through
gap:reduced-regular-smooth-local); Tau Ceti `TauCeti.AlgebraicGeometry.IsRegular` with `.of_smooth`
and `.of_flat_of_surjective`; Mathlib `AlgebraicGeometry.IsReduced`,
`AlgebraicGeometry.IsLocallyNoetherian`,
`AlgebraicGeometry.Scheme.IdealSheafData.vanishingIdeal`, `.subscheme`, `.subschemeι`, the instance
`DescendsAlong @Etale (@Surjective ⊓ @Flat ⊓ @QuasiCompact)`;
gap:stack-morphism-permanence, gap:stack-separation-axioms, gap:flat-groupoid-quotients,
gap:reduced-regular-smooth-local, gap:qcoh-stacks-abelian-tensor.

## Layer 1: points of finite type and automorphism groups

### 1.1 Finite type points

Define a *finite type point* (*Stacks.IsFiniteTypePoint*) of `𝒳` as a point of `|𝒳|` represented by
some morphism `Spec k → 𝒳` locally of finite type, and `𝒳_ft-pts ⊆ |𝒳|` as their set (stacks-06RD
lines 1545–1548 and 1567–1569, Definition 101.18.2). Prove that `x` is a finite type point iff there
are a scheme `U`, a closed point `u ∈ U` and a smooth `φ : U → 𝒳` with `φ(u) = x`, and that
`𝒳_ft-pts` is the union of the images of the closed points of all affine schemes smooth over `𝒳`
(stacks-06RD lines 1549–1578, Lemmas 101.18.1 and 101.18.3). *Needs:* 0.5 (the reduced induced
locally closed substack, for the density of finite type points); SchemeAndStackFoundations
§1.20 (`SmoothLocal`, `Stacks.points`); Mathlib `AlgebraicGeometry.LocallyOfFiniteType`;
gap:stack-morphism-permanence (composition, base change and cancellation of local finite type; smooth
morphisms are locally of finite type).

The API consists of the following facts.

- A morphism locally of finite type carries finite type points to finite type points; if it is
  moreover surjective, `f(𝒳_ft-pts) = 𝒴_ft-pts` (stacks-06RD lines 1579–1592, Lemmas
  101.18.4–101.18.5).
- Every nonempty locally closed `T ⊆ |𝒳|` contains a finite type point, so `𝒳_ft-pts ∩ T` is dense in
  every closed `T` (stacks-06RD lines 1593–1601, Lemma 101.18.6); the proof uses the reduced induced
  locally closed substack of 0.5.

**Checks.**

- The generic point of `Spec ℤ_(p)` is a finite type point, since `Spec ℚ → Spec ℤ_(p)` is of finite
  type (`ℚ = ℤ_(p)[1/p]`), and it is not closed (alper-moduli lines 6983–6984).
- The property belongs to the point, not to each representative: the point of `Spec ℚ` is a finite
  type point through the identity, while its representative `Spec ℚ̄ → Spec ℚ` is not locally of
  finite type (a finitely generated `ℚ`-algebra which is a field is finite over `ℚ` by Zariski's
  lemma, and `[ℚ̄ : ℚ]` is infinite). A definition asking every representative to be locally of finite
  type would have no finite type points at all: for any representative `Spec k → 𝒳`, the composite
  `Spec k(t) → Spec k → 𝒳` is another one, and it is not locally of finite type, since by
  cancellation `Spec k(t) → Spec k` would then be.
- On `[𝔸¹/𝔾_m]` over `k`, the open point `1` is a finite type point and is not closed
  (alper-moduli lines 6985–6987).
- The generic point `η` of `𝔸¹_k` is not a finite type point. For any representative
  `Spec K → 𝔸¹_k` of `η`, the map `k[t] → K` is injective, its kernel being the prime `0` of `η`;
  were the representative locally of finite type, `K` would be a finitely generated `k[t]`-algebra,
  hence a finite `k[t]`-module by Zariski's lemma (`k[t]` is a Jacobson ring), so the field `K` would
  be integral over its subring `k[t]` and `k[t]` would be a field. For `K = k(t)` and
  `K = k(t)(√t)` the failure is visible: `1/t ∈ K` is not integral over `k[t]` (an integral equation
  for `1/t`, multiplied by `tⁿ`, gives `1 ∈ (t)`). A definition with "flat" in place of "locally of
  finite type" would accept `η`, `Spec k(t) → 𝔸¹_k` being flat.
- For a scheme `X` locally of finite type over a field, the finite type points are the closed points
  (Mathlib `AlgebraicGeometry.LocallyOfFiniteType.jacobsonSpace`).

### 1.2 Closed points and field-valued points

Prove that every closed point of `|𝒳|` is a finite type point (Lemma 101.18.6 applied to the closed
subset `{x}`; stacks-06RD lines 1593–1601). Define, for a field `k`, the map
`π₀ 𝒳(Spec k) → |𝒳|` (*Stacks.pointOfObject*) sending the isomorphism class of an object over
`Spec k` to the point it represents (stacks-04XE lines 399–423, Definition 100.4.2 and the discussion
after it). *Needs:* 1.1; SchemeAndStackFoundations §1.18, §1.20 (`Stacks.points`, `Stacks.points.map`).

The API consists of the following facts.

- The map is natural in `𝒳` and compatible with field extensions `k ⊆ k'`: the square formed by
  pullback `π₀ 𝒳(Spec k) → π₀ 𝒳(Spec k')` and the two maps to `|𝒳|` commutes.
- A point lies in the image iff it has a representative defined over `k`.
- Two objects `x, y` over `Spec k` have the same image iff there are a field `Ω` and two field
  homomorphisms `a, b : k → Ω` with `(Spec a)^*x ≅ (Spec b)^*y` (stacks-04XE lines 341–350, the
  equivalence of points with `K = L = k`). Objects which become isomorphic over one extension
  `k ⊆ k'` have the same image; the converse needs the two embeddings.

**Checks.**

- For `𝒳 = B(ℤ/2)` over `ℝ`, `π₀ 𝒳(Spec ℝ)` has two elements, the trivial torsor and `Spec ℂ`
  (the Check of SchemeAndStackFoundations §1.21 that `B(ℤ/2)(ℝ)` has two isomorphism classes), and
  both map to the single point of `|𝒳|`: the map is not injective.
- The fibres need two embeddings: for the scheme `𝒳 = Spec ℚ(i)` and `k = ℚ(i)`, the objects over
  `Spec k` are the two ring maps `id` and `σ` (complex conjugation), and both represent the single
  point of `|𝒳|`, through `a = σ`, `b = id` (`σ ∘ id = σ = id ∘ σ`). Over a single embedding
  `ι : k → Ω` they become the ring maps `ι` and `ι ∘ σ`, which differ since `ι(i) ≠ −ι(i)` in
  characteristic zero, and the isomorphism classes of objects of a scheme over `Spec Ω` are its
  morphisms from `Spec Ω`: a fibre relation through one common extension would separate the two
  objects.
- For `𝒳 = 𝔸¹_ℝ`, the image of `π₀ 𝒳(Spec ℝ) = ℝ` misses the closed point `t² + 1 = 0`, which has no
  real representative: the map is not surjective.
- For `X` a scheme locally of finite type over an algebraically closed `k`, the `k`-morphisms
  `Spec k → X` map bijectively onto the closed points. The map from all morphisms `Spec k → X` is
  larger: a field embedding `ℂ(t) → ℂ` gives a morphism `Spec ℂ → 𝔸¹_ℂ` onto the generic point, so
  statements about rational points of a stack over `k` use morphisms over `Spec k`.

### 1.3 The automorphism group algebraic space

Define, for `x : Spec k → 𝒳`, the *automorphism group algebraic space*
`G_x := Isom_𝒳(x, x) = Spec k ×_{x,𝒳} I_𝒳` over `Spec k` (*Stacks.automorphismGroupSpace*): the
sheaf SchemeAndStackFoundations §1.20's `automorphismGroup x` on schemes over `Spec k`, which is an
algebraic space by `inertia.representable` and a group object by the group law of the inertia
(stacks-06RD lines 1667–1674, Section 101.19; lines 497–543, Remark 101.5.2 and Definition 101.5.3),
hence a `Groups.GroupSpace` over `Spec k` (§1.13). Define for a property `P` of algebraic spaces over
fields invariant under ground-field extension "the automorphism group of `𝒳` at `x` has `P`", and for
`f : 𝒳 → 𝒴` "`f` induces an isomorphism of automorphism groups at `x`"
(*Stacks.InducesIsoOnAutomorphismGroups*) (stacks-06RD lines 1698–1706 and 1721–1725, Remarks 101.19.3
and 101.19.5). *Needs:* SchemeAndStackFoundations §1.20 (`inertia`, `inertia.representable`,
`automorphismGroup`), §1.13 (`Groups.GroupSpace`), §1.14 (`stabilizer`, `stabilizerAt`); 0.2;
gap:inertia-of-presentations (stabilizer of a presentation); gap:isomorphism-fpqc-local-spaces
(descent of isomorphisms of algebraic spaces along field extensions).

The API consists of the following facts.

- For a field extension `k ⊆ k'` and `x' : Spec k' → Spec k → 𝒳`, `G_{x'} = G_x ×_{Spec k} Spec k'` as
  group spaces (stacks-06RD lines 1672–1674).
- For `P` invariant under ground-field extension, `G_x` has `P` for one representative of a point iff
  for all of them (stacks-06RD lines 1690–1697, Lemma 101.19.2; the source omits the proof, which is
  the base-change formula applied to a common extension of two representatives).
- `G_x → G_{f∘x}` is an isomorphism for one representative iff for all (stacks-06RD lines 1707–1720,
  Lemma 101.19.4).
- For a presentation `[U/R] → 𝒳` and `u : Spec k → U` over `x`, `G_x` is §1.14's `stabilizerAt u` of
  the groupoid (stacks-06RD lines 609–618, Lemma 101.5.7).
- For an algebraic space `T` and `x₁, x₂ : T → 𝒳`, `Isom_𝒳(x₁, x₂)` is a pseudo-torsor under
  `Isom_𝒳(x₂, x₂)` (stacks-06RD lines 544–564, Lemma 101.5.4).
- For a monomorphism `f`, `G_x → G_{f∘x}` is an isomorphism (0.2).

**Checks.**

- For `G` flat and locally of finite presentation over `k` and `x` the trivial torsor of `BG`,
  `G_x = G`; for an algebraic space every `G_x` is trivial.
- On `[𝔸¹/𝔾_m]`, `G_0 = 𝔾_m` and `G_1` is trivial.
- On `Bμ_p` over `𝔽_p`, `G_x = μ_p` is nonreduced with `μ_p(𝔽̄_p)` trivial: a definition through the
  abstract group of automorphisms over an algebraically closed field would see no stabiliser.
- "`G_x(k)` is trivial" is not invariant under extension: on `B(μ_3)` over `ℚ`, `μ_3(ℚ) = 1` and
  `μ_3(ℚ(ζ_3)) = ℤ/3`, so this property of a representative is not a property of the point.

### 1.4 When the automorphism group is a scheme

Prove that `G_x` is a scheme if the diagonal of `𝒳` is quasi-separated or locally separated, or `𝒳`
is quasi-DM, or `I_𝒳 → 𝒳` is quasi-separated, locally separated or locally quasi-finite (stacks-06RD
lines 1675–1689, Lemma 101.19.1). For the proof, the first three cases reduce to the last three by the
comparison of diagonal and inertia; in the quasi-separated and locally separated cases `G_x` is a
decent group algebraic space over a field, hence separated and a scheme; in the locally quasi-finite
case it is locally quasi-finite over a field, hence a scheme. *Needs:* 1.3; SchemeAndStackFoundations
§1.9 (`QuasiSeparatedSpace`, `LocallySeparatedSpace`, Convention 3); gap:stack-separation-axioms
(Lemma 101.6.1); gap:group-spaces-over-fields.

**Checks.**

- Let `G = 𝔾_{a,ℚ}/ℤ` over `ℚ`, the quotient of `𝔾_a` by the constant subgroup `ℤ` acting by
  translation: its underlying algebraic space is SchemeAndStackFoundations §1.12's `𝔸¹_ℚ/ℤ`
  (`translationQuotient_space`), and it is a group algebraic space because the fppf sheaf quotient of
  the abelian sheaf `𝔾_a` by its subsheaf `ℤ` is again a sheaf of abelian groups. It is flat and
  locally of finite presentation over `ℚ`, its étale atlas `𝔸¹_ℚ` being so. Then `BG` has
  `G_x = G`, which is not a scheme; its inertia, the base change of `G → Spec ℚ`, is neither
  quasi-separated nor locally separated: the diagonal of `G`
  pulls back to `⊔_{n ∈ ℤ} 𝔸¹ → 𝔸²`, `x ↦ (x, x + n)`, which is not quasi-compact, and whose image,
  the union of the lines `y = x + n`, is dense in `𝔸²` and misses its generic point, hence is not
  locally closed. So a hypothesis is needed.
- On a Deligne–Mumford stack `G_x` is an étale group scheme over `k`, and it need not be finite:
  the inertia is unramified (Lemma 101.6.1), so `G_x → Spec k` is unramified, `G_x` is a scheme
  (a DM stack is quasi-DM) and an unramified scheme over a field is étale; `G_x` is finite when
  moreover `I_𝒳 → 𝒳` is quasi-compact, for instance when the diagonal is. For the constant group `ℤ`
  over `k`, `Bℤ` is Deligne–Mumford (its atlas `Spec k` is étale, `ℤ_k → Spec k` being étale) with
  `G_x = ℤ_k = ⊔_ℤ Spec k`, étale and not quasi-compact, while `B(ℤ/2)` has the finite étale
  `G_x = (ℤ/2)_k`.
- On `B𝔾_m`, whose diagonal is affine, `G_x = 𝔾_m` is a scheme although `B𝔾_m` is not quasi-DM.

### Examples

On `[𝔸¹/𝔾_m]`: finite type points `0` (closed) and `1` (open), `G_0 = 𝔾_m`, `G_1 = 1`. On
`B(ℤ/2)_ℝ`: two real objects over one point, each with `G_x = ℤ/2`.

### Dependencies

Layer 0; SchemeAndStackFoundations §§1.9, 1.12–1.14, 1.18, 1.20–1.21; Mathlib
`AlgebraicGeometry.LocallyOfFiniteType`, `AlgebraicGeometry.LocallyOfFiniteType.jacobsonSpace`;
gap:stack-morphism-permanence, gap:stack-separation-axioms, gap:inertia-of-presentations,
gap:isomorphism-fpqc-local-spaces, gap:group-spaces-over-fields.

## Layer 2: gerbes over algebraic stacks

### 2.1 Gerbes over an algebraic stack and the base of a gerbe

Say that a morphism `p : 𝒳 → 𝒴` of algebraic stacks makes `𝒳` a *gerbe over* `𝒴`
(*Stacks.IsGerbeOver*) when AlgebraicModuliForArithmeticGeometry §4.1's `relativeGerbe` holds for `p`
on `(Scheme.{u}, fppf)`: every object of `𝒴` lifts fppf-locally to `𝒳` up to isomorphism, and every
isomorphism between images of two objects of `𝒳` lifts fppf-locally. Say that `𝒳` *is a gerbe*
(*Stacks.IsGerbeOverSomeSpace*) when it is a gerbe over some algebraic space (stacks-06QB lines
2613–2617, Definition 101.28.1). This is weaker than AlgebraicModuliForArithmeticGeometry §4.1's
site-level `IsGerbe` on `(Scheme.{u}, fppf)`, which asks for local nonemptiness over every scheme
and local isomorphism of every two objects: that is the case of a gerbe over the final object
`Spec ℤ`, the fibres of `Spec ℤ` being single objects with only the identity, so an algebraic stack
satisfies `IsGerbe` exactly when it is a gerbe over `Spec ℤ` (Checks). Prove that if `𝒳` is a
gerbe, the fppf sheafification of
`T ↦ Ob 𝒳(T)/≅`, SchemeAndStackFoundations §1.23's `toModuliSheaf` of `moduliFunctor 𝒳`, is an
algebraic space `𝒳^♭`, the *base* of `𝒳` (*Stacks.gerbeBase*), and `𝒳 → 𝒳^♭` makes `𝒳` a gerbe over
it (stacks-06QB lines 2624–2640, Lemma 101.28.2). *Needs:* AlgebraicModuliForArithmeticGeometry §4.1
(`relativeGerbe`, `IsGerbe.equivalence_iff`); SchemeAndStackFoundations §1.18, §1.23
(`moduliFunctor`, `toModuliSheaf`); gap:stack-morphism-permanence (for the descent clause);
AlgebraicModuliForArithmeticGeometry §5.1 (`ArithmeticModuli.Rigidification.stack`,
`ArithmeticModuli.Rigidification.stabilizer_kernel`, `ArithmeticModuli.Rigidification.geometry`) and
SchemeAndStackFoundations §1.20 (`setoid_criterion`), for the comparison bullet.

The API consists of the following facts.

- Base change: if `𝒳 → 𝒴` is a gerbe, so is `𝒳 ×_𝒴 𝒴' → 𝒴'` (stacks-06QB lines 2641–2651, Lemma
  101.28.3; `relativePullback`).
- Composition: gerbes over gerbes are gerbes (stacks-06QB lines 2652–2654, Lemma 101.28.4;
  `relativeComposition`).
- Descent: if `𝒴' → 𝒴` is surjective, flat and locally of finite presentation and `𝒳 ×_𝒴 𝒴' → 𝒴'`
  is a gerbe, so is `𝒳 → 𝒴` (stacks-06QB lines 2655–2663, Lemma 101.28.5; `relativeDescent` with
  gap:stack-morphism-permanence for local essential surjectivity of such `𝒴' → 𝒴`).
- Uniqueness of the base: any gerbe `𝒳 → X` over an algebraic space is identified with
  `𝒳 → 𝒳^♭` by a unique isomorphism `𝒳^♭ ≅ X` under `𝒳`, and every morphism from `𝒳` to an algebraic
  space factors uniquely through `𝒳^♭`.
- Being a gerbe over `𝒴` is invariant under equivalences of `𝒳` and `𝒴`.
- Comparison with rigidification: if `𝒳` is locally of finite presentation over a scheme `S` and
  `I_𝒳 → 𝒳` is flat and of finite presentation, AlgebraicModuliForArithmeticGeometry §5.1's
  rigidification `ρ : 𝒳 → 𝒳▹I_𝒳` by the whole inertia is a gerbe
  (`ArithmeticModuli.Rigidification.geometry`) onto an algebraic stack with trivial inertia, every
  object lifting locally to some `ρx` and the automorphism sheaf of `ρx` being `Aut(x)/Aut(x)`
  (`ArithmeticModuli.Rigidification.stabilizer_kernel`); so `𝒳▹I_𝒳` is an algebraic space
  (SchemeAndStackFoundations §1.20's `setoid_criterion`), and the uniqueness of the base identifies
  it with `𝒳^♭` under `𝒳`. 2.1 builds `𝒳^♭` for every gerbe, and 2.4 needs the inertia only flat and
  locally of finite presentation, with no base scheme.

**Checks.**

- For `G` flat and locally of finite presentation over `k`, `BG → Spec k` is a gerbe with base
  `Spec k`; every algebraic space `X` is a gerbe over itself with base `X`.
- `[𝔸¹/𝔾_m] → Spec k` is not a gerbe: the objects `0` and `1` over `k̄` are not fppf-locally
  isomorphic.
- For `G ≠ 1`, `Spec k → BG` is surjective and is not a gerbe: the automorphisms of the trivial
  torsor do not lift fppf-locally to `Spec k`, whose objects have only identity automorphisms.
- Being a gerbe over some algebraic space is not the site-level `IsGerbe` of
  AlgebraicModuliForArithmeticGeometry §4.1: `𝔸¹_k` is a gerbe over itself and does not satisfy
  `IsGerbe`, its objects `0` and `1` over `Spec k` not being fppf-locally isomorphic (two morphisms
  to a sheaf that agree on an fppf covering agree); `B𝔾_{m,𝔽_p}` is a gerbe over `Spec 𝔽_p` and does
  not satisfy `IsGerbe`, having no object over any scheme over `ℚ`, so none over the members of an
  fppf covering of `Spec ℚ`; `B𝔾_{m,ℤ}` satisfies both, with base `Spec ℤ`.

### 2.2 Gerbes with a section are classifying stacks

Prove that for `π : 𝒳 → U` a gerbe over an algebraic space with a section `x : U → 𝒳` and
`G := Isom_𝒳(x, x) = U ×_{x,𝒳} I_𝒳`, the canonical morphism `[U/G] → 𝒳` from the quotient by the
trivial action, sending the trivial torsor to `x`, is an equivalence; `G → U` is flat and locally of
finite presentation; and `x : U → 𝒳` is surjective, flat and locally of finite presentation
(stacks-06QB lines 2664–2695, Lemma 101.28.6) (*Stacks.IsGerbeOver.classifyingEquiv*). For the proof,
`R = U ×_{x,𝒳,x} U` factors through the diagonal of `U` and equals `G`; the canonical
`[U/R] → 𝒳` is fully faithful and, by the lifting property of a gerbe, essentially surjective.
*Needs:* 2.1; SchemeAndStackFoundations §1.20 (`inertia`), §1.21 (`Stack.quotient`, `actionQuotient`,
`actionQuotient.torsorEquiv`); gap:flat-groupoid-quotients (Lemmas 94.16.1, 97.17.1, 97.18.3).

**Checks.**

- For `𝒳 = BG` over `U` with `x` the trivial torsor, `Isom(x, x) = G` and the equivalence is the
  identity of `BG`.
- The gerbe hypothesis is needed: `[𝔸¹/𝔾_m] → Spec k` with the section `1` has `Isom(1, 1)` trivial,
  and `[Spec k / 1] = Spec k` is not equivalent to `[𝔸¹/𝔾_m]`.
- The group is the automorphism group of the given section, not an abstract group: for `G = S₃` over
  `ℝ` and a section `P` of `BG` given by a nontrivial torsor, `Isom(P, P)` is the inner form of `S₃`
  twisted by `P`, and the equivalence is `B(Isom(P, P)) ≃ BS₃` sending the trivial torsor to `P`
  (SchemeAndStackFoundations §1.16's twisting bijection).

### 2.3 Fppf-local structure, flatness and smoothness

Prove that `𝒳 → 𝒴` is a gerbe iff it becomes a classifying stack fppf-locally on `𝒴`: for some
surjective, flat, locally finitely presented `U → 𝒴` from an algebraic space, `𝒳 ×_𝒴 U ≅ [U/G]` over
`U` with `G` a flat, locally finitely presented group algebraic space over `U` (stacks-06QB lines
2696–2712, Lemma 101.28.7); that a gerbe is surjective, flat and locally of finite presentation
(stacks-06QB lines 2713–2721, Lemma 101.28.8); that for a smooth morphism `X → Y` of algebraic
spaces and a group algebraic space `G` over `Y`, flat and locally of finite presentation over `Y`,
acting on `X` over `Y`, the quotient stack `[X/G]` is smooth over `Y`, even when `G` is not smooth
over `Y`; and that a gerbe is smooth (stacks-06RD lines 3335–3357, Lemmas 101.33.7–101.33.8).
*Needs:* 2.1, 2.2; SchemeAndStackFoundations §1.21 (`Stack.quotient`, `actionQuotient`);
gap:flat-groupoid-quotients (`[X/G]` is algebraic and `X → [X/G]` is surjective, flat and locally of
finite presentation for the action groupoid `G ×_Y X ⇉ X`, Theorem 97.17.2 and Lemma 97.17.1;
`[U/G]` is algebraic for the group algebraic space `G` over the algebraic space `U`, Lemma 97.18.3,
and is a gerbe over `U`, Lemmas 78.27.1–78.27.2);
gap:stack-morphism-permanence (descent of smoothness, flatness and local finite presentation).

**Checks.**

- `Bμ_p → Spec 𝔽_p` is smooth although `μ_p` is not, while `Spec 𝔽_p → Bμ_p` is flat and locally of
  finite presentation and not smooth.
- `B𝔾_m → Spec ℤ` is a gerbe; its base change to `Spec 𝔽_p` is `B𝔾_{m,𝔽_p} → Spec 𝔽_p`.
- Flatness does not characterise gerbes: `Spec k → B𝔾_m` is surjective, flat and locally of finite
  presentation and is not a gerbe (2.1).

### 2.4 The inertia criterion

Prove that an algebraic stack `𝒳` is a gerbe iff `I_𝒳 → 𝒳` is flat and locally of finite
presentation (stacks-06QB lines 2722–2774, Proposition 101.28.9), and that for a gerbe `f : 𝒳 → 𝒴`
the relative inertia `I_{𝒳/𝒴} → 𝒳` is flat and locally of finite presentation, the diagonal
`𝒳 → 𝒳 ×_𝒴 𝒳` is surjective, flat and locally of finite presentation; for algebraic spaces `T₁`,
`T₂` with morphisms `x_i : T_i → 𝒳`, so is `T₁ ×_{x₁,𝒳,x₂} T₂ → T₁ ×_{f∘x₁,𝒴,f∘x₂} T₂`; and for
`x₁, x₂ : T → 𝒳` from one algebraic space `T`, so is `Isom_𝒳(x₁, x₂) → Isom_𝒴(f∘x₁, f∘x₂)`
(stacks-06QB lines 2775–2820, Lemma 101.28.10). For the converse of the proposition, choose a smooth
presentation `[U/R]`, let `G` be the stabilizer of the groupoid (flat and locally of finite
presentation as a base change of the inertia), form `R/G` by the free action of `G` on `R` (an
algebraic space by `artinBootstrap`), and show that `𝒳 → U/(R/G)` is a gerbe over an algebraic
space. *Needs:* 2.1–2.3; SchemeAndStackFoundations §1.14 (`stabilizer`), §1.17 (`artinBootstrap`),
§1.20 (`stack_presentation`, `inertia`, `setoid_criterion`); gap:inertia-of-presentations (the
stabilizer of the presentation is a base change of the inertia); gap:flat-groupoid-quotients;
gap:stack-morphism-permanence.

**Checks.**

- `[𝔸¹/𝔾_m]` is not a gerbe: its inertia has fibre `𝔾_m` over `0` and is trivial over `1`, hence is
  not flat.
- `Bμ_p` over `𝔽_p` is a gerbe: its inertia is a form of `μ_p`, flat and finitely presented.
- For a free action of a group algebraic space `G`, flat and locally of finite presentation over an
  algebraic space `Y`, on an algebraic space `X` over `Y`, `I_{[X/G]}` is trivial, so
  `[X/G]` is a gerbe over itself and an algebraic space (SchemeAndStackFoundations §1.20's
  `setoid_criterion`).

### 2.5 The diagonal criterion and universal homeomorphisms

Prove that `f : 𝒳 → 𝒴` makes `𝒳` a gerbe over `𝒴` iff `f` and `Δ_f` are surjective, flat and locally
of finite presentation (stacks-06QB lines 2821–2843, Proposition 101.28.11); that a gerbe is a
universal homeomorphism, that is `|𝒳 ×_𝒴 𝒴'| → |𝒴'|` is a homeomorphism for every `𝒴' → 𝒴`
(stacks-06QB lines 2862–2875, Lemma 101.28.13); and that if `𝒳` is a gerbe over `𝒴` and `Δ_𝒳` is
quasi-compact then so is `Δ_𝒴` (stacks-06QB lines 2876–2890, Lemma 101.28.14). *Needs:* 2.1, 2.3
(a gerbe is surjective, flat and locally of finite presentation), 2.4;
SchemeAndStackFoundations §1.20 (`Stacks.points`, `Stacks.points.pullbackSurjective`);
gap:flat-lfp-open (openness of flat locally finitely presented morphisms);
gap:stack-morphism-permanence (descent of quasi-compactness).

**Checks.**

- `Spec k → B𝔾_m` is surjective, flat and locally of finite presentation, and its diagonal is the
  unit section `Spec k → 𝔾_m`, which is not flat; it is not a gerbe.
- `Spec k → Spec k[ε]` is a universal homeomorphism and not a gerbe (it is not flat): the converse of
  Lemma 101.28.13 fails. `Bμ_p → Spec 𝔽_p` is a gerbe and a universal homeomorphism.
- Quasi-compactness of the diagonal does not go up: for the constant group `ℤ` over `k`,
  `Bℤ → Spec k` is a gerbe, `Spec k` has quasi-compact diagonal and `Bℤ` does not, its diagonal
  pulling back to `ℤ_k = ⊔_ℤ Spec k`.

### 2.6 The dense open gerbe

Prove that a reduced algebraic stack `𝒳` with `I_𝒳 → 𝒳` quasi-compact has a dense open substack which
is a gerbe, namely the largest open substack over which `I_𝒳 → 𝒳` is flat and locally of finite
presentation (stacks-06QB lines 2919–2938, Proposition 101.29.1) (*Stacks.denseOpenGerbe*). For the
proof take a presentation `[U/R]`; the stabilizer `G → U` is quasi-compact and locally of finite type;
the largest open `W ⊆ U` over which `G` is flat and locally of finite presentation is dense by generic
flatness and `R`-invariant because `s^*G ≅ t^*G` over `R`; its open substack has flat locally finitely
presented inertia, and 2.4 applies. *Needs:* 0.3 (open substacks), 0.5, 2.4;
SchemeAndStackFoundations §1.20 (`stack_presentation`); gap:generic-flatness-spaces;
gap:inertia-of-presentations (Lemmas 101.5.1, 101.5.7); gap:stack-morphism-permanence.

**Checks.**

- On `[𝔸¹/𝔾_m]` the dense open gerbe is the open point `[𝔾_m/𝔾_m] = Spec k`, and it is the largest.
- On `[Spec k[x₀, x₁, …]/𝔾_m]` with `t·xᵢ = t^{pⁱ} xᵢ` (stacks-06QB lines 2943–2953, Example 101.29.2)
  the dense open gerbe is the stratum `x₀ ≠ 0`, with trivial stabilisers; the remaining strata are
  gerbes with groups `μ_{pⁱ}` and `𝔾_m`.
- Reducedness is needed: on `[Spec k[ε]/𝔾_m]` with `ε` of weight one the stabilizer over the atlas is
  `Spec k[ε][λ^{±1}]/((λ − 1)ε)`, which is not flat over `k[ε]` (`λ − 1` kills `ε` and is not in `εB`);
  the only dense open substack is the whole stack, which is not a gerbe, while its reduction `B𝔾_m`
  is.

### Examples

`BG → Spec k` for flat locally finitely presented `G`, including `Bμ_p`; `B𝔾_m → Spec ℤ`; the open
point of `[𝔸¹/𝔾_m]` as its dense open gerbe.

### Dependencies

Layer 0; AlgebraicModuliForArithmeticGeometry §§4.1, 5.1; SchemeAndStackFoundations §§1.14,
1.16–1.18, 1.20–1.21, 1.23; gap:stack-morphism-permanence, gap:flat-lfp-open,
gap:inertia-of-presentations, gap:flat-groupoid-quotients, gap:generic-flatness-spaces.

## Layer 3: reduced one-point stacks and residual gerbes

### 3.1 Reduced one-point stacks

Prove, for an algebraic stack `𝒵`: if some `Spec k → 𝒵` with `k` a field is surjective and flat, then
every `Spec k' → 𝒵` with `k'` a field is surjective and flat (stacks-06ML lines 1135–1148, Lemma
100.11.1); `𝒵` is reduced with `|𝒵|` a singleton iff there is a surjective flat `Spec k → 𝒵`, iff
there is one which is moreover locally of finite type (stacks-06ML lines 1149–1175, Lemma 100.11.2);
`𝒵` is reduced, locally Noetherian with `|𝒵|` a singleton iff there is a surjective, flat, locally
finitely presented `Spec k → 𝒵` (stacks-06ML lines 1178–1198, Lemma 100.11.3)
(*Stacks.IsReducedSingleton*, *Stacks.IsReducedNoetherianSingleton*). For the proof, the generic
point of a reduced atlas gives a flat point; an atlas pulled back to a flat point is smooth over a
field, hence regular; a closed point of an affine atlas gives a point locally of finite type, of
finite presentation when the atlas is locally Noetherian. *Needs:* 0.1; SchemeAndStackFoundations
§1.19, §1.20 (`Stacks.points.pullbackSurjective`); gap:stack-morphism-permanence;
gap:reduced-regular-smooth-local.

**Checks.**

- `Bμ_p` over `𝔽_p` and `B𝔾_m` over `k` are reduced, locally Noetherian and one-point:
  `Spec k → BG` is surjective, flat and locally of finite presentation for `G` flat and locally of
  finite presentation.
- `Spec k[ε]` has one point and is not reduced; `Spec k → Spec k[ε]` is surjective and not flat.
- For `X = U/G` of stacks-06ML lines 1238–1256 (0.2), `X` is reduced with one point and is not
  locally Noetherian; `Spec ℚ̄ → X` is surjective, flat and locally of finite type and not locally of
  finite presentation, so the two lemmas do not collapse: `Spec ℚ̄ → U` is a closed immersion whose
  ideal, generated by the `a ⊗ 1 − 1 ⊗ a`, is not finitely generated (the point is not open in the
  profinite space `|U|`), and it is flat because every local ring of `U` is the field `ℚ̄`.

### 3.2 Rigidity of monomorphisms

Prove that if `𝒵' → 𝒵` is a monomorphism and `𝒵` has a surjective, flat, locally finitely presented
`Spec k → 𝒵`, then either `𝒵'` is empty or `𝒵' → 𝒵` is an equivalence (stacks-06ML lines 1199–1213,
Lemma 100.11.4); and that a reduced one-point `𝒵` contains a unique substack `𝒵'` (Convention 4)
which is a reduced, locally Noetherian one-point algebraic stack, with `𝒵' → 𝒵` a monomorphism,
called here the *locally Noetherian core* of `𝒵`, and for every surjective, flat `Spec k → 𝒵` locally
of finite type, `𝒵' ≃ [Spec k/R]` with `R = Spec k ×_𝒵 Spec k` (stacks-06ML lines 1214–1237, Lemma
100.11.5)
(*Stacks.reducedNoetherianSingletonCore*). For the first, the pullback of `𝒵'` to `Spec k` is a
nonempty algebraic space with a monomorphism to `Spec k`, hence `Spec k` by 0.2, and every object of
`𝒵` is fppf-locally a pullback of the point. *Needs:* 0.2, 3.1; SchemeAndStackFoundations §1.21
(`Stack.quotient`), §1.8 (`Spaces.EtaleLocal`); Mathlib
`AlgebraicGeometry.LocallyOfFinitePresentation.iff_locallyOfFiniteType` (a morphism of algebraic
spaces locally of finite type into the spectrum of a field is locally of finite presentation);
gap:flat-groupoid-quotients (`[Spec k/R]` is algebraic for the groupoid in algebraic spaces `R`,
Theorem 97.17.2); gap:stack-morphism-permanence (fppf-local essential surjectivity of
`Spec k → 𝒵`).

**Checks.**

- For `X = U/G` of Example 100.11.6 (0.2), `Spec ℚ̄ → X` is a monomorphism from a nonempty stack which
  is not an equivalence; `X` is reduced one-point but not locally Noetherian, and its locally
  Noetherian core is `Spec ℚ̄ = [Spec ℚ̄/R]` with `R = Spec ℚ̄ ×_X Spec ℚ̄ = Spec ℚ̄`, a proper substack
  (stacks-06ML lines 1238–1256). The first lemma does not apply to `X`: no surjective flat
  `Spec k → X` is locally of finite presentation, `X` not being locally Noetherian (3.1).
- The monomorphism hypothesis is needed: `Spec k → BG` is nonempty, `BG` has the flat finitely
  presented point `Spec k`, and `Spec k → BG` is not an equivalence for `G ≠ 1`.
- For `𝒵 = BG` with `G` flat and locally of finite presentation over `k`, the locally Noetherian core
  is `BG` itself, and for `𝒵 = Spec k` it is `Spec k`.

### 3.3 Residual gerbes

Prove that for `x ∈ |𝒳|` the following are equivalent: there is a monomorphism `𝒵 → 𝒳` from an
algebraic stack with `|𝒵|` a singleton mapping to `x`; there is one with `𝒵` reduced; there are a
monomorphism `f : 𝒵 → 𝒳` and a surjective flat `z : Spec k → 𝒵` with `f(z) = x`; and that then there
is a unique substack `𝒵_x ⊆ 𝒳` which is a reduced, locally Noetherian algebraic stack with `|𝒵_x|` a
singleton mapping to `x` (stacks-06ML lines 1260–1286, Lemma 100.11.7). Define: the *residual gerbe
of `𝒳` at `x` exists* (*Stacks.ResidualGerbeExists*) when these conditions hold, and the *residual
gerbe* `𝒵_x` (*Stacks.residualGerbe*) is that substack (stacks-06ML lines 1288–1297, Definition
100.11.8). *Needs:* 0.2, 0.5, 3.1, 3.2; SchemeAndStackFoundations §1.18.

The API consists of the following facts.

- `𝒵_x → 𝒳` is a monomorphism with image `{x}`, and there is a surjective, flat, locally finitely
  presented `Spec k → 𝒵_x` (stacks-06ML lines 1300–1303).
- Existence and the substack depend only on `x ∈ |𝒳|`, and an equivalence `𝒳 ≃ 𝒳'` carries `𝒵_x` to
  a substack equivalent to `𝒵_{x'}`.
- For an open substack `𝒰 ∋ x`, the residual gerbe of `𝒰` at `x` exists iff that of `𝒳` does, and
  they are the same substack.

**Checks.**

- For a scheme `X` and `x ∈ X`, `𝒵_x = Spec κ(x)` with Mathlib's `Scheme.residueField`
  (stacks-06ML lines 1306–1308, Example 100.11.9).
- On `[𝔸¹/𝔾_m]`, `𝒵_0 = B𝔾_m` (the closed substack `[{0}/𝔾_m]`) and `𝒵_1 = Spec k`; on `BG` over
  `k`, `𝒵 = BG`.
- `Spec k → BG` with `G ≠ 1` has one-point image and is not the residual gerbe: it is not a
  monomorphism.
- At the point of `Spec k[ε]` the residual gerbe is `Spec k`, not `Spec k[ε]`: the definition
  requires reducedness.

### 3.4 Properties of residual gerbes

Prove, when `𝒵_x` exists: `𝒵_x` is regular (stacks-06ML lines 1312–1319, Lemma 100.11.10); every
field-valued point of `𝒳` in the class `x` factors through `𝒵_x` (stacks-06ML lines 1320–1327, Lemma
100.11.11); every monomorphism `𝒵 → 𝒳` from a reduced, locally Noetherian one-point stack with image
`x` factors through an equivalence onto `𝒵_x` (stacks-06ML lines 1328–1337, Lemma 100.11.12); if `𝒳`
is DM, quasi-DM, separated or quasi-separated, so is `𝒵_x` (stacks-06RD lines 452–456, Lemma
101.4.16); `𝒵_x` is a gerbe over a reduced, locally Noetherian algebraic space `𝒵_x^♭` with one point,
its base (stacks-06QB lines 2846–2861, Lemma 101.28.12); and if `π : 𝒳 → 𝒴` is a gerbe and `𝒵_{π(x)}`
exists, then `𝒵_x = 𝒵_{π(x)} ×_𝒴 𝒳` (stacks-06RD lines 4831–4839, Lemma 101.51.1). For an algebraic
space `X`, `𝒵_x` is an algebraic space, the residual space of `X` at `x` (stacks-06ML lines 1308–1310;
stacks-decent-spaces lines 1500–1540, Lemma 68.13.5 and Definition 68.13.6). *Needs:* 0.1, 0.2, 2.1,
2.3, 2.4, 2.5, 3.1–3.3; SchemeAndStackFoundations §1.20 (`inertia`); gap:stack-separation-axioms;
gap:stack-morphism-permanence; gap:reduced-regular-smooth-local; gap:inertia-of-presentations (the
inertia is locally of finite type, Lemma 101.5.1, for the gerbe clause: its pullback to the flat,
locally finitely presented point of 3.1 is then locally of finite type over a field); Mathlib
`AlgebraicGeometry.LocallyOfFinitePresentation.iff_locallyOfFiniteType` with SchemeAndStackFoundations
§1.8 (`Spaces.EtaleLocal`) (locally of finite type over a field is locally of finite presentation, so
2.4 applies).

**Checks.**

- Regularity holds even at singular points: at the origin of `Spec k[x, y]/(xy)` the residual gerbe is
  `Spec k`, which is regular.
- The base need not be the spectrum of a field: for `X = Spec ℚ(t)/ℤ`, with `ℤ` acting freely by
  `t ↦ t + 1`, the residual gerbe is `X` itself, a reduced locally Noetherian one-point algebraic space which is not
  the spectrum of a field (an étale cover of `Spec F` by `Spec ℚ(t)` would make
  `ℤ × Spec ℚ(t) = Spec(ℚ(t) ⊗_F ℚ(t))` finite over `Spec ℚ(t)`). Layer 5 adds the decency that makes
  the base a field.
- For `𝒳 = [𝔸¹/𝔾_m]`, `𝒵_0 = B𝔾_m` is a gerbe over `𝒵_0^♭ = Spec k`.
- The pullback formula needs a gerbe: for the non-gerbe `[𝔸¹/𝔾_m] → Spec k` and `y` the point of
  `Spec k`, `𝒵_y ×_{Spec k} [𝔸¹/𝔾_m]` is the whole stack, not the residual gerbe at `0` or `1`.

### 3.5 Functoriality

Prove that a morphism `f : 𝒳 → 𝒴` with `f(x) = y`, where `𝒵_x` and `𝒵_y` exist, restricts to a
morphism `𝒵_x → 𝒵_y` with a 2-commutative square (stacks-06ML lines 1338–1351, Lemma 100.11.13)
(*Stacks.residualGerbeMap*); and that if for one representative `Spec k → 𝒳` of `x` the morphism
`Spec k ×_𝒳 Spec k → Spec k ×_𝒴 Spec k` is an isomorphism, then `𝒵_x → 𝒵_y` is an isomorphism
(stacks-06ML lines 1352–1368, Lemma 100.11.14). *Needs:* 3.2–3.4; gap:flat-groupoid-quotients (the
canonical `[U/R] → 𝒳` is fully faithful).

**Checks.**

- For `Spec k → BG` with `G ≠ 1`, the induced `𝒵_x = Spec k → 𝒵_y = BG` is not an isomorphism, and
  indeed `Spec k ×_{Spec k} Spec k = Spec k` differs from `Spec k ×_{BG} Spec k = G`.
- For an open immersion `𝒰 → 𝒳` the induced map of residual gerbes is an isomorphism.
- For `G ≠ 1` and `BG → Spec k`, the induced `BG → Spec k` is not an isomorphism, and the criterion
  fails: `Spec k ×_{BG} Spec k = G`, while `Spec k ×_{Spec k} Spec k = Spec k`; for `G = ℤ/2` the two
  sides have two points and one point, for `G = μ_p` in characteristic `p` lengths `p` and `1`. For
  `G = 1`, `BG = Spec k` and the induced map is the identity, as the criterion predicts.

### Examples

Residual gerbes of `[𝔸¹/𝔾_m]` (`B𝔾_m` and `Spec k`), of a scheme (`Spec κ(x)`), of `BG`, and of the
non-decent one-point spaces `U/G` and `Spec ℚ(t)/ℤ`.

### Dependencies

Layers 0 and 2; SchemeAndStackFoundations §§1.8, 1.18–1.21; Mathlib
`AlgebraicGeometry.LocallyOfFinitePresentation.iff_locallyOfFiniteType`;
gap:stack-morphism-permanence, gap:stack-separation-axioms, gap:flat-groupoid-quotients,
gap:reduced-regular-smooth-local, gap:inertia-of-presentations.

## Layer 4: existence of residual gerbes

### 4.1 Finite type points

Prove that for `x ∈ |𝒳|` the following are equivalent: `x` is a finite type point; there are an
algebraic stack `𝒵` with `|𝒵|` a singleton and a morphism `𝒵 → 𝒳` locally of finite type with image
`{x}`; the residual gerbe `𝒵_x` exists and `𝒵_x → 𝒳` is locally of finite type (stacks-06RD lines
1609–1665, Lemma 101.18.7). Moreover, for a smooth `U → 𝒳` from an affine scheme and a closed point
`u ∈ U` over `x`, with `u = Spec κ(u)`, `𝒵_x ≃ [u/(u ×_𝒳 u)]` and `u → 𝒵_x` is surjective, flat and
locally of finite presentation. For the proof, the projections of `u ×_𝒳 u` to `u` are locally of
finite type over a field, hence flat and locally of finite presentation; the quotient
(SchemeAndStackFoundations §1.21's `Stack.quotient`) of this groupoid in algebraic spaces is
algebraic (gap:flat-groupoid-quotients, Theorem 97.17.2), maps fully faithfully to `𝒳`, and is the
residual gerbe by 3.4; local finite type descends along the fppf covering of `𝒵_x ×_𝒳 U` by
`u ×_𝒳 U`. *Needs:* 0.2 (the fully faithful `[u/(u ×_𝒳 u)] → 𝒳` is a monomorphism), 1.1, 3.2–3.4;
SchemeAndStackFoundations §1.21 (`Stack.quotient`), §1.8 (`Spaces.EtaleLocal`); Mathlib
`AlgebraicGeometry.LocallyOfFinitePresentation.iff_locallyOfFiniteType` (local finite type over a
field implies local finite presentation); gap:flat-groupoid-quotients (algebraicity of
`[u/(u ×_𝒳 u)]`; full faithfulness of `[u/(u ×_𝒳 u)] → 𝒳`); gap:stack-morphism-permanence (descent
of local finite type).

**Checks.**

- On `[𝔸¹/𝔾_m]`, `𝒵_1 = Spec k → [𝔸¹/𝔾_m]` is an open immersion, locally of finite type.
- Existence alone does not give a finite type point: at the generic point of `𝔸¹_k`, which is not a
  finite type point (1.1), the residual gerbe `Spec k(t)` exists and `Spec k(t) → 𝔸¹_k` is not
  locally of finite type (the argument of 1.1 with `K = k(t)`).
- At the generic point of `Spec ℤ_(p)`, a finite type point, `𝒵 = Spec ℚ → Spec ℤ_(p)` is of finite
  type.

### 4.2 Flat locally quasi-finite presentations

Prove that if there are a scheme `U` and a surjective, flat, locally finitely presented, locally
quasi-finite `U → 𝒳`, then the residual gerbe of `𝒳` exists at every point: with
`U' = ⊔_{u ↦ x} Spec κ(u)` and `R' = U' ×_𝒳 U'`, the projections `R' → U'` are flat, locally of
finite presentation and locally quasi-finite, `[U'/R']` is algebraic, maps to `𝒳` by a monomorphism
with image `{x}`, and is reduced and locally Noetherian (stacks-06RD lines 3061–3095, the proof of
Lemma 101.31.2). Deduce existence of residual gerbes on algebraic spaces (residual spaces;
stacks-decent-spaces lines 1500–1531, Lemma 68.13.5), on Deligne–Mumford stacks (the étale atlas of
SchemeAndStackFoundations §1.19's `IsDeligneMumford`), and on quasi-DM stacks (stacks-06RD lines
3059–3060, Lemma 101.31.2, through Theorem 101.21.3). *Needs:* 0.2, 3.3, 3.4;
SchemeAndStackFoundations §1.19 (`IsDeligneMumford`), §1.21 (`Stack.quotient`), §1.8
(`Spaces.EtaleLocal`); Mathlib `AlgebraicGeometry.LocallyOfFinitePresentation.iff_locallyOfFiniteType`
(the projections of `R'` are locally of finite type over `U'`, hence locally of finite
presentation); gap:quasi-dm-flat-presentation; gap:flat-groupoid-quotients (`[U'/R']` is algebraic
for the groupoid in algebraic spaces `R'`, Theorem 97.17.2);
gap:quasi-finite-over-fields (the projections of `R'` are locally quasi-finite);
gap:stack-morphism-permanence.

**Checks.**

- `B(ℤ/2)` over a field is Deligne–Mumford and its residual gerbe is `B(ℤ/2)`.
- `Bμ_p` over `𝔽_p` is quasi-DM and not DM: the atlas `Spec 𝔽_p → Bμ_p` is flat, finitely presented
  and quasi-finite, and the residual gerbe is `Bμ_p`.
- On the algebraic space `𝔸¹_ℚ/ℤ` (SchemeAndStackFoundations §1.12) residual spaces exist at every
  point, and at the generic point the residual space is not the spectrum of a field (the Check of
  SchemeAndStackFoundations §1.7 on the generic point of `𝔸¹_ℚ/ℤ`).
- `B𝔾_m` is not quasi-DM, and its residual gerbe exists by 4.3: the hypothesis is sufficient, not
  necessary.

### 4.3 Gerbes and stacks with quasi-compact inertia

Prove that if `𝒳` is a gerbe, the residual gerbe exists at every `x`, namely
`𝒵_x = (𝒳 ×_{𝒳^♭} Z)_red` for the residual space `Z` of the base `𝒳^♭` at the image of `x`
(stacks-06QB lines 2893–2904, Lemma 101.28.15); by 3.4's pullback formula the reduction changes
nothing and `Z` is the base `𝒵_x^♭` of `𝒵_x`; and that if `I_𝒳 → 𝒳` is quasi-compact, the residual
gerbe exists at every `x`, namely the residual gerbe at `x` of the dense open gerbe (2.6) of the
reduced closure `𝒳'` of `x` (stacks-06RD lines 3048–3056, Lemma 101.31.1), whose inertia is the
base change `I_𝒳 ×_𝒳 𝒳'` (0.2's API, Lemma 101.5.6) and so is quasi-compact. *Needs:* 0.2, 0.5, 2.1,
2.3, 2.5, 2.6, 3.3, 3.4 (the pullback formula and the base, for the identification of `Z`), 4.2;
gap:stack-morphism-permanence (a stack locally of finite type over a locally Noetherian one is
locally Noetherian; base change of quasi-compact morphisms).

**Checks.**

- `[𝔸¹/𝔾_m]` has quasi-compact inertia; `𝒵_0 = B𝔾_m` and `𝒵_1 = Spec k`, the latter being the dense
  open gerbe of the closure `|𝒳|` of `1`.
- For the constant group `ℤ` over `k`, `Bℤ` has inertia which is not quasi-compact and is a gerbe, so
  its residual gerbe `Bℤ` exists by the first statement.
- On `BG` for the non-separated group space `G = 𝔾_{a,ℚ}/ℤ` of 1.4's first Check the inertia is
  quasi-compact (the base change `G → Spec ℚ` is the image of the quasi-compact `𝔸¹_ℚ`) and not
  quasi-separated; both statements give `𝒵 = BG`.

### 4.4 Locally Noetherian stacks

Prove that if `𝒳` is locally Noetherian the residual gerbe exists at every point (stacks-06RD lines
3096–3129, Lemma 101.31.3). For the proof, replace `𝒳` by the open substack image of an affine
Noetherian smooth chart `U` (0.3), choose `u` over `x` whose closure meets the fibre `E` of `x` only in
`u`, and show that `R' = u ×_𝒳 u` is the closed subspace of the algebraic space `u ×_𝒳 U` over the
reduced closure of `u`, so that its projections are flat and locally of finite presentation and
`[u/R']` is the residual gerbe. *Needs:* 0.2 (the fully faithful `[u/R'] → 𝒳` is a monomorphism),
0.3, 3.3, 3.4; SchemeAndStackFoundations §1.20 (`stack_presentation`), §1.21 (`Stack.quotient`), §1.8
(`Spaces.EtaleLocal`); Mathlib `AlgebraicGeometry.LocallyOfFinitePresentation.iff_locallyOfFiniteType`
(the projections of `R'`, locally of finite type over the field `κ(u)`, are locally of finite
presentation), `AlgebraicGeometry.Scheme.IdealSheafData.vanishingIdeal` (the reduced closure of `u`
in `U`); gap:flat-groupoid-quotients (`[u/R']` is algebraic for the groupoid in algebraic spaces
`R'`, Theorem 97.17.2); gap:stack-morphism-permanence.

**Checks.**

- `Spec ℚ(t)/ℤ` is locally Noetherian and its residual gerbe at its point is the space itself.
- `[Spec k[x₀, x₁, …]/𝔾_m]` of 2.6 is not locally Noetherian, and its residual gerbes exist by 4.3.
- On `X = U/G` of Example 100.11.6 (0.2), which is not locally Noetherian, the residual gerbe exists
  by 4.1 (the point is a finite type point, `Spec ℚ̄ → X` being locally of finite type) and is
  `Spec ℚ̄`.

### 4.5 Closed points

Prove that for `𝒳` locally Noetherian and `x ∈ |𝒳|`, `x` is a closed point iff `𝒵_x → 𝒳` is a closed
immersion, and then `𝒵_x` is the reduced induced closed substack on `{x}` and `𝒵_x → 𝒳` is locally of
finite type (stacks-06RD lines 4870–4878, Lemma 101.51.4 and its proof). *Needs:* 0.3, 0.5, 1.2,
3.3, 4.1, 4.4; gap:stack-morphism-permanence.

The API consists of the following fact.

- For `𝒳` locally Noetherian, `x` a closed point and `𝒴` reduced, every morphism `f : 𝒴 → 𝒳` with
  `|f|(|𝒴|) ⊆ {x}` factors through `𝒵_x`, with no hypothesis on the inertia: `𝒵_x` is the reduced
  induced closed substack on `{x}`, and 0.5's factorisation criterion applies (stacks-06RD lines
  4866–4869, Remark 101.51.3). 5.2 proves the factorisation at every point of a decent or locally
  Noetherian stack with quasi-compact inertia.

**Checks.**

- On `[𝔸¹/𝔾_m]`, `𝒵_0 = B𝔾_m → 𝒳` is a closed immersion and `𝒵_1 = Spec k → 𝒳` is an open immersion
  which is not closed.
- For a discrete valuation ring `R`, the residual gerbe at the closed point is the closed immersion
  `Spec(R/𝔪) → Spec R`, and at the generic point the open immersion `Spec K → Spec R`.
- The locally Noetherian hypothesis is needed: on `X = U/G` of Example 100.11.6 the unique point is
  closed and `𝒵_x = Spec ℚ̄ → X` is a monomorphism which is not a closed immersion; otherwise it would
  be a closed substack of the reduced `X` with all its points, hence `X` (0.5), whereas
  `Spec ℚ̄ → X` is not an isomorphism (0.2).

### Examples

`[𝔸¹/𝔾_m]` (closed point `0` with closed residual gerbe `B𝔾_m`, open point `1` with open residual
gerbe `Spec k`); `Bμ_p` (quasi-DM); `Bℤ` (a gerbe without quasi-compact inertia); `Spec ℚ(t)/ℤ`
(locally Noetherian, not decent).

### Dependencies

Layers 0–3; SchemeAndStackFoundations §§1.7–1.8, 1.12, 1.19–1.21; Mathlib
`AlgebraicGeometry.LocallyOfFinitePresentation.iff_locallyOfFiniteType`,
`AlgebraicGeometry.Scheme.IdealSheafData.vanishingIdeal`; gap:quasi-dm-flat-presentation, gap:flat-groupoid-quotients, gap:quasi-finite-over-fields,
gap:stack-morphism-permanence.

## Layer 5: decent stacks and the residue field

### 5.1 Decent algebraic stacks

Say that `x ∈ |𝒳|` is *quasi-compact* when some, equivalently every, representative `Spec k → 𝒳` is
quasi-compact (stacks-04XE lines 1453–1461, Lemma 100.14.1), and that `𝒳` is *decent*
(*Stacks.IsDecent*) when every point is quasi-compact (stacks-06RD lines 4686–4691, Definition
101.48.1). Prove that a stack with quasi-compact diagonal, in particular a quasi-separated one, is
decent (stacks-06RD lines 4692–4698, Lemma 101.48.2); that if `𝒴` is decent and `f : 𝒳 → 𝒴` is
either representable by schemes (`T ×_𝒴 𝒳` is a scheme for every morphism `T → 𝒴` from a scheme;
Algebraic Stacks, Section 94.6, stacks-algebraic-stacks lines 106–112) or representable by
algebraic spaces and quasi-separated (for example a monomorphism or an immersion), then `𝒳` is
decent (stacks-06RD lines 4699–4721, Lemma 101.48.3: the fibre of `f` over a representative of the
image point is a scheme, respectively a quasi-separated and hence decent algebraic space, and a
representative of a point of it is quasi-compact); that if `f` is quasi-compact and surjective and
`𝒳` is decent then `𝒴` is decent (stacks-06RD lines 4722–4731, Lemma 101.48.4); and that the base
of a decent gerbe is decent (stacks-06RD lines 4732–4735, Lemma 101.48.5). *Needs:* 0.2, 0.3, 2.5;
SchemeAndStackFoundations §1.19 (`IsRepresentableBySpaces`, for both alternatives of Lemma
101.48.3), §1.20 (`QuasiCompactStack`); gap:stack-morphism-permanence (base change and composition of
quasi-compact morphisms); gap:stack-separation-axioms; gap:decent-algebraic-spaces (for an algebraic
space this is decency of Decent Spaces, Definition 68.6.1, stacks-decent-spaces lines 567–573).

**Checks.**

- `𝔸¹_ℚ/ℤ` is not decent (stacks-decent-spaces lines 587–589, Example 68.6.2).
- `B𝔾_m` has affine diagonal and is decent.
- `Spec ℚ(t)/ℤ` is not decent: its point `Spec ℚ(t) → X` has `Spec ℚ(t) ×_X Spec ℚ(t) = ⊔_ℤ Spec ℚ(t)`,
  which is not quasi-compact. Likewise `X = U/G` of Example 100.11.6 is not decent, the group being
  infinite.
- The two alternatives of Lemma 101.48.3 are both needed. Let `A = k[x₁, x₂, …]`, let
  `U = ⋃ᵢ D(xᵢ) ⊂ Spec A` (not quasi-compact: `D(x_{i₁}) ∪ … ∪ D(x_{iₙ})` misses the prime
  `(x_{i₁}, …, x_{iₙ})`, which lies in `U`), and let `X` be two copies of `Spec A` glued along
  `U`. The scheme `X` is not quasi-separated, so `X → Spec k` and `X × BG_k → BG_k` (`G` affine;
  the base change of the latter along the fppf cover `Spec k → BG_k` is `X → Spec k`) are
  representable by schemes and not quasi-separated; the first alternative makes `X × BG_k` decent,
  the second does not reach it. Conversely, the folded line `L = 𝔸¹_k/(Δ ⊔ Γ)` (`char k ≠ 2`) of
  SchemeAndStackFoundations §1.12 is quasi-separated, its relation `Δ ⊔ Γ ≅ 𝔸¹_k ⊔ 𝔾_{m,k}` being
  quasi-compact over the affine `𝔸¹_k × 𝔸¹_k` (the folded-line Check of §1.9), and is not a scheme
  (`foldedLine_space`). So `L → Spec k` is representable by algebraic spaces and quasi-separated and
  is not representable by schemes: the second alternative makes `L` decent, the first does not reach
  it.
  Neither alternative can be weakened to representability by algebraic spaces alone:
  `𝔸¹_ℚ/ℤ → Spec ℚ` is representable by algebraic spaces and not quasi-separated (its diagonal pulls
  back to `⊔_ℤ 𝔸¹_ℚ` over `𝔸¹_ℚ × 𝔸¹_ℚ`), `Spec ℚ` is decent and `𝔸¹_ℚ/ℤ` is not.

### 5.2 Factorisation through the residual gerbe

Prove that for `f : 𝒴 → 𝒳` and `x ∈ |𝒳|` with `𝒳` decent or locally Noetherian, `I_𝒳 → 𝒳`
quasi-compact, `|f|(|𝒴|) ⊆ {x}` and `𝒴` reduced, `f` factors through `𝒵_x` (stacks-06RD lines
4842–4865, Lemma 101.51.2); the case of algebraic spaces, through the residual space, is part of the
statement (stacks-decent-spaces lines 1565–1601, Lemmas 68.13.9–68.13.10). For the proof, make
three reductions, each keeping the hypotheses.

1. `f` factors through the reduced closed substack `𝒳'` on the closure of `x` (0.5, `𝒴` being
   reduced). `𝒳'` is decent when `𝒳` is (5.1, Lemma 101.48.3; a closed immersion is a monomorphism,
   hence separated). It is locally Noetherian when `𝒳` is (0.5's API, Lemma 101.17.5). Its inertia
   `I_{𝒳'} = I_𝒳 ×_𝒳 𝒳'` (0.2's API, Lemma 101.5.6) is quasi-compact over `𝒳'` as a base change.
2. The dense open gerbe `𝒰 ⊆ 𝒳'` of 2.6 contains `x`, the generic point of `|𝒳'|`, so `f` factors
   through `𝒰` (0.3). `𝒰` is decent (5.1) or locally Noetherian (0.3's API, open substacks) when
   `𝒳'` is. A residual gerbe of `𝒰` at `x` is one of `𝒳`, a composite of monomorphisms being a
   monomorphism (0.2).
3. Let `π : 𝒰 → U` exhibit `𝒰` as a gerbe over the algebraic space `U`, and let `u = π(x)`. `U` is
   decent when `𝒰` is (5.1, Lemma 101.48.5). It is locally Noetherian when `𝒰` is, by 0.1's API
   applied to `π`, which is smooth and surjective (2.3, Lemma 101.33.8); this is the descent the
   source leaves to the reader at stacks-06RD lines 4862–4863. The residual space `𝒵_u` of `U`
   exists (4.2), and `𝒵_x = 𝒵_u ×_U 𝒰` (3.4's pullback formula), so it suffices that `π ∘ f`
   factors through `𝒵_u`. As `𝒵_u → U` is a monomorphism (0.2), this can be checked on a smooth
   atlas `V → 𝒴` by a scheme, which is reduced (0.1). The space case then applies to `V → U`: Lemma
   68.13.10 when `U` is decent, Lemma 68.13.9 when `U` is locally Noetherian.

*Needs:* 0.1, 0.2, 0.3, 0.5, 2.3, 2.5, 2.6, 3.4, 4.2, 4.3, 4.4, 5.1; gap:stack-morphism-permanence
(base change of quasi-compact morphisms); gap:decent-algebraic-spaces (Lemmas 68.7.2, 68.8.3,
68.11.1 in the space case); gap:reduced-scheme-residue-field-factorisation (the scheme case).

**Checks.**

- The hypothesis is the singleton `{x}`, not its closure: the identity of `𝔸¹_k` has image the closure
  of the generic point and does not factor through `Spec k(t)`.
- A nonreduced source does not factor: `Spec k[ε] → 𝔸¹_k`, `t ↦ ε`, has image the origin and does not
  factor through `Spec k`.
- Neither decent nor locally Noetherian: for an infinite profinite group `G`, `Y = Spec` of the
  locally constant functions `G → k` and `X = Y/Γ` with `Γ = G` discrete, the projection `Y → X` has
  image one point, `Y` is reduced, and `Y → X` factors through no `Spec K → X`
  (stacks-decent-spaces lines 1604–1616, Example 68.13.11).

### 5.3 The residue field

Prove that if `𝒳` is decent and the residual gerbe `𝒵_x` exists, its base `𝒵_x^♭` (3.4) is isomorphic
to the spectrum of a field `κ(x)`, unique up to unique isomorphism, so that `𝒵_x` is a gerbe over
`Spec κ(x)`; define `κ(x)`, the *residue field* of `x` (*Stacks.residueField*). For the proof,
`𝒵_x → 𝒳` is a monomorphism, hence separated (0.2), so `𝒵_x` is decent (5.1) and so is its base.
By gap:decent-algebraic-spaces (Lemma 68.11.1) the point of the decent space `𝒵_x^♭` is represented
by a monomorphism `Spec K → 𝒵_x^♭` from the spectrum of a field. `𝒵_x^♭` is reduced, locally
Noetherian and one-point (3.4), so it has a surjective, flat, locally finitely presented point
(3.1), and 3.2 makes the monomorphism an isomorphism; this is the argument of stacks-decent-spaces
lines 1542–1552 (Lemma 68.13.7). Sources: alper-moduli
lines 6962–6965 and 16528–16537 (Proposition 7.4.39, for Noetherian stacks); rydh2011 lines 1268–1277
(Theorem B.2, for quasi-compact diagonal). *Needs:* 0.2, 2.1, 2.5, 3.1, 3.2, 3.4, 5.1; 3.5 (for the functoriality
bullet); 4.1, 4.3, 4.4 (for the last API bullet); Mathlib `AlgebraicGeometry.Scheme.residueField`;
gap:decent-algebraic-spaces; gap:stack-separation-axioms (for the last API bullet: the inertia is a
base change of the diagonal).

The API consists of the following facts.

- Every representative `Spec k → 𝒳` of `x` induces a field homomorphism `κ(x) → k`, through
  `Spec k → 𝒵_x → Spec κ(x)` (3.4).
- For decent `𝒳`, `𝒴` and `f : 𝒳 → 𝒴` with residual gerbes at `x` and `f(x)`, 3.5 gives
  `κ(f(x)) → κ(x)`, functorially.
- For a scheme, `κ(x)` is Mathlib's `Scheme.residueField x`; for a decent algebraic space it is the
  residue field of Decent Spaces, Definition 68.11.2 (stacks-decent-spaces lines 1225–1227).
- The residual gerbe of a quasi-separated stack, of a locally Noetherian decent stack, or of a decent
  stack at a finite type point exists and is a gerbe over `Spec κ(x)`: a quasi-separated stack is
  decent (5.1) and its inertia, a base change of the quasi-compact diagonal, is quasi-compact, so 4.3
  applies; a locally Noetherian stack has all its residual gerbes by 4.4; a finite type point has
  one by 4.1.

**Checks.**

- Decency cannot be replaced by local Noetherianity: `Spec ℚ(t)/ℤ` is locally Noetherian, its
  residual gerbe is itself, and its base is not the spectrum of a field (3.4).
- For `𝒳 = 𝔸¹_ℚ` and `x` the point `t² + 1 = 0`, `κ(x) = ℚ(i)`.
- For `𝒳 = [Spec ℂ / (ℤ/4)]` over `ℝ`, with `ℤ/4` acting through `ℤ/4 → ℤ/2 = Gal(ℂ/ℝ)`, `|𝒳|` is
  one point, the base is `Spec ℂ/(ℤ/4) = Spec ℝ`, so `κ = ℝ`, and `𝒳` has no object over `ℝ`: such an
  object lies over the identity of `Spec ℝ`, `ℝ` having no other endomorphism, so it would lift the
  class of `Spec ℂ` in `H¹(ℝ, ℤ/2)` to `H¹(ℝ, ℤ/4) = Hom(ℤ/2, ℤ/4)`, whose two elements both reduce
  to zero.

### 5.4 Algebraicity of points

Prove that if `𝒳` is decent, `I_𝒳 → 𝒳` is quasi-compact and `ξ ∈ |𝒳|`, the reduced closed substack
`𝒳'` on the closure of `ξ` (0.5) has an open substack `𝒵` with `ξ ∈ |𝒵|` which is a gerbe over an
integral affine scheme `Z` whose generic point is the image of `ξ`; then `𝒵 → 𝒳` is an immersion,
`κ(ξ)` is the function field of `Z`, and `𝒵_ξ = 𝒵 ×_Z Spec κ(ξ)` (stacks-06RD lines 4786–4807,
Lemma 101.50.2 (2), whose hypotheses, Definition 101.50.1, are those of `𝒳'`). Prove moreover that if
`𝒳` has quasi-compact diagonal and `ξ ∈ |𝒳|`, there is a quasi-compact immersion `𝒵 → 𝒳` with
`ξ ∈ |𝒵|` such that `I_𝒵 → 𝒵` is flat and locally of finite presentation and `𝒵` is a gerbe over an
integral affine scheme `Z` whose generic point is the image of `ξ`; then `𝒵_ξ = 𝒵 ×_Z Spec κ(ξ)` and
`𝒵_ξ → 𝒳` is quasi-affine (rydh2011 lines 1268–1305, Theorem B.2) (*Stacks.algebraicityOfPoints*).

For the first statement: `𝒳'` is reduced with `|𝒳'|` irreducible, decent (5.1, Lemma 101.48.3, a
closed immersion being a monomorphism) and has quasi-compact inertia `I_𝒳 ×_𝒳 𝒳'` (0.2's API, Lemma
101.5.6). Its dense open gerbe `𝒰` (2.6) is a nonempty open subset of the irreducible `|𝒳'|`, so it
contains the generic point `ξ`. Let `π : 𝒰 → U` exhibit `𝒰` as a gerbe over an algebraic space. `U` is
decent (5.1, Lemma 101.48.5), reduced (`𝒰` is reduced as an open substack of `𝒳'`, 0.3's API, and
reducedness descends along `π`, smooth and surjective by 2.3, 0.1's API) and
irreducible with generic point `π(ξ)` (`|𝒰| ≅ |U|` by 2.5), so it has a dense open subspace which is a
scheme (gap:decent-space-schematic-locus); a nonempty affine open `Z` of that subscheme contains
`π(ξ)` and is reduced and irreducible, hence integral, and `𝒵 = π⁻¹(Z)` is an open substack of `𝒳'`
and a gerbe over `Z` (2.1, base change), with `𝒵 → 𝒳` an immersion (0.3). The residual gerbe of the
scheme `Z` at its generic point is `Spec K(Z)` for the function field `K(Z)` (3.3), so 3.4's pullback
formula gives the residual gerbe of `𝒵` at `ξ` as `𝒵 ×_Z Spec K(Z)`; it is the residual gerbe of `𝒳`
at `ξ` (3.3, and 3.4's uniqueness, the composite with the immersion `𝒵 → 𝒳` being a monomorphism by
0.2–0.3), and it is a gerbe over `Spec K(Z)` by base change, so `κ(ξ) = K(Z)` (2.1's uniqueness of
the base, 5.3). Rydh's generic flatness Theorem B.1 is replaced by the dense open gerbe.

For the second statement, a quasi-compact diagonal makes `𝒳` decent (5.1, Lemma 101.48.2) with
quasi-compact inertia (a base change of the diagonal along itself, stacks-06RD lines 4811–4812), so
the first statement applies. The immersion `𝒵 → 𝒳` is quasi-compact: for an affine scheme `T → 𝒳`,
`𝒵 ×_𝒳 T = (𝒵 × T) ×_{𝒳 × 𝒳} 𝒳` is a base change of the quasi-compact diagonal over `𝒵 × T`, and
`|𝒵 × T| ≅ |Z × T|` is quasi-compact, `𝒵 × T → Z × T` being a gerbe (2.1, 2.5; the argument of Lemma
101.48.2, stacks-06RD lines 4694–4698). `I_𝒵 → 𝒵` is flat and locally of finite presentation by 2.4,
and `𝒵_ξ → 𝒳` is the affine base change `𝒵_ξ → 𝒵` of `Spec κ(ξ) → Z` followed by a quasi-compact
immersion, hence quasi-affine.
*Needs:* 0.1, 0.2, 0.3, 0.5, 2.1, 2.3, 2.4, 2.5, 2.6, 3.3, 3.4, 5.1, 5.3;
gap:decent-space-schematic-locus (dense open subscheme of a decent space);
gap:stack-separation-axioms (the inertia is a base change of the diagonal);
gap:stack-morphism-permanence (base change and composition of quasi-compact morphisms and of
immersions).

**Checks.**

- On `[𝔸¹/𝔾_m]`, at `0` one may take `𝒵 = B𝔾_m` over `Z = Spec k`, and at `1` the open `𝒵 = Spec k`;
  both statements give these, with `𝒵_0 = B𝔾_m` and `𝒵_1 = Spec k`.
- At the generic point of `𝔸¹_k`, `𝒵 = 𝔸¹_k = Z` and `𝒵_ξ = Spec k(t) → 𝔸¹_k` is affine, hence
  quasi-affine, and is not an immersion.
- The first statement reaches stacks whose diagonal is not quasi-compact. Let `X` be the scheme of
  5.1's fourth Check (two copies of `Spec A`, `A = k[x₁, x₂, …]`, glued along `⋃ᵢ D(xᵢ)`) and `ξ` its
  generic point. `X` is reduced, irreducible, decent (a scheme) and has trivial inertia, and its
  diagonal is not quasi-compact, so the second statement does not apply; the route of the first may
  take `𝒵 = Z = Spec A`, either copy, with `𝒵_ξ = Spec k(x₁, x₂, …) = 𝒵 ×_Z Spec κ(ξ)`. For this
  choice `𝒵 → X` is not quasi-compact: the preimage of the other copy is `⋃ᵢ D(xᵢ)`, which is not
  quasi-compact.
- The hypotheses are needed: `𝔸¹_ℚ/ℤ` has trivial, hence quasi-compact, inertia and is reduced and
  irreducible, but it is neither decent nor of quasi-compact diagonal. Its only nonempty open subspace
  is itself: the complement of a nonempty proper open subset of `𝔸¹_ℚ` is a finite nonempty set of
  closed points, and no such set is `ℤ`-stable, since `P(t + n) ≠ P(t)` for a monic irreducible `P`
  and `n ≠ 0` (compare the coefficients of `t^{deg P − 1}`). So no open subspace is a scheme, and the
  residual space at its generic point is not the spectrum of a field, so it is not a gerbe over a
  field.

### 5.5 Representatives and the fppf image

Define the *fppf image* of a field-valued point `x : Spec k → 𝒳` (*Stacks.fppfImage*): the substack of
objects which are fppf-locally isomorphic to pullbacks of `x`. Prove that for `𝒳` decent and `x` a
representative of a point whose residual gerbe exists, `Spec k → 𝒵_x` is surjective and flat, and it
is locally of finite presentation iff `k` is finite over `κ(x)`; in that case the fppf image of `x`
is `𝒵_x`, and when `k` is not finite over `κ(x)`, `Spec k → 𝒵_x` is not an fppf epimorphism and the
fppf image of `x` is not `𝒵_x`. For the proof, flatness is 3.1; local finite presentation of
`Spec k → 𝒵_x` is equivalent to that of `Spec k → Spec κ(x)`, that is to `k` being a finitely generated
`κ(x)`-algebra, which by Zariski's lemma (Mathlib `finite_of_finite_type_of_isJacobsonRing`) means
finite; an fppf covering of `Spec κ(x)` through `Spec k` would give a field homomorphism from `k` to
a residue field finite over `κ(x)`. Sources: rydh2011 lines 1236–1245, on the dependence of the
epi–mono factorisation of Laumon–Moret-Bailly on the representative; stacks-06ML lines 1293–1297
(footnote to Definition 100.11.8); lmb2000, Chapter 11, Définition 11.2 (cited by locator only).
*Needs:* 3.1, 3.3, 3.4, 5.3; Mathlib `finite_of_finite_type_of_isJacobsonRing`;
gap:stack-morphism-permanence.

**Checks.**

- For `𝒳 = Spec κ` and `x : Spec κ(t) → 𝒳`, the morphism is flat and surjective and not locally of
  finite presentation, and no fppf covering of `Spec κ` factors through `Spec κ(t)`.
- For `𝒳 = Spec κ` and a finite extension `k/κ`, the fppf image of `Spec k → Spec κ` is `Spec κ`.
- For `𝒳 = BG_k` and the representatives over `k` and over an algebraic closure `k̄`, the first has
  fppf image `BG_k` and the second does not when `k̄/k` is infinite; the two representatives of the
  same point have different epi–mono images, the phenomenon of rydh2011 lines 1239–1245.

### Examples

Residue fields: `ℚ(i)` at `t² + 1 = 0` on `𝔸¹_ℚ`; `ℝ` for the non-neutral `[Spec ℂ/(ℤ/4)]`; none for
the non-decent `Spec ℚ(t)/ℤ`. Algebraicity at both points of `[𝔸¹/𝔾_m]`, and at the generic point
of the scheme of 5.1's fourth Check, whose diagonal is not quasi-compact.

### Dependencies

Layers 0 and 2–4; SchemeAndStackFoundations §§1.19–1.20; Mathlib
`AlgebraicGeometry.Scheme.residueField`, `finite_of_finite_type_of_isJacobsonRing`;
gap:decent-algebraic-spaces, gap:decent-space-schematic-locus,
gap:reduced-scheme-residue-field-factorisation, gap:stack-morphism-permanence,
gap:stack-separation-axioms.

## Layer 6: residual gerbes at representatives and rational points

### 6.1 The presentation by a representative

Define, for a field-valued point `x : Spec k → 𝒳`, the groupoid `R_x := Spec k ×_{x,𝒳,x} Spec k` over
`Spec k` with its two projections (*Stacks.representativeGroupoid*). Prove that if `x` is locally of
finite type (so that `x` represents a finite type point), the projections `R_x → Spec k` are flat and
locally of finite presentation, `Spec k → 𝒵_x` is surjective, flat and locally of finite presentation,
`Spec k ×_{𝒵_x} Spec k = R_x`, and `𝒵_x ≃ [Spec k / R_x]` (stacks-06RD lines 1617–1665, proof of Lemma
101.18.7; stacks-06ML lines 1214–1237 and 1364–1368, proofs of Lemmas 100.11.5 and 100.11.14).
*Needs:* 0.2, 3.2, 3.4, 4.1; 1.3 (for the first API bullet: the stabilizer of a presentation, Lemma
101.5.7); 2.4 and 5.3 (for the last API bullet: Lemma 101.28.10 (3) for the gerbe
`𝒵_x → Spec κ(x)` of a decent stack); SchemeAndStackFoundations §1.14 (`stabilizer`), §1.21;
Mathlib `AlgebraicGeometry.LocallyOfFinitePresentation.iff_locallyOfFiniteType` (the projections,
locally of finite type over a field, are locally of finite presentation);
gap:flat-groupoid-quotients; gap:stack-morphism-permanence (for an arbitrary locally finite type
representative `x`: `Spec k → 𝒵_x` is locally of finite type by cancellation, Lemma 101.17.8, and
the projections of `R_x` by base change, Lemma 101.17.3).

The API consists of the following facts.

- `G_x` is the stabilizer of `R_x`, the pullback of `(t, s) : R_x → Spec k × Spec k` (the absolute
  product, Convention 1) along the diagonal of `Spec k`; for any scheme `B` with a morphism `𝒳 → B`,
  both maps factor through the monomorphism `Spec k ×_B Spec k → Spec k × Spec k`, so the pullback is
  the same over `B`.
- `R_x` depends on `x` only through `𝒵_x`: for the monomorphism `𝒵_x → 𝒳`, fibre products over `𝒵_x`
  and over `𝒳` agree (0.2).
- For decent `𝒳`, `R_x → Spec(k ⊗_{κ(x)} k)` is surjective, flat and locally of finite presentation
  (stacks-06QB lines 2775–2820, Lemma 101.28.10 (3), applied to `𝒵_x → Spec κ(x)`).

**Checks.**

- For `𝒳 = BG_k` and the trivial torsor, `R_x = G` with equal projections, and `[Spec k/G] = BG`.
- For `𝒳 = Spec κ` and `k/κ` finite Galois with group `Γ`, `R_x = Spec(k ⊗_κ k) = Γ × Spec k`, its
  projections differ, `G_x` is trivial and `[Spec k/R_x] = Spec κ`.
- On `[𝔸¹/𝔾_m]` with the representative `0`, `R_x = 𝔾_m` and `𝒵_0 = B𝔾_m`.

### 6.2 Base change of the residual gerbe to a representative

Prove that for every representative `x : Spec k → 𝒳` of a point whose residual gerbe exists, with
base `𝒵_x^♭`, there is a canonical equivalence `𝒵_x ×_{𝒵_x^♭} Spec k ≃ BG_x` over `Spec k` sending
the object `(x, id)` to the trivial torsor; when `𝒳` is decent this reads
`𝒵_x ×_{Spec κ(x)} Spec k ≃ BG_x` (alper-moduli lines 16541–16549, Exercise 7.4.40 (1), for a
finite type point of a Noetherian stack; neither hypothesis is used: the route is 2.1, 2.2 and full
faithfulness of `𝒵_x → 𝒳`) (*Stacks.residualGerbeBaseChange*). For the proof, the base change is a
gerbe over `Spec k` (2.1) with the section `(x, id)`, and its automorphism group at that section
is `G_x` because `𝒵_x^♭` and `Spec k` are sheaves and `𝒵_x → 𝒳` is fully faithful; apply 2.2. *Needs:* 0.2
(a monomorphism is fully faithful), 2.1, 2.2, 3.4, 5.3; SchemeAndStackFoundations §1.20 (`inertia`).

**Checks.**

- For the non-neutral `[Spec ℂ/(ℤ/4)]` over `ℝ` and its representative over `ℂ`,
  `𝒵 ×_ℝ ℂ ≃ B(ℤ/2)_ℂ`.
- Base change over the base is neither the fibre over the stack nor the self-product of the
  representative: for `𝒳 = BG_k` and the trivial torsor `x`, where `𝒵_x → 𝒳` is the identity, the
  three products are `𝒵_x ×_{Spec k} Spec k ≃ BG` (the statement), `𝒵_x ×_𝒳 Spec k ≃ Spec k` and
  `Spec k ×_𝒳 Spec k = R_x = G` (6.1). The second is `Spec k` for every representative of every
  point: its projection to `Spec k` is a monomorphism (0.2, base change) with a section, since `x`
  factors through `𝒵_x`, hence an isomorphism. For `G = ℤ/2` over an algebraically closed `k` the
  three are a one-point stack with automorphism group of order 2, one point and two points; for
  `G = μ_p` in characteristic `p` the third is one point of length `p`, and for `G = 1` all three
  are `Spec k`.
- For `𝒳 = Spec κ` and a finite `k/κ`, `𝒵_x ×_κ k = Spec k = B1`.
- The finite type hypothesis of the source is not needed: at the generic point `η` of `𝔸¹_k`, which
  is not a finite type point (1.1), with any representative `Spec K → 𝔸¹_k`, `K ⊇ k(t)`, the
  residual gerbe `𝒵_η = Spec k(t)` (3.3) is its own base, and
  `𝒵_η ×_{k(t)} Spec K = Spec K = B1 = BG_x`, `G_x` being trivial; both sides are `Spec K` for
  `K = k(t)` and for `K` of infinite transcendence degree over `k` alike.
- The Noetherian hypothesis of the source is not needed: `X = Spec ℚ(t)/ℤ` of 3.4 is not
  quasi-separated, hence not Noetherian, and its point is a finite type point, the quotient map
  `x : Spec ℚ(t) → X` being étale. The residual gerbe is `X` with base `X`, and
  `X ×_X Spec ℚ(t) = Spec ℚ(t) = BG_x`, the inertia of an algebraic space being trivial. `X` is not
  decent (5.1), so only the first form of the statement applies.

### 6.3 Neutral residual gerbes and `BG_x`

Prove that the canonical morphism `BG_x → 𝒵_x` attached to a representative `x : Spec k → 𝒳` (6.2
followed by the projection) is an equivalence iff `Spec k → 𝒵_x^♭` is an isomorphism, which for decent
`𝒳` means that `κ(x) → k` is an isomorphism; then `R_x = G_x` and `𝒵_x ≃ BG_x = [Spec k/G_x]`. Call
`𝒵_x` *neutral* (*Stacks.ResidualGerbe.IsNeutral*) when the gerbe `𝒵_x → 𝒵_x^♭` has a section. If some
representative has `Spec k → 𝒵_x^♭` an isomorphism, `𝒵_x` is neutral. For decent `𝒳`, where
`𝒵_x^♭ = Spec κ(x)` (5.3), the converse holds: `𝒵_x` is neutral iff some representative
`x : Spec k → 𝒳` has `κ(x) → k` an isomorphism, and then `𝒵_x ≃ BG_x` for that representative; iff
some representative `Spec κ(x) → 𝒳` induces the identity `κ(x) → κ(x)`, that is, comes from a
section of `𝒵_x → Spec κ(x)` (stacks-06QB lines 2664–2695; alper-moduli lines 6998–6999 and
16539–16540, for a rational point with smooth affine stabiliser of a Noetherian stack of finite
type over a field, respectively for a rational point of a quasi-separated stack of finite type over
a field; 6.4 treats rational points without these hypotheses). An object of `𝒵_x` over
`Spec κ(x)` is a section only when its field homomorphism `κ(x) → κ(x)` is the identity; pullback
along a non-surjective endomorphism of `κ(x)` can make a non-neutral gerbe neutral (Checks). For the forward
direction of the first statement, if `BG_x → 𝒵_x` is an equivalence then `BG_x → 𝒵_x → 𝒵_x^♭` is a
gerbe (2.1, invariance under equivalences), and the uniqueness of the base (2.1) gives an
isomorphism `Spec k = (BG_x)^♭ ≅ 𝒵_x^♭` under `BG_x`; it is the given `Spec k → 𝒵_x^♭`, since
`BG_x → 𝒵_x^♭` factors through `Spec k` uniquely. The backward direction is the base change of 6.2.
For the converse of neutrality, a section `s : Spec κ(x) → 𝒵_x` composed with the monomorphism
`𝒵_x → 𝒳` is a representative over `κ(x)` whose composite to the base is the identity. Without
decency the converse fails, the base not being a scheme (Checks). *Needs:* 2.1–2.3, 3.4, 5.3, 6.1,
6.2.

**Checks.**

- `[Spec ℂ/(ℤ/4)]` over `ℝ` is not neutral, and for its representative over `ℂ` the morphism
  `B(ℤ/2)_ℂ → 𝒵` is not an equivalence, `Spec ℂ → Spec ℝ` not being an isomorphism.
- `B(ℤ/2)` over `ℝ` is neutral, and at the trivial torsor `𝒵 ≃ B(ℤ/2)_ℝ`.
- On `𝔸¹_ℚ` at `t² + 1 = 0`, the representative over `ℚ(i)` gives the equivalence
  `B1 = Spec ℚ(i) ≃ 𝒵_x`, and the representative over `ℂ` does not.
- The converse needs decency: for the non-decent `X = Spec ℚ(t)/ℤ` of 3.4, the residual gerbe is `X`
  with base `X^♭ = X`, so the identity is a section and `X` is neutral; but no representative
  `Spec k → X` is an isomorphism onto the base, `X` not being a scheme (3.4). Neutrality defined by
  representatives would declare `X` non-neutral.
- An object over `Spec κ(x)` need not be a section: for `K = ℚ(t)`, the quaternion algebra
  `A = (t, −1)` over `K` and the gerbe `𝒵` of trivialisations of `A` (objects over `T`: a morphism
  `T → Spec K`, a locally free `E` of rank 2 on `T` and an isomorphism `End(E) ≅ A_T`), `𝒵` is
  `[P/GL₂]` for the `PGL₂`-torsor `P = Isom(M₂, A)`, so it has affine diagonal, is decent, smooth over
  `K` and one-point, and is its own residual gerbe with `κ = K`. It is not neutral: the residue of
  `(t, −1)` at `t = 0` is the class of `−1` in `ℚ^×/ℚ^{×2}`, which is nontrivial, so `[A] ≠ 0` in
  `Br(K)`. It has an object over `Spec K` lying over the endomorphism `σ : t ↦ t²` of `K`, since
  `A ⊗_{K,σ} K = (t², −1)` is split. For the representative `y` this object defines, `κ → K` is `σ`,
  not an isomorphism, and `BG_y → 𝒵` is not an equivalence. A neutrality criterion through all
  objects over `Spec κ(x)` would declare `𝒵` neutral.

### 6.4 Rational points of stacks over a field

Prove that if `𝒳` is an algebraic stack with a morphism `p : 𝒳 → Spec k` and `x ∈ 𝒳(k)` satisfies
`p ∘ x = id`, then `x` is locally of finite type (by cancellation, `p ∘ x = id` being locally of
finite type; stacks-06RD lines 1527–1528, Lemma 101.17.8, which puts no hypothesis on `p`), so the
residual gerbe at `x` exists (4.1); `Spec k → 𝒵_x^♭` is an isomorphism, so the canonical morphism
`BG_x → 𝒵_x` of 6.3 is an equivalence; and if moreover `𝒳` is locally Noetherian, for instance
locally of finite type over `k`, and `x` is a closed point, `BG_x → 𝒳` is a closed immersion (4.5) (alper-moduli lines 6998–6999 and 7017–7024,
Proposition 4.5.16 (2), which assumes `𝒳` Noetherian, hence quasi-separated (alper-moduli lines
6234–6236), and of finite type over `k`, and `G_x` smooth and affine; ahr2020 lines 475–478, for
quasi-separated `𝒳`) (*Stacks.residualGerbe_rationalPoint*). For the proof, `𝒵_x → Spec k` factors
through the base (2.1), so `Spec k → 𝒵_x^♭ → Spec k` is the identity; a section of `𝒵_x^♭ → Spec k`
is a monomorphism; `𝒵_x^♭` is reduced, locally Noetherian and one-point (3.4), so it has a
surjective, flat, locally finitely presented point (3.1), and 3.2 makes the section an isomorphism;
6.3 then gives the equivalence. Neither smoothness nor affineness of `G_x`, nor quasi-separatedness
of `𝒳` (neither 4.1 nor 4.5 assumes it), nor algebraic closedness of `k` is used. *Needs:* 0.2, 2.1,
3.1, 3.2, 3.4, 4.1, 4.5, 6.3; gap:stack-morphism-permanence (cancellation of local finite type for
the section `x`; a stack locally of finite type over `k` is locally Noetherian, Lemma 101.17.5, as
4.5 requires); for the API bullet, also 0.3, 0.5, 1.2, 1.4 and 3.3, Mathlib
`finite_of_finite_type_of_isJacobsonRing` (a field of finite type over `K` is finite over `K`),
Mathlib `AlgebraicGeometry.FormallyUnramified`, `Algebra.FormallyUnramified.finite_of_free` and
`Algebra.FormallyUnramified.bijective_of_isAlgClosed_of_isLocalRing` (on each affine open `Spec A`
of the `K`-scheme `G_x`, unramified over `K`, the `K`-algebra `A` is formally unramified and of
finite type, hence finite over `K` with every local factor equal to `K`; so the quasi-compact `G_x`
is a finite disjoint union of copies of `Spec K`), and gap:stack-separation-axioms (a
Deligne–Mumford stack is quasi-DM and has unramified inertia, Lemma 101.6.1, and its inertia is
quasi-compact when its diagonal is).

The API consists of the following fact.

- Zero-dimensional Deligne–Mumford stacks: let `K` be an algebraically closed field and `𝒳` a
  Deligne–Mumford stack of finite type over `K`, with structure morphism `p`, quasi-compact
  diagonal and `|𝒳|` finite and discrete. Then `𝒳_red` is the disjoint union of the residual gerbes
  `𝒵_x` of the points of `𝒳`; every point has a representative `x : Spec K → 𝒳` with `p ∘ x = id`,
  and for each such `x` the canonical `BG_x → 𝒵_x` is an equivalence and `G_x` is a finite constant
  group over `K`. It is proved in the first of the Worked examples.

**Checks.**

- For `k` algebraically closed, `𝒳` locally of finite type over `k` and `x ∈ 𝒳(k)`, `BG_x → 𝒵_x` is an
  equivalence, and `BG_x → 𝒳` is a closed immersion when `x` is closed.
- The smoothness assumption of the source is not needed: for `𝒳 = Bμ_p` over `𝔽_p(t)` and the
  trivial torsor, `𝒵_x = Bμ_p = BG_x` with `G_x = μ_p` not smooth.
- The section condition is needed: for `𝒳 = Spec κ` and `x : Spec k → 𝒳` with `k/κ` finite and
  nontrivial, `G_x = 1`, `Spec k → 𝒵_x^♭ = Spec κ` is not an isomorphism and the canonical
  `BG_x = Spec k → 𝒵_x = Spec κ` is not an equivalence (6.3). The two stacks can still be abstractly
  isomorphic: for `κ = ℚ(t)` and `k = ℚ(s)` with `s² = t`, the extension has degree 2 while
  `t ↦ s` is an isomorphism `κ ≅ k`; so the statement concerns the canonical morphism.
- No finiteness of `𝒳` is needed for existence: `𝒳 = Spec k[x₀, x₁, …]` is not locally of finite
  type over `k`, yet the origin `x` is locally of finite type (a closed immersion, its ideal
  `(x₀, x₁, …)` not finitely generated, so `x` is not locally of finite presentation), and
  `𝒵_x = Spec k = BG_x`; on `[Spec k[x₀, x₁, …]/𝔾_m]` of 2.6 the origin gives `𝒵_x = B𝔾_m = BG_x`.
  A version requiring `𝒳` locally of finite type for existence would miss both.
- The diagonal hypothesis of the API bullet is needed: for the constant group `ℤ_K = ⊔_ℤ Spec K`,
  `Bℤ` over `K` is Deligne–Mumford, of finite type and one-point, it is reduced and its own residual
  gerbe, and `G_x = ℤ_K` is not finite; its diagonal pulls back along `Spec K → Bℤ × Bℤ` to
  `ℤ_K → Spec K`, which is not quasi-compact.

### Examples

`B(ℤ/2)_ℝ` (neutral), `[Spec ℂ/(ℤ/4)]_ℝ` (non-neutral, with `𝒵 ×_ℝ ℂ ≃ B(ℤ/2)_ℂ`), and the rational
points `0` and `1` of `[𝔸¹/𝔾_m]` with `𝒵_0 = B𝔾_m` and `𝒵_1 = B1 = Spec k`.

### Dependencies

Layers 0–5; SchemeAndStackFoundations §§1.14, 1.20–1.21; Mathlib
`AlgebraicGeometry.LocallyOfFinitePresentation.iff_locallyOfFiniteType`,
`finite_of_finite_type_of_isJacobsonRing`, `AlgebraicGeometry.FormallyUnramified`,
`Algebra.FormallyUnramified.finite_of_free`,
`Algebra.FormallyUnramified.bijective_of_isAlgClosed_of_isLocalRing`; gap:flat-groupoid-quotients,
gap:stack-morphism-permanence, gap:stack-separation-axioms.

## Layer 7: infinitesimal neighbourhoods, normal and tangent spaces

Throughout 7.2–7.4, `k` is a field, `𝒳` is an algebraic stack locally of finite type over `k`,
`x ∈ 𝒳(k)` is a closed point with `p ∘ x = id`, `G_x` is affine, and `i : BG_x ≃ 𝒵_x → 𝒳` is the
closed immersion of 6.4 with quasi-coherent ideal `ℐ` (0.4). The source of 7.2–7.4 (ahr2020 §3.1,
lines 475–476) also assumes `𝒳` quasi-separated; no statement or route of this layer uses it: 4.5
and 6.4 need only that `𝒳` is locally Noetherian, the vector space structure on `T_{𝒳,x}` comes
from the Rim–Schlessinger condition, which every algebraic stack over a field satisfies (Lemma
98.5.2, stacks-artin lines 292–294; gap:algebraic-stacks-satisfy-rs), and 7.3 and 7.4 compute on a
smooth chart. The Checks of 7.4 include a stack that is not quasi-separated.

### 7.1 Infinitesimal neighbourhoods of a closed point

For `𝒳` locally Noetherian and `x` a closed point, define `𝒳^{[n]}_x := 𝒳^{[n]}_{𝒵_x}`, the `n`-th
infinitesimal neighbourhood of `x` (ahr2020 lines 248–252, §1.5) (*Stacks.pointNeighbourhood*).
*Needs:* 0.4, 3.4, 4.5; SchemeAndStackFoundations §4.8 (*Scheme.formalCompletion*, for the scheme
bullet of the API).

The API consists of the following facts.

- `𝒳^{[0]}_x = 𝒵_x`, each `𝒳^{[n]}_x → 𝒳^{[n+1]}_x` is a first-order thickening, and
  `|𝒳^{[n]}_x| = {x}`.
- A morphism `Spec A → 𝒳` from a local Artinian ring with closed point in the class `x` and
  `𝔪_A^{n+1} = 0` factors through `𝒳^{[n]}_x`: its closed point factors through `𝒵_x` (3.4), so the
  ideal `ℐ·A` lies in `𝔪_A`.
- For a scheme `X` with closed point `x`, `X^{[n]}_x = Spec O_{X,x}/𝔪_x^{n+1}`, the level-`n` term of
  SchemeAndStackFoundations §4.8's *Scheme.formalCompletion* along the ideal of `x` (0.4).

**Checks.**

- On `[𝔸¹/𝔾_m]` at `0`, `𝒳^{[n]}_0 = [Spec k[t]/(t^{n+1})/𝔾_m]`.
- On `𝔸²_k` at the origin, `𝒳^{[1]}_0 = Spec k[x, y]/(x, y)²`, of length 3.
- On `BG`, `𝒳^{[n]} = BG` for every `n`, the ideal being zero.

### 7.2 The normal space

Define the *normal space* `N_x := (i^* ℐ)^∨` (*Stacks.normalSpace*): the quasi-coherent module
`i^* ℐ = ℐ/ℐ²` on `BG_x` is a representation of `G_x`, finite-dimensional by the first API bullet,
under `QCoh(BG_x) ≃ Rep(G_x)` (Convention 9: SchemeAndStackFoundations §1.22's *QCoh.presentationEquiv* for
the presentation `BG_x = [Spec k/G_x]`, whose descent data along `G_x ⇉ Spec k` are the
`O(G_x)`-comodule structures), and `N_x` is its contragredient (ahr2020 lines 39–43 and 477–480).
*Needs:* 0.1 and 0.4 (for finite-dimensionality: the pullback of `ℐ` to a smooth chart), 4.5, 6.4;
1.3 (for the field-extension bullet: `G_{x'} = G_x ×_k k'`); SchemeAndStackFoundations §1.22
(`Stacks.QCoh`, *QCoh.presentationEquiv*); Tau Ceti `TauCeti.Comodule`; ReductiveGroups Layer 1;
gap:stack-morphism-permanence (`𝒳` is locally Noetherian, Lemma 101.17.5);
gap:qcoh-stacks-abelian-tensor (`i^* ℐ = ℐ/ℐ²`: right exactness of pullback and the image `ℐ²`);
gap:inertia-of-presentations (`G_x` is locally of finite type, hence of finite type, being affine).

The API consists of the following facts.

- The underlying vector space is `(ℐ/ℐ² ⊗ k(x))^∨ = (x^*(ℐ/ℐ²))^∨`, and it is finite-dimensional. On a
  smooth chart `U → 𝒳` from a scheme, with image containing `x`, the pullback of `ℐ` is the ideal
  `J` of the nonempty closed subscheme `W = U ×_𝒳 𝒵_x` (0.4), finitely generated because `U` is
  locally Noetherian (0.1). At a point `u ∈ W` the object
  `Spec k(u) → 𝒵_x ≃ BG_x` is a `G_x`-torsor over `k(u)`, trivial over a finite extension `L` of
  `k(u)` because `G_x` is of finite type, so `x^*(ℐ/ℐ²) ⊗_k L ≅ (J/J² ⊗ k(u)) ⊗_{k(u)} L` and
  `dim_k x^*(ℐ/ℐ²) = dim_{k(u)} (J/J² ⊗ k(u))`.
- For a scheme `X` with rational closed point `x`, `N_x = (𝔪_x/𝔪_x²)^∨`, the Zariski tangent space.
- For a smooth `(U, u) → (𝒳, x)` with `u ∈ U(k)` and `W = U ×_𝒳 𝒵_x ⊆ U` with ideal `J`,
  `N_x = (J/J² ⊗ k(u))^∨` as vector spaces.
- Formation of `N_x` commutes with field extensions `k ⊆ k'` and with restriction to open substacks
  containing `x`.

**Checks.**

- On `[𝔸¹/𝔾_m]` at `0`, `ℐ/ℐ² = k·t` has weight `−1` and `N_0` is the weight-one character
  (Convention 5).
- On `BG`, `N_x = 0`.
- On `[𝔸ⁿ/GLₙ]` at `0`, `ℐ/ℐ²` is the span of the coordinate functions, the dual of the standard
  representation, and `N_0` is the standard representation `kⁿ`.
- On `𝔸²_k` at the origin, `N_0 = k²` with trivial action.

### 7.3 The tangent space and the comparison map

`T_{𝒳,x}` is AlgebraicModuliForArithmeticGeometry §8.1's `deformationFunctorOfPoint` at `k[ε]`
(Convention 8), a `k`-vector space by gap:algebraic-stacks-satisfy-rs, with the action of `G_x(k)` of
`stabiliserActionOnDeformations` in the normalisation of Convention 5, the inverse of the reframing
`α ↦ α ∘ g` of AlgebraicModuliForArithmeticGeometry §8.3 (ahr2020 lines 480–483;
alper-moduli lines 6859–6881 and 6948–6951, Definition 4.5.7 and Exercise 4.5.11). Construct the
*comparison map* `θ_x : T_{𝒳,x} → N_x` (*Stacks.tangentToNormal*): a framed deformation `(τ, α)`
factors through `𝒳^{[1]}_x` (7.1); `τ^* ℐ → O_{k[ε]}` lands in `εk ≅ k` and kills `τ^* ℐ²`, giving,
through `α`, a linear form on `x^*(ℐ/ℐ²)`. Prove that `θ_x` is `k`-linear, `G_x(k)`-equivariant and
surjective; that the differential `di : T_{BG_x} → T_{𝒳,x}` (composition of framed deformations
with `i`) is injective with image the kernel of `θ_x`, so that `0 → T_{BG_x} → T_{𝒳,x} → N_x → 0` is
exact; that `T_{BG_x} = 0` iff `G_x` is smooth; hence `θ_x` is an isomorphism iff `G_x` is smooth
(ahr2020 lines 482–484 state the isomorphism for smooth `G_x`) (*Stacks.tangentToNormal_bijective_iff*).
Injectivity of `di` holds because the closed immersion `i` is a monomorphism (0.3), hence fully
faithful on fibre categories (0.2): an isomorphism `i∘τ ≅ i∘τ'` compatible with the framings is
the image of a unique isomorphism `τ ≅ τ'`, which is compatible with the framings by faithfulness.
For the rest of the proof, after a finite separable
extension of `k` (both sides commute with it) choose a smooth `(U, u) → (𝒳, x)` with `u ∈ U(k)`, and
put `W = U ×_𝒳 BG_x` and `U_x = U ×_𝒳 Spec k`. Such a chart exists: for a smooth `U → 𝒳` from a
scheme whose image contains `x`, the algebraic space `U_x` is smooth over `k` and nonempty, so a
nonempty scheme étale over it is smooth over `k` and has a point with values in a finite separable
extension `k'` of `k` (Tau Ceti `AlgebraicGeometry.Scheme.Hom.exists_finite_isSeparable_comp_eq`),
which gives a `k'`-point of `U ×_k k'` over the base change of `x`. Since `BG_x → Spec k` is smooth for every flat
`G_x` (2.3) and `W → BG_x` is smooth, `W` is smooth over `k`, so on an affine neighbourhood `Spec P` of `u` with `W = Spec P/J` the map
`J/J² → (P/J) ⊗_P Ω[P/k]` is split injective (a section of `P/J² → P/J` exists by
`Algebra.FormallySmooth.exists_lift`, and `retractionKerCotangentToTensorEquivSection` turns it into a
retraction; `U` itself need not be smooth over `k`); hence `J/J² ⊗ k(u) → 𝔪_u/𝔪_u²` is injective and
`T_{U,u} → N_x` is surjective with kernel `T_{W,u}`. Smoothness of `U → 𝒳` makes `T_{U,u} → T_{𝒳,x}` surjective with kernel the image of
`T_{U_x,u}` (AlgebraicModuliForArithmeticGeometry §8.3's `framedDeformation_twoFibre` and
`framedTangent_exactSequence`), and `U_x → W` is the base change of `Spec k → BG_x`, so
`T_{W,u}/T_{U_x,u} ≅ T_{BG_x}`. To compute `T_{BG_x}`: `G_x` is affine and locally of finite type
over `k` (1.3, the inertia being locally of finite type), hence of finite type, so it is a closed
subgroup of some `GLₙ` (Tau Ceti `TauCeti.AffineGroupSchemeCat.exists_isClosedImmersion_generalLinear`).
The fppf quotient `Q = GLₙ/G_x` (Tau Ceti `CommHopfAlgCat.fppfHomogeneousQuotient`) is a scheme smooth
over `k` of pure dimension `n² − dim G_x` (gap:homogeneous-quotient-scheme), and the projection
`π : GLₙ → Q` is a `G_x`-torsor (Tau Ceti `CommHopfAlgCat.isPullback_fppfHomogeneousQuotientTorsor`).
Through SchemeAndStackFoundations §1.21's `actionQuotient.torsorEquiv`, `π` defines `q : Q → BG_x`
whose base change along the surjective, flat, locally finitely presented `Spec k → BG_x` (2.2) is
`GLₙ → Spec k`, the projection to `Q` being `π`; hence `q` is smooth (gap:stack-morphism-permanence).
The sequence of AlgebraicModuliForArithmeticGeometry §8.3 for `q` at `ē = π(e)` reads
`T_{GLₙ,e} → T_{Q,ē} → T_{BG_x} → 0`, and the kernel of `dπ_e` is the tangent space at `e` of the
fibre `π⁻¹(ē) = G_x`, that is `Lie(G_x)`. Hence
`dim T_{BG_x} = (n² − dim G_x) − (n² − dim Lie(G_x)) = dim Lie(G_x) − dim G_x`, which vanishes iff
`G_x` is smooth (Tau Ceti `TauCeti.HopfAlgebra.smooth_iff_finrank_lie_eq_ringKrullDim`). *Needs:* 0.2,
0.3 (injectivity of `di`), 0.4, 1.3, 2.2, 2.3, 4.5, 6.4, 7.1, 7.2; AlgebraicModuliForArithmeticGeometry
§§8.1, 8.3 (deformation functor, stabiliser action, framed tangent sequences); SchemeAndStackFoundations §1.21
(`actionQuotient.torsorEquiv`: the morphism `q`); Tau Ceti
`TauCeti.AffineGroupSchemeCat.exists_isClosedImmersion_generalLinear` (`G_x ⊆ GLₙ`),
`CommHopfAlgCat.fppfHomogeneousQuotient` and `CommHopfAlgCat.isPullback_fppfHomogeneousQuotientTorsor`
(`GLₙ → GLₙ/G_x` is a `G_x`-torsor), `TauCeti.HopfAlgebra.smooth_iff_finrank_lie_eq_ringKrullDim`
(`dim Lie(G_x) = dim G_x` iff `G_x` is smooth), `AlgebraicGeometry.Scheme.Hom.exists_finite_isSeparable_comp_eq`
(a chart with a rational point after a finite separable extension); Mathlib `retractionKerCotangentToTensorEquivSection`,
`Algebra.FormallySmooth.exists_lift`; gap:homogeneous-quotient-scheme (`GLₙ/G_x` is a smooth scheme of
pure dimension `n² − dim G_x`); gap:inertia-of-presentations (the inertia is locally of finite type);
gap:stack-morphism-permanence (smoothness of `W` and of `q`); gap:algebraic-stacks-satisfy-rs.

**Checks.**

- On `[𝔸¹/𝔾_m]` at `0`, `T_{𝒳,0} = T_{𝔸¹,0}` (the orbit map of `0` is constant) is the weight-one
  character and `θ_0` is an isomorphism onto `N_0`.
- On `Bμ_p` over `𝔽_p`, `N_x = 0` while `T_{𝒳,x} ≅ k`: the framed deformations are the `μ_p`-torsors
  over `k[ε]` trivial over `k`, the kernel `{1 + aε}` of `k[ε]^×/(k[ε]^×)^p → k^×/(k^×)^p`;
  `μ_p` is not smooth and `θ_x` is not injective.
- On `[𝔸¹/μ_p]` at `0` over a field `k` of characteristic `p`, with `μ_p` scaling `𝔸¹`, both ends of
  the sequence are nonzero. A framed deformation is a torsor `Spec k[ε][z]/(z^p − 1 − aε)` with the
  equivariant map `t ↦ bεz`, and the framed isomorphisms `z ↦ (1 + cε)z` fix `(a, b)`, so
  `T_{𝒳,0} ≅ k²`. The image of `di` is the line `b = 0`, which is `T_{BG_x} = T_{Bμ_p} ≅ k`
  (`dim Lie − dim G = 1 − 0`), embedded injectively. `N_0` is the dual of `ℐ/ℐ² = k·t`, and
  `θ_0(a, b) = b`, so `2 = 1 + 1`. The flat, non-smooth atlas `𝔸¹ → [𝔸¹/μ_p]` gives only the line
  `a = 0`: the chart of the proof must be smooth.
- At the cusp `Spec k[x, y]/(y² − x³)`, with trivial `G_x`, `T` and `N` are both 2-dimensional and
  `θ` is the identity of `(𝔪/𝔪²)^∨`; smoothness of `𝒳` is not required.
- With the right action `(τ, α ∘ g)` the tangent line of `[𝔸¹/𝔾_m]` at `0` would have weight `−1` and
  `θ_0` would not be equivariant (Convention 5).

### 7.4 Quotient stacks

Prove that for a smooth group scheme `G` over `k` acting on a scheme `V` locally of finite type over
`k`, and `x ∈ V(k)` with affine stabiliser `Stab_G(x)` (the standing hypothesis of this layer) whose
orbit `G·x` (the reduced image of the orbit map) is closed in `V`, the image of `x` is a closed
point of `[V/G]`, `G_x` is the stabiliser `Stab_G(x)`, `𝒵_x = [G·x/G]`, and
`N_x ≅ T_{V,x}/T_{G·x,x}` as `G_x`-representations (ahr2020 lines 484–486, under the quasi-separated
stack with affine stabilisers of lines 475–476; quasi-separatedness is not used). Here `Stab_G(x)`
acts on `V` through `G` and fixes `x`, so it acts on `𝔪_x/𝔪_x²` and contragrediently on
`T_{V,x} = (𝔪_x/𝔪_x²)^∨` (Convention 5: an element acts on `T_{V,x}` by the differential of its
action on `V`), and `T_{G·x,x}` is a subrepresentation because `G·x` is `G`-stable. `G` itself need
not be affine: the route below uses only that `V → [V/G]` is a smooth atlas, and affineness enters
through `G_x` alone, in 7.3's embedding `G_x ⊆ GLₙ`. For the proof apply the chart computation of
7.3 to the smooth atlas `V → [V/G]`: the base change of `x : Spec k → [V/G]` along `V → [V/G]` is
the orbit map `G → V`, so the preimage of the image of `x` in `|V|` is the image of the orbit map,
and the point is closed exactly when the orbit is (the map `|V| → |[V/G]|` being open and
surjective); and `W = V ×_{[V/G]} 𝒵_x` is a closed subscheme of `V` with that support which is
smooth over `k` (as in 7.3: `W → BG_x` is a base change of the smooth atlas and `BG_x → Spec k` is
smooth), hence reduced, hence `W = G·x`. With `J` the ideal of `G·x` in `V`, the chart computation
of 7.3 at `u = x` makes `J/J² ⊗ k(x) → 𝔪_x/𝔪_x²` injective, and its dual `T_{V,x} → N_x` surjective
with kernel `T_{G·x,x}`, the annihilator of the image. This map respects the actions. Under
*QCoh.presentationEquiv* for the action groupoid `G × V ⇉ V`, `ℐ` is `J` with its `G`-equivariant
structure, and the descent datum of a quasi-coherent module on a quotient stack is its pullback
isomorphism along the 2-isomorphism between the two composites `G × V ⇉ V → [V/G]`
(stacks-sheaves-on-stacks lines 977–983, proof of Proposition 96.14.3), so it restricts along every
morphism of groupoids over `[V/G]`. The point `x` defines such a morphism
`(G_x ⇉ Spec k) → (G × V ⇉ V)`, `g ↦ (g, x)`; the morphism `BG_x = [Spec k/G_x] → [V/G]` it induces
is `i`, both sending the trivial torsor to `x` and inducing the identity of `G_x`. It factors through
the action groupoid `G_x × V ⇉ V` of the restricted action, so the comodule `x^*(ℐ/ℐ²) = J/J² ⊗ k(x)`
of 7.2 is the one `J`, a `G_x`-equivariant ideal of `V`, induces at the fixed point `x`. The ideal
`𝔪` of `x` is `G_x`-equivariant too and contains `J`, so `J/J² ⊗ k(x) → 𝔪/𝔪² ⊗ k(x) = 𝔪_x/𝔪_x²`
is a morphism of `O(G_x)`-comodules, and so is its dual `T_{V,x} → N_x`. *Needs:* 0.3, 4.5, 6.4, 7.2,
7.3; 1.3 (`G_x` is the stabilizer of the action groupoid at `x`, the presentation bullet, Lemma
101.5.7); 2.3 (`BG_x → Spec k` is smooth); SchemeAndStackFoundations §1.20 (`Stacks.points`,
`.baseChangeImage`, `.atlasOpenSurjective`), §1.21 (`actionQuotient`), §1.22
(*QCoh.presentationEquiv* for `[V/G]` and for `BG_x`, for the equivariance); Mathlib
`AlgebraicGeometry.Scheme.IdealSheafData.vanishingIdeal` (the reduced structure on the closed
orbit); gap:stack-morphism-permanence (base change and composition of smooth morphisms).

**Checks.**

- For `GLₙ` acting on `𝔸ⁿ` and `x = 0`, the orbit is `{0}` and `N_0 = T_{𝔸ⁿ,0} = kⁿ`, the standard
  representation on both sides.
- The isomorphism is one of representations, with the contragredient on tangent spaces: for `𝔾_m`
  scaling `𝔸¹` and `x = 0`, `J = (t)` and `J/J² ⊗ k = k·t` has weight `−1` (Convention 5), so
  `T_{𝔸¹,0}/T_{G·x,0} = T_{𝔸¹,0}` has weight `+1`, the differential of `t ↦ λt`, which is the
  character `N_0` of 7.2's first Check. Giving `T_{𝔸¹,0}` the action of `𝔪_0/𝔪_0²` itself instead of
  its contragredient would give weight `−1` and no equivariant isomorphism.
- For `𝔾_m` acting on `𝔸¹` and `x = 1`, the orbit `𝔾_m` is not closed and the image of `1` is not a
  closed point of `[𝔸¹/𝔾_m]`: the closed-orbit hypothesis is needed.
- In characteristic different from 2, for `SL₂` acting on binary quadratic forms and `x = uv`, the
  orbit is the closed quadric of forms of discriminant `1`, of dimension 2; the stabiliser is the
  diagonal torus (an element exchanging `u` and `v` sends `uv` to `−uv`); and `N_x` is the
  one-dimensional trivial representation, identified with `k` by the differential of the invariant
  discriminant, which is nonzero at `x`.
- `G` need not be affine: for an elliptic curve `E` over `k`, let `G = E × 𝔾_m` act on
  `V = E × 𝔸¹` by translation on `E` and scaling on `𝔸¹`, and take `x = (0_E, 0)`. Then
  `Stab_G(x) = 1 × 𝔾_m` is affine, the orbit `E × {0}` is closed, `[V/G] ≅ [E/E] × [𝔸¹/𝔾_m] ≅ [𝔸¹/𝔾_m]`
  with `x` going to the closed point `0`, `𝒵_x = [E × {0}/G] ≅ B𝔾_m`, and
  `T_{V,x}/T_{G·x,x} = (T_{E,0} ⊕ k·∂_t)/T_{E,0} = k·∂_t` is the weight-one character, which is `N_0`
  of `[𝔸¹/𝔾_m]` in 7.2's first Check. A statement for affine `G` only would exclude this action; the
  stabiliser hypothesis is what excludes `E` acting trivially on `Spec k`, with `G_x = E` not affine.
- `[V/G]` need not be quasi-separated: over `k = ℚ`, let the constant group `G = ℤ` act on
  `V = (ℤ × 𝔸¹) ⊔ 𝔸¹` by `n·(m, t) = (m + n, t)` on the first part and `n·t = t + n` on the second,
  and take `x = (0, 0)` in the first part. Then `Stab_G(x) = 1`, the orbit `ℤ × {0}` is closed (one
  closed point in each component), and `[V/G] = 𝔸¹ ⊔ 𝔸¹/ℤ`, whose second part is not
  quasi-separated: `𝔸¹ ×_{𝔸¹/ℤ} 𝔸¹ = ℤ × 𝔸¹ → 𝔸¹ × 𝔸¹`, `(n, t) ↦ (t, t + n)`, is not
  quasi-compact. The image of `x` is the origin of the first part, a closed point; `𝒵_x = Spec ℚ =
  [ℤ × {0}/G]` with `G_x = 1`; and `N_x = (𝔪/𝔪²)^∨ = ℚ·∂_t` equals
  `T_{V,x}/T_{G·x,x} = ℚ·∂_t/0`, both one-dimensional. A statement restricted to quasi-separated
  stacks, as in the source, would exclude this action.
- Luna vocabulary: for `k` algebraically closed, `𝒳` quasi-separated with affine stabilisers and
  `x` smooth with linearly reductive `G_x` (Tau Ceti `TauCeti.linearlyReductiveAffineGroupSchemeProperty`),
  the slice theorem (ahr2020 lines 55–60, Theorem 1.2) compares `𝒳` étale-locally with `[N_x/G_x]`;
  for `𝒳 = [𝔸ⁿ/GLₙ]` and `x = 0` the comparison is the identity.

### Examples

`[𝔸¹/𝔾_m]` at `0`: `𝒳^{[n]}_0 = [Spec k[t]/(t^{n+1})/𝔾_m]`, `N_0 = T_{𝒳,0}` of weight one. `Bμ_p`:
`N = 0`, `T = k`. `[𝔸ⁿ/GLₙ]` at `0`: `N_0 = kⁿ`.

### Dependencies

Layers 0–4 and 6; AlgebraicModuliForArithmeticGeometry §§8.1, 8.3; ReductiveGroups Layer 1, and
Layer 3 through gap:homogeneous-quotient-scheme; SchemeAndStackFoundations §§1.20–1.22, 4.8; Mathlib
`retractionKerCotangentToTensorEquivSection`, `Algebra.FormallySmooth.exists_lift`,
`AlgebraicGeometry.Scheme.IdealSheafData.vanishingIdeal`; Tau Ceti
`TauCeti.Comodule`, `TauCeti.linearlyReductiveAffineGroupSchemeProperty`,
`TauCeti.AffineGroupSchemeCat.exists_isClosedImmersion_generalLinear`,
`CommHopfAlgCat.fppfHomogeneousQuotient`, `CommHopfAlgCat.isPullback_fppfHomogeneousQuotientTorsor`,
`TauCeti.HopfAlgebra.smooth_iff_finrank_lie_eq_ringKrullDim`,
`AlgebraicGeometry.Scheme.Hom.exists_finite_isSeparable_comp_eq`; gap:stack-morphism-permanence,
gap:inertia-of-presentations, gap:homogeneous-quotient-scheme, gap:algebraic-stacks-satisfy-rs,
gap:qcoh-stacks-abelian-tensor.

## Downstream consumers

- **LanglandsParameterStacks**: the Checks of its §1.16 speak of the structure sheaf of the residual
  gerbe at a parameter; they use 3.3, 4.5 and 6.4.
- **FunctionFieldArithmeticPartII**: the statement it asks of SchemeAndStackFoundations on
  zero-dimensional Deligne–Mumford stacks (the reduction of a finite type Deligne–Mumford stack over
  an algebraically closed field with finite discrete `|𝒳|` is the disjoint union of its residual
  gerbes, each the classifying stack of a finite constant group) is the API bullet of 6.4, proved in
  the worked example below from 0.3, 0.5, 1.2, 1.4, 3.3, 4.5 and 6.4; it adds the quasi-compact
  diagonal hypothesis that `Bℤ` shows to be necessary.
- **MotivicStructuresInModuliOfCurves**: stabilisers at points of its quotient stacks (the central
  `μ₂` stabilisers of its §7.3 and the quadric stabilisers of the orbit counts of its §§8.4 and 8.6),
  through 1.3 and 7.4.
- **VirtualFundamentalClasses**: its §1.2 states, for Deligne–Mumford stacks of finite type over a
  field, the closed substacks of 0.3 with their description on a presentation and the reduced
  induced closed substacks and reduced-source factorisation of 0.5, and builds its integral closed
  substacks and cycles on them; it does not use the ideals of 0.4. Its zero-dimensional integral
  closed substacks are the residual gerbes at closed points (3.3, 4.5), an identification that
  roadmap does not use.

## Worked examples

**Zero-dimensional Deligne–Mumford stacks.** Let `K` be algebraically closed and `𝒳` a
Deligne–Mumford stack of finite type over `K` with quasi-compact diagonal and `|𝒳|` finite and
discrete. Every point is open and closed, so `𝒳_red` is the disjoint union of the reduced induced
closed substacks on the points (0.3, 0.5). Each is reduced, locally Noetherian and one-point, hence
the residual gerbe `𝒵_x` (3.3, 4.5). A closed point of a stack of finite type over `K` has a
representative `x` with `p ∘ x = id` for the structure morphism `p : 𝒳 → Spec K` (a closed point is
a finite type point (1.2), and a finite type representative `Spec k → 𝒳` has `k` finite over `K`
through `p`, so `K → k` is an isomorphism, and composing with its inverse gives `x`), so
`𝒵_x ≃ BG_x` (the main statement of 6.4), and `G_x` is a scheme (1.4), unramified over `K` (the
inertia of a Deligne–Mumford stack is), and quasi-compact because the diagonal is, hence, by the
Mathlib lemmas of 6.4, a finite disjoint union of copies of `Spec K`: a finite constant group. Thus
`𝒳_red ≃ ⊔_x BG_x` with finite groups `G_x`. The diagonal hypothesis is needed (the `Bℤ` Check of
6.4).

**The stack `[𝔸¹/𝔾_m]`.** Points `0` (closed, finite type) and `1` (open, finite type);
`G_0 = 𝔾_m`, `G_1 = 1`; `𝒵_0 = B𝔾_m` closed with ideal `(t)`, `𝒵_1 = Spec k` open; the dense open
gerbe is `Spec k`; `κ = k` at both points; `𝒳^{[n]}_0 = [Spec k[t]/(t^{n+1})/𝔾_m]`;
`N_0 = T_{𝒳,0}` is the weight-one character.

**A non-neutral residual gerbe.** `𝒳 = [Spec ℂ/(ℤ/4)]` over `ℝ` is its own residual gerbe, a gerbe
over `Spec ℝ` with no real object, with `𝒳 ×_ℝ ℂ ≃ B(ℤ/2)_ℂ` at the representative `Spec ℂ`.

## References

- [stacks-04XE], [stacks-06ML] The Stacks Project Authors, *The Stacks Project*, Properties of
  Algebraic Stacks (Chapter 100): Sections 100.3–100.11 and 100.14.
- [stacks-06QB], [stacks-06RD] The Stacks Project Authors, *The Stacks Project*, Morphisms of
  Algebraic Stacks (Chapter 101): Sections 101.4–101.5, 101.7, 101.17–101.19, 101.28–101.29, 101.31,
  101.33, 101.48, 101.50 and 101.51.
- [stacks-decent-spaces] The Stacks Project Authors, *The Stacks Project*, Decent Algebraic Spaces
  (Chapter 68): Sections 68.6–68.8, 68.10 (Theorem 68.10.2, cited in
  gap:decent-space-schematic-locus), 68.11–68.13 and 68.15.
- [stacks-morphisms-schemes] The Stacks Project Authors, *The Stacks Project*, Morphisms of Schemes
  (Chapter 29): Section 29.59, and Proposition 29.28.2, cited in gap:generic-flatness-spaces.
- [stacks-criteria] The Stacks Project Authors, *The Stacks Project*, Criteria for Representability
  (Chapter 97): Sections 97.17–97.18.
- [stacks-sheaves-on-stacks] The Stacks Project Authors, *The Stacks Project*, Sheaves on Algebraic
  Stacks (Chapter 96): Sections 96.14–96.15, and Sections 96.6, 96.11–96.12, cited in
  gap:qcoh-stacks-abelian-tensor.
- [stacks-algebraic-stacks] The Stacks Project Authors, *The Stacks Project*, Algebraic Stacks
  (Chapter 94): Section 94.6 (morphisms representable by schemes, 5.1), Lemma 94.16.1 and Remark
  94.16.3, cited in gap:flat-groupoid-quotients.
- [stacks-artin] The Stacks Project Authors, *The Stacks Project*, Artin's Axioms (Chapter 98):
  Lemmas 98.5.2, 98.6.1 and 98.7.1, Remark 98.6.2 and Section 98.8, cited in
  gap:algebraic-stacks-satisfy-rs.
- [stacks-formal-defos] The Stacks Project Authors, *The Stacks Project*, Formal Deformation Theory
  (Chapter 90): Lemma 90.29.3, cited in gap:algebraic-stacks-satisfy-rs.
- [stacks-descent] The Stacks Project Authors, *The Stacks Project*, Descent (Chapter 35): Sections
  35.18–35.19, cited in gap:reduced-regular-smooth-local.
- [stacks-spaces-descent] The Stacks Project Authors, *The Stacks Project*, Descent and Algebraic
  Spaces (Chapter 74, "Descent on Spaces"): Section 74.9, cited in gap:reduced-regular-smooth-local.
- [stacks-spaces-over-fields] The Stacks Project Authors, *The Stacks Project*, Algebraic Spaces over
  Fields (Chapter 72, "Spaces over Fields"): Section 72.16, cited in
  gap:reduced-regular-smooth-local.
- [stacks-properties-spaces] The Stacks Project Authors, *The Stacks Project*, Properties of
  Algebraic Spaces (Chapter 66): Proposition 66.13.3, the quasi-separated case of
  gap:decent-space-schematic-locus.
- [stacks-morphisms-spaces] The Stacks Project Authors, *The Stacks Project*, Morphisms of Algebraic
  Spaces (Chapter 67): Lemma 67.10.8 (0.2) and Proposition 67.32.1, cited in
  gap:generic-flatness-spaces.
- [stacks-groupoids-spaces] The Stacks Project Authors, *The Stacks Project*, Groupoids in Algebraic
  Spaces (Chapter 78): Lemmas 78.25.1 and 78.27.1–78.27.2, cited in gap:flat-groupoid-quotients, and
  Lemma 78.12.6, cited in gap:qcoh-stacks-abelian-tensor.
- [stacks-more-groupoids-spaces] The Stacks Project Authors, *The Stacks Project*, More on Groupoids
  in Spaces (Chapter 79): Lemma 79.9.4 and Proposition 79.10.3, cited in
  gap:group-spaces-over-fields.
- [ahr2020] J. Alper, J. Hall, D. Rydh, *A Luna étale slice theorem for algebraic stacks*, Ann. of
  Math. 191 (2020), read as arXiv:1504.06467v3: Theorems 1.1–1.2, §1.5, §3.1.
- [alper-moduli] J. Alper, *Stacks and Moduli*, author's draft of 5 January 2026: §4.3.4
  (Definition 4.3.21), §§4.5.2–4.5.3 (Definitions 4.5.7, 4.5.12–4.5.13, Propositions 4.5.10, 4.5.16,
  Exercise 4.5.11), §7.4.5 (Proposition 7.4.39, Exercises 7.4.40–7.4.42).
- [rydh2011] D. Rydh, *Étale dévissage, descent and pushouts of stacks*, J. Algebra 331 (2011), read
  as arXiv:1005.2171v2: Appendix B, Theorems B.1–B.2.
- [sga3-vi-a] M. Demazure, A. Grothendieck (eds.), *Schémas en groupes* (SGA 3), Tome I, Exposé VI_A,
  re-edition by P. Gille and P. Polo, Documents Mathématiques 7, SMF 2011, read in the editor's
  compilation of 13 October 2024: Théorème 3.2 (quotients `H\G`), cited in
  gap:homogeneous-quotient-scheme.
- [lmb2000] G. Laumon, L. Moret-Bailly, *Champs algébriques*, Springer 2000: Chapter 11, cited by
  locator only.
