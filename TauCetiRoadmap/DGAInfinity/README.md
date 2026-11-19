# Roadmap: DG and A∞ algebras, categories, and modules

**Summary.** Differential graded (DG) objects make homological algebra compositional: morphisms
form complexes, composition obeys the Leibniz rule, and derived categories keep a chain-level
model. `A∞` objects carry the same information but let associativity, functoriality and module
actions hold only up to coherent higher operations `m₃, m₄, …`. This is most useful after passing
to cohomology: homological transfer puts a minimal `A∞` structure directly on cohomology, and its
higher products record what the cohomology algebra forgets. The roadmap builds this theory over a
commutative ring `k`, for uncurved objects graded cohomologically by `ℤ`: signed graded
multilinear algebra and tensor coalgebras; DG and `A∞` algebras, categories, modules and
bimodules; minimal models; bar and cobar constructions and Maurer–Cartan twisting; derived and
perfect module categories; derived Morita theory; DG quotients; Hochschild deformation theory;
smooth, proper and Calabi–Yau structures; Euler forms on perfect objects; and Koszul duality.

The first headline theorem is Kadeishvili's. If `A` is an `A∞` algebra over a field, its
cohomology carries a minimal `A∞` structure whose product is induced by that of `A`, together
with an `A∞` quasi-isomorphism to `A` inducing the identity on cohomology; the structure is unique
up to `A∞` isomorphism. For a unital DG algebra `A` over a field, the structure can be chosen
strictly unital, and restriction along the quasi-isomorphism is a triangle equivalence between the
derived category of `A` and that of strictly unital `A∞` modules over `H*A` with its transferred
operations, matching the perfect objects. The
transferred operations cannot be dropped: for the exterior algebra `Λ(a, b, c)` with `dc = ab`,
the transferred `m₃([a], [a], [b])` is `[ac] ≠ 0`.

The second is the `A∞` Whitehead theorem with unit strictification. Over a field, an `A∞`
morphism is a quasi-isomorphism exactly when it has an inverse up to homotopy, and every `A∞`
algebra whose cohomology has a unit is `A∞` quasi-isomorphic to one with a strict unit.

The third is Keller's derived Morita theorem. If `G` is a compact generator of the derived
category `D(C)` of a small DG category `C`, then `D(C)` is equivalent to the derived category of
the DG endomorphism algebra `RHom(G, G)`, and the compact objects correspond to the perfect
modules.

The fourth is relative Koszul duality. Let `S` be a finite-dimensional separable semisimple
algebra over a field and `A = T_S(V)/(R)` a quadratic algebra on a finitely generated projective
`S`-bimodule `V`. If `A` is Koszul, its quadratic dual `A!` is Koszul, and the Ext algebra of the
augmentation module `S` over `A`, computed with right modules, is `A!`.

Mathlib's cochain complexes, enriched categories, localizations and triangulated categories carry
the DG side. [GrothendieckEulerForms](../GrothendieckEulerForms/README.md) supplies the
Grothendieck groups, finite Euler sums and numerical radicals of Layers 7 and 10, and the linear
resolutions of Layer 11. [ZigzagPreprojective](../ZigzagPreprojective/README.md) uses the
Hochschild criterion of Layer 8, the Calabi–Yau completions of Layer 9 and the Koszul theory of
Layer 11. [RationalHomotopyModels](../RationalHomotopyModels/README.md) and
[EnhancedDerivedSheaves](../EnhancedDerivedSheaves/README.md) use the signs, DG categories, bar
constructions and minimal models of Layers 0–4.

## How to read the build

Layer 0 fixes the representation and the signs: internally graded modules, tensor coalgebras,
the symmetric monoidal category of cochain complexes with its linear Hom complex, and the
suspended form of the Stasheff identities. Layers 1 and 2 build the strict and the higher
algebraic objects: DG algebras, categories, modules and bimodules, then their `A∞` versions with
morphisms, homotopies, functors and units. Layer 3 uses both for homological transfer and minimal
models, and Layer 4 for the bar and cobar constructions, the enveloping DG algebra and
Maurer–Cartan twisting. Layer 5 constructs derived module categories, twisted complexes and the
perfect envelope; Layer 6 builds derived Morita theory on them, including the module equivalence
promised by Kadeishvili's theorem. Layer 7 constructs DG and `A∞` quotients and the Grothendieck
group sequence of a Verdier quotient. Layer 8 is Hochschild cohomology, deformations, Massey
products and formality. Layers 9 and 10 treat smooth, proper, Serre and Calabi–Yau structures and
Euler forms on perfect objects. Layer 11 is relative quadratic and derived Koszul duality. Each
layer ends with its worked examples, which pin the signs, hypotheses and handedness of the general
theorems they test, and with its dependencies. Each section's *Needs:* line lists its inputs, so
that a target proved by another route is not blocked behind an unrelated section.

## Conventions

1. **Ground rings.** Graded, DG, bar, module and category definitions work over a commutative ring
   `k`, whenever the tensor products and colimits they use exist. Homological transfer works over
   `k` given a contraction; the existence of minimal models, homotopy inverses, unit
   strictification and finite-dimensional duality are stated over a field. Their semisimple-base
   versions use an explicitly fixed finite product of fields, or more generally a separable
   semisimple `k`-algebra `S` when the proof needs only bimodule splittings; an `A∞` object over
   `S` is then an `A∞` object in the monoidal category of `S`-bimodules (Keller, Introduction,
   Section 3.5). No theorem infers a splitting merely from projectivity over an arbitrary ring.
2. **Characteristic.** The coderivation-square and brace formulations of `A∞` structures and of
   formal deformations work over every commutative base, and so does the brace form `[m, ξ] +
   ξ{ξ} = 0` of the Maurer–Cartan equation for the difference `ξ` of two structures, which divides
   by nothing. The form `dξ + ½[ξ, ξ] = 0` needs `2` invertible. The exponential gauge action,
   the Deligne groupoid and Getzler's simplicial Maurer–Cartan construction need `k` to be a
   `ℚ`-algebra, or a separately cited replacement in positive characteristic, together with
   nilpotence or the complete pronilpotent filtration named in §8.2.
3. **Size and universes.** DG and `A∞` categories are small in their object universe; Hom
   complexes may live in another universe. Categories of all modules are large; representables,
   finite cell modules and their idempotent completion form an essentially small perfect
   subcategory. Whenever a categorical `K₀` is formed, the essential-smallness policy of
   GrothendieckEulerForms is used rather than a quotient of a large type of objects. Mathlib's
   enrichment in `CochainComplex (ModuleCat k) ℤ` puts `k` and the Hom complexes in one universe,
   and Tau Ceti's DG categories of modules and of DG functors (§§1.2–1.3, 2.4) require the ring,
   the algebra and the carriers to share a universe; a statement that uses them carries that
   restriction.
4. **Handedness.** Right modules are primary: a right `A∞` module has operations
   `m_n^M : M ⊗ A^{⊗(n-1)} → M` of degree `2 − n`. A left `A`-module is a right `Aᵒᵖ`-module. An
   `(A, B)`-bimodule is a left `A`-module and right `B`-module, stored by its two-sided bar
   coderivation; it is compared with a right module over `Aᵒᵖ ⊗ B` only when a tensor-product
   model of `Aᵒᵖ ⊗ B` is available (§2.1). The ordinary finite-dimensional modules of
   GrothendieckEulerForms are left modules, and comparisons apply the opposite-algebra bridge
   explicitly.
5. **Grading and Koszul signs.** Gradings are by `ℤ` and differentials have degree `+1`; `|x|` is
   the degree of a homogeneous `x`. Graded modules are internally graded, a module with a family
   of submodules giving a direct-sum decomposition (Tau Ceti's `TauCeti.InternalGrading`). The
   symmetry sends `x ⊗ y` to `(−1)^{|x||y|} y ⊗ x`, and tensor products of homogeneous maps obey
   `(f ⊗ g)(x ⊗ y) = (−1)^{|g||x|} f(x) ⊗ g(y)`. Signs are Mathlib's `Int.negOnePow`, the
   character of `ComplexShape.up ℤ` in `ComplexShape.TensorSigns`, cast into `k`; no second
   parity calculus is introduced. Tensor products, opposites, Hom complexes, module differentials
   and shifts each carry their degree and sign lemmas, not separate ad hoc formulas.
6. **Shift and suspension.** The cochain shift is Mathlib's `X⟦1⟧`, with `X⟦1⟧^p = X^{p+1}` and
   differential `−d_X`. The suspension `sA` is the same regrading of the same carrier,
   `(sA)^p = A^{p+1}` (Tau Ceti's `TauCeti.InternalGrading.shift`), and the canonical map
   `s : A → sA` has degree `−1`. The two agree as gradings but not as complexes: the suspended
   unary operation is `b₁ = s m₁ s⁻¹ = +m₁`, while `A⟦1⟧` carries `−d`, so an identification of
   `(sA, b₁)` with `A⟦1⟧` passes through the sign automorphism `(−1)^p` on degree `p`. A source
   that uses a suspension of degree `+1` is translated once, through a named equivalence, and the
   translation is reused.
7. **Composition order.** A DG algebra satisfies `d(ab) = d(a)b + (−1)^{|a|} a d(b)`. In a DG
   category, composition `Hom(Y, Z) ⊗ Hom(X, Y) → Hom(X, Z)` in Keller's order satisfies
   `d(g ∘ f) = d(g) ∘ f + (−1)^{|g|} g ∘ d(f)`. Mathlib's `EnrichedCategory.comp` orders the
   factors as `Hom(X, Y) ⊗ Hom(Y, Z)`, with `d(f ≫ g) = d(f) ≫ g + (−1)^{|f|} f ≫ d(g)`. The bridge
   is the symmetric braiding: for homogeneous `f`, `g`, `f ≫ g = (−1)^{|f||g|} (g ∘ f)`, so that
   braiding back recovers Keller's untwisted `m₂(g, f) = g ∘ f`.
8. **The `A∞` convention.** Tau Ceti and this roadmap use the cohomological convention of
   Getzler–Jones and Keller (Keller, Introduction, Section 3.1). An uncurved `A∞` algebra has maps
   `m_n : A^{⊗n} → A` of degree `2 − n` for `n ≥ 1`, and `m₀ = 0`. For `n = r + s + t` with
   `s ≥ 1` and `u = r + 1 + t`, the Stasheff relation is the equality of graded maps

   ```text
   Σ (-1)^(r+s*t) m_u (1^⊗r ⊗ m_s ⊗ 1^⊗t) = 0.                 (SI_n)
   ```

   The displayed sign is not the whole sign on elements: the tensor rule of Convention 5
   contributes the degree-dependent signs. For a category, inputs are written `(a_n, …, a_1)`
   with `a_i : X_{i−1} → X_i`, and `m₂(g, f) = g ∘ f`. Algebra multiplication is `m₂(a, b) = ab`;
   no twist in the style of Seidel is inserted. The stored form is the suspended one: on
   `B∞A = Tᶜ(sA) = ⨁_{n≥1} (sA)^{⊗n}`, the reduced tensor coalgebra with deconcatenation, the
   maps `b_n` of degree one are defined by the commuting square `b_n ∘ s^{⊗n} = s ∘ m_n`, they
   extend uniquely to a coderivation `b` of degree one, and `b² = 0` is equivalent to every
   `(SI_n)` (Keller, Introduction, Section 3.6, Lemma). The unsuspended `m_n`, their degrees,
   `(SI_n)` and the conversions in both directions are public, so ordinary calculations need no
   coalgebra words. In modules and bimodules `Tᶜ(sA)` denotes the coaugmented tensor coalgebra
   `⨁_{n≥0} (sA)^{⊗n}`, which contains the empty word.
9. **The low-arity relations.** The first four relations are the following map equations.

   ```text
   n=1:  m₁m₁ = 0.

   n=2:  m₁m₂ - m₂(m₁⊗1) - m₂(1⊗m₁) = 0.

   n=3:  m₁m₃ + m₂(m₂⊗1) - m₂(1⊗m₂)
          + m₃(m₁⊗1⊗1 + 1⊗m₁⊗1 + 1⊗1⊗m₁) = 0.

   n=4:  m₁m₄ - m₂(m₃⊗1) - m₂(1⊗m₃)
          + m₃(m₂⊗1⊗1) - m₃(1⊗m₂⊗1) + m₃(1⊗1⊗m₂)
          - m₄(m₁⊗1⊗1⊗1 + 1⊗m₁⊗1⊗1
                + 1⊗1⊗m₁⊗1 + 1⊗1⊗1⊗m₁) = 0.
   ```

   On elements, `n = 2` reads `m₁(m₂(a, b)) = m₂(m₁a, b) + (−1)^{|a|} m₂(a, m₁b)`. Put
   `ε(p) = (−1)^p` and let `a, b, c, d` have degrees `p, q, r, s`. The tensor rule turns the
   relations of arities three and four into the following element equations, which are
   consequences, not new axioms:

   ```text
   0 = m₁m₃(a,b,c) + m₂(m₂(a,b),c) - m₂(a,m₂(b,c))
       + m₃(m₁a,b,c) + ε(p)m₃(a,m₁b,c) + ε(p+q)m₃(a,b,m₁c).

   0 = m₁m₄(a,b,c,d)
       - m₂(m₃(a,b,c),d) - ε(p)m₂(a,m₃(b,c,d))
       + m₃(m₂(a,b),c,d) - m₃(a,m₂(b,c),d) + m₃(a,b,m₂(c,d))
       - m₄(m₁a,b,c,d) - ε(p)m₄(a,m₁b,c,d)
       - ε(p+q)m₄(a,b,m₁c,d) - ε(p+q+r)m₄(a,b,c,m₁d).
   ```

   Setting `m_n = 0` for `n ≥ 3` reduces them to the differential and associativity laws of a DG
   algebra.
10. **Maurer–Cartan elements.** The suspension also fixes the sign in twisting. If `α` has degree
    one and the sum is finite (§4.4 names the regimes in which it is), the unsuspended
    Maurer–Cartan equation corresponding to the sign-free suspended equation
    `Σ_n b_n(sα, …, sα) = 0` is

    ```text
    Σ_{n≥1} (-1)^(n(n-1)/2) m_n(α,…,α) = 0.                 (MC)
    ```

    The sign is the Koszul sign of `s^{⊗n}` on `α^{⊗n}`. In the DG case `(MC)` is `dα − α² = 0`.
    Keller's equation (7.1) for the twisting matrix `δ` of a twisted object over an `A∞` category
    is `(MC)` for `δ` itself (Keller, Introduction, Section 7.6), and is the acceptance test of
    this sign. The twisted complexes of a DG category in the convention of Bondal–Kapranov, which
    are those of §5.2, use the negative `δ = −α` and satisfy `dδ + δ² = 0` in Keller's order. The
    roadmap keeps `α` for algebraic twisting (§4.4) and `δ` for DG twisted objects (§5.2), states
    the negation bridge once, and never mixes the two.
11. **Units.** The underlying `A∞` and DG carriers are nonunital, and a unit is a property of a
    chosen element; strictly unital objects, carrying such a unit, are the primary unital variant.
    A strict unit `e` of an `A∞` algebra has degree zero, `m₁(e) = 0`, `m₂(e, a) = a = m₂(a, e)`,
    and `m_n(…, e, …) = 0` for `n ≠ 2`. A strictly unital morphism sends `e` to `e` in arity one,
    and its higher components vanish when an input is `e`. An augmentation of a strictly unital
    `A∞` algebra is a strictly unital morphism `ε` to the base with `ε(e) = 1`; the algebra splits
    as the base plus the augmentation ideal `ker ε`, and its bar construction is that of `ker ε`.
    A cohomologically unital object has a unit only in `H*(A, m₁)`; it is a separate predicate,
    and chain-level representatives are never silently promoted to strict units.
12. **Morphisms and equivalences.** An `A∞` morphism `f : A → B` has components
    `f_n : A^{⊗n} → B` of degree `1 − n`; an `A∞` functor has the analogous components on
    composable strings. A morphism or functor is strict when all components above arity one
    vanish. A quasi-isomorphism is a morphism whose `f₁` induces an isomorphism on cohomology. For
    categories, a quasi-equivalence is a functor into a cohomologically unital category that is
    quasi-fully faithful on every Hom complex and essentially surjective on `H⁰`; it is a
    different predicate from a derived Morita equivalence (§6.3). Over a field a
    quasi-isomorphism of complexes is a chain-homotopy equivalence after choosing splittings;
    over an arbitrary commutative ring the inverse-up-to-homotopy theorem of §3.5 assumes that
    `f₁` itself is a chain-homotopy equivalence, and a bare quasi-isomorphism is not enough.
13. **Suspended modules and bimodules.** A right `A∞` module is stored by its maps
    `b_n^M : sM ⊗ (sA)^{⊗(n−1)} → sM` of degree one, extended to a coderivation `b^M` over `b` on
    the cofree right comodule `sM ⊗ Tᶜ(sA)`. The module equation is `(b^M)² = 0` together with the
    coderivation equation `Δ_M b^M = (b^M ⊗ 1 + 1 ⊗ b) Δ_M`, read with the tensor rule of
    Convention 5 (so `1 ⊗ b` carries the sign `(−1)^{|x|}` past the module factor `x`);
    unsuspension derives every element-level sign. An `(A, B)`-bimodule has suspended components
    `b_{i,j} : (sA)^{⊗i} ⊗ sM ⊗ (sB)^{⊗j} → sM` of degree one, equivalently unsuspended operations
    of degree `1 − i − j`, extending to the square-zero bicomodule coderivation on
    `Tᶜ(sA) ⊗ sM ⊗ Tᶜ(sB)`. This is the primary definition of a bimodule.
14. **Names.** Library declarations are written with their full names, most of Tau Ceti's
    beginning `TauCeti.`; those that do not are listed under the supplier contract From Tau Ceti.
    The headline theorems stated in [Suggested.lean](Suggested.lean) are in the namespace
    `TauCetiRoadmap.DGAInfinity`; every other target is described in prose.

## Layer 0: signed graded multilinear algebra and tensor coalgebras

Getzler–Jones, Sections 1–2, supplies the bar and coderivation convention and the brace signs;
Keller, Introduction, Sections 3.1 and 3.6, supplies the degrees `2 − n`, the sign
`(−1)^{r+st}`, the suspension of degree `−1` and the equivalence with `b² = 0`.

### 0.1 Graded modules and homogeneous multilinear maps

A graded module is a `k`-module with an internal `ℤ`-grading, Tau Ceti's `TauCeti.InternalGrading`:
a family of submodules whose direct sum is the module. In [Suggested.lean](Suggested.lean) it is
`TauCetiRoadmap.DGAInfinity.InternalGrading`, with membership in the degree-`p` summand
`TauCetiRoadmap.DGAInfinity.InternalGrading.IsHomogeneous` and linear maps of degree `q`, sending
degree `p` into degree `p + q`, `TauCetiRoadmap.DGAInfinity.LinearHasDegree`. The latter is Tau
Ceti's `TauCeti.LinearMap.IsHomogeneous` on the two families of summands with `p` and `x` taken
explicitly, the form `TauCeti.LinearMap.isHomogeneous_def` unfolds it to; StablePeriodicCurved
applies it in that form. The shift of a grading is
`TauCeti.InternalGrading.shift`, with `(G.shift c)^p = G^{p+c}`, and the Koszul sign operator
`TauCeti.InternalGrading.koszulTwist` multiplies degree `e` by `(−1)^{qe}`. Tau Ceti supplies the
tensor product of gradings `TauCeti.InternalGrading.tensorProduct`, the graded dual
`TauCeti.InternalGrading.dual` with the signed comparison
`TauCeti.InternalGrading.signedDualDistribEquiv` for finite projective modules, the opposite
`TauCeti.InternalGrading.opposite`, direct sums `TauCeti.InternalGrading.directSum`, homogeneous
induction and degreewise extensionality (Mathlib's `DirectSum.Decomposition` API through the
instance), and the object-level comparison with Mathlib's graded objects:
`TauCeti.InternalGrading.toGradedObject`, `TauCeti.InternalGrading.ofGradedObject`,
`TauCeti.InternalGrading.totalIso` and `TauCeti.InternalGrading.tensorProductGradedObjectIso`. A
multilinear map is homogeneous of degree `q` when it adds `q` to the sum of the input degrees
(`TauCeti.MultilinearMap.IsHomogeneous`); substituting a homogeneous operation of degree `q` after
the first `r` inputs carries the Koszul sign `(−1)^{q(|x_1| + ⋯ + |x_r|)}`
(`TauCeti.InternalGrading.signedCompMultilinearMap`, with its evaluation lemma on a single
substituted operation). For a graded quiver, Tau Ceti's `TauCeti.GradedLinearQuiver`, operations on
composable paths are dependent multilinear maps, transported along linear equivalences of the graded
pieces (`TauCeti.GradedLinearQuiver.pathOperationEquiv`,
`TauCeti.GradedLinearQuiver.pathSuspensionEquiv`) rather than through equality casts.

Prove that internally graded `k`-modules with degree-zero maps are equivalent, as a category, to
Mathlib's `GradedObject ℤ (ModuleCat k)`, by functors extending the object-level comparison
above, and that the equivalence carries shifts, tensor products and direct sums to Mathlib's.
Define the Koszul symmetry `x ⊗ y ↦ (−1)^{|x||y|} y ⊗ x` of internally graded tensor products
and identify it with Mathlib's `TensorProduct.gradedComm` under the equivalence. Define the
multi-brace `f{g_1, …, g_r}`, the sum over all ways of inserting `g_1, …, g_r` in this order into
the inputs of `f`, with the Koszul sign of each `g_i` passing the inputs before it, and prove the
brace relation expressing `(f{g_1, …, g_r}){h_1, …, h_s}` as a signed sum of iterated braces
(Getzler–Jones, Section 1); the single brace is Tau Ceti's `TauCeti.ReducedTensorWords.brace`.
*Needs:* Mathlib `DirectSum.Decomposition`, `CategoryTheory.GradedObject`,
`TensorProduct.gradedComm`, `MultilinearMap`; Tau Ceti `TauCeti.InternalGrading` and the
declarations above.

- The equivalence sends the shift `TauCeti.InternalGrading.shift` by `c` to Mathlib's shift of
  graded objects by `c`, and the tensor product of gradings to the tensor product of graded
  objects.
- The Koszul symmetry is an involution and is natural in degree-zero maps.
- The brace `f{g}` with one argument is `TauCeti.ReducedTensorWords.brace` after suspension, and
  `f{}` is `f`.

**Checks.**
- For the exterior algebra `Λ(x)` with `|x| = 1`, the Koszul symmetry sends `x ⊗ x` to
  `−x ⊗ x`; the unsigned swap would fix it.

### 0.2 Tensor coalgebras and coderivations

The reduced tensor coalgebra `Tᶜ(M) = ⨁_{n≥1} M^{⊗n}` is Tau Ceti's
`TauCeti.ReducedTensorWords`, with deconcatenation
`TauCeti.ReducedTensorWords.deconcatenation` (coassociative) and the length filtration
`TauCeti.ReducedTensorWords.filtration`; the coaugmented one, with the empty word, is
`TauCeti.TensorWords`, a Mathlib `Coalgebra`. Coderivations of degree `q` with the Koszul twist
are `TauCeti.ReducedTensorWords.IsGradedCoderivation`; the extension of a Taylor map
`Tᶜ(M) → M` to a coderivation is `TauCeti.ReducedTensorWords.gradedCoderiv`, and the equivalence
between coderivations and Taylor maps is `TauCeti.ReducedTensorWords.gradedCoderivEquivTaylor`
(coaugmented version `TauCeti.TensorWords.gradedCoderivEquivTaylor`). Coalgebra maps
correspond to their Taylor components by `TauCeti.ReducedTensorWords.coalgHomEquivTaylor`. The
completed tensor coalgebras, products over the tensor length, are
`TauCeti.CompletedTensorWords` and `TauCeti.CompletedReducedTensorWords`.

Prove that the reduced tensor coalgebra is conilpotent: an element of length at most `n` is
killed by the `n`-fold iterated reduced deconcatenation. Prove that the completed reduced tensor
coalgebra is not conilpotent as soon as `M ≠ 0`, so that direct-sum and product versions are
never identified.
*Needs:* Tau Ceti `TauCeti.ReducedTensorWords.deconcatenation`,
`TauCeti.ReducedTensorWords.filtration`, `TauCeti.CompletedReducedTensorWords`.

**Checks.**
- For `M = k·x`, the element of the completed reduced tensor coalgebra with component `x^{⊗n}`
  in every length `n ≥ 1` has nonzero `n`-fold iterated deconcatenation for every `n`; it lies in
  no stage of the length filtration, unlike every element of the direct sum.
- The Taylor map of the coderivation extending `b : M → M` (arity one only) is `b` on letters and
  zero on longer words, and the coderivation acts on `x₁ ⊗ x₂` by
  `b(x₁) ⊗ x₂ + (−1)^{q|x₁|} x₁ ⊗ b(x₂)`; omitting the twist gives a map that is not a
  coderivation for the graded coproduct when `q` is odd.

### 0.3 Cochain complexes as a symmetric monoidal category

The monoidal structure on unbounded `CochainComplex (ModuleCat k) ℤ` is Mathlib's
`HomologicalComplex.monoidalCategory` for `ComplexShape.up ℤ` and its `TensorSigns`; it is used,
never rebuilt. The Koszul braiding, with sign `(−1)^{pq}` on the summand `X^p ⊗ Y^q`, is Tau
Ceti's `TauCeti.koszulBraidedCategory`, symmetric by `TauCeti.koszulSymmetricCategory`. The
`k`-linear Hom complex is Mathlib's `CochainComplex.linearHomComplex`, with differential
`d(f) = d_Y f − (−1)^{|f|} f d_X` (Mathlib's `CochainComplex.HomComplex.δ`). Tau Ceti supplies
its closed degree-zero composition `TauCeti.linearHomComplexComp` in Keller's order, the
enriched composition `TauCeti.linearHomComplexEnrichedComp` (the braiding followed by Keller's
composition), the enrichment `TauCeti.linearHomComplexEnrichedCategory` of cochain complexes in
any `k`-linear preadditive category, and the comparison
`TauCeti.forget₂LinearHomComplexIso` of the underlying additive complex with Mathlib's
`CochainComplex.HomComplex`. Nothing in this section is a target; it fixes what Layers 1 and 5
build on.
*Needs:* Mathlib `HomologicalComplex.monoidalCategory`, `CochainComplex.linearHomComplex`; Tau
Ceti as above.

**Checks.**
- For the complex `k⟦1⟧` (the field in degree `−1`), the braiding of `k⟦1⟧ ⊗ k⟦1⟧` with itself
  is `−1` on the one-dimensional degree `−2` piece; Mathlib's unsigned braiding of graded
  objects would give `+1`.
- For complexes `X`, `Y` concentrated in degree zero, the linear Hom complex is `Hom(X⁰, Y⁰)` in
  degree zero, and enriched composition is ordinary composition with no sign.

### 0.4 Suspension and the Stasheff identities

The suspension square of Convention 8 is Tau Ceti's `TauCeti.AInfinity.IsSuspension`, with the
conversions `TauCeti.AInfinity.suspensionTaylor` and `TauCeti.AInfinity.desuspension` in both
directions. The equivalence between `b² = 0` and the relations `(SI_n)` is
`TauCeti.AInfinity.IsSuspension.comp_self_eq_zero_iff_forall_stasheffSum_eq_zero`, with the
evaluated relation `TauCeti.AInfinity.stasheffSum`; for an `A∞` algebra it is
`TauCeti.AInfinityAlgebra.barDifferential_sq_iff_stasheff`. The arity component of `b² = 0` in
lengths one to four is equivalent to the displayed equation of Convention 9
(`TauCeti.AInfinity.IsSuspension.taylorComponent_comp_self_one_eq_zero_iff` and its
analogues for two, three and four), whose element forms are
`TauCeti.AInfinityAlgebra.stasheff_arity_one`, `TauCeti.AInfinityAlgebra.stasheff_arity_two`,
`TauCeti.AInfinityAlgebra.stasheff_arity_three` and
`TauCeti.AInfinityAlgebra.stasheff_arity_four`. With `m_n = 0` for `n ≥ 3`, arity three is
associativity and arity four is empty
(`TauCeti.AInfinity.stasheffSum_three_eq_zero_iff_of_m_three_eq_zero`,
`TauCeti.AInfinity.stasheffSum_four_eq_zero_of_m_three_eq_zero_of_m_four_eq_zero`).

Prove the four relations of Convention 9 as equalities of graded maps on `A^{⊗n}`, with the
tensor rule of Convention 5, not only on homogeneous elements; Tau Ceti states the map forms in
arities two and three (`TauCeti.AInfinityAlgebra.m_one_m_two`,
`TauCeti.AInfinityAlgebra.m_one_m_three`).
*Needs:* §§0.1–0.2; Tau Ceti `TauCeti.AInfinityAlgebra` and the declarations above.

### Examples

The sign audit in arities one to four is the acceptance test of this layer. On formal homogeneous
symbols `a, b, c, d` the four displayed identities are exactly the tensor-length one to four
components of `b² = 0`, as maps and after evaluation. In arity two the evaluated sign is
`(−1)^{|a|}` on `m₂(a, m₁b)`. With `m_n = 0` for `n ≥ 3`, arity three is ordinary associativity
and arity four is empty. Suspending and unsuspending the same operations returns them
(`TauCeti.AInfinity.suspensionTaylor_desuspension`, `TauCeti.AInfinityAlgebra.ofTaylor_self`). A
strict unit satisfies `m₂(e, a) = a = m₂(a, e)` with no degree-dependent correction, while its
suspended form carries one on the right: `b₂(se, sa) = sa` but `b₂(sa, se) = (−1)^{|a|} sa`,
because `s ⊗ s` passes `a` (`TauCeti.AInfinityAlgebra.StrictUnit.taylor_of_two_unit_left`,
`TauCeti.AInfinityAlgebra.StrictUnit.taylor_of_two_unit_right`).

### Dependencies

Mathlib graded objects, tensor powers, multilinear maps, `HomologicalComplex.monoidalCategory`,
`CochainComplex.linearHomComplex` and `ComplexShape.TensorSigns`; Tau Ceti as named in the
sections. Nothing of Layers 1–11 is used.

## Layer 1: DG algebras, categories, modules, and bimodules

Keller, *Deriving DG categories*, Sections 2–6, supplies DG modules, representables, tensor and
Hom; Drinfeld, Section 2, supplies the conventions for small DG categories, quasi-equivalences and
modules.

### 1.1 DG algebras

A DG algebra over `k` is an internally graded `k`-algebra with a differential `d` of degree one,
`d² = 0`, satisfying `d(ab) = d(a)b + (−1)^{|a|} a d(b)`: Tau Ceti's `TauCeti.IsDGAlgebra`, with
the nonunital version `TauCeti.IsNonUnitalDGAlgebra`, morphisms `TauCeti.DGAlgHom` and
`TauCeti.NonUnitalDGAlgHom`, and augmentations `TauCeti.DGAlgAugmentation` (a DG algebra map to
`k` in degree zero, with augmentation ideal and splitting). Tau Ceti also supplies cycles,
boundaries and the graded cohomology algebra `TauCeti.IsDGAlgebra.Cohomology` with its
functoriality `TauCeti.DGAlgHom.cohomologyMap`; the graded opposite
`TauCeti.IsDGAlgebra.gradedOpposite`, with `aᵒᵖ bᵒᵖ = (−1)^{|a||b|} (ba)ᵒᵖ` and the same
differential; the graded tensor product `TauCeti.isDGAlgebra_gradedTensorGrading` on Mathlib's
`𝒜 ᵍ⊗[k] ℬ`, with `d(a ⊗ b) = da ⊗ b + (−1)^{|a|} a ⊗ db`
(`TauCeti.dgTensorDifferential_tmul_of_mem`); the DG algebra of a graded algebra with zero
differential `TauCeti.isDGAlgebra_zero`; and the endomorphism DG algebra of an object of a DG
category `TauCeti.DGEnd.isDGAlgebra` (for a complex, through
`TauCeti.linearHomComplexEnrichedCategory`).

Extend the graded opposite and the graded tensor product to nonunital DG algebras, with the same
sign formulas, and prove that they agree with the unital constructions on unital DG algebras.
*Needs:* Tau Ceti `TauCeti.IsNonUnitalDGAlgebra`, `TauCeti.IsDGAlgebra.gradedOpposite`,
`TauCeti.isDGAlgebra_gradedTensorGrading`; Mathlib `GradedTensorProduct`.

**Checks.**
- For the exterior algebra `Λ(x, y)` with `|x| = |y| = 1` and zero differential, the identity
  `aᵒᵖ ↦ a` is an isomorphism from the graded opposite to `Λ(x, y)`, because the algebra is
  graded commutative. With the plain opposite `MulOpposite` it is not multiplicative:
  `xᵒᵖ yᵒᵖ = (yx)ᵒᵖ = −(xy)ᵒᵖ`.
- For `A = k[x]/(x²)` with `|x| = 1` and zero differential, in `A ⊗ A` the products
  `(x ⊗ 1)(1 ⊗ x) = x ⊗ x` and `(1 ⊗ x)(x ⊗ 1) = −x ⊗ x` differ; an unsigned tensor product would
  make them equal.

### 1.2 DG categories

A DG category over `k` is a category enriched in `CochainComplex (ModuleCat k) ℤ` with Mathlib's
monoidal structure, Tau Ceti's `TauCeti.DGCategory`. Its morphisms of degree `n` are
`TauCeti.DGHom`, with composition `TauCeti.dgComp` in Mathlib's order, identities `TauCeti.dgId`
and differential `TauCeti.dgDifferential`, satisfying the Leibniz rule
`TauCeti.dgDifferential_dgComp`; the comparison with explicit Hom-complex data in either order is
`TauCeti.DGCategoryData.equivDGCategory`, with Keller-ordered input
`TauCeti.DGCategoryData.ofKeller`. The category `Z⁰` of closed degree-zero maps is Mathlib's
`ForgetEnrichment`, identified with degree-zero cycles by `TauCeti.dgClosedHomEquiv`; the
homotopy category `H⁰` is `TauCeti.DGHomotopyCategory`, a `k`-linear category with the functor
`TauCeti.dgClosedToHomotopy`, and for cochain complexes
`TauCeti.homotopyCategoryToDGHomotopyCategory` identifies it with Mathlib's
`HomotopyCategory C (ComplexShape.up ℤ)`. DG functors are Mathlib's `EnrichedFunctor` (bundled as
`TauCeti.DGFunctor`), DG natural transformations are `TauCeti.DGNatTrans`, and DG functors from a
category whose objects lie in the universe of `k` form a DG category
(`TauCeti.DGFunctor.instDGCategory`). The opposite DG category is Mathlib's
`CategoryTheory.EnrichedCategory.opposite` for the Koszul braiding, with
`TauCeti.dgComp_op`; the tensor product of DG categories is `TauCeti.tensorEnrichedCategory`,
with `TauCeti.dgComp_dgTensorHom`; full DG subcategories are `TauCeti.DGFullSubcategory`.
Quasi-fully faithful DG functors and quasi-equivalences are
`CategoryTheory.EnrichedFunctor.IsQuasiFullyFaithful` and
`CategoryTheory.EnrichedFunctor.IsQuasiEquivalence` (Tau Ceti), and a quasi-equivalence induces
an equivalence on `H⁰`
(`CategoryTheory.EnrichedFunctor.IsQuasiEquivalence.isEquivalence_mapDGHomotopyCategory`).

Define the underlying graded category of a DG category, the enrichment in graded `k`-modules
obtained by forgetting differentials along the lax monoidal forgetful functor from cochain
complexes to graded objects (Mathlib's `CategoryTheory.TransportEnrichment`), and identify its
morphisms of degree `n` with `TauCeti.DGHom` and its composition with `TauCeti.dgComp`.
*Needs:* §0.3; Mathlib `CategoryTheory.EnrichedCategory`, `CategoryTheory.TransportEnrichment`;
Tau Ceti as above.

**Checks.**
- In the DG category of complexes of `k`-modules, for `f : X → Y` of degree `p` and
  `g : Y → Z` of degree `q`, `f ≫ g = (−1)^{pq} g ∘ f`; for `p = q = 1` the enriched and Keller
  compositions differ by a sign, and a DG category that used plain composition in the enriched
  order would violate the Leibniz rule `d(f ≫ g) = d(f) ≫ g + (−1)^{|f|} f ≫ d(g)`.
- For the one-object DG category of `Λ(x)` with `|x| = 1` and zero differential, `H⁰` has
  endomorphism ring `k`, while `Z⁰` and `H⁰` agree because the differential is zero.

### 1.3 DG modules and bimodules

Over a DG algebra `A`, right, left and bimodules are Tau Ceti's `TauCeti.IsDGRightModule`
(`d(x · a) = d(x) · a + (−1)^{|x|} x · d(a)`), `TauCeti.IsDGLeftModule` and
`TauCeti.IsDGBimodule`, with the categories `TauCeti.DGRightModuleCat` and
`TauCeti.DGBimoduleCat`; for ring, algebra and modules in one universe, these are DG categories
(`TauCeti.DGRightModuleCat.instDGCategory`, `TauCeti.DGBimoduleCat.instDGCategory`) whose Hom
complexes have differential `d_N f − (−1)^{|f|} f d_M`. Tau Ceti supplies restriction and
extension of scalars along DG algebra maps with their adjunction
(`TauCeti.DGRightModuleCat.restrictScalars`, `TauCeti.DGRightModuleCat.extendScalars`,
`TauCeti.DGRightModuleCat.extendRestrictScalarsAdj`); the tensor product of bimodules
`TauCeti.DGBimoduleCat.tensorObj` and of a right module with a bimodule
`TauCeti.DGRightModuleCat.tensorBimoduleFunctor`; internal Hom
`TauCeti.DGBimoduleCat.internalHomFunctor` with the adjunction
`TauCeti.DGBimoduleCat.tensorInternalHomAdjunction`; the associativity and unit laws of the
tensor product of bimodules (`TauCeti.DGBimoduleCat.tensorAssoc`,
`TauCeti.DGBimoduleCat.tensorAssoc_pentagon`, `TauCeti.DGBimoduleCat.instMonoidalCategory`); and
the DG Yoneda embedding of `A` into its right modules (`TauCeti.dgYonedaEmbedding`, quasi-fully
faithful by `TauCeti.isQuasiFullyFaithful_dgYonedaEmbedding`, with `TauCeti.dgYonedaIso`). Over a
DG category `C`, a right module is a DG functor `Cᵒᵖ → C(k)` into complexes of `k`-modules; the
representable modules are `TauCeti.dgRepresentable`, the DG Yoneda embedding is
`TauCeti.dgYoneda`, quasi-fully faithful by `TauCeti.isQuasiFullyFaithful_dgYoneda`, and the
Yoneda lemma at the level of Hom complexes is `TauCeti.dgRepresentableHomIso`.

For a DG category, define left modules (DG functors `C → C(k)`) and `(C, D)`-bimodules (right
modules over `Cᵒᵖ ⊗ D`, with the tensor DG category of §1.2) with their DG categories, and prove
that for one-object DG categories they agree with `TauCeti.IsDGLeftModule` and
`TauCeti.IsDGBimodule`. For a DG functor `F : C → D`, define restriction of right modules along
`F` and its left adjoint, extension `M ↦ M ⊗_C D`, as DG functors between module DG categories,
and prove the adjunction at the level of Hom complexes. Define the tensor product of a right
`C`-module with a `(C, D)`-bimodule and the internal Hom, with the associativity and unit laws
of the algebra case.
*Needs:* §1.2; Tau Ceti `TauCeti.DGFunctor.instDGCategory`, `TauCeti.tensorEnrichedCategory`,
`TauCeti.dgRepresentable`, `TauCeti.IsDGBimodule`.

- Restriction along `F` sends the representable of `F(X)` to the module `Hom_D(F(−), F(X))`, and
  extension sends the representable of `X` to the representable of `F(X)`.
- Restriction along the identity is the identity, and restriction along a composite is the
  composite of restrictions.

**Checks.**
- For `C` with one object and endomorphism DG algebra `A`, extension along the unit `k → A` sends
  the module `k` to the free module `A`, and restriction sends `A` to its underlying complex.

### 1.4 One-object categories and endomorphism algebras

A DG algebra is a one-object DG category by `TauCeti.DGSingleObj`, with morphisms of degree `n`
identified with `A^n` and composition `f ≫ g ↦ (−1)^{|f||g|} g f`
(`TauCeti.DGSingleObj.dgHomEquiv_dgComp`); the endomorphism DG algebra of the object is `A` again
(`TauCeti.DGSingleObj.dgEndAlgEquiv`). The comparison of right modules over `A` with right DG
modules over the one-object category is `TauCeti.DGRightModuleCat.singleObjFunctor`, full and
faithful. An ordinary left module over an algebra `A` in degree zero is the same as a right DG
module over `Aᵐᵒᵖ` concentrated in degree zero
(`TauCeti.DGRightModuleCat.leftDegreeZeroEquivalence`), the plain opposite agreeing with the
graded opposite in degree zero.

Prove that `TauCeti.DGRightModuleCat.singleObjFunctor` is essentially surjective, hence an
equivalence, and that it is the underlying functor of a DG functor which is an isomorphism on Hom
complexes. For an object `X` of a DG category `C`, prove that right modules over the DG algebra
`TauCeti.DGEnd k X` and right modules over the full DG subcategory on `X` correspond in the same
way.
*Needs:* §§1.1–1.3; Tau Ceti `TauCeti.DGSingleObj`, `TauCeti.DGEnd`,
`TauCeti.DGRightModuleCat.singleObjFunctor`.

### Examples

For the DG algebra of endomorphisms of the complex `k → k` (identity in degrees `0 → 1`), the
complex is contractible, its cohomology algebra is zero, and its `H⁰` category has a zero object;
the free module over it is a zero object of `H⁰` of right modules. For the graded algebra
`k[x]` with `|x| = 2` and zero differential, the representable module is `k[x]` itself and the
Yoneda lemma identifies its endomorphism complex with `k[x]`.

### Dependencies

Layer 0; Mathlib enriched categories, `ForgetEnrichment`, `HomotopyCategory`,
`GradedTensorProduct`, `MulOpposite`; Tau Ceti as named in the sections.

## Layer 2: `A∞` algebras, categories, morphisms, functors, modules, and bimodules

Keller, Introduction, Sections 3–5 and 7, is the convention source for algebras, morphisms,
modules and categories; Lyubashenko, *Category of A∞-categories*, supplies functors,
transformations and functor categories; Lyubashenko–Manzyuk, *A∞-bimodules and Serre
A∞-functors*, supplies bimodules.

### 2.1 `A∞` algebras and their units

An `A∞` algebra over `k` is Tau Ceti's `TauCeti.AInfinityAlgebra`: an internal grading,
operations `m_n` of degree `2 − n` with `m₀ = 0`, and the Taylor map of the suspended bar
coderivation with `b² = 0`; the unsuspended Stasheff relations are
`TauCeti.AInfinityAlgebra.stasheff`, and an `A∞` algebra is built from either description by
`TauCeti.AInfinityAlgebra.ofStasheff` or `TauCeti.AInfinityAlgebra.ofTaylor`. Strict units are
`TauCeti.AInfinityAlgebra.StrictUnit`, unique when they exist
(`TauCeti.AInfinityAlgebra.StrictUnit.eq`); augmentations, including their strict unit, are
`TauCeti.AInfinityAlgebra.Augmentation`, with the `A∞` structure on the augmentation ideal
`TauCeti.AInfinityAlgebra.Augmentation.reducedAlgebra`; cohomological units are
`TauCeti.AInfinityAlgebra.CohomologicalUnit` and `TauCeti.AInfinityAlgebra.CohomologicallyUnital`,
implied by strict units (`TauCeti.AInfinityAlgebra.StrictUnit.cohomologicalUnit`). The opposite
`TauCeti.AInfinityAlgebra.op` evaluates `m_n` on the reversed inputs with the Koszul sign of the
reversal times `(−1)^{(n−1)(n−2)/2}`. A DG algebra is an `A∞` algebra with `m₁ = d`, `m₂` the
product and `m_n = 0` for `n ≥ 3` (`TauCeti.IsNonUnitalDGAlgebra.toAInfinityAlgebra`), the unit
is a strict unit (`TauCeti.IsDGAlgebra.strictUnit_one`), DG algebra maps become strictly unital
strict morphisms (`TauCeti.DGAlgHom.toAInfinityStrictUnitalHom`), and an `A∞` structure on the
carrier of an algebra whose `m₂` is the product and whose higher operations vanish is the one
coming from the DG algebra (`TauCeti.AInfinityAlgebra.eq_toAInfinityAlgebra`).

Construct the tensor product of an `A∞` algebra `A` with a DG algebra `B`: on `A ⊗ B`,
`m₁ = m₁ ⊗ 1 + 1 ⊗ d` and, for `n ≥ 2`,
`m_n(a_1 ⊗ b_1, …, a_n ⊗ b_n) = ± m_n(a_1, …, a_n) ⊗ b_1 ⋯ b_n` with the Koszul sign of moving
the `b_i` past the `a_j`; no choice is involved. The tensor product of two `A∞` algebras depends
on a chosen diagonal of the associahedra; construct it for such a diagonal given as data, and
let every theorem that uses it name the diagonal. Prove that the tensor product with a DG
algebra preserves strict units, and that for `B` the matrix algebra `M_r(k)` in degree zero it is
the matrix `A∞` algebra, with `m_n` applied entrywise to products of matrix units. Given an `A∞`
algebra with a strict unit and `m₃ = m₄ = ⋯ = 0`, construct the DG algebra on its carrier with
product `m₂` and differential `m₁`, inverse to the DG-to-`A∞` conversion above.
*Needs:* Layer 1; Tau Ceti `TauCeti.AInfinityAlgebra`, `TauCeti.AInfinityAlgebra.StrictUnit`,
`TauCeti.AInfinityAlgebra.m_two_assoc_of_m_three_eq_zero`.

**Checks.**
- For a DG algebra, `TauCeti.AInfinityAlgebra.op` is the graded opposite of §1.1: the factor
  `(−1)^{(n−1)(n−2)/2}` is `1` in arities one and two. A factor `(−1)^{n(n−1)/2}` instead would
  give `m₂ᵒᵖ(a, b) = −(−1)^{|a||b|} m₂(b, a)`, and for a commutative algebra in degree zero the
  "opposite" would have product `−ab`.
- The tensor product of an `A∞` algebra `A` with `B = k` is `A`, and with `B = k × k` it is
  `A × A`; these do not see the Koszul sign, which `B = Λ(y)` with `|y| = 1` does:
  `m₂(a ⊗ y, a' ⊗ 1) = (−1)^{|a'|} m₂(a, a') ⊗ y`.

### 2.2 `A∞` morphisms and homotopies

An `A∞` morphism is a map of bar coalgebras commuting with the bar differentials, Tau Ceti's
`TauCeti.AInfinityHom`, with unsuspended components `TauCeti.AInfinityHom.component` of degree
`1 − n`, identity `TauCeti.AInfinityHom.id`, composition `TauCeti.AInfinityHom.comp` and the
category laws. Strict morphisms are `TauCeti.AInfinityHom.IsStrict` and
`TauCeti.AInfinityStrictHom`; strictly unital ones are `TauCeti.AInfinityHom.IsStrictlyUnital`.
Quasi-isomorphisms are `TauCeti.AInfinityHom.IsQuasiIso`, bijective on the cohomology of `m₁`,
closed under composition and two-out-of-three; isomorphisms are `TauCeti.AInfinityHom.IsIso`,
exactly the morphisms with bijective linear part
(`TauCeti.AInfinityHom.isIso_iff_linearPart_bijective`). A homotopy between `f` and `g` is a
coderivation `H` along their bar maps `F` and `G`, of degree `−1`, with `F − G = b H + H b`
(`TauCeti.AInfinityHom.Homotopy`, with `TauCeti.AInfinityHom.Homotopy.compLeft` and
`TauCeti.AInfinityHom.Homotopy.compRight`; Keller, Introduction, Section 3.7).

Prove the unsuspended component equation of an `A∞` morphism in every arity,

```text
Σ (-1)^(r+s*t) f_u (1^⊗r ⊗ m_s ⊗ 1^⊗t) = Σ (-1)^σ m_r (f_i1 ⊗ ⋯ ⊗ f_ir),
```

the left sum over `n = r + s + t` with `u = r + 1 + t`, the right over `n = i_1 + ⋯ + i_r` with
`σ = Σ_j (r − j)(i_j − 1)` (Keller, Introduction, Section 3.4), and the corresponding formula for
the components of a composite. Over a field, prove that homotopy is an equivalence relation on
`A∞` morphisms `A → B`, compatible with composition on both sides (Prouté; Keller, Introduction,
Section 3.7, Theorem (a)).
*Needs:* §2.1; Tau Ceti as above.

**Checks.**
- In arity two the component equation reads
  `f₁(m₂(a, b)) − f₂(m₁a, b) − (−1)^{|a|} f₂(a, m₁b) = m₁ f₂(a, b) + m₂(f₁a, f₁b)` on elements;
  for `f` strict it says that `f₁` is multiplicative.

### 2.3 `A∞` categories and functors

An `A∞` category over `k` is Tau Ceti's `TauCeti.AInfinityCategory` on a graded linear quiver
`TauCeti.GradedLinearQuiver`, an `A∞` structure on the total Hom module compatible with paths. `A∞`
functors are `TauCeti.AInfinityFunctor`, with components on composable strings, identities and
composition; strict functors are `TauCeti.AInfinityStrictFunctor`. Strict units are
`TauCeti.AInfinityCategory.StrictUnit` and `TauCeti.AInfinityCategory.StrictlyUnital`;
cohomological units are `TauCeti.AInfinityCategory.CohomologicalUnits` and
`TauCeti.AInfinityCategory.CohomologicallyUnital`, and a cohomologically unital category has its
homotopy category `TauCeti.AInfinityHomotopyCategory`. Unital functors
(`TauCeti.AInfinityFunctor.IsUnital`) act on `H⁰`; quasi-fully faithful functors and
quasi-equivalences are `TauCeti.AInfinityFunctor.IsQuasiFullyFaithful` and
`TauCeti.AInfinityFunctor.IsQuasiEquivalence`, the latter inducing an equivalence on `H⁰`
(`TauCeti.AInfinityFunctor.IsQuasiEquivalence.isEquivalence_mapHomotopyCategory`). Full
subcategories are `TauCeti.AInfinityCategory.fullSubcategory`, the opposite is
`TauCeti.AInfinityCategory.op`, and an `A∞` algebra is a one-object category by
`TauCeti.AInfinitySingleObj`. A DG category is an `A∞` category with `m_n = 0` for `n ≥ 3`
(`TauCeti.DGCategory.toAInfinityCategory`); conversely an `A∞` category with `m₃ = m₄ = ⋯ = 0`
and degree-zero two-sided identities for `m₂` is a DG category
(`TauCeti.AInfinityCategory.AsDGCategory`), and the two conversions are mutually inverse up to
isomorphism on DG functors and on strict `A∞` functors. The identities are part of the
statement: an `A∞` category with vanishing higher operations and no identities is only a
nonunital DG category.

Define `A∞` transformations between `A∞` functors `F, G : B → C` (families of components on
composable strings of `B`, including a component of arity zero at each object), their
differential and composition, and the `A∞` category of `A∞` functors from `B` to `C` (Lyubashenko,
Category of A∞-categories), with its `H⁰` when `C` is cohomologically unital; Tau Ceti's complex
of reduced transformations between morphisms of algebras,
`TauCeti.AInfinityHom.reducedTransformationComplex`, is the part of positive arity. Define the
strictly unital functors between strictly unital categories, the inclusion of a full
subcategory as a strict `A∞` functor, and the bijection between `A∞` morphisms of algebras and
`A∞` functors between their one-object categories. Prove that the conversion from DG categories to
`A∞` categories is a functor from DG functors to strict `A∞` functors.
*Needs:* §§2.1–2.2; Tau Ceti as above.

### 2.4 `A∞` modules and bimodules

A right `A∞` module over an `A∞` algebra is Tau Ceti's `TauCeti.AInfinityRightModule`, a
square-zero coderivation over the coaugmented bar differential on `M ⊗ Tᶜ(sA)`, with
unsuspended operations `m_n` of degree `2 − n` and Stasheff relations
`TauCeti.AInfinityRightModule.stasheff`. Morphisms are `TauCeti.AInfinityRightModuleHom`, with
their component equation, homotopies forming an equivalence relation
(`TauCeti.AInfinityRightModuleHom.Homotopy`) and quasi-isomorphisms
`TauCeti.AInfinityRightModuleHom.IsQuasiIso`; right modules form the DG category
`TauCeti.AInfinityRightModuleCat` (`TauCeti.AInfinityRightModuleCat.instDGCategory`, in one
universe), with restriction along `A∞` morphisms
`TauCeti.AInfinityRightModuleCat.restrictScalarsDGFunctor`. The free module of rank one is
`TauCeti.AInfinityAlgebra.toRightModule`, and the Yoneda homotopy equivalence between its Hom
complex into `M` and `M` itself, for a strict unit acting as a right unit on `M`, is
`TauCeti.AInfinityRightModule.yonedaHomotopyEquiv`. An `(A, B)`-bimodule is
`TauCeti.AInfinityBimodule`, with suspended components `b i j` and unsuspended operations of
degree `1 − i − j`; its morphisms are `TauCeti.AInfinityBimoduleHom`, and the diagonal bimodule
is `TauCeti.AInfinityAlgebra.toBimodule`.

For an `A∞` category `C`, define right `A∞` modules (a graded module `M(X)` for each object and
operations `M(X_n) ⊗ C(X_{n−1}, X_n) ⊗ ⋯ ⊗ C(X_0, X_1) → M(X_0)`), their morphisms, homotopies and
quasi-isomorphisms, their DG category, the representable modules `C(−, X)` and the Yoneda lemma,
recovering the algebra case for one-object categories. Define the `A∞` Yoneda functor from a
strictly unital `A∞` category into its right `A∞` modules, and prove that it is quasi-fully
faithful. For bimodules, prove the unsuspended Stasheff relations of the operations of degree
`1 − i − j`, and define homotopies and quasi-isomorphisms of bimodule morphisms. Construct the
composition of an `(A, B)`-bimodule `M` and a `(B, C)`-bimodule `N` by the bar tensor product
`M ⊗ Tᶜ(sB) ⊗ N` with its induced bicomodule coderivation; its differential is a finite sum on
each element, so no completion is needed. When `B` is a DG algebra, identify `(A, B)`-bimodules
whose right action is strict with right `A∞` modules over `Aᵒᵖ ⊗ B` (§2.1).
*Needs:* §§2.1–2.3; Tau Ceti as above.

**Checks.**
- For `A = k[x]` in degree zero, the bar tensor product of the diagonal bimodule with itself,
  `A ⊗ Tᶜ(sA) ⊗ A`, is the two-sided bar resolution and is quasi-isomorphic to `A`; the plain
  tensor product `A ⊗_k A = k[x, y]` is not.

### Examples

A DG algebra is an `A∞` algebra. For a unital DG algebra `A`, `m₁ = d`, `m₂` the product and
`m_n = 0` for `n ≥ 3` satisfy every Stasheff relation, the unit is strict, and DG algebra maps
are strictly unital strict morphisms (`TauCeti.IsNonUnitalDGAlgebra.toAInfinityAlgebra`,
`TauCeti.IsDGAlgebra.strictUnit_one`, `TauCeti.DGAlgHom.toAInfinityStrictUnitalHom`). With the
enveloping DG algebra of Layer 4 and the derived comparison of Layer 5 below, this is what makes
"`A∞` structures lose nothing" a theorem: a DG algebra is exactly an `A∞` algebra with vanishing
higher operations, and an `A∞` algebra has a DG model with the same derived module category.

### Dependencies

Layers 0 and 1; Tau Ceti as named in the sections.

## Layer 3: minimal models and homological transfer

Kadeishvili's 1982 paper supplies the minimal-model theorem, and Keller, Introduction, Sections
3.3 and 4.3, the precise existence and uniqueness statement; Gugenheim–Lambe–Stasheff,
*Perturbation theory in differential homological algebra II*, supplies the filtered perturbation
theorem; Merkulov's explicit construction and Keller's 2006 survey, Theorem 2.3, supply the
transfer formulas.

### 3.1 Minimality and formality

An `A∞` algebra is minimal when `m₁ = 0` (`TauCeti.AInfinityAlgebra.IsMinimal`); between minimal
algebras a quasi-isomorphism is an isomorphism (`TauCeti.AInfinityHom.IsQuasiIso.isIso`). An `A∞`
algebra is formal when it has an `A∞` quasi-isomorphism to its cohomology algebra with only `m₂`
(`TauCeti.AInfinityAlgebra.IsFormal`, with the cohomology algebra
`TauCeti.AInfinityAlgebra.cohomologyAInfinityAlgebra`); a graded algebra `H` is intrinsically
formal when every `A∞` algebra whose cohomology algebra is isomorphic to `H` is formal
(`TauCeti.AInfinityAlgebra.IsIntrinsicallyFormal`, quantifying over algebras in the universe of
`H`). The three predicates are distinct.

Over a field, prove that formality does not depend on the direction of the quasi-isomorphism: `A`
is formal exactly when there is an `A∞` quasi-isomorphism from its cohomology algebra to `A`.
*Needs:* Tau Ceti `TauCeti.AInfinityAlgebra.IsFormal`, `TauCeti.AInfinityAlgebra.minimalModel`,
`TauCeti.AInfinityAlgebra.isIso_minimalModelProjection_comp`.

**Checks.**
- A graded algebra with zero differential is minimal and formal. The DG algebra `k[ε]/(ε²)` with
  `|ε| = −1` and `dε = 1` is formal, its cohomology being zero, but not minimal, since
  `m₁(ε) = 1 ≠ 0`; a definition of formality that asked for `m₁ = 0` would reject it.

### 3.2 Contractions and the perturbation lemma

A contraction of `(A, d)` onto `(H, d_H)` consists of chain maps `i : H → A`, `p : A → H` of degree
zero and a map `h : A → A` of degree `−1` with `p i = 1` and `1 − i p = d h + h d`; it is special
when moreover `h i = 0`, `p h = 0` and `h² = 0`. These are Tau Ceti's `TauCeti.LinearContraction`
and `TauCeti.LinearSpecialContraction` (degrees are separate hypotheses), with the normalization
`TauCeti.LinearContraction.normalize` turning any contraction into a special one with the same
`i` and `p`, and the degreewise versions for cochain complexes `TauCeti.Contraction` and
`TauCeti.SpecialContraction`. Over a field, a graded vector space with a square-zero
differential has a special contraction onto its cohomology
(`TauCeti.InternalGrading.homologyContraction`). The basic perturbation lemma is
`TauCeti.LinearSpecialContraction.perturb`, for a perturbation `δ` with `1 + δh` invertible; in
the complete filtered regime (`δ` raising a complete separated filtration preserved by `h`), the
invertibility, the convergence of the geometric series and the filtration bounds of the
perturbed data are
`TauCeti.LinearSpecialContraction.isUnit_one_add_mul_homotopy_of_isCompleteFiltration`,
`TauCeti.LinearSpecialContraction.perturbationSeries_apply_sub_sum_mem` and
`TauCeti.LinearSpecialContraction.map_perturb_homotopy_le`. Nothing in this section is a target.

### 3.3 Transfer and its tree formulas

Homological transfer along a special contraction `(i, p, h)` of `(A, m₁)` onto `(H, d_H)` with
`i`, `p` of degree zero and `h` of degree `−1` is Tau Ceti's `TauCeti.AInfinityAlgebra.transfer`,
over any commutative ring: the tensor trick and the perturbation lemma on the bar construction.
It comes with the extending `A∞` quasi-isomorphisms `TauCeti.AInfinityAlgebra.transferInclusion`
(linear part `i`) and `TauCeti.AInfinityAlgebra.transferProjection` (linear part `p`), a homotopy
from the identity of `A` to their composite (`TauCeti.AInfinityAlgebra.transferHomotopy`),
naturality under strict morphisms compatible with the contractions
(`TauCeti.AInfinityAlgebra.transferStrictHom`), and the low-arity formulas: `m₁^H = d_H`,
`m₂^H = p m₂ (i ⊗ i)` (`TauCeti.AInfinityAlgebra.mul_transfer`),
`m₃^H(x, y, z) = p m₃(ix, iy, iz) + p m₂(h m₂(ix, iy), iz) − (−1)^{|x|} p m₂(ix, h m₂(iy, iz))`
(`TauCeti.AInfinityAlgebra.m_three_transfer`) and `f₂ = −h m₂(i ⊗ i)`.

Prove that in every arity the transferred operation `m_n^H` is the sum over planar rooted trees
with `n` leaves and internal vertices of arity at least two: leaves labelled `i`, a vertex of
arity `k` labelled `m_k`, internal edges labelled `h` and the root labelled `p`, each tree with
the Koszul sign of its composite. The unary operation `m₁` belongs to the contraction and is not
a vertex label, which makes the sum finite in each arity. Prove the same for the components of
`TauCeti.AInfinityAlgebra.transferInclusion`, with the root labelled `h` (Merkulov; Keller,
*A-infinity algebras, modules and functor categories*, Theorem 2.3 and its construction).
*Needs:* §3.2; Tau Ceti `TauCeti.AInfinityAlgebra.transfer`,
`TauCeti.AInfinityAlgebra.transferInclusion`.

**Checks.**
- The trees with three leaves are the three vertices `m₃`, `m₂ ∘ (h m₂ ⊗ 1)` and
  `m₂ ∘ (1 ⊗ h m₂)`; with the Koszul sign of `1 ⊗ h m₂`, the tree sum is the formula of
  `TauCeti.AInfinityAlgebra.m_three_transfer` above. Allowing `m₁` as a vertex would give
  infinitely many trees with three leaves.
- For a DG algebra with `h = 0` (the identity contraction of `A` onto itself), the tree sum is
  `m₂` in arity two and zero above.

### 3.4 Kadeishvili's theorem

Over a field, the cohomology of an `A∞` algebra `A` carries the minimal `A∞` structure
`TauCeti.AInfinityAlgebra.minimalModel`, whose product is the one induced by `m₂`
(`TauCeti.AInfinityAlgebra.minimalModel_m_two`), with the `A∞` quasi-isomorphisms
`TauCeti.AInfinityAlgebra.minimalModelInclusion` to `A`, inducing the identity on cohomology,
and `TauCeti.AInfinityAlgebra.minimalModelProjection` from `A`; any minimal `A∞` algebra
quasi-isomorphic to `A` is `A∞` isomorphic to it
(`TauCeti.AInfinityAlgebra.isIso_minimalModelProjection_comp`,
`TauCeti.AInfinityAlgebra.isIso_comp_minimalModelInclusion`), by a non-unique isomorphism
(Kadeishvili; Keller, Introduction, Section 3.3, Theorem). For an `A∞` category over a field,
the minimal structure on the cohomology quiver is `TauCeti.AInfinityCategory.minimalModel`, and
transfer along a contraction compatible with the objects gives quasi-fully faithful functors in
both directions (`TauCeti.AInfinityCategory.transferInclusion`,
`TauCeti.AInfinityCategory.isQuasiEquivalence_transferInclusion` for a cohomologically unital
category). For a right `A∞` module over a field, the minimal structure on its cohomology, over
the same algebra, is `TauCeti.AInfinityRightModule.minimalModel`, with quasi-isomorphisms
`TauCeti.AInfinityRightModule.minimalModelInclusion` and
`TauCeti.AInfinityRightModule.minimalModelProjection`.

For a cohomologically unital `A∞` category `C` over a field, prove that the minimal model is
quasi-equivalent to `C` by an `A∞` functor that is the identity on objects and induces the
identity on cohomology, and that any two minimal `A∞` categories quasi-equivalent to `C` by
functors bijective on objects are `A∞` isomorphic. Define minimality of a right `A∞` module and
prove that two minimal modules quasi-isomorphic to the same module are isomorphic. For
`(A, B)`-bimodules over a field, construct transfer along a contraction of the underlying complex
and the minimal model on cohomology, with quasi-isomorphisms in both directions; when `A` and `B`
are given over a separable semisimple base, the contraction is required to be bilinear over it.
The module consequences of Kadeishvili's theorem, the equivalence of derived categories of
modules over `A` and over its minimal model, are §6.2.
*Needs:* §§2.3–2.4, 3.3; Tau Ceti `TauCeti.AInfinityCategory.transfer`,
`TauCeti.AInfinityRightModule.transfer`, `TauCeti.AInfinityBimodule`.

### 3.5 Homotopy inverses and unit strictification

Over a field, prove that an `A∞` quasi-isomorphism has an inverse up to homotopy,
`TauCetiRoadmap.DGAInfinity.exists_homotopy_inverse_of_isQuasiIso` (Prouté; Keller,
Introduction, Section 3.7, Theorem (b)); conversely, over any commutative ring, a morphism with an
inverse up to homotopy is a quasi-isomorphism, because homotopic morphisms induce the same map on
cohomology (`TauCeti.AInfinityHom.Homotopy.cohomologyMap_eq`). Over an arbitrary commutative
ring, prove that a morphism `f : A → B` whose linear part `f₁` is a chain-homotopy equivalence of
`(A, m₁)` and `(B, m₁)` has a morphism `g : B → A` with `g ∘ f` homotopic to the identity of `A`
and `f ∘ g` homotopic to the identity of `B`; a bare quasi-isomorphism is not enough there. Over
a field,
prove that every cohomologically unital `A∞` algebra is `A∞` quasi-isomorphic to one with a
strict unit, `TauCetiRoadmap.DGAInfinity.exists_strictUnit_isQuasiIso_of_cohomologicallyUnital`,
and that a minimal one is `A∞` isomorphic to one with a strict unit,
`TauCetiRoadmap.DGAInfinity.exists_strictUnit_isIso_of_isMinimal` (Keller, *A-infinity
algebras, modules and functor categories*, Proposition 2.4). For `A∞` categories, prove
Lyubashenko's replacement theorem, with the ground-ring and splitting hypotheses of *Category of
A∞-categories*: a unital `A∞` category in Lyubashenko's sense is quasi-equivalent to a strictly
unital one. Over a field, Lyubashenko's unitality agrees with
`TauCeti.AInfinityCategory.CohomologicallyUnital`, because a chain endomorphism of a complex of
vector spaces inducing the identity on cohomology is homotopic to the identity. Each statement
keeps the quasi-isomorphic replacement distinct from the stronger isomorphism available for
minimal objects, and a strict-unit comparison for modules is not deduced from the algebra
statement.
*Needs:* §§2.2–2.3, 3.4; Tau Ceti `TauCeti.AInfinityHom.Homotopy`,
`TauCeti.AInfinityHom.Homotopy.cohomologyMap_eq`, `TauCeti.AInfinityHom.IsQuasiIso.isIso`,
`TauCeti.AInfinityAlgebra.minimalModel`, `TauCeti.AInfinityAlgebra.CohomologicallyUnital`,
`TauCeti.AInfinityAlgebra.StrictUnit`.

**Checks.**
-  The DG algebra `A = k[ε]/(ε²)` with `|ε| = −1` and `dε = 1` is acyclic, so the zero morphism
  `A → 0` is a quasi-isomorphism; its homotopy inverse is `0 → A`, and the composite on `A` is
  homotopic to the identity, through a homotopy whose linear part is `±h₁` with `h₁(1) = ε`,
  `h₁(ε) = 0`, which satisfies `d h₁ + h₁ d = 1`. A quasi-isomorphism predicate asking `f₁` to be
  injective would reject `f`.
- A minimal `A∞` algebra concentrated in degree zero has `m_n = 0` for `n ≠ 2`, since `m_n` has
  degree `2 − n`; so a cohomological unit of it is already a strict unit, and the minimal case of
  strictification is the identity there.

### Examples

A finite transfer with a nonzero `m₃`. Let `k` be a commutative ring and

```text
A = Λ_k(a,b,c),       |a|=|b|=|c|=1,
d(a)=d(b)=0,          d(c)=ab.
```

This algebra is free of rank eight over `k`. Use the cohomology representatives
`1, a, b, ac, bc, abc`; let `p` kill `c` and `ab`, let `i` include the representatives, and let
the homotopy of degree `−1` satisfy `h(ab) = c` and vanish on the other basis monomials. Then
`1 − i p = d h + h d` and the side conditions hold, `m₂^H = p μ(i ⊗ i)`, `f₂ = −h μ(i ⊗ i)`, and

```text
m₃^H([a],[a],[b]) = [ac] ≠ 0
```

for `k ≠ 0`: of the three trees only `−(−1)^{|a|} p(a · h(ab)) = p(ac)` survives, and the sign
comes from `i ⊗ f₂` passing `a`. In characteristic other than two this sign is a genuine test:
omitting the Koszul sign gives `−[ac]`. These are Tau Ceti's `TauCeti.HeisenbergDGA.contraction`,
`TauCeti.HeisenbergDGA.minimalModel_m_three` and
`TauCeti.HeisenbergDGA.minimalModel_m_three_ne_zero`. Prove moreover that `m_n^H = 0` for
`n ≥ 4` for this contraction: by the tree formula of §3.3, `h` is nonzero only on `ab`, its
values are multiples of `c`, and no product with a factor `c` has an `ab`-component, so every
tree with two internal edges in a row, or with two internal edges at one vertex, vanishes. The
transferred structure is therefore `(H*A, m₂, m₃)`, and Layer 8 relates `m₃^H` to the Massey
product and proves that `A` is not formal. The example rejects a transfer interface that can
state only existence, or one that makes every cohomology algebra formal.

Keller's example (Introduction, Section 3.3). Let `B` be the path algebra over a field of the
quiver `1 → 2 → 3 → 4` with arrows `α, β, γ` and the relation `γβα = 0`, and `A` the DG algebra of
endomorphisms of an injective resolution of the sum of the simple modules, so that `H*A` is the
Ext algebra: arrows `a, b, c` of degree one with `ab = 0 = bc`, and an arrow `e` of degree two.
For the minimal model taken over the semisimple base `k⁴` of vertex idempotents (equivalently,
the four-object `A∞` category on the simples) with strict units, the only nonzero higher product
is `m₃(a, b, c) = e`, up to the normalization of the arrows, and `m_n = 0` for `n ≠ 2, 3`. The
transfer interface reproduces this published computation, not only the exterior-algebra
contraction above.

### Dependencies

Layers 0–2; Tau Ceti as named in the sections.

## Layer 4: bar and cobar, DG strictification, and Maurer–Cartan twisting

Keller's 2006 survey, Sections 4.3–4.8, supplies the bar and cobar constructions, the enveloping
DG algebra and the comparison of derived module categories; Keller, Introduction, Sections 7.6
and 8, supplies finite upper-triangular twisting; Getzler, *Lie theory for nilpotent
L-infinity algebras*, supplies the nilpotent Maurer–Cartan and gauge framework; Loday–Vallette,
*Algebraic Operads*, Chapters 9–10, supplies twisting morphisms and bar–cobar adjunctions.

### 4.1 Bar and cobar constructions

For an augmented `A∞` algebra, Tau Ceti supplies the augmentation ideal with its `A∞` structure
(`TauCeti.AInfinityAlgebra.Augmentation.reducedAlgebra`), the coaugmented bar differential
`TauCeti.AInfinityAlgebra.coaugmentedBarDifferential` (square zero, a coderivation of degree
one, zero on the empty word), the coaugmentation `TauCeti.TensorWords.coaugmentation`, the length
filtration `TauCeti.ReducedTensorWords.filtration`, the completed bar differential in bounded
arity `TauCeti.AInfinityAlgebra.completedBarDifferential`, and the correspondence between
coalgebra maps into the reduced tensor coalgebra and their Taylor maps
`TauCeti.ReducedTensorWords.coalgHomEquivTaylor`.

Define coaugmented conilpotent DG coalgebras, and package the bar construction of an augmented
`A∞` algebra `A` as one: `B∞A = Tᶜ(sĀ)` on the augmentation ideal `Ā`, with its coaugmentation,
its conilpotence filtration and its square-zero coderivation. For a coaugmented conilpotent DG
coalgebra `C`, construct the cobar construction `ΩC = T(s⁻¹C̄)`, a DG algebra with differential
induced by the differential and the reduced coproduct of `C`. Define twisting cochains
`τ : C → A` from a coaugmented DG coalgebra to an augmented DG algebra, degree-one maps
satisfying `dτ + τ ⋆ τ = 0` for the convolution product, and prove the bar–cobar adjunction
through its universal properties:

```text
Hom_DGAlg(ΩC, A) ≅ Tw(C, A) ≅ Hom_DGCoalg(C, BA),
```

natural in `C` and `A`, as bijections of sets of maps, not only on generators.
*Needs:* Layer 1; §§0.2, 2.1; Tau Ceti as above.

**Checks.**
- For `C = k ⊕ k·x` with `x` primitive and zero differential, `ΩC` is the tensor algebra on
  `y = s⁻¹x`, of degree `|x| + 1`, with zero differential. For `|x| = 0`, `y` has degree one and
  `y² ≠ 0`: `ΩC` is a tensor algebra, not a graded commutative one.
- For the same `C` with `|x| = 0` and an augmented DG algebra `A`, a twisting cochain `C → A` is
  a closed element `τ(x)` of degree one of the augmentation ideal (the convolution square vanishes
  because `x` is primitive), and so is a DG algebra map `ΩC → A`, determined by the image of
  `y`; the bijection of the adjunction is `τ ↦ (y ↦ τ(x))`.

### 4.2 The enveloping DG algebra

Over a field, or over a separable semisimple base with split augmentation and the K-flatness
required by the comparison of length filtrations, construct `U(A) = ΩB∞A` for a strictly unital
augmented `A∞` algebra `A`, and the canonical `A∞` quasi-isomorphism `A → U(A)`, universal among
strictly unital augmented `A∞` morphisms from `A` to augmented DG algebras (Keller, 2006,
Sections 4.3–4.8; Keller, Introduction, Section 3.3). Extend the construction to small `A∞`
categories and to `A∞` modules under the corresponding Hom-wise flatness hypotheses. This is the
promised DG model, not evidence against the usefulness of minimal `A∞` models: `U(A)` is large,
while transfer keeps a small underlying complex.
*Needs:* §4.1; §§2.2–2.4.

**Checks.**
- For `A = k` (augmented by the identity), `Ā = 0`, `B∞A = k` and `U(A) = k`. For
  `A = k ⊕ k·x` with `x² = 0` and `|x| = 0`, `BA` is the tensor coalgebra on `sx` with zero
  differential, and `U(A) = ΩBA` is quasi-isomorphic to `A` but infinite-dimensional over `k`.

### 4.3 Bar–cobar unit and counit

State and prove that the counit `ΩBA → A` is a quasi-isomorphism for an augmented DG algebra
over a field, and that the unit `C → BΩC` is a quasi-isomorphism for a coaugmented conilpotent
DG coalgebra over a field, with the connectedness, filtration and cofibrancy hypotheses used in
the proof over a more general base. These statements are made only in the coaugmented
conilpotent setting; no unrestricted equivalence is asserted for arbitrary DG coalgebras.
*Needs:* §§4.1–4.2.

### 4.4 Maurer–Cartan elements and twisting

A Maurer–Cartan element of an `A∞` algebra is an element `α` of degree one satisfying `(MC)` of
Convention 10. In the arity-nilpotent regime, where `m_n(α, …, α) = 0` for all large `n`, this is
Tau Ceti's `TauCeti.AInfinityAlgebra.IsMaurerCartan`, with the signed sum
`TauCeti.AInfinityAlgebra.maurerCartanSum` and the sign-free suspended form
`TauCeti.AInfinityAlgebra.isMaurerCartan_iff_taylor`; in the DG case it reads `dα = α²`
(`TauCeti.IsNonUnitalDGAlgebra.isMaurerCartan_toAInfinityAlgebra_iff`), and the negation bridge
to `dδ + δ² = 0` is `TauCeti.IsNonUnitalDGAlgebra.isMaurerCartan_toAInfinityAlgebra_neg_iff`.

Add the two other accepted regimes. In the strictly upper-triangular regime, `α` is a matrix of
morphisms of degree one in the shift closure of an `A∞` category with strict identities, with
entries zero on and below the diagonal, so that every sum is finite: this is Keller's twisted
object (Introduction, Section 7.6), whose equation (7.1) is `(MC)`. In the complete regime, the
`A∞` algebra carries a complete separated descending filtration `F⁰A = A ⊇ F¹A ⊇ ⋯` with
`A ≅ lim A/FᵖA`, `⋂ FᵖA = 0`, `α ∈ F¹A` and
`m_n(F^{p₁}, …, F^{p_n}) ⊆ F^{p₁+⋯+p_n}`, so that the arity-`n` term tends to zero. There is no
unrestricted infinite sum on a bare graded module. In each regime, construct the twisted
operations `m_n^α(x_1, …, x_n) = Σ ± m_{n+t}(α, …, α, x_1, α, …, α, x_n, α, …, α)`, summed over
all insertions of `t ≥ 0` copies of `α`, prove that the sums are finite or convergent, that the
`m_n^α` satisfy the Stasheff identities, and that the twisted differential squares to zero; in
the DG case prove that `δ = −α` turns `(MC)` into `dδ + δ² = 0`. Over an arbitrary commutative
ring, formulate equivalence of twists through filtered coalgebra automorphisms and braces, with
no division by factorials; Tau Ceti's gauge action on `A∞` structures,
`TauCeti.AInfinityAlgebra.gauge`, is the model. The complete case is obtained by the
inverse-limit argument from the nilpotent quotients, not by applying a finite theorem without
completeness. The comparison of gauge-equivalent twists over a `ℚ`-algebra, in the sense of
Deligne and Getzler, is made in §8.2, where the Hochschild DG Lie algebra is built.
*Needs:* §§2.1–2.3; Tau Ceti `TauCeti.AInfinityAlgebra.IsMaurerCartan`,
`TauCeti.AInfinityAlgebra.gauge`, `TauCeti.CompletedTensorWords`.

**Checks.**
- In the free graded algebra `k⟨x⟩` with `|x| = 1` and `dx = x²` (a DG algebra: `d(x²) = x³ − x³
  = 0`), `α = x` satisfies `(MC)`, `dα − α² = 0`, and `δ = −x` satisfies `dδ + δ² = 0`, while
  `x` itself does not satisfy `dδ + δ² = 0` when `2 ≠ 0`, since `dx + x² = 2x²`. Using one sign
  for both conventions fails here.
- In `Λ(x, z)` with `|x| = |z| = 1` and zero differential, `α = x` is Maurer–Cartan, and the
  twisted differential is `y ↦ dy − (αy − (−1)^{|y|} yα)`, which vanishes because the algebra is
  graded commutative. With the ungraded commutator it would send `z` to `−2xz ≠ 0` when `2 ≠ 0`.

### Examples

Back to a DG model. For a strictly unital augmented DG algebra `A`, viewed as an `A∞` algebra, the
comparison `A → U(A)` of §4.2 agrees, up to the natural quasi-isomorphism `ΩBA → A` of §4.3, with
the identity of `A`. For the augmented `A∞` algebra `A = k ⊕ k·x ⊕ k·y` with `|x| = 1`, `|y| = 2`,
a strict unit, `m₃(x, x, x) = y` and every other operation on the augmentation ideal zero (the
Stasheff relations hold because every composite of two operations on the augmentation ideal
vanishes), construct `U(A)` and show explicitly that it is infinite-dimensional while `A` is
three-dimensional; the bar differential sends `(sx)^{⊗3}` to `±sy`, with the Koszul sign of
`s^{⊗3}`.

### Dependencies

Layers 0–3; Tau Ceti as named in the sections.

## Layer 5: derived modules, twisted complexes, and perfect envelopes

Bondal–Kapranov, *Enhanced triangulated categories*, supplies twisted complexes and the
pretriangulated envelope; Drinfeld, Section 2.4, supplies the one-sided formulas and the cone;
Keller, *Deriving DG categories*, Sections 4–5, proves that representables compactly generate
and that the compact objects are the perfect modules; Balmer–Schlichting supplies triangulated
idempotent completion.

### 5.1 Derived categories of DG and `A∞` modules

For a DG algebra `A`, Tau Ceti's quasi-isomorphisms of right DG modules
`TauCeti.DGRightModuleCat.quasiIsos` are the class to invert, and the homotopy category of right
DG modules is triangulated (through `TauCeti.CurvedDGRightModuleCat.homotopyIsTriangulated` at
curvature zero).

Define the derived category `D(A)` of a DG algebra and `D(C)` of a small DG category as Mathlib
localizations at quasi-isomorphisms, with their triangulated structures, and identify each with
the homotopy category of semi-free (homotopically projective) modules. For an `A∞` algebra or
category with a strict unit, define strictly unital `A∞` modules and the derived category
`D_∞(A)` as the localization of strictly unital `A∞` modules at quasi-isomorphisms; prove that
over a field every quasi-isomorphism of `A∞` modules is a homotopy equivalence, so that `D_∞(A)`
is the homotopy category of `A∞` modules (Keller, Introduction, Section 4.2), and identify
`D_∞(A)` with `D(U(A))` through the enveloping algebra of §4.2, for `A` strictly unital and
augmented under the hypotheses of §4.2. Construct restriction along DG functors and `A∞`
functors, derived extension, the derived tensor product of bimodules (through semi-free
resolutions) and derived Hom, with their units, counits and projection formulas, and connect each
construction to Mathlib's localization and derived-category API.
*Needs:* Layers 1–2; §§4.1–4.2; Mathlib `MorphismProperty.Localization`,
`CategoryTheory.Functor.IsLocalization`, `CategoryTheory.Pretriangulated`; Tau Ceti
`TauCeti.DGRightModuleCat.quasiIsos`, `TauCeti.AInfinityRightModuleHom.IsQuasiIso`.

- Restriction along a DG algebra map is exact and preserves quasi-isomorphisms, so it descends to
  derived categories without resolution.
- Derived extension along a quasi-isomorphism of DG algebras is an equivalence of derived
  categories.

**Checks.**
- For an ordinary ring `R` in degree zero, `D(R)` is equivalent to Mathlib's
  `DerivedCategory (ModuleCat R)` (for right modules, of `Rᵐᵒᵖ`), and the derived tensor product
  computes `Tor`: for `R = ℤ`, `ℤ/2 ⊗^L ℤ/2` has cohomology `ℤ/2` in degrees `−1` and `0`, which
  the underived tensor product misses.

### 5.2 Shifts, sums, and twisted complexes

The finite shift closure of a DG category is `TauCeti.DGShiftClosure`, with
`Hom(X[r], Y[s]) = Hom(X, Y)⟦s − r⟧` stored on normalized representatives; the finite additive
closure is `TauCeti.DGAdditiveClosure`, with matrices indexed by source and target and no Koszul
sign in their composition. A twisted object is `TauCeti.DGTwistedObject`: an object of the
additive closure of the shift closure with a twisting matrix `δ` of degree one satisfying
`dδ + δ ∘ δ = 0` in Keller's order, the `δ = −α` side of Convention 10
(`TauCeti.DGTwistedObject.dgDifferential_twist_add_negOnePow_smul_dgComp_eq_zero`). It is
one-sided when some level function on the summands strictly decreases along every nonzero entry
(`TauCeti.DGTwistedObject.IsOneSided`), the invariant form of a strictly upper-triangular matrix,
which makes every sum finite. Morphism complexes carry the twisted differential
`D f = d f + δ_Y ∘ f − (−1)^{|f|} f ∘ δ_X` in Keller's order
(`TauCeti.DGTwistedObject.dgHomEquiv_dgDifferential`), squaring to zero; shifts
(`TauCeti.DGTwistedObject.shiftFunctor`) and cones (`TauCeti.DGTwistedObject.cone`) are
constructed.

Define twisted objects of an `A∞` category with strict identities, in Keller's form (Introduction,
Section 7.6): the shift closure `ZA` with compositions obtained by shifting those of `A`, whose
higher shifted-composition signs are derived from the suspension and the braiding of Layer 0;
twisted objects as one-sided matrices satisfying (7.1); and the `A∞` category `tw A` with the
twisted compositions. Prove that for a DG category the construction agrees with
`TauCeti.DGTwistedObject` after the negation `δ = −α`.
*Needs:* §§2.3, 4.4; Tau Ceti as above.

### 5.3 Shift signs

With `X[r]^p = X^{p+r}` and `d_{X[r]} = (−1)^r d_X`, the identification
`Hom(X[r], Y[s]) ≅ Hom(X, Y)[s − r]` in shifted degree `p` multiplies the underlying map by
`(−1)^{rp}` (`TauCeti.DGShiftClosure.shiftCochainEquiv_v`). On raw shifted maps the differential
corresponds to `(−1)^s d_Hom`; on the normalized representative in `Hom(X, Y)[s − r]` it is
`(−1)^{s−r} d_Hom` (`TauCeti.DGShiftClosure.dgHomEquiv_dgDifferential`). On normalized
representatives, the composite `g ∘ f` in Keller's order of `f : X[r] → Y[s]` of degree `p` and
`g : Y[s] → Z[t]` of degree `q` acquires `(−1)^{(s−r)q}`
(`TauCeti.DGShiftClosure.dgHomEquiv_negOnePow_smul_dgComp`); in Mathlib's order the sign is
`(−1)^{(t−s)(p+s−r)}` (`TauCeti.DGShiftClosure.dgHomEquiv_dgComp`); raw shifted maps compose with
no sign. These signs are fixed, not an implementation choice; the `A∞` versions are the target of
§5.2.

**Checks.**
- A map `f : X → Y` of degree zero, viewed as a map `X[1] → Y[1]` (`r = s = 1`, `p = 0`), has the
  same raw and normalized representative, since `(−1)^{rp} = 1`. Its raw differential is
  `(−1)^s d_Hom(f) = −d_Hom(f)` and its normalized one is `(−1)^{s−r} d_Hom(f) = d_Hom(f)`, and
  these agree because the identification in degree one multiplies by `(−1)^{r·1} = −1`; dropping
  the factor `(−1)^{rp}` in either degree breaks the comparison.
- For `r = 0`, `s = 1` and a nonclosed entry `a` of degree `p` from `X` to `Y`, the transported
  differential of the corresponding map `X → Y[1]` is `(−1)^{1} d a = −d a` on the normalized
  representative, which a convention ignoring the shift of the target would get wrong.

### 5.4 The pretriangulated envelope

The homotopy category of twisted objects is pretriangulated and triangulated
(`TauCeti.DGTwistedObject.pretriangulated`, `TauCeti.DGTwistedObject.isTriangulated`), with the
distinguished triangles those isomorphic to cone triangles: a closed degree-zero `f : X → Y`
gives the triangle `X → Y → Cone(f) → X[1]` in Mathlib's vocabulary
(`TauCeti.DGTwistedObject.coneTriangle`,
`TauCeti.DGTwistedObject.coneTriangle_mem_distinguishedTriangles`). The one-sided twisted
complexes form a triangulated subcategory `TauCeti.DGTwistedObject.oneSided`
(`TauCeti.DGTwistedObject.isTriangulated_oneSided`), whose closure under isomorphism is the least
triangulated subcategory containing `C` (`TauCeti.DGTwistedObject.isLeast_isoClosure_oneSided`);
DG functors induce triangulated functors (`CategoryTheory.EnrichedFunctor.mapDGTwistedComplex`).

Define the pretriangulated envelope `pretr(C)` as a DG category, the full DG subcategory of
one-sided twisted objects (`TauCeti.DGFullSubcategory`), and identify its `H⁰` with the
triangulated subcategory `TauCeti.DGTwistedObject.oneSided`. Extend the DG Yoneda embedding to a
DG functor from `pretr(C)` into right `C`-modules, prove that it is quasi-fully faithful, and
identify its image with the finite semi-free modules.
*Needs:* §§1.3, 5.1–5.2; Tau Ceti as above.

### 5.5 Triangulated closure, perfect modules and compact objects

Define `tria(C)` as the triangulated subcategory of `D(C)` generated by the representables, and
`Perf(C)` as the thick subcategory they generate, equivalently the idempotent completion of
`tria(C)`. Define compact objects of a triangulated category with coproducts (those `X` for which
`Hom(X, −)` commutes with coproducts) and prove that `Perf(C)` is exactly the compact objects of
`D(C)`, and that the retracts of finite semi-free modules, the thick closure of the
representables and the compact objects coincide (Keller, *Deriving DG categories*, Sections 4–5).
Construct the DG and `A∞` Karoubi envelopes and identify their `H⁰` with `Perf(C)`, triangulated
as a thick subcategory of `D(C)`.
*Needs:* §§5.1, 5.4; Mathlib `ObjectProperty.triangEnvelope`,
`CategoryTheory.Idempotents.Karoubi`.

**Checks.**
- For `C` the one-object DG category of a field `k`, `D(C)` is the derived category of
  `k`-vector spaces, the compact objects are the complexes with finite-dimensional total
  cohomology, and `Perf(C) = tria(C)`; the infinite direct sum `⨁_n k` is not compact.

### Examples

The two-object twisted-complex path. Take the DG category with objects `X`, `Y`, identity
endomorphisms, one closed degree-zero arrow `f : X → Y` and zero differential, constructed from
explicit Hom-complex data (`TauCeti.DGCategoryData.ofKeller`), not the one-object matrix algebra.
In the shift and additive closure form `Cone(f) = (Y ⊕ X[1], δ)`, where the only nonzero entry of
the one-sided degree-one matrix `δ` is `f`. Compute its `k`-linear Hom complexes and enriched
composition, the twisted Hom differentials, and the three closed maps and homotopies that give the
triangle `X → Y → Cone(f) → X[1]` in `H⁰`; verify that `Cone(id_X)` is contractible and that
`Cone(0)` is isomorphic to `Y ⊕ X[1]`. This is the smallest path through graded signs, twisting,
twisted objects, pretriangulation and Mathlib's triangles; the general statements are Tau Ceti's
`TauCeti.DGTwistedObject.coneTriangle_mem_distinguishedTriangles`,
`TauCeti.DGTwistedObject.isZero_of_cone_dgId` and `TauCeti.DGTwistedObject.cone_zero`.

For the finite augmented `A∞` algebra `A = k ⊕ k·x ⊕ k·y` of the Layer 4 examples, the derived
categories `D_∞(A)` and `D(U(A))` are equivalent by §5.1, although `U(A)` is infinite-dimensional:
the DG replacement is larger, and the derived module category is the same.

### Dependencies

Layers 1, 2 and 4; Mathlib localization, triangulated categories and idempotent completions;
Tau Ceti as named in the sections.

## Layer 6: quasi-equivalence, derived Morita theory, and compact generators

Keller, *Deriving DG categories*, the Theorems of Sections 8.1 and 8.2 with the
compact-generation results of Sections 4.2 and 5.3, supplies the generator form of derived Morita
theory; Toën, Sections 4, 6 and 7, supplies mapping objects as quasi-representable bimodules,
internal Homs and derived Morita theory for small DG categories.

### 6.1 Invariance under quasi-equivalence

A quasi-equivalence of DG categories induces an equivalence on `H⁰`
(`CategoryTheory.EnrichedFunctor.IsQuasiEquivalence.isEquivalence_mapDGHomotopyCategory`), and
an `A∞` quasi-equivalence one on the homotopy categories
(`TauCeti.AInfinityFunctor.IsQuasiEquivalence.isEquivalence_mapHomotopyCategory`); a DG functor
induces a triangulated functor on twisted complexes which preserves one-sided objects
(`CategoryTheory.EnrichedFunctor.mapDGTwistedComplex`,
`CategoryTheory.EnrichedFunctor.oneSided_mapDGHomotopyCategory_obj`).

Prove that a quasi-equivalence of small DG categories induces equivalences of derived module
categories, of `H⁰` of pretriangulated envelopes, of perfect categories and of their idempotent
completions. Prove the same for an `A∞` quasi-equivalence, directly and through the enveloping
DG categories `U(−)`, and record which comparisons are canonical only up to quasi-equivalence.
*Needs:* §§5.1, 5.4–5.5; Tau Ceti as above.

### 6.2 Modules over a DG algebra and over its cohomology

Let `A` be a unital DG algebra over a field, and `H = (H*A, m₂, m₃, …)` a strictly unital minimal
model with an `A∞` quasi-isomorphism `H → A` (§§3.4–3.5). Prove that restriction along it is an
equivalence, up to quasi-equivalence, of the DG categories of strictly unital `A∞` modules, and
hence a triangle equivalence `D(A) ≃ D_∞(H)` restricting to `Perf(A) ≃ Perf(H)`. Give the
category and module versions, with their splitting hypotheses. The transferred structure is
essential: the plain cohomology algebra `(H*A, m₂)` is `A∞` quasi-isomorphic to `A` exactly when
`A` is formal, and for `A = Λ(a, b, c)` with `dc = ab` it is not (Layer 8 examples), so no
equivalence induced by an `A∞` quasi-isomorphism from `(H*A, m₂)` exists there. This is the
general theorem that the transfer machinery exists to supply, and the transfer example of
Layer 3 instantiates it as `D(A) ≃ D_∞(H*A, m₂, m₃)`.
*Needs:* §§3.4–3.5, 5.1, 6.1.

### 6.3 Morita equivalences

Define a derived Morita equivalence as a DG or `A∞` functor, or a bimodule, inducing an
equivalence of derived module categories. Characterize the invertible Morita bimodules by the
existence of a derived tensor inverse and by their action on the representable compact
generators. Prove that a quasi-equivalence is a Morita equivalence; the converse is not a target.
*Needs:* §§5.1, 5.5, 6.1.

**Checks.**
- The one-object DG categories of `k` and of the matrix algebra `M₂(k)` (both in degree zero) are
  Morita equivalent through the bimodule `k²`, but not quasi-equivalent, since their `H⁰`
  endomorphism algebras `k` and `M₂(k)` are not isomorphic.

### 6.4 Compact generators

For a localizing subcategory of `D(C)` generated by a set of compact objects, form the DG category
of their endomorphisms and prove the derived Morita equivalence. If there is a single compact
generator `G`, identify `D(C)` with the derived category of the DG algebra `RHom(G, G)` and the
compact objects with `Perf(RHom(G, G))` (Keller, *Deriving DG categories*, Section 8.1, Theorem,
with Lemma 4.2(c) and Section 5.3, Theorem). State
generation as the vanishing of the objects right orthogonal to all shifts of the generators, not
as density on `K₀`.
*Needs:* §§5.1, 5.5, 6.3.

**Checks.**
- For `C` the one-object DG category of a field `k`, `G = k ⊕ k⟦1⟧` is a compact generator, and
  `RHom(G, G)` is its four-dimensional graded endomorphism algebra, with diagonal entries in degree
  zero and off-diagonal entries in degrees `1` and `−1`. It is not isomorphic to `k`, yet its
  derived category is again that of `k`; a generator criterion asking for `RHom(G, G) ≅ k` would
  reject `G`.

### 6.5 The Morita bicategory

Build the Morita bicategory whose objects are small DG categories, whose 1-morphisms are the
bimodules whose derived tensor product preserves perfect objects, and whose composition is the
derived tensor product, with the associativity and unit isomorphisms of the derived tensor
product. Prove that `Perf` is invariant under Morita equivalence: an equivalence of derived
categories preserves compact objects, and `Perf(C)` is the compact objects of `D(C)` (§5.5). The
invariance of Hochschild cohomology and homology, of smoothness and properness, and of the Euler
pairing is proved in §§8.1, 9.1 and 10.1, under the hypotheses of those layers.
*Needs:* §§5.1, 5.5, 6.3.

### Examples

For a finite acyclic quiver `Q` and the path algebra `kQ` over a field, the direct sum of the
indecomposable projectives is a compact generator of `D(kQ)`, and the derived Morita theorem of
§6.4 recovers `D(kQ)` from its endomorphism algebra, which is `kQ` again (for right modules).

### Dependencies

Layers 1–5; Tau Ceti as named in the sections.

## Layer 7: DG and `A∞` quotients, Verdier comparison, and `K₀` localization

Drinfeld, Section 1.2 and Main Theorem 1.6.2, supplies existence and the quasi-functor
universal property of DG quotients, and Theorem 3.4 the Verdier comparison with the precise
homotopical-flatness alternatives; Lyubashenko–Ovsienko constructs `A∞` quotients, and
Lyubashenko–Manzyuk the unital quotient; Thomason's dense-subcategory theorem and Schlichting's
localization results justify the caveat on idempotent completion.

### 7.1 DG quotients

For a small DG category `C` and a full DG subcategory `B`, construct a DG quotient `C/B` after a
homotopically flat replacement over a general commutative ring. Over a field, also construct
Drinfeld's explicit model, which adjoins to each object `U` of `B` a morphism `ε_U : U → U` of
degree `−1` with `d ε_U = 1_U`. Prove its universal property for quasi-functors annihilating `B`
(Drinfeld, Main Theorem 1.6.2).
*Needs:* §§1.2, 6.1; Tau Ceti `TauCeti.DGCategory`, `TauCeti.DGFullSubcategory`.

**Checks.**
- For `C = B` the one-object DG category of a field `k`, the explicit quotient has endomorphism
  DG algebra `k⟨ε⟩` with `|ε| = −1` and `dε = 1`, which is acyclic (left multiplication by `ε` is
  a contracting homotopy), so the object becomes a zero object of `H⁰`.

### 7.2 The Verdier comparison

Prove Drinfeld's comparison `C^tr/B^tr ≃ (C/B)^tr` between the Verdier quotient of the
pretriangulated envelopes and the envelope of the DG quotient (Drinfeld, Theorem 3.4). For the
unreplaced explicit quotient over a general ring, require that `Hom(X, U)` or `Hom(U, X)` be
homotopically flat over `k` for all `X` in `C` and `U` in `B`; otherwise use the homotopically
flat replacement. The comparison is not stated for the naive quotient without one of these routes.
Here `C^tr` is `H⁰` of the one-sided twisted complexes of §5.4, and the Verdier quotient is
Mathlib's localization at `ObjectProperty.trW`.
*Needs:* §§5.4, 7.1; Mathlib `ObjectProperty.trW`; Tau Ceti `TauCeti.DGTwistedObject.oneSided`.

### 7.3 `A∞` quotients

Construct quotients of strictly and of cohomologically unital `A∞` categories by full
subcategories (Lyubashenko–Ovsienko, Section 2, Definition 2.1, Proposition 2.2 and Section 2.5;
Lyubashenko–Manzyuk, Main Theorem 1.3), prove their unital universal property
(Lyubashenko–Manzyuk, Main Theorem 1.3 and Corollary 1.6), and compare them with the DG quotient
after enveloping DG replacement (for DG categories, Lyubashenko–Ovsienko, Section 2.6, identify
their quotient with Drinfeld's). Prove that `H⁰` of the pretriangulated envelope of the quotient
is the Verdier quotient.
*Needs:* §§2.3, 3.5, 4.2, 7.1–7.2.

### 7.4 `K₀` of a DG quotient

Apply the triangulated `K₀` of GrothendieckEulerForms §2.4 (`TauCeti.TriangulatedK0`). First let
`T` be an essentially small triangulated category and `S` a thick subcategory (a triangulated
subcategory closed under direct summands, `S.triangEnvelope = S`), and let `T/S` be the Verdier
quotient, Mathlib's localization at `ObjectProperty.trW S`, without idempotent completion. Prove
that `K₀(S) → K₀(T) → K₀(T/S) → 0` is exact (Chebolu, *Refining thick subcategory theorems*,
sequence (3), p. 10). For the DG quotient `C/B`, let `B'` be the thick closure of `B` in
`H⁰(C^tr)`, the triangulated subcategory of the direct summands of objects built from `B`; the
Verdier quotient by `B'` is the same as by `B`. Taking `T = H⁰(C^tr)` and `S = B'`, prove that
`K₀(B') → K₀(C^tr) → K₀((C/B)^tr) → 0` is exact, the image of the first map being the subgroup
generated by the classes of the objects of `B'`. With `B` in place of `B'` the statement is false.
The idempotent-completed quotient is treated separately: new retracts can enlarge `K₀`, so only
the canonical map from `K₀` of the quotient to `K₀` of its idempotent completion is constructed,
and no cokernel or short exact sequence is asserted after idempotent completion.
*Needs:* §§7.2–7.3; GrothendieckEulerForms §2.4; Mathlib `ObjectProperty.trW`,
`ObjectProperty.triangEnvelope`; Tau Ceti `TauCeti.TriangulatedK0`.

**Checks.**
- Let `C` be the DG category with objects `k` and `k ⊕ k` (complexes of `k`-vector spaces) and
  `B` the full DG subcategory on `k ⊕ k`. The triangulated subcategory generated by `B` consists of
  the objects of even Euler characteristic, the Verdier quotient is zero, and `K₀(C^tr) = ℤ`; the
  classes of `B` generate `2ℤ`, while the thick closure `B'` contains `k` and its classes generate
  `ℤ`. The sequence is exact with `B'` and not with `B`.

### Examples

Let `Q` be the quiver `1 → 2 → 3`, `C` a DG enhancement of `Perf(kQ)` over a field (the full DG
subcategory of bounded complexes of finitely generated projectives), and `B` the full DG
subcategory on the projective `P₂` at the middle vertex. Construct a homotopically flat DG
quotient model and compute its Hom complexes on the images of the three projectives: `P₂`
becomes zero, the projective containing `P₂` becomes the simple module at its top, the simple
projective stays itself, both have endomorphism algebra `k`, and all Homs between the two images
vanish in every degree, the nonzero map between them factoring through `P₂`. So
`(C/B)^tr ≃ Dᵇ(k) × Dᵇ(k)`; verify the Verdier universal property on these generators. The `K₀`
sequence is `ℤ → ℤ³ → ℤ² → 0`, with injective first map here. Since `P₂` generates an admissible
subcategory, the quotient is equivalent to the orthogonal of `P₂` and is already idempotent
complete, so the canonical map to `K₀` of its idempotent completion is an isomorphism in this
example.

### Dependencies

Layers 1–6; Mathlib localization of triangulated categories; GrothendieckEulerForms §2.4; Tau
Ceti as named in the sections.

## Layer 8: Hochschild cochains, deformations, Massey products, and formality

Getzler–Jones supplies braces and the coderivation description of Hochschild cochains;
Gerstenhaber, *On the deformation of rings and algebras*, supplies the deformation theory with
`HH²` and `HH³`; Kadeishvili's 1988 paper supplies the Hochschild obstruction method for higher
operations and intrinsic formality; May's *Matric Massey products* and Keller's minimal-model
discussion (Introduction, Section 3.3) supply defining systems and the comparison with transferred
products.

### 8.1 Hochschild cochains, braces and the Gerstenhaber bracket

For an `A∞` algebra over a commutative ring, Tau Ceti supplies the positive-arity Hochschild
cochain complex in suspended degrees, the maps `Tᶜ(sA) → sA` with components in every arity
(`TauCeti.AInfinityAlgebra.PositiveHochschild.cochains`,
`TauCeti.AInfinityAlgebra.PositiveHochschild.complex`), with differential `[m, −]`
(`TauCeti.AInfinityAlgebra.hochschildDifferential`, squaring to zero by
`TauCeti.AInfinityAlgebra.hochschildDifferential_hochschildDifferential`), the Gerstenhaber
bracket on cochains and on cohomology with its antisymmetry and Jacobi identity
(`TauCeti.AInfinityAlgebra.PositiveHochschild.bracket`,
`TauCeti.AInfinityAlgebra.PositiveHochschild.Cohomology`,
`TauCeti.AInfinityAlgebra.PositiveHochschild.cohomologyBracket`), the brace
`TauCeti.ReducedTensorWords.brace` and bracket `TauCeti.ReducedTensorWords.gerstenhaberBracket`,
the normalized cochains of a strictly unital algebra with their inclusion
(`TauCeti.AInfinityAlgebra.PositiveHochschild.normalizedComplex`,
`TauCeti.AInfinityAlgebra.PositiveHochschild.normalizedComplexι`), and for `A∞` categories the
complex of path-compatible cochains `TauCeti.AInfinityCategory.PositiveHochschild.complex`. A DG
algebra or category enters through its `A∞` structure.

Construct the full Hochschild cochain complex, with the cochains of arity zero (the coaugmented
version), in classical indexing `HH^n` and in the bigrading `HH^{n,r}` by arity `n` and internal
degree `r`, for `A∞` algebras and categories; the Hochschild chain complex and Hochschild homology
`HH_*` of DG and `A∞` algebras and categories; the cup product; the multi-braces of §0.1 with the
brace-algebra relations; and the cohomology and Gerstenhaber bracket of categories. Over a field,
or when `k·e` is a direct summand for the strict unit `e`, prove that the inclusion of the
normalized cochains is a quasi-isomorphism, for algebras and for categories. Over a field (or with
`k`-projective Hom complexes and the cofibrant replacements of Layer 6), prove that the full
Hochschild cochain and chain complexes are invariant under `A∞` quasi-isomorphism of algebras, as
Gerstenhaber algebras on cohomology, under quasi-equivalence of cohomologically unital
categories, and under derived Morita equivalence. The positive-arity complex is a subcomplex
whose quotient is the arity-zero part; it is invariant under quasi-isomorphisms of `A∞` algebras
over a field, and is not Morita-invariant.
*Needs:* §§0.1, 2.1–2.3, 6.3–6.5; Tau Ceti as above.

**Checks.**
- The algebras `k` and `M₂(k)` in degree zero are Morita equivalent, and their full Hochschild
  cohomologies agree: `HH⁰` is the centre `k` and `HH^{≥1} = 0`, `M₂(k)` being separable. Their
  positive-arity cohomologies in suspended degree zero are the derivations, zero for `k` and the
  three-dimensional `M₂(k)/k` for `M₂(k)`; the positive-arity complex is not Morita-invariant.
- For an algebra `A` in degree zero, a first-order deformation `m₂ + tφ` is associative modulo
  `t²` exactly when `aφ(b, c) − φ(ab, c) + φ(a, bc) − φ(a, b)c = 0`, the Hochschild cocycle
  condition, and changing it by the gauge `a ↦ a + tg(a)` adds the coboundary of `g`.

### 8.2 Deformations

Over every commutative base, an `A∞` structure is a degree-one square-zero coderivation and,
equivalently, a solution of the brace equation `m{m} = 0` in positive-arity Hochschild cochains
(`TauCeti.AInfinityAlgebra.brace_taylor_taylor`, with the converse through
`TauCeti.ReducedTensorWords.gradedCoderiv_comp_self_eq_zero_iff` and
`TauCeti.AInfinityAlgebra.ofTaylor`); the difference `ξ` of two structures with the same grading
satisfies `[m, ξ] = −ξ{ξ}` (`TauCeti.AInfinityAlgebra.hochschildDifferential_taylor_sub_taylor`).
Tau Ceti supplies formal deformations as families of cochains with the brace equation order by
order (`TauCeti.AInfinityAlgebra.IsDeformationOfOrder`,
`TauCeti.AInfinityAlgebra.IsFormalDeformation`), the obstruction class of a deformation of order
`n` in `PositiveHochschild.Cohomology` of degree two
(`TauCeti.AInfinityAlgebra.IsDeformationOfOrder.obstructionClass`), whose vanishing is exactly
extendability (`TauCeti.AInfinityAlgebra.IsDeformationOfOrder.obstructionClass_eq_zero_iff`),
unobstructed extension to all orders when that cohomology vanishes
(`TauCeti.AInfinityAlgebra.IsDeformationOfOrder.exists_isFormalDeformation`), the gauge action of
coalgebra automorphisms on `A∞` structures (`TauCeti.AInfinityAlgebra.gauge`), and over a
`ℚ`-algebra the exponential of a degree-zero Hochschild cocycle without unary component
(`TauCeti.AInfinityAlgebra.expHom`).

Develop filtered formal deformations over complete local bases (`k⟦t⟧` and Artinian local
`k`-algebras), with base change, the first-order class map to Hochschild cohomology, and the
equivalence of deformations by gauge, proving that equivalent deformations have cohomologous
first-order terms. For an ordinary associative algebra, recover `HH²(A, A)` of the full complex
as the infinitesimal deformations up to equivalence and `HH³(A, A)` as the home of obstructions
(Gerstenhaber); for a general higher operation retain both Hochschild arity and internal degree.
Name the filtration: on the full Hochschild complex, `Fᵖ` consists of the cochains vanishing on
words of length at most `p`; it is complete and separated, `[Fᵖ, F^q] ⊆ F^{p+q}`, and the
difference of two structures with the same `m₁` lies in `F¹`. When `2` is invertible, identify
the brace equation with `dξ + ½[ξ, ξ] = 0`. When `k` is a `ℚ`-algebra, identify it with the
Maurer–Cartan equation in this complete pronilpotent DG Lie algebra, and only then construct the
exponential gauge action on Maurer–Cartan elements, the Deligne groupoid and Getzler's
simplicial Maurer–Cartan set (Getzler, *Lie theory for nilpotent L-infinity algebras*), the
complete case by the inverse limit over the nilpotent quotients; compare the gauge-equivalent
twists of §4.4 in this sense.
*Needs:* §§4.4, 8.1; Tau Ceti as above.

### 8.3 Massey products

For an `A∞` algebra over a commutative ring, Tau Ceti's triple Massey product
`TauCeti.AInfinityAlgebra.tripleMasseyProduct` is the set of values of the defining systems
`TauCeti.AInfinityAlgebra.TripleMasseyDefiningSystem`, empty exactly when the product is
undefined (`TauCeti.AInfinityAlgebra.tripleMasseyProduct_nonempty_iff`), a coset of the
indeterminacy `TauCeti.AInfinityAlgebra.tripleMasseyIndeterminacy`, which is `x·H + H·z` on
homogeneous `x`. Over a field, the `m₃` of the minimal model of §3.4 lies in it
(`TauCeti.AInfinityAlgebra.minimalModel_m_three_mem_tripleMasseyProduct`,
`TauCeti.AInfinityAlgebra.mem_tripleMasseyProduct_iff_sub_minimalModel_m_three_mem`).

Define matric Massey products and `n`-fold Massey products with their defining systems (May),
set-valued and empty exactly when undefined, and compare the triple product with May's for DG
algebras. Prove that for every special contraction of an `A∞` algebra onto its cohomology with
zero differential, over a commutative ring, the transferred `m₃` lies in the triple Massey
product. For a DG algebra over a field and the minimal model transferred along a special
contraction, prove that the higher operations encode compatible defining systems: if
`m_k(x_j, …, x_{j+k−1}) = 0` for all `2 ≤ k < n` and all consecutive sub-tuples of
`(x_1, …, x_n)`, then `⟨x_1, …, x_n⟩` is defined and contains `± m_n(x_1, …, x_n)`, with the sign
fixed by the conventions above. Prove that an `A∞` quasi-isomorphism carries triple Massey
products and their indeterminacies onto those of the target, so that every defined triple Massey
product of a formal algebra contains zero. A multi-valued Massey product is never identified with
a single operation without its indeterminacy.
*Needs:* §§3.3–3.4; Tau Ceti as above.

### 8.4 Formality

The obstruction to an `A∞` isomorphism between a minimal `A∞` algebra and a graded algebra, arity by
arity, is Tau Ceti's `TauCeti.AInfinityAlgebra.obstruction`, a Hochschild cocycle
(`TauCeti.AInfinityAlgebra.hochschildDifferential_obstruction`), killed by a gauge when it is a
coboundary (`TauCeti.AInfinityAlgebra.IsMinimal.taylor_gauge_apply_eq_of_hochschildDifferential`).
The vanishing condition in arity `n` and internal degree `2 − n` is
`TauCeti.AInfinityAlgebra.HochschildVanishesAt`, stated on unnormalized cochains of a nonunital
algebra, which for `n ≥ 3` does not see arity zero; over every commutative ring a minimal algebra
with the grading and product of a graded algebra `H` satisfying it for all `n ≥ 3` is `A∞`
isomorphic to `H`
(`TauCeti.AInfinityAlgebra.IsMinimal.exists_isIso_of_forall_hochschildVanishesAt`), and over a field
`H` is then intrinsically formal
(`TauCeti.AInfinityAlgebra.isIntrinsicallyFormal_of_forall_hochschildVanishesAt`), which is
Kadeishvili's criterion `HH^{n, 2−n}(H, H) = 0` for every `n ≥ 3`. It is sufficient and not
necessary. Over a `ℚ`-algebra, for a minimal algebra with the grading and product of `H` and
`m₃ = ⋯ = m_{n+1} = 0`, the first obstruction `m_{n+2}` is the Hochschild differential of a
degree-zero cochain on words of length `n + 1` when the algebra is `A∞` isomorphic to `H`
(`TauCeti.AInfinityAlgebra.IsMinimal.exists_hochschildDifferential_eq_obstruction_of_isIso`), so
a first obstruction that is not such a coboundary prevents formality
(`TauCeti.AInfinityAlgebra.IsMinimal.not_isFormal_of_not_exists_hochschildDifferential_eq_obstruction`).

Prove that vanishing transferred operations give formality: if the operations `m_n^H`, `n ≥ 3`,
transferred along a special contraction of an `A∞` algebra onto its cohomology with zero
differential vanish, the algebra is formal, over every commutative ring. For a strictly unital
`H`, prove that the criterion may equally be stated with normalized cochains (§8.1).
*Needs:* §§3.3, 8.1; Tau Ceti `TauCeti.AInfinityAlgebra.IsMinimal.isFormal`,
`TauCeti.AInfinityAlgebra.IsFormal.of_isQuasiIso`.

### Examples

For the Heisenberg algebra `A = Λ(a, b, c)`, `dc = ab`, of the Layer 3 examples, over a field `k`:
the triple Massey product `⟨[a], [a], [b]⟩` contains `m₃^H([a], [a], [b]) = [ac]`
(`TauCeti.HeisenbergDGA.minimalModel_m_three_mem_tripleMasseyProduct`), and its indeterminacy
`[a]·H¹ + H¹·[b]` is zero, because `H¹` is spanned by `[a]` and `[b]` and every product of two of
them is a multiple of `[ab] = 0`. So `⟨[a], [a], [b]⟩ = {[ac]}` does not contain zero, and by
§8.3 `A` is not formal; the plain cohomology algebra and the transferred structure differ, as
§6.2 uses.

### Dependencies

Layers 0–6; Tau Ceti as named in the sections.

## Layer 9: smoothness, properness, Serre functors, and Calabi–Yau structures and completions

Keller's survey *On differential graded categories*, Section 4.7, supplies smooth and proper Morita
invariance; Keller, *Deformed Calabi–Yau completions*, Sections 4–5, supplies the tensor-algebra
completion, its Calabi–Yau structure and the deformation by a Hochschild class; Bondal–Kapranov
supply Serre functors; Shklyarov, Theorems 3.4–3.5 and 6.2, supplies the Hirzebruch–Riemann–Roch
pairing for DG algebras and its nondegeneracy under smoothness; Brav–Dyckerhoff, Sections 3–5,
supply the distinction between left, right and negative-cyclic Calabi–Yau structures.

### 9.1 Smoothness and properness

A small DG or `A∞` category `C` is proper over `k` when every Hom complex is perfect as a complex
of `k`-modules; over a field this means finite-dimensional total cohomology. It is smooth over `k`
when its diagonal bimodule is perfect in `D(Cᵒᵖ ⊗ C)`. Define both as Morita-invariant
predicates, keep them independent, and for a DG algebra compare smoothness with perfection over
`Aᵉ = Aᵒᵖ ⊗ A`.
*Needs:* §§5.5, 6.3–6.5.

**Checks.**
-  The path algebra of a finite acyclic quiver in degree zero is smooth, by its length-one
  projective bimodule resolution
  (`TauCeti.PathAlgebra.exact_arrowTensorDifferential_vertexTensorMul`), and proper.
- The dual numbers `k[ε]/(ε²)` in degree zero over a field are proper and not smooth: they have
  infinite global dimension, `Extⁿ(k, k)` being one-dimensional for every `n`
  (`TauCeti.finrank_ext_dualNumberResidue`), while a smooth finite-dimensional algebra has finite
  global dimension. So finite-dimensional total cohomology does not imply smoothness.

### 9.2 Dualizing bimodules and Calabi–Yau structures

For a smooth category construct the inverse dualizing bimodule `C! = RHom_{Cᵉ}(C, Cᵉ)`, and for a
proper category over a field the linear dual bimodule `C*`. The left and right notions are
separate: a smooth, or left, `d`-Calabi–Yau bimodule identification is `C! ≅ C[−d]`, and a proper,
or right, one is `C[d] ≅ C*`. Their refinements to negative cyclic homology lift different
Hochschild classes; neither is called "the" Calabi–Yau structure.
*Needs:* §§5.1, 9.1.

**Checks.**
- For a finite-dimensional symmetric algebra `A` in degree zero, `A* ≅ A` as bimodules, so `A` is
  right `0`-Calabi–Yau. The dual numbers `k[ε]/(ε²)`, symmetric with the trace `a + bε ↦ b`, are
  not smooth (§9.1), so they have no left Calabi–Yau structure at all. A symmetric algebra is
  smooth only when it is semisimple, being self-injective, while a smooth finite-dimensional
  algebra has finite global dimension; `k` itself is both left and right `0`-Calabi–Yau, with
  `k! = k`.

### 9.3 Derived tensor algebras and Calabi–Yau completions

Construct the derived tensor algebra `T_C(M) = ⨁_{n≥0} M^{⊗_C n}` of a bimodule over a small DG
category, graded by tensor length, with its universal property and its cofibrancy hypotheses.
For a homologically smooth `C`, define the `n`-Calabi–Yau completion `Π_n(C) = T_C(C![n−1])`,
prove that it is homologically smooth and bimodule `n`-Calabi–Yau, `Π_n(C)! ≅ Π_n(C)[−n]`, and that
its differential preserves the tensor-length grading. For `C = kQ` in degree zero, the Adams
grading of the Ginzburg algebra used downstream (Tau Ceti's `TauCeti.ginzburgTwoAdamsDegree`:
arrows and reverse arrows in Adams degree one, loops in degree two) is not the tensor length; prove
that it is the path-length grading of `kQ`, carried to `C!` with the dual of an arrow in degree
`−1`, plus twice the tensor length. For a class `ξ` construct the deformed completion `Π_n(C, ξ)`
by twisting the differential, and prove `Π_n(C, 0) = Π_n(C)`. The twist needs only a Hochschild
class in `HH_{n−2}(C)`; Keller's canonical form lifts it to negative cyclic homology, which this
roadmap does not construct, so a theorem needing the lift carries the class as a hypothesis
rather than producing it. These completions are the objects that ZigzagPreprojective §6.1
identifies with its `Π₂(Q)` and `Γ₃(Q, W)`.
*Needs:* §§5.1, 8.1, 9.1–9.2; Tau Ceti `TauCeti.ginzburgTwoAdamsDegree`.

**Checks.**
- For `C = k` (one vertex, no arrows), `C! = k` and `Π_n(k)` is the tensor algebra on one
  generator `t` of degree `1 − n` with zero differential; for `n = 2`, `t` has degree `−1` and
  tensor length one, and it is the loop of the Ginzburg algebra of the one-vertex quiver, of Adams
  degree two, not one.

### 9.4 Serre functors

For a proper category over a field, prove that tensoring with `C*` is a Serre functor `S` on
`Perf(C)` when it preserves perfect objects, with the bifunctorial duality
`Hom(X, Y)* ≅ Hom(Y, SX)`, and that `S` is unique up to unique isomorphism. A right
identification `C[d] ≅ C*` then gives `S ≅ [d]`. Under both smoothness and properness, construct
the duality relating left and right Calabi–Yau structures as in Brav–Dyckerhoff; one is never
inferred from the other without those dualizability hypotheses.
*Needs:* §§5.5, 9.1–9.2.

### 9.5 Hochschild homology, Chern characters and the Hirzebruch–Riemann–Roch theorem

For a proper DG algebra over a field and perfect modules `X`, `Y`, put
`χ(X, Y) = Σ_i (−1)^i dim_k H^i RHom(X, Y)`, a finite sum by properness. Construct the Chern
character of perfect modules in Hochschild homology (§8.1) and Shklyarov's pairing, and prove the
Hirzebruch–Riemann–Roch theorem: `χ(X, Y)`, as an element of `k`, is the pairing of the Chern
characters of `X` and `Y`, with the opposite-category involution placed as in Shklyarov, Theorems
3.4–3.5. If the algebra is also smooth, prove that the Hochschild pairing is nondegenerate (Theorem
6.2). Extend this to a DG category only through a Morita equivalence with a DG algebra given by a
specified compact generator (§6.4); Shklyarov's theorem is not itself a statement about many
objects. This is not a claim that the Euler form on `K₀` is nondegenerate. *Needs:* §§6.4, 8.1, 9.1.

### Examples

For a finite acyclic quiver `Q` over a field, the path algebra in degree zero is smooth and
proper; `Perf(kQ)` is the category of bounded complexes of finitely generated projectives
(Tau Ceti's `DerivedCategory.Bounded.perfect_iff`); the Serre functor sends the
projective `P_i` to the injective `I_i`. The dual numbers are proper and not smooth (§9.1).

### Dependencies

Layers 5, 6 and 8; Tau Ceti as named in the sections.

## Layer 10: `K₀` of perfect categories, Euler forms, and numerical forms

This layer uses GrothendieckEulerForms for every group quotient and finite-support sum.
Shklyarov supplies the Hirzebruch–Riemann–Roch theorem, Bondal–Kapranov the Serre identity, and
Schlichting the nonconnective localization caveat when perfect quotients are idempotent
completed.

### 10.1 `K₀` of perfect categories

Define `K₀(Perf C)` as the triangulated `K₀` (`TauCeti.TriangulatedK0`, GrothendieckEulerForms
§2.4) of the essentially small idempotent-complete category `Perf(C)`. First prove
`K₀(H⁰(pretr C)) ≅ K₀(tria(C))`, using the identification with finite semi-free modules (§5.4).
The inclusion of `tria(C)` into its idempotent completion `Perf(C)` induces a map on `K₀`, which
need not be an isomorphism. Neither group is replaced by the split `K₀` of finite cell objects
without a separately proved resolution or cofinality theorem. Prove invariance of these groups
under quasi-equivalence and Morita equivalence (`TauCeti.TriangulatedK0.mapEquiv` for triangle
equivalences).
*Needs:* §§5.4–5.5, 6.1, 6.3; GrothendieckEulerForms §2.4.

### 10.2 The Euler pairing

For a proper `C` over a field, define `χ(X, Y) = Σ_i (−1)^i dim_k H^i RHom_C(X, Y)` for perfect
`X`, `Y`. Prove termwise finite-dimensionality and finite support first, then descend `χ` to a
biadditive form on `K₀(Perf C)` (`TauCeti.TriangulatedK0.BiadditiveInvariant.bilift`;
GrothendieckEulerForms §§5.1–5.5). For an ordinary finite-dimensional algebra of finite global
dimension, compare this pairing and `K₀(Perf A)` with the Cartan and Ext-Euler constructions of
GrothendieckEulerForms (§4.4 and §5.6). For an acyclic quiver, compare with `TauCeti.eulerForm`,
with the handedness fixed: right `kQ`-modules are representations of the opposite quiver, so
`χ(X, Y) = ⟨dim Y, dim X⟩_Q`, the Euler form of `Q` with its arguments exchanged
(`TauCeti.extEuler_eq_eulerForm_dimVector` is the left-module form).
*Needs:* §10.1; GrothendieckEulerForms §§4.4, 5.1–5.6; Tau Ceti `TauCeti.eulerForm`,
`TauCeti.extEuler_eq_eulerForm_dimVector`.

**Checks.**
- For `Q = 1 → 2` with right modules, `χ` of the simple right modules at the source and target of
  the arrow is `−1` in one order and `0` in the other, and the order is the opposite of the one for
  representations of `Q`; the comparison without exchanging the arguments would give the transpose.

### 10.3 Serre duality and the Euler form

From Serre duality prove `χ(X, Y) = χ(Y, SX)`: the duality of §9.4 gives
`Hom(X, Y[i])* ≅ Hom(Y[i], SX) = Hom(Y, SX[−i])`, so the degree-`i` term of `χ(X, Y)` has the
dimension of the degree-`(−i)` term of `χ(Y, SX)`, with the same sign. Only after a specified
natural identification `S ≅ [d]` prove `χ(X, Y) = (−1)^d χ(Y, X)`, the shift acting by `(−1)^d`
on `K₀` (`TauCeti.TriangulatedK0.of_shift`); the sign is derived from finite support, not
asserted for a divergent sum.
*Needs:* §§9.4, 10.2.

**Checks.**
- For a finite acyclic quiver, `χ(P_i, P_j)` is the number of paths from `j` to `i`, and so is
  `χ(P_j, I_i)`, with `S P_i = I_i`, in the left-module form of
  `TauCeti.eulerForm_dimVector_indecProjRep_indecProjRep` and
  `TauCeti.eulerForm_dimVector_indecProjRep_indecInjRep`.

### 10.4 Numerical quotients

Form the left and right numerical quotients of `K₀(Perf C)` by the radicals of `χ`
(`TauCeti.leftRadical`, `TauCeti.rightRadical`, `TauCeti.LeftNumericalQuotient`,
`TauCeti.RightNumericalQuotient`, with the nondegenerate induced pairing
`TauCeti.numericalPairing_nondegenerate`; GrothendieckEulerForms §§7.1–7.2). Prove that Serre
duality identifies the left radical with the inverse image of the right radical under `S`, since
by §10.3 `χ(x, y) = 0` for every `y` exactly when `χ(y, Sx) = 0` for every `y`, and
that under `S ≅ [d]` the two radicals agree; without such a duality they remain distinct.
*Needs:* §§10.2–10.3; GrothendieckEulerForms §§7.1–7.2.

### 10.5 Localization and the Chern character

Prove compatibility of the localization maps of Layer 7 with Euler pairings only when the pairing
descends, and prove that radicals are preserved before inducing maps of numerical quotients. In
characteristic zero, relate the Chern character to the numerical quotient through the
Hirzebruch–Riemann–Roch theorem; in characteristic `p` the comparison fails, since
`ch(p[k]) = 0` while `χ(p[k], [k]) = p`. Nondegeneracy of the Hochschild pairing implies neither
injectivity of the Chern character nor nondegeneracy of `χ` on `K₀`.
*Needs:* §§7.4, 9.5, 10.4.

### Examples

Proper, smooth, Serre and numerical boundaries. For a finite acyclic quiver algebra in degree
zero, compare `χ` with `TauCeti.eulerForm` (§10.2), compute the Serre action and verify
`χ(X, Y) = χ(Y, SX)` on projective and simple generators (§10.3). The dual numbers `k[ε]/(ε²)` in
degree zero have `K₀(Perf) = ℤ·[A]` and `χ(A, A) = 2`, so their numerical radicals are zero; they
test that properness does not give smoothness (§9.1), not a nonzero radical. A nonzero radical
comes from the one-object proper DG category whose endomorphism algebra is `Λ(ε)` with `|ε| = 1`
and zero differential: its representable `A` has `χ(A, A) = 1 − 1 = 0`, its class in
`K₀(Perf A) ≅ ℤ` is nonzero (derived base change along the augmentation sends it to `[k] = 1`),
and it lies in both radicals, so the numerical quotients are zero. This example is proper and not
smooth, distinct from the smooth acyclic-quiver calculation. No theorem infers nondegeneracy of
`χ` on `K₀` from smoothness and properness or from nondegeneracy of the Hochschild pairing.

### Dependencies

Layers 5–9; GrothendieckEulerForms §§2.4, 4.4, 5.1–5.6, 7.1–7.2; Tau Ceti as named in the
sections.

## Layer 11: relative quadratic and derived Koszul duality

Beilinson–Ginzburg–Soergel, Section 2, supplies Koszul rings, diagonal Ext, dual Koszulity and
double duality in the locally finite graded setting; Positselski, Chapter 6 and Appendices A–B,
supplies the conilpotent and nonconilpotent bar constructions, coderived and contraderived
categories and the finiteness boundaries; Keller, Introduction, Section 3.5, supplies the
`S`-relative `A∞` presentation.

### 11.1 Relative quadratic algebras and their duals

Let `S` be a finite-dimensional separable semisimple algebra over a field `k` and `V` a finitely
generated projective `S`-bimodule. A quadratic algebra is `A = T_S(V)/(R)` with `R ⊆ V ⊗_S V` an
`S`-subbimodule. Take the right dual `V^∨` in the monoidal category of `S`-bimodules, with
evaluation `V^∨ ⊗_S V → S` and coevaluation fixed as part of the duality data; use the induced
order-reversing comparison `(V ⊗_S V)^∨ ≅ V^∨ ⊗_S V^∨` to define `R^⊥` as the kernel of
restriction to `R`, and define `A! = T_S(V^∨)/(R^⊥)`. State the alternative definition through
the left dual and its explicit equivalence with the opposite, rather than treating the two duals
as definitionally equal. Over a field with `S = k^I`, compute the idempotent components and recover
the reversed quiver arrows; for path algebras of finite quivers this is Tau Ceti's
`TauCeti.PathAlgebra.quadraticDual`, built on `TauCeti.PathAlgebra.quadraticOrthogonal`, in the
right-dual convention. Prove the double-orthogonal formula `(R^⊥)^⊥ = R` and the comparisons with
opposites and tensor products only under the stated dualizability and perfect-pairing hypotheses
(for path algebras, `TauCeti.PathAlgebra.quadraticOrthogonal_quadraticOrthogonal`). Mathlib's
`TensorAlgebra` needs a commutative base, so `T_S(V)` over a noncommutative `S` is constructed
here, together with the base-change, opposite and bimodule-duality interfaces that downstream
applications use; the applications themselves are not developed here.
*Needs:* Mathlib `TensorAlgebra`, `RingQuot`; Tau Ceti as above.

### 11.2 Koszulity

Define Koszulity with graded right `A`-modules: the augmentation module `S` has a linear graded
projective resolution, equivalently the bigraded `Ext` (or `Tor`) vanishes off the diagonal. The
linear resolutions and the diagonal criterion are those of GrothendieckEulerForms §3.7
(`TauCeti.GradedProjectiveResolution.IsLinear`,
`TauCeti.GradedProjectiveResolution.IsLinear.subsingleton_ext_of_ne` and the converse
`TauCeti.GradedProjectiveResolution.IsMinimal.isLinear_iff_subsingleton_ext`), stated for left
modules and applied to right `A`-modules as left `Aᵐᵒᵖ`-modules, so that one notion of linearity
serves this layer, the classical Koszulity of ZigzagPreprojective and the graded Cartan matrices.
Prove that a Koszul algebra is quadratic, that its quadratic dual is Koszul, and that, with the
Yoneda multiplication `[f][g] = [f ∘ g]`, `Ext*_{Mod-A}(S, S)` is `A!`, while the parallel
left-module statement gives `(A!)ᵒᵖ` through the opposite bridge (Beilinson–Ginzburg–Soergel,
Section 2). Fix left and right, the multiplication order and the internal-degree shifts by an
explicit quiver calculation.
*Needs:* §11.1; GrothendieckEulerForms §3.7; Mathlib `CategoryTheory.Abelian.Ext`.

### 11.3 The derived Koszul dual

Define the derived Koszul dual of an augmented DG or `A∞` algebra as `E(A) = RHom_A(S, S)`, with
its natural DG structure or its transferred `A∞` structure. Compare it with the linear dual of
`B∞A` only when the tensor-length pieces are finite projective; otherwise keep the coalgebraic bar
dual rather than replacing a direct sum by an unjustified product. The split-augmentation,
conilpotence and K-flatness or cofibrancy hypotheses of Layer 4 are reused; the notation `B∞A`
does not erase them.
*Needs:* §§3.4, 4.1–4.2, 5.1.

### 11.4 Double duality

Prove that the double-dual map `A → E(E(A))` is a quasi-isomorphism under stated Adams-connected,
local-finiteness and completeness hypotheses. State the derived–coderived equivalence with its
conilpotence and boundedness conditions (Positselski, Chapter 6); Tau Ceti's coderived categories
of curved DG modules, `TauCeti.CurvedDGRightModuleCat.CoderivedCategory`, are the coderived side
at curvature zero. No unrestricted double-dual equivalence is asserted for arbitrary augmented DG
algebras.
*Needs:* §11.3; Tau Ceti as above.

**Checks.**
- For `A = k[x]` with `|x| = 0` over a field, `E(A) = Λ(ξ)` with `ξ` of degree one, and
  `E(E(A)) = k⟦x⟧`: the double dual is the completion, not `k[x]` itself, so a double-dual
  statement without a completeness or finiteness hypothesis is false.

### Examples

Koszul checks. Over a field, compute the quadratic and derived Koszul duals of the symmetric
algebra on a finite-dimensional space `V` and obtain the exterior algebra on `V*` with the fixed
internal shift. Repeat over a finite separable semisimple base for a relative quadratic algebra.
Over `S = k^{1,2,3}`, take the quiver `1 → 2 → 3` with arrows `a : 1 → 2` and `b : 2 → 3`, so
that `V ⊗_S V = k·(ba)`. For `R = 0`, `A = kQ` is six-dimensional and `A!` is the path algebra of
the reversed quiver modulo its length-two path, five-dimensional; for `R = k(ba)`, `A = kQ/(ba)`
is five-dimensional and `A!` is the path algebra of the reversed quiver, with no relation. Use
the right augmentation modules to verify that `Ext ≅ A!` with its multiplication order, and repeat
with left modules to exhibit `(A!)ᵒᵖ`. Every theorem that uses linear duals carries the
finite-projectivity and semisimplicity hypotheses explicitly.

### Dependencies

Layers 3–5; GrothendieckEulerForms §3.7; Tau Ceti as named in the sections.

## Downstream consumers

- [ZigzagPreprojective](../ZigzagPreprojective/README.md) takes the Koszul predicate and the
  Koszul duality theorems of Layer 11 (§5.2, classical Koszulity of the zigzag algebra), the
  Calabi–Yau completions `Π_n(C)` and their deformations of §9.3 with the Hochschild class of a
  potential from Layer 8 (§6.1, the Ginzburg algebras), and derived Koszul duality with the
  Hochschild comparison (§7.1).
- [RationalHomotopyModels](../RationalHomotopyModels/README.md) uses the tensor coalgebras of
  Layer 0, DG algebras of Layer 1, bar and cobar constructions of Layer 4, minimal models and
  formality of Layer 3, and Massey products of Layer 8.
- [EnhancedDerivedSheaves](../EnhancedDerivedSheaves/README.md) uses the signs and the Koszul
  braiding of Layer 0 and the DG categories, `Z⁰` and `H⁰` of Layer 1.
- [HopfologicalAlgebra](../HopfologicalAlgebra/README.md) uses Layers 0 and 1, the derived
  categories and perfect objects of Layer 5, and the DG quotients of Layer 7.
- [StablePeriodicCurved](../StablePeriodicCurved/README.md) uses the grading, shift and sign
  conventions, DG categories and modules and the pretriangulated envelope; its Lean file states
  its curved DG algebras in the graded vocabulary `TauCetiRoadmap.DGAInfinity.InternalGrading`,
  `TauCetiRoadmap.DGAInfinity.InternalGrading.IsHomogeneous` and
  `TauCetiRoadmap.DGAInfinity.LinearHasDegree` of §0.1.
- [GeneralAlgebraicKTheory](../GeneralAlgebraicKTheory/README.md) uses the perfect DG models,
  pretriangulated envelopes, derived Morita theory and DG quotients of Layers 5–7.
- [McKaySkewGroup](../McKaySkewGroup/README.md) §3.3 instantiates the relative quadratic duality of
  §11.1 at the base `k[Γ]`.

## Scope and ownership

**This roadmap owns** the targets stated in the layers above: the comparison of internal
gradings with Mathlib's graded objects, the Koszul symmetry and multi-braces, conilpotence of the
tensor coalgebra, and the map forms of the low-arity Stasheff relations (Layer 0); the underlying
graded category, nonunital opposites and tensor products, modules and bimodules over DG
categories with restriction and extension along DG functors, and the one-object module
equivalence (Layer 1); tensor products of `A∞` algebras, the component and composition equations
of `A∞` morphisms, homotopy as an equivalence relation, `A∞` transformations and functor
categories, modules over `A∞` categories, the `A∞` Yoneda functor and the bar tensor product of
bimodules (Layer 2); direction-independent formality, the tree formulas for transfer, Kadeishvili's
theorem for categories, modules and bimodules, homotopy inverses and unit strictification (Layer
3); bar and cobar constructions, the bar–cobar adjunction, the enveloping DG algebra and
Maurer–Cartan twisting in the upper-triangular and complete regimes (Layer 4); derived categories
of DG and `A∞` modules, `A∞` twisted objects, the pretriangulated envelope as a DG category,
`tria`, `Perf` and compact objects (Layer 5); Layers 6, 7 (with the `K₀` sequence of a Verdier
quotient by a thick subcategory, §7.4), 9, 10 and 11 entire; and in Layer 8 the
full Hochschild complex and Hochschild homology, normalization and invariance, filtered
deformations and the Deligne–Getzler theory, higher Massey products and the vanishing criterion
for transferred operations.

**What is already in the library.** Tau Ceti proves most of Layer 0 (internal
gradings, tensor coalgebras and coderivations, the Koszul braiding and the linear enrichment of
cochain complexes, the suspension square and the Stasheff identities with their low-arity forms),
most of Layer 1 (DG algebras, DG categories with `Z⁰`, `H⁰`, functors, transformations,
opposites, tensor products and quasi-equivalences, DG modules and bimodules over DG algebras with
their DG categories, tensor and Hom, the DG Yoneda lemma), the `A∞` algebras, morphisms,
homotopies, units, categories, functors, right modules and bimodules of Layer 2, homological
transfer and Kadeishvili's theorem for algebras with the Heisenberg computation (Layer 3), the
bar differentials and Maurer–Cartan elements in the arity-nilpotent regime (Layer 4), DG twisted
objects with their triangulated homotopy category and the one-sided envelope (Layer 5), and in
Layer 8 positive-arity Hochschild cochains with their bracket, formal deformations and
obstructions, triple Massey products and Kadeishvili's intrinsic-formality criterion. The layers
use these by name and do not plan them again; the declarations are listed under the supplier
contracts below. Mathlib supplies cochain complexes, their monoidal structure and linear Hom
complex, enriched categories, localization, derived categories of abelian categories,
triangulated categories and idempotent completions.

**Owned elsewhere.**

- *Grothendieck groups*: exact and triangulated `K₀`, the smallness policy, finite-support Euler
  sums and their descent, the Cartan and Ext-Euler constructions for finite-dimensional algebras,
  left and right numerical radicals and quotients, and linear graded projective resolutions with
  the diagonal Ext criterion: GrothendieckEulerForms (Conventions, §§2.4, 3.7, 4.4, 5.1–5.6,
  7.1–7.2), consumed in Layers 7, 10 and 11.
- *The triangulated structure on idempotent completions*, the `K₀` of dense triangulated
  subcategories (Thomason) and negative `K`-theory, which explain why no exact sequence is
  asserted after idempotent completion: GeneralAlgebraicKTheory §§11.3–11.4a and §§11.6–11.7. No
  section here uses them: §5.5 triangulates `Perf(C)` as a thick subcategory of `D(C)`.
- *Curved objects and periodic complexes*: StablePeriodicCurved. *Applications to particular
  presented algebras* and application-specific correspondence theorems (Ginzburg algebras, zigzag
  and preprojective algebras, McKay quivers): the downstream roadmaps listed above.

**Former layer placement.** Four groups of statements that other roadmaps may cite by a former
layer now stand elsewhere: the homotopy-inverse and unit-strictification theorems, formerly in
Layer 2, are §3.5; the module equivalence for a DG algebra and its cohomology, formerly in Layer
3, is §6.2; the Deligne–Getzler comparison of twists, formerly in Layer 4, is §8.2; and the Morita
invariance of Hochschild theory, of smoothness and properness and of the Euler pairing, formerly
in Layer 6, is §§8.1, 9.1 and 10.1.

**What the roadmap does not claim.** It does not construct negative cyclic homology, nor with it
the canonical lift of Calabi–Yau classes; theorems that need a lift carry it as a hypothesis
(§9.3). It treats uncurved, integer-graded DG and `A∞` objects and
makes no claims about named root systems, lattices, categorical glue constructions or proposed
homological finiteness mechanisms. It does not claim that DG categories are unable to model a
derived theory: a strictly unital augmented `A∞` algebra over a field, or over a separable
semisimple base with the split and K-flatness hypotheses of §4.2, has the enveloping DG algebra
`U(A) = ΩB∞A` and an `A∞` quasi-isomorphism `A → U(A)`, and DG models exist for the categorical
theory under the corresponding smallness and flatness hypotheses. `A∞` structures are useful
because transfer keeps a chosen small underlying complex, most importantly cohomology with zero
differential, and puts the lost coherence into explicit `m₃, m₄, …`; this gives computable
minimal models, exposes Massey products and deformation obstructions, and makes finite
twisted-object calculations much smaller than a strict DG replacement. The bridge between the
enriched definition of DG categories and `A∞` categories with vanishing higher operations is a
theorem (§2.3), not a choice of one spelling. Mathlib owns the naming and universe choices of
graded linear quivers, and Tau Ceti's `TauCeti.GradedLinearQuiver` follows them.

## Exact supplier contracts

### From Mathlib

- `HomologicalComplex.monoidalCategory` (`Mathlib/Algebra/Homology/Monoidal.lean`), the
  monoidal structure on `CochainComplex (ModuleCat k) ℤ` for `ComplexShape.up ℤ`, with
  `ComplexShape.TensorSigns` and its sign character `Int.negOnePow`
  (`Mathlib/Algebra/Homology/ComplexShapeSigns.lean`).
- `CochainComplex.linearHomComplex` and its differential `CochainComplex.HomComplex.δ`, with
  `δ(f) = d f − (−1)^{|f|} f d` (`Mathlib/Algebra/Homology/HomotopyCategory/HomComplex.lean`);
  the shift `CochainComplex.shiftFunctor`, with `X⟦a⟧^p = X^{p+a}` and differential `(−1)^a d`
  (`Mathlib/Algebra/Homology/HomotopyCategory/Shift.lean`); `HomotopyCategory` with its
  pretriangulated and triangulated structures.
- `CategoryTheory.EnrichedCategory`, `CategoryTheory.EnrichedFunctor`,
  `CategoryTheory.ForgetEnrichment`, `CategoryTheory.TransportEnrichment` and
  `CategoryTheory.EnrichedCategory.opposite` (for a braided base).
- `CategoryTheory.GradedObject`, `TensorProduct.gradedComm`, `GradedTensorProduct`,
  `DirectSum.Decomposition`, `MultilinearMap`, `TensorAlgebra`, `RingQuot`, `ExteriorAlgebra`.
-  `MorphismProperty.Localization`, `CategoryTheory.Functor.IsLocalization`, `DerivedCategory`,
  `QuasiIso`, `CategoryTheory.Pretriangulated`, `CategoryTheory.IsTriangulated`, triangulated
  subcategories (`CategoryTheory.ObjectProperty.IsTriangulated`) with `ObjectProperty.trW` (Verdier
  localization) and `ObjectProperty.triangEnvelope` (thick closure),
  `CategoryTheory.Idempotents.Karoubi`, and `CategoryTheory.Abelian.Ext` with its composition.

### From Tau Ceti

Paths are under `TauCeti/`. Every declaration below is proved in Tau Ceti.

-  **Graded modules and signs** (`Algebra/Module/GradedModule/`, `LinearAlgebra/Graded/`):
  `TauCeti.InternalGrading` (a family of submodules forming an internal direct sum, over a
  semiring), `TauCeti.InternalGrading.shift`, `TauCeti.InternalGrading.koszulTwist`,
  `TauCeti.InternalGrading.tensorProduct`, `TauCeti.InternalGrading.dual`,
  `TauCeti.InternalGrading.signedDualDistribEquiv` (finite projective modules),
  `TauCeti.InternalGrading.opposite`, `TauCeti.InternalGrading.directSum`,
  `TauCeti.InternalGrading.toGradedObject`, `TauCeti.InternalGrading.ofGradedObject`,
  `TauCeti.InternalGrading.totalIso`, `TauCeti.InternalGrading.tensorProductGradedObjectIso`,
  `TauCeti.LinearMap.IsHomogeneous` with `TauCeti.LinearMap.isHomogeneous_def`,
  `TauCeti.MultilinearMap.IsHomogeneous`, `TauCeti.InternalGrading.signedCompMultilinearMap` with
  its evaluation lemma giving the substitution sign; `TauCeti.GradedLinearQuiver` with
  `TauCeti.GradedLinearQuiver.pathOperationEquiv` and
  `TauCeti.GradedLinearQuiver.pathSuspensionEquiv`.
- **Tensor coalgebras** (`LinearAlgebra/TensorCoalgebra/`): `TauCeti.ReducedTensorWords` with
  `TauCeti.ReducedTensorWords.deconcatenation`, `TauCeti.ReducedTensorWords.filtration`,
  `TauCeti.ReducedTensorWords.IsGradedCoderivation`, `TauCeti.ReducedTensorWords.gradedCoderiv`,
  `TauCeti.ReducedTensorWords.gradedCoderivEquivTaylor`,
  `TauCeti.ReducedTensorWords.coalgHomEquivTaylor`, `TauCeti.ReducedTensorWords.brace`,
  `TauCeti.ReducedTensorWords.gerstenhaberBracket`,
  `TauCeti.ReducedTensorWords.gradedCoderiv_comp_self_eq_zero_iff` (for odd degree, square zero
  is the brace equation); `TauCeti.TensorWords` (a Mathlib `Coalgebra`) with
  `TauCeti.TensorWords.coaugmentation` and `TauCeti.TensorWords.gradedCoderivEquivTaylor`;
  `TauCeti.CompletedTensorWords`, `TauCeti.CompletedReducedTensorWords`.
- **Cochain complexes** (`Algebra/Homology/Monoidal/Braiding.lean`,
  `Algebra/Homology/LinearHomComplex/`): `TauCeti.koszulBraidedCategory`,
  `TauCeti.koszulSymmetricCategory` (the braiding with sign `(−1)^{pq}`, for `k : Type v` and
  `ModuleCat.{v} k`), `TauCeti.linearHomComplexComp`, `TauCeti.linearHomComplexEnrichedComp`,
  `TauCeti.linearHomComplexEnrichedCategory`, `TauCeti.forget₂LinearHomComplexIso`.
- **Suspension and Stasheff identities** (`Algebra/Homology/AInfinity/{Stasheff,Coderivation,
  Algebra}.lean`): `TauCeti.AInfinity.IsSuspension`, `TauCeti.AInfinity.suspensionTaylor`,
  `TauCeti.AInfinity.desuspension`, `TauCeti.AInfinity.suspensionTaylor_desuspension`,
  `TauCeti.AInfinity.stasheffSum`,
  `TauCeti.AInfinity.IsSuspension.comp_self_eq_zero_iff_forall_stasheffSum_eq_zero`,
  `TauCeti.AInfinity.IsSuspension.taylorComponent_comp_self_one_eq_zero_iff` and its analogues
  in arities two to four, `TauCeti.AInfinity.stasheffSum_three_eq_zero_iff_of_m_three_eq_zero`,
  `TauCeti.AInfinity.stasheffSum_four_eq_zero_of_m_three_eq_zero_of_m_four_eq_zero`.
-  **`A∞` algebras** (`Algebra/Homology/AInfinity/Algebra*`): `TauCeti.AInfinityAlgebra` (over a
  commutative ring; nonunital and uncurved, storing the operations and the suspended Taylor map with
  `b² = 0`), `TauCeti.AInfinityAlgebra.stasheff`,
  `TauCeti.AInfinityAlgebra.barDifferential_sq_iff_stasheff`,
  `TauCeti.AInfinityAlgebra.stasheff_arity_one`, `TauCeti.AInfinityAlgebra.stasheff_arity_two`,
  `TauCeti.AInfinityAlgebra.stasheff_arity_three`, `TauCeti.AInfinityAlgebra.stasheff_arity_four`
  (homogeneous inputs except the last), `TauCeti.AInfinityAlgebra.m_one_m_two`,
  `TauCeti.AInfinityAlgebra.m_one_m_three`,
  `TauCeti.AInfinityAlgebra.m_two_assoc_of_m_three_eq_zero`, `TauCeti.AInfinityAlgebra.ofStasheff`,
  `TauCeti.AInfinityAlgebra.ofTaylor`, `TauCeti.AInfinityAlgebra.ofTaylor_self`,
  `TauCeti.AInfinityAlgebra.StrictUnit`, `TauCeti.AInfinityAlgebra.StrictUnit.eq`,
  `TauCeti.AInfinityAlgebra.StrictUnit.taylor_of_two_unit_left`,
  `TauCeti.AInfinityAlgebra.StrictUnit.taylor_of_two_unit_right`,
  `TauCeti.AInfinityAlgebra.CohomologicalUnit`, `TauCeti.AInfinityAlgebra.CohomologicallyUnital`,
  `TauCeti.AInfinityAlgebra.StrictUnit.cohomologicalUnit`, `TauCeti.AInfinityAlgebra.Augmentation`
  (an augmentation to the ground ring, with its strict unit),
  `TauCeti.AInfinityAlgebra.Augmentation.reducedAlgebra`, `TauCeti.AInfinityAlgebra.op`,
  `TauCeti.AInfinityAlgebra.coaugmentedBarDifferential`,
  `TauCeti.AInfinityAlgebra.completedBarDifferential` (bounded arity),
  `TauCeti.AInfinityAlgebra.brace_taylor_taylor`, `TauCeti.AInfinityAlgebra.eq_toAInfinityAlgebra`;
  the DG comparison `TauCeti.IsNonUnitalDGAlgebra.toAInfinityAlgebra`,
  `TauCeti.IsDGAlgebra.strictUnit_one`, `TauCeti.DGAlgHom.toAInfinityStrictUnitalHom`.
- **`A∞` morphisms** (`Algebra/Homology/AInfinity/Algebra/Hom/`): `TauCeti.AInfinityHom`,
  `TauCeti.AInfinityHom.component`, `TauCeti.AInfinityHom.id`, `TauCeti.AInfinityHom.comp`,
  `TauCeti.AInfinityHom.IsStrict`, `TauCeti.AInfinityStrictHom`,
  `TauCeti.AInfinityHom.IsStrictlyUnital`, `TauCeti.AInfinityHom.IsQuasiIso` (bijective on the
  total cohomology of `m₁`), `TauCeti.AInfinityHom.IsIso`,
  `TauCeti.AInfinityHom.isIso_iff_linearPart_bijective`, `TauCeti.AInfinityHom.Homotopy`
  (Keller's homotopy, with `TauCeti.AInfinityHom.Homotopy.compLeft` and
  `TauCeti.AInfinityHom.Homotopy.compRight`; symmetry and transitivity are not assumed),
  `TauCeti.AInfinityHom.Homotopy.cohomologyMap_eq` (homotopic morphisms induce the same map on
  cohomology), `TauCeti.AInfinityHom.IsQuasiIso.isIso` (between minimal algebras),
  `TauCeti.AInfinityHom.reducedTransformationComplex`.
- **`A∞` categories** (`CategoryTheory/AInfinity/`): `TauCeti.AInfinityCategory`,
  `TauCeti.AInfinityFunctor`, `TauCeti.AInfinityStrictFunctor`,
  `TauCeti.AInfinityCategory.StrictUnit`, `TauCeti.AInfinityCategory.StrictlyUnital`,
  `TauCeti.AInfinityCategory.CohomologicalUnits`,
  `TauCeti.AInfinityCategory.CohomologicallyUnital`, `TauCeti.AInfinityHomotopyCategory`,
  `TauCeti.AInfinityFunctor.IsUnital`, `TauCeti.AInfinityFunctor.IsQuasiFullyFaithful`,
  `TauCeti.AInfinityFunctor.IsQuasiEquivalence` (into a cohomologically unital category),
  `TauCeti.AInfinityFunctor.IsQuasiEquivalence.isEquivalence_mapHomotopyCategory`,
  `TauCeti.AInfinityCategory.fullSubcategory`, `TauCeti.AInfinityCategory.op`,
  `TauCeti.AInfinitySingleObj`, `TauCeti.DGCategory.toAInfinityCategory`,
  `TauCeti.AInfinityCategory.AsDGCategory` (vanishing `m₃` and degree-zero identities for `m₂`).
- **`A∞` modules and bimodules** (`Algebra/Homology/AInfinity/{Module/Right,Bimodule}/`):
  `TauCeti.AInfinityRightModule`, `TauCeti.AInfinityRightModule.stasheff`,
  `TauCeti.AInfinityRightModuleHom`, `TauCeti.AInfinityRightModuleHom.Homotopy`,
  `TauCeti.AInfinityRightModuleHom.IsQuasiIso`, `TauCeti.AInfinityRightModuleCat`,
  `TauCeti.AInfinityRightModuleCat.instDGCategory` (one universe),
  `TauCeti.AInfinityRightModuleCat.restrictScalarsDGFunctor`,
  `TauCeti.AInfinityAlgebra.toRightModule`, `TauCeti.AInfinityRightModule.yonedaHomotopyEquiv`
  (a strict unit acting as right unit), `TauCeti.AInfinityBimodule`,
  `TauCeti.AInfinityBimoduleHom`, `TauCeti.AInfinityAlgebra.toBimodule`.
- **DG algebras, categories and modules** (`Algebra/Homology/DG/`, `CategoryTheory/DG/`):
  `TauCeti.IsDGAlgebra`, `TauCeti.IsNonUnitalDGAlgebra`, `TauCeti.DGAlgHom`,
  `TauCeti.NonUnitalDGAlgHom`, `TauCeti.DGAlgAugmentation`, `TauCeti.IsDGAlgebra.Cohomology`,
  `TauCeti.DGAlgHom.cohomologyMap`, `TauCeti.IsDGAlgebra.gradedOpposite`,
  `TauCeti.isDGAlgebra_gradedTensorGrading`, `TauCeti.dgTensorDifferential_tmul_of_mem`,
  `TauCeti.isDGAlgebra_zero`, `TauCeti.DGEnd`, `TauCeti.DGEnd.isDGAlgebra`; `TauCeti.DGCategory`
  (Mathlib enrichment over `CochainComplex (ModuleCat.{v} k) ℤ`), `TauCeti.DGHom`,
  `TauCeti.dgComp`, `TauCeti.dgId`, `TauCeti.dgDifferential`, `TauCeti.dgDifferential_dgComp`,
  `TauCeti.DGCategoryData.equivDGCategory`, `TauCeti.DGCategoryData.ofKeller`,
  `TauCeti.dgClosedHomEquiv`, `TauCeti.DGHomotopyCategory`, `TauCeti.dgClosedToHomotopy`,
  `TauCeti.homotopyCategoryToDGHomotopyCategory`, `TauCeti.DGFunctor`,
  `TauCeti.DGFunctor.instDGCategory` (source in the universe of `k`), `TauCeti.DGNatTrans`,
  `TauCeti.dgComp_op`, `TauCeti.tensorEnrichedCategory`, `TauCeti.dgComp_dgTensorHom`,
  `TauCeti.DGFullSubcategory`, `CategoryTheory.EnrichedFunctor.IsQuasiFullyFaithful`,
  `CategoryTheory.EnrichedFunctor.IsQuasiEquivalence`,
  `CategoryTheory.EnrichedFunctor.IsQuasiEquivalence.isEquivalence_mapDGHomotopyCategory`;
  `TauCeti.IsDGRightModule`, `TauCeti.IsDGLeftModule`, `TauCeti.IsDGBimodule`,
  `TauCeti.DGRightModuleCat`, `TauCeti.DGBimoduleCat` with their DG categories
  `TauCeti.DGRightModuleCat.instDGCategory` and `TauCeti.DGBimoduleCat.instDGCategory` (one
  universe), `TauCeti.DGRightModuleCat.restrictScalars`, `TauCeti.DGRightModuleCat.extendScalars`,
  `TauCeti.DGRightModuleCat.extendRestrictScalarsAdj`, `TauCeti.DGBimoduleCat.tensorObj`,
  `TauCeti.DGRightModuleCat.tensorBimoduleFunctor`, `TauCeti.DGBimoduleCat.internalHomFunctor`,
  `TauCeti.DGBimoduleCat.tensorInternalHomAdjunction`, `TauCeti.DGBimoduleCat.tensorAssoc`,
  `TauCeti.DGBimoduleCat.tensorAssoc_pentagon`, `TauCeti.DGBimoduleCat.instMonoidalCategory`,
  `TauCeti.DGRightModuleCat.quasiIsos`, `TauCeti.CurvedDGRightModuleCat.homotopyIsTriangulated`,
  `TauCeti.CurvedDGRightModuleCat.CoderivedCategory`; `TauCeti.dgRepresentable`,
  `TauCeti.dgRepresentableHomIso`, `TauCeti.dgYoneda`, `TauCeti.isQuasiFullyFaithful_dgYoneda`,
  `TauCeti.dgYonedaEmbedding`, `TauCeti.isQuasiFullyFaithful_dgYonedaEmbedding`,
  `TauCeti.dgYonedaIso`, `TauCeti.DGSingleObj`, `TauCeti.DGSingleObj.dgHomEquiv_dgComp`,
  `TauCeti.DGSingleObj.dgEndAlgEquiv`, `TauCeti.DGRightModuleCat.singleObjFunctor` (full and
  faithful), `TauCeti.DGRightModuleCat.leftDegreeZeroEquivalence`.
- **Shift closure and twisted objects** (`CategoryTheory/DG/{ShiftClosure,AdditiveClosure,
  Twisted}/`): `TauCeti.DGShiftClosure`, `TauCeti.DGShiftClosure.shiftCochainEquiv_v`,
  `TauCeti.DGShiftClosure.dgHomEquiv_dgDifferential`, `TauCeti.DGShiftClosure.dgHomEquiv_dgComp`,
  `TauCeti.DGShiftClosure.dgHomEquiv_negOnePow_smul_dgComp`, `TauCeti.DGAdditiveClosure`,
  `TauCeti.DGTwistedObject` (twisting matrix with `dδ + δ ∘ δ = 0` in Keller's order),
  `TauCeti.DGTwistedObject.dgDifferential_twist_add_negOnePow_smul_dgComp_eq_zero`,
  `TauCeti.DGTwistedObject.IsOneSided`, `TauCeti.DGTwistedObject.dgHomEquiv_dgDifferential`,
  `TauCeti.DGTwistedObject.shiftFunctor`, `TauCeti.DGTwistedObject.cone`,
  `TauCeti.DGTwistedObject.coneTriangle`,
  `TauCeti.DGTwistedObject.coneTriangle_mem_distinguishedTriangles`,
  `TauCeti.DGTwistedObject.isZero_of_cone_dgId`, `TauCeti.DGTwistedObject.cone_zero`,
  `TauCeti.DGTwistedObject.pretriangulated`, `TauCeti.DGTwistedObject.isTriangulated`,
  `TauCeti.DGTwistedObject.oneSided`, `TauCeti.DGTwistedObject.isTriangulated_oneSided`,
  `TauCeti.DGTwistedObject.isLeast_isoClosure_oneSided`,
  `CategoryTheory.EnrichedFunctor.mapDGTwistedComplex`,
  `CategoryTheory.EnrichedFunctor.oneSided_mapDGHomotopyCategory_obj`.
- **Contractions and transfer** (`Algebra/Homology/Contraction/`,
  `Algebra/Homology/AInfinity/Algebra/Transfer/`, `CategoryTheory/AInfinity/Transfer/`,
  `Algebra/Homology/AInfinity/Module/Right/`): `TauCeti.LinearContraction`,
  `TauCeti.LinearSpecialContraction`, `TauCeti.LinearContraction.normalize`, `TauCeti.Contraction`,
  `TauCeti.SpecialContraction`, `TauCeti.InternalGrading.homologyContraction` (over a division
  ring), `TauCeti.LinearSpecialContraction.perturb`,
  `TauCeti.LinearSpecialContraction.isUnit_one_add_mul_homotopy_of_isCompleteFiltration`,
  `TauCeti.LinearSpecialContraction.perturbationSeries_apply_sub_sum_mem`,
  `TauCeti.LinearSpecialContraction.map_perturb_homotopy_le`; `TauCeti.AInfinityAlgebra.transfer`
  (over a commutative ring, for a special contraction with `i`, `p` of degree zero and `h` of
  degree `−1`), `TauCeti.AInfinityAlgebra.transferInclusion`,
  `TauCeti.AInfinityAlgebra.transferProjection`, `TauCeti.AInfinityAlgebra.transferHomotopy`,
  `TauCeti.AInfinityAlgebra.transferStrictHom`, `TauCeti.AInfinityAlgebra.mul_transfer`,
  `TauCeti.AInfinityAlgebra.m_three_transfer`; over a field `TauCeti.AInfinityAlgebra.minimalModel`,
  `TauCeti.AInfinityAlgebra.minimalModel_m_two`, `TauCeti.AInfinityAlgebra.minimalModelInclusion`,
  `TauCeti.AInfinityAlgebra.minimalModelProjection`,
  `TauCeti.AInfinityAlgebra.isIso_minimalModelProjection_comp`,
  `TauCeti.AInfinityAlgebra.isIso_comp_minimalModelInclusion`,
  `TauCeti.AInfinityCategory.transfer`, `TauCeti.AInfinityCategory.minimalModel`,
  `TauCeti.AInfinityCategory.transferInclusion`,
  `TauCeti.AInfinityCategory.isQuasiEquivalence_transferInclusion`,
  `TauCeti.AInfinityRightModule.transfer`, `TauCeti.AInfinityRightModule.minimalModel`,
  `TauCeti.AInfinityRightModule.minimalModelInclusion`,
  `TauCeti.AInfinityRightModule.minimalModelProjection`; the example
  `TauCeti.HeisenbergDGA.contraction`, `TauCeti.HeisenbergDGA.minimalModel_m_three`,
  `TauCeti.HeisenbergDGA.minimalModel_m_three_ne_zero` (nontrivial ring),
  `TauCeti.HeisenbergDGA.minimalModel_m_three_mem_tripleMasseyProduct`.
- **Minimality, formality, Maurer–Cartan and gauge** (`Algebra/Homology/AInfinity/Algebra/`):
  `TauCeti.AInfinityAlgebra.IsMinimal`, `TauCeti.AInfinityAlgebra.IsFormal` (a quasi-isomorphism
  to the cohomology algebra), `TauCeti.AInfinityAlgebra.cohomologyAInfinityAlgebra`,
  `TauCeti.AInfinityAlgebra.IsFormal.of_isQuasiIso`, `TauCeti.AInfinityAlgebra.IsMinimal.isFormal`,
  `TauCeti.AInfinityAlgebra.IsIntrinsicallyFormal`, `TauCeti.AInfinityAlgebra.IsMaurerCartan`
  (arity-nilpotent regime), `TauCeti.AInfinityAlgebra.maurerCartanSum`,
  `TauCeti.AInfinityAlgebra.isMaurerCartan_iff_taylor`,
  `TauCeti.IsNonUnitalDGAlgebra.isMaurerCartan_toAInfinityAlgebra_iff`,
  `TauCeti.IsNonUnitalDGAlgebra.isMaurerCartan_toAInfinityAlgebra_neg_iff`,
  `TauCeti.AInfinityAlgebra.gauge`, `TauCeti.AInfinityAlgebra.expHom` (over a `ℚ`-algebra).
-  **Hochschild theory, deformations, Massey products** (`Algebra/Homology/AInfinity/Algebra/`,
  `CategoryTheory/AInfinity/Hochschild/`): `TauCeti.AInfinityAlgebra.hochschildDifferential`,
  `TauCeti.AInfinityAlgebra.hochschildDifferential_hochschildDifferential`,
  `TauCeti.AInfinityAlgebra.PositiveHochschild.cochains`,
  `TauCeti.AInfinityAlgebra.PositiveHochschild.complex`,
  `TauCeti.AInfinityAlgebra.PositiveHochschild.bracket`,
  `TauCeti.AInfinityAlgebra.PositiveHochschild.Cohomology`,
  `TauCeti.AInfinityAlgebra.PositiveHochschild.cohomologyBracket`,
  `TauCeti.AInfinityAlgebra.PositiveHochschild.normalizedComplex`,
  `TauCeti.AInfinityAlgebra.PositiveHochschild.normalizedComplexι`,
  `TauCeti.AInfinityCategory.PositiveHochschild.complex`,
  `TauCeti.AInfinityAlgebra.hochschildDifferential_taylor_sub_taylor`,
  `TauCeti.AInfinityAlgebra.IsDeformationOfOrder`, `TauCeti.AInfinityAlgebra.IsFormalDeformation`,
  `TauCeti.AInfinityAlgebra.IsDeformationOfOrder.obstructionClass`,
  `TauCeti.AInfinityAlgebra.IsDeformationOfOrder.obstructionClass_eq_zero_iff`,
  `TauCeti.AInfinityAlgebra.IsDeformationOfOrder.exists_isFormalDeformation`,
  `TauCeti.AInfinityAlgebra.TripleMasseyDefiningSystem`,
  `TauCeti.AInfinityAlgebra.tripleMasseyProduct`,
  `TauCeti.AInfinityAlgebra.tripleMasseyIndeterminacy`,
  `TauCeti.AInfinityAlgebra.tripleMasseyProduct_nonempty_iff`,
  `TauCeti.AInfinityAlgebra.minimalModel_m_three_mem_tripleMasseyProduct` (over a field),
  `TauCeti.AInfinityAlgebra.mem_tripleMasseyProduct_iff_sub_minimalModel_m_three_mem`,
  `TauCeti.AInfinityAlgebra.obstruction`,
  `TauCeti.AInfinityAlgebra.hochschildDifferential_obstruction`,
  `TauCeti.AInfinityAlgebra.IsMinimal.taylor_gauge_apply_eq_of_hochschildDifferential`,
  `TauCeti.AInfinityAlgebra.HochschildVanishesAt` (arity `n`, internal degree `2 − n`,
  unnormalized), `TauCeti.AInfinityAlgebra.IsMinimal.exists_isIso_of_forall_hochschildVanishesAt`
  (over a commutative ring),
  `TauCeti.AInfinityAlgebra.isIntrinsicallyFormal_of_forall_hochschildVanishesAt` (over a field),
  `TauCeti.AInfinityAlgebra.IsMinimal.exists_hochschildDifferential_eq_obstruction_of_isIso` and
  `TauCeti.AInfinityAlgebra.IsMinimal.not_isFormal_of_not_exists_hochschildDifferential_eq_obstruction`
  (over a `ℚ`-algebra, for a minimal algebra with the grading and product of `H` and vanishing
  `m₃, …, m_{n+1}`).
-  **Grothendieck groups, Euler forms and quivers**: `TauCeti.TriangulatedK0`,
  `TauCeti.TriangulatedK0.mapEquiv`, `TauCeti.TriangulatedK0.of_shift`,
  `TauCeti.TriangulatedK0.BiadditiveInvariant.bilift`
  (`CategoryTheory/GrothendieckGroup/Triangulated.lean`); `TauCeti.leftRadical`,
  `TauCeti.rightRadical`, `TauCeti.LeftNumericalQuotient`, `TauCeti.RightNumericalQuotient`,
  `TauCeti.numericalPairing_nondegenerate` (`LinearAlgebra/SesquilinearForm/NumericalQuotient/`);
  `TauCeti.eulerForm`, `TauCeti.titsForm`, `TauCeti.titsPolarForm`
  (`RepresentationTheory/Quiver/EulerForm.lean`, a finite quiver),
  `TauCeti.eulerForm_dimVector_indecProjRep_eq_finrank_hom`,
  `TauCeti.eulerForm_dimVector_indecProjRep_indecProjRep`,
  `TauCeti.eulerForm_dimVector_indecProjRep_indecInjRep`, `TauCeti.extEuler_eq_eulerForm_dimVector`
  (representations, that is left modules over the path algebra);
  `DerivedCategory.Bounded.perfect_iff` (`Algebra/Homology/DerivedCategory/Perfect.lean`).
- **Path algebras, Ginzburg algebras and linear resolutions**:
  `TauCeti.PathAlgebra.exact_arrowTensorDifferential_vertexTensorMul` (the projective bimodule
  resolution of a path algebra), `TauCeti.finrank_ext_dualNumberResidue`,
  `TauCeti.PathAlgebra.quadraticOrthogonal`, `TauCeti.PathAlgebra.quadraticDual` (right-dual
  convention), `TauCeti.PathAlgebra.quadraticOrthogonal_quadraticOrthogonal` (over a field, for a
  finite quiver), `TauCeti.ginzburgTwoAdamsDegree`, `TauCeti.GradedProjectiveResolution`,
  `TauCeti.GradedProjectiveResolution.IsLinear`,
  `TauCeti.GradedProjectiveResolution.IsLinear.subsingleton_ext_of_ne`,
  `TauCeti.GradedProjectiveResolution.IsMinimal.isLinear_iff_subsingleton_ext` (left modules).

### From TauCetiRoadmap.GrothendieckEulerForms

Conventions (Smallness): categorical Grothendieck groups of essentially small categories through
a skeleton and shrink; §2.4: triangulated `K₀` with `[X[n]] = (−1)^n [X]`; §3.7: linear graded
projective resolutions and both directions of the diagonal Ext criterion; §4.4: finite projective
resolutions and the Cartan map for finite global dimension; §§5.1–5.6: finite-support Euler sums,
Ext-Euler descent and its projective form; §§7.1–7.2: left and right radicals and numerical
quotients.

## References

- Ezra Getzler and J. D. S. Jones, [“A-infinity algebras and the cyclic bar
  complex,”](https://projecteuclid.org/journals/illinois-journal-of-mathematics/volume-34/issue-2/A-infinity-algebras-and-the-cyclic-bar-complex/ijm/1255988268.full)
  *Illinois Journal of Mathematics* 34 (1990), 256--283: suspended bar convention, coderivations,
  signs, braces, and cyclic/Hochschild constructions.
- Bernhard Keller, [“Introduction to A-infinity algebras and
  modules,”](https://webusers.imj-prg.fr/~bernhard.keller/publ/ioan.pdf) *Homology, Homotopy and
  Applications* 3 (2001), 1--35: Sections 3.1--3.6 (the pinned operations, arity identities,
  morphisms, strict units, minimal models, bar construction), Sections 4--5 (modules and derived
  modules), and Section 7 (categories and twisted objects).
- Bernhard Keller, [“A-infinity algebras, modules and functor
  categories,”](https://webusers.imj-prg.fr/~bernhard.keller/publ/ainffun.pdf), in *Trends in
  Representation Theory of Algebras and Related Topics*, Contemporary Mathematics 406 (2006),
  67--93: Theorem 2.3 and Proposition 2.4 (minimal models and algebra unit strictification),
  Sections 4.3--4.8
  (bar--cobar, DG envelopes, modules), and Section 5 (functor cocategories).
- Tornike Kadeishvili, “The algebraic structure in the homology of an `A(∞)`-algebra,”
  *Soobshch. Akad. Nauk Gruzin. SSR* 108 (1982), 249--252; and “The structure of the
  `A(∞)`-algebra, and the Hochschild and Harrison cohomologies,” *Trudy Tbiliss. Mat. Inst.* 91
  (1988), 19--27: minimal models, uniqueness, obstruction theory, and intrinsic formality.
- V. K. A. M. Gugenheim, L. A. Lambe, and J. D. Stasheff, “Perturbation theory in differential
  homological algebra II,” *Illinois Journal of Mathematics* 35 (1991), 357--373: complete
  filtered perturbation and transfer.
- S. A. Merkulov, [“Strongly homotopy algebras of a Kähler
  manifold,”](https://doi.org/10.1155/S1073792899000070) *International Mathematics Research
  Notices* 1999 (3), 153--164: explicit recursively transferred higher products.
- Volodymyr Lyubashenko, [“Category of A-infinity-categories,”](https://www2.math.ethz.ch/EMIS/journals/HHA/volumes/2003/n1a1/v5n1a1.pdf)
  *Homology, Homotopy and Applications* 5 (2003), 1--48: functors, transformations, functor
  categories, and unital variants.
- Bernhard Keller, [“Deriving DG
  categories,”](https://webusers.imj-prg.fr/~bernhard.keller/publ/deriving.pdf) *Annales
  scientifiques de l'École Normale Supérieure* 27 (1994), 63--102: DG modules, compact
  generation, perfect objects, tensor/Hom, and derived Morita theory.
- Bernhard Keller, [“On differential graded
  categories,”](https://arxiv.org/abs/math/0601185), in *International Congress of
  Mathematicians, Madrid 2006*, Volume II, 151--190: smooth/proper DG categories, Morita theory,
  localization, and Hochschild invariants.
- Vladimir Drinfeld, [“DG quotients of DG
  categories,”](https://arxiv.org/abs/math/0210114) *Journal of Algebra* 272 (2004), 643--691:
  Sections 1--3 for quotient definitions, universal property, twisted envelopes, exact flatness
  hypotheses, and Verdier comparison.
- Volodymyr Lyubashenko and Sergiy Ovsienko, [“A construction of quotient
  A-infinity-categories,”](https://arxiv.org/abs/math/0211037) *Homology, Homotopy and
  Applications* 8 (2006), 157--203; Volodymyr Lyubashenko and Oleksandr Manzyuk,
  [“Quotients of unital A-infinity-categories,”](https://arxiv.org/abs/math/0306018) *Theory and
  Applications of Categories* 20 (2008), 405--496: nonunital and unital `A∞` quotients (numbered
  as in arXiv v5 of each).
- Volodymyr Lyubashenko and Oleksandr Manzyuk, [“A-infinity-bimodules and Serre
  A-infinity-functors,”](https://arxiv.org/abs/math/0701165), in *Geometry and Dynamics of Groups
  and Spaces*, Progress in Mathematics 265 (2008), 565--645: `A∞` bimodules, Yoneda, and Serre
  `A∞` functors.
- Alexander Bondal and Mikhail Kapranov, “Enhanced triangulated categories,” *Mathematics of the
  USSR-Sbornik* 70 (1991), 93--107, and [“Representable functors, Serre functors, and
  mutations,”](https://doi.org/10.1070/IM1990v035n03ABEH000716) *Mathematics of the USSR-Izvestiya*
  35 (1990), 519--541: twisted/pretriangulated envelopes and Serre functors.
- Bertrand Toën, [“The homotopy theory of dg-categories and derived Morita
  theory,”](https://arxiv.org/abs/math/0408337) *Inventiones Mathematicae* 167 (2007), 615--667:
  quasi-functors, bimodule mapping objects, internal Homs, localization, and Morita theory.
- Jean-Louis Loday and Bruno Vallette, *Algebraic Operads*, Grundlehren der mathematischen
  Wissenschaften 346, Springer (2012), Chapters 9--10: bar--cobar constructions, twisting
  morphisms, homotopy transfer, and operadic Koszul duality.
- Murray Gerstenhaber, “On the deformation of rings and algebras,” *Annals of Mathematics* 79
  (1964), 59--103: Hochschild brackets, infinitesimal deformations, and obstructions; J. Peter May,
  “Matric Massey products,” *Journal of Algebra* 12 (1969), 533--568: defining systems and
  indeterminacy.
- Ezra Getzler, [“Lie theory for nilpotent
  L-infinity algebras,”](https://annals.math.princeton.edu/2009/170-1/p04) *Annals of Mathematics*
  170 (2009), 271--301: nilpotent Maurer--Cartan simplicial sets and gauge theory.
- Bernhard Keller, [“Deformed Calabi--Yau completions,”](https://arxiv.org/abs/0908.3499)
  *Journal für die reine und angewandte Mathematik* 654 (2011), 125--180, Sections 4--5: the
  tensor-algebra completion `Π_n(A)=T_A(θ_A[n-1])`, its bimodule Calabi--Yau structure, and the
  deformation by a Hochschild class.
- Dmytro Shklyarov, [“Hirzebruch--Riemann--Roch theorem for DG
  algebras,”](https://arxiv.org/abs/0710.1937) *Proceedings of the London Mathematical Society*
  106 (2013), 1--32: proper DG algebras, perfect-module Chern characters, HRR, and
  nondegeneracy of the Hochschild pairing under smoothness.
- Christopher Brav and Tobias Dyckerhoff, [“Relative Calabi--Yau
  structures,”](https://arxiv.org/abs/1606.00619) *Compositio Mathematica* 155 (2019), 372--412:
  smooth/proper duality and Hochschild versus negative-cyclic Calabi--Yau structures.
- Paul Balmer and Marco Schlichting, “Idempotent completion of triangulated categories,”
  *Journal of Algebra* 236 (2001), 819--834; Marco Schlichting, “Negative K-theory of derived
  categories,” *Mathematische Zeitschrift* 253 (2006), 97--134: Karoubi envelopes and the
  localization correction beyond `K₀`.
- Robert W. Thomason, “The classification of triangulated subcategories,” *Compositio
  Mathematica* 105 (1997), 1--27: dense triangulated subcategories and the `K₀` boundary.
- Sunil K. Chebolu, [“Refining thick subcategory
  theorems,”](https://arxiv.org/abs/math/0508101) *Fundamenta Mathematicae* 189 (2006), 61--97:
  the `K₀` sequence of a Verdier quotient by a thick subcategory (sequence (3), p. 10 of the arXiv
  version, citing Grothendieck, SGA 5).
- Alexander Beilinson, Victor Ginzburg, and Wolfgang Soergel, [“Koszul duality patterns in
  representation theory,”](https://www.ams.org/journals/jams/1996-9-02/S0894-0347-96-00192-0/)
  *Journal of the American Mathematical Society* 9 (1996), 473--527, Section 2: quadratic Koszul
  rings, diagonal Ext, dual Koszulity, and locally finite double duality.
- Leonid Positselski, [*Two Kinds of Derived Categories, Koszul Duality, and
  Comodule-Contramodule Correspondence*](https://bookstore.ams.org/memo-212-996), Memoirs of the
  American Mathematical Society 212, no. 996 (2011), Chapter 6 and Appendices A--B: conilpotent
  and nonconilpotent Koszul duality, second-kind derived categories, homogeneous Koszul duality,
  and DG bar--cobar duality.
