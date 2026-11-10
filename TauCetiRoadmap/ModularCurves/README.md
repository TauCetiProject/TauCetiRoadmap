# Roadmap: modular curves and the moduli of elliptic curves with level structure

This roadmap formalises the moduli of elliptic curves with level structure over an arbitrary base
and the modular curves they define. Its targets are the following.

- **The integral theorems.** The moduli problems `[Γ(N)]`, `[Γ₁(N)]`, balanced `[Γ₁(N)]` and
  `[Γ₀(N)]` are relatively representable over `Ell/ℤ`, finite flat of constant positive rank,
  regular of dimension two, and finite étale after inverting `N`; the quotient problems `[Γ_H]`
  at prime-power level are regular, and the standard quotient identifications hold over `ℤ`.
- **The curves after inverting `N`.** The fine curves `Y₁(N)` and `Y_full(N)` and the twisted
  curve `Y(ρ)`; quotient problems, coarse moduli schemes, the coarse `j`-line and the curves
  `Y_H`; and, for prime `N ≥ 5`, the compactified coarse curves `X_H` over `ℤ[1/N]` with their
  cusps and the Shimura covering.

Statements are cited at the level of individual results. The integral theorems are those of N. Katz
and B. Mazur, *Arithmetic Moduli of Elliptic Curves* (Annals of Mathematics Studies 108, 1985),
abbreviated **KM**, whose result numbers serve as exact locators. The foundations, the curves after
inverting `N` and the compactification are in the literature in other forms as well, and each
section names the further sources which apply to it: the Stacks Project for divisors, quotients and
descent; SGA 1 and D. Rydh's paper on geometric quotients for quotients by finite groups; the draft
*Abelian Varieties* of B. Edixhoven, G. van der Geer and B. Moonen for group schemes, isogenies and
duality over a field; the work of P. Deligne and M. Rapoport, of B. Conrad and of K. Česnavičius on
elliptic curves with level structure in the language of stacks, cusps included; and D. Loeffler's
*Modular Curves* lecture notes for some of the classical constructions over `ℤ[1/N]`. §References
lists them, with the version whose numbering is used.

The layers are ordered by what the targets need, working backwards from them; §Dependency order
and parallel work records the resulting graph. Layers 0–2 are the common foundations: the
scheme-theoretic prerequisites, elliptic curves as group schemes over a base, and isogenies,
duality and the Weil pairing. Layer 3 sets up moduli problems, naive level structures, and
rigidifiers. The curves after inverting `N` need little more: Layers 5 and 6 build the fine and
coarse curves with no regularity theorem, and of the Drinfeld structures of Layer 4 they use only
the comparison with naive structures and the relative representability of `[Γ(N)]`. The integral
theorems need more. Layer 7 studies one elliptic curve at one prime, before any level structure is
imposed. Layer 8 proves the axiomatic theorems, which are statements about any moduli problem
satisfying the axioms, and verifies the axioms for `[Γ(N)]`, `[Γ₁(N)]` and balanced `[Γ₁(N)]`.
The problem `[Γ₀(N)]` follows in Layer 9, because its relative representability rests on the
cyclicity theorem, whose proof uses the regularity of `[Γ₁(pⁿ)]`. Layer 10 compactifies the
coarse curves over `ℤ[1/N]`; it is built on Layers 5 and 6, uses none of the integral theorems,
and no other layer uses it.

`Suggested.lean` accompanies this document. It states the roadmap's headline theorems against
the pinned Mathlib and Tau Ceti, on Tau Ceti's own carriers (elliptic curves over a base and their
torsion, the category `Ell/R` with its moduli problems, the strict henselisation), each with
`sorry`, together with the few definitions those statements need; its module docstring lists the
headline theorems that are not statable at the pins and what each lacks. §Exact supplier
contracts names the library declarations consumed.

## Scope

The roadmap includes:

- elliptic curves as smooth proper commutative group schemes of relative dimension one;
- the low-degree relative cohomology of `𝒪_E(n[0])` and the Picard-theoretic results needed for
  Weierstrass equations and dual isogenies;
- finite locally free subgroup schemes, multiplication maps, isogenies, quotients, dual isogenies,
  degree, and the Weil pairing;
- full sets of sections and Drinfeld level structures over arbitrary bases;
- the category `Ell/R`, relative representability, rigidity, and KM 4.7.0;
- `Y₁(N)` for `N≥4` (at the pin, consumed in Layer 5.1), the full ordered-basis scheme
  `Y_full(N)` for `N≥3`, its fixed-pairing fibres, and the twisted curve `Y(ρ)` for `N≥3`;
- the coarse `j`-line and the coarse modular curve `Y₀(N)`;
- the compactified coarse curves `X_H` over `ℤ[1/N]` (Layer 10): the KM 8.6 normalisation of the
  coarse `j`-line in `Y_H`, the cusps via the Tate parameter (KM 8.11), the ramification table of
  `X₁(N) → X₀(N)` including characteristics `2` and `3`, and the étale Shimura covering;
- the deformation theory needed for KM 5.1.1.

Compactified coarse curves are included **as coarse-curve geometry only**: the compactification is
by normalisation of the coarse `j`-line, with no boundary moduli interpretation, no stacks, and no
generalized elliptic curves; the characteristic-`N` fibres of the compactified curves remain
excluded, as below.

The following topics are not included: generalized elliptic curves, Igusa curves and the
characteristic-`N` compactified geometry (crossings at supersingular points, minimal regular
resolutions — §The Mazur interface names their owner), a general theory of algebraic stacks or algebraic spaces, modular forms and Hecke
operators, Néron models, complex uniformisation, and geometric connectedness or irreducibility of
the fine curves. **One deliberate exception, and it is conditional**: §Layer 5.3 records the *algebraic
reduction* of geometric irreducibility for the twisted curve `Y(ρ)` — smoothness under base change,
and connected-plus-smooth implies irreducible, both at the pinned Tau Ceti — because the FLT interface consumes that statement.
The connectedness input which discharges it is transcendental, is named there as an external
supplier contract, and is not built here; no unconditional irreducibility theorem is asserted for
`Y(ρ)` or for any fine curve. General coherent cohomology, the general Riemann–Roch theorem, and the general
Picard scheme are not reconstructed here. This roadmap consumes the line-bundle,
curve-cohomology, Riemann–Roch, Serre-duality, and cohomology-and-base-change foundations from the
[Jacobian Challenge roadmap](../JacobianChallenge/README.md). It then proves the relative
genus-one consequences needed here. In particular, because the Jacobian Challenge contract
constructs the Picard scheme only for a curve over a field, Layer 2.4 owns, for an elliptic curve
over an arbitrary base, the representability of the degree-zero relative Picard sheaf by the curve
itself and the Poincaré bundle. The relative Picard functor over an arbitrary base, its rigidified
form, its degree-zero subsheaf and the Abel–Jacobi map are Tau Ceti's (§Exact supplier
contracts).

This roadmap owns the scheme-theoretic theory of elliptic curves needed for modular curves.
Equation-level arithmetic is Tau Ceti's and the Elliptic Curves roadmap's. The direct
equation-level inputs here are Tau Ceti's theorem that multiplication by `N` has degree `N²` and
Tau Ceti's equation-level Weil pairing over a separably closed field in which `N` is invertible,
against which the scheme-theoretic pairing is normalised in Layer 2.5 (§Exact supplier contracts).
Layer 2.1 owns the narrow scheme/function-field comparison which transports the first theorem to the
projective model. The broad comparison between arbitrary scheme isogenies and embeddings of
function fields belongs to the Algebraic Curves roadmap.

The exact contracts consumed from the Jacobian Challenge are:

- invertible sheaves, the divisor–line-bundle correspondence, and base change for `𝒪(D)`;
- Riemann–Roch and Serre duality for proper curves over a field;
- proper-flat coherent cohomology, Grauert's theorem, and arbitrary base change.

**These are contracts, and a contract becomes a type-checked boundary exactly when its supplier
is a library at the pin.** `Suggested.lean` imports Mathlib and the individual Tau Ceti modules it
uses, and nothing from another roadmap: the library declarations it rests on are pinned there by
`#check` and listed in §Exact supplier contracts, while the three Jacobian Challenge contracts
above stay prose until their declarations are in the library. A `#check` against names a
supplier has not stated would have to invent them, which is the failure mode this roadmap avoids
everywhere else.

The fppf descent statements for line bundles and the additional scheme data used here are proved
in Layer 0.5 from Tau Ceti's descent library (§Exact supplier contracts); they are not attributed to
the field-valued Picard endpoint of the Jacobian Challenge.

This roadmap retains the relative-curve divisor lemmas that the level-structure theory needs, the explicit computation of
`π_*𝒪_E(n[0])`, the representability of the relative genus-one Picard sheaf and the Poincaré
construction, elliptic autoduality, the
comparison of the two constructions of the dual isogeny, Cartier–Nishi kernel duality, and the Weil
pairing.

The intended homes are

```text
TauCeti/AlgebraicGeometry/EllipticCurve/Scheme/
TauCeti/AlgebraicGeometry/ModularCurve/
```

with reusable material on Cartier divisors, finite group schemes, finite quotients, and descent
placed in the corresponding general Mathlib-style directories.

## Conventions

1. **Elliptic curves.** An elliptic curve over `S` is Tau Ceti's
   `TauCeti.AlgebraicGeometry.EllipticCurveGeom S` (§Exact supplier contracts): a morphism
   `π : E ⟶ S`, smooth and proper of relative dimension one, and a section `0 : S ⟶ E`.
   Zariski-locally on `S`, there must be a pointed isomorphism

   ```text
   (E_U, 0_U) ≅ (projModel W, [0 : 1 : 0])
   ```

   for an elliptic Weierstrass equation `W/U`. Thus the local isomorphism is required to carry
   the distinguished section to the point at infinity. This condition is part of the definition;
   without it the local addition formulae would not glue to a group law with identity `0`.
   The local equations are not stored as part of the object. The canonical commutative group
   structure is the library's instance `EllipticCurveGeom.grpObj` with `isCommMonObj`, whose
   unit is the zero section (`one_left`), and `E.toCommGrp` is the curve as a commutative group
   object of `Over S`. A uniqueness theorem shows that two compatible group structures with the
   same zero section agree.

   **Two spellings of the local condition, proved equivalent.** The record's field is
   `Nonempty (PointedWeierstrassAtlas π 0)`: a covering family of charts
   (`PointedWeierstrassChart`), existence-truncated so that no equation is selected. Layer 1.3's
   Weierstrass-presentation theorem produces such an atlas, and later layers consume it as an
   object they can name and refine, which is why the atlas is the field rather than a bare
   quantifier. Beside it stands the quantifier form the sources use — for every point of `S` an
   affine open `U` containing it, an elliptic Weierstrass curve `W` over `Γ(S, U)`, and an
   isomorphism of the curve over `U` with the projective model of `W` compatible with the
   projection and the zero section. Layer 1.1 proves that the two spellings agree: an atlas gives
   the quantifier form at every point, since the range of an open immersion out of an affine
   scheme is an affine open of `S` and the chart's coefficient ring is carried onto `Γ(S, U)`
   along the chart's identification of its base with a spectrum, and choosing a chart at each
   point assembles an atlas. The quantifier form is the one to read when checking this
   definition against KM 2.2.5–2.2.6 or Deligne–Rapoport II.1.1.

   **The open-immersion field is load-bearing.** A chart's `baseMap` is required to be an open
   immersion, and the atlas's `covers` field asks only for joint surjectivity. Those two together
   are what make the condition *Zariski*-local. Drop the open-immersion requirement and the
   definition still typechecks but states an a-priori weaker étale- or fpqc-local condition; the
   two happen to define the same class here, since `π_*O(3·0)` is locally free of rank three and
   trivialises Zariski-locally, but recovering that would be a descent theorem rather than a
   definition. The quantifier form ranges over the affine opens of `S` directly and so cannot
   express the wrong condition at all.

2. **Group schemes.** Group schemes over `S` are group objects in the cartesian category `Over S`.
   The constant group scheme associated to a finite group and the diagonalizable group scheme
   associated to a finite abelian group are different constructions. In particular,
   `D(ℤ/Nℤ) ≅ μ_N`, while `(ℤ/Nℤ)_S` is a disjoint union of copies of `S`.

3. **Degree.** Finite locally free means finite, flat, and locally of finite presentation; the
   rank of such a morphism is locally constant. An isogeny over an arbitrary base therefore has a
   locally constant degree; it is *of degree `n`* when its kernel has constant finite-flat rank
   `n`. Statements involving a single integer degree either assume constant degree in this sense
   or assume a preconnected base. The trace of an endomorphism is treated in the same way: it is a
   locally constant integer-valued function in general, and a single integer only over a
   preconnected base. Assertions that `[N]` is finite require `[NeZero N]`; `[0]` is not a finite
   isogeny.

4. **Level structures.** The level `N` is always positive, and Lean declarations carry `[NeZero N]`
   when this is not already implied by a numerical bound. Drinfeld structures are the definitions
   used over arbitrary bases. Naive pointwise structures are separate definitions and are compared
   with Drinfeld structures only when `N` is invertible on the base (KM 1.4.4 and §3.7).

5. **Full level and actions.** Ordered bases are written as row vectors. For

   ```text
   g = [[a,b],[c,d]] ∈ GL₂(ℤ/Nℤ),
   ```

   the right action is

   ```text
   (P,Q)g = (aP + cQ, bP + dQ).
   ```

   The full ordered-basis scheme is denoted `Y_full(N)`. Its Weil-pairing determinant takes values
   in `μ_N^prim`. For a chosen primitive root `ζ`, the corresponding fibre is denoted
   `Y(N, ζ)`. Statements about connectedness or irreducibility would concern this fixed-pairing
   fibre, not `Y_full(N)`.

6. **Bases.** The integral level problems are defined over `ℤ`. The ring `ℤ[1/N]` is introduced
   only for naive level structures, étaleness, and the affine fine modular curves. A chosen
   primitive root belongs over `ℤ[1/N, ζ_N]`, or more generally over a base equipped with a
   section of `μ_N^prim`.

7. **References.** Results are cited by their numbers in KM, which serve as exact locators, and by
   the numbers of the further sources named at the end of a section, in the versions listed in
   §References. A further source is cited with its relation to the statement here: the same
   statement, a special case, or a more general one. The order of the layers follows the
   dependencies between the statements, worked backwards from the targets. Statements taken from
   Loeffler's notes rather than directly from KM are identified as such.

8. **Quotients of moduli problems.** The integral Katz–Mazur quotient `P/H`, the objectwise
   orbit presheaf, and a coarse scheme quotient are different objects. The notation `P/H` in
   this roadmap always means the quotient problem characterised by KM 7.1's conditions Q1 and Q2;
   it never means the generally non-sheaf-valued presheaf `T ↦ P(T)/H`.

## Exact supplier contracts

### From Mathlib

The declarations and files listed under §Existing Mathlib and work in progress, consumed by name
there and in the layers. `AlgebraicGeometry.Scheme.Hom.isLocallyConstant_finrank` (finite, flat
and locally of finite presentation give a locally constant rank), Mathlib's relative
normalisation `Scheme.Hom.normalization` with `toNormalization`, `fromNormalization`,
`normalizationDesc` and `normalization.hom_ext` (Layer 10), the group objects `GrpObj`,
`IsCommMonObj` and `IsMonHom` of a cartesian monoidal category with the group structure on
morphisms into a commutative group object (Convention 2 and Layer 2.1), `FormalGroup` (Layer 8.7),
`AlgebraicGeometry.Scheme.fpqcTopology` (file `Mathlib/AlgebraicGeometry/Sites/Fpqc.lean`) with its
instance that the fpqc topology is subcanonical and its instances that a flat surjective morphism
which is quasi-compact, or locally of finite presentation, is an effective epimorphism (Layer 0.5),
and `AlgebraicGeometry.GeometricallyConnected`, every fibre over a field-valued point connected
(Layer 2.4), are consumed as they stand.

### From Tau Ceti

- `WeierstrassCurve.projModel`, `projModelOver`, `projModelZero`, `isProper_projModelOver`,
  `projModelZero_projModelOver` and `projModelVariableChangeIso` (file
  `TauCeti/AlgebraicGeometry/EllipticCurve/Scheme/ProjModel.lean`): the projective Weierstrass
  model of `W : WeierstrassCurve R` over any commutative ring `R`, as the `Proj` of its
  homogeneous coordinate ring, with its structure morphism, its zero section `[0 : 1 : 0]`, its
  properness, and the pointed isomorphism over `Spec R` induced by a change of variables. Layer
  1.1 and Convention 1 are stated on this carrier.
- `WeierstrassCurve.smoothOfRelativeDimension_one_projModelOver` (file `Scheme/Smooth.lean`),
  under `[W.IsElliptic]`, and `WeierstrassCurve.isIntegral_projModel` (file
  `Scheme/Integral.lean`), under `[IsDomain R]` alone: smoothness of relative dimension one of
  the elliptic projective model, and integrality of the projective model over a domain, elliptic
  or not.
- `TauCeti.Isogeny.mulByIntIsogenyOfNeZero W hn` with `fieldPullback` and `degree`, and the
  theorem `TauCeti.Isogeny.degree_mulByIntIsogenyOfNeZero` (file
  `Isogeny/MulByInt/Degree.lean`): over a field `F`, for `W.IsElliptic` and an integer `n ≠ 0`,
  multiplication by `n` as an equation-level isogeny of `W.toAffine`, its pullback on function
  fields, and `deg [n] = |n|²` including the inseparable cases. Layer 2.1's degree bridge consumes
  the last.
- `TauCeti.Isogeny.weilPairing W N hN` with `weilPairing_self` (alternation) and
  `weilPairing_nondegenerate` (file `Isogeny/MulByInt/WeilPairing/Basic.lean`): the
  equation-level Weil pairing on the `N`-torsion points of `W.toAffine` over a separably closed
  field `F` with decidable equality, for `W.IsElliptic` and `(N : F) ≠ 0`, with values in
  `rootsOfUnity N F`. The separable closedness is the library's hypothesis, so the normalisation
  comparison of Layer 2.5 is stated over such fields; the scheme-theoretic pairing of Layer 2.5 is
  constructed independently over an arbitrary base.
- `AlgebraicGeometry.Scheme.IdealSheafData.IsRelativeEffectiveCartier I f` with
  `IsRelativeEffectiveCartier.comap_of_flat` and `IsRelativeEffectiveCartier.comap_of_isPullback`
  (file `TauCeti/AlgebraicGeometry/EffectiveCartierDivisor/Relative.lean`): the relative
  effective Cartier divisor predicate of Layer 0.1, an effective Cartier divisor whose closed
  subscheme is flat over `S`, with its stability under flat pullback and under base change
  along a pullback square.
- `TauCeti.AffineInvariantQuotient.quotient A G`, `projection`, `desc` and `existsUnique_desc`
  (file `TauCeti/AlgebraicGeometry/Quotient/Affine.lean`) and
  `TauCeti.AffineInvariantQuotient.isFinite_projection_of_finiteType` (file
  `Quotient/FiniteGroup/Affine.lean`): the affine invariant quotient `Spec A^G` of Layer 0.3 for
  a monoid `G` acting on `A` through ring homomorphisms, its universal property for affine
  targets, and, for `G` finite, finiteness of the projection when `A` is of finite type over a
  base ring `R` whose action commutes with that of `G`.
- `TauCeti.GroupScheme.kernelBaseChangeIso`, `isPullback_kernel` and `isPullback_kernel_scheme`
  (file `TauCeti/AlgebraicGeometry/GroupScheme/Kernel.lean`): for group objects of `Over S`
  (Convention 2), the kernel of a homomorphism is the fibre over the identity section and its
  formation commutes with base change. Layer 2.1's `E[N]` is this kernel.
- `TauCeti.AlgebraicGeometry.FiniteFlatCommGroupScheme S` with `structureMap`, `toOver`, `Hom`,
  `Iso`, `baseChange` and `ofKernel` (file `TauCeti/AlgebraicGeometry/GroupScheme/FiniteFlat.lean`),
  and the killed-by-rank theorem `FiniteFlatCommGroupScheme.pow_eq_one_of_finrank` (file
  `GroupScheme/KilledByRank.lean`): the finite locally free commutative group schemes of Layer
  0.2, as records of a scheme over `S`, a commutative group-object structure on it and the three
  finiteness conditions; the kernel of a finite locally free homomorphism out of one of them; and
  Deligne's theorem that a point of such a `G` of rank `n` at every point of `S` has trivial
  `n`-th power.
- `TauCeti.AlgebraicGeometry.PointedWeierstrassChart`, `PointedWeierstrassAtlas` and
  `EllipticCurveGeom S` with `nonempty_pointedWeierstrassAtlas_iff` (file
  `TauCeti/AlgebraicGeometry/EllipticCurve/Scheme/Geom/Basic.lean`), its base change
  `EllipticCurveGeom.baseChange` with `isPullback_baseChange`, `baseChangeMap_id` and
  `baseChangeMap_comp` (file `Geom/BaseChange/Basic.lean`): the carrier of Convention 1 and Layer
  1.1, with the equivalence of its two spellings and its functorial base change.
- `EllipticCurveGeom.addition` and `neg` (files `Geom/Addition.lean`, `Geom/Neg.lean`), the
  instances `EllipticCurveGeom.grpObj` and `isCommMonObj` with `one_left`, `mul_left` and
  `inv_left` (file `Geom/GroupLaw.lean`), and `EllipticCurveGeom.toCommGrp` with `hom_ext_left`
  and `intCast_hom_hom_hom` (file `Geom/Hom.lean`): the group law of Layer 1.4, glued from the
  addition morphisms of the projective models over a pointed atlas, and the curve as a
  commutative group object of `Over S`, so that `Hom_S(E, E')` of Layer 2.1 is
  `E.toCommGrp ⟶ E'.toCommGrp`, an abelian group in which `n` is `[n]`. The file's docstring says
  that KM 2.5.1 is not presupposed.
- `EllipticCurveGeom.mulBy n` for `n : ℤ` with `mulBy_mul` and `mulBy_comp` (file
  `Geom/MulBy.lean`), `isFinite_mulBy_left` (file `Geom/MulBy/Finite.lean`), `flat_mulBy_left`,
  `finrank_mulBy_left`, `surjective_mulBy_left` and `finrank_torsion_hom` (file
  `Geom/MulBy/Rank.lean`), `isIsogeny_intCast`, `degree_intCast` and `isogenyOfDegree_intCast`
  (file `Geom/Isogeny.lean`), `EllipticCurveGeom.torsion n : Grp (Over S)` with `torsionι`,
  `torsion_eq_kernel`, `isPullback_torsion`, `torsionInclusion` and `torsionMulBy` (file
  `Geom/Torsion.lean`), and `etale_torsion_hom_iff` (file `Geom/Torsion/Etale/Locus.lean`):
  KM 2.3.1 for every integer `n ≠ 0`, over any base: `[n]` is finite locally free surjective of
  rank `n²`, `E[n]` is its kernel and the fibre over the zero section, finite locally free of
  rank `n²`, and étale exactly when `n` is nonzero in every residue field of `S`; with the
  inclusions `E[m] ⟶ E[mn]` and the multiplication maps `E[mn] ⟶ E[n]`.
- `WeierstrassCurve.projModelFunctionFieldEquiv` (file `Scheme/FunctionField.lean`),
  `WeierstrassCurve.projModelMulBy`, `mulByFunctionFieldPullback`,
  `projModelFunctionFieldEquiv_mulByFunctionFieldPullback`,
  `finrank_fieldRange_mulByFunctionFieldPullback` and `finrank_projModelMulBy` (file
  `Scheme/MulBy.lean`): the degree bridge of Layer 2.1, the function field of the projective model
  over a domain identified with `W.toAffine.FunctionField`, the pullback of rational functions
  along `[n]` identified with the equation-level pullback, and `[K(E) : [n]^* K(E)] = n²`.
- `TauCeti.AlgebraicGeometry.EllObj B` with `EllObj.Hom` (fields `base`, `base_structureMap`,
  `total`, `isPullback`, `zero_total`), its category instance, `hom_ext`, `baseChangeFunctor`,
  `isoBaseChange` and the fibred forgetful functor `forget : EllObj B ⥤ Over B` (file
  `TauCeti/AlgebraicGeometry/ModularCurve/Ell.lean`): the category `Ell/R` of Layer 3.1 is
  `EllObj (Spec R)`, its arrows the cartesian pointed morphisms.
- `TauCeti.AlgebraicGeometry.ModuliProblem B` (the functors `(EllObj B)ᵒᵖ ⥤ Type (u + 1)`),
  `ModuliProblem.fibre`, `RelRepData` (fields `rep` and `representableBy`),
  `RelRepData.HasProperty`, `RelRepData.isPullback`, `ModuliProblem.IsRigid` and `isRigid_of_representableBy` (file
  `ModularCurve/ModuliProblem.lean`), and `RelRepData.IsRegularOfDim d` with
  `isRegularOfDim_iff_of_representableBy` (file `ModularCurve/Regular.lean`) on
  `TauCeti.AlgebraicGeometry.IsRegularOfDim` (file
  `TauCeti/AlgebraicGeometry/Scheme/Regular/Dimension.lean`): the set-valued moduli problems of
  Layer 3.1 with KM 4.2's relative representability, KM 4.3's rigidity and KM 4.12's regularity of
  dimension `d` in the corrected reading of Layer 3.6. Representability by an object is Mathlib's
  `Functor.RepresentableBy`.
- `Module.Grassmannian.scheme R M k` with `glueData`, `chartι` and `toSpec` (file
  `TauCeti/AlgebraicGeometry/Grassmannian/Basic.lean`), `toSchemeHom` and `schemeHomEquiv` (file
  `Grassmannian/Points.lean`), `isProper_toSpec` for `Module.Finite R M` and
  `locallyOfFinitePresentation_toSpec` (file `Grassmannian/Proper.lean`), `schemeUniversalIdeal`
  (file `Grassmannian/UniversalQuotient.lean`), `schemeHopfIdealLocus` with
  `isProper_subschemeι_schemeHopfIdealLocus_toSpec` (file `Grassmannian/HopfIdeal.lean`), and
  `subgroupScheme` with `hopfIdealLocusEquivClosedSubgroupScheme` (file
  `Grassmannian/SubgroupScheme.lean`), and `schemeHopfIdealLocusFamily` with
  `isPullback_schemeHopfIdealLocusFamilyHom` and `isFinite_schemeHopfIdealLocusFamilyHom` (file
  `Grassmannian/FiniteLocallyFree.lean`): the Grassmannian of a module over an affine base glued
  from its standard charts, its functor of points, its properness for a finite module, the
  universal quotient closed subscheme, and for a Hopf algebra the closed Hopf-ideal locus, the
  finite locally free subgroup scheme of rank `k` attached to each of its points, and the
  universal family over the locus, finite over it; Layer 0.7 owns the relative version over a
  scheme and the comparisons with it.
- `TauCeti.StrictHenselization.IsPointedNeighbourhood`, `Neighbourhood`,
  `tripleCategoryEquivalence`, `neighbourhood_isFiltered`, `neighbourhood_essentiallySmall`,
  `algebra R Ω`, `stage`, `stage_naturality`, `desc`, `exists_stage_eq`, `hom_ext`, `toTarget` and
  `toTarget_comp_stage` (files `TauCeti/RingTheory/StrictHenselization/Neighbourhood.lean`,
  `Point.lean`, `Filtered.lean`, `SmallModel.lean`, `Algebra.lean`), `henselianLocalRing`,
  `isLocalRing`, `isLocalHom_algebraMap`, `ker_toTarget_eq_maximalIdeal`, `maximalIdeal_eq_map`,
  `toTarget_surjective`, `existsUnique_algHom_of_etale`, `existsUnique_lift`, `isLocalHom_lift`,
  `exists_isLocalHom_lift`, `map`, `existsUnique_map`, `map_id`, `map_comp` and
  `quotientAlgEquiv` (files `Henselian.lean`, `Local.lean`, `MaximalIdeal.lean`, `Etale.lean`,
  `Lift.lean`, `Map.lean`, `Quotient.lean`): the strict henselisation of Layer 0.9 as the filtered
  colimit of pointed étale neighbourhoods, with the properties of Stacks, Tag 04GP, its universal
  property (Tag 08HQ), the Stacks-form points of étale algebras (Tag 04GT), its functoriality
  (Tag 04GU) and its compatibility with quotients.
- `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat R` with
  `FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDuality`, `cartierDual` and
  `cartierDualDualIso` (file
  `TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/FiniteLocallyFree.lean`),
  `cartierDualBaseChangeIso` (file `CartierDuality/BaseChange.lean`), `finrank_cartierDual` (file
  `CartierDuality/Rank.lean`), and `ConstantGroup.finiteLocallyFreeGroupScheme`,
  `DiagonalizableGroup.finiteLocallyFreeGroupScheme`, `ConstantGroup.cartierDualIso` and
  `DiagonalizableGroup.cartierDualIso` (file `CartierDuality/Constant.lean`): over a commutative
  ring `R`, the finite locally free commutative affine group schemes over `Spec R`, Cartier duality
  on them as an anti-equivalence with the double-dual isomorphism, its compatibility with base
  change along `Spec R' ⟶ Spec R`, the equality of the rank functions of `G` and its dual, and the
  finite constant and diagonalizable group schemes of a finite commutative group with their mutual
  duality, with no invertibility hypothesis on the order. Layer 0.2 globalises these to an arbitrary
  base.
- `TauCeti.DescentDatum p X` (file `TauCeti/CategoryTheory/Limits/Shapes/Pullback/DescentDatum.lean`):
  a descent datum relative to `p : S' ⟶ S` on an object `X` over `S'`, in action form with the
  cocycle condition, and the canonical datum `DescentDatum.baseChange p X₀` on a base change.
  `TauCeti.sectionDescentEquiv`, `TauCeti.homDescentEquiv`, `DescentDatum.baseChangeHomEquiv` and
  `DescentDatum.Hom.descendIso` (file `TauCeti/CategoryTheory/EffectiveEpi/Descent.lean`): sections
  descend uniquely along `p` when `p` is an effective epimorphism, morphisms over `S` descend
  uniquely when the base change of `p` to the source is one, and an object with an isomorphism of
  descent data to a given datum is unique up to unique isomorphism; Mathlib's instances make every
  flat surjective quasi-compact `p` qualify. `DescentDatum.exists_isAffine_baseChange_hom_isIso`
  (file `TauCeti/AlgebraicGeometry/Descent/Affine.lean`): for a flat morphism `p` of affine schemes,
  every descent datum on an affine scheme over `S'` is effective. `DescentDatum.descended`,
  `DescentDatum.isIso_toBaseChangeDescended_hom` and `DescentDatum.isPullback_toDescended` (file
  `Descent/AffineMorphism.lean`): over an arbitrary `S`, for `p` affine and flat, a descent datum
  on a scheme affine over `S'` is effective with descended scheme `D.descended`, and `X ⟶ S'` is
  the base change of `D.descended ⟶ S`. `DescentDatum.exists_finiteLocallyFree_baseChange_hom_isIso`
  (file `Descent/FiniteLocallyFree.lean`): for a faithfully flat ring map `R → S`, a finite locally
  free scheme over `Spec S` with a descent datum descends to a finite locally free scheme over
  `Spec R` whose rank pulls back to the original rank.
  `IsClosedImmersion.descendsAlong_surjective_inf_flat_inf_quasiCompact`,
  `IsFinite.descendsAlong_surjective_inf_flat_inf_quasiCompact` and
  `DescentDatum.isClosedImmersion_descended_hom` (file `Descent/MorphismProperty.lean`): being a
  closed immersion and being finite descend along flat surjective quasi-compact morphisms, so for
  `p` affine, flat and surjective a descent datum on a closed subscheme of `S'` descends to a closed
  subscheme of `S`. `TauCeti.Algebra.DescentDatum.isPullback_proj_map_descendedGradedVal` (file
  `Descent/Proj.lean`): for `S` flat over `R` and a graded descent datum on an `ℕ`-graded
  `S`-algebra `B`, `Proj B` is the base change of `Proj` of the descended graded algebra. These
  are the cases of Layer 0.5 at the pin.
- `TauCeti.FiniteEtaleScheme S` (file `TauCeti/AlgebraicGeometry/FiniteEtale/Basic.lean`), the full
  subcategory of `Over S` on the finite étale `S`-schemes, with
  `FiniteEtaleScheme.essImage_mapGrp_ι_iff` (file `FiniteEtale/GroupScheme.lean`): a group scheme
  over `S` is a group object of `FiniteEtaleScheme S` exactly when its underlying scheme is finite
  and étale over `S`; the instances `FiniteEtaleScheme.isFinite_hom_left` and
  `FiniteEtaleScheme.etale_hom_left` (file `FiniteEtale/Basic.lean`): a morphism of finite étale
  `S`-schemes is finite and étale; `AlgebraicGeometry.Scheme.Hom.exists_split_etaleLocally` (file
  `FiniteEtale/EtaleLocallySplit.lean`): a finite étale morphism becomes a finite disjoint union of
  copies of the base on an affine étale neighbourhood of any base point. For a field `K` and a
  separable closure `Ω` of `K` (`IsSepClosed Ω` and `IsGalois K Ω`),
  `FiniteEtaleScheme.galoisEquivalence K Ω`, an equivalence
  `FiniteEtaleScheme (Spec K) ≌ ContAction FintypeCat Gal(Ω/K)` sending `Spec A` to the
  `Gal(Ω/K)`-set of `Ω`-points of `A`, monoidal and braided for the cartesian structures, with the
  induced equivalences `galoisEquivalenceGrp` and `galoisEquivalenceCommGrp` on group and
  commutative group objects and the bijection `galoisEquivalenceAlternatingPairingEquiv` on
  bilinear alternating pairings (file `FiniteEtale/Galois/Basic.lean`): the Galois description of
  Layer 0.4.
- `TauCeti.AlgebraicGeometry.relativePicardPresheaf f` (file
  `TauCeti/AlgebraicGeometry/PicardFunctor/Relative.lean`), the presheaf of commutative groups
  `T ↦ Pic(X_T)/Pic(T)` on `Over S` for any `f : X ⟶ S`; `rigidifiedPicardFunctor f x₀ hx₀` (file
  `PicardFunctor/Rigidified.lean`), the classes of line bundles rigidified along the base-changed
  section `x₀`, with `rigidifiedPicardFunctorIso` identifying it with the relative Picard presheaf;
  `relativePicardFppfSheaf f` (file `PicardFunctor/Fppf.lean`), the sheafification of the latter
  for `Scheme.fppfTopology.over S`; `relativePicardDegreeZeroSubfunctor f` (file
  `PicardFunctor/PicZero/Basic.lean`), the classes whose degree on the fibre at every point with
  values in an algebraically closed field is zero; for `f` proper, smooth of relative dimension one
  and `GeometricallyConnected`, `relativePicardDegreeZeroFppfSheaf f` with its map
  `relativePicardDegreeZeroFppfSheafι` to `relativePicardFppfSheaf f` (file
  `PicardFunctor/PicZero/Fppf.lean`), and, for a section `x₀`, the Abel–Jacobi map
  `abelJacobiMapToPicZeroFppf f hx₀`, `x ↦ 𝒪(Γₓ − x₀_T)`, from the functor of points of `X` over
  `S` to the degree-zero sheaf (file `PicardFunctor/Abel/Fppf.lean`). Layer 2.4 items 1–2 are these
  objects for `f = E.structureMap` and `x₀ = E.zero`; representability, the open-and-closed
  property of the degree-zero part, and the Poincaré bundle are not at the pin.
- `TauCeti.StrictHenselization.lift` (file `TauCeti/RingTheory/StrictHenselization/Lift.lean`),
  the `R`-algebra map from the strict henselisation to a henselian local `R`-algebra `S` determined
  by an `R`-algebra map `Ω → κ_S`, and `TauCeti.Algebra.IndEtale` with
  `TauCeti.Algebra.IndEtale.of_isColimit` and `TauCeti.Algebra.IndEtale.flat` (file
  `TauCeti/RingTheory/Etale/IndEtale.lean`): an `R`-algebra is ind-étale when it is a small
  filtered colimit of étale `R`-algebras in `CommAlgCat R`, base and algebra in one universe, the
  point of a colimit cocone of such a diagram is ind-étale, and an ind-étale algebra is flat.
  Layer 0.9 states `IsHenselization` on the latter and builds the comparison of a henselisation
  with the strict henselisation from the former.
- `EllipticCurveGeom.IsFiberwiseInjective` with `isFiberwiseInjective_iff_range_eq_ker` and
  `exists_isFiberwiseInjective` (file `Geom/NaiveLevel.lean`), and
  `IsFiberwiseInjective.eq_id_of_isPullback` (file `Geom/Rigidity.lean`): a homomorphism
  `φ : A →* E(S)` from a group `A` is injective on every fibre when `φ a` misses the zero section
  everywhere for `a ≠ 1`; over a separably closed field `K` in which `N` is invertible, the
  injective homomorphisms `(ℤ/Nℤ)² →* E(K)` are those with image `E[N](K)`, and one exists; and
  an automorphism of `E` over `S` fixing the zero section and two sections `φ a`, `φ b` with
  `a² ≠ 1`, `b ≠ 1` and `b ≠ a^{±1}` is the identity (the argument of KM 2.7.2, with no
  hypothesis on `S`). Layers 2.1, 3.2 and 3.3 consume these.
- `EllipticCurveGeom.IsOfExactOrder` with `multiplesDivisor`, `IsOfExactOrder.pow_eq_one` and
  `IsOfExactOrder.pointsPullback` (files `Geom/ExactOrder/Basic.lean`, `Subgroup.lean`),
  `exactOrderScheme` with `exactOrderPointsEquivOfIsPullback` and `isFinite_exactOrderScheme_hom`
  (file `ExactOrder/Scheme.lean`), and `isOfExactOrder_iff_isOfNaiveExactOrder` (file
  `ExactOrder/Comparison.lean`): a section `P` has exact order `N` when the relative effective
  Cartier divisor `[P] + ⋯ + [NP]` is a subgroup scheme of `E`; such a point is killed by `N`;
  exact order is stable under base change; the closed subscheme of `E` carrying the universal
  point of exact order `N` represents the points of exact order `N` on base changes and is
  finite over `S` for `N ≠ 0`; and where `N` is invertible exact order is exact order in every
  fibre. Layer 4.1 consumes these.
- `EllipticCurveGeom.IsCyclicSubgroup` with `IsOfExactOrder.isCyclicSubgroup_multiplesDivisor`,
  `IsCyclicSubgroup.toTorsion` and `IsCyclicSubgroup.comap` (file `Geom/CyclicSubgroup.lean`): a
  closed subscheme of `E`, given by its ideal sheaf, is a cyclic subgroup of order `N` when it is
  a finite locally free subgroup scheme of rank `N` which fppf-locally on `S` is the divisor
  `[P] + ⋯ + [NP]` of a point of exact order `N`; the subgroup generated by such a point is
  cyclic, a cyclic subgroup of order `N` lies in `E[N]`, and cyclic subgroups pull back along
  base change. Layers 4.1 and 4.2 consume these.
- `EllipticCurveGeom.IsDrinfeldBasis` with `isDrinfeldBasis_iff`, `IsDrinfeldBasis.pointsPullback`
  and `isDrinfeldBasis_comp_mulEquiv_iff` (file `Geom/DrinfeldBasis/Basic.lean`),
  `IsFiberwiseInjective.isDrinfeldBasis` and `isDrinfeldBasis_iff_isFiberwiseInjective` (file
  `DrinfeldBasis/Naive.lean`): a homomorphism `φ : (ℤ/Nℤ)² →* E(S)` is a Drinfeld basis of
  `E[N]` when the divisor `∑_a [φ a]` is the closed subscheme `E[N]`, the divisor form of KM's
  `(ℤ/Nℤ)²`-generators of `E[N]` (the library does not relate it to full sets of sections; Layer
  4.1 owns that comparison, KM 1.10.1); Drinfeld bases pull back along base change and are
  permuted by `GL₂(ℤ/Nℤ)`; every fibrewise-injective homomorphism is a Drinfeld basis over any
  base, and the converse holds where `N` is invertible. Layers 4.2 and 4.3 consume these.
- `ModuliProblem.gammaOneNaive`, `gammaNaive`, `gammaNaiveAction`, `gammaNaiveToGammaOneNaive`,
  `isRigid_naiveLevel`, `isRigid_gammaNaive`, `isRigid_gammaOneNaive`,
  `eq_one_of_gammaNaiveAction_hom_app_eq_self`, `gammaOneNaiveRelRepData` and
  `gammaNaiveRelRepData` with, for each, `hasProperty_etale_…`, `hasProperty_isFinite_…` and
  `hasProperty_surjective_…` (file `TauCeti/AlgebraicGeometry/ModularCurve/NaiveLevel.lean`, on
  `ModuliProblem.homLevel` of file `HomLevel.lean`), and `ModuliProblem.IsRigid.of_hom` (file
  `ModularCurve/ModuliProblem.lean`): the naive problems `[Γ₁(N)]` and `[Γ(N)]` over `Ell/B` for
  every base `B`, as fibrewise-injective homomorphisms from `ℤ/Nℤ` and from `(ℤ/Nℤ)²`; the right
  action of `GL₂(ℤ/Nℤ)` on the latter in the row-vector convention of Convention 5, free over
  nonempty bases; the forgetful map `[Γ(N)] ⟶ [Γ₁(N)]`; rigidity of the naive `A`-structures
  whenever `A` has elements `a`, `b` with `a² ≠ 1`, `b ≠ 1`, `b ≠ a^{±1}`, hence of `[Γ(N)]` for
  `N ≥ 3` and of `[Γ₁(N)]` for `N ≥ 4`, with no hypothesis on `B` (KM 2.7.2), and the transfer
  of rigidity along a morphism of moduli problems; relative representability of both problems
  over every base, by the open naive loci of `E[N]` and of `E[N] ×_S E[N]`, and, for `N`
  invertible in every residue field of `B`, étaleness, finiteness and surjectivity over `Ell/B`
  (Loeffler, Proposition 3.8.2, for relative representability and étaleness of these two problems
  over `Ell/ℤ[1/N]`). Layers 3.2 and 3.3 consume them.
- `ModuliProblem.gamma`, `gammaAction` and `gammaLevelOneIso` (file `ModularCurve/FullLevel.lean`),
  `EllObj.drinfeldBasisScheme`, `gammaRelRepData` and `hasProperty_isFinite_gammaRelRepData` (file
  `ModularCurve/Gamma/Full.lean`), `gammaOne`, `gammaOneOneIso`, `gammaOneRelRepData` and
  `hasProperty_isFinite_gammaOneRelRepData` (file `Gamma/One.lean`), `gammaZero` and
  `gammaOneToGammaZero` (file `Gamma/Zero.lean`): the Drinfeld problems `[Γ(N)]` (Drinfeld
  bases), `[Γ₁(N)]` (points of exact order `N`) and `[Γ₀(N)]` (cyclic subgroups of order `N`)
  over `Ell/B` for every base, the `GL₂(ℤ/Nℤ)`-action on the first, the triviality of `[Γ(1)]` and
  `[Γ₁(1)]`, the morphism `(E, P) ↦ (E, ⟨P⟩)`, and KM 3.6.0 for the first two: relative
  representability by the closed Drinfeld-basis locus of `E[N] ×_S E[N]` and by the exact-order
  scheme, finite over the base, with no invertibility hypothesis on `N`. Layers 4.2 and 4.4 consume
  them; the relative representability of `[Γ₀(N)]` is Layer 9.4.
- `ModuliProblem.gammaOneToGammaOneNaive` with `isIso_gammaOneToGammaOneNaive`, `isRigid_gammaOne`
  and `gammaOneRepresentableBy`, and `gammaNaiveToGamma`, `gammaIsoGammaNaive`,
  `eq_one_of_gammaAction_hom_app_eq_self`, `isRigid_gamma` and
  `hasProperty_etale_gammaRelRepData` (file `ModularCurve/Comparison.lean`): KM 1.4.4 and §3.7
  for `[Γ₁(N)]` and `[Γ(N)]`: over a base on which `N` is invertible in every residue field the
  Drinfeld and naive problems are isomorphic, so `[Γ₁(N)]` is rigid for `N ≥ 4` and represented
  by `Y₁(N)`, and `[Γ(N)]` carries a free `GL₂(ℤ/Nℤ)`-action over nonempty bases, is rigid for
  `N ≥ 3` and is étale, hence finite étale, over `Ell/B` (KM 3.7.1); over every base, naive
  `[Γ(N)]`-structures are Drinfeld bases. Layer 4.3 consumes them.
- `EllipticCurveGeom.existsUnique_tateNormalForm` (file `Geom/TateNormalForm.lean`),
  `EllObj.universalTate`, `EllObj.yOne B N hN`, `ModuliProblem.gammaOneNaiveRepresentableBy`,
  `EllObj.isAffineHom_yOne_structureMap` and `EllObj.smooth_yOne_structureMap` (file
  `ModularCurve/YOne.lean`): a section `P` with `P`, `2P` and `3P` nowhere the zero section is
  the pullback of `(0, 0)` on the universal Tate normal form `Y² + aXY + bY = X³ + bX²` over
  `Spec ℤ[a, b][Δ⁻¹]` along a unique cartesian pointed morphism, over any base; that form as an
  object of `Ell/B`; `Y₁(N)`, its restriction to the closed subscheme of `B × Spec ℤ[a, b][Δ⁻¹]`
  on which `(0, 0)` has naive exact order `N`, for `N` invertible on `B`, which for `N ≥ 4`
  represents the naive `[Γ₁(N)]` over `Ell/B` and is affine and smooth over `B`. Layer 5.1
  consumes these.
- `EllipticCurveGeom.existsUnique_levelThreeNormalForm` (file `Geom/LevelThreeNormalForm.lean`),
  `EllObj.universalLevelThree` and `ModuliProblem.gammaNaiveThreeRepresentableBy` (file
  `ModularCurve/Rigidifier/LevelThree.lean`): the universal level-three normal form
  `Y² + 3μXY + (μ³ − 1)Y = X³` over `Spec ℤ[1/3, ζ₃][μ, 1/(μ³ − 1)]` with its basis of the
  `3`-torsion, classifying pairs of sections killed by `3`, nowhere zero and nowhere equal or
  opposite, over any base; as an object of `Ell/B` it represents the naive `[Γ(3)]` over
  `Ell/B`, with no hypothesis on `B` (KM 2.2.10–2.2.11). Layer 3.5's level-three rigidifier is
  this object.
- `ModuliProblem.RelRepData.tensorRepresentableBy` and `IsRigid.mono_pullback_lift` (file
  `ModularCurve/Simultaneous/Basic.lean`), `RelRepData.doubleRepresentableBy`, `doubleSnd`,
  `mem_doubleSnd_base` and `mono_pullback_lift_baseChangeFunctorHom_doubleSnd` (file
  `Rigidifier/Double.lean`, on `Simultaneous/Projections.lean`), `simultaneousAction`,
  `IsRigid.eq_one_of_comp_simultaneousAction_base_eq`, `simultaneousSectionsAction` and
  `IsRigid.span_range_smul_sub_eq_top` (file `Rigidifier/FreeAction.lean`): the steps of the
  proof of KM 4.7.0: for `𝒫` relatively representable and `δ` represented by `U`, the
  simultaneous problem `(𝒫, δ)` is represented by the base change of `U` to `𝒫_U`, affine over
  the base of `U` when `𝒫` is affine; `(𝒫, δ, δ)` is represented by the relative representing
  scheme of `δ` over it, whose two projections inherit finiteness, étaleness and surjectivity
  from `δ` and, for `𝒫` rigid, jointly form a monomorphism into the fibre square; a group acting
  on `δ` acts on the base of the object representing `(𝒫, δ)`, freely over nonempty bases when
  `𝒫` is rigid and the action on `δ` is free, which for an affine `𝕄(𝒫, δ)` says that the
  elements `g • a − a` generate the unit ideal of its ring of functions for `g ≠ 1`. Layer 3.5
  items 3–4 consume these.
- `TauCeti.AffineInvariantQuotient.existsUnique_desc_of_finite` (file
  `TauCeti/AlgebraicGeometry/Quotient/FiniteGroup/UniversalProperty.lean`),
  `isFinite_projection_of_free` and `etale_projection` (file `FiniteGroup/Free.lean`), and
  `isPullback_of_free` (file `FiniteGroup/Torsor.lean`): for a finite group `G` acting on `A`,
  the projection `Spec A ⟶ Spec A^G` is a categorical quotient in all schemes; when the action
  is free, in the sense that `g • a − a` generates the unit ideal for every `g ≠ 1`, the
  projection is finite étale and the action map `⨆_G Spec A ⟶ Spec A ×_{Spec A^G} Spec A` is an
  isomorphism, the torsor square. Layer 0.3 item 1 and the affine case of item 3 are these; Layer
  3.5 item 5 applies them to the level-three rigidifier.
- `TauCeti.LegendreRing R` with `finrank_legendreRing`, `LegendreRing.equivLocalization`,
  `LegendreRing.anharmonicGroup` and `LegendreRing.isInvariant_anharmonicGroup` (file
  `ModularCurve/LegendreLine.lean`), and `TauCeti.LevelThreeRing R` with
  `finrank_levelThreeRing`, `LevelThreeRing.tetrahedralGroup` and
  `LevelThreeRing.isInvariant_tetrahedralGroup` (file `ModularCurve/LevelThreeLine.lean`): over
  any commutative ring `R`, the coordinate ring `R[λ, 1/λ(λ − 1)]` of the Legendre line as a
  free module of rank `6` over `R[u]`, `u = (λ² − λ + 1)³/λ²(λ − 1)²` (so `j = 2⁸u`), on which
  the six substitutions of the anharmonic group act over `R[u]` with invariants exactly `R[u]`
  when `6` is a nonzerodivisor of `R`; and the coordinate ring `R[μ, 1/(μ³ − 1)]` of the
  level-three line as a free module of rank `12` over `R[u]`, `u = μ³(μ³ + 8)³/(μ³ − 1)³` (so
  `j = 27u`), on which, for a root `ζ` of `T² + T + 1` in `R`, `3` invertible and `2` a
  nonzerodivisor, the tetrahedral group generated by `μ ↦ ζμ` and `μ ↦ (μ + 2)/(μ − 1)` acts over
  `R[u]` with invariants exactly `R[u]`. Layer 6.5 items 2–3 consume them.
- `EllipticCurveGeom.jMap E : S ⟶ Spec ℤ[j]` with `j`, `jMap_baseChange`, `j_eq_of_iso` and
  `appTop_j_of_isPullback` (file `Geom/JInvariant.lean`): the `j`-invariant of an elliptic curve
  over any scheme `S`, glued from the `j`-invariants of the equations of its pointed Weierstrass
  charts, as a morphism to the `j`-line `Spec (MvPolynomial PUnit (ULift ℤ))` and as a global
  function on `S`, compatible with base change and with cartesian pointed morphisms, in
  particular constant on isomorphism classes. Layer 6.5 item 1 consumes it.
- `EllipticCurveGeom.exists_iso_baseChange_iterateFrobenius` (file `Geom/Frobenius.lean`): for an
  elliptic curve over an Artinian local `k`-algebra `R` of characteristic `p` whose residue field
  is `k`, every sufficiently high Frobenius twist `E^{(p^n)}` is pointed-isomorphic over `R` to
  the base change of a curve over `k`. Layer 8.7 item 3 consumes it.
- `TauCeti.Henselization.algebra I` with `henselianLocalRing`, `isLocalHom_algebraMap`,
  `residueField_map_bijective`, `existsUnique_isLocalHom`, `algEquivOfHenselianRing`, `indEtale`
  and `isNoetherianRing_iff_of_le_jacobson` (files `TauCeti/RingTheory/Henselization/Algebra.lean`,
  `Local.lean`, `Lift.lean`, `IndEtale.lean`, `Noetherian.lean`),
  `TauCeti.StrictHenselization.fromHenselization` with `toTarget_comp_fromHenselization` and
  `eq_fromHenselization` (file `StrictHenselization/FromHenselization.lean`), and
  `StrictHenselization.algEquivOfResidueFieldEquiv` (file `StrictHenselization/Equiv.lean`): the
  henselisation `R^h = algebra 𝔪` of a local ring `R` along its maximal ideal, the henselisation
  of the pair `(R, 𝔪)` (Stacks, Tag 0A02; Tag 0A03 for its agreement with the henselisation of
  the local ring), a henselian local ring, local over `R` with the residue field of `R`,
  universal among local maps to henselian local rings, equal to `R` when `R` is henselian,
  ind-étale over `R`, and Noetherian exactly when `R` is (Tag 06LJ); the unique `R`-algebra map
  `R^h → R^{sh}`, compatible with the maps to `Ω` (Tag 04GP, (1)); and, for `R` henselian and
  `Ω ≅ κ` over `R`, the isomorphism `R^{sh} ≅ R`. Layer 0.9's `IsHenselization` is tested on these.
- `TauCeti.AdicCompletion.ringKrullDim_eq` and `TauCeti.AdicCompletion.isRegularLocalRing_iff`
  (file `TauCeti/RingTheory/AdicCompletion/LocalRing.lean`): for a Noetherian local ring `R`, the
  completion `AdicCompletion 𝔪 R` has the Krull dimension of `R` (Stacks, Tag 07NV) and is regular
  exactly when `R` is (Tag 07NY). Layer 0.9 consumes them.
- `TauCeti.AlgebraicGeometry.Smooth.irreducibleSpace_of_connectedSpace` and
  `Smooth.irreducibleSpace_baseChange_algebraicClosure_of_connectedSpace` (file
  `TauCeti/AlgebraicGeometry/Morphisms/Smooth/Irreducible.lean`): a connected scheme smooth, of
  any relative dimension, over a locally Noetherian scheme with regular local rings is
  irreducible; and for `f : X ⟶ Spec K` smooth over a field `K`, if the base change of `X` to
  `AlgebraicClosure K` is connected, it is irreducible. Connectedness is assumed, not proved, and
  a `ConnectedSpace` is nonempty. Layer 5.3 item 7 is these.
- `TauCeti.connectedSpace_primeSpectrum_tensorProduct_of_isAlgClosed` (file
  `TauCeti/RingTheory/Idempotents/Connected/ScalarExtension.lean`): for an algebraically closed
  field `k`, a `k`-algebra `A` with connected spectrum and any field extension `K` of `k`, the
  spectrum of `A ⊗_k K` is connected, with no finite-type or reducedness hypothesis. Layer 5.3
  uses it for the affine curve `Y(ρ) ⊗ ℚ̄` and `K = ℂ`.

The carriers and the declarations on which the statements of `Suggested.lean` rest are pinned
there by `#check`; the other declarations listed are cited by name and file.

### From roadmaps on main

- JacobianChallenge: the three contracts listed in §Scope (invertible sheaves and the
  divisor–line-bundle correspondence; Riemann–Roch and Serre duality for proper curves over a
  field; proper-flat coherent cohomology, Grauert's theorem and base change), consumed as prose
  until that roadmap states them in Lean.
- AlgebraicVectorBundles L0B–L0C and L2A: finite locally free sheaves, exterior powers and
  determinants, and the graded symmetric algebra with its affine graded-ring and base-change
  interfaces (Layer 0.7).
- StableReduction Layer 2: relative Proj of a finitely generated graded quasi-coherent algebra
  with its affine comparison (Layer 0.7).
- AlgebraicCurves Layers 7–9 and 12: the different, Hilbert's different formula and
  Riemann–Hurwitz in Euler-characteristic form, carried to smooth proper fibres (Layer 10,
  item 3).
- EllipticCurves: the `Aut(E)` carrier used by Layer 10, item 3; its equation-level theory is
  otherwise consumed through Tau Ceti.

## Existing Mathlib and work in progress

The roadmap uses the following existing material.

- `Scheme`, `Spec`, `Proj`, fibre products, `Over`, and the morphism-property library: finite,
  flat, étale, smooth with relative dimension, proper, separated, immersions, quasi-finite
  morphisms, and descent results.
- Ideal sheaves, closed subschemes, and kernels of scheme morphisms.
- Group objects in cartesian monoidal categories.
- `Mathlib/AlgebraicGeometry/Group/`. `Abelian.lean` proves commutativity of a proper
  geometrically integral group scheme **over a field**, so over a general base it applies
  fibrewise only and the passage to a global statement is an argument this roadmap owes (for
  Weierstrass models commutativity is anyway immediate from the symmetric addition formula).
  `Affine.lean`, the correspondence between commutative Hopf algebras and affine group
  schemes (`algSpec`, `bialgSpec`, `hopfSpec`, fully faithful), which Layer 0.2 consumes rather
  than building the correspondence.
- `Mathlib/AlgebraicGeometry/Morphisms/FlatRank.lean`, which supplies `Scheme.Hom.finrank` and
  `AlgebraicGeometry.Scheme.Hom.isLocallyConstant_finrank` — the locally constant rank that
  Convention 3 and Layer 2.1 are stated in terms of.
- Weierstrass curves, variable changes, division polynomials, and the pointwise group law.
- Finite, flat, and étale ring maps, finite locally free rank, invariant subrings, Hopf algebras,
  regular local rings, completions, and Krull dimension.
- The available flatness files include `Flat/Localization`, `Flat/EquationalCriterion`,
  `Flat/TorsionFree`, and `LocalFlatDescent`. The curve-specific fibrewise flatness and miracle
  flatness results required below are not assumed to exist; they are explicit targets in Layers
  0.9, 2.1, and 8.2.
- Representable functors, `Over`-categories, and scheme gluing.
- The Jacobian Challenge roadmap's line-bundle, coherent-cohomology,
  and cohomology-and-base-change contracts. Its Picard-scheme endpoint is stated over a field.
  The relative Picard functor over an arbitrary base and its degree-zero subsheaf are Tau Ceti's;
  their representability for an elliptic curve and the Poincaré construction are milestones of
  Layer 2.4 rather than assumed supplier theorems. The descent package used here is Tau Ceti's
  descent library together with the remaining cases proved in Layer 0.5.

The projective Weierstrass model with its structure morphism and zero section, its properness,
its smoothness when `W.IsElliptic` and its integrality over a domain are Tau Ceti's (§Exact
supplier contracts); Layer 1.1 consumes them. The AINTLIB development named in §Provenance is
migration material, not a dependency.

## Layer 0: scheme-theoretic prerequisites

This layer contains the general algebraic geometry used by the later layers.

### 0.1. Relative effective Cartier divisors

References: KM 1.1.1, 1.2.2, 1.2.3.

Use the general divisor and invertible-sheaf objects supplied by the Jacobian Challenge. For a
separated smooth relative curve `C ⟶ S`, prove the following statements.
Separatedness is needed for a section to have closed image; all elliptic-curve applications
satisfy it by properness.

1. Use the shared definition, Tau Ceti's
   `AlgebraicGeometry.Scheme.IdealSheafData.IsRelativeEffectiveCartier`: an effective Cartier
   divisor whose closed subscheme is flat over `S`, with its stability under flat pullback and
   under base change along a pullback square (`IsRelativeEffectiveCartier.comap_of_flat`,
   `IsRelativeEffectiveCartier.comap_of_isPullback`). Do not introduce a second carrier. Prove the fibre criterion in its exact form: if `S` is
   locally noetherian, `C ⟶ S` is
   flat and locally of finite type, and the closed finitely presented subscheme `D⊆C` is flat over
   `S`, then `D` is a relative effective Cartier divisor if and only if every geometric fibre is an
   effective Cartier divisor. Prove the limit/descent version used after spreading out to an
   arbitrary base.
2. A section `P : S ⟶ C` defines the relative effective Cartier divisor `[P]`.
3. Sums preserve relative effective Cartier divisors; inverse images under flat morphisms and
   arbitrary base change do so by the Tau Ceti lemmas just cited.
4. A relative effective Cartier divisor on `C/S` is finite over `S` exactly when it is proper over
   `S`; in that case it is finite locally free. Thus finiteness is a theorem under a properness
   hypothesis, not part of the definition.
5. Its degree is the locally constant rank of the resulting finite locally free morphism. For a
   finite flat morphism of curves, inverse images multiply degrees.
6. Construct the universal incidence locus `D' ≤ D` and universal equality locus `D'=D`, prove
   their scheme structures, universal properties, and arbitrary base-change compatibility.
7. For a finite locally free divisor on a commutative smooth relative curve, prove the subgroup
   criterion in terms of the identity, inversion, and addition maps.
8. **Difference divisors.** If `D' ⊆ D` are relative effective Cartier divisors on `C/S`, the
   effective Cartier divisor `D''` with `D = D' + D''` is again a relative effective Cartier
   divisor; if `D'` and `D` are finite locally free over `S` of degrees `d'` and `d`, then `D''` is
   finite locally free of degree `d − d'` (Stacks Project, Tags 0B8V and 0B9F).

**Dependencies.** Mathlib's ideal-sheaf and morphism-property libraries, Tau Ceti's relative
effective Cartier predicate, and the Jacobian Challenge divisor–line-bundle interface.

**Consumers.** This block is used by the section-divisor and pole-sheaf constructions in Layer 1,
the Picard and Weil-pairing constructions in Layer 2, all Drinfeld structures in Layers 0.8 and 4, the first
three integral level problems in Layer 4.4, `[Γ₀(N)]` in Layer 9, and the regularity arguments. What
does not use *further* Drinfeld-divisor theory is the naive side: once the common elliptic-curve and
torsion foundations exist, Layer 3.2 and the direct Tate-normal-form construction may proceed in
parallel with Layers 0.8 and 4.1–4.3. This is not a separate construction of elliptic curves avoiding Layer 0.1.
Full-level representability in Layer 5.2 also uses the rigidity of naive level structures of
Layer 3.3, which is at the pin and uses no Picard duality. Layer 5.3 and the determinant refinements additionally consume the Weil
pairing of Layer 2.5.

**Further sources.** Stacks Project: Tag 062T for the definition and Tag 056Q for base change; Tag
062Y for the fibre criterion, proved there for `C ⟶ S` flat and locally of finite presentation, with
fibres over the points of `S` and no noetherian hypothesis, which is more general than the form of
item 1; Tag 0B8U for sums; Tag 0B9D for a smooth relative curve, where a closed subscheme finite
locally free over the base is a relative effective Cartier divisor and the relative effective
Cartier divisors are the closed subschemes locally quasi-finite, flat and locally of finite
presentation over the base; Tag 0B9E for additivity of the degree; Tags 0B8V and 0B9F for item 8.

### 0.2. Finite locally free group schemes and Cartier duality

References: KM §1.12, especially 1.12.4 and 1.12.7, and §§2.5, 2.8;
SGA 3, Exposé VIIA, §3.3 for Cartier duality. KM 2.8.2 cites the Cartier–Nishi theorem to Oda;
the Picard and Poincaré construction used here is specified in Layer 2.4 rather than left as an
unnamed black box. KM §1.11 (extensions of an étale group) is used in Layer 0.8, in the exact form
of 1.11.2–1.11.5.

A morphism is **finite locally free** if and only if it is finite, flat, and locally of finite
presentation (Stacks, Tag 02KB). Over a non-noetherian base the last condition is not implied by
the first two — Stacks, Tag 05LB gives an explicit finite flat morphism which is not of finite
presentation — and it is the hypothesis under which Mathlib's
`AlgebraicGeometry.Scheme.Hom.isLocallyConstant_finrank` (pinned by a `#check` in
`Suggested.lean`) applies. Every "finite locally free" carrier of this
roadmap — `TauCeti.AlgebraicGeometry.FiniteFlatCommGroupScheme` and `E[N]`, isogenies, the
generator scheme, the relative representing schemes of the First Main Theorem and of `[Γ₀(N)]`,
the map `[Γ₁(N)] ⟶ [Γ₀(N)]`, and finite étale torsors — carries all three conditions; Tau Ceti
registers them as instances for `FiniteFlatCommGroupScheme` and proves them for `[N]`
(`EllipticCurveGeom.isFinite_mulBy_left`, `flat_mulBy_left`,
`locallyOfFinitePresentation_mulBy_left`) and, through the pullback square `isPullback_torsion`
of the kernel over the zero section, for `E[N]` (§Exact supplier contracts). For an isogeny of
elliptic curves, or any `S`-morphism between schemes locally of finite presentation over `S`, local finite
presentation is a theorem (Mathlib's cancellation lemma). For the finite-type affine problems used here, the Katz–Mazur quotient projection
`𝒫 ⟶ 𝒫/H` is finite but need not be flat or locally of finite presentation. Finiteness of
an arbitrary affine finite-group quotient is not asserted: the finite-type hypothesis in
Layer 0.3 and `isFinite_mapRep` is essential. For `R = ℤ ⋉ V`,
with `V` an infinite-dimensional `𝔽₂`-vector space, let `A = R[ε]/(ε²)` with `C₂` acting by
`ε ↦ -ε`. Then `A` is finitely presented over `R`, its invariant ring is `B = A^{C₂} = R ⊕ Vε`,
and `A` is finite but not finitely presented as a `B`-algebra. If the target is locally
noetherian, finiteness does imply local finite presentation, but not flatness: over a field of
characteristic `≠ 2`, `𝔸² ⟶ 𝔸²/{±1}` is finite and not flat at the image of the origin, whose
fibre `k[x,y]/(x²,xy,y²)` has length `3` against generic length `2`. The projection is finite
locally free in the free-action case (it is then an étale torsor, KM 7.1.3(2)) and under the
hypotheses of the Axiomatic Regularity Theorem for quotients (Layer 8.5).

Develop the affine-group-scheme/Hopf-algebra anti-equivalence from `Group/Affine.lean` and the
category of finite locally free commutative group schemes; Tau Ceti carries the latter as
`TauCeti.AlgebraicGeometry.FiniteFlatCommGroupScheme`, a commutative group object of `Over S`
whose structure morphism `structureMap` carries the three finiteness conditions, with its
homomorphisms, isomorphisms, base change and the kernel `ofKernel` of a finite locally free
homomorphism (§Exact supplier contracts). Scheme-theoretic kernels of arbitrary homomorphisms of
group schemes, their description as the fibre over the identity section, and their compatibility with base
change are Tau Ceti's (`TauCeti.GroupScheme.isPullback_kernel_scheme`,
`TauCeti.GroupScheme.kernelBaseChangeIso`); do not assert that such a kernel is always finite
locally free: its rank can jump. For a closed finite locally free subgroup `C ⊆ G`, construct the fppf
quotient under the representability hypotheses of Layer 0.3 and prove that the resulting sequence
is exact as a sequence of fppf sheaves. Construct separately the constant finite group scheme and
the diagonalizable group scheme:

```text
G_S = ⨆_{g∈G} S ≅ Spec_S(∏_{g∈G} 𝒪_S),
D_S(M) = Spec_S 𝒪_S[M],
μ_N = D_S(ℤ/Nℤ).
```

Over `S=Spec R`, the coordinate algebra of `G_S` is `Map(G,R)`; over an affine base both group
schemes are Tau Ceti's (`ConstantGroup.finiteLocallyFreeGroupScheme R G` and
`DiagonalizableGroup.finiteLocallyFreeGroupScheme R G` for a finite commutative group `G`, with
`μ_N` the case `G = ℤ/Nℤ`), and the constructions over `S` glue them.

Cartier duality over an affine base `Spec R` is Tau Ceti's (§Exact supplier contracts): the
anti-equivalence `FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDuality` on finite locally free
commutative affine group schemes over `R`, with biduality `cartierDualDualIso`, preservation of
the rank function `finrank_cartierDual`, compatibility with base change along `Spec R' ⟶ Spec R`
`cartierDualBaseChangeIso`, and the dualities `ConstantGroup.cartierDualIso` and
`DiagonalizableGroup.cartierDualIso` between finite constant and diagonalizable groups. Identify
these group schemes over `Spec R` with `FiniteFlatCommGroupScheme (Spec R)`, and construct Cartier
duality as a contravariant anti-equivalence on `FiniteFlatCommGroupScheme S` over an arbitrary
base by gluing the affine dualities along these base-change isomorphisms; prove evaluation,
biduality, preservation of rank, and arbitrary base change for it. Prove exactness for fppf-exact
short sequences whose terms are finite locally free, and derive the kernel–quotient comparison only
under the hypotheses which keep both objects in this category. In particular, prove, over an
arbitrary base,

```text
((ℤ/Nℤ)_S)ᴰ ≅ μ_N,
(μ_N)ᴰ ≅ (ℤ/Nℤ)_S.
```

Finally, a finite locally free commutative group scheme of rank `N` is killed by `N`: this is
Tau Ceti's `FiniteFlatCommGroupScheme.pow_eq_one_of_finrank` (§Exact supplier contracts), which
says that for `G` of rank `N` at every point of `S` and every point `x : X ⟶ G` over `S`, the
`N`-th power of `x` in the group of `X`-valued points is the unit; applied to the identity of `G`
it says that `[N]`, the `N`-th power of the identity in the group of endomorphisms, is the trivial
endomorphism. This is the input which turns a Drinfeld point of exact order `N` into an
`N`-torsion section and which makes the factorisation construction of the dual isogeny possible.

**Dependencies.** Mathlib's affine group-scheme and Hopf-algebra APIs, in particular
`AlgebraicGeometry/Group/Affine.lean` and `Morphisms/FlatRank.lean`, and Tau Ceti's Cartier duality
over an affine base (§Exact supplier contracts).

**Further sources.** EGM (3.22)–(3.24) construct the Cartier dual of a commutative finite locally
free group scheme over an arbitrary base, with biduality, equality of ranks, compatibility with base
change and the duality between `ℤ/N` and `μ_N`; EGM (4.46) is the multiplicativity of the rank in
short exact sequences over a connected base. Tate–Oort, §1, is the published proof, over an
arbitrary base, of Deligne's theorem that a commutative finite locally free group scheme of rank `N`
is killed by `N`.

### 0.3. Finite quotients and torsors

Prove three separate results.

1. **Affine quotients.** For a finite group acting on `Spec A`, Tau Ceti supplies `Spec A^G`
   with its projection (`TauCeti.AffineInvariantQuotient.quotient`, `projection`), its
   universal property for affine targets (`desc`, `existsUnique_desc`) and for an arbitrary
   scheme target (`existsUnique_desc_of_finite`: the projection is a categorical quotient in all
   schemes), integrality of the projection, and its finiteness when `A` is a finite-type algebra
   over an invariant base ring on which the action is by base-algebra automorphisms
   (`TauCeti.AffineInvariantQuotient.isFinite_projection_of_finiteType`). When the action is
   free, in the sense that for every `g ≠ 1` the elements `g • a − a` generate the unit ideal of
   `A`, the projection is finite étale (`isFinite_projection_of_free`, `etale_projection`) and
   the action map `⨆_{g ∈ G} Spec A ⟶ Spec A ×_{Spec A^G} Spec A` is an isomorphism
   (`isPullback_of_free`), the torsor square of the Chase–Harrison–Rosenberg theorem, with no
   reducedness, finite-type or invertible-order hypothesis. Every later moduli application that
   uses the finite-type finiteness statement must verify its hypothesis.
2. **Finite group-scheme torsors.** For a finite locally free group scheme acting on an affine
   scheme, develop the Hopf–Galois criterion, the invariant algebra, faithful flatness, and descent.
   Prove that a torsor action has the affine fppf quotient with the expected universal property.
3. **Finite locally free equivalence relations and free actions.** Prove SGA 3, Exposé V,
   Théorème 4.1 in the affine case: if `X` is affine and `R ⇉ X` is an equivalence relation whose
   two projections are finite locally free, then the quotient `X/R` exists, is affine, the map
   `X ⟶ X/R` is finite locally free and surjective, and `R = X ×_{X/R} X`; hence `X/R` represents
   the fppf quotient sheaf. Deduce the constant-group case: if a finite constant group acts freely
   on `X` and `X` has a group-invariant affine open cover, glue the affine invariant quotients of
   item 1, whose torsor squares are the affine case, and prove that the result represents the
   fppf quotient. Prove that the affine simultaneous moduli
   schemes used in Layers 3, 5, and 6 satisfy this hypothesis. Without such a cover the fppf
   quotient is generally only an algebraic space, and no unrestricted scheme-quotient theorem is
   asserted. The equivalence-relation form, not only the group form, is used in Layer 3.5, because
   the Legendre rigidifier over `ℤ[1/2]` is finite étale but not Galois.

Develop the finite-flat torsor statements needed for rigidifiers and descent.

**Dependencies.** Layer 0.2 for the group-scheme statements; Tau Ceti's affine invariant quotient
and Mathlib's scheme gluing. The special quotient of an elliptic curve by a finite subgroup is constructed only
after elliptic curves exist, in Layer 2.2.

**Further sources.** SGA 1, Exposé V, Proposition 1.1 and Proposition 1.8, for the quotient by a
finite group: integrality over the invariants, orbits as fibres, and the criterion that the action
is admissible, so that the quotient exists with these properties, exactly when every orbit lies in
an affine open; Corollaire 2.3 and Proposition 2.6 there for free actions, with the quotient locally
noetherian and the scheme finite over it. EGM (4.8) for a finite group acting on an affine scheme,
and (4.16) for a finite locally free group scheme over an arbitrary base, with the torsor property
of a free action. Stacks Project, Tag 03BM, for the quotient of an affine scheme by a finite locally
free equivalence relation, and Tag 03JE for invariant affine neighbourhoods. Rydh, Theorem (4.1),
Lemma (4.3) and Theorem (4.4), treats finite locally free groupoids, which is more general, and
Theorem (2.16) there gives the quotient of a free action as an algebraic space with no condition on
affine opens.

### 0.4. Finite étale schemes and Galois actions

Develop the finite étale results used by the level structures: sections, fibre cardinalities, local
constancy, and descent. Cancellation (a morphism between finite étale `S`-schemes is finite and
étale: the instances `FiniteEtaleScheme.isFinite_hom_left` and `FiniteEtaleScheme.etale_hom_left`)
and splitting on an étale neighbourhood of each base point
(`AlgebraicGeometry.Scheme.Hom.exists_split_etaleLocally`, Stacks, Tag 04HN) are Tau Ceti's
(§Exact supplier contracts).

Over a field `K` with separable closure `Ω`, the equivalence between finite étale `K`-schemes and
finite continuous `Gal(Ω/K)`-sets is Tau Ceti's `FiniteEtaleScheme.galoisEquivalence K Ω`. It
preserves finite products, and Tau Ceti transports along it group objects with their
homomorphisms (`galoisEquivalenceGrp`), commutative group objects (`galoisEquivalenceCommGrp`) and
bilinear alternating pairings (`galoisEquivalenceAlternatingPairingEquiv`); none of this is
rebuilt here. A group scheme over `Spec K` whose underlying scheme is finite étale enters these
equivalences through `FiniteEtaleScheme.essImage_mapGrp_ι_iff`. This is the input for `V_ρ` in
Layer 5.3.

**Dependencies.** Mathlib's finite étale and Galois theory, and Tau Ceti's finite étale schemes and
their Galois description (§Exact supplier contracts).

**Further sources.** EGM (3.26), for group objects: étale group schemes over a field correspond to
groups with a continuous action of the Galois group.

### 0.5. Effective descent and spreading out

Effective faithfully flat descent, with cocycle and uniqueness statements, is used below in the
following forms. Those at the pin are consumed from Tau Ceti and Mathlib (§Exact supplier
contracts) and are not reproved:

- sections and morphisms along a flat surjective morphism which is quasi-compact or locally of
  finite presentation (`TauCeti.sectionDescentEquiv`, `TauCeti.homDescentEquiv`,
  `DescentDatum.baseChangeHomEquiv`, with Mathlib's effective-epimorphism instances and the
  subcanonical `Scheme.fpqcTopology`);
- schemes affine over `S'` along an affine flat `p : S' ⟶ S`, over an arbitrary base `S`, with the
  descended scheme and its cartesian square (`DescentDatum.descended`,
  `DescentDatum.isIso_toBaseChangeDescended_hom`, `DescentDatum.isPullback_toDescended`), and
  affine schemes over affine bases (`DescentDatum.exists_isAffine_baseChange_hom_isIso`);
- finite locally free schemes over an affine base, with their rank
  (`DescentDatum.exists_finiteLocallyFree_baseChange_hom_isIso`), and closed subschemes along an
  affine, flat and surjective `p` (`DescentDatum.isClosedImmersion_descended_hom`);
- the base change of `Proj` of a descended graded algebra
  (`TauCeti.Algebra.DescentDatum.isPullback_proj_map_descendedGradedVal`).

Prove the remaining forms:

- schemes affine over `S'` along a flat surjective quasi-compact `p` which need not be affine
  (Stacks, Tag 0245): over each affine open `U` of `S`, replace `p` by a finite disjoint union of
  affine opens covering `p⁻¹ U`, to which the second case above applies, and glue;
- finite locally free schemes, with their rank, over an arbitrary base, and closed subschemes along
  a `p` which need not be affine, by the same reduction;
- projective relative curves equipped with a compatibly descended relatively ample line bundle,
  from the `Proj` comparison applied to the section ring of the line bundle;
- group objects and homomorphisms on an underlying scheme already descended by one of these
  effective cases;
- the group law and all group axioms;
- finite locally free subgroup schemes and equalities of Cartier divisors;
- level structures;
- finite group actions and torsors.

Do not assert effectivity for an arbitrary projective scheme without descended polarisation data.
For spreading out, prove finite-presentation models for a polarised relative curve, section, group
law, subgroup, and level data; prove that morphisms and equalities descend to a common model; and
prove that the agreement locus for two finitely presented morphisms is representable and contains
the original base after enlargement. Equality on geometric fibres is not used as a substitute for
equality over a nonreduced base. The elliptic application using `𝒪_E(3[0])` is Layer 1.5, after that
line bundle has been constructed.

**Dependencies.** Mathlib's descent, fpqc-topology and finite-presentation machinery, and Tau
Ceti's descent library (§Exact supplier contracts).

**Further sources.** Stacks Project, Tag 0CCJ: along a surjective finite locally free morphism, a
descent datum on a scheme which carries an ample invertible sheaf is effective. The covering there
is finite locally free and not an arbitrary fpqc covering, so this is a different hypothesis from
the polarised statement used here; it applies to the finite locally free coverings of Layer 3.5.

### 0.6. Hom-schemes and closed loci

Construct the representable Hom functors used in Layers 0.8 and 4. The required general result is the
finite-locally-free Weil-restriction case: if `Z ⟶ S` is finite locally free and `X ⟶ Z` is affine
of finite presentation, the functor of `Z`-morphisms is represented by an affine `S`-scheme.
Deduce the special cases representing:

- tuples of sections of a finite locally free `S`-scheme;
- homomorphisms between finite locally free group schemes;
- the ambient schemes in which the full-set, exact-order, and full-level loci are cut out.

Prove compatibility with arbitrary base change.

**Dependencies.** Layer 0.2 and Mathlib's representable-functor and affine-scheme APIs.

### 0.7. Parameter spaces for subgroup schemes

Weil restriction represents maps from a fixed finite locally free source; it does not parameterise
all subgroup schemes. This block owns the relative Grassmannian of a finite locally free
`𝒪_S`-module `E` on a scheme `S`: the functor sending `T → S` to the set of locally free rank-`N`
quotients of `E_T` modulo quotient isomorphism. Mathlib supplies the module-valued functor
`Module.Grassmannian.functor` on affine bases. Tau Ceti supplies the affine case, over
`S = Spec R` for a module `M` (§Exact supplier contracts): the scheme
`Module.Grassmannian.scheme R M N` glued from the standard charts, one for each `N`-tuple of
elements of `M` (the locus where the universal quotient restricted to those elements is an
isomorphism), with their transition maps (`glueData`, `chartι`), its structure morphism `toSpec`,
its functor of points (`schemeHomEquiv`: the morphisms `Spec A ⟶ G(N, M)` over `Spec R` are the
points of `Module.Grassmannian R M N` over `A`, naturally in `A`), properness over `Spec R` for
`M` finite (`isProper_toSpec`) and local finite presentation for `M` finitely presented, the
universal quotient closed subscheme over `G(N, H) ×_R Spec H` for an algebra `H`
(`schemeUniversalIdeal`), and for a Hopf algebra `H` the closed Hopf-ideal locus
`schemeHopfIdealLocus`, the finite locally free subgroup scheme of rank `N` attached to each of
its points with the bijection between its points and such subgroup schemes (`subgroupScheme`,
`hopfIdealLocusEquivClosedSubgroupScheme`), and the universal family over the locus, finite over
it, whose fibre over a point is that subgroup scheme (`schemeHopfIdealLocusFamily`,
`isPullback_schemeHopfIdealLocusFamilyHom`). This block owns the relative
version: glue these affine Grassmannians over trivialising affine covers of `E` on an arbitrary
base `S`, prove independence of the cover and of the trivialisations, construct the universal
quotient and its kernel, and prove the universal property and compatibility with arbitrary base
change, identifying the restriction to an affine open `Spec R` on which `E` is the sheaf of `M`
with Tau Ceti's scheme, naturally in `R`-algebras. Rank-`d` subbundles of a rank-`n` bundle
correspond to rank-`(n − d)` quotients, or to rank-`d` quotients of the dual; supply both
comparisons with their universal bundles.

Identify the rank-one case with the quotient-convention projective bundle: for `F` finite locally
free, `Grass_1(F) ≅ Proj_S(Sym F)`, the relative Proj of StableReduction Layer 2 applied to
AlgebraicVectorBundles L2A's `gradedSymmetricAlgebra F`, generated in degree one by `F`. Prove
here that formation of `Proj_S(Sym F)` commutes with arbitrary base change (one line from the
affine graded-ring and base-change comparisons of AlgebraicVectorBundles L2A; StableReduction
Layer 2 supplies the relative Proj and its affine comparison, not this base-change
isomorphism), that the pullback of `F` to `Proj_S(Sym F)` mapping onto `𝒪(1)` is the universal
rank-one quotient, and that the identification and its `𝒪(1)` comparison commute with arbitrary
base change. Then construct the Plücker map `Grass_N(E) → Grass_1(∧^N E) = P(∧^N E)`
classifying the universal exterior-power quotient `∧^N E_T → det Q` (exterior powers and
determinants from AlgebraicVectorBundles L0C), and prove that it is a closed immersion whose
pullback of `𝒪(1)` is `det Q`, compatibly with arbitrary base change. "Projective" means a closed
immersion into the projective bundle of a finite type quasi-coherent sheaf (Stacks, Tag 01W8),
with base change and stability under composition with closed immersions; no globally trivial
projective ambient space is assumed.

The ownership boundary with AlgebraicModuliForArithmeticGeometry §1.3: this block owns the finite
locally free quotient Grassmannian with its charts, universal quotient, rank-one identification
and Plücker closed immersion, because the projectivity of the Hopf-locus parameter scheme below,
and with it the "projective plus quasi-finite implies finite" step of Layer 9.1, rest on it. The
scheme-theoretic description of the image of the Plücker map by the quadratic Plücker relations,
the coherent extension to finite-type quasi-coherent `E` (whose Plücker embedding that roadmap
obtains by restricting this block's closed immersion along a local presentation `𝒪_S^n → E`),
the relative tangent sheaf, smoothness of relative dimension `N(n − N)` with its extreme-rank
cases, and flag schemes are that roadmap's and are not stated here.

**Checks.**

- For `E = 𝒪_S²` and `N = 1` the two charts are affine lines over `S` glued along `x ↦ x⁻¹` on
  the complement of the origin, and the rank-one identification gives `ℙ¹_S`; a construction
  that glued the two charts along the identity would produce the affine line with a doubled
  origin, which is not separated.
- `Grass_0(E) = S` and `Grass_n(E) = S` for `E` of constant rank `n`, and `Grass_N(E)` is empty
  for `N > n` over a nonempty base. A quotient functor that forgot "locally free" would admit,
  over a local base `S` with closed point `s`, the quotient `𝒪_S → 𝒪_S/𝔪_s` of `𝒪_S`, of rank
  one at `s` and zero elsewhere; `Grass_1(𝒪_S)` has exactly one `T`-point for every `T`.
- For `E = 𝒪_S⁴` and `N = 2`, the Plücker map sends the point of the chart indexed by the first
  two basis vectors with quotient matrix `((1,0,a,b),(0,1,c,d))` to
  `(1 : c : d : −a : −b : ad − bc)` in `P(∧²E) = ℙ⁵_S`, coordinates ordered `p₁₂, p₁₃, p₁₄, p₂₃,
  p₂₄, p₃₄`, and the image satisfies `p₁₂p₃₄ − p₁₃p₂₄ + p₁₄p₂₃ = 0`; a map built from the
  `2 × 2` minors without the alternating signs of the exterior power would give `(1, c, d, a, b,
  ad − bc)`, for which the left side is `2(ad − bc)`.
- `Proj_S(Sym 𝒪_S²)` over `S = Spec ℤ`, base-changed to `Spec 𝔽_p`, is `ℙ¹_{𝔽_p}` with the same
  two charts, as the base-change statement requires.

Given a finite locally free commutative group scheme `G/S`, apply the construction to its Hopf
algebra. Cut out the unit, multiplication, counit, comultiplication, antipode, and Hopf-ideal
equations as closed loci. Prove that the relative spectrum of the universal quotient is a finite
locally free subgroup scheme of `G`, has rank `N`, and commutes with arbitrary base change. Over
an affine base this is Tau Ceti's Hopf-ideal locus with its universal subgroup scheme (above);
owned here are the gluing over `S`, the compatibility with base change (which the library does
not prove even over an affine base) and the projectivity. The resulting parameter scheme is
projective and finitely presented over `S`, with the stated universal subgroup. It is not asserted
to be finite: for example, rank-`p` subgroup schemes of `α_p²` form a positive-dimensional family. The elliptic specialisation `G = E[N]` and the name
`[N-Isog]` occur only in Layer 9, after `E[N]` exists.

**Dependencies.** Layer 0.2 (finite locally free group and Hopf algebras, closed-locus equations),
Mathlib's `Module.Grassmannian.functor`, Tau Ceti's affine Grassmannian scheme with its
Hopf-ideal locus (§Exact supplier contracts), Mathlib's exterior algebra, scheme gluing and
morphism properties; AlgebraicVectorBundles L0B–L0C and L2A; StableReduction Layer 2 for the
relative Proj. Weil restriction in Layer 0.6 is a separate parameter-space construction, not an input to the
Grassmannian.

### 0.8. Full sets, `A`-structures, and generators

References: KM 1.6.2, 1.8.2, 1.8.4, 1.9.1, 1.10.14–1.10.15, and §1.11.

Let `Z ⟶ S` be finite locally free of rank `r`, and let `s₁,…,s_r` be sections. Define them to be a
**full set of sections** when the following holds **after every base change** `T ⟶ S`: for every
function `f` on `Z_T`,

```text
Norm_{Z_T/T}(f) = ∏ᵢ s_{i,T}^*(f).
```

The universal quantification over base changes is part of the definition. Reduce it to the single
universal polynomial case by the argument in the proof of KM Proposition 1.9.1, not KM 1.8.4,
which is the disjoint-union lemma (a full set for `Z₁` and one for `Z₂` give one for
`Z₁ ⊔ Z₂`). Prove the equivalent characteristic-polynomial formulation of KM 1.8.2, fppf locality,
and arbitrary base-change compatibility.

Using Layer 0.6, construct the ambient Hom-scheme, the universal family of sections, and the closed
subscheme cut out by the norm or characteristic-polynomial identities. Prove independence of an
affine presentation, gluing, and the universal property (KM 1.9.1 and 1.10.13(1); KM 1.6.2 cuts
out the *`A`-structure* locus by the subgroup condition 1.3.7, and is the right citation for the
exact-order locus of Layer 4.1 rather than for this one).

For a finite abelian group `A`, define an `A`-structure on a finite locally free commutative group
scheme `G` and an `A`-generator in the sense of KM Chapter 1. Construct their representing loci and
prove:

- arbitrary base change and fppf descent;
- the subgroup-divisor criterion;
- the extension results of KM §1.11, in their exact generality. Let `0 → G₁ → G → G₂ → 0` be
  a short exact sequence of finite locally free commutative group schemes of ranks `N₁, N, N₂`,
  and `0 → A₁ → A → A₂ → 0` a short exact sequence of finite abelian groups of the same orders,
  with compatible homomorphisms `φ₁, φ, φ₂` to the `S`-points.
  - **KM 1.11.3**, arbitrary base: if `φ₁` is an `A₁`-generator of `G₁` and `φ₂` is an
    `A₂`-generator of `G₂`, then `φ` is an `A`-generator of `G`. This is transitivity of the
    norm.
  - **KM 1.11.2**, the criterion: if `S` is connected and `G₂` is **finite étale**, then for
    `φ : A → G(S)` with kernel `K` of the composite `A → G₂(S)`, `φ` is an `A`-generator of `G`
    if and only if `|K|` is the rank of `G₁` and `φ|K` is a `K`-generator of `G₁`, and `|A/K|` is
    the rank of `G₂` and the induced `A/K → G₂(S)` is an `A/K`-generator of `G₂`.
  - **KM 1.11.4–1.11.5**, the converse of 1.11.3 is false in general: over an `𝔽_p`-algebra
    `R`, for `ζ ∈ μ_p(R)`, the map `ℤ/p ⊕ ℤ/p → μ_{p²}`, `(a,b) ↦ ζ^a`, is a generator of
    `μ_{p²}` while `a ↦ ζ^a` need not be a generator of `μ_p` (take `R = 𝔽_p[X]/(X^p − 1)`,
    `ζ = X`); the product examples with `α_p × α_p` and `μ_p × μ_p` show that neither
    end need be a generator when the middle is. Retain the `μ_{p²}` example as a regression
    test; no unrestricted equivalence is stated.
- product decompositions for factors of coprime order (KM 1.10.14–1.10.15);
- factorisation into the prime-primary parts of `A`;
- the corresponding decomposition of full sets of sections and generator schemes.

This general finite-abelian-group package is the prime-power reduction used in Layer 8; the roadmap
does not replace it by four unrelated factorisation arguments.

**Dependencies.** Layers 0.1, 0.6, and the norm theory for finite locally free algebras.

**Further sources.** Conrad, Lemma 2.3.1, states the mechanism of KM 1.11.2 for a short exact
sequence of finite locally free commutative group schemes of constant rank with étale quotient;
constant rank takes the place of connectedness of the base. Česnavičius, Definition 4.2.2 and Remark
4.2.3: the definition of an `A`-structure for subgroups of the smooth locus of a generalized
elliptic curve, and the statement that it is an isomorphism of the constant group onto a subgroup
when the order of `A` is invertible.

### 0.9. Henselisation, regularity, and flatness

This section owns the general scheme-level API on local rings, regularity, and flatness that the
roadmap uses:

- strict henselisation, strictly henselian local rings, the recognition of henselisations, the
  maps out of them and their uniqueness, and completion of strict henselisations (the paragraph
  *Strict henselisation* below);
- comparison of a finite moduli scheme after strict henselisation and completion (used in
  Layer 8.2);
- regular schemes in terms of regular local rings and Krull dimension at a point;
- preservation and reflection of regularity and dimension under completion of noetherian local
  rings, which are at the pin (`TauCeti.AdicCompletion.ringKrullDim_eq`, Stacks, Tag 07NV;
  `TauCeti.AdicCompletion.isRegularLocalRing_iff`, Stacks, Tag 07NY; §Exact supplier contracts)
  and are consumed, not restated;
- locality and invariance under isomorphism and étale morphisms;
- openness of the regular locus for schemes locally of finite type over an excellent base,
  as in the finite-type integral rigidifiers of Layer 3.5; openness of the flat locus for the
  finite algebras over locally noetherian bases occurring in the proofs of Layer 8. State and verify
  these hypotheses; there is no unrestricted regular-locus openness theorem;
- the coherent kernel/cokernel support argument used in the homogeneity argument of Layer 8.3;
- miracle flatness for finite morphisms between regular local schemes of equal dimension;
- descent of regularity and the corrected dimension condition along the finite faithfully flat
  covers occurring in KM's Notes Added in Proof;
- local constancy of the rank of a finite locally free morphism, and constancy when the
  target is connected. Over arbitrary bases, keep the local finite-presentation hypothesis
  from Layer 0.2; finite and flat alone does not supply it.

**Strict henselisation.** The construction is Tau Ceti's `TauCeti.StrictHenselization.algebra R Ω`
(§Exact supplier contracts); `Suggested.lean` states the targets below that are not at the pin
except the colimit at a prime, the completion clauses and normality, which are specified here
only. Let `(R, 𝔪, κ)` be a local ring and `Ω` a separable closure of `κ` (Mathlib
`IsSepClosure κ Ω`, an `R`-algebra through `R → κ`). The construction is the filtered colimit of
étale neighbourhoods of Stacks, Tag 04GW, pointed by an `R`-algebra map to `Ω`. The henselisation
`R^h` of the local ring `R` is Tau Ceti's `TauCeti.Henselization.algebra (maximalIdeal R)`
(§Exact supplier contracts), the henselisation of the pair `(R, 𝔪)` as the colimit of the étale
`R`-algebras `B` with `R/𝔪 ≅ B/𝔪B` (Stacks, Tag 0A02; Tag 0A03 identifies it with the
henselisation of the local ring): a henselian local ring, local over `R` with the residue field
of `R` (`henselianLocalRing`, `isLocalHom_algebraMap`, `residueField_map_bijective`), universal
among local maps to henselian local rings (`existsUnique_isLocalHom`), equal to `R` when `R` is
henselian (`algEquivOfHenselianRing`) and ind-étale (`indEtale`), with the comparison
`fromHenselization : R^h → R^{sh}` of Tag 04GP, (1), the unique `R`-algebra map between the two
(`eq_fromHenselization`), compatible with the maps to `Ω` (`toTarget_comp_fromHenselization`).
The predicate `IsHenselization` below recognises both constructions:

- `IsPointedNeighbourhood R Ω`, an `ObjectProperty` on the étale algebras over `R` pointed by an
  `R`-algebra map to `Ω`, with its full subcategory `Neighbourhood R Ω`, equivalent
  (`tripleCategoryEquivalence`) to the category of triples `(S, 𝔮, φ)` of Stacks, Tag 04GW, at
  `𝔭 = 𝔪`: `𝔮` is the kernel of `S → Ω` and `φ : κ(𝔮) → Ω` the induced embedding. The category is
  filtered (`neighbourhood_isFiltered`, Tag 04GW: tensor products give common targets, and two
  parallel maps `f, g : B → C` are equalised in a localisation of `C` at an element which the
  pointing sends to a unit, because the pointings of `B` along `f` and along `g` agree) and
  essentially small (`neighbourhood_essentiallySmall`: étale algebras are of finite type).
- The **strict henselisation** `algebra R Ω`, the colimit of the pointed étale algebras over a
  small model, with `stage`, `stage_naturality`, `desc`, `exists_stage_eq`, `hom_ext`, and the map
  `toTarget : algebra R Ω →ₐ[R] Ω` induced by the pointings, with `toTarget_comp_stage`. This is
  Stacks' strict henselisation of `R` with respect to `κ ⊆ Ω` (Tag 04GQ, constructed in Tag 04GP;
  Tag 04GW identifies it with this colimit). Every statement here is about this colimit.
- **Strictly henselian local rings** (Stacks, Tag 04GF). The class `IsStrictlyHenselianLocalRing S`
  extends Mathlib's `HenselianLocalRing S` by the field `isSepClosed_residueField`: the residue
  field of `S` is separably closed. The instance `IsStrictlyHenselianLocalRing.of_isSepClosed`
  builds it from the pair `HenselianLocalRing S` and `IsSepClosed (ResidueField S)`, so a statement
  that takes the class applies under the pair. Conversely the parent projection is an instance and
  the field is supplied by name: it is not an instance, as Mathlib's `IsSepClosure.sep_closed` is
  not, since with `of_isSepClosed` it would close a cycle of instances; a statement at the pin that
  takes the pair (such as `exists_isLocalHom_lift`) applies under the class with that one term.
  Prove `IsStrictlyHenselianLocalRing.tfae`: for a local ring `(S, 𝔪_S, κ_S)` the following are
  equivalent: `S` is strictly henselian; `S` is henselian and `κ_S` is separably closed; every
  étale `S`-algebra `T` with a prime `𝔮` lying over `𝔪_S` has a unique `S`-algebra retraction
  `τ : T → S` with `τ⁻¹(𝔪_S) = 𝔮` (Stacks, Tag 04GG, (8)). From the first two to the third: the
  extension `κ(𝔮)/κ_S` is finite separable, hence trivial, and Tag 04GG applies. Conversely Tag
  04GG gives henselianity, and for a separable irreducible `ḡ ∈ κ_S[x]` with a monic lift `g`, the
  retraction of the standard étale algebra `S[x, 1/g']/(g)` at the prime over `𝔪_S` is a root of
  `ḡ` in `κ_S`, so `ḡ` is linear. With `isSepClosed_residueField_strictHenselization` below, the
  instance `StrictHenselization.isStrictlyHenselianLocalRing_algebra` makes `R^{sh}` strictly
  henselian.
- The properties of Stacks, Tag 04GP, at the pin: `henselianLocalRing`, `isLocalRing`,
  `isLocalHom_algebraMap`, the filtered-colimit description (`neighbourhood_isFiltered`, `algebra`,
  and its consequence `exists_stage_eq`), `maximalIdeal_eq_map` (`𝔪 R^{sh}` is the maximal ideal),
  and `ker_toTarget_eq_maximalIdeal` with `toTarget_surjective` (`R^{sh}/𝔪 R^{sh} = Ω` over `R`).
  The one part of clause (2) not at the pin is the target
  `isSepClosed_residueField_strictHenselization`: the residue field of `R^{sh}` is separably
  closed, which follows from the last two through the isomorphism `R^{sh}/𝔪 R^{sh} ≅ Ω` and
  `IsSepClosed Ω`. Clause (1) of Tag 04GP, the local map `R^h → R^{sh}`, is `fromHenselization`
  at the pin.
- The **universal property** `existsUnique_lift` (Stacks, Tag 08HQ applied to each stage), at the
  pin: for a ring map `R → S` with `S` henselian local and a field map `φ : Ω → κ_S` compatible
  with `R`, there is a unique `R`-algebra map `f : R^{sh} → S` with `f mod 𝔪_S = φ ∘ toTarget`;
  such an `f` is local (`isLocalHom_lift`). Its consequence `exists_isLocalHom_lift`: a local
  homomorphism `R → S` into a strictly henselian local ring extends to a local homomorphism
  `R^{sh} → S` (a `κ`-embedding `Ω → κ_S` exists because `κ_S` is separably closed). The
  Stacks-form companion `existsUnique_algHom_of_etale` (Stacks, Tag 04GT with `S = R`): for `A`
  étale over `R`, a prime `𝔮` of `A` and an `R`-embedding `φ : κ(𝔮) → Ω`, there is a unique
  `R`-algebra map `f : A → R^{sh}` with `f⁻¹(𝔪_{R^{sh}}) = 𝔮` inducing `φ` on residue fields.
- **Functoriality** `map` with `existsUnique_map`, `map_id` and `map_comp` (Stacks, Tag 04GU), at
  the pin: a ring map `R → S` and a local field map `Ω_R → Ω_S` compatible with it induce a
  unique local `R^{sh} → S^{sh}` over `R → S` compatible with the maps to `Ω_R` and `Ω_S`; and
  `quotientAlgEquiv`, the strict henselisation of `R/I` as the quotient of `R^{sh}` by `I R^{sh}`.
- **The colimit at a prime** (Stacks, Tag 04GW), a prose target: for any ring `R`, prime `𝔭`
  and separable closure `Ω` of `κ(𝔭)`, the strict henselisation of `R_𝔭` with respect to `Ω` is
  the colimit over the triples `(S, 𝔮, φ)` with `R → S` étale, `𝔮` over `𝔭` and `φ : κ(𝔮) → Ω` a
  `κ(𝔭)`-embedding, of `S` and also of `S_𝔮`.
- **Noetherianity and completion** (More on Algebra, Stacks, Tag 06LJ, the clauses about
  `R^{sh}`): the target `isNoetherianRing_strictHenselization_iff` (`R` is Noetherian iff `R^{sh}`
  is). In that case `(R^{sh})^∧` is a Noetherian complete local ring (clause (a)),
  `R^{sh} → (R^{sh})^∧` is flat (clause (c)), `R^∧ → (R^{sh})^∧` is formally smooth in the
  `𝔪_{(R^{sh})^∧}`-adic topology (clause (d)), and `((R^∧)^{sh})^∧ = (R^{sh})^∧` (clause (f)).
  The clause of Tag 06LJ that `R` is Noetherian iff `R^h` is, is at the pin
  (`TauCeti.Henselization.isNoetherianRing_iff_of_le_jacobson` at `I = 𝔪`); its remaining
  clauses about `R^h` are not used by this roadmap and are not stated. Completions are Mathlib's
  `AdicCompletion` at the maximal ideal.
- **Recognising a henselisation** (Stacks, Tags 04GQ, 08HR and 08HT). For a commutative ring `R`,
  a field `L` with an `R`-algebra structure, and an `R`-algebra map `ψ : A → L` with `A` in the
  universe of `R`, the class `IsHenselization ψ` has three fields: `A` is a henselian local ring
  (`henselianLocalRing`), `A` is ind-étale over `R` (`indEtale`, Tau Ceti's
  `TauCeti.Algebra.IndEtale`: a small filtered colimit of étale `R`-algebras in `CommAlgCat R`),
  and `ψ` is surjective (`surjective`), so that `ψ` identifies `L` with the residue field of `A`.
  The definition makes no hypothesis on `R`: the point `R → L` determines the prime
  `𝔭 = ker(R → L)`, and `A` is then a henselisation of `R_𝔭`. For `R` local, `L = κ` gives the
  henselisation `R^h` and `L` a separable closure of `κ` the strict henselisation (Tag 04GQ), so
  one predicate serves both, and every model, the colimit here or a stalk of the étale structure
  sheaf, is compared with the others through it. The target `StrictHenselization.isHenselization`
  (an instance): for `R` local and `Ω` a separable algebraic extension of `κ`, in particular a
  separable closure, `toTarget : R^{sh} → Ω` is a henselisation. The first and third fields are
  `henselianLocalRing` and `toTarget_surjective` at the pin; the second is
  `TauCeti.Algebra.IndEtale.of_isColimit` applied to the colimit presentation of `algebra R Ω`
  over the small model of `Neighbourhood R Ω`. The target `IsHenselization.existsUnique_comp_eq`
  gives the maps out of an ind-étale algebra into a henselian local ring (Tag 08HR, in its own
  generality): if `A` is ind-étale over `R`, `ψ : A → L` is an `R`-algebra map to a field and
  `χ : B → L` is a surjective `R`-algebra map from a henselian local ring `B`, there is exactly
  one `R`-algebra map `f : A → B` with `χ ∘ f = ψ`. It is assembled stage by stage from Tag 08HQ,
  applied over the localisation of `R` at `ker (R → L)` to each étale stage `A_i` of `A`, for
  the prime `ker (ψ|A_i)` and the residue map `κ(ker ψ|A_i) → L ≅ κ_B`, the stage maps being
  compatible by their uniqueness. Neither henselianity of `A` nor surjectivity of `ψ` is used,
  so the statement applies to the stages `A_i` as well as to a henselisation `A`, which is how
  the colimit argument below uses it; for `A` henselian local and `ψ` surjective it is Tag 08HR
  as printed. Surjectivity of `χ` is necessary for existence, since `L` must embed in `κ_B` over
  `R`. The target `IsHenselization.bijective_of_comp_eq` is the uniqueness:
  if moreover `χ : B → L` is a henselisation at the same point, every such `f` is bijective. The
  two together are Tag 08HT: two henselisations at the same point are isomorphic over `L` by
  exactly one `R`-algebra isomorphism, `AlgEquiv.ofBijective` of the unique compatible map, so the
  comparison is data and never a chosen isomorphism. For `A = R^{sh}` the map is
  `TauCeti.StrictHenselization.lift` along the map `Ω → κ_B` inverse to the residue isomorphism
  induced by `χ`, compatible with `toTarget` and `χ`, the only one by `existsUnique_lift`.
- **Discrete valuation rings** (Stacks, Tag 0AP3, the passage from `R` to `R^{sh}`). The target
  `StrictHenselization.isDiscreteValuationRing_algebra`: for a discrete valuation ring `R` and a
  separable closure `Ω` of its residue field, `R^{sh}` is a discrete valuation ring with residue
  field `Ω`; the target `StrictHenselization.irreducible_algebraMap`: an irreducible element `π`
  of `R`, that is a uniformizer, has irreducible image in `R^{sh}`, so it is a uniformizer of
  `R^{sh}`. The first is stated on the instance `StrictHenselization.isDomain_algebra`: for `R` a
  local normal domain, `R^{sh}` is a domain (Stacks, Tag 06DI, which also gives normality, a prose
  target). Proof: `R^{sh}` is a
  Noetherian (`isNoetherianRing_strictHenselization_iff`) local domain whose maximal ideal is
  `π R^{sh}` (`maximalIdeal_eq_map`), and `π ≠ 0` in `R^{sh}` because `R → R^{sh}` is flat
  (`TauCeti.Algebra.IndEtale.flat` with `StrictHenselization.isHenselization`) and local, hence
  faithfully flat and injective; a Noetherian local domain whose maximal ideal is principal and
  nonzero is a discrete valuation ring, and a generator of its maximal ideal is irreducible. This
  is the strictly henselian trait at a closed point of a curve, consumed by the strictly henselian
  traits of EtaleCohomologyFoundations §F.3a, and through them by the nearby cycles of
  LefschetzPencilsAndVanishingCycles Layer LPV.0 and the local monodromy arguments of the Weil
  conjectures at points of curves.

Checks for the strict henselisation:

- For a separably closed field `k` and `Ω = k`, `R^{sh} ≅ k`; more generally for `R` henselian and
  `Ω ≅ κ` over `R`, `R → R^{sh}` is an isomorphism (`algEquivOfResidueFieldEquiv`, at the pin),
  which covers the strictly henselian case. A construction that adjoined the roots of every monic
  separable polynomial over `R` without pointing would not reduce to `R` here.
- For `R = 𝔽_p` and `Ω` an algebraic closure, `R^{sh} ≅ Ω`, so `R → R^{sh}` is not an
  isomorphism: the residue field grows to `Ω` (`toTarget_surjective` with
  `ker_toTarget_eq_maximalIdeal`).
- For `R = ℤ_(p)`, `R^{sh}` is a discrete valuation ring with residue field `Ω`
  (`StrictHenselization.isDiscreteValuationRing_algebra`) and is not complete (it is countable);
  its completion is `W(Ω)`. A definition that returned the completion would fail the countability
  test.
- A separably closed field is strictly henselian, and `ℤ_(p)^{sh}` is strictly henselian while
  the complete ring `ℤ_p` is henselian but not strictly henselian (its residue field `𝔽_p` has the
  separable extension `𝔽_{p²}`). The local ring `𝔽̄_p[t]_(t)` (`p` odd) has an algebraically closed
  residue field but is not strictly henselian: `X² − (1 + t)` has the simple root `1` modulo `t`
  and no root, `1 + t` not being a square in `𝔽̄_p(t)`. A class that asked only for a separably
  closed residue field would accept it; for `IsStrictlyHenselianLocalRing.tfae`, the étale
  algebra `(S[X]/(X² − 1 − t))_X` over `S = 𝔽̄_p[t]_(t)`, at the prime `(t, X − 1)` over `(t)`,
  has no retraction.
- For any local `R`, the residue map `R^h → κ` of `TauCeti.Henselization.algebra (maximalIdeal R)`
  satisfies `IsHenselization`: `R^h` is henselian local (`henselianLocalRing`), ind-étale
  (`indEtale`) and its residue field is `κ` (`residueField_map_bijective`); and the map that
  `IsHenselization.existsUnique_comp_eq` produces for `A = R^h`, `B = R^{sh}` and `χ = toTarget`
  is `fromHenselization` (`toTarget_comp_fromHenselization`, and `eq_fromHenselization` says it
  is the only `R`-algebra map). A recognition predicate that `R^h` did not satisfy, or under
  which that map were not the unique compatible one, would be the wrong predicate.
- For `R` henselian local with residue map `R → κ`, `R` itself is a henselisation of `R` at `κ`
  (`R` is étale over itself), in agreement with `algEquivOfHenselianRing` and
  `algEquivOfResidueFieldEquiv`. For `R = ℤ_(p)`, the
  completion `ℤ_p` with its residue map to `𝔽_p` is henselian local and the map is surjective, but
  `ℤ_p` is not a henselisation: an element of an ind-étale `ℤ_(p)`-algebra comes from an étale
  `ℤ_(p)`-algebra, whose rationalisation is finite over `ℚ`, so its image in `ℤ_p` is algebraic
  over `ℚ`, while `ℤ_p` contains transcendental elements. A predicate without the ind-étale field
  would accept `ℤ_p` and would contradict the uniqueness, since `ℤ_(p)^h` is countable.
- For a field `Ω'` strictly containing `Ω`, such as `Ω(x)`, `R^{sh}` with the composite
  `R^{sh} → Ω → Ω'` is henselian local and ind-étale, but it is not a henselisation at `Ω'`: the
  map is not surjective. Without the surjectivity field, for `R` henselian with `κ` not separably
  closed, both `R` (through `R → κ → Ω`) and `R^{sh}` (through `toTarget`) would be henselisations
  at `Ω`, and the compatible map `R → R^{sh}`, not surjective, would contradict
  `IsHenselization.bijective_of_comp_eq`.
- For `R = ℤ_(p)` and the completion `ℤ_p` with its residue map to `𝔽_p`, which is henselian local
  and surjective but not a henselisation, `IsHenselization.existsUnique_comp_eq` gives exactly one
  `ℤ_(p)`-algebra map `ℤ_(p)^h → ℤ_p` over `𝔽_p`, and it is not surjective (`ℤ_(p)^h` is
  countable): `IsHenselization.bijective_of_comp_eq` needs the target to be a henselisation. For
  `A = B = R^{sh}` with `R = ℤ_(p)` and `Ω` an algebraic closure of `𝔽_p`, the `R`-algebra
  automorphisms of `R^{sh}` correspond to the automorphisms of `Ω` over `𝔽_p` (by
  `existsUnique_lift`), but only the identity is compatible with `toTarget`: a uniqueness
  statement without the compatibility `χ ∘ f = ψ` would be false. For `χ` the composite
  `ℤ_(p)^h → 𝔽_p → Ω`, not surjective, there is no map `R^{sh} → ℤ_(p)^h` over `Ω`, since `Ω` has
  no `𝔽_p`-embedding in `𝔽_p`; the surjectivity hypothesis cannot be dropped.
- For the local ring `R` of the node `y² = x²(1 + x)` at the origin over a field `k` of
  characteristic not `2`, a local domain that is not normal, `R^{sh}` is not a domain: `1 + x` has
  a square root `s ≡ 1` in `R^{sh}` (henselianity at the simple root `1`), and
  `(y − xs)(y + xs) = 0` with neither factor zero: the completion of `R^{sh}` is
  `Ω[[x, y]]/((y − xs)(y + xs))` for `Ω` the separable closure of `k`, in which both factors are
  nonzero. The normality hypothesis of `StrictHenselization.isDomain_algebra` cannot be dropped.
- For a field `k`, a local normal domain that is not a discrete valuation ring, `k^{sh}` is the
  separable closure `Ω`: a domain (`StrictHenselization.isDomain_algebra`) but not a discrete
  valuation ring, so the hypothesis of `StrictHenselization.isDiscreteValuationRing_algebra` cannot
  be weakened to normality. For `R = 𝔽_p[t]_(t)`, `R^{sh}` is a discrete valuation ring with
  uniformizer `t` and residue field a separable closure of `𝔽_p`. For `R = ℤ_(p)` the image of `p`
  in `R^{sh}` is irreducible (`StrictHenselization.irreducible_algebraMap`), while in the ramified
  extension `ℤ_(p)[√p]`, a discrete valuation ring that is not ind-étale over `ℤ_(p)`, `p` is the
  square of the uniformizer `√p`: a construction that adjoined a root of `X² − p` would fail this
  Check.

*Needs:* Mathlib `CommAlgCat`, `Over`,
`ObjectProperty.FullSubcategory`, `IsFiltered`, `SmallModel`, `Limits.colimit`, `Algebra.Etale`,
`HenselianLocalRing`, `IsSepClosure`, `IsSepClosed`, `Ideal.ResidueField`, `IsRegularLocalRing`,
`AdicCompletion`, `Algebra.FormallySmooth`, `Algebra.IsSeparable`, `List.TFAE`,
`IsDiscreteValuationRing`, `IsIntegrallyClosed`, `Irreducible`, `AlgEquiv.ofBijective`; Tau Ceti
`TauCeti.Algebra.IndEtale`, `TauCeti.Algebra.IndEtale.flat`, `TauCeti.StrictHenselization.lift`,
`TauCeti.Henselization.algebra` and `TauCeti.StrictHenselization.fromHenselization`.

**Dependencies.** Layer 0.2 for the rank statement, Mathlib's regular-local-ring theory and the
Tau Ceti carriers named above; nothing outside Layer 0.

## Layer 1: elliptic curves over a base scheme

References: KM 2.1 and Deligne–Rapoport II.1.

### 1.1. Projective Weierstrass models

For `W : WeierstrassCurve R`, Tau Ceti's `WeierstrassCurve.projModel` is the projective cubic

```text
Y²Z + a₁XYZ + a₃YZ² = X³ + a₂X²Z + a₄XZ² + a₆Z³
```

as the `Proj` of its homogeneous coordinate ring, with structure morphism `projModelOver` and
zero section `projModelZero` at `[0:1:0]`; properness, smoothness of relative dimension one when
`W.IsElliptic`, integrality over a domain, and the pointed isomorphism induced by a
`VariableChange` are in the library (§Exact supplier contracts). Prove compatibility with base
change.

`EllipticCurveGeom S`, with the pointed local-Weierstrass condition of Convention 1, is Tau
Ceti's (§Exact supplier contracts). Its atlas field and the quantifier form of Convention 1 agree
in both directions (`nonempty_pointedWeierstrassAtlas_iff`): an atlas yields, at every point, an
affine open, an elliptic equation over its coordinate ring and a pointed isomorphism over it,
comparing the chart's pullback square with Mathlib's chosen `pullback`; and a choice of such data
at every point assembles an atlas. Base change `EllipticCurveGeom.baseChange`, its pullback
square `isPullback_baseChange` and its functoriality `baseChangeMap_id`, `baseChangeMap_comp` are
in the library as well; Layer 1.1 consumes them.

**Dependencies.** Tau Ceti's projective model and Mathlib's projective spectrum, Weierstrass, and
morphism-property APIs.

### 1.2. The points dictionary

The comparison with equation-level points is stated in stages.

1. Over a field and under `W.IsElliptic`, sections of `projModel W ⟶ Spec K` are naturally
   equivalent to `W.toAffine.Point`, with infinity corresponding to the zero section. Without
   ellipticity the latter type omits singular affine points: for `y² = x³` over `𝔽₅`, the
   projective cubic has six rational points but `W.toAffine.Point` has five. A dictionary for
   a singular model must use its full point set or restrict the scheme side to its smooth locus.
2. Over a local ring, use a globally trivial line bundle and unimodular homogeneous coordinates.
3. Over a ring with trivial Picard group, use the same description after proving triviality of the
   relevant line bundle.
4. For an arbitrary base `T`, describe a `T`-point by a line bundle with three generating sections,
   satisfying the cubic equation, modulo the usual isomorphism, and prove the dictionary by Zariski
   descent.

No theorem identifies an arbitrary `T`-point with one global unimodular triple.

**Dependencies.** Layer 1.1 and Mathlib's projective-space functor of points.

### 1.3. Pole sheaves, Weierstrass coordinates, and variable changes

Construct the relative effective Cartier divisor `[0]`, its multiples, and the line bundles

```text
ℒ_n = 𝒪_E(n[0]).
```

Use fibrewise Riemann–Roch and Serre duality, followed by Grauert's theorem and cohomology and base
change, to prove for `n>0`

```text
R¹π_*ℒ_n = 0,
π_*ℒ_n is locally free of rank n,
π_*ℒ_n commutes with arbitrary base change.
```

Prove the corresponding positive-degree theorem needed by elliptic autoduality. If `M` is an
invertible sheaf whose restriction to every geometric fibre has the same positive degree `d`, then

```text
R¹π_*M = 0,
π_*M is locally free of rank d,
π_*M commutes with arbitrary base change.
```

For `d=1`, prove that the evaluation section of `M` associated to a local basis of `π_*M` has a
relative effective Cartier zero divisor of degree one, hence is the divisor of a unique section.
Prove that the degree-one divisor–section correspondence commutes with arbitrary base change and
with fppf descent; do not stop at the fibrewise calculation.

Before choosing an equation, prove the pole-filtration form of the construction. Zariski-locally on
the base, split the successive quotients in the filtration of `π_*ℒ_n`, choose `x` and `y` modulo
the lower pole-order pieces, and use the multiplication maps to obtain the unique relation in pole
order six. Prove that smoothness of the original curve makes the discriminant of this relation a
unit. This constructs a pointed Weierstrass equation rather than assuming one.

After a pointed Weierstrass trivialisation, identify that construction with the bases

```text
n=1:  1
n=2:  1, x
n=3:  1, x, y
n=4:  1, x, y, x²
n=5:  1, x, y, x², xy
n=6:  1, x, y, x², xy, x³
```

and the multiplication maps between the pole sheaves. Prove that the unique relation in pole order
six is the Weierstrass equation. These are local bases: the Hodge line need not be globally trivial
on an arbitrary base.

Define the Weierstrass variable-change group by

```text
x = u²x' + r,
y = u³y' + su²x' + t,
```

including its multiplication, inverse, action on the five coefficients, and action on `x`, `y`,
and the invariant differential. Prove the transformation law for the relation. Then prove the
classification theorem which is needed before any gluing argument:

> Every pointed isomorphism between projective Weierstrass models over the same base is induced by
> a unique variable change.

Prove the arbitrary-base version by descent from affine opens, including uniqueness on overlaps.
Only after this theorem prove that the bases and multiplication maps above are independent of the
chosen pointed equation.

Finally prove the Weierstrass-presentation theorem: a smooth proper relative genus-one curve with a
section is Zariski-locally on the base pointed-isomorphic to a projective Weierstrass model. This is
the theorem later used to show that a quotient `E/C` again satisfies the local-model condition.

**Dependencies.** Layers 0.1, 0.5, and 1.1–1.2, and the Jacobian Challenge contracts for curve
Riemann–Roch, Serre duality, Grauert's theorem, and cohomology and base change.

### 1.4. The scheme-theoretic group law

Construct the group law on the projective Weierstrass model by the following chart calculation.

1. Give a finite open cover of `E ×_S E` on which the addition formulae are regular.
2. Define the formula on each chart and prove that every pair lies in at least one chart.
3. Prove equality of the formulae as scheme morphisms on every overlap, including over nonreduced
   bases; equality on field-valued points is not sufficient.
4. Glue the chart morphisms, using the pointed-isomorphism classification of Layer 1.3 to compare
   different Weierstrass charts, and prove compatibility with arbitrary base change.
5. Construct the identity and inverse and prove associativity, commutativity, and the inverse laws.
6. Prove agreement with Mathlib's pointwise group law on every field-valued fibre.

Steps 1–5 are at the pin: Tau Ceti glues the addition morphisms of the projective models over a
pointed atlas to `EllipticCurveGeom.addition` and the negations to `neg`, proves the group axioms
on the points of every chart, and registers the result as the instances `EllipticCurveGeom.grpObj`
and `isCommMonObj` on `Over.mk E.structureMap`, with unit the zero section (`one_left`), so that
`E.toCommGrp` is the curve as a commutative group object (§Exact supplier contracts). Step 6 is
owned here. Uniqueness among all compatible group structures follows in Layer 2.4 from the theorem
that pointed morphisms are automatically homomorphisms.

**Dependencies.** Layers 0.5 and 1.1–1.3.

**Further sources.** Over a field, EGM (1.14) and (1.15): a morphism of abelian varieties is a
homomorphism followed by a translation, and the group structure with a given identity is unique and
commutative. Stacks Project, Tag 0BFD, is the commutativity.

### 1.5. The cubic polarisation and elliptic descent

Prove that the unit `𝒪_T ⟶ (π_T)_*𝒪_{E_T}` is an isomorphism for every `T⟶S`, and that this
statement is stable under further base change. Prove that `𝒪_E(3[0])` is relatively ample and
commutes with arbitrary base change.

Apply the polarised-projective descent theorem of Layer 0.5 to descend an elliptic curve together
with this polarisation and its zero section. Then descend the group law and its axioms, finite
locally free subgroup schemes, Cartier-divisor equalities, and level structures. Prove the same
statements for the universal elliptic curve in a rigidifier construction. This is the elliptic
application of the general descent machinery, not an assumption in Layer 0.5.

**Dependencies.** Layers 0.1, 0.5, and 1.1–1.4.

**Further sources.** Stacks Project, Tag 0E62(a): for a proper flat morphism `f : X ⟶ S` of finite
presentation with `H⁰(X_s, 𝒪) = κ(s)` at every point `s`, the unit `𝒪_S ⟶ f_*𝒪_X` is an
isomorphism, and remains one after every base change. This is the first statement, more generally;
its fibre hypothesis holds here because every fibre is a smooth projective Weierstrass cubic over
a field, hence geometrically integral. Stacks Project, Tag 0D3D: for a proper morphism and an
invertible sheaf, the locus of the base over which the sheaf is relatively ample is open and its
formation commutes with base change. It reduces the relative ampleness of `𝒪_E(3[0])` to the
fibres, where a divisor of degree three on a curve of genus one is ample.

## Layer 2: isogenies, duality, and the Weil pairing

References: KM 2.3.1, 2.5.1, 2.6.1–2.6.3, and §2.8.

### 2.1. Group homomorphisms, multiplication maps, and their degree

`Hom_S(E,E')` means from the outset homomorphisms of commutative group schemes over `S`: Tau
Ceti's `E.toCommGrp ⟶ E'.toCommGrp` (§Exact supplier contracts), an abelian group, with `End_S(E)`
its endomorphism ring and multiplication by an integer `n` the endomorphism
`(n : End E.toCommGrp)`, whose underlying morphism of `Over S` is `E.mulBy n`
(`intCast_hom_hom_hom`). A bare pointed scheme morphism is not silently coerced to this type. The
theorem that every pointed morphism is automatically a group homomorphism is postponed to Layer 2.4, where the relative Picard machinery used to prove it
exists.

KM 2.3.1 is proved at the pin for every integer `n ≠ 0` (§Exact supplier contracts), along the
following steps, which later layers reuse.

1. Construct `[N] : E ⟶ E` and prove compatibility with arbitrary base change.
2. On every geometric fibre, compare with the equation-level multiplication map, use the
   division-polynomial description to prove that `[N]` is nonconstant, and hence prove
   quasi-finiteness.
3. Deduce finiteness from properness and quasi-finiteness.
4. Compute the field-level degree as `N²` by the narrow function-field bridge below.
5. Deduce that every geometric fibre has length `N²` and is nonempty, and hence that `[N]` is
   surjective.
6. Prove the curve-flatness lemma used here: a finite morphism between `S`-smooth relative curves
   whose geometric fibres all have the same length is finite locally free. Derive it from the local
   criterion for flatness after noetherian approximation, then apply it to `[N]`.
7. Identify the locally constant finite-flat rank with `N²`.
8. Define `E[N]` as the scheme-theoretic kernel and prove that it is finite locally free of rank
   `N²`, with arbitrary base change.
9. Compute the differential of `[N]` at the identity and prove that `[N]`, hence `E[N]`, is étale
   where `N` is invertible.

The degree calculation in step 4 is an explicit sub-block, not the phrase “compute the fibre
length”. Over a field `K` and a projective Weierstrass model `projModel W`, prove, in order: the
function field of `projModel W` is the equation-level function field `W.toAffine.FunctionField`;
the pullback of rational functions along the scheme morphism `[N]` is, through that
identification, the equation-level pullback `fieldPullback` of Tau Ceti's
`TauCeti.Isogeny.mulByIntIsogenyOfNeZero`; the index `[K(E) : [N]^*K(E)]` is `N²`; and the
generic degree of the scheme morphism `[N]` is `N²`.

Construct the first identification from the affine `Z`-chart. Prove that the smooth projective cubic
is geometrically integral, and prove the separated-target extensionality theorem saying that two
morphisms from an integral scheme which agree at the generic point agree everywhere. Use this to
prove the second equality. For the third, consume Tau Ceti's equation-level theorem
`TauCeti.Isogeny.degree_mulByIntIsogenyOfNeZero` (`deg [n] = n²` for every integer `n ≠ 0`,
including the inseparable cases). This layer proves only the scheme/function-field comparison
needed to transport that theorem.

The scheme-theoretic statements are Tau Ceti's (§Exact supplier contracts):
`EllipticCurveGeom.mulBy n`, the `n`-th power of the identity in the group of endomorphisms of
`Over.mk E.structureMap` and the underlying morphism of `(n : End E.toCommGrp)`, with
`isFinite_mulBy_left`, `flat_mulBy_left`, `locallyOfFinitePresentation_mulBy_left`,
`surjective_mulBy_left` and `finrank_mulBy_left` (rank `n²`), packaged as `isIsogeny_intCast` and
`degree_intCast`; `E.torsion n`, the kernel of `[n]` (`torsion_eq_kernel`) and the fibre of `[n]`
over the zero section (`isPullback_torsion`), finite locally free of rank `n²`
(`finrank_torsion_hom`) and étale exactly when `n` is nonzero in every residue field of `S`
(`etale_torsion_hom_iff`); and the inclusions `torsionInclusion m n : E[m] ⟶ E[mn]` with the
multiplication maps `torsionMulBy m n : E[mn] ⟶ E[n]`, resting on the composition law `mulBy_mul`
(`[m n] = [n] ≫ [m]`). The degree bridge of step 4 is in the library as well:
`WeierstrassCurve.projModelFunctionFieldEquiv` identifies the function field of `projModel W` over
a domain with `W.toAffine.FunctionField`, `projModelFunctionFieldEquiv_mulByFunctionFieldPullback`
identifies the pullback of rational functions along `[n]` with the equation-level `fieldPullback`,
`finrank_fieldRange_mulByFunctionFieldPullback` gives `[K(E) : [n]^* K(E)] = n²`, and
`finrank_projModelMulBy` reads off the rank `n²` of `[n]` over a field; over an arbitrary base the
rank is computed on the fibres and flatness by the fibrewise criterion. Nothing of KM 2.3.1 is
restated in `Suggested.lean`. What remains owned here is the curve-flatness lemma of step 6 in its
stated generality — a finite morphism between `S`-smooth relative curves whose geometric fibres
all have the same length is finite locally free — which later layers apply to isogenies; the broad
comparison between arbitrary isogenies and function-field embeddings remains with Algebraic
Curves.

The geometric-point statement is separate and at the pin: over a separably closed field `K` in
which `N` is invertible, a homomorphism `(ℤ/Nℤ)² →* E(K)` is injective exactly when its image is
`E[N](K)` (`isFiberwiseInjective_iff_range_eq_ker`), and such a homomorphism exists
(`exists_isFiberwiseInjective`), so `E[N](K) ≅ (ℤ/Nℤ)²`. It is never used in residue
characteristic dividing `N`.
Define the locally constant degree of an isogeny and the constant-degree predicate of
Convention 3.

**Dependencies.** Layers 0.5, 1.1–1.5; Mathlib's finite, proper, function-field, local-flatness,
and fibre-length APIs; and the equation-level Weierstrass and division-polynomial API. The degree
bridge is deliberately narrower than the function-field/isogeny comparison owned by Algebraic
Curves.

**Further sources.** Over a field and in every dimension `g`, Stacks Project, Tag 0BFG, and EGM
(5.9): multiplication by `d` on an abelian variety is finite locally free of degree `d^{2g}`.
Česnavičius, Proposition 2.2.9: a homomorphism of generalized elliptic curves over an arbitrary base
is, Zariski-locally on the base, an isogeny or zero.

### 2.2. Isogenies and quotients

Define an isogeny to be a finite locally free surjective group-scheme homomorphism of elliptic
curves. For a finite locally free subgroup scheme `C ⊆ E`, construct the quotient by the following
fixed route.

1. Construct the norm functor on invertible sheaves for finite locally free morphisms, including
   its base-change, tensor-product, and tower laws. For the action `a:C×_S E⟶E` and projection
   `pr₂:C×_S E⟶E`, start from

   ```text
   Nm_pr₂(a^*𝒪_E(3[0])).
   ```

   Construct its canonical `C`-linearisation, prove the cocycle law, and prove relative ampleness.
2. Use norm sections of a sufficiently high power to obtain a `C`-invariant affine cover. Do not
   average sections: a finite flat group scheme in residue characteristic dividing its rank need
   not be linearly reductive.
3. Form the affine invariant quotients and glue them to a scheme `E/C`; prove that this scheme
   represents the fppf sheaf quotient.
4. Prove that `E ⟶ E/C` is finite locally free and that `C ×_S E ≅ E ×_{E/C} E`, so it is an
   fpqc `C`-torsor.
5. Descend the linearised ample bundle and deduce projectivity and properness of `E/C` over `S`.
6. Define the zero section as `q_C ∘ 0_E`; it is not obtained by descending a `C`-invariant
   section. Descend addition and inversion and prove their axioms by faithful-flat descent.
7. Prove smoothness and relative dimension one fpqc-locally along `E ⟶ E/C`. Prove geometric
   connectedness of the fibres. For a smooth proper one-dimensional group scheme `G/S`, identify
   its relative dualising sheaf with the pullback of its Hodge line,

   ```text
   ω_G/S ≅ π^* e^*ω_G/S,
   ```

   so it is locally generated by an invariant differential; do not assert that the Hodge line is
   globally trivial. Deduce that every geometric fibre has trivial canonical bundle and genus one.
8. Apply the Weierstrass-presentation theorem of Layer 1.3 to obtain the pointed local-Weierstrass
   atlas required by the definition of `EllipticCurveGeom`.
9. Prove arbitrary-base-change compatibility, the categorical universal property, compatibility
   with successive quotients, and uniqueness of the quotient.

This construction supplies the quotient isogeny

```text
q_C : E ⟶ E/C
```

with scheme-theoretic kernel `C`. Prove that every isogeny factors through the quotient by its
kernel and that `E/ker φ ⟶ E'` is an isomorphism.

**Dependencies.** Layers 0.1–0.3, 0.5, 1.3–1.5, and 2.1.

**Further sources.** Česnavičius, Theorem 2.2.4, constructs the quotient of a generalized elliptic
curve by a finite locally free subgroup of its smooth locus over an arbitrary base and proves that
it commutes with base change; Corollary 2.2.7 there gives the universal property of the quotient,
the identification of a surjective homomorphism with the quotient by its kernel, and successive
quotients. This is more general than the elliptic case treated here. EGM (4.39) is the quotient of a
group scheme by a finite locally free subgroup over a locally noetherian base; over a field, EGM
(5.2), (5.3) and (4.40).

### 2.3. The factorisation dual

Let the isogeny `φ : E ⟶ E'` have constant degree `n`. By Layer 0.2, `ker φ`, which has rank `n`, is
killed by `n`. Factor `[n]_E` through `E/ker φ`, identify the quotient with `E'`, and define

```text
φ̂_fac : E' ⟶ E.
```

Prove `φ̂_fac ∘ φ = [n]_E`. Use fpqc cancellation along the surjective map `φ` to prove
`φ ∘ φ̂_fac = [n]_{E'}`. Prove its degree, arbitrary base change, involutivity, compatibility
with multiplication maps, and reversal of composition. The Lean statements must display the source
and target of both composition identities.

**Dependencies.** Layers 0.2 and 2.2 and the constant-degree convention.

**Further sources.** Over a field and in every dimension, EGM (5.12), by the same factorisation of
multiplication by the degree.

### 2.4. Picard duality and comparison of the duals

Construct the relative genus-one Picard package needed here rather than assuming the field-valued
Jacobian endpoint in arbitrary families. For an elliptic curve `E/S`, write `π = E.structureMap`:

1. the fppf Picard functor, the sheafification of `T ↦ Pic(E_T)/Pic(T)`, and its zero-rigidified
   version are Tau Ceti's `relativePicardFppfSheaf π`, `relativePicardPresheaf π` and
   `rigidifiedPicardFunctor π E.zero E.zero_comp` with `rigidifiedPicardFunctorIso` (§Exact
   supplier contracts), consumed as they stand;
2. prove that `π` is `GeometricallyConnected`: the fibre over a field-valued point `Spec K ⟶ S` is
   an elliptic curve over `K` (`EllipticCurveGeom.baseChange`), which by its pointed Weierstrass
   atlas over the one-point base is the projective model of an elliptic Weierstrass curve over
   `K`, integral by `WeierstrassCurve.isIntegral_projModel` and therefore connected. The atlas is
   what the argument uses: a disjoint union of two elliptic curves over `K`, pointed in one of
   them, is smooth and proper of relative dimension one with a section, and is not geometrically
   connected. The degree-zero subfunctor defined by fibrewise degree and its fppf sheafification
   are then Tau Ceti's `relativePicardDegreeZeroSubfunctor π` and
   `relativePicardDegreeZeroFppfSheaf π`. Prove that the degree-zero part is open and closed: for a
   line bundle on `E_T`, the set of points of `T` at which its fibre degree vanishes is open and
   closed in `T`, the fibre degree `χ(L_t) − χ(𝒪_t)` being locally constant in the flat proper
   family `E_T ⟶ T` (Jacobian Challenge proper-flat cohomology contract);
3. for a degree-zero line bundle `L`, apply the positive-degree theorem of Layer 1.3 to `L([0])`:
   prove fppf locally that it has a unique effective divisor of degree one, descend the resulting
   section, and deduce that the Abel–Jacobi map `P↦𝒪_E([P]-[0])`, Tau Ceti's
   `abelJacobiMapToPicZeroFppf π E.zero_comp`, is an isomorphism from the functor of points of
   `E` onto the degree-zero sheaf, so that `E` itself represents it;
4. on `E×_S E`, start with `L₀=𝒪(Δ-E×[0]-[0]×E)` and normalize it along both zero
   sections. If `i₁(P)=(P,0)`, `i₂(Q)=(0,Q)`, and `c=(0,0)`, use

   ```text
   L = L₀ ⊗ pr₁^*(i₁^*L₀)⁻¹ ⊗ pr₂^*(i₂^*L₀)⁻¹ ⊗ π^*(c^*L₀),
   ```

   with its two explicit rigidifications. The final base-line factor is essential over a family,
   where the Hodge line need not be trivial. Prove the universal property of this normalized
   Poincaré bundle and establish the seesaw, biextension, descent, and arbitrary-base-change
   identities.

The construction consumes the general line-bundle and descent infrastructure of the Jacobian
Challenge, but the relative representability and Poincaré theorem in this genus-one setting belong
to this layer. Construct the canonical principal polarisation

```text
λ_E : E ≅ Pic⁰_{E/S},
P ↦ 𝒪_E([P]-[0]).
```

With the translation convention `t_P(Q)=Q+P`, fix the sign by writing this line bundle as
`t_{-P}^*𝒪_E([0]) ⊗ 𝒪_E([0])⁻¹`. Prove that `λ_E` is an isomorphism of group schemes,
compatible with arbitrary base change. Construct its inverse from degree-one rigidified line
bundles using the positive-degree cohomology of Layer 1.3.

Now prove KM 2.5.1. If a scheme morphism `f : E ⟶ E'` lies over `S` and carries zero to zero, use
pullback on `Pic⁰`, the two Abel–Jacobi identifications, the theorem of the square, and rigidity to
show that `f` agrees with the resulting homomorphism of group schemes. Package the result as

```text
isGroupHom_of_mapsZero :
  ∀ f : E.carrier ⟶ E'.carrier,
    f lies over S → f carries zero to zero →
      ∃! F : E.toCommGrp ⟶ E'.toCommGrp, F.hom.hom.hom.left = f.
```

This theorem (`isGroupHom_of_mapsZero`) supplies a conversion into the `Hom_S(E,E')` type of
Layer 2.1 (Tau Ceti's `E.toCommGrp ⟶ E'.toCommGrp`, whose underlying scheme morphism determines
the homomorphism by `EllipticCurveGeom.hom_ext_left`); it is not used to define that type or the
multiplication maps. Apply it to the identity morphism between two
group structures on the same pointed curve to prove uniqueness of the compatible group structure
promised after Layer 1.4.

For every homomorphism `φ : E ⟶ E'`, not only for an isogeny, define the Picard dual

```text
φᵗ = λ_E⁻¹ ∘ Pic⁰(φ) ∘ λ_{E'} : E' ⟶ E.
```

Prove that this construction is additive, sends zero to zero and identities to identities, reverses
composition, is involutive, and commutes with arbitrary base change. These statements provide the
general dual-homomorphism operation used in the endomorphism ring of Layer 2.6.

For an isogeny `φ` of constant degree `n`, prove `φᵗ ∘ φ = [n]` using the canonical isomorphism
`φ^*𝒪_{E'}([0]) ≅ 𝒪_E(ker φ)` and its polarisation. Compare this identity with the universal
factorisation of Layer 2.3 and prove

```text
φᵗ = φ̂_fac.
```

Only after this comparison introduce the single public notation `φ̂` for the Picard dual of any
homomorphism. Prove that the dual of an isogeny is again an isogeny. For a general isogeny, compare
with the factorisation construction on each open-and-closed degree stratum; this avoids treating a
locally constant degree as one integer. Transport the composition and degree theorems for isogenies
to the restricted operation, while the endomorphism identity in Layer 2.6 uses the general operation.

**Dependencies.** Layers 0.1, 0.5, 1.3–1.4, and 2.3, Tau Ceti's relative Picard functor with its
degree-zero subsheaf and Abel–Jacobi map, `EllipticCurveGeom.baseChange` and
`WeierstrassCurve.isIntegral_projModel` (§Exact supplier contracts), and the Jacobian Challenge
contracts for invertible sheaves, coherent cohomology, and cohomology and base change.

**Further sources.** Over a field, EGM (6.1), (6.18) and (7.9) for the Picard functor, the dual
abelian variety and biduality, and EGM (1.12) and (1.14) for the rigidity lemma and the homomorphism
property of pointed morphisms.

### 2.5. Cartier–Nishi duality and the Weil pairing

For an isogeny `φ : E ⟶ E'`, restrict the Poincaré biextension to construct the Cartier–Nishi pairing

```text
ker φ × ker φ̂ ⟶ 𝔾_m
```

and prove that it induces an isomorphism of finite locally free group schemes

```text
ker φ̂ ≅ (ker φ)ᴰ.
```

This is a scheme-theoretic perfection theorem and must not be replaced by nondegeneracy on
geometric points, which is false as a test in residue characteristic dividing the rank. Apply it to
`[N]`, prove `[N]̂=[N]`, and obtain

```text
E[N] ≅ E[N]ᴰ,
e_N : E[N] ×_S E[N] ⟶ μ_N.
```

Prove, in order:

1. bilinearity and arbitrary base-change compatibility;
2. compatibility with isogenies and dual isogenies;
3. change of level, `e_{NM}(x,y)=e_N(x,y)^M` for `N`-torsion sections viewed as
   `NM`-torsion;
4. skew-symmetry;
5. alternation `e_N(P,P)=1`, using the diagonal argument in KM's Notes Added in Proof rather than
   deducing it from skew-symmetry;
6. scheme-theoretic perfection;
7. `e_N(aP+bQ,cP+dQ)=e_N(P,Q)^(ad-bc)`;
8. comparison with Tau Ceti's equation-level Weil pairing `TauCeti.Isogeny.weilPairing` over a
   separably closed field in which `N` is invertible: the scheme-theoretic pairing evaluated on
   the `K`-points of `E[N]` attached to `N`-torsion points of the Weierstrass equation is the
   equation-level pairing, whose alternation and nondegeneracy are in the library.

Items 5 and 6 are separate principal milestones. The last item fixes the normalisation and is not
used to construct the pairing.

**Dependencies.** Layers 0.1, 0.2, and 2.4. Item 8 also uses Tau Ceti's equation-level pairing.

**Further sources.** Oda, Theorem 1.1 and Corollary 1.3, proves the duality between the kernel of an
isogeny and the kernel of the dual isogeny for abelian schemes of every dimension over an arbitrary
base, which is more general. EGM (7.4) isolates, over a base, the statement about torsors behind it.
Over a field, EGM (11.11) defines the pairings, which are perfect and bilinear by their construction
from (7.5), and (11.12) describes them explicitly; (11.17) and (11.21) give the compatibilities with
the transpose and with composition, and (11.22) the alternation for a polarisation; the sign
convention of (11.17) is to be compared with the one fixed here.

### 2.6. Endomorphism degree and trace

Define degree as a locally constant natural-number-valued function and trace as a locally constant
integer-valued function on the base. Over a preconnected base, identify them with integers, cast
the degree to `ℤ` in the endomorphism ring, and prove

```text
α̂ = [tr α] - α,
α² - [tr α]α + [deg α] = 0,
(tr α)² ≤ 4 deg α
```

in the precise forms of KM 2.6.2–2.6.3.

**Dependencies.** Layers 0.5, 2.1–2.4. The characteristic-polynomial identity uses the general
Picard dual of Layer 2.4; the Weil pairing of Layer 2.5 is not needed.

**Further sources.** Over a field and in every dimension, EGM (12.15), (12.16) and (12.19)–(12.21)
for the degree as a polynomial function on endomorphisms and for the characteristic polynomial, and
EGM (12.26) for the positivity of the Rosati involution, from which the inequality
`(tr α)² ≤ 4 deg α` follows in dimension one.

## Layer 3: moduli problems for elliptic curves

References: KM 4.2, 4.6.2, 4.7.0, Corollary 4.7.2, and 4.12, with the rigidifier families of
KM 2.2.9–2.2.11; KM 2.3.1 and 2.7.1–2.7.4 for naive level structures and their rigidity; SGA 3,
Exposé V, Théorème 4.1; Loeffler 3.7.4.

This layer contains what can be said about moduli problems before any Drinfeld structure is
defined: the carrier, the naive level structures, which exist where the level is invertible, their
rigidity, and the representability of rigid problems.

### 3.1. Moduli problems over `Ell/R`

Define the category fibred in groupoids `Ell/R`: over an `R`-scheme `T`, its objects are elliptic
curves over `T` and its arrows are cartesian isomorphisms. An elliptic curve with additional
structure is first a groupoid-valued pseudofunctor. Construct its presheaf of isomorphism classes
and, where necessary, its fppf sheafification.

Define representability, relative representability, affine, finite, flat, and étale properties over
`Ell/R`. Define rigidity as triviality of automorphisms of an object with structure. Only after
rigidity is proved pass to the corresponding set-valued moduli problem. This is not a general
theory of algebraic stacks; it is the bookkeeping needed for descent and quotient problems.

Tau Ceti carries the set-valued side (§Exact supplier contracts): the objects `EllObj (Spec R)`
and cartesian pointed arrows `EllObj.Hom` of `Ell/R` with its category instance,
`ModuliProblem (Spec R)`, relative-representability data `ModuliProblem.RelRepData` (a scheme
`rep X` over the base of every `X = (E/S)` representing the fibre `T ↦ 𝒫(E_T/T)` on schemes over
`S`, the functor of KM 4.2, with the representing bijections `representableBy`), the properties
`RelRepData.HasProperty`, rigidity `ModuliProblem.IsRigid`, and representability by an object,
Mathlib's `Functor.RepresentableBy`. `Suggested.lean` adds only the bundled representable étale
surjective rigidifiers `EtaleRigidifier` of Layer 3.6.

**Dependencies.** Layer 1.

**Further sources.** Conrad, Theorem 3.1.2: the isomorphism functor of two generalized elliptic
curves is a quasi-finite separated scheme of finite presentation over the base, the representability
of the diagonal which lies behind relative representability. Conrad, §2.4, and Česnavičius, §4.1.2,
express level problems as stacks with a forgetful morphism to the stack of elliptic curves, in place
of functors on `Ell/R`; Česnavičius, Proposition 6.3, is a dictionary between the two languages.

### 3.2. Naive level structures

Over a base on which `N` is invertible, `E[N]` is finite étale (KM 2.3.1), so the definitions
below use no Drinfeld divisor condition and are independent of Layers 0.8 and 4. The rigidifiers
of Layer 3.5 and the fine curves of Layers 5.1–5.2 are built on these naive problems alone.

Two of the three naive problems are at the pin (§Exact supplier contracts), defined over every
base `B` and the naive structures of KM where `N` is invertible on `B`:

- the **naive `[Γ(N)]`-structures** `gammaNaive B N`: the homomorphisms `(ℤ/Nℤ)² →* E(S)`
  injective on every fibre, that is, the ordered pairs `(P, Q)` of sections of `E[N]` none of
  whose combinations `aP + bQ` with `(a, b) ≠ 0` meets the zero section; where `N` is invertible
  these are the pairs that are a basis of `E[N]` in every geometric fibre
  (`isFiberwiseInjective_iff_range_eq_ker`), equivalently the isomorphisms of group schemes
  `(ℤ/N)²_S ≅ E[N]`, which is the form kept as a Check;
- the **naive `[Γ₁(N)]`-structures** `gammaOneNaive B N`: the sections `P` of `E[N]` none of whose
  multiples `P, …, (N − 1)P` meets the zero section, that is, of exact order `N` in every
  geometric fibre, with the forgetful map `gammaNaiveToGammaOneNaive`.

Both are relatively representable over every base, by the open naive loci of `E[N] ×_S E[N]` and
of `E[N]` (`gammaNaiveRelRepData`, `gammaOneNaiveRelRepData`), and where `N` is invertible in
every residue field of `B` they are étale, finite and surjective over `Ell/B`
(`hasProperty_etale_…`, `hasProperty_isFinite_…`, `hasProperty_surjective_…`; Loeffler,
Proposition 3.8.2, states relative representability and étaleness of these two problems over
`Ell/ℤ[1/N]`, and finiteness and surjectivity are the pinned theorems). `GL₂(ℤ/Nℤ)` acts on the right on `gammaNaive B N` in
the row-vector convention of Convention 5 (`gammaNaiveAction`), freely over nonempty bases
(`eq_one_of_gammaNaiveAction_hom_app_eq_self`).

Owned here is the third problem. Over `ℤ[1/N]`, define a **naive `[Γ₀(N)]`-structure** as a finite
locally free subgroup scheme `C ⊆ E[N]` of order `N`, étale-locally generated by a single section,
and prove that it is relatively representable and étale over `Ell/ℤ[1/N]` (Loeffler Proposition
3.8.2 for the general `P_H` of Loeffler Fact 3.8.1). Construct the naive `[Γ₀(N)]` carrier
as the finite étale quotient of the full-basis carrier by the Borel, using the quotient theorem of
Layer 0.3. Identify it with the cyclic open-and-closed locus in the subgroup parameter space of
Layer 0.7. These are the structures in which the rigidifiers of Layer 3.5 and the fine curves of
Layers 5.1–5.2 are stated; the comparison with the Drinfeld structures of Layers 0.8 and 4.1–4.2 is Layer 4.3, and is
needed only where the two sides must be identified.

**Checks.**

- Over `ℤ[1/N]` the naive `[Γ(N)]`-structures on `E/S` are the isomorphisms `(ℤ/N)²_S ≅ E[N]`: a
  fibrewise-injective pair generates `E[N]` in every geometric fibre because `E[N](k)` has `N²`
  points there (Layer 2.1), and conversely. A definition that asked only for `P` and `Q` to be
  nonzero in every fibre would admit `(P, P)`.
- In characteristic `p ∣ N` no naive `[Γ(N)]`-structure exists, since `(ℤ/pℤ)²` does not embed
  in `E[p](k)`: the naive problems are empty over `𝔽_p`, the Drinfeld problems of Layer 4.2 are not.
- For `N = 2`, `[−1]` fixes every naive structure, so neither naive problem is rigid; rigidity
  (Layer 3.3) begins at `N = 3` for `[Γ(N)]` and at `N = 4` for `[Γ₁(N)]`.

**Dependencies.** Layers 0.3–0.4, 0.7, and 2.1. There is no dependency on Layer 0.8 or Layer 4.

### 3.3. Rigidity of naive level structures

The naive-level rigidity results of KM 2.7.1–2.7.4 are at
the pin (§Exact supplier contracts), over every base and with no noetherian or reducedness
hypothesis: an automorphism of `E/S` fixing the zero section and two sections `φ a`, `φ b` of a
fibrewise-injective homomorphism `φ : A →* E(S)` with `a² ≠ 1`, `b ≠ 1` and `b ≠ a^{±1}` is the
identity (`IsFiberwiseInjective.eq_id_of_isPullback`: it fixes the three points `φ a`, `−φ a`
and `φ b`, distinct in every fibre), so the naive `A`-structures are rigid for every such `A`
(`isRigid_naiveLevel`), in particular naive full level for `N≥3` (`isRigid_gammaNaive`, KM
2.7.2) and naive `[Γ₁(N)]` for `N≥4` (`isRigid_gammaOneNaive`, the semi-Borel case). Owned here
are the corresponding statements for the fixed-pairing frames of `Y(ρ)` (Layer 5.3) and for
the naive
`[Γ_H]` problems (Layers 6.1–6.2), deduced from these through the morphisms of moduli problems to the
naive
full-level problem (`IsRigid.of_hom`: a problem mapping to a rigid problem is rigid).

**Checks.**

- The bounds are sharp: `[−1]` fixes every naive `[Γ(2)]`-structure, and on `Y² + Y = X³` over
  a field containing a primitive cube root of unity `ζ` the automorphism `(X, Y) ↦ (ζX, Y)`
  fixes the point `(0, 0)` of order `3`, so naive `[Γ₁(3)]` is not rigid; a rigidity statement
  with the bound `N ≥ 2` or `N ≥ 3` for `[Γ₁(N)]` would be false.
- Rigidity holds over a nonreduced base, for example `Spec k[ε]/(ε²)`: an automorphism of a
  constant curve `E_k[ε]` fixing a basis of `E[N]` for `N ≥ 3` is the identity, although the
  fibrewise criterion alone sees only its reduction.

Do not extend this assertion to the integral Drinfeld structures of Layer 4.2. If `E` is supersingular over
`F̄_p`, the pair `(0,0)` is a Drinfeld `[Γ(p)]`-structure, and `[-1]` fixes it; thus integral
full-level rigidity is false even when `p≥3`.

**Dependencies.** Layers 2.1, 3.1, and 3.2, and the pinned rigidity. The pinned proof compares an
automorphism with the identity on three sections distinct in every fibre; it uses neither the
endomorphism identities of Layer 2.6 nor the Picard dual of Layer 2.4.

**Further sources.** Conrad, Lemma 3.1.8 and Theorem 4.2.1(2), for generalized elliptic curves: the
automorphism scheme of a curve with level structure over an algebraically closed field is finite,
and the compactified stack has trivial automorphism groups once a divisor `d ≥ 3` of `N` is inverted
for `Γ(N)`, respectively a divisor `d ≥ 5` for `Γ₁(N)`. The second threshold is that of the
compactified problem and differs from the bound `N ≥ 4` for elliptic curves used here.

### 3.4. The Weierstrass presentation

Let

```text
W_R = Spec R[a₁,a₂,a₃,a₄,a₆,Δ⁻¹].
```

Use the variable-change group and the pointed-isomorphism classification already proved in Layer
1.3. Form its action groupoid on `W_R` and prove that it presents the groupoid of elliptic curves:

- the Weierstrass-presentation theorem gives an effective Zariski atlas on objects;
- the unique-variable-change theorem identifies the arrows on every overlap;
- the multiplication and inverse laws from Layer 1.3 give the cocycle and groupoid laws;
- the curve, zero section, invariant differential, and additional structure descend;
- the presentation and the descent equivalence commute with arbitrary base change.

These statements are the precise substitute, in this roadmap, for saying that the Weierstrass
scheme presents the moduli stack. This section packages the theorems of Layer 1.3 for the moduli
formalism;
it does not re-prove the classification needed to construct the group law.

**Dependencies.** Layers 0.5, 1.3–1.5, and 3.1.

### 3.5. Rigidifiers and KM 4.7.0

Carry out Katz–Mazur's rigidifier construction in the following definite form.

1. Over `ℤ[1/2]`, construct the Legendre problem of KM 2.2.9 and 4.6.2: pairs `(φ₂, ω)` of a
   basis `φ₂ : (ℤ/2ℤ)² ≅ E[2]` and a nowhere-vanishing differential `ω` such that the
   `ω`-adapted coordinate normalised by `x(P₂)=0` satisfies `x(Q₂)=1`. Prove that it is
   representable by `Spec ℤ[1/2][λ, 1/λ(λ-1)]` with the universal curve
   `y²=x(x-1)(x-λ)`, and that for every `E/S` the scheme of Legendre structures is finite étale
   of degree `12` over `S[1/2]`: it is the `μ₂`-torsor of square roots of `x(Q₂)-x(P₂)` over the
   `GL₂(𝔽₂)`-torsor of level-two bases.
2. Over `ℤ[1/3]`, naive full level three with its `GL₂(𝔽₃)`-action and its affine universal
   family are at the pin (KM 2.2.10–2.2.11, §Exact supplier contracts): `EllObj.universalLevelThree`
   is the level-three normal form `Y² + 3μXY + (μ³ − 1)Y = X³` over
   `B × Spec ℤ[1/3, ζ₃][μ, 1/(μ³ − 1)]` with its basis of the `3`-torsion, and it represents
   `gammaNaive B 3` over every base (`gammaNaiveThreeRepresentableBy`); the problem is étale,
   finite and surjective over `Ell/ℤ[1/3]` and `GL₂(𝔽₃)` acts freely on it over nonempty bases
   (Layer 3.2), which is what "finite étale `GL₂(𝔽₃)`-torsor" means here.
3. At the pin: for a relatively representable affine problem `𝒫` and a rigidifier `δ`
   represented by `U`, the simultaneous problem `(𝒫,δ)` is represented by the base change of `U`
   to `𝒫_U`, an affine scheme `𝕄(𝒫,δ)` over the base of `U` (`RelRepData.tensorRepresentableBy`),
   and `(𝒫,δ,δ)` by the relative representing scheme `δ_{𝕄(𝒫,δ)}`, finite étale over `𝕄(𝒫,δ)`
   by either projection when `δ` is finite étale (`doubleRepresentableBy`, `doubleSnd`,
   `mem_doubleSnd_base`).
4. At the pin: rigidity of `𝒫` makes `𝕄(𝒫,δ,δ) ⟶ 𝕄(𝒫,δ) ×_{ℤ[1/N]} 𝕄(𝒫,δ)` a monomorphism
   (`mono_pullback_lift_baseChangeFunctorHom_doubleSnd`), so that it is a finite étale
   equivalence relation. For the level-three rigidifier this is the freeness of the
   `GL₂(𝔽₃)`-action on `𝕄(𝒫,δ)` (`IsRigid.eq_one_of_comp_simultaneousAction_base_eq`; on the ring
   of functions, `g • a − a` generates the unit ideal for `g ≠ 1`,
   `IsRigid.span_range_smul_sub_eq_top`), which follows from the rigidity of `𝒫` and the freeness
   of the action on `[Γ(3)]`; Layer 3.3 supplies that rigidity for the problems of Layers 5.2 and 5.3.
5. Form the affine quotient of `𝕄(𝒫,δ)` by this equivalence relation using Layer 0.3, prove that
   it represents the fppf sheaf `𝒫`, descend the universal elliptic curve and the additional
   structure along the finite locally free surjection `𝕄(𝒫,δ) ⟶ 𝕄(𝒫)` using Layer 1.5, and
   prove the universal property. For the level-three rigidifier the quotient is the invariant ring
   of `GL₂(𝔽₃)`, and its projection is a finite étale torsor by Layer 0.3's `etale_projection` and
   `isPullback_of_free` applied to the freeness of item 4; the descent of the universal curve and
   the universal property are owned here, as is the whole of item 5 for the Legendre rigidifier.
6. Compare the constructions over `ℤ[1/6]` and glue over `Spec ℤ`.

KM 4.6.2 asserts, and the proof of KM 4.7.0 uses, that the Legendre problem is a finite étale
`GL₂(ℤ/2ℤ)×{±1}`-torsor over `Ell/ℤ[1/2]`. This is false as stated: no such action of a constant
group exists. Permuting the level-two basis changes the difference `x(Q₂)-x(P₂)` by a factor which
is `-1`, `λ`, or `1-λ` up to squares, so restoring the Legendre normalisation requires
`ω ↦ uω` with `u²∈{-1, λ, 1-λ, ...}`, and no such `u` exists over `ℤ[1/2]`. Concretely, for
`y²=x(x-1)(x-2)` over `ℚ` exactly four of the twelve geometric Legendre structures are rational,
namely `±ω` for the two ordered bases whose coordinate difference `x(Q₂)-x(P₂)` is a rational
square, whereas a torsor under a constant group of order `12` with a rational point has twelve
rational points. The Legendre problem is a finite étale cover of
degree `12` whose automorphism group over `Ell/ℤ[1/2]` is only `{±1}`. The equivalence-relation
quotient in steps 4–5 is the repair; it does not need any group action on the rigidifier and gives
KM's own quotient when the rigidifier is Galois. The naive full-level-two problem carries the usual
`GL₂(𝔽₂)` change-of-basis action, but that action does not lift to the normalized Legendre
rigidifier: the latter is a degree-twelve finite étale cover of `Ell/ℤ[1/2]` with only the sign
change of the differential as a global deck transformation, and the full-level-two problem itself
is not rigid because `[-1]` acts trivially on `E[2]`. KM Chapter 4 uses no level-four rigidifier;
the naive `[Γ(4)]` problem, which is Galois, becomes available for coarse moduli in Layer 6.3 only
after KM 4.7.0 has been proved here.

Prove the implication used throughout the roadmap (KM 4.7.0):

> A relatively representable, affine, rigid moduli problem is representable.

This is `exists_representableBy_of_isRigid`, stated on Tau Ceti's `ModuliProblem (Spec R)`,
`RelRepData` and `IsRigid` with Mathlib's `Functor.RepresentableBy`. The six steps above give
this implication. Only this direction is used here. The converse is cheap
and KM records it: its Appendix A.4 opens with the
tautology (A.4.1.2) that `𝒫` is representable exactly when `𝒫̃` is representable and `𝒫` is rigid,
and Proposition A.4.2 gives the three-way equivalence under the étale-sheaf hypothesis that relative
representability supplies. The passage from
representability to a **smooth affine relative curve** also uses that the problem is
étale over `Ell` and affine over it. The naive problems in Layers 5.2 and 5.3 have these
properties over `ℤ[1/N]` and `ℚ`, respectively; representability alone does not imply smoothness
or relative dimension one.

**Dependencies.** Layers 0.3, 0.5, 1.5, and 3.1–3.4. The rigidifiers are naive structures, so
this block does not use the integral Drinfeld loci.

**Further sources.** Conrad, Theorem 2.2.5, is the corresponding statement in the language of
stacks: an Artin stack whose geometric points have trivial automorphism functors is an algebraic
space. The conclusion there is an algebraic space; that the result is a scheme is the affine
quotient argument of this section, for which see the sources of Layer 0.3.

### 3.6. Regularity of a moduli problem

Define regularity in Katz–Mazur's sense (KM 4.12). If `𝒫` is relatively representable and `δ` is a
representable étale rigidifying problem, then `𝒫` is regular of dimension `d` when the scheme
representing `(𝒫,δ)` is regular of dimension `d`. KM quantifies over *all* modular families, so
independence of the rigidifier is built into the definition rather than a theorem of KM's; Tau
Ceti proves it for the formulation adopted here. KM's Notes Added in Proof
(p. 505) correct 4.12: "being of given dimension" is not étale-local, and the intended reading is
that the representing scheme is non-empty and every non-empty Zariski open is `d`-dimensional.
Tau Ceti's predicate `RelRepData.IsRegularOfDim d` (§Exact supplier contracts) is the formal
form: for every moduli problem represented by an object of `Ell/R` and relatively representable,
étale and **surjective** over `Ell/R`, the scheme representing `(𝒫, δ)` is
`TauCeti.AlgebraicGeometry.IsRegularOfDim d`, that is, non-empty, with regular local rings and
with every non-empty open of Krull dimension `d`. KM 4.12 quantifies over all modular families
and notes that a covering collection suffices; surjectivity is what prevents an empty
representable étale problem from falsifying the non-emptiness clause, and the library proves that
one such rigidifier suffices (`isRegularOfDim_iff_of_representableBy`), which is the independence
of the rigidifier. `Suggested.lean` bundles a representable étale surjective rigidifier as
`EtaleRigidifier` for the quotient data of Layer 6.1. Layers 8 and 9 assert regularity *of dimension
two*, so they depend on the corrected reading.

**Dependencies.** Layers 3.1 and 3.5; the regular-local-ring theory is that of Layer 0.9 and
Mathlib.

## Layer 4: Drinfeld level structures

References: KM 1.3.5–1.3.7, 1.4, 1.10.1, 1.10.5, 1.10.13, and §§3.1–3.7.

### 4.1. Exact order and cyclic subgroups

At the pin (§Exact supplier contracts), a section `P` of an elliptic curve has exact order `N`
(`IsOfExactOrder E P N`) when the relative effective Cartier divisor

```text
Σ_{a∈ℤ/Nℤ} [aP]
```

(`multiplesDivisor E P N`) is a subgroup scheme of `E` (KM §1.4); it is finite locally free of
rank `N` as a sum of `N` section divisors. The library proves that the subgroup divisor is
killed by `N` (`IsOfExactOrder.pow_eq_one`), and hence

```text
P has exact order N ⟶ [N]P=0,
```

that exact order is stable under base change (`IsOfExactOrder.pointsPullback`), that the closed
subscheme `exactOrderScheme E N` of `E` carrying the universal point of exact order `N`
represents the points of exact order `N` on base changes (`exactOrderPointsEquivOfIsPullback`)
and factors through `E[N]`, so is finite over `S` for `N ≠ 0` (`isFinite_exactOrderScheme_hom`),
and that where `N` is invertible exact order is exact order in every fibre
(`isOfExactOrder_iff_isOfNaiveExactOrder`). An implementation that caches the killing property
must prove its equivalence with the Katz–Mazur definition, as the library does. A cyclic subgroup
of order `N` (`IsCyclicSubgroup E I N`, on the ideal sheaf `I` of the subscheme) is a finite
locally free subgroup of rank `N` which is fppf-locally generated by a section of exact order
`N`; the subgroup generated by a point of exact order `N` is cyclic
(`IsOfExactOrder.isCyclicSubgroup_multiplesDivisor`), a cyclic subgroup of order `N` lies in
`E[N]` (`IsCyclicSubgroup.toTorsion`), and cyclic subgroups pull back along base change
(`IsCyclicSubgroup.comap`).

Owned here: KM 1.10.1, that for a finite locally free subgroup `G` of `E` a family of sections is
a full set of sections of `G` in the sense of Layer 0.8 exactly when `G` is their divisor sum, which
identifies the Drinfeld bases of Layer 4.2 with the `(ℤ/Nℤ)²`-generators of Layer 0.8; and KM 1.10.5 and
1.10.13 in the forms used by quotient isogenies and `[Γ₀(N)]`, on the pinned `IsCyclicSubgroup`.

**Checks.**

- The characteristic-`p` regression: for a smooth one-dimensional group over an `𝔽_p`-algebra,
  the zero section has exact order `pⁿ` in Drinfeld's sense, since `pⁿ[0]` is the kernel of the
  `n`-th iterate of the relative Frobenius, a subgroup scheme. Exact order is not a statement
  about the abstract order of a geometric point: a definition reading the order of `P` in `E(S)`
  would give the zero section exact order `1` only.
- Over `ℤ[1/N]`, exact order `N` is exact order `N` in every geometric fibre, so a point of exact
  order `N` has `aP ≠ 0` in every fibre for `0 < a < N`.
- For `N ≥ 2` invertible, `E[N]` is a finite locally free subgroup of rank `N²` that is not
  cyclic of order `N²`: a generator would be a point of exact order `N²`, hence of order `N²` in
  every geometric fibre, while `E[N](k̄)` is killed by `N`. In characteristic `p`, by contrast,
  `E[p]` of an ordinary curve over `k̄` is cyclic of order `p²`, generated by any point `P` of
  order `p`: the divisor `∑_{a ∈ ℤ/p²} [aP] = p ∑_{a ∈ ℤ/p} [aP]` is the length-`p` neighbourhood
  of each of the `p` points of `E[p](k̄)`, which is `E[p] ≅ μ_p × ℤ/pℤ`. A definition requiring
  the multiples of a generator to be distinct would miss this subgroup.

**Dependencies.** Layers 0.1, 0.2, 0.8, and 2.1.

**Further sources.** Conrad, Definition 2.3.4, Theorem 2.3.5 with Definition 2.3.6, and Theorem
2.3.7, and Česnavičius, Definition 4.2.6 and Proposition 4.2.7, give the definition of a cyclic
subgroup, the standard cyclic subgroups and the criterion by the scheme of generators for subgroups
of the smooth locus of a generalized elliptic curve, which is more general; for elliptic curves both
refer to KM. Kottwitz–Wake, §4.1 and §4.2, define the primitive elements of a truncated
`p`-divisible group from the group scheme alone and identify them, for an elliptic curve, with the
points of exact order `pⁱ`; the comparison uses the flatness theorem of Layer 8.8, so it is a second
description and not a second proof.

### 4.2. The four level structures

Three of the four are at the pin (§Exact supplier contracts), over `Ell/B` for every base `B`:

- the `[Γ(N)]`-structures `gamma B N`: the homomorphisms `φ : (ℤ/Nℤ)² →* E(S)` which are
  Drinfeld bases of `E[N]`, `∑_a [φ a] = E[N]` as closed subschemes (`IsDrinfeldBasis`; KM §3.1
  in the divisor form of its `(ℤ/Nℤ)²`-generators), with the right `GL₂(ℤ/Nℤ)`-action
  `gammaAction` and the triviality of `[Γ(1)]` (`gammaLevelOneIso`); KM's phrasing, that the
  `N²` sections `φ a` form a full set of sections of `E[N]`, is the comparison KM 1.10.1 of
  Layer 4.1;
- the `[Γ₁(N)]`-structures `gammaOne B N`: the sections of exact order `N` of Layer 4.1 (KM §3.2), with
  `[Γ₁(1)] = [Γ(1)]` (`gammaOneOneIso`);
- the `[Γ₀(N)]`-structures `gammaZero B N`: the cyclic subgroups of order `N` of Layer 4.1, recorded by
  their ideal sheaves (KM §3.4), with the morphism `gammaOneToGammaZero : [Γ₁(N)] ⟶ [Γ₀(N)]`,
  `(E, P) ↦ (E, ⟨P⟩)`.

Base-change functoriality of these three is the library's (`IsDrinfeldBasis.pointsPullback`,
`IsOfExactOrder.pointsPullback`, `IsCyclicSubgroup.comap`). Owned here is the fourth:

- a balanced `[Γ₁(N)]`-structure as a cyclic subgroup `C ⊆ E[N]`, a Drinfeld generator `P` of
  `C`, and a Drinfeld generator `Q` of `Cᴰ` (KM §3.3). Equivalently, using Layer 2,
  `Q` generates the kernel of the dual quotient isogeny. Evaluation gives

  ```text
  det(P,Q) = Q(P) ∈ μ_N.
  ```

For the balanced structure, prove the equivalence with the quotient-isogeny formulation, including

```text
Cᴰ ≅ ker(q_Ĉ),
```

the orientation of `Q(P)`, compatibility with arbitrary base change, and compatibility with the
Weil pairing, and prove its base-change functoriality. The relative representability of `[Γ(N)]`
and `[Γ₁(N)]` is at the pin (Layer 4.4); that of the balanced problem is Layer 4.4. The cyclicity
theorem needed to represent `[Γ₀(N)]` is Layer 9.3, which needs the
Axiomatic Isomorphism Theorem of Layer 8.4.

**Checks.**

- For a supersingular `E/k̄` in characteristic `p`, the zero homomorphism `(ℤ/pℤ)² →* E(k̄)` is a
  Drinfeld basis of `E[p]`, since `E[p] = p²[0]` as closed subschemes (Layer 3.3's regression),
  while no naive `[Γ(p)]`-structure exists; `[−1]` fixes it, which is why integral `[Γ(p)]` is
  not rigid.
- For `N = 1` the three problems are the trivial problem; a definition of `[Γ₁(N)]` that
  required `P` to miss the zero section would make `[Γ₁(1)]` empty.
- A `[Γ₀(N)]`-structure is determined by its ideal sheaf, not by a generator: over `ℤ[1/N]` the
  `φ(N)` generators of a cyclic subgroup give the same structure, which is why
  `[Γ₁(N)] ⟶ [Γ₀(N)]` has degree `φ(N)` (Layer 9.4).

**Dependencies.** Layers 0.1, 0.2, 0.8, 2.1–2.2, 2.4–2.5, and 4.1.

**Further sources.** Conrad, Definitions 2.4.1 and 2.4.2, define `Γ₁(N)`- and `Γ(N)`-structures on
generalized elliptic curves; on an elliptic curve the ampleness condition there is empty and they
are the structures of this section. Conrad, Theorem 2.3.2, and Česnavičius, Proposition 4.2.5, prove
that multiplying a `ℤ/N`-structure or a Drinfeld basis by `N/d` gives a structure of level `d`, for
generalized elliptic curves. The balanced problem is not treated in either.

### 4.3. Comparison with naive level structures

The naive–Drinfeld comparison of KM 1.4.4 and §3.7 for `[Γ₁(N)]` and `[Γ(N)]` is at the pin
(§Exact supplier contracts). Over every base, a naive `[Γ(N)]`-structure is a Drinfeld basis
(`IsFiberwiseInjective.isDrinfeldBasis`: the section divisors are pairwise disjoint, so their sum
is a closed subscheme of `E[N]` of the same rank `N²`), which gives the `GL₂(ℤ/Nℤ)`-equivariant
monomorphism `gammaNaiveToGamma : [Γ(N)]_naive ⟶ [Γ(N)]`. Over a base on which `N` is invertible
in every residue field the converse holds (`isDrinfeldBasis_iff_isFiberwiseInjective`,
`isOfExactOrder_iff_isOfNaiveExactOrder`), so `gammaIsoGammaNaive : [Γ(N)] ≅ [Γ(N)]_naive` and
`gammaOneToGammaOneNaive : [Γ₁(N)] ⟶ [Γ₁(N)]_naive` (an isomorphism,
`isIso_gammaOneToGammaOneNaive`) identify the Drinfeld problems with the naive ones, and the
Drinfeld problems inherit rigidity (`isRigid_gamma` for `N ≥ 3`, `isRigid_gammaOne` for `N ≥ 4`),
the freeness of the `GL₂(ℤ/Nℤ)`-action over nonempty bases
(`eq_one_of_gammaAction_hom_app_eq_self`) and étaleness over `Ell/B`
(`hasProperty_etale_gammaRelRepData`, KM 3.7.1).

Owned here are the balanced comparison and the `[Γ₀(N)]` comparison. For the balanced
comparison, the base must also carry a chosen primitive root

```text
ζ : S ⟶ μ_N^prim,
```

for example `S/Spec ℤ[1/N,ζ_N]`. On the determinant-`ζ` locus, forgetting `(C,Q)` identifies a
balanced structure with a naive `[Γ₁(N)]`-structure: `C` is generated by `P`, and there is a unique
Drinfeld generator `Q` of `Cᴰ` satisfying `Q(P)=ζ`. The naive `[Γ₀(N)]` carrier of Layer 3.2 is
identified with `gammaZero` over `ℤ[1/N]` through the generators: a subgroup étale-locally
generated by a section of order `N` in every fibre is cyclic in the sense of Layer 4.1, and conversely a
Drinfeld generator has order `N` in every fibre where `N` is invertible.

**Checks.**

- Over `ℤ[1/N]` the comparison for `[Γ(N)]` is bijective on `T`-points for every `T` over the
  base, including nonreduced `T`; a comparison proved on geometric points only would not give an
  isomorphism of moduli problems.
- Over `𝔽_p` with `p ∣ N` the monomorphism `gammaNaiveToGamma` is not an isomorphism: for
  supersingular `E` the zero homomorphism is a Drinfeld basis of `E[p]` and is not fibrewise
  injective.

**Dependencies.** Layers 3.2–3.3, 4.1, and 4.2, and the perfect Weil pairing of Layer 2.5.

**Further sources.** Česnavičius, Remark 4.2.3: where the order of `A` is invertible, a Drinfeld
`A`-structure is an isomorphism of the constant group onto a subgroup.

### 4.4. Relative representability of `[Γ(N)]`, `[Γ₁(N)]`, and balanced `[Γ₁(N)]`

KM 3.6.0 proves the relative representability of these three problems. KM Remark 3.6.1 expressly
excludes `[Γ₀(N)]`: its relative representability needs the cyclicity theorem of Layer 9.3,
whose proof uses the regularity of `[Γ₁(pⁿ)]` proved in Layer 8.8.

Two of the three are at the pin (§Exact supplier contracts), over every base and with no
invertibility hypothesis on `N`:

- `[Γ₁(N)]` is relatively representable by the exact-order scheme of Layer 4.1
  (`gammaOneRelRepData`), finite over `Ell/B` for `N ≠ 0`
  (`hasProperty_isFinite_gammaOneRelRepData`);
- `[Γ(N)]` is relatively representable by the closed Drinfeld-basis locus
  `EllObj.drinfeldBasisScheme` of `E[N] ×_S E[N]` (`gammaRelRepData`), finite over `Ell/B`
  (`hasProperty_isFinite_gammaRelRepData`).

Their formation commutes with arbitrary base change (`RelRepData.isPullback`), and over `ℤ[1/N]`
they are the naive problems through the isomorphisms of Layer 4.3, hence finite étale there
(`hasProperty_etale_gammaRelRepData`). Owned here:

- the relative representability of balanced `[Γ₁(N)]` by the cyclic-subgroup and Cartier-dual
  generator loci, finite over `Ell/ℤ`, commuting with arbitrary base change and restricting over
  `ℤ[1/N]` to the naive problem of Layer 4.3.

Flatness and regularity of all three are proved in Layer 8.

**Checks.**

- For `N = 1` both pinned representing schemes are the base itself (`gammaLevelOneIso`,
  `gammaOneOneIso`); a construction cutting out a proper closed subscheme for `N = 1` is wrong.
- Over `𝔽_p` with `E` supersingular, the Drinfeld-basis scheme of `E[p]` has the point `(0, 0)`
  and the exact-order scheme of order `p` contains the zero section, while the naive loci of
  Layer 3.2 are empty: the integral problems are finite but not étale there, and a definition of
  the integral loci by the naive condition would be empty in characteristic `p`.
- The rank of `[Γ(N)]` over `Ell/ℤ[1/N]` is `|GL₂(ℤ/Nℤ)|` and that of `[Γ₁(N)]` is
  `N² ∏_{p ∣ N}(1 − 1/p²)`, the number of points of exact order `N` in `(ℤ/Nℤ)²`; Layer 8 proves
  that these ranks persist over `ℤ`.

**Dependencies.** Layers 0.1–0.2, 0.6, 0.8, 2.1–2.5, 3.1, and 4.1–4.3.

**Further sources.** Česnavičius, Proposition 4.3.2: forgetting a Drinfeld `(ℤ/n)²`-structure is
representable, finite and locally free of degree `#GL₂(ℤ/nℤ)`, and étale over `ℤ[1/n]`, for
generalized elliptic curves. Conrad, Theorem 3.2.2: isomorphism schemes of curves with `Γ(N)`- or
`Γ₁(N)`-structure are finite.

## Layer 5: affine fine modular curves after inverting `N`

References: KM 2.7.2, 3.7.1, 4.7.0, Corollary 4.7.2; Loeffler 3.3.4, 3.3.6,
3.4.4, and §3.8.

### 5.1. Tate normal form and `Y₁(N)` for `N≥4`

The direct Tate-atlas construction is at the pin (§Exact supplier contracts).

1. For a section `P` such that `P`, `2P`, and `3P` are nowhere the zero section, `(E, P)` is the
   pullback of the universal Tate normal form

   ```text
   Y² + aXY + bY = X³ + bX²
   ```

   over `Spec ℤ[a,b,Δ⁻¹]` with its point `(0, 0)`, along a unique morphism of bases and a unique
   cartesian pointed morphism, over any base (`existsUnique_tateNormalForm`); in `Ell/B` the
   universal family is `EllObj.universalTate B`.
2. The discriminant of the form is the Check below.
3. For `N` invertible on `B`, `Y₁(N)` is the closed subscheme of `B × Spec ℤ[a,b,Δ⁻¹]` on which
   `N(0,0) = 0` and `d(0,0)` misses the zero section for every proper divisor `d ∣ N`, and
   `EllObj.yOne B N hN` is the universal Tate normal form restricted to it; the killed-by-`d`
   loci are open and closed after inverting `N` because two sections killed by `N` agree on an
   open and closed set.
4. For `N≥4` it represents the naive `[Γ₁(N)]`-problem over `Ell/B`
   (`gammaOneNaiveRepresentableBy`) and, through Layer 4.3, the Drinfeld one
   (`gammaOneRepresentableBy`); it is affine over `B` (`isAffineHom_yOne_structureMap`), hence
   affine for `B = Spec ℤ[1/N]`, and smooth over `B` (`smooth_yOne_structureMap`: `Y₁(N)` is a
   retract over `B` of the scheme of points of naive exact order `N` on the universal Tate normal
   form, which is finite étale over the smooth `B`-scheme `B × Spec ℤ[a,b,Δ⁻¹]`).
5. The relative representing map is finite étale over `Ell/ℤ[1/N]`:
   `hasProperty_etale_gammaOneNaiveRelRepData` (Loeffler, Proposition 3.8.2, for étaleness) and
   `hasProperty_isFinite_gammaOneNaiveRelRepData` of Layer 3.2.

For `N≥4`, this construction directly represents `Y₁(N)`; it is not routed through KM 4.7.0. No
fine representability assertion is made for `N≤3`, where the indicated point structure does not
rigidify every elliptic curve. Nothing of this block is restated in `Suggested.lean`.

**Checks.**

- The discriminant of `Y² + aXY + bY = X³ + bX²` is
  `Δ = b³(a³ − a⁴ − 8a²b + 36ab − 27b − 16b²)`; for `a = b = 1` it is `−15`, the discriminant of
  the curve `y² + xy + y = x³ + x²` of conductor `15`. The factor `b³` is why `b` is inverted in
  the coefficient ring: at `b = 0` the form is singular at `(0, 0)`.
- `Y₁(4)` over `ℤ[1/2]` is the locus `a = 1`: on `Y² + XY + bY = X³ + bX²` the tangent at
  `(0, 0)` is `Y = 0`, so `2(0,0) = (−b, 0)`, which is its own negative. `Y₁(5)` over `ℤ[1/5]` is
  the locus `b = a − 1`, on which `4(0,0) = −(0,0)`; with the other sign convention for `b`
  (`Y² + (1 − c)XY − bY = X³ − bX²`) the `Y₁(5)` locus reads `b = c`, so a Check that used the
  wrong sign would place `Y₁(5)` at `b = 1 − a`.
- For `N = 3` the block produces nothing: a point of exact order `3` has `3P` equal to the zero
  section, so it has no Tate normal form, and no representability claim is made for `N ≤ 3`.

**Dependencies.** Layers 1.1–1.4, 2.1, and 3.2; the Drinfeld form of item 4 also uses Layer 4.3.

**Further sources.** DR IV 3.4 and IV 6.7, Conrad, Theorem 3.2.7 and Theorem 4.2.1(2), and
Česnavičius, §4.1.2 and Lemma 4.1.3, prove that the compactified moduli stack of a level structure
is smooth where the level is invertible and that its locus without automorphisms is a scheme, for
every level; `Y₁(N)` is the locus of elliptic curves in the case `Γ₁(N)`. These are more general in
the level and include the cusps. None of them contains the universal property of the Tate normal
form over a base, for which KM remains the locator.

### 5.2. Full ordered bases and fixed pairing

For `N ≥ 3`, the rigidity of the naive full-level problem (KM 2.7.2, `isRigid_gammaNaive`) and its
relative representability by the open full-level locus in `E[N]×_S E[N]`, étale, finite and
surjective over `Ell/B` where `N` is invertible (KM 3.7.1, Layer 3.2), are at the pin. Prove its
representability by an elliptic curve over a scheme `Y_full(N)` affine and smooth over `B`, for
every base `B`, in particular over `ℤ[1/N]` (KM 4.7.0 and Corollary 4.7.2):
`exists_representableBy_gammaNaive` in `Suggested.lean`. Over `ℤ[1/N]` this is the application of
`exists_representableBy_of_isRigid` of Layer 3.5 together with the smoothness of the rigidified
scheme, which is finite étale over the smooth Weierstrass base of the rigidifier. Over a general
`B` the representing object is the base change of `Y_full(N)/ℤ[1/N]` along `B → Spec ℤ`, affine
and smooth over `B` as the base change of the composite `Y_full(N) → Spec ℤ[1/N] → Spec ℤ` of an
affine smooth morphism with the open immersion of a principal open. It represents
`gammaNaive B N` on all of `Ell/B`: an object `E/S` of `Ell/B` with a point of residue
characteristic `p ∣ N` carries no naive structure, because a homomorphism `(ℤ/Nℤ)² → E(S)`
injective on the fibre over that point would embed `(ℤ/pℤ)²`, of order `p²`, in the `p`-torsion
of that fibre, which has at most `p` points; and `S` admits no map to `Y_full(N)` either, its
structure map to `Spec ℤ` not factoring through `Spec ℤ[1/N]`. Both sides are empty there, and
over the open locus of `B` where `N` is invertible both sides are the naive structures of the
representability over `ℤ[1/N]`.

Define `μ_N^prim` by the cyclotomic polynomial `Φ_N`, and prove that over `ℤ[1/N]` it is the
open-and-closed exact-order-`N` locus in `μ_N`, finite étale of rank `φ(N)`. Construct:

- the right `GL₂(ℤ/Nℤ)`-action using the row-vector convention;
- the determinant map

  ```text
  det_N : Y_full(N) ⟶ μ_N^prim,
  det_N(E,P,Q) = e_N(P,Q);
  ```

- the formula

  ```text
  det_N((P,Q)g) = det_N(P,Q)^det(g);
  ```

- for a chosen primitive root `ζ`, the fibre `Y(N,ζ)` over `ℤ[1/N,ζ_N]`;
- the induced `SL₂(ℤ/Nℤ)`-action on this fibre.

Prove that the determinant map is surjective by checking geometric points. Over an algebraically
closed field `k` with `char k ∤ N`, choose an elliptic curve and a basis `(P,Q)` of `E[N]`.
Perfection makes `e_N(P,Q)` primitive; for any prescribed primitive root, replace `Q` by `aQ` for
a suitable `a∈(ℤ/Nℤ)ˣ`. This gives a lift of every geometric point of `μ_N^prim`; use the
geometric-point criterion for surjectivity of schemes to conclude. Equivalently, over a fixed
elliptic family the relative symplectic-frame carrier is finite étale and surjective over
`μ_N^prim×Ell`. The fine curve `Y_full(N)` itself is not finite over `ℤ[1/N]`. Its determinant
fibres become open-and-closed summands after a base change splitting `μ_N^prim`, for example
on adjoining a primitive `N`th root of unity; `GL₂` permutes these summands through the
determinant. They are not asserted to be individual open-and-closed summands over `ℤ[1/N]`
before that base change. Call them determinant fibres or fixed-pairing loci, not connected
components. No connectedness or irreducibility theorem is asserted.

**Dependencies.** The representability of `Y_full(N)` uses Layers 3.2, 3.3, and 3.5. The determinant map and fixed-pairing
decomposition additionally use the Weil pairing of Layer 2.5; they require no further
Cartier-divisor theorem beyond it.

**Further sources.** Conrad, Theorem 3.2.7, Theorem 4.1.1(3) and Theorem 4.2.1(2): the stack of
`Γ(N)`-structures on generalized elliptic curves is smooth over `ℤ[1/N]`, the Weil pairing defines
its morphism to `Spec ℤ[ζ_N]`, and it is a scheme once a divisor `d ≥ 3` of `N` is inverted.
Scholze, Theorem 4.3, states the representability by a smooth affine curve over `ℤ[1/m]` for
`m ≥ 3`.

### 5.3. The twisted curve `Y(ρ)`

Assume `N ≥ 3`. Let `V` be a free `(ℤ/Nℤ)`-module of rank two with a continuous Galois action and a
perfect alternating Galois-equivariant pairing to `μ_N`. Use Layer 0.4 to construct the corresponding
finite étale group scheme `V_ρ/ℚ` with pairing.

Construct the moduli scheme explicitly:

1. construct the finite étale frame torsor
   `W = Isom((ℤ/N)²,V_ρ)`;
2. form `Y_full(N)×W`;
3. for a frame `f:(ℤ/N)²≅V_ρ`, cut out the open-and-closed locus on which
   `e_N(P,Q)=⟨f(e₁),f(e₂)⟩`, and prove invariance under the diagonal `GL₂`-action from the
   determinant transformation laws on both sides;
4. let `GL₂(ℤ/Nℤ)` act diagonally and form the finite free quotient;
5. prove that its `T`-points are exactly pairing-preserving isomorphisms
   `E[N]≅V_{ρ,T}`;
6. use Layer 3.3 to prove that the diagonal action is free, use finite étale descent to prove that
   the quotient is a smooth affine curve `Y(ρ)/ℚ`, and establish its field-points description.

This is a framed symplectic quotient of a fixed-pairing problem, not an unspecified twist of the
union of determinant fibres. It is the interface used by the FLT `3`–`5` switch.

The hypothesis `N ≥ 3` is essential: for `N≤2`, `-1` acts trivially on `E[N]`, so the problem is not
rigid.

**Geometric irreducibility, conditionally.** Buzzard's statement is that `Y(ρ)` is smooth *and
geometrically irreducible*, and the second half is not decoration: the FLT `3`–`5` switch needs
enough rational points on the twisted curve, and that argument runs through irreducibility. Stopping
at "smooth affine curve" would leave this roadmap one theorem short of the interface it advertises.
The algebraic reduction is at the pin, with geometric connectedness as an explicit
hypothesis; an external contract for a reference proof is recorded below:

7. prove that `Y(ρ) ⊗ ℚ̄` is nonempty and smooth — the base change of a smooth morphism is smooth —
   and apply the pinned theorem that a connected scheme smooth over a field is irreducible
   (`TauCeti.AlgebraicGeometry.Smooth.irreducibleSpace_of_connectedSpace`: smooth over a field
   gives local noetherianness and regular, hence integral, local rings, and a connected locally
   noetherian scheme with integral local rings is irreducible), in its form over `AlgebraicClosure K`
   (`Smooth.irreducibleSpace_baseChange_algebraicClosure_of_connectedSpace`, applied with
   `K = ℚ`; §Exact supplier contracts). Together these reduce geometric irreducibility of `Y(ρ)`
   to the single hypothesis that `Y(ρ) ⊗ ℚ̄` is **connected**. Neither theorem is restated in
   `Suggested.lean`.

**Geometric connectedness remains an explicit external hypothesis.** The reference route
through Katz–Mazur 10.9.2 uses the geometric generic fibre and the complex uniformisation by a
quotient of the upper half plane. This describes that proof, not an impossibility theorem for
algebraic alternatives. The required contract consists of two separate statements:

- the uniformisation `(Y(ρ) ⊗ ℂ)^an ≅ ℍ/Γ̃` as Riemann surfaces;
- for this finite-type smooth affine `ℂ`-curve, algebraic connectedness agrees with
  connectedness of its analytification. This is a scheme–analytic comparison, not an
  unrestricted statement about arbitrary `ℂ`-schemes.

The passage between `ℂ` and `ℚ̄` is not part of the contract. If `Y(ρ) ⊗ ℂ` is connected, so is
its image `Y(ρ) ⊗ ℚ̄` under the surjective projection; conversely, `Y(ρ)` is affine, and the
pinned `TauCeti.connectedSpace_primeSpectrum_tensorProduct_of_isAlgClosed` (§Exact supplier
contracts) carries connectedness from `ℚ̄` to every field extension of it.

No roadmap in this repository owns the two statements. The in-repository Modular Forms roadmap
deliberately stops at analytic carriers and takes on no scheme–analytic comparison, and the
Algebraic Curves roadmap excludes the compact-Riemann-surface comparison in its §Scope exclusions
and future directions for the same reason: both statements sit behind a GAGA-style development
that no roadmap on main has adopted. The roadmap in whose direction the second statement lies is
ComplexComparison, which plans the analytification of every finite-type complex scheme; this
roadmap takes no dependency on it and keeps the two hypotheses explicit. They are therefore an
**external supplier contract** in the strict sense — two named hypotheses, not dependencies on any
milestone — and the contract is discharged by whichever development eventually proves them,
without this roadmap presupposing which one. Accordingly,
every statement about `Y(ρ)` in this roadmap carries the connectedness hypothesis visibly rather
than assuming it — an open supplier contract is a blocker on the *unconditional* statement,
not a licence to assert it.

Compactified coarse curves over `ℤ[1/N]` are within scope — the include-list entry for Layer 10
in §Scope states exactly what is and is not taken on.

**Dependencies.** Layers 0.3–0.5, 2.5, 3.3, and 5.2. The construction uses no new Cartier-divisor result
beyond the Weil pairing already supplied by Layer 2.5. The pairing normalisation in Layer 2.5 uses
Tau Ceti's equation-level pairing.

**Further sources.** Conrad, Theorem 4.2.1(1), is a locator for the connectedness hypothesis in the
untwisted case: the fibres of the stack of `Γ(N)`-structures over `ℤ[ζ_N]` are geometrically
connected. The proof there compares with the complex-analytic theory in characteristic zero, so it
does not remove the transcendental input named in §Scope.

## Layer 6: quotient problems, coarse moduli schemes, and the `j`-line

References: KM 7.1.2–7.1.4, 7.4.2, 8.1.1–8.1.3.1, 8.1.5, 8.1.6, 8.2.1, 8.2.2, and the Notes Added
in Proof (pp. 508–509); Igusa, *Fiber systems of Jacobian varieties III*, §2; Loeffler §§3.6 and
3.8.

The quotient and coarse-moduli formalism is general, and its applications in this layer are over
`ℤ[1/N]`. No regularity theorem is used; the integral statements about the same quotients are in
Layers 8.5, 8.9, 9.5, and 9.6.

### 6.1. Katz–Mazur quotient problems

Let `𝒫` and `𝒫'` be relatively representable moduli problems, let a finite group `H` act on both,
and let `q:𝒫⟶𝒫'` be equivariant. Define `𝒫'=𝒫/H` by KM 7.1.2's two conditions, without adding a
universal property to the definition (`KatzMazurQuotientData`, which also records the morphisms
`mapRep` of representing schemes induced by `q` and the actions `schemeAction` of `H` on them
induced by the action on `𝒫`, each characterised through the representing bijections of
`RelRepData`, and whose Q2 is the scheme quotient `IsCategoricalQuotient`):

1. **Q1:** `H` acts trivially on `𝒫'`.
2. **Q2:** for every representable moduli problem `δ` which is étale and surjective over
   `Ell/R` (equivalent to KM's quantification over all étale representable `δ`, since a
   non-surjective one may be enlarged by a disjoint union), the scheme
   quotient `𝕄(δ,𝒫)/H` exists and the morphism induced by `q` is an isomorphism

   ```text
   𝕄(δ,𝒫)/H ≅ 𝕄(δ,𝒫').
   ```

For a relatively representable **affine** problem `𝒫` with a finite `H`-action, construct `𝒫/H`
and prove the following explicitly scoped quotient statements. Finiteness uses the additional
finite-type hypothesis in item 4; invariant base change uses the hypotheses in item 3, not
flatness of the source scheme.

1. The quotient exists (`KatzMazurQuotientData.exists_of_hasProperty_affine`), is relatively
   representable and affine (`hasProperty_affine`). The projection is the categorical quotient:
   every equivariant map from `𝒫` to a relatively representable problem on which `H` acts trivially
   factors uniquely through `𝒫/H` (`existsUnique_desc`).
2. **Freeness, fixed reading.** Say `H` **acts freely** on `𝒫` if for every `h≠1` the fixed
   locus of `h` on every representing scheme `𝒫_{E/S}` is the empty scheme — equivalently, every
   `α∈𝒫(E/S)` with `S` nonempty has trivial stabiliser. KM's set-level phrase ("freely on the
   set `𝒫(E/S)`", KM 7.1.3(2)) is deliberately not taken literally: over the empty base each
   standard problem has exactly one level structure, it is fixed by all of `H`, and the literal
   reading would be unsatisfiable for nontrivial `H`. The scheme-theoretic reading costs nothing
   at the conclusion, which over an empty base holds trivially. Every later occurrence of "free"
   in this roadmap — items 3 and 4 below, Remark 7.1.4, and G1 of Layer 8.5 — is this notion, and
   `Suggested.lean` states it on nonempty test objects, which is equivalent. If `H` acts freely
   on `𝒫`, then `𝒫⟶𝒫/H` and every fibrewise representing map are étale `H`-torsors
   (`etale_mapRep_of_free`), and `(𝒫_{E/S})/H≅(𝒫/H)_{E/S}`.
3. For every `E/S`, construct `(𝒫_{E/S})/H⟶(𝒫/H)_{E/S}`. It is bijective on geometric points
   and is an isomorphism if `|H|` is invertible on `S` (`isCategoricalQuotient_of_isUnit_card`)
   or the action is free. When using a
   flat-base-change argument, exhibit the flat morphism along which the invariant algebra is
   being base changed. Flatness of `𝒫_{E/S}⟶S` alone is not sufficient: `ℤ[x]` with the action
   `x ↦ -x` is flat over `ℤ`, but `(ℤ[x]^{C₂}) ⊗ 𝔽₂ = 𝔽₂[x²]` whereas
   `(ℤ[x] ⊗ 𝔽₂)^{C₂} = 𝔽₂[x]`. This is a regression example, not a new exception to a
   correctly stated flat-base-change theorem.
4. If the affine relatively representable problem `𝒫` is also locally of finite type over
   `Ell/R`, the projection `𝒫⟶𝒫/H` is finite. Prove this on affine rigidifiers by applying
   the finite-type invariant-ring theorem of Layer 0.3, then descend finiteness. This is the extra
   `hP_ft` hypothesis of `isFinite_mapRep`; the integral level problems of Layers 4.4
   and 9.4 are finite over
   `Ell/R`, hence satisfy it. Without finite type, a finite-group quotient need only be
   integral: let `A = ℚ[x₁,x₂,…]` and let `C₂` negate every variable. For `B = A^{C₂}` and
   its positive-degree ideal `B₊`, `A/B₊A = ℚ ⊕ ⨁ᵢ ℚ xᵢ` is infinite-dimensional, so `A`
   cannot be module-finite over `B`. Even in the finite-type case the quotient projection
   need not be flat or locally of finite presentation (Layer 0.2); the free case of item 2
   and the regularity theorem of Layer 8.5 supply their own stronger conclusions.
5. If `𝒫` is normal, then `𝒫/H` is normal.
6. If `R` is noetherian and `𝒫` is finite over `Ell/R`, then `𝒫/H` is finite over `Ell/R`
   (`hasProperty_finite`).

State KM Remark 7.1.4 separately. For a ring map `R⟶R'`, construct

```text
(𝒫⊗_R R')/H ⟶ (𝒫/H)⊗_R R'.
```

It is an isomorphism if `R⟶R'` is flat, if `|H|` is invertible in `R'`, or if the action is
free; in general it is surjective and radicial.

Apply this construction to the integral Drinfeld full-level problem. After inverting `N`, use the
flat base-change theorem and Layer 4.3 to identify it with the fppf sheaf quotient of the naive
ordered-basis problem. This sheaf quotient is the sheafification of the objectwise orbit presheaf;
the raw presheaf is not the definition and need not be a sheaf. Keep both objects distinct from the
coarse scheme quotient of Layer 6.3.

**Dependencies.** Layers 0.3, 0.5, 3.1, 3.4–3.5, and 4.3–4.4.

**Further sources.** SGA 1, Exposé V, Proposition 1.1, Corollaire 1.2, Corollaire 1.5, Proposition
1.8 and Proposition 1.9, for quotients by finite groups, their finiteness and flat base change, and
Proposition 2.2 and Corollaire 2.3 there for free actions. EGM (4.8) treats a finite group acting on
an affine scheme and (4.16) a finite locally free group scheme over an arbitrary base; finiteness of
the quotient morphism is stated there for a locally noetherian base. Rydh, Theorem (4.1) and
Corollary (5.4), treat finite locally free groupoids with no noetherian hypothesis. Česnavičius,
Proposition 6.3, identifies the quotient problem `[Γ(n)]/H` with the stack of elliptic curves with
level structure for the inverse image of `H`, and its coarse moduli scheme with the coarse space of
that stack.

### 6.2. The standard quotient problems after inverting `N`

State the seven identifications of KM 7.4.2, with the row-vector convention fixed above, and prove
each of them after inverting `N`, where `[Γ₀(N)]` is the naive problem of Layer 3.2 and the other
problems are identified with their naive forms by Layer 4.3.

1. For `d∣N`, the map `(P,Q)↦((N/d)P,(N/d)Q)` identifies `[Γ(d)]` with `[Γ(N)]` modulo
   the subgroup congruent to the identity modulo `d`.
2. The map `(P,Q)↦(P,Q mod P)` identifies balanced `[Γ₁(N)]` with the quotient by
   `{[[1,b],[0,1]]}`.
3. The map `(P,Q)↦P` identifies `[Γ₁(N)]` with the quotient by
   `{[[1,b],[0,d]] : d∈(ℤ/Nℤ)ˣ}`.
4. The map `(P,Q)↦⟨P⟩` identifies `[Γ₀(N)]` with the quotient by the upper triangular Borel.
5. Forgetting the dual generator identifies `[Γ₁(N)]` as the quotient of balanced
   `[Γ₁(N)]` by `1×(ℤ/Nℤ)ˣ`.
6. Forgetting both generators but retaining the kernel identifies `[Γ₀(N)]` as the quotient
   of balanced `[Γ₁(N)]` by `(ℤ/Nℤ)ˣ×(ℤ/Nℤ)ˣ`.
7. The map `(E,P)↦(E,⟨P⟩)` identifies `[Γ₀(N)]` as the quotient of `[Γ₁(N)]` by
   `(ℤ/Nℤ)ˣ`.

The identifications over `ℤ` need the regularity theorems and are Layer 9.5.

Record the diamond action on `[Γ₁(N)]` as `P↦aP`; inside `SL₂` it is `P↦d⁻¹P`, not `P↦dP`.
After inverting `N`, prove the action of `det H` on determinant fibres, the naive quotient-rigidity
criterion, and the semi-Borel rigid case for `N≥4` using KM 2.7.4. None is promoted to an integral
Drinfeld-rigidity theorem.

**Dependencies.** Layers 2.5, 3.2–3.3, 4.3, 5.2, and 6.1.

**Further sources.** Česnavičius, §4.1.2 and Proposition 6.3, treat every subgroup `H` uniformly in
the language of stacks. The seven cases are not listed there, and the row-vector convention has to
be matched by hand.

### 6.3. Coarse moduli schemes

For an affine moduli problem `𝒫`, construct `M(𝒫)` as in KM 8.1.1 Zariski-locally on the
coefficient ring. On an open where some `N≥3` is invertible, choose a representable finite étale
Galois rigidifier `δ` with group `G` and set `M(𝒫)=𝕄(𝒫,δ)/G`, the invariant quotient of Layer 0.3.
KM's own examples are the naive problems `[Γ(N)]`, which are `GL₂(ℤ/Nℤ)`-torsors over
`Ell/ℤ[1/N]` and are representable by KM 4.7.0; over `Spec ℤ` use `[Γ(3)]` on `D(3)` and
`[Γ(4)]` on `D(2)`. The Legendre problem is not admissible here, because it is not Galois. Compare
different choices on overlaps by the simultaneous rigidifier, prove the cocycle condition, and glue.
Prove the classifying map, functoriality, independence of all local choices, KM 8.1.2 (`M(𝒫)` is
normal when `𝒫` is), and the bijection on algebraically closed field-valued isomorphism classes
(`CoarseModuliData` with `exists_coarseModuliData`). Do not assume one global rigidifier over an
arbitrary coefficient ring.

State KM 8.1.5 as an explicit bridge (`coarseModuli_quotient`). For a finite group `H` acting on
`𝒫`, construct the canonical isomorphism, compatible with classifying maps,

```text
M(𝒫)/H ≅ M(𝒫/H).
```

For a ring map `R⟶R'`, construct `M(𝒫⊗_R R')⟶M(𝒫)⊗_R R'` and prove KM 8.1.6: it is an
isomorphism if any one of the following holds:

1. `𝒫` is representable;
2. `R⟶R'` is flat;
3. `6` is invertible in `R`;
4. `𝒫=𝒫'/G` for a representable problem `𝒫'` and a finite group `G` whose order is invertible in
   `R'`.

For (2) and (4), identify the proof with base change for invariant rings. For (3), use the
simultaneous full-level-three problem and `GL₂(𝔽₃)`. KM Remark 8.1.7 remains a cited warning that
coarse formation need not commute with arbitrary base change. Its examples use graded rings of
modular forms for `[ω]` and `[Δ=1]`; since modular forms are outside this roadmap, that calculation
is not a formalisation target here.

**Dependencies.** Layers 0.3, 3.1–3.2, 3.5, 5.2, and 6.1, and the finite invariant-quotient API.

**Further sources.** Conrad, *The Keel–Mori theorem via stacks*, Theorem 1.1, constructs the coarse
space of an Artin stack which is locally of finite presentation and has finite inertia, and Rydh,
Theorem (6.12), does so with finite inertia alone; both are more general. Theorem 3.1 of the former
is the case of a stack with a finite locally free cover by a scheme in which every orbit lies in an
affine open, which contains the quotients by finite groups used here. Česnavičius, Lemma 6.2, after
DR IV 3.10(iii), is the bridge `M(𝒫)/H ≅ M(𝒫/H)` for the compactified coarse curves of full level.

### 6.4. Smoothness of finite quotients and the curves `Y_H`

**Smoothness of finite quotients** (KM, Notes Added in Proof, pp. 508–509). State and prove, as a
milestone of its own, the theorem on which the interior geometry of Layer 10 stands: for a
locally noetherian scheme `S` all of whose local rings are regular, a smooth affine relative
curve `Y ⟶ S`, and a finite group `H` acting on `Y` by `S`-automorphisms, the invariant quotient
`Y/H` of Layer 0.3 is again a smooth relative curve over `S`. **No hypothesis that `|H|` be
invertible on `S`.** This is what makes the
theorem usable over `ℤ[1/N]` in residue characteristics `2` and `3`, where the diamond group has
even order and, for `N ≡ 1 mod 3`, order divisible by `3`; the invertible-order case would not
cover the class of Layer 10. Regularity of the total space together with flatness over `S` is
**not** a proof and must not be offered as one: over a discrete valuation ring `R` with
uniformiser `π`, `Spec R[x,y]/(xy − π)` is regular and flat over `R` with a singular closed fibre.
The Lean statement is `smoothOfRelativeDimension_one_of_isCategoricalQuotient` in
`Suggested.lean`, for an arbitrary categorical quotient of a smooth affine relative curve over a
locally noetherian base with regular local rings.

Apply it once, in the vocabulary of Layer 10: `Y₁(N)/ℤ[1/N]` is a smooth affine relative curve
(Layer 5.1) carrying the diamond action `P ↦ aP` of Layer 6.2, on which `−1` acts trivially, so for
every `H ≤ (ℤ/Nℤ)ˣ/{±1}` the quotient `Y_H := Y₁(N)/H` is a smooth affine relative curve over
`ℤ[1/N]`; by KM 8.1.5 above it is the coarse scheme `M([Γ₁(N)]/H)`. The interior smoothness of
`Y_H` used in Layer 10 is this application and nothing else. Smoothness of `Y_H` is not deduced
from KM 7.5.1's regularity of `𝒫/H` (Layer 8.5), which gives a regular total space, not a smooth
morphism to `ℤ[1/N]`.

Apply it a second time, to **coarse base change away from the level**. The four hypotheses of KM
8.1.6 in Layer 6.3 do not reach a quotient of a level problem over `ℤ[1/N]` in residue
characteristics `2` and `3` when the order of the group is divisible by them. Prove the following
case, which does. Let `N ≥ 3`, let `H ≤ GL₂(ℤ/Nℤ)`, and let `𝒫 = [Γ(N)]/H` be the quotient of the
naive full-level problem over `ℤ[1/N]`. Then `M(𝒫⊗R') ⟶ M(𝒫)⊗R'` is an isomorphism for every
`ℤ[1/N]`-algebra `R'`.

The route is as follows. The action of `H` on the naive level structures of a fixed curve is free in
the sense of Layer 6.1, so `𝒫⊗R' = ([Γ(N)]⊗R')/H` by KM Remark 7.1.4, and by KM 8.1.5 the claim is
that `A^H ⊗ R' ⟶ (A ⊗ R')^H` is an isomorphism, where `A` is the coordinate ring of `Y_full(N)`
(Layer 5.2). The invariant ring is the kernel of `A ⟶ ∏_{h∈H} A`, `a ↦ (ha − a)_h`, and `A` is flat
over the principal ideal domain `ℤ[1/N]`, so by `ker_baseChange_of_noZeroSMulDivisors_coker` it
suffices that `A^H/p ⟶ (A/p)^H` be surjective for every prime `p ∤ N`. This map is injective, and
`Spec (A/p)^H ⟶ Spec (A^H/p)` is a finite surjective morphism of curves which are smooth over `𝔽_p`
by the theorem above, applied to `Y_full(N)` over `ℤ[1/N]` and to its fibre over `𝔽_p`; it is
therefore finite locally free. The element `−1` acts trivially on `Y_full(N)`, and on the invariant
open subscheme `j ≠ 0, 1728`, where the automorphism group of every geometric fibre is `{±1}`, the
group `H/(H ∩ {±1})` acts freely; the torsor square of a free action (Layer 0.3) is stable under
base change, so the map is an isomorphism over that open subscheme, which is dense in the target.
Its rank is therefore one. Česnavičius, Proposition 6.4(b), proves the statement for the
compactified curves of every level, in the language of stacks and over every base on which
`gcd(6,n)` is invertible, which is more general; over `ℤ[1/n]` the proof there has the same steps
(reduction to the fields `𝔽_p`, flatness of a finite morphism of smooth curves, rank one away from
`j = 0` and `j = 1728`), with the rigidification of a stack by `{±1}` in place of the free quotient.
Proposition 6.3 there is the dictionary with the quotient problems and coarse moduli schemes used
here. Remark 6.6 there records that the invertibility of `gcd(6,n)` cannot be dropped: for level
`Γ₁(4)` the statement fails in characteristic `2`.

**Dependencies.** Layers 0.3, 5.1–5.2, and 6.1–6.3.

**Further sources.** DR VI 6.7 proves that the coarse curve of every level is smooth where the level
is invertible by a different method, which does not pass through the general theorem on quotients:
Abhyankar's lemma away from `j = 0, 1728`, and a study of the action of the automorphism group on
the deformation ring in characteristics `2` and `3`. Česnavičius, Proposition 6.4(a), deduces the
same statement from the theorem of KM.

### 6.5. The coarse `j`-line

KM 8.2.1 states that `M([Γ(1)]) = Spec R[j]` over every ring `R`, with `j` normalised as in Tate's
formulaire, and cites Igusa, *Fiber systems of Jacobian varieties III*, §2, for the proof. Prove it
here by the following route, which uses only material already constructed.

1. The morphism `j:[Γ(1)]⟶𝔸¹_ℤ` is at the pin (§Exact supplier contracts):
   `EllipticCurveGeom.jMap E : S ⟶ Spec ℤ[j]`, glued from the `j`-invariants of the local
   Weierstrass equations of Layer 1.3, invariant under variable changes (`j_eq_of_iso`,
   `appTop_j_of_isPullback`) and compatible with base change (`jMap_baseChange`), so a morphism
   from the trivial problem `[Γ(1)]` to the affine line. Hence, by the coarse universal property,
   the morphism `j:M([Γ(1)])⟶𝔸¹_ℤ`. Both sides are affine, so `j` is separated.
2. Over `ℤ[1/3]`, `M([Γ(1)])` is by definition `Y_full(3)/GL₂(𝔽₃)`, where `Y_full(3)` is the
   base `Spec ℤ[1/3,ζ₃][μ, 1/(μ³−1)]` of the universal level-three normal form
   `Y² + 3μXY + (μ³−1)Y = X³` of Layer 3.5, with `c₄ = 9μ(μ³+8)` and `Δ = 27(μ³−1)³`, so that
   `j = c₄³/Δ = 27u` with `u = μ³(μ³+8)³/(μ³−1)³`. Its coordinate ring is Tau Ceti's level-three
   ring `A₃ = LevelThreeRing ℤ[1/3,ζ₃]`, free of rank `12` over `ℤ[1/3,ζ₃][u] = ℤ[1/3,ζ₃][j]`
   (`finrank_levelThreeRing`: `μ` is a root of the monic degree-twelve relation
   `T³(T³+8)³ − u(T³−1)³`, and `μ³ − 1` is a unit in the quotient because `3` is), and the
   tetrahedral group generated by `μ ↦ ζ₃μ` and `μ ↦ (μ+2)/(μ−1)`, twelve substitutions over
   `ℤ[1/3,ζ₃][u]`, has invariants exactly `ℤ[1/3,ζ₃][u]` (`isInvariant_tetrahedralGroup`, `2`
   being a nonzerodivisor). Owned here is the identification of the actions: `−1 ∈ GL₂(𝔽₃)` acts
   trivially, being the automorphism `[−1]` of every curve; `SL₂(𝔽₃)/{±1} ≅ A₄` acts on
   `Y_full(3)` over `ℤ[1/3,ζ₃]` and is the tetrahedral group on `μ`; and `GL₂(𝔽₃)` acts on
   `ζ₃` through the determinant and the Weil pairing of the basis. Hence `A₃^{GL₂(𝔽₃)}` is the
   subring of `ℤ[1/3,ζ₃][j]` fixed by `ζ₃ ↦ ζ₃²`, which is `ℤ[1/3][j]`.
3. Over `ℤ[1/2]`, `M([Γ(1)])` is defined by the Galois rigidifier `[Γ(4)]`, but it is computed
   from the Legendre line `Λ=Spec A₂`, whose coordinate ring is Tau Ceti's Legendre ring
   `A₂ = LegendreRing ℤ[1/2] ≅ ℤ[1/2][λ, 1/λ(λ-1)]` (`equivLocalization`), free of rank `6`
   over `ℤ[1/2][u] = ℤ[1/2][j]` with `j = 2⁸u`, `u = (λ²-λ+1)³/λ²(λ-1)²` (`finrank_legendreRing`:
   with `d = λ(λ-1)` and `f = λ²-λ+1 = d+1` the relation `f³ = ud²` is monic of degree six in
   `λ`, and `d(ud − d² − 3d − 3) = 1` makes `d` a unit in the quotient; that `f − d = 1` alone
   does not suffice). Let `S₃` act on `Λ` by the six Möbius substitutions of `λ`, the anharmonic
   group generated by `λ ↦ 1 − λ` and `λ ↦ 1/λ`; its invariants are exactly `ℤ[1/2][u]`
   (`isInvariant_anharmonicGroup`, `6` being a nonzerodivisor of `ℤ[1/2]`). The action does not
   lift to the Legendre family over `Λ`, but `E_λ` and `E_{σ(λ)}` are étale-locally isomorphic
   over `Λ`, so the classifying map `Λ ⟶ M([Γ(1)])` of KM 8.1.3 is `S₃`-invariant and factors
   through `Spec ℤ[1/2][j]`; this factorisation is owned here.
4. Over `ℤ[1/3]`, step 2 says exactly that `j : M([Γ(1)]) = Spec A₃^{GL₂(𝔽₃)} ⟶ 𝔸¹` is an
   isomorphism. Over `ℤ[1/2]`, step 3 gives a section `s` of `j` over `𝔸¹`. A section of a
   separated morphism is a closed immersion; `s` is surjective on geometric points because two
   elliptic curves over an algebraically closed field with the same `j`-invariant are isomorphic
   (Silverman III.1.4(b)) and `M([Γ(1)])` classifies such curves (KM 8.1.3); and `M([Γ(1)])`
   is reduced by KM 8.1.2. Hence `s`, and therefore `j`, is an isomorphism over `ℤ[1/2]`. The
   two isomorphisms agree over `ℤ[1/6]` because both are inverse to `j`, so `j` is an
   isomorphism `M([Γ(1)]) ≅ Spec ℤ[j]` over `ℤ`.
5. Conclude the coarse universal property of `Spec ℤ[j]` and its classification of algebraically
   closed field-valued points from KM 8.1.3.1. This integral coarse `j`-line theorem is
   `exists_coarseModuliData_gamma_one` in `Suggested.lean`: coarse-moduli data for the pinned
   `[Γ(1)]` over `ℤ` whose scheme is `Spec ℤ[j]` and whose classifying map of every `E/S` is
   `jMap E`.
6. **Arbitrary coefficient rings.** KM 8.2.1 asserts `M([Γ(1)]/R) = Spec R[j]` for every ring
   `R`, and this is *not* a corollary of the integral statement: coarse formation does not commute
   with arbitrary base change (KM 8.1.6 needs `6` invertible or `|G|` invertible, and 8.1.7 gives
   counterexamples for other problems), so the arbitrary-base statement is the extra content of
   KM 8.2.1, for which KM cite Igusa. It is an independent milestone with the following route. Work over `D = ℤ[1/N]` with the Galois rigidifier `[Γ(N)]`, `N = 3` on
   `D(3)` and `N = 4` on `D(2)`, and let `A_N` be the coordinate ring of `Y_full(N)`, flat over
   `D` with `G = GL₂(ℤ/Nℤ)` acting; `M([Γ(1)]/R) = Spec (A_N ⊗_D R)^G` for every `D`-algebra
   `R`. The invariant ring is the kernel of `φ : A_N ⟶ ∏_{g∈G} A_N`, `a ↦ (ga - a)_g`, and
   `ker_baseChange_of_noZeroSMulDivisors_coker` (base change of the kernel of a linear map into
   a flat module over a principal ideal domain with torsion-free cokernel; the source need not be
   flat, since the image is a submodule of a flat module and so flat) says that
   `A_N^G ⊗_D R ⟶ (A_N ⊗_D R)^G` is an isomorphism for every `R` as soon as it is surjective
   modulo every prime `p` of `D`, i.e. as soon as `(A_N/p)^G = 𝔽_p[j]` for every `p ≠ N`.
   Prove those fibre computations: for `N = 3` by the invariant computation of step 2 over
   `𝔽_p[ζ₃]` (`isInvariant_tetrahedralGroup` applies for `p ≠ 2, 3`; the fibre at `p = 2`, where
   `2` is not a nonzerodivisor, is covered by `N = 4`), including the split case `p ≡ 1 mod 3` in
   which `Y_full(3)_{𝔽_p}` has two components interchanged by `det` and the invariants are those
   of `SL₂(𝔽₃)` on one component; for
   `N = 4` by the Legendre section argument of steps 3–4 over `𝔽_p`, `p` odd, which needs only
   that `M([Γ(1)]/𝔽_p)` is reduced. Then glue over `D(6)`. Alternatives are to formalise Igusa's
   theorem directly, or to redo the invariant computation uniformly over arbitrary rings including
   the fibres at `2` and `3`; whichever is chosen, the arbitrary-base statement must not be discharged by an
   appeal to the general coarse base-change theorem. The statement is
   `exists_coarseModuliData_gamma_one_of_ring` in `Suggested.lean`: for every ring `R`,
   coarse-moduli data for `[Γ(1)]` over `Ell/R` with scheme `Spec ℤ[j] × Spec R = 𝔸¹_R` and
   classifying map `(jMap E, S ⟶ Spec R)` for every `E/S`.
7. Prove KM 8.2.2: if `R` is noetherian and `𝒫` is finite over `Ell/R`, then
   `M(𝒫) ⟶ Spec R[j]` is finite. Its proof reduces, on an open where an odd prime `ℓ` is
   invertible, to the finiteness of `𝕄(𝒫,[Γ(ℓ)])` over `𝕄([Γ(ℓ)])` and of the affine
   finite-type scheme `𝕄([Γ(ℓ)])` over its `GL₂(𝔽_ℓ)`-quotient `Spec R[1/ℓ][j]`.

The automorphism loci are recorded as a worked example, not as an input to the theorem. Away from
characteristics `2` and `3`, the pointed automorphism group has order `2` off the exceptional
values, order `4` at `j=1728`, and order `6` at `j=0`. In characteristic `3` the exceptional
values coincide at `j=0` and the group has order `12`; in characteristic `2` they likewise coincide
and its order is `24`. Use Silverman, *The Arithmetic of Elliptic Curves*, III.10.1 and Appendix A
for these calculations. Scheme-theoretically the two integral closed loci meet in

```text
V(j,j-1728) ≅ Spec (ℤ/1728ℤ).
```

**Dependencies.** Layers 0.3, 1.3, 3.4–3.5, 5.2, 6.1, and 6.3.

**Further sources.** Česnavičius, Proposition 3.3.2: the coarse space of the stack of elliptic
curves is the affine `j`-line and its formation commutes with arbitrary base change. The statement
over `ℤ` is taken there from DR VI 1.1, which treats the compactified `j`-line, and the base change
is proved by the reduction to the fields `𝔽_p` used in item 6; Lemma 3.3.1 there is the general
criterion, for a Deligne–Mumford stack which is separated, flat and locally of finite type over `ℤ`.

## Layer 7: an elliptic curve at a prime

References: Katz, *Serre–Tate local moduli*, Theorem 1.2.1; the points of use in KM §§5.2–5.3 are
cited statement by statement.

This layer studies one elliptic curve and one prime `p`: the `p`-divisible group, the formal
group, the supersingular curves, and the deformation theory. No level structure enters, except
that PD-6 is stated on the rigidifier schemes of Layer 3.5. The named statements are PD-1 to PD-6
and ST-1, ST-2; with the formal parameter of Layer 7.2 and the universal deformation of Layer 7.4
they are the whole input from this theory to Layers 8 and 9.

### 7.1. The `p`-divisible group, the connected–étale sequence, and Frobenius

The regularity theorems of Layer 8 consume a short, specific list of statements about
`p`-divisible groups and the ordinary/supersingular dichotomy. They are enumerated here and in Layer 7.3 as targets,
each with its base, hypotheses, conclusion, and KM point of use. No general Dieudonné theory and
no Oort–Tate classification are scheduled: the argument never classifies group schemes of order
`p` (rigidity runs through Frobenius kernels, Layer 8.7, and homogeneity through Serre–Tate,
Layers 7.5 and 8.3), and no later layer of this roadmap consumes such a classification.

**PD-1, the tower.** Base: an elliptic curve `E/S` over an arbitrary scheme, `p` prime.
Construct `E[p^∞] = (E[pⁿ])_{n≥0}`: each `E[pⁿ]` finite locally free of rank `p^{2n}`
(Layer 2.1), each `E[pⁿ]` the kernel of `pⁿ` on `E[p^{n+1}]`, multiplication by `p` carrying
`E[p^{n+1}]` onto `E[pⁿ]` as an fppf epimorphism, formation commuting with arbitrary base
change. This is the carrier quantified over by Reg. 3 (KM pp. 129–130) and by G2 of Layer 8.5;
`Suggested.lean` renders its isomorphisms as `PDivisibleGroupIso`, compatible systems of
isomorphisms of finite levels.

**PD-2, connected–étale.** Base: a henselian local ring. Construct the connected–étale
sequence of a finite locally free commutative group scheme, functorial, compatible with local
base change of henselian local rings. Over a perfect field the sequence splits; for a
henselian local base with perfect residue field, this is a splitting of the special fibre,
not an assertion that the whole sequence over the local ring splits. Applied to `E₀[pⁿ]`
over a field it defines the dichotomy the theorems of Layer 8 turn on: `E₀/k` is **ordinary** if
`E₀[p]⁰` has rank `p`, **supersingular** if `E₀[p]` is connected (`Suggested.lean`,
`IsSupersingular`, on Tau Ceti's `E₀.torsion p`).

**PD-3, Frobenius and Verschiebung.** Over a base of characteristic `p`: relative Frobenius
`F : E₀ ⟶ E₀^{(p)}` and Verschiebung `V` with `V∘F = p = F∘V`, for elliptic curves and
their finite levels. Input to PD-4 and to every kernel identification of Layer 8.7.

**Further sources.** EGM (10.10) and (10.15) for `p`-divisible groups over a base scheme and their
height, and (10.16) for the `p`-divisible group of an abelian variety over a field; EGM (4.45) and
(10.21) for the connected–étale sequence over a field, a special case of PD-2; EGM (5.18) and (5.19)
for the Verschiebung of a flat commutative group scheme over a base of characteristic `p`, with
`V∘F = p` and the duality between `F` and `V` for finite locally free groups.

### 7.2. Formal completion at the zero section

For an elliptic curve over a complete local ring `A`, construct the formal completion at the zero
section intrinsically as a one-dimensional smooth commutative formal group. Prove its compatibility
with the scheme group law and with complete local base change. After choosing a parameter—that is,
a trivialisation of the conormal line—construct an isomorphism of the completed local ring with
`A[[X]]`; prove that another parameter acts by a power series `X↦uX+⋯` with `u∈Aˣ`, and state all
coordinate formulae equivariantly under this change. In the chosen coordinate identify the
completed divisor `n[0]` with `(Xⁿ=0)`. Relate the formal `p`-series to Frobenius and Verschiebung.

### 7.3. Supersingular curves

**PD-4, supersingular Frobenius-kernel uniqueness.** Base: any field `k` of characteristic
`p`; hypothesis: `E₀/k` supersingular. Conclusions: each `E₀[pⁿ]` is local, and for every
`r` the unique finite closed subgroup scheme of `E₀` of order `p^r` is
`Ker(F^r : E₀ ⟶ E₀^{(p^r)})`; in particular `E₀[pⁿ] = Ker(F^{2n})`. This is the whole
input to KM 5.3.1 — Reg. 4A for the three problems, `𝒫(E₀/k)` a single element (KM p. 136)
— and to Rigid III's kernel identification (KM p. 139).

**PD-5, the two `p`-divisible groups.** Base: `k` algebraically closed of characteristic
`p`. If `E₀` is ordinary then `E₀[p^∞] ≅ μ_{p^∞} × ℚ_p/ℤ_p`; if `E₀` is supersingular then
`E₀[p^∞]` is connected, equal to the `p`-divisible group of the formal group `Ê₀`, and `Ê₀`
is the one-dimensional commutative formal group of height `2` over `k`, unique up to
isomorphism (Lazard's classification). This dichotomy is exactly the input KM use at p. 134:
up to `W(k)[[T]]`-isomorphism there are only two schemes `𝒫_{E/W(k)[[T]]}`.

**PD-6, existence and finiteness of supersingular points.** Base: `k` algebraically closed of
characteristic `p`. Conclusions: (a) the set of `j`-invariants of supersingular elliptic
curves over `k` is nonempty and finite, of size at most `max(1, (p−1)/2)`; (b) for a moduli
problem `δ` over `Ell/ℤ[1/M]` with `p ∤ M`, represented by a scheme `𝕄(δ)` smooth of relative
dimension one over `ℤ[1/M]`, such that every elliptic curve over `k` carries at least one and
at most finitely many `δ`-structures — the Legendre and naive level-three rigidifiers of Layer 3.5 —
the closed points of the fibre `𝕄(δ) ⊗ 𝔽_p` at which the universal curve is supersingular
form a nonempty finite set, and every open subset of the fibre containing one of them contains
an ordinary closed point, because a nonempty open subset of a scheme of pure dimension one of
finite type over `𝔽_p` has infinitely many closed points. This is the input that turns the
homogeneity dichotomy of ST-3 into a statement about the whole scheme, in Layers 8.3 and 8.4.
Route for (a) with `p ≥ 3`: every elliptic curve over `k` is isomorphic to a Legendre curve
`E_λ : y² = x(x−1)(x−λ)` with `λ ∈ k ∖ {0, 1}`, `j(E_λ) = 2⁸(λ² − λ + 1)³/(λ²(λ−1)²)`, and
each `j` arises from at most six values of `λ` (AEC III.1.7); `E_λ` is supersingular if and
only if `H_p(λ) = 0` for the Hasse polynomial `H_p(t) = Σ_{i=0}^{m} C(m,i)² tⁱ`, `m = (p−1)/2`,
which is the coefficient of `x^{p−1}` in `(x(x−1)(x−λ))^m` up to the sign `(−1)^m` (AEC V.4.1,
the Legendre-form criterion). `H_p` is monic of degree `m ≥ 1` with `H_p(0) = 1` and
`H_p(1) = C(2m, m) = C(p−1, m) ≡ (−1)^m (mod p)`, so it has a root in `k ∖ {0, 1}` and at most
`m` roots: a supersingular `j` exists and there are at most `m` of them. Route for (a) with
`p = 2`: a curve with `j ≠ 0` has a model `y² + xy = x³ + a₂x² + a₆` (AEC Appendix A, Prop.
A.1.1), on which `(0, √a₆)` is a point of order two since the partial derivative in `y` of the
equation is `x`, so `E[2](k) ≠ 0` and `E` is ordinary; a curve with `j = 0` has a model
`y² + a₃y = x³ + a₄x + a₆` with `a₃ ≠ 0`, whose partial derivative in `y` is the unit `a₃`, so
it has no point of order two, `E[2]` is connected, and `E` is supersingular: `j = 0` is the
unique supersingular invariant in characteristic `2`. Route for (b): the `k`-points of
`𝕄(δ)` above a given `j` are the pairs `(E, α)` with `j(E) = j` up to isomorphism, finitely
many because `E` is determined by `j` up to isomorphism over `k` and `δ(E/k)` is finite, and
the closed points of the fibre are the Galois orbits of the `𝔽̄_p`-points; the fibre is smooth
of dimension one over `𝔽_p`, so no closed point is isolated. *Needs:* Mathlib
`WeierstrassCurve.j`, Layer 1.3 (Weierstrass coordinates and variable changes), Layer 2.1
(`E[p]` and its rank), PD-2 (the dichotomy), Layer 3.5 (the two rigidifiers and the smoothness
of their schemes over `ℤ[1/M]`), and EllipticCurves §Layer 3 (the dichotomy over a field and
the Frobenius-trace criterion, which agree with PD-2's over an algebraically closed field).
Witnesses, which also pin the direction of the dichotomy: for `p = 3`, `H_3 = 1 + t` has the
single root `λ = −1`, giving `y² = x³ − x`, the curve EllipticCurves §Layer 3 certifies as
supersingular by its trace `a_3 = 0`, with `j = 1728 = 0` in `𝔽₃`; for `p = 5`,
`H_5 = t² − t + 1` has two roots, conjugate in `𝔽₂₅`, both with `j = 0`, so there is exactly one
supersingular `j`-invariant, and a count that reported the roots of `H_p` instead of the
`j`-invariants would give two; for `p = 7`, `H_7 = (t + 1)(t² + t + 1)` has three roots in
`𝔽₇`, all with `j = 1728 = 6`; for `p = 2`, `y² + y = x³` has three points over `𝔽₂`, so
`a_2 = 0` and it is supersingular, while `y² + xy = x³ + 1` has the point `(0, 1)` of order
two and is ordinary. On the rigidifier schemes: the fibre of `𝕄([Γ(3)])` over `𝔽̄₂` has
`|GL₂(𝔽₃)|/|Aut(y² + y = x³)| = 48/24 = 2` supersingular points, and the Legendre line over
`𝔽̄_p` has the roots of `H_p` as its supersingular points, `1`, `2` and `3` of them for
`p = 3, 5, 7`, in each case the quotient `12/|Aut E|` with `|Aut E| = 12, 6, 4`.

**Further sources.** DR VI 1.2 for the finiteness of the set of supersingular `j`-invariants over an
algebraically closed field, without the bound of PD-6; EGM (5.26) for the supersingular curve
`y² + y = x³` in characteristic `2`.

### 7.4. Universal deformations of elliptic curves

For an elliptic curve `E₀` over an algebraically closed field `k` of characteristic `p`, define the
category of complete local noetherian `W(k)`-algebras equipped with an identification of their
residue field with `k`. Define a deformation to be an elliptic curve over such an algebra together
with an identification of its special fibre with `E₀`, and retain isomorphisms as a groupoid.
Construct the universal marked deformation over `W(k)[[T]]`. Prove its universal property,
compatibility with rigidification, and comparison with the completed local ring of a representing
moduli scheme. In `Suggested.lean` the test objects are `ArtinianTestAlgebra`, a deformation is
`Deformation` (a curve over the test algebra with a cartesian identification of its special fibre
with `E₀`, placed in `Ell/W(k)` by `specialObj`), the universal family with its
universal property is `UniversalDeformation` (its object of `Ell/W(k)` being
`universalDeformationObj`), and its existence for every elliptic curve over an algebraically
closed field of characteristic `p` is `exists_universalDeformation`.

**Further sources.** DR III 1.2: an elliptic curve over a field, and likewise an `n`-gon with `n`
prime to the characteristic, has no infinitesimal automorphisms, and its deformation functor is
effectively pro-representable by a ring of power series in one variable; this is more general and
includes the effectivity that provides a curve over `W(k)[[T]]`. Oort, Theorem (2.2.1): the local
moduli functor of an abelian variety of dimension `g` is pro-representable by a ring of power series
in `g²` variables over the Witt vectors.

### 7.5. The Serre–Tate equivalence

Serre–Tate theory enters through the statements ST-1 to ST-5 and no others. Throughout, `k` is a
perfect field of characteristic `p` (algebraically closed at every point of use), `W(k)` its Witt
vectors, and the base category is that of artinian local `W(k)`-algebras with residue field `k`,
as in Layer 7.4. The first two statements involve no moduli problem and are stated here; ST-3 is
Layer 8.3, and ST-4 and ST-5 are Layer 8.6.

**ST-1, the Serre–Tate equivalence.** For `R` artinian local as above and `E₀/k`, the functor
`E/R ↦ E[p^∞]` is an equivalence from the groupoid of deformations of `E₀` over `R` to the
groupoid of deformations of `E₀[p^∞]` over `R`, functorially in `R` and compatibly with the
identifications of special fibres. KM invoke this by name and do not prove it (p. 134); the
proof source is Katz, *Serre–Tate local moduli*, Theorem 1.2.1 (§References).

**ST-2, the universal deformation of the `p`-divisible group.** For `E₀/k` supersingular, `k`
algebraically closed, and `E/W(k)[[T]]` the universal formal deformation of Layer 7.4: `E[p^∞]` over
`W(k)[[T]]` is the universal formal deformation of `E₀[p^∞]` (KM p. 134, via ST-1).

Record, as separate lemmas, the compatibility of ST-1 with connected–étale sequences and with the
ordinary/supersingular dichotomy of PD-5.

**Dependencies.** Layer 7.1 uses Layers 0.2, 1.4, and 2.1. Layer 7.2 uses Layers 0.1 and 1.4 and
the Frobenius of PD-3. Layer 7.3 uses Layers 7.1–7.2 and, for PD-6, Layers 1.3, 2.1, and 3.5 and
EllipticCurves §Layer 3. Layer 7.4 uses Layers 1.4 and 3.1. Layer 7.5 uses Layers 0.2, 7.1, 7.3,
and 7.4.

**Further sources.** Katz, Theorem 1.2.1, is stated for abelian schemes of every dimension, over a
ring in which `p` is nilpotent and for an arbitrary nilpotent ideal; ST-1 is the case of an elliptic
curve over an artinian local ring.

## Layer 8: the axiomatic theorems and regularity of `[Γ(N)]`, `[Γ₁(N)]`, and balanced `[Γ₁(N)]`

References: KM 5.1.1, 5.2.1, 5.2.2, 5.3.1–5.3.6, 5.4, 6.2.1, 7.5.1–7.5.3, and 7.6.1.

Layers 8.1–8.5 are about an arbitrary moduli problem, or morphism of moduli problems, satisfying a
list of axioms; no particular level structure enters. Layers 8.6–8.9 verify the regularity axioms
for the three problems of Layer 4.4 and for their standard quotients, and conclude. The axioms of
Layer 8.4 are verified in Layer 9.3, and the `[Γ₀(N)]` clause of the regularity theorem is
Layer 9.4.

### 8.1. The regularity axioms

For a fixed prime `p`, define the four axioms as statements about a moduli problem `𝒫` over
`Ell`:

1. **Reg. 1:** `𝒫` is relatively representable and finite over `Ell`.
2. **Reg. 2:** `𝒫⊗ℤ[1/p]` is finite étale over `Ell⊗ℤ[1/p]`.
3. **Reg. 3:** if `E` and `E'` are elliptic curves over the same scheme `S` and
   `E[p^∞]≅E'[p^∞]`, there exists an isomorphism between the finite `S`-schemes representing
   `𝒫_E` and `𝒫_{E'}`. This is an existence axiom, as in KM; it does not assert a canonical choice.
   In each application construct the comparison from the given isomorphism of `p`-divisible groups
   and prove the base-change property needed later.
4. **Reg. 4:** for every supersingular elliptic curve `E₀/k`, with `k` algebraically closed of
   characteristic `p`, and its universal formal deformation `𝔈/W(k)[[T]]`:
   - **Reg. 4A:** the set `𝒫(E₀/k)` has one element; no reducedness assertion about its
     representing scheme is included;
   - **Reg. 4B:** the consequently local finite `W(k)[[T]]`-scheme representing `𝒫_𝔈` is the spectrum of a
     two-dimensional regular local ring.

The definitions must include the displayed comparison isomorphisms and representing schemes; a
field saying only that the problem “depends on the `p`-divisible group” is not a formal contract.
`Suggested.lean` states the four axioms as `RegularityAxioms` on chosen
relative-representability data over `Ell/ℤ` (`intRing`, with `ofCurve` placing a curve over any
base in `Ell/ℤ`), Reg. 3 quantified over `PDivisibleGroupIso` and Reg. 4 over the universal
formal deformation `UniversalDeformation` of Layer 7.4.

State the Axiomatic Regularity Theorem (`axiomaticRegularity`): a moduli problem satisfying
these axioms is finite flat of constant rank at least one and regular of dimension two. Its
proof is Layer 8.3.

### 8.2. Local algebra and local schemes

Apply the strict-henselisation, completion, regularity, openness, support, miracle-flatness, and rank
theorems owned by Layer 0.9. For a geometric point of a rigidified finite moduli scheme, identify its
completed strict-henselian local ring with the ring prorepresenting the corresponding marked
deformation groupoid. Prove that this identification transports the universal family and the level
structure and is functorial under a change of rigidifier. This is the local-moduli comparison used
in the homogeneity and regularity arguments; it does not reconstruct the general local-scheme API.

### 8.3. Homogeneity and the proof of the Axiomatic Regularity Theorem

**ST-3, the two local models.** For any `𝒫` satisfying Reg. 3: up to `W(k)[[T]]`-isomorphism
the scheme `𝒫_{E/W(k)[[T]]}` depends only on whether `E₀` is ordinary or supersingular
(KM p. 134, from ST-1, ST-2, and PD-5). This is the content of the homogeneity properties
(H1)/(H2) in the proof of KM 5.2.1 (pp. 132–134): the open regular-and-flat locus contains
all supersingular characteristic-`p` points or none of them, and all ordinary ones or none.
Passing from this dichotomy to the whole scheme uses PD-6: the closed points of
`𝕄(δ) ⊗ 𝔽_p` over which the regular-and-flat locus fails form a closed set which, by the
dichotomy, consists of all the supersingular points or none of them and of all the ordinary
points or none of them; Reg. 4 excludes the supersingular points, and since these exist and are
finitely many on a fibre of pure dimension one, the ordinary locus is not closed and is
excluded as well.

Prove the Axiomatic Regularity Theorem of Layer 8.1 from the local comparison of Layer 8.2 and
ST-3, with PD-6 supplying the passage from the homogeneity dichotomy to the whole rigidifier
scheme as described.

### 8.4. The Axiomatic Isomorphism Theorem

Let `p` be prime and let `Φ : 𝒫₁ ⟶ 𝒫₂` be a morphism of moduli problems over `Ell`.
Construct the morphism-compatible Axiomatic Isomorphism Theorem used in KM 6.2.1:

1. both `𝒫₁` and `𝒫₂` satisfy Reg. 1 and Reg. 4A (Reg. 3 for both is supplied by hypothesis
   (4));
2. after inverting `p`, the morphism `Φ` is an isomorphism;
3. for every algebraically closed field `k` of characteristic `p`, every supersingular
   `E₀/k`, and the universal formal deformation `𝔈/W(k)[[T]]`, the induced morphism of finite
   `W(k)[[T]]`-schemes `(𝒫₁)_𝔈 ⟶ (𝒫₂)_𝔈` is an isomorphism;
4. the particular arrow `Φ` has simultaneous comparison data: for every scheme `S`, elliptic
   curves `E,E'/S` and supplied isomorphism `ξ:E[p^∞]≃E'[p^∞]`, construct isomorphisms of
   representing `S`-schemes `c_i:(𝒫_i)_E≃(𝒫_i)_{E'}` for `i=1,2` with
   `c₂ ∘ Φ_E = Φ_{E'} ∘ c₁`. Require compatibility of this square with the represented
   arbitrary-base-change identifications. Comparisons need not be unique or canonical; state
   the existence and compatible transport actually used in the proof. Objectwise Reg. 3 for
   `𝒫₁` and `𝒫₂` follows from this condition (take `c₁` and `c₂`) but does not imply it: it
   transports the two schemes, not the arrow between them. Keep Layer 8.1's objectwise axiom for its
   regularity theorem.

Then `Φ` is an isomorphism. Prove this by adjoining a common representable étale rigidifier,
regarding the two finite schemes as coherent algebras on the rigidifier scheme, and showing that
the kernel and cokernel of the induced algebra map vanish. Under the simultaneous comparisons,
prove that the algebra arrows are conjugate and their kernel/cokernel vanishing loci correspond;
in particular transport the isomorphism locus of `Φ`, not just its source and target schemes.
Construct the base-change and faithfully flat descent comparisons used in this argument; do not
assert that arbitrary nonflat pullback preserves a kernel. Then run the homogeneity argument of
Layer 8.3 (ST-3) on the conjugate arrows rather than on the two schemes, with the same inputs ST-1,
ST-2 and PD-5: the open isomorphism locus of `Φ` on the rigidifier scheme contains every closed
point of residue characteristic different from `p` by (2), every supersingular closed point by
(3) and the faithful flatness of the completed strict henselisation over the local ring, hence,
by PD-6 (the supersingular closed points of the characteristic-`p` fibre of the rigidifier scheme
form a nonempty finite set on a fibre of pure dimension one, so an open subset of the fibre
containing one of them contains an ordinary closed point), an ordinary closed point of the
characteristic-`p` fibre, hence by (4) applied to the universal formal deformations of two
ordinary curves (whose `p`-divisible groups ST-1 and PD-5 identify) every ordinary closed
point; an open set containing every closed point of a scheme of finite type over `ℤ` is the
whole scheme.

### 8.5. Axiomatic regularity of quotients

Include KM 7.5.1 in the following scope (`QuotientRegularityAxioms` and
`axiomaticRegularityOfQuotients`). Fix a prime `p`; let `𝒫` satisfy Reg. 1–Reg. 4, and let a
finite group `H` act on it. In addition to the regularity axioms, require:

1. **G1:** the action on `𝒫⊗ℤ[1/p]` is free, in the fixed scheme-theoretic reading of Layer 6.1, item 2:
   empty fixed loci for every `h≠1`, stated in `Suggested.lean` on nonempty test objects;
2. **G2:** every Reg. 3 comparison induced by an isomorphism of `p`-divisible groups is
   `H`-equivariant;
3. **G3:** for a supersingular universal deformation with `𝒫_𝔈=Spec A`, the algebra `A` is finite
   over `A^H` and is generated by `|H|` elements as an `A^H`-module.

Prove the invariant regular-local-ring lemma used by Katz–Mazur and deduce:

- `𝒫/H` is finite flat of positive constant rank and regular of dimension two;
- `𝒫⟶𝒫/H` is finite flat of degree `|H|` and is an étale `H`-torsor away from `p`;
- at a supersingular point the completed local ring of the quotient is `A^H`;
- quotient formation commutes with the universal formal-deformation base change.

No assertion is made that an arbitrary finite quotient of a regular moduli problem is regular.
The verification of G1–G3 for the standard quotient problems is Layer 8.9.

Make the invariant-ring input explicit. Prove KM 7.5.2 for a complete noetherian regular local
ring with perfect residue field when the group fixes all but one regular parameter and multiplies
the last by a unit. Prove Variant 7.5.3 for a product `H₁×⋯×H_n` acting diagonally on a regular
parameter system.

### 8.6. Deformation rings with level structure

**ST-4, pro-representability with level.** For `𝒫 ∈ {[Γ(pⁿ)], [Γ₁(pⁿ)], bal. [Γ₁(pⁿ)]}` and
`E₀/k` supersingular, `k` algebraically closed, write `𝒫_{E/W(k)[[T]]} = Spec A`; `A` is
local by Reg. 4A. The pullback `(ℰ/A, a)` of the universal deformation with its tautological
level structure pro-represents, on artinian local `W(k)`-algebras with residue field `k`, the
functor of triples `(E/R, α, i)` — a deformation of `E₀`, a `𝒫`-structure `α` on `E/R`, the
identification `i` of the special fibre carrying `α` to the unique element of `𝒫(E₀/k)`
(KM 5.3.2, proof, p. 137). This — not a general "Serre–Tate with level structure" — is the
form in which level structures enter the argument, one statement per problem.

**ST-5, the parameter criterion.** In the setting of ST-4: elements `f, g ∈ max(A)` generate
`max(A)` if and only if for every artinian local `W(k)`-algebra `R` with residue field `k`
and every `W(k)`-homomorphism `φ : A → R` with `φ(f) = φ(g) = 0`, the induced triple over
`R` is constant (KM 5.3.2, p. 137). This is the bridge across which the rigidity
statements of Layer 8.7 become "`max(A)` is generated by two elements", i.e. Reg. 4B bis (KM 5.2.2,
p. 135, which also proves Reg. 4B bis ⇔ Reg. 4B under Reg. 1–3 and 4A).

### 8.7. The three characteristic-`p` calculations

Formalise the rigidity engine and the three rigidity assertions with `p` prime and `n ≥ 1`
throughout (KM 5.3.2.1–5.3.2.3). The positive exponent is essential: at `n = 0`, the identity
subgroup has order one over any base and cannot force `p = 0`. In items 3–5, `k` is an
algebraically closed field of characteristic `p` and `R` an artinian local `W(k)`-algebra
with residue field `k`.

1. **The formal engine, KM 5.3.4 (pp. 140–141).** Base: an arbitrary ring `R`; `G(X,Y)` a
   one-parameter formal group law over `R` (commutativity is not a hypothesis: the calculation
   reads only the degree-`pⁿ` part of `G(X,Y) = X + Y + …`). Hypothesis: `X^{pⁿ} = 0` defines a
   subgroup scheme — universally, `G(X,Y)^{pⁿ} ∈ (X^{pⁿ}, Y^{pⁿ})` inside `R[[X,Y]]`.
   Conclusions: `p = 0` in `R`, and the subgroup is `Ker(Fⁿ)`. The isolated binomial-coefficient
   calculation: comparing total-degree-`pⁿ` terms gives `(X+Y)^{pⁿ} = X^{pⁿ}·A(0,0) + Y^{pⁿ}·B(0,0)`
   and comparing the `X^{pⁿ}`, `Y^{pⁿ}` coefficients gives `A(0,0) = B(0,0) = 1`, whence
   `(X+Y)^{pⁿ} = X^{pⁿ} + Y^{pⁿ}` in `R[[X,Y]]`, i.e. `C(pⁿ,i) = 0` in `R` for `0 < i < pⁿ`;
   `i = 1` gives `pⁿ = 0`, and `i = p^{n-1}` with `C(pⁿ, p^{n-1}) = p · (an integer prime to p)`
   gives `p = 0`. The ring-theoretic core is stated on Mathlib's `FormalGroup` carrier in
   `Suggested.lean` (`formalGroup_p_eq_zero_of_pow_mem_span`).
2. **The scheme engine, KM 5.3.3 (p. 140).** Base: an arbitrary ring `R`. Hypotheses: `C/R` a
   smooth commutative one-dimensional group scheme, `p` prime, `n ≥ 1`, and the zero section a
   point of exact order `pⁿ` — the Cartier divisor `pⁿ[0]` is a subgroup scheme. Conclusions:
   `p = 0` in `R`, and `pⁿ[0] = Ker(Fⁿ)`. The passage from the formal engine above: Zariski-
   locally on `R`, choose a formal parameter along the zero section (Layer 7.2).
3. **Rigid I, KM 5.3.2.1 (p. 138; proof 5.3.6, pp. 142–143).** Hypothesis: `E/R` admits `(0,0)`
   as a Drinfeld `pⁿ`-basis. Conclusions: `R` is a `k`-algebra and `E/R` is constant. Proof
   route to formalise: the basis gives `p^{2n}[0] = Ker(pⁿ)` as Cartier divisors; the engine at
   `p^{2n}` gives `p = 0` in `R` and `Ker(pⁿ) = Ker(F^{2n})`; the two exact sequences then give
   `E ≅ E^{(p^{2n})}`, iterated to `E ≅ E^{(p^{2nr})}`; and for `r ≫ 0` the curve `E^{(p^r)}`
   is constant, at the pin (`exists_iso_baseChange_iterateFrobenius`: for `r ≫ 0`, `E^{(p^r)}`
   is pointed-isomorphic over `R` to the base change of a curve over `k`, because in the
   artinian local `k`-algebra `R` the `p^r`-th power map factors through `k`).
4. **Rigid II, KM 5.3.2.2 (pp. 138–139; deduction 5.3.5, p. 141).** Hypothesis: the zero section
   of `E/R` is a point of exact order `pⁿ`. Conclusion: `R` is a `k`-algebra, i.e. `p = 0` in
   `R` — the scheme engine applied to `E/R` directly, and nothing more. **Constancy of `E/R` is
   not part of Rigid II**: for `[Γ₁(pⁿ)]` it is recovered separately from `p = 0` together with
   the vanishing of the second parameter `T` (KM p. 139), which is why the parameter pair for
   `[Γ₁(pⁿ)]` in the 5.4 table (p. 143) is `T, X(P)` and not two coordinates.
5. **Rigid III, KM 5.3.2.3 (p. 139; deduction 5.3.5 and diagram 5.3.5.1, pp. 141–142).**
   Hypothesis: `E, E'/R` joined by dual `pⁿ`-isogenies `π : E ⟶ E'` and `πᵗ : E' ⟶ E` whose
   kernels are cyclic and generated by their zero sections. Conclusions: `R` is a `k`-algebra,
   `E/R` is constant, and `Ker(π) = Ker(Fⁿ)`. Route: the engine gives `p = 0` and the kernel
   identification; constancy reduces to Rigid I via diagram 5.3.5.1, which exhibits `(0,0)` as
   a Drinfeld `pⁿ`-basis of `E/R` through KM 1.11.3.
6. **Assembly into Reg. 4 (KM 5.3.2 and 5.4, pp. 137, 143).** For each problem, the pair of
   elements of `max(A)` and the rigidity assertion showing they generate: `X(P), X(Q)` for
   `[Γ(pⁿ)]` by Rigid I; `T, X(P)` for `[Γ₁(pⁿ)]` by Rigid II plus the `T`-invariant; `X(P),
   X'(P')` for bal. `[Γ₁(pⁿ)]` by Rigid III, where `X, X'` are formal parameters (Layer 7.2) of `ℰ`
   and of its cyclic quotient `ℰ' = ℰ/K`. Via ST-5 each pair yields Reg. 4B bis, and with
   Reg. 4A (KM 5.3.1, from PD-4) this completes Reg. 4 for the three problems of Layer 4.4.

### 8.8. Verification of the axioms and assembly

Verify Reg. 1–Reg. 4 for each of the three problems at prime-power level. Use the `A`-structure
product theorems of Layer 0.8 to assemble coprime levels.

Conclude that `[Γ(N)]`, `[Γ₁(N)]`, and balanced `[Γ₁(N)]` are finite flat of constant positive
rank over `Ell/ℤ`, regular of dimension two, and finite étale after inverting `N`. For the pinned
`[Γ(N)]` and `[Γ₁(N)]` with their relative-representability data this is `firstMainTheorem_gamma`
and `firstMainTheorem_gammaOne` in `Suggested.lean`; the balanced problem has no carrier at the
pin.

**Further sources.** Conrad, Lemma 3.3.4 and Theorem 4.1.1(2), and Česnavičius, Theorem 4.3.5 and
Theorem 4.4.4, extend the regularity to the compactified stacks over `ℤ`, cusps included, and Conrad
to mixed level; on the locus of elliptic curves both take the theorem of this section from KM 5.1.1
and do not reprove it. Scholze, Theorem 6.2, states the case of level `pⁿ` with an auxiliary level
prime to `p`.

### 8.9. Regular quotients at prime-power level

Verify G1–G3 of Layer 8.5 for the standard quotient problems at prime-power level, and prove
KM 7.6.1:

- for `p^n`, the quotients of `[Γ(p^n)]` by subgroups of the semi-Borel or by product
  subgroups `H₁×H₂` of the diagonal Cartan are regular of dimension two and finite flat
  over `Ell`; the projections from `[Γ(p^n)]` to those quotients are finite flat;
- for subgroups `G,H⊆(ℤ/p^nℤ)ˣ`, the quotients of balanced `[Γ₁(p^n)]` by `G×H` and of
  `[Γ₁(p^n)]` by `G` are regular of dimension two and finite flat over `Ell`, and the
  projections from the source problems to their quotients are finite flat. The direction
  is source to quotient; no morphism from a quotient back to its source is asserted.

**Dependencies.** Layer 8.1 uses Layers 3.1, 3.6, 7.1, and 7.4. Layer 8.2 uses Layers 0.9, 3.1,
3.5, and 7.4. Layer 8.3 uses Layers 0.9, 3.5–3.6, 7.3, 7.5, 8.1, and 8.2. Layer 8.4 uses Layers
0.5, 0.9, 3.5, 7.3–7.5, and 8.1–8.3. Layer 8.5 uses Layers 0.9, 6.1, 7.1, and 8.1–8.3. Layer 8.6
uses Layers 4.4, 7.3, 7.4, and 8.1. Layer 8.7 uses Layers 0.1, 0.8, 2.1–2.2, 2.4, 4.1–4.2,
7.1–7.3, 8.1, and 8.6. Layer 8.8 uses Layers 0.8, 4.3–4.4, 7.1, 8.1, 8.3, and 8.7. Layer 8.9 uses
Layers 6.1–6.2, 8.5, and 8.7–8.8. No section uses the curves of Layers 5 and 10 directly;
Layer 8.9 reaches Layer 5.2 only through the identifications of Layer 6.2.

**Further sources.** Česnavičius, Theorem 4.5.1, obtains the regularity of a stack of level `H` by a
different route: from a proper flat surjection from the compactified stack of full level, in place
of rings of invariants.

## Layer 9: `[N-Isog]`, cyclicity, and `[Γ₀(N)]`

References: KM 6.1.1, §6.3–§6.6, and the Notes Added in Proof; KM 7.4.2 for the integral quotient
identifications.

### 9.1. The problem `[N-Isog]` and its finiteness

Apply Layer 0.7 to `E[N]` and define `[N-Isog]`, the parameter scheme and moduli problem of all
rank-`N` subgroup schemes of `E[N]`, equivalently all degree-`N` quotient isogenies. Prove relative
representability by a projective, finitely presented scheme over the base. A closed subscheme of a
relative Grassmannian is not finite merely for that reason: finiteness of this elliptic
specialisation is KM 6.5.1, proved next. The cyclic locus and the relative representability of
`[Γ₀(N)]` are Layer 9.4.

Prove KM 6.5.1: the projective relatively representing scheme just constructed is finite over
`Ell`. Reduce to quasi-finiteness and compute the geometric fibres prime-power by prime-power:

1. when the residue characteristic does not divide `N`, count subgroup schemes in the constant
   group `(ℤ/Nℤ)²`;
2. for a supersingular `p`-power fibre, prove that the unique rank-`pⁿ` subgroup of `E[pⁿ]` is
   `ker(Fⁿ)`;
3. for an ordinary `p`-power fibre, identify
   `E[pⁿ]≅μ_{pⁿ}×(ℤ/pⁿℤ)` and prove that the rank-`pⁿ` subgroups are exactly
   `μ_{pᵃ}×p^(n-b)(ℤ/pⁿℤ)` with `a+b=n`.

Assemble coprime levels using Layer 0.8, prove that every geometric fibre is finite, and apply
projective plus quasi-finite implies finite. Do not infer this from the Grassmannian construction:
finite flat group schemes can have positive-dimensional families of subgroup schemes.

**Further sources.** Česnavičius, Proposition 4.2.15(b): the finite locally free subgroups of rank
`n` of an elliptic curve are parametrised by a scheme finite locally free over the base, of rank the
number of subgroups of order `n` of `(ℤ/nℤ)²`, and étale where `n` is invertible. This is the
statement of KM 6.8.1, stronger than the finiteness proved here, and it is stated there for
generalized elliptic curves.

### 9.2. Generator schemes and the cyclicity theorem

For a finite locally free commutative group scheme `G` of rank `N`, specialise the `A`-generator
locus of Layer 0.8 to `A=ℤ/Nℤ` and denote it by `Gˣ`. Prove that it is a closed finite scheme of
finite presentation over the base and commutes with arbitrary base change.

The difficult equivalence of KM 6.1.1 is stated only in its actual generality. If `E/S` is an
elliptic curve and `G⊆E[N]` is a finite locally free subgroup scheme of rank `N`, then

```text
G is cyclic ⇔ Gˣ is finite locally free of rank φ(N).
```

The construction of `Gˣ` is general; the displayed equivalence is not asserted for an arbitrary
finite flat group scheme. For a Drinfeld generator `P` of an elliptic subgroup, Layer 9.3 also proves the
Cartier-divisor equality

```text
Gˣ = ∑_{a∈(ℤ/Nℤ)ˣ} [aP].
```

Both that equality and the hard implication in the displayed equivalence are completed in Layer 9.3.

**Further sources.** Conrad, Theorem 2.3.7, and Česnavičius, Proposition 4.2.7(a) and (b): the same
criterion for subgroups of the smooth locus of a generalized elliptic curve, with the additions that
cyclicity may be tested fpqc-locally and that the scheme of generators is étale where the order is
invertible. Both reduce to KM 6.1.1 for elliptic curves.

### 9.3. The cyclicity theorem at prime-power level

This section instantiates the Axiomatic Isomorphism Theorem of Layer 8.4 at prime-power level and
deduces the cyclicity theorem stated in Layer 9.2.

**The two moduli problems compared (KM 6.1, p. 155).** For `N = pⁿ`, both problems refine
`[Γ₁(pⁿ)]`-with-subgroup data: `𝒫₁(E/S)` is the set of triples `(P, G, Q)` with `P` a Drinfeld
generator of a cyclic rank-`N` subgroup `G ⊆ E[N]` and `Q` a section of the **primitive part**
`D ⊆ G` — the unique finite locally free subscheme of rank `φ(N)` of which the sections `{aP}`,
`(a,N)=1`, are a full set; `𝒫₂(E/S)` asks instead `Q ∈ Gˣ(S)`, a generator (Layer 9.2). Since `D ⊆ Gˣ`,
there is a forgetful morphism `𝒫₁ ⟶ 𝒫₂`, and the cyclicity theorem is the statement `D = Gˣ`,
i.e. that this morphism is an isomorphism. Verify hypotheses (1), (2), and (4) of the
Axiomatic Isomorphism Theorem for this pair. Reg. 1 uses finiteness over `[Γ₁(pⁿ)]`, Reg. 4A
uses PD-4, and the generic isomorphism uses the étale theory (KM 6.3.1, pp. 156–157).
For the arrow comparison (4), which supplies Reg. 3 for both problems, use the induced
group-scheme isomorphism `ξ_n:E[pⁿ]≃E'[pⁿ]` from `ξ`. Transport the triple by
`(P,G,Q)↦(ξ_n(P),ξ_n(G),ξ_n(Q))`. Prove that this transports subgroup inclusion and
Drinfeld generator/full-set conditions. The characterized primitive subscheme of `G` is
carried to the primitive subscheme of `ξ_n(G)` by its full-set characterization and uniqueness;
the generator scheme `Gˣ` is carried to `(ξ_n(G))ˣ` by the generator functor. Construct the
induced isomorphisms of both representing schemes, with inverse induced by `ξ_n⁻¹`, and prove
that they commute with arbitrary base change. Show the square for the actual inclusion
`D↪Gˣ` commutes before invoking the isomorphism theorem; do not assume `D=Gˣ` to construct
these comparisons. The remaining condition (3), the supersingular local isomorphism, is the
following calculation.

**The rings of §6.3, each an explicit target (KM 6.3.2, pp. 157–158).** Fix an algebraically
closed `k` of characteristic `p`, a supersingular `E₀/k`, the universal formal deformation
`𝔈/W(k)[[T]]`, and a formal parameter `X` (Layer 7.2) for the formal group `Ê`; write
`[a](X) ∈ W(k)[[T]][[X]]` for multiplication by `a` on `Ê`.

1. `A := W(k)[[T,P]]/I`, where `I` is generated by the equations expressing that the rank-`pⁿ`
   finite free closed subscheme of `Ê` over `W(k)[[T,P]]` cut out by `∏_{1≤a≤pⁿ}(X−[a](P)) = 0`
   is a subgroup scheme. Prove that `Spec A` is `[Γ₁(pⁿ)]_𝔈`, that `A` is a regular
   two-dimensional local ring with regular parameter system `(T,P)`, and that `A` is finite flat
   over `W(k)[[T]]` — inputs: the First Main Theorem and the KM 5.4 parameter table (p. 158).
2. `A₁ := A[[Q]]/J`, `J` the **principal** ideal generated by `∏_{b mod pⁿ, (b,p)=1}(Q−[b](P))`
   — this is `(𝒫₁)_𝔈`, the coordinate `Q` running over `D`.
3. `A₂ := A[[Q]]/K`, `K` the ideal expressing that in `A[[Q]][[X]]` the monic polynomials
   `∏_{1≤a≤pⁿ}(X−[a](Q))` and `∏_{a mod pⁿ}(X−[a](P))` are equal — this is `(𝒫₂)_𝔈`, the
   coordinate `Q` running over `Gˣ`.
4. The comparison map is the `A`-algebra map `A₂ ⟶ A₁` induced by `D ⊆ Gˣ`; it is
   **surjective** because `D ↪ Gˣ` is a closed immersion, and the target statement of the whole
   section is `Ker(A₂ ⟶ A₁) = 0`, the isomorphism `A₂ ≅ A₁` (KM pp. 158–159).

**The proof, as separate named lemmas (KM 6.3.3–6.3.6, pp. 159–162).**

5. *Weierstrass preparation, the form used:* the presentation of `A₁` descends from `A[[Q]]` to
   the polynomial ring — `A₁ = A[Q]/(∏_{(b,p)=1}(Q−[b](P)))` — so `A₁` is a free `A`-module
   with basis `1, Q, …, Q^{φ(pⁿ)−1}` (proof of KM 6.3.4, p. 159).
6. *Injectivity of multiplication by `Q` on `A₁`* (KM 6.3.4, pp. 159–160):
   `det_A(Q·∣A₁) = ± ∏_{(b,p)=1} [b](P)`, and this is nonzero in the domain `A` because the
   modular `(ℤ/pⁿℤ)ˣ`-action sends `P ↦ [b](P)`, so each factor is an automorphism-transform
   of the regular parameter `P` and in particular nonzero.
7. *Nakayama and the snake lemma* (KM 6.3.2–6.3.3, pp. 158–159): `Ker := Ker(A₂ ⟶ A₁)` is a
   finite `A[[Q]]`-module, so `Ker = 0 ⟺ Ker/Q·Ker = 0`; the snake lemma applied to
   multiplication by `Q` on `0 → Ker → A₂ → A₁ → 0`, with item 6 supplying injectivity on
   `A₁`, gives the exact sequence `0 → Ker/QKer → A₂/QA₂ → A₁/QA₁ → 0`.
8. *The two quotient rings compared* (KM 6.3.5, pp. 160–161): `A₂/QA₂ = A/K̲` with `K̲`
   generated by the coefficients of `X^{pⁿ} − ∏_{a mod pⁿ}(X−[a](P))`, and `A₁/QA₁ = A/h̲`
   with `h̲` the principal ideal generated by `∏_{(b,pⁿ)=1}[b](P)`. The inclusion `K̲ ⊆ h̲` is
   the existence of the map; the reverse inclusion identifies the coefficient of degree
   `pⁿ−φ(pⁿ)` in `X^{pⁿ} − ∏(X−[a](P))` — a sum of `φ(pⁿ)`-fold products of the `[a](P)` —
   with `∏_{(b,p)=1}[b](P)` up to a unit of `A`, via item 9.
9. *The unit/maximal-ideal calculation* (KM 6.3.6, pp. 161–162): from
   `[a](X) = X·(a + O(X))`, substituting the maximal-ideal element `P`:
   `[a](P) = P × (unit of A)` when `(a,p) = 1`, and `[a](P) = P × (element of max A)` when
   `p ∣ a`; hence both quantities of item 8 equal `(unit of A) × P^{φ(pⁿ)}`.
10. Conclude `K̲ = h̲`, so `Ker/QKer = 0`, so `Ker = 0` and `A₂ ≅ A₁` — condition (3) of the
    Axiomatic Isomorphism Theorem — and with it KM 6.1.1 (p. 162).

Apply the Axiomatic Isomorphism Theorem so instantiated to prove the primitive-divisor equality
`Gˣ = ∑_{(a,N)=1}[aP]` and the hard implication in the cyclicity theorem of Layer 9.2; derive the
reverse implication from the fppf cover by generators. This use of the First Main Theorem for
`[Γ₁(pⁿ)]` — `A` regular with parameters `(T,P)` and the table of KM 5.4, quoted at items 1 and
6 — is why the cyclicity theorem comes after Layers 8.6–8.8.

### 9.4. The cyclicity locus and `[Γ₀(N)]`

Prove KM 6.6.1 through the following chain.

1. Use Layer 9.1 to make `[N-Isog]` a finite relatively representable problem.
2. For the coherent algebra of `Gˣ`, prove the fibre dichotomy of KM 6.4.2: its dimension is
   `φ(N)` on cyclic fibres and zero otherwise. Construct the closed flattening/rank locus of
   KM 6.4.3 and use it to obtain KM 6.4.1's universal closed cyclicity locus, with arbitrary base
   change.
3. Identify this locus with `[Γ₀(N)]`; deduce relative representability and finiteness.
4. Identify the natural map `[Γ₁(N)]⟶[Γ₀(N)]` with the generator scheme of the universal cyclic
   subgroup.
5. Prove that this map is finite locally free and surjective of rank `φ(N)`.
6. Use Layer 8.8 to know that `[Γ₁(N)]` is regular of dimension two, and prove the Notes Added in
   Proof descent theorem which passes regularity to `[Γ₀(N)]` along this finite flat surjection.
7. Deduce that `[Γ₀(N)]` is finite flat over `Ell`. Compute its rank after inverting `N` and use
   finite-flat constancy to obtain
   `deg [Γ₀(N)] = (N²/φ(N)) ∏_{p∣N}(1 − 1/p²) = N ∏_{p∣N}(1 + 1/p)`.

   Prove finite étaleness after inverting `N` by descent from the naive full-level cover.

This completes the fourth clause of the First Main Theorem: `exists_relRepData_gammaZero` in
`Suggested.lean`, relative-representability data for the pinned `gammaZero` over `ℤ` that are
finite, flat, of constant positive rank and regular of dimension two. KM §6.8's stronger theorem
that the whole `[N-Isog]`-problem is finite flat requires an additional lifting theorem for
homomorphisms and is outside this roadmap's endpoint; only its finiteness from Layer 9.1 is used here.

**Further sources.** Česnavičius, Proposition 4.2.7(c): the cyclicity locus is a closed subscheme of
finite presentation, for generalized elliptic curves. Conrad, Lemma 4.2.3(4), is the finite flat
morphism from the stack of `Γ₁(N)`-structures to that of `Γ₀(N)`-structures, and Conrad, Lemma
3.3.4, proves the regularity of the mixed problem `Γ₁(N;n)` on elliptic curves, which for `N = 1` is
`Γ₀(n)`, by descent of regularity along a finite locally free covering, the route of this section.
Česnavičius, Theorem 5.13, proves the regularity of the compactified stack `X₀(n)` over `ℤ`.

### 9.5. The standard quotient identifications over `ℤ`

Prove the seven identifications of Layer 6.2 over `ℤ`. After adjoining an arbitrary representable
étale rigidifier, prove that source and target are finite normal schemes over the rigidifier and
are the normalisation in the same finite étale algebra over the generic open, where the
identification is that of Layer 6.2. Invoke a separately proved uniqueness theorem for
normalisation to obtain the integral isomorphism. A comparison on field-valued points is not a
proof in residue characteristic dividing `N`. Normality of the problems involved is supplied by
the regularity theorems of Layers 8.8 and 9.4.

**Further sources.** Česnavičius, Proposition 6.3, with Theorem 4.4.4 and Theorem 5.13, gives the
identifications for `Γ₁(n)` and `Γ₀(n)` over `ℤ` in the language of stacks, cusps included: the
stacks are the normalisations of the level-one stack, and the quotient problems are their loci of
elliptic curves.

### 9.6. The coarse Borel formula for `Y₀(N)`

For `N≥3`, prove the coarse Borel-quotient formula through the explicit chain

```text
M([Γ₀(N)])⊗ℤ[1/N]
  ≅ M([Γ₀(N)]⊗ℤ[1/N])
  ≅ M(([Γ(N)]/B)⊗ℤ[1/N])
  ≅ M([Γ(N)]⊗ℤ[1/N])/B
  ≅ Y_full(N)/B.
```

The four isomorphisms use, respectively, flat coarse base change, KM 7.4.2(4), coarse-quotient
compatibility, and representability of full level. Prove the resulting coarse universal property.
Do not use the formula for `N=1,2`, and do not assert an integral Borel quotient of the fine scheme.

**Dependencies.** Layer 9.1 uses Layers 0.7, 0.8, 2.1, 3.1, 7.1, and 7.3. Layer 9.2 uses Layers
0.2, 0.8, and 4.1. Layer 9.3 uses Layers 0.8, 4.1, 4.3, 7.1–7.3, 8.4, 8.6–8.8, and 9.2. Layer
9.4 uses Layers 0.9, 3.2, 3.6, 4.2–4.4, 8.8, and 9.1–9.3. Layer 9.5 uses Layers 3.5, 6.1–6.2,
8.8, and 9.4. Layer 9.6 uses Layers 4.3, 5.2, 6.2–6.3, and 9.4.

**Further sources.** Česnavičius, Lemma 6.2, and DR IV 3.10(iii): the coarse space of level `H` is
the quotient of the coarse space of full level by the image of `H`, for every `H` and with the
cusps.

## Layer 10: compactified coarse curves over `ℤ[1/N]`, cusps, and the Shimura covering

References: KM 8.6 (cusps by normalisation near infinity; compactified coarse moduli schemes),
KM 8.11 (computation of the cusps via the Tate parameter), KM 10.5–10.9 — 10.6 for cusp-labels,
10.8–10.9 for structure near infinity and the basic moduli problems; Mazur, *Modular curves and the Eisenstein ideal*, II §1–§2.

**Further sources.** DR IV 3.3 defines the compactified moduli stack of level `H` by normalisation.
DR IV 3.4 proves that it is proper over `ℤ` and smooth over `ℤ[1/n]` with finite étale boundary, DR
IV 3.10 that its coarse space is proper and flat over `ℤ` and is the normalisation of the projective
`j`-line, and DR IV 6.7 gives the description by moduli of generalized elliptic curves over
`ℤ[1/n]`. Česnavičius, Proposition 6.4, proves for every level and every `H` that the coarse curve
`X_H` is smooth over `ℤ[1/n]` and that its formation commutes with base change over `ℤ[1/n]`, which
is more general than the fibre statements of this layer. Conrad and Česnavičius take as cusps the
locus of degenerate curves in the moduli stack and prove that it is a reduced relative effective
Cartier divisor over `ℤ` (Conrad, Theorem 4.1.1(1) and Lemma 4.3.2; Česnavičius, Theorem 4.6.4(c)
and Theorem 5.13(b)); Conrad, Theorem 4.3.4, describes it for `Γ₁(N)`. The divisor `Cusps_H` of this
layer is the scheme-theoretic fibre over infinity, and the two agree only after reduction, so a
citation must say which is meant. Stacks Project, Tag 00R4, is the flatness criterion for a local
homomorphism from a regular to a Cohen–Macaulay local ring which is used for the Shimura covering.


This layer exists for a named consumer. Mazur's Eisenstein-ideal paper is the canonical arithmetic
application of `X₀(N)`, and its Chapter II opens with a list of geometric inputs; this layer
records the intended constructions for the members of that list which are coarse-curve geometry
away from the level, and §The Mazur interface below identifies the remaining suppliers. **The
consumer is Mazur Ch. II §§1–2 — the curve geometry — and nothing more.** Mazur's torsion theorem
and the Eisenstein-ideal arithmetic are *not* targets of this roadmap, and no layer below claims
an interface to them; see the boundary paragraph of §The Mazur interface. The method is that of
KM 8.6: the compactification is by **normalisation of the coarse `j`-line**, so no generalized
elliptic curves, no stacks, and no boundary moduli interpretation are introduced.

**The class quantified over, fixed once.** In this layer **the standard problems** are the
diamond-operator quotients of `[Γ₁(N)]` and nothing else: for `N ≥ 5` **prime** and a subgroup
`H ≤ Δ := (ℤ/Nℤ)ˣ/{±1}`, the coarse scheme `Y_H := Y₁(N)/H` over `ℤ[1/N]` (Layers 6.3–6.4 applied to
the Layer 6.2 quotient data), including the two ends `Y₁(N)` (`H = 1`, a fine scheme for `N ≥ 5`) and
`Y₀(N)` (`H = Δ`). The coarse `j`-line `Y(1) = 𝔸¹_j` of Layer 6.5 is the auxiliary target,
not an additional member indexed by `H`; the rank and cusp-count formulae below apply only
to the diamond quotients. Every unqualified `Y_H`, `X_H`, `Cusps_H` in this layer quantifies
over exactly this class — not the
seven identifications of Layer 6.2 as a list, and not arbitrary finite quotients of Layer 6, for which
none of the assertions below is made. `N ≥ 5` prime is a standing hypothesis of the whole layer:
items 3 and 4 use Mazur's normalisation `n = num((N−1)/12)` and his Table 1, which are stated
for prime level, and no composite-level assertion is made here. Per-item hypotheses beyond
membership: the smoothness, cusp, Cartier-divisor, and geometric-fibre base-change milestones of
items 1–2 are asserted for **every** member of the class; item 3 concerns the two ends
(`X₁(N) → X₀(N)`); item 4 takes `H` the unique subgroup of `Δ` of order `gcd(N−1, 12)/2`.

1. **The compactified coarse curve.** For a standard problem of this layer — the class fixed
   above — with coarse scheme `Y_H/ℤ[1/N]` and its `j`-map to the coarse `j`-line `𝔸¹_j`
   (KM 8.2.2, Layer 6.5), define
   `X_H` as the normalisation of `ℙ¹_j` over `ℤ[1/N]` in `Y_H`, **using Mathlib's existing
   relative-normalisation carrier**: `Scheme.Hom.normalization` with `toNormalization`,
   `fromNormalization`, `normalizationDesc` and the universal property
   `normalization.hom_ext` are already at the pin, in Mathlib's
   `AlgebraicGeometry/Normalization.lean` — so the generic definition exists the moment the morphism
   `Y_H ⟶ ℙ¹_j` does. What is genuinely missing is the modular-curve work, and those are the
   milestones: `fromNormalization` is **finite** in this situation; the restriction of `X_H`
   over `𝔸¹_j` is identified with `Y_H`; `X_H` is a smooth proper relative curve over `ℤ[1/N]` —
   smooth on the interior `Y_H` by Layer 6.4's quotient-smoothness theorem (KM, Notes Added in
   Proof) applied to `Y₁(N)` with its diamond action, and smooth along the boundary by item 2's
   formal-cusp calculation, **two separate inputs**, the first of which is a theorem consumed
   from Layer 6.4 and not a consequence of regularity and flatness — with,
   as everywhere in this roadmap, **no** connectedness or irreducibility assertion (§Scope, and
   the fixed-pairing warning of Layer 5.2 stands); and `Y_H ⊆ X_H` is the open complement of the
   fibre over `j = ∞`. **The uniqueness statement is the literal universal property of
   normalisation — `normalizationDesc` and `normalization.hom_ext` — and nothing stronger**:
   every integral factorisation of `Y_H ⟶ ℙ¹_j` receives a unique morphism *from* `X_H`. It is
   **not** the case that every normal scheme finite over `ℙ¹_j` extending the `j`-map is
   isomorphic to `X_H` (adjoin a disjoint spare `ℙ¹_j`: still normal, still finite, still
   factors the `j`-map). If an isomorphism characterisation is wanted, it needs all three of:
   `T → ℙ¹_j` finite with `T` normal; `Y_H → T` an open immersion with schematically dense
   image; and every irreducible component of `T` meeting `Y_H`. Nor is `X_H` unique as "the
   normal proper model with that open part" — over the relative base `X_H` is a surface, and
   blowing up a closed point of the boundary gives a second normal proper model with the same
   open part. **Base change is two separate statements, not bookkeeping**: normalisation
   does not commute with arbitrary base change. For the qcqs open immersion
   `D(t) ↪ Spec k[t]`, the relative normalisation is `Spec k[t]`, since `k[t]` is integrally
   closed in `k[t,t⁻¹]`. On base change to `t = 0`, the original source is empty: its relative
   normalisation is empty, whereas the base change of the previous normalisation is `Spec k`.
   Thus the comparison is `∅ ⟶ Spec k`, not an isomorphism. The integral extension
   `k[t] ⊆ k[x]`, `t = x²`, is not a counterexample for relative normalisation: before and
   after base change its relative normalisation is the source, even when that source is
   nonreduced. (i) **Smooth base change is already supplied**: Mathlib's comparison morphism
   `normalizationPullback` is an isomorphism for smooth `g`, an instance at the pin. (ii) The
   stronger statement this roadmap needs is exactly one theorem, stated now and **in Mathlib's
   direction**: **geometric-fibre base change** — for every algebraically closed field `k` with
   `char k ∤ N`, the canonical comparison
   `Norm_{ℙ¹_k}(Y_H ×_{ℤ[1/N]} k) ⟶ X_H ×_{ℤ[1/N]} k` (the arrow `normalizationPullback`
   produces: normalisation of the base change *to* base change of the normalisation) is an
   isomorphism, compatibly with the open immersion of `Y_{H,k}`, with the cusp subscheme of
   item 2, with the compactified `X₁(N) → X₀(N)` morphism of item 3, and with the group action
   defining the inertia there. The displayed inverse `X_{H,k} ≅ Norm_{ℙ¹_k}(Y_{H,k})` is a
   corollary, not the canonical map. Passing to a residue characteristic is not smooth, so
   (i) does not give this, and item 3's fibrewise table stands on (ii). **Order matters, and
   this theorem comes last**: its proof consumes item 2's formal-cusp package, so the internal
   order of items 1–2 is — define `X_H`; prove `fromNormalization` finite and identify
   the restriction over `𝔸¹_j` with `Y_H`; carry out the formal-cusp calculation; deduce that
   `Cusps_H` is a relative effective Cartier divisor, that `X_H` is smooth along the boundary,
   and hence that `Y_{H,k}` stays schematically dense in every geometric fibre; bring in the
   interior smoothness of `Y_H` — Layer 6.4's quotient-smoothness theorem (KM, Notes Added in
   Proof) applied to `Y₁(N)` with its diamond action — which together with the boundary
   smoothness just proved makes all of `X_H` smooth over `ℤ[1/N]`; only then prove
   this comparison, in four explicit steps: the comparison is the identity over the
   schematically dense open `Y_{H,k}`; it is finite; both schemes are normal, with every
   component meeting that open; and the resulting finite birational map is an isomorphism
   component by component. The normality of the source uses normality of `Y_{H,k}` — the base
   change of the interior smoothness — and the relative integral-closure construction; that of
   the target uses the smoothness of `X_H` assembled in the previous step. Do not
   apply a finite-birational criterion to an arbitrary nonreduced source or one with extra
   components. The density statement also needs its relative hypothesis: because the cusp
   divisor is Cartier and flat over the base, its local nonzerodivisor equations remain
   nonzerodivisors after base change. Mere schematic dominance of an open immersion does
   not imply density in every geometric fibre, as `D(t) ↪ Spec k[t]` shows. "The universal
   property applies" produces the morphism — these four steps are what make it an isomorphism.
   No base-change statement for more general `R → R'` is promised — KM 8.5's
   coarse-moduli base change and base change of normalisation are different assertions, and
   hypotheses sufficient for the first are not automatically sufficient for the second.
2. **The cusp locus as a closed subscheme, and the formal-cusp package.** Define
   `Cusps_H := X_H ×_{ℙ¹_j} {∞}`, the scheme-theoretic fibre — not "finitely many points".
   Milestones: `Cusps_H` is finite locally free over `ℤ[1/N]`, of rank
   `deg j = (N² − 1)/(2·|H|)` (`N + 1` for `Γ₀(N)`) — **it is not reduced, hence not étale**:
   a finite flat map pulls the Cartier point `∞` back to each cusp with multiplicity its
   ramification index, and the index of `j` at a cusp is the cusp's width, `1` or `N` for prime
   `N` (for `Γ₀(N)` the fibre is `[∞] + N·[0]`, which is the index computation below). The
   étale statement is about the **reduced** cusp locus — Katz–Mazur's *scheme of cusps*, whose
   definition takes the reduction (KM 8.6.3.2): `(Cusps_H)_red` is finite étale over `ℤ[1/N]` of
   rank `(N − 1)/|H|`, `m_H := (N − 1)/(2|H|)` geometric cusps of each width, for every standard
   problem of this layer (the class fixed above, `N ≥ 5` prime);
   **`Cusps_H` is a relative effective Cartier divisor in `X_H`**, and `X_H` is smooth along it
   — finite étaleness alone does not record what the formal-completion and schematic-density
   arguments need, and this is the statement item 1's geometric-fibre comparison stands on
   (from the formal parameters, equivalently from the cusp sections being codimension-one
   regular immersions in a smooth relative curve);
   for `[Γ₀(N)]` with `N` prime, the splitting
   `D₀ := (Cusps₀(N))_red ≅ Spec ℤ[1/N] ⊔ Spec ℤ[1/N]`, giving the two disjoint cusp
   sections `0` and `∞`. It is this finite étale cusp model and its two sections that commute
   with arbitrary base change. The full scheme-theoretic fibre is the effective Cartier
   divisor `Cusps₀(N) = [∞] + N[0]`, not a disjoint union of two reduced sections. After a
   nonreduced base change `T`, write `D₀ × T` for the base-changed cusp model; do not
   identify it with the absolute reduction of `Cusps₀(N) × T`, since reduction does not
   commute with arbitrary base change; the coarse `j`-map has
   ramification index `1` along `∞` and `N` along `0`, computed from the Tate parameter — 
   Mazur states the un/ramifiedness for the **stack** morphism `ℳ₀(N) → ℳ(1)`; what this
   roadmap states and proves is the coarse-index computation, and no stack-to-coarse comparison
   is claimed; and the extension of the Atkin–Lehner involution `w_N` from `Y₀(N)` (the map
   `(E, C) ↦ (E/C, E[N]/C)` on the naive `[Γ₀(N)]`-structures of Layer 3.2, defined by the
   quotient isogeny of Layer 2.2) to `X₀(N)`, **a separate normalisation-functoriality theorem** —
   `w_N` does not lie over `ℙ¹_j`, so this is not automatic. Put `j' = j ∘ w_N` on `Y₀(N)`.
   Use the formal Tate parameters at both cusps to extend `j'` to a morphism `X₀(N) ⟶ ℙ¹_j`:
   at a pole extend its reciprocal in the infinity chart, and justify passage from completed
   local rings by faithful flatness. Prove this extension is finite, using properness and
   quasi-finiteness on every geometric fibre. Normality and the dense affine open then
   identify `X₀(N)` also as the relative normalisation for `(Y₀(N),j')`. Now `w_N` is an
   isomorphism from this source `j'`-map to the original `j`-map, so normalisation functoriality
   extends it. Prove the involution identity by uniqueness and compute that it interchanges
   the two reduced cusp sections. These are separate milestones, not consequences of the
   universal property over a fixed `j`-line. The computational engine is the **formal-cusp package of KM
   8.7–8.11 and 10.8, built here as its own milestone**: the groups `T[N]` and the Tate curve
   over `ℤ[1/N]((q))` with its subgroup schemes and `[Γ₀(N)]`-structures, the integral closure
   of the `q`-adic local ring in the corresponding level cover, and the resulting formal
   parameters along `Cusps_H`, with the cusp count as the orbit count of KM 10.6's cusp-labels.
   The elliptic-curves roadmap's Tate strand — uniformisation `L^× / q^ℤ ≅ E_q(L)` over a
   complete rank-one valued field — is a *different, point-level object* and is **not** a
   supplier for this formal calculation; the two are related, and neither substitutes for the
   other.
3. **The ramification table of `X₁(N) → X₀(N)`** (Mazur II §2, Table 1 — all six rows). The
   covering `Y₁(N) → Y₀(N)` is Galois with group `(ℤ/N)ˣ/±1` (Layer 6 quotients); extending it
   to `X₁(N) → X₀(N)` along the normalisations is itself a milestone — and the extension is
   finite with no hypothesis on the affine map (its graph is a closed immersion into the fibre
   product over `ℙ¹_j`, whose projection is finite). Fibrewise over `ℤ[1/N]`,
   for `k` algebraically closed of characteristic `≠ N`: the covering is unramified at every
   cusp; if `char k ∉ {2, 3}`, the only ramification is at the two points over `j = 1728`
   (inertia cyclic of order `2`, present iff `N ≡ 1 mod 4`) and the two points over `j = 0`
   (inertia cyclic of order `3`, present iff `N ≡ 1 mod 3`), by the `Aut(E, C) ↪ (ℤ/N)ˣ`
   rigidity for `N ≥ 5`. **In characteristic `2`** (`j = 0 = 1728`): the order-`3` pair
   (present iff `N ≡ 1 mod 3`) stays two distinct, *tamely* ramified points, while the
   order-`2` pair (present iff `N ≡ 1 mod 4`) **collapses to one point, wildly ramified of the
   first type** (Mazur Def. 2.2: `G = G₀ = G₁`, `G₂ = 0`, i.e. `ν = 1`). **In characteristic
   `3` the roles reverse**: the order-`2` pair (present iff `N ≡ 1 mod 4`) stays two tame
   points, the order-`3` pair (present iff `N ≡ 1 mod 3`) collapses to one wild point of the
   first type. The mechanism is the
   automorphism normalisers, and **this layer owns them as its own milestone** — the
   elliptic-curves roadmap supplies the `Aut(E)` carrier for its twist theory but not these
   computations, and what is needed here is more than the group: the classification
   `Aut(E)/±1 ≅ A₄` (characteristic `2`, `j = 0 = 1728`) and `Aut(E)/±1 ≅ S₃` (characteristic
   `3`), its action on the cyclic order-`N` subgroup schemes of `E`, and the normaliser and
   orbit computation on top (Silverman App. A; Mazur II pp. 65–66, §References). The output
   consumed by the table: in characteristic `2` an order-`3` subgroup of `A₄` is
   self-normalising (two points survive) while an order-`2` subgroup has Klein-four normaliser
   whose extra element interchanges the two stabilised subgroups (the pair collapses to one
   point); in characteristic `3` the two behaviours are exchanged in `S₃`. The wild break
   `ν = 1` is proved by comparing the degree of the global different across characteristics:
   Kähler differentials in the exact sequence of `X₁(N) → X₀(N)`, the global different, the
   **Riemann–Hurwitz formula in its Euler-characteristic form**
   `deg 𝔡 = −2·χ(X₁, O) + 2·d·χ(X₀, O)` with `d = (N−1)/2` — deliberately *not* the
   `2g − 2` form: this roadmap asserts no connectedness (§Scope), and the `χ` form is valid
   componentwise for a disconnected smooth proper curve, whereas `2g − 2` is not even defined
   for one — constancy of the two **Euler characteristics** across the fibres, from coherent
   cohomology and base change in the smooth proper families, and the local formula
   `v(𝔡) = Σ_{i≥0} (|G_i| − 1)` — a named dependency package, not a footnote, and one
   with a named supplier: the [Algebraic Curves roadmap](../AlgebraicCurves/README.md)
   owns the different divisor, Dedekind's different theorem, and the Hurwitz genus formula
   (its Layer 7), the lower-numbering ramification groups `G_i(P′∣P)` with **Hilbert's
   different formula** `d(P′∣P) = Σ_{i≥0}(|G_i| − 1)` (its Layer 8, which also pins the
   scope wall: lower numbering only), and the Kähler-differential comparison (its Layer 9);
   its Layer 12 dictionary carries those function-field statements to the smooth proper
   fibres used here, one connected component at a time — which is exactly why the `χ` form,
   valid componentwise, is the form of record. What remains owned by this layer is the
   fibrewise constancy of the two Euler characteristics and the assembly across
   characteristics.
4. **The Shimura covering** (Mazur II, Cor. 2.3). Put `G = (ℤ/N)ˣ/±1`, cyclic of order
   `(N−1)/2`, and `n = (N−1)/gcd(N−1, 12) = num((N−1)/12)`. Let `H ≤ G` be the unique subgroup
   of order `gcd(N−1, 12)/2`, and define `X₂(N) := X₁(N)/H`. Milestones: `X₂(N) → X₀(N)` is
   Galois cyclic of degree `n`; and it is **finite étale over `ℤ[1/N]`**, including at the cusps
   and in residue characteristics `2` and `3`. **That is two proofs, not one.**
   *Unramifiedness*: at an interior geometric point `(E, C)` the inertia group is
   `Aut(E, C)/{±1} ↪ G`, cyclic of order `1`, `2` or `3` in **every** characteristic prime to
   `N` — in characteristics `2` and `3` the automorphism quotients are `A₄` and `S₃`, but the
   inertia subgroup is still cyclic — with order `2` only if `N ≡ 1 mod 4` and order `3` only if
   `N ≡ 1 mod 3`, hence contained in `H`; the factors of `2` and `3` that the numerator removes are
   exactly the inertia orders the quotient kills, so the residual `G/H`-action has trivial
   geometric stabilisers. At the cusps the inertia is trivial by item 3's cusp unramifiedness —
   which is item 3's milestone, not a consequence of the affine covering being étale. *Flatness*: killing inertia proves nothing about flatness, and in residue
   characteristics `2` and `3` invertibility of the degree is unavailable as an excuse. This
   roadmap takes the smooth-curves route: `X₂(N)` and `X₀(N)` are smooth proper relative curves
   over `ℤ[1/N]` (items 1–2 applied to their level problems), the quotient morphism is finite,
   **miracle flatness** for a finite morphism between smooth relative curves gives flat, and
   finite + flat + unramified is finite étale. (The alternative — proving the `G/H`-action free
   as a *scheme* action and quoting the finite-étale torsor theorem — is not taken, since
   freeness at the cusp sections is exactly what the smooth-curves route avoids having to
   argue.) This formulation, with
   `H` named by its order, is the one to formalise. The covering is the geometric substrate of
   the Shimura subgroup of `J₀(N)`, which is where this roadmap stops and §The Mazur interface
   hands over.

**Dependencies.** Layers 0.1 and 5.1 (relative effective Cartier divisors and the fine curve `Y₁(N)`),
Layers 2.2 and 3.2 (the quotient isogeny and the naive `[Γ₀(N)]`-structures, which define
`w_N`), Layer 6 (quotients,
coarse schemes, the `j`-line, and — for the interior smoothness of every `Y_H` — Layer 6.4's
quotient-smoothness theorem, KM Notes Added in Proof pp. 508–509, applied to `Y₁(N)` with its
diamond action), Mathlib's relative-normalisation API (present at the pin; the
finiteness of `fromNormalization` in this situation is a milestone here, not a carrier gap),
the formal-cusp package of item 2 (built here), the elliptic-curves
roadmap's `Aut(E)` carrier — the characteristic-`2`/`3` classification and normaliser
computations on top of it are item 3's own milestone here — and — for item 3's wild break — a
**global different and Riemann–Hurwitz package** (in the Euler-characteristic form, per item 3)
for curves over a field with the local higher-ramification formula, owned by the Algebraic
Curves foundations, together with constancy of `χ(·, O)` in smooth proper families from the
curve-cohomology and base-change supplier. Nothing here uses
characteristic-`N` geometry, the relative regular-differential and duality package of Mazur
II §3, or any Jacobian; item 3 *does* use Kähler differentials, the global different,
Riemann–Hurwitz, and the local different formula.

**No declaration of this layer is in `Suggested.lean`.** Mathlib's relative normalisation
(`Scheme.Hom.normalization` with `toNormalization`, `fromNormalization`, `normalizationDesc` and
`normalization.hom_ext`) is consumed as it stands, and the functorial map between relative
normalisations over a common target is a one-line `normalizationDesc`; neither is restated.

The modular conclusions of items 1–4 are prose targets until their actual input objects can
occur in the signatures. Before stating them, construct the projective `j`-line
over `ℤ[1/N]` with its affine chart and infinity section, the quotient `Y₁(N)/H` with its
coarse-moduli/quotient identification, and the corresponding `j`-map. State each theorem on
those constructed objects, with `N ≥ 5` prime and `H ≤ Δ`, or on data equipped with those
identifications and all required compatibility squares. A proper smooth relative curve with
a section does not identify `ℙ¹_j`; arbitrary qcqs maps do not identify modular curves.
No unused prime-level field or membership docstring can replace these hypotheses.

This applies to every modular conclusion, not just the two exceptional members: finiteness of
the compactification map, identification of the affine open, properness and smoothness,
relative Cartier and flatness statements for the full cusp fibre, finite étaleness of its
reduction, geometric-fibre normalisation comparison, extensions of modular maps, and the
Shimura covering with degree `(N − 1)/gcd(N − 1, 12)`. For `X₀(N)`, the two-section statement is about
the reduced cusp model; the six-row ramification table is about the specified map
`X₁(N) → X₀(N)` and consumes item 3's named different/Riemann–Hurwitz package. None of these
claims is asserted for arbitrary generic normalisation data.

## The Mazur interface: what *Modular curves and the Eisenstein ideal* consumes

Mazur's paper (IHÉS 47, 1977) is the acceptance test this roadmap should be measured against on
the arithmetic side, and its Chapter II §§1–2 is a precise bill of materials. Recording that bill
here, with one owner per line, is what keeps "supplier-blocked" honest rather than aspirational.
**This is an interface for Mazur Ch. II §§1–2 — the modular-curve geometry — and deliberately
not for Mazur's theorems.** The torsion theorem in particular is out of scope, and not only for
Jacobian-side reasons: its Chapter III §5 descent step consumes the **boundary moduli
interpretation of the cusps** — a section through a curve with rational `N`-torsion specialises
to `∞` or to `0` according to whether the cyclic subgroup meets the identity component of the
special fibre — and that is a statement about generalised elliptic curves, which §Scope excludes.
This roadmap supplies the curves; it makes no claim, conditional or otherwise, about the theorems
Mazur proves with them. The split:

**Owned by this roadmap.** The affine curves `Y₀(N)`, `Y₁(N)` integrally and over `ℤ[1/N]`
(Layers 5, 6, and 9); `[Γ₀(N)]` with cyclicity (Layer 9); the quotient and coarse theory with the
`j`-line (Layer 6); the compactified coarse curves, the two cusps of `X₀(N)`, the ramification
table of `X₁(N) → X₀(N)`, and the étale Shimura covering (Layer 10). Mazur's
split-Cartan-normaliser problem has an affine `[Γ_H]` quotient in Layer 6's scope. Its
compactification `X_split(N)` (Ch. III §6) is not supplied by Layer 10: that subgroup of
`GL₂(ℤ/Nℤ)` is not a subgroup of the diamond group `Δ` defining the class above. A separate
extension would have to state its own compactification and cusp hypotheses; it is not part
of this Ch. II §§1–2 interface.

**Named supplier contracts, not built here.** Each line is a blocker for the corresponding
downstream statement, per the portfolio rule that a prose promise is not a closed dependency:

- **Characteristic-`N` geometry**: the two-component semistable special fibre obtained by gluing
  two copies of the `j`-line along the supersingular points (with Frobenius in the gluing),
  regularity of `M₀(N)/ℤ` away from `j ∈ {0, 1728}`, and the minimal regular resolution
  `X₀(N)/ℤ`, whose bad fibre adds the exceptional chains of `ℙ¹`s over the stacky points
  `j = 0, 1728` (Mazur II §1 and Diagram 1; the Mazur–Rapoport appendix; DR IV 6.9;
  KM Ch. 12–13). Not a Kodaira fibre, and not to be described as one. Owner: a
  future Deligne–Rapoport/semistable-reduction roadmap — the same place §Scope already sends
  Igusa curves and generalized elliptic curves (Conrad, §References).
- **Regular differentials and relative duality** for Cohen–Macaulay curve morphisms
  (Mazur II §3; DR I 2.1.1): owner, the coherent-duality successor to the Jacobian Challenge
  foundations this roadmap already consumes.
- **`J₀(N)` and its Néron model**, `Pic⁰` of the regular model, component groups at `N`
  (Mazur's conventions page and the Mazur–Rapoport appendix): owner, a Néron-model/abelian-varieties
  roadmap; the elliptic-curves roadmap's §Layer 4 names the same exclusion.
- **The Hecke algebra `𝕋` acting on `J₀(N)`**, the cuspidal and Shimura subgroups as subgroup
  schemes, the Eisenstein ideal and quotient (Mazur II §§6–19): owner, a dedicated downstream
  Eisenstein-ideal roadmap consuming this one, the modular-forms roadmap's Hecke theory, and the
  Jacobian supplier above. Layer 10's Shimura covering is deliberately the last stop on this side
  of that boundary.
- **Admissible group schemes over `ℤ`** (Mazur Ch. I §1(f), p. 47): for `p ≠ N`, an admissible
  `p`-group is a commutative, quasi-finite, separated, **flat** group scheme of finite
  presentation over `ℤ`, **killed by a power of `p`**, whose restriction to `ℤ[1/N]` is finite
  flat and admits a filtration by finite flat subgroup schemes with successive quotients
  `(ℤ/p)_{ℤ[1/N]}` or `μ_{p,ℤ[1/N]}`; its restriction to `ℤ[1/p]` is quasi-finite étale and its
  restriction to `ℤ[1/pN]` is finite étale. Owner: a finite-flat-group-schemes roadmap; this
  roadmap's Layer 0.2 carrier is the `ℤ[1/N]`-side interface it will meet. (The level prime `N`
  and the residual prime `p` are different primes; flatness over `ℤ` and the filtration living
  on the `ℤ[1/N]`-restriction are both part of the definition, and dropping either changes the
  category.)

**Close-out: the Layer 10 target list, in dependency order.** Layer 10 records the
constructions for Mazur Ch. II §§1–2 and names their suppliers. Its targets, ordered so that
each stands only on entries before it, with the owner named wherever a target is consumed
rather than built:

1. the formal Tate/cusp package (item 2) — built in this layer;
2. finiteness of `fromNormalization`, and the identification of `X_H` over `𝔸¹_j` with `Y_H`
   (item 1) — this layer, on Mathlib's normalisation carrier;
3. the Cartier-divisor and boundary-smoothness statements for `Cusps_H` (item 2) — this
   layer, standing on 1;
4. interior smoothness: every `Y_H` is a smooth affine relative curve over `ℤ[1/N]` — consumed
   from Layer 6.4, whose quotient-smoothness theorem (KM, Notes Added in Proof, pp. 508–509) is
   applied to `Y₁(N)` with its diamond action; with 2 and 3 this makes all of `X_H` smooth,
   which is the normality of the target used in 5;
5. the geometric-fibre base-change theorem for the normalisation (item 1, in the four steps
   stated there) — this layer, standing on 3 and 4;
6. extension of the Galois covering over the fixed `j`-line using 2 and the normalisation
   universal property; separately, extension of `w_N` using the formal-cusp package in 1,
   the finite extension of `j ∘ w_N`, and the second normalisation identification in item 2;
7. the characteristic-`2`/`3` automorphism classification and normaliser computations
   (item 3) — this layer, on the elliptic-curves roadmap's `Aut(E)` carrier;
8. the different and Riemann–Hurwitz package (item 3) — consumed from the
   [Algebraic Curves roadmap](../AlgebraicCurves/README.md), Layers 7–9 through its Layer 12
   dictionary, as itemised at item 3; the fibrewise Euler-characteristic constancy is this
   layer's, standing on 2–5;
9. the miracle-flatness half of the Shimura covering's étaleness (item 4) — this layer,
   standing on 2–7.

This list is the dependency contract: no statement of this layer or of §The Mazur interface
consumes an entry ahead of its position.

**Further sources.** Česnavičius, Theorem 6.7: for every `n`, the coarse curve `X₀(n)` over `ℤ` is
regular away from the closed points with `j = 0` or `j = 1728` in the characteristics dividing `n`.
This is more general than the statement of Mazur II §1 for prime level, and includes the cusps.

## Dependency order and parallel work

The layers are ordered so that each one uses only earlier layers. The table lists, for each layer,
the layers it uses directly. The dependency statement of each section is definitive; the table
summarises those statements.

| Layer | Uses layers |
|---|---|
| 0 | suppliers only |
| 1 | 0 |
| 2 | 0, 1 |
| 3 | 0, 1, 2 |
| 4 | 0, 2, 3 |
| 5 | 0, 1, 2, 3, and, for the Drinfeld form of Layer 5.1 item 4 only, 4 |
| 6 | 0, 1, 2, 3, 4, 5 |
| 7 | 0, 1, 2, 3 |
| 8 | 0, 2, 3, 4, 7, and, for Layers 8.5 and 8.9 only, 6 |
| 9 | 0, 2, 3, 4, 7, 8, and, for Layers 9.5 and 9.6 only, 5 and 6 |
| 10 | 0, 2, 3, 5, 6 |

The order is obtained from the targets as follows.

- Layers 0–2 are the scheme theory, the elliptic curves over a base, and the isogeny theory that
  every statement about a level structure presupposes.
- Layer 3 fixes what a moduli problem for elliptic curves is, with the naive level structures as
  its first examples. Every later layer states or uses results about moduli problems, so Layer 3
  precedes all of them.
- Layers 4, 5, and 7 use Layers 0–3 only, apart from the Drinfeld corollary in Layer 5.1 item 4,
  which uses Layer 4.3. Otherwise they are pairwise independent: the Drinfeld level structures,
  the fine curves after inverting `N`, and the theory of one elliptic curve at one prime may be
  built in parallel.
- From there the roadmap has two lines. Layers 5, 6, and 10 construct the curves over `ℤ[1/N]`:
  fine curves, quotients and coarse curves, and compactifications. They use no regularity
  theorem. Layers 7, 8, and 9 are the integral theory, each using the one before: the local
  theory at a prime, the axiomatic theorems with their verification for `[Γ(N)]`, `[Γ₁(N)]`, and
  balanced `[Γ₁(N)]`, and then cyclicity and `[Γ₀(N)]`.
- The two lines meet only where the integral theory treats quotients: Layers 8.5, 8.9, 9.5,
  and 9.6 use the quotient formalism of Layer 6, and Layer 9.6 uses the full-level curve of
  Layer 5.2. Layer 10 uses nothing from Layers 7–9, and they use nothing from Layer 10.
- The order between the two lines is not forced. Layers 5 and 6 are placed before the integral
  theory because they have the fewer prerequisites and Layers 8 and 9 use them. Layer 10 is
  placed last because no other layer uses it; it may be built as soon as Layer 6 exists.

Three points of the order are forced and are easy to get wrong.

- The problem `[Γ₀(N)]` on the Drinfeld side is not in Layer 4.4. Its relative representability
  needs the cyclicity theorem of Layer 9.3. That theorem instantiates the Axiomatic Isomorphism
  Theorem of Layer 8.4 with the regularity of `[Γ₁(pⁿ)]` from Layer 8.8. Over `ℤ[1/N]` the naive
  `[Γ₀(N)]` of Layer 3.2 suffices, which is why Layers 5, 6, and 10 do not wait for Layer 9.
- The naive structures of Layer 3.2 use the multiplication maps of Layer 2.1 and the finite étale
  and quotient infrastructure of Layers 0.3, 0.4, and 0.7. They do not use the Drinfeld loci of
  Layer 4.
- Full-level representability in Layer 5.2 uses the rigidity of Layer 3.3. Its determinant
  refinement and the twisted curve of Layer 5.3 also need the Weil pairing of Layer 2.5.

Two cross-links to other work are recorded here.

- Layer 0.1 and the Jacobian Challenge cohomology package meet in Layer 1.3. Layer 2.4 then
  proves, on Tau Ceti's relative Picard functor over an arbitrary base, the representability of
  its degree-zero part by the curve and constructs the Poincaré bundle, which the Jacobian
  Challenge provides only over a field. It also consumes the basic isogeny theory of Layer 2.3.
- The equation-level elliptic-curve theory supplies the degree input used by Layer 2.1 and the
  final normalisation comparison for the Weil pairing in Layer 2.5. The broad comparison of
  isogenies with function-field extensions is owned by Algebraic Curves and is not in this table.

## Downstream consumers

- SchemeAndStackFoundations names Layers 0.2–0.7 (group objects and finite locally free group
  schemes, affine invariant quotients, finite étale schemes and Galois sets, effective descent,
  Weil restriction, and the Grassmannian), Layer 0.9 (strict henselisation and the regular locus),
  Layer 6.3 (coarse schemes of finite quotient problems) and Layer 7.4 (`ArtinianTestAlgebra`) as
  the owner of these objects in its scope, and takes none of them as an input. Nothing of this
  roadmap consumes SchemeAndStackFoundations.
- AlgebraicModuliForArithmeticGeometry §1.3 consumes Layer 0.7's finite locally free quotient
  Grassmannian with its universal quotient and its Plücker closed immersion into `P(∧^N E)`,
  which it restricts along a presentation to embed the Grassmannian of a finite-type
  quasi-coherent sheaf; the description of the image by the Plücker relations, the coherent
  extension, the tangent sheaf, smoothness of relative dimension `N(n − N)` and flag schemes are
  built there, not here.
- The Eisenstein-ideal application of §The Mazur interface consumes Layer 10.
- EtaleCohomologyFoundations §F.3a consumes Layer 0.9's strict henselisation of a discrete
  valuation ring (`StrictHenselization.isDiscreteValuationRing_algebra`, strictly henselian by
  `IsStrictlyHenselianLocalRing`) for its strictly henselian traits, and
  LefschetzPencilsAndVanishingCycles Layer LPV.0 consumes those traits. Layer 0.9's
  `IsHenselization` serves every henselisation, including the henselisation of a local ring (the
  case `L = κ`), and compares every model of one with every other through
  `IsHenselization.existsUnique_comp_eq` and `IsHenselization.bijective_of_comp_eq`.

## Labels used by other roadmaps

Other roadmaps cite sections of this roadmap by the labels in the first column. Each label
resolves to the sections in the second column. A label with a letter is unambiguous. A bare layer
number in the six rows after the lettered labels is read by the topic the citing text names. An
item label `0A.k` is item `k` of Layer 0.1, whose items 1–7 keep their numbers. The last five rows
are former heading anchors.

| Former label | Section of this roadmap |
|---|---|
| Layer 0A | Layer 0.1 |
| Layer 0B | Layer 0.2 |
| Layer 0C | Layer 0.3 |
| Layer 0D | Layer 0.4 |
| Layer 0E | Layer 0.5 |
| Layer 0F | Layer 0.6 |
| Layer 0G | Layer 0.7 |
| Layer 1A | Layer 1.1 |
| Layer 1B | Layer 1.2 |
| Layer 1C | Layer 1.3 |
| Layer 1D | Layer 1.4 |
| Layer 1E | Layer 1.5 |
| Layer 2A | Layer 2.1 |
| Layer 2B | Layer 2.2 |
| Layer 2C | Layer 2.3 |
| Layer 2D | Layer 2.4 |
| Layer 2E | Layer 2.5 |
| Layer 2F | Layer 2.6 (degree and trace) and Layer 3.3 (rigidity of the naive problems) |
| Layer 3A | Layer 0.8 |
| Layer 3B | Layer 4.1 |
| Layer 3C | Layer 4.2 |
| Layer 3D | Layer 4.3 |
| Layer 3N | Layer 3.2 |
| Layer 4A | Layer 3.1 |
| Layer 4B | Layer 3.4 |
| Layer 4C | Layer 3.5 |
| Layer 4D | Layer 0.9 (henselisation and regular local rings) and Layer 3.6 (the moduli-theoretic statements) |
| Layer 5A | Layer 5.1 |
| Layer 5B | Layer 5.2 |
| Layer 5C | Layer 5.3 |
| Layer 7A | Layer 8.1 |
| Layer 7B | Layer 8.2 |
| Layer 7C | Layer 7.2 |
| Layer 7D | Layer 7.4 |
| Layer 7E | Layer 7.1 (PD-1 to PD-3) and Layer 7.3 (PD-4 to PD-6) |
| Layer 7F | Layer 7.5 (ST-1, ST-2), Layer 8.3 (ST-3), and Layer 8.6 (ST-4, ST-5) |
| Layer 7G | Layer 8.7 |
| Layer 7H | Layer 8.3 (proof of the axiomatic theorem) and Layer 8.8 (verification and assembly) |
| Layer 8A | Layer 9.1 |
| Layer 8B | Layer 9.2 |
| Layer 8C | Layer 8.4 (the axiomatic theorem) and Layer 9.3 (cyclicity at prime-power level) |
| Layer 8D | Layer 9.4 |
| Layer 9A | Layer 6.1 |
| Layer 9B | Layer 6.2 (after inverting `N`) and Layer 9.5 (over `ℤ`) |
| Layer 9C | Layer 8.5 (the axioms) and Layer 8.9 (prime-power level) |
| Layer 9D | Layer 6.3 (coarse moduli schemes) and Layer 6.4 (smoothness and the curves `Y_H`) |
| Layer 9E | Layer 6.5 (the coarse `j`-line) and Layer 9.6 (the Borel formula for `Y₀(N)`) |
| Layer 3 | Layers 0.8, 3.2, and 4.1–4.3 (level structures) |
| Layer 4 | Layers 0.9 and 3 (the formalism of moduli problems) |
| Layer 6 | Layers 4.4 and 9.1 (relative representability and `[N-Isog]`) |
| Layer 7 | Layers 7 and 8 (regularity) |
| Layer 8 | Layers 8.4 and 9.1–9.4 (cyclicity and `[Γ₀(N)]`) |
| Layer 9 | Layers 6, 8.5, 8.9, 9.5, and 9.6 (quotients and coarse moduli) |
| `#0d-finite-étale-schemes-and-galois-actions` | Layer 0.4 |
| `#5a-tate-normal-form-and-y₁n-for-n4` | Layer 5.1 |
| `#5b-full-ordered-bases-and-fixed-pairing` | Layer 5.2 |
| `#9d-coarse-moduli-schemes-and-finite-quotients` | Layers 6.3 and 6.4 |
| `#9e-the-coarse-j-line-and-y₀n` | Layers 6.5 and 9.6 |

## Worked examples

The following examples accompany the general theory.

- The projective model of an elliptic Weierstrass equation is proper and smooth of relative
  dimension one, and its field-valued sections agree with the equation-level point group.
- For `[NeZero N]`, `E[N]` has finite-flat rank `N²`; if `N` is invertible over an algebraically
  closed field, its geometric points form `(ℤ/Nℤ)²`.
- On a supersingular elliptic curve in characteristic `p`, `E[p]` has rank `p²` but no nonzero
  geometric points. The zero section is nevertheless a Drinfeld point of exact order `p`, since
  `p[0]=ker(F_{E/S})` as degree-`p` divisors.
- Tate normal form gives `Y₁(5)` over `ℤ[1/5]`.
- The full ordered-basis scheme has determinant map to `μ_N^prim`, and fixing a primitive root
  gives `Y(N,ζ)`.
- `Spec ℤ[j]` is coarse but not fine; the exceptional automorphism loci occur at `j=0` and
  `j=1728` away from characteristics `2` and `3`, with the stated corrections in those
  characteristics.
- For `N≥3`, over `ℤ[1/N]`, `Y₀(N)` is the Borel quotient of `Y_full(N)` and is not a fine
  moduli scheme. Its integral construction uses the cyclicity locus of Layer 9.
- The points of `Y(ρ)` over a characteristic-zero field have the expected
  Galois-representation-with-pairing description.
- The Picard dual and the quotient-factorisation dual of an isogeny agree, and their kernel pairing
  gives the scheme-theoretically perfect Weil pairing.

## References

- N. M. Katz and B. Mazur, *Arithmetic Moduli of Elliptic Curves*, Annals of Mathematics Studies
  108, Princeton University Press, 1985.
- D. Loeffler, *Modular Curves*, graduate lecture notes. Relevant references include 3.3.4,
  3.3.6, 3.4.4, 3.7.4, and §3.8.
- P. Deligne and M. Rapoport, *Les schémas de modules de courbes elliptiques*, in *Modular Functions
  of One Variable II*, LNM 349, Springer, 1973, 143–316, abbreviated **DR** and cited by chapter and
  statement number: generalized elliptic curves, the moduli stacks with level structure and their
  compactification by normalisation, and the coarse curves.
- M. Demazure and A. Grothendieck, *Schémas en groupes (SGA 3)*, Exposé VIIA, §3.3, for
  Cartier duality of finite locally free commutative group schemes, and Exposé V, Théorème 4.1,
  for quotients of affine schemes by finite locally free equivalence relations.
- J.-I. Igusa, *Fiber systems of Jacobian varieties III (Fiber systems of elliptic curves)*,
  Amer. J. Math. 81 (1959), 453–476, §2, the source KM 8.2.1 cites for the coarse `j`-line.
- V. G. Drinfeld, *Elliptic modules*, Mat. Sbornik 94, 1974.
- B. Conrad, *Arithmetic moduli of generalized elliptic curves*, J. Inst. Math. Jussieu 6 (2007),
  no. 2, 209–278, cited as Conrad: Drinfeld structures and cyclic subgroups on generalized elliptic
  curves, and the moduli stacks over `ℤ`, cusps included. The compactified theory **in
  characteristics dividing the level** is outside this roadmap; the `ℤ[1/N]` coarse compactification
  of Layer 10 does not use it.
- K. Česnavičius, *A modular description of `X₀(n)`*, cited by the numbering of arXiv:1511.07475v2:
  quotients of generalized elliptic curves, Drinfeld structures, the regularity of the compactified
  stacks, and base change for coarse spaces.
- The Stacks Project, cited by tag.
- A. Grothendieck, *Revêtements étales et groupe fondamental (SGA 1)*, Exposé V, §§1–2, for
  quotients of schemes by finite groups; cited by the numbering of the edition arXiv:math/0206203.
- D. Rydh, *Existence and properties of geometric quotients*, J. Algebraic Geom. 22 (2013), no. 4,
  629–669, cited by the numbering of arXiv:0708.3333v2.
- B. Conrad, *The Keel–Mori theorem via stacks*, unpublished note, 2005, for coarse spaces of stacks
  with finite inertia.
- B. Edixhoven, G. van der Geer and B. Moonen, *Abelian Varieties*, draft of a book, abbreviated
  **EGM** and cited by the paragraph numbers `(a.b)` of the draft.
- T. Oda, *The first de Rham cohomology group and Dieudonné modules*, Ann. Sci. École Norm. Sup. (4)
  2 (1969), 63–135, Theorem 1.1 and Corollary 1.3, for the duality between the kernels of an isogeny
  of abelian schemes and of its dual.
- J. Tate and F. Oort, *Group schemes of prime order*, Ann. Sci. École Norm. Sup. (4) 3 (1970),
  1–21, §1, for Deligne's theorem that a commutative finite locally free group scheme is killed by
  its rank.
- F. Oort, *Finite group schemes, local moduli for abelian varieties, and lifting problems*,
  Compositio Math. 23 (1971), no. 3, 265–296, Theorem (2.2.1), for local moduli of abelian
  varieties.
- R. Kottwitz and P. Wake, *Primitive elements for `p`-divisible groups*, arXiv:1510.02814v2, §4.
- P. Scholze, *The Langlands–Kottwitz approach for the modular curve*, arXiv:1003.1935v1, Theorem
  4.3 and Theorem 6.2, for the statements of representability and regularity at full level.
- B. Mazur, *Modular curves and the Eisenstein ideal*, Publ. Math. IHÉS 47 (1977), 33–186,
  II §§1–3 and the Mazur–Rapoport appendix, the consumer §The Mazur interface is written against.
- J. H. Silverman, *The Arithmetic of Elliptic Curves*, 2nd ed., GTM 106, Springer, 2009,
  III.1.7 and V.4.1 for the Legendre form and the Hasse-polynomial criterion for supersingularity
  (PD-6 of Layer 7.3), III.10.1 and Appendix A for automorphisms and the normal forms in
  characteristics `2` and `3`.
- K. Buzzard, *Formalizing Fermat*, Lecture 8, for `Y(ρ)`.
- N. M. Katz, *Serre–Tate local moduli*, in *Surfaces Algébriques* (Séminaire de Géométrie
  Algébrique d'Orsay 1976–78), LNM 868, Springer, 1981, 138–202 — Theorem 1.2.1 is the
  Serre–Tate equivalence ST-1 of Layer 7.5, which KM invoke without proof.
- M. Lazard, *Sur les groupes de Lie formels à un paramètre*, Bull. Soc. Math. France 83 (1955),
  251–274, for the classification by height of one-dimensional commutative formal groups over an
  algebraically closed field of characteristic `p` (PD-5 of Layer 7.3).

## Provenance: existing Lean work and source audit

The AINTLIB modular-curves development, in the repository `github.com/CBirkbeck/AINTLIB`
(branch `dev/modular-curves`, directory `projects/ModularCurves`), contains implementation and
proof decomposition for the group law, pole sheaves, Picard constructions, the Weil pairing, fine
curves, quotient problems, and the beginning of the regularity and cyclicity theory of Layers 8
and 9. It is migration and
proof-architecture material, not a dependency and not evidence that a theorem is complete: it is
not a Lake dependency, and its declarations require reconciliation with the pinned APIs before
migration. Its files carry Apache-2.0 headers and the repository carries the Apache-2.0 root
licence; any adaptation must retain the file-level notices and be coordinated with the AINTLIB
authors. No AINTLIB code is transferred by this roadmap.

Two Apache-2.0 Lean repositories outside Tau Ceti,
[AxiomMath/Weil](https://github.com/AxiomMath/Weil/tree/27cdb2049be62ee2911429b47f54774078450e32)
and [formal-arithmetic-geometry/weil-conjectures](https://github.com/formal-arithmetic-geometry/weil-conjectures/tree/55abf461d4688270382c9c982ac08a279e41c00b),
formalise scheme-level inputs of Layers 0 and 2. Neither contains modular curves, neither is a
dependency, and both are built against other Lean and Mathlib versions, so a statement read there
is compared with the target here before it is used, and a proof adapted from them rather than
rewritten keeps the Apache-2.0 attribution. What they share with this roadmap is at the pin and
is consumed from Tau Ceti: the Galois equivalence for finite étale schemes over a field (Layer
0.4), effective descent of affine schemes along an affine flat cover and descent of sections and
morphisms (Layer 0.5), the relative Picard fppf sheaf with its degree-zero part (Layer 2.4, items
1–2), and the strict henselisation of Layer 0.9, which Tau Ceti builds on the roadmap's carrier
while both repositories work with strict local rings of schemes at geometric points. The one
pointer to a target not at the pin is the file
[`AlgebraicGeometry/Descent/AffineDescentEffective.lean`](https://github.com/AxiomMath/Weil/blob/27cdb2049be62ee2911429b47f54774078450e32/Weil/AlgebraicGeometry/Descent/AffineDescentEffective.lean)
of AxiomMath/Weil: a descent datum whose structure morphism is affine is effective along a flat
surjective quasi-compact morphism which need not be affine (Stacks, Tag 0245), the first of the
remaining forms of Layer 0.5. Its descent data are that repository's, not `TauCeti.DescentDatum`.

The dependency-sensitive statements of KM are at the following printed pages:

- the `A`-generator extension results 1.11.2–1.11.5 and the coprime factorisation
  1.10.14–1.10.15, pp. 46–53;
- the Legendre and naive level-three families, pp. 70–73, and the rigidifier statement 4.6.2
  and the proof of 4.7.0, pp. 111–114, where the `GL₂(ℤ/2ℤ)×{±1}`-torsor claim recorded as an
  erratum in Layer 3.5 occurs;
- the First Main Theorem and Reg. 1–Reg. 4, pp. 129–130;
- the Axiomatic Isomorphism Theorem and the explicit Chapter-6 rings, pp. 155–162;
- the quotient definition, Theorem 7.1.3, and scalar-extension comparison, pp. 186–194;
- the standard quotient identifications, Axiomatic Regularity Theorem for quotients, its
  invariant-ring lemmas, and the standard applications, pp. 198–207;
- coarse-moduli quotients, base change, the `j`-line "over any ring `R`" with its citation of
  Igusa, and 8.2.2, pp. 224–231;
- the Notes Added in Proof on alternation of the Weil pairing, the dimension convention of 4.12,
  and the descent of regularity along finite flat surjections used in 6.6.1 and 7.5.1,
  pp. 505–510, and the reference list, pp. 512–513.

## Early API and proof hygiene

The layers above say what to prove; this section says what to build first so that proving it
stays cheap. Three levers, in leverage order:

1. **Attribute discipline on structural lemmas.** Lemmas asserting "lies over the base" and
   pullback-leg identities carry `@[reassoc (attr := simp)]`; constructor-style definitions
   carry `@[simps]`; one-data-field structures carry `@[ext]`. Reassociation chains and
   `pullback.hom_ext` blocks are then `simp` calls, not hand-rolled proofs.
2. **Names for the composites proofs keep re-spelling.** A repeatedly spelled-out composite
   (a distinguished geometric point, a Galois "read points" chain, an identity-legged base
   change) is a definition with its `@[simp]` naturality lemmas, not an idiom.
3. **Scoped simp sets for the recurring side-goal families**, so each family closes with one
   `simp [set, h]` call.

**What later layers may cite is the pinned Mathlib API itself**: `pullback.map` with the
non-varying legs the identity, for base change along a morphism of second factors;
`pullback.lift` for the section of `pullback.snd π a` induced by a lift of `a` through `π`; and
elementwise composition of morphisms of sheaves of modules, which is definitional. Nothing in
this section is a dependency of any layer, and no layer's statement changes if the advice above
is ignored.
