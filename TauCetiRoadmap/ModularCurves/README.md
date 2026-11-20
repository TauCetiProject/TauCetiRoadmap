# Roadmap: modular curves and the moduli of elliptic curves with level structure

**Summary.** This roadmap builds the moduli theory of elliptic curves with level structure over an
arbitrary base, due to Katz and Mazur, and the modular curves it produces. An elliptic curve
over a scheme `S` is a smooth proper morphism of relative dimension one with a section, which
Zariski-locally on `S` is a projective Weierstrass cubic with the section at infinity; it is a
commutative group scheme over `S`. A moduli problem assigns to every elliptic curve `E/S` a set of
structures on `E`, compatibly with base change. The level `N` is a positive integer throughout.
Level structures are taken in Drinfeld's sense, which works over every base, including bases where
`N` is not invertible: a point of exact order `N` is a section whose multiples, counted as a
divisor, form a subgroup scheme. The naive structures, which ask for points of order `N` in every
fibre, are used only where `N` is invertible.

The first headline theorem is Katz and Mazur's First Main Theorem. For every `N ≥ 1`, the moduli
problems `[Γ(N)]` (Drinfeld bases of `E[N]`), `[Γ₁(N)]` (points of exact order `N`), balanced
`[Γ₁(N)]` and `[Γ₀(N)]` (cyclic subgroups of order `N`) are relatively representable: for every
elliptic curve `E/S` the structures on `E` and its base changes are the points of a finite
`S`-scheme. That scheme is locally free over `S` of constant positive rank and étale over the part
of `S` where `N` is invertible, and each problem is regular of dimension two. For `[Γ₀(N)]` the
rank is `N ∏_{p ∣ N} (1 + 1/p)`.

The second concerns fine moduli. A relatively representable, affine and rigid moduli problem is
representable. Hence, for `N ≥ 3`, ordered bases of `E[N]` over `ℤ[1/N]` are classified by an
elliptic curve over an affine scheme `Y_full(N)` smooth of relative dimension one over `ℤ[1/N]`,
and for `N ≥ 4` points of order `N` are classified likewise by `Y₁(N)`.

The third concerns coarse moduli. For every commutative ring `R`, the coarse moduli scheme of
elliptic curves over `R`-schemes is the affine line `Spec R[j]`, the classifying map being the
`j`-invariant.

The fourth concerns compactification. Let `N ≥ 5` be prime and `H` a subgroup of `(ℤ/Nℤ)ˣ/{±1}`.
The normalisation `X_H` of the projective `j`-line over `ℤ[1/N]` in `Y₁(N)/H` is a smooth proper
relative curve, whose reduced cusp scheme is finite étale of rank `(N − 1)/|H|`. The curve
`X₀(N)` has exactly two cusps, `0` and `∞`, and `X₁(N)` modulo the subgroup of order
`gcd(N − 1, 12)/2` is a cyclic étale covering of `X₀(N)` of degree the numerator of `(N − 1)/12`,
the Shimura covering.

The Tau Ceti library supplies the carriers: elliptic curves over a base with their group law and
torsion, moduli problems on the category of elliptic curves, the naive and Drinfeld level problems,
and `Y₁(N)`. JacobianChallenge supplies line bundles and the cohomology of curves, used for the
Weierstrass presentation and Picard duality; AlgebraicCurves supplies the passage from function
fields to curves used for the ramification of the compactified curves. ModularCurvesPartII and
FiniteFlatGroupsAndIntegralPadicHodgeTheory build on the layers below, and Mazur's paper on the
Eisenstein ideal consumes the compactified curves.

## How to read the build

Layers 0–2 are the common foundations: scheme-theoretic prerequisites (divisors, finite locally
free group schemes, quotients, descent, parameter spaces, henselisation), elliptic curves over a
base, and isogenies, duality and the Weil pairing. Layer 3 sets up moduli problems, the naive level
structures, rigidity and rigidifiers, and proves that rigid relatively representable affine
problems are representable. Layer 4 defines the Drinfeld level structures. Layers 5 and 6 build the
curves after inverting `N`: the fine curves, quotient problems, coarse moduli schemes, the curves
`Y_H` and the coarse `j`-line. Layer 7 studies one elliptic curve at one prime. Layer 8 proves the
axiomatic regularity and isomorphism theorems and the First Main Theorem for `[Γ(N)]`, `[Γ₁(N)]`
and balanced `[Γ₁(N)]`; Layer 9 proves the cyclicity theorem and treats `[Γ₀(N)]`. Layer 10
compactifies the coarse curves over `ℤ[1/N]` for prime `N ≥ 5`.

The layers are ordered so that each one uses only earlier layers; each layer ends with its
examples and its dependencies, and each section has a *Needs:* line listing what its statements
and its route use, so that a target proved by another route is not blocked behind an unrelated
one. The table lists, for each layer, the layers it uses directly; the *Needs:* lines are
definitive and the table summarises them.

| Layer | Uses layers |
|---|---|
| 0 | suppliers only |
| 1 | 0 |
| 2 | 0, 1 |
| 3 | 0, 1, 2 |
| 4 | 0, 2, 3 |
| 5 | 0, 1, 2, 3, and, for the Drinfeld form of §5.1 item 4 only, 4 |
| 6 | 0, 1, 2, 3, 4, 5 |
| 7 | 0, 1, 2, 3 |
| 8 | 0, 2, 3, 4, 7, and, for §§8.5 and 8.9 only, 6 |
| 9 | 0, 2, 3, 4, 7, 8, and, for §§9.5 and 9.6 only, 5 and 6 |
| 10 | 0, 2, 3, 5, 6 |

The order is obtained from the targets as follows.

- Layers 0–2 are the scheme theory, the elliptic curves over a base, and the isogeny theory that
  every statement about a level structure presupposes.
- Layer 3 fixes what a moduli problem for elliptic curves is, with the naive level structures as
  its first examples. Every later layer states or uses results about moduli problems, so Layer 3
  precedes all of them.
- Layers 4, 5 and 7 use Layers 0–3 only, apart from the Drinfeld corollary in §5.1 item 4, which
  uses §4.3. Otherwise they are pairwise independent: the Drinfeld level structures, the fine
  curves after inverting `N`, and the theory of one elliptic curve at one prime can be built in
  parallel.
- From there the roadmap has two lines. Layers 5, 6 and 10 construct the curves over `ℤ[1/N]`:
  fine curves, quotients and coarse curves, and compactifications. They use no regularity
  theorem. Layers 7, 8 and 9 are the integral theory, each using the one before: the local theory
  at a prime, the axiomatic theorems with their verification for `[Γ(N)]`, `[Γ₁(N)]` and balanced
  `[Γ₁(N)]`, and then cyclicity and `[Γ₀(N)]`.
- The two lines meet only where the integral theory treats quotients: §§8.5, 8.9, 9.5 and 9.6 use
  the quotient formalism of Layer 6, and §9.6 uses the full-level curve of §5.2. Layer 10 uses
  nothing from Layers 7–9, and they use nothing from Layer 10.
- The order between the two lines is not forced. Layers 5 and 6 are placed before the integral
  theory because they have fewer prerequisites and Layers 8 and 9 use them. Layer 10 is placed
  last because no other layer uses it; it can be built as soon as Layer 6 exists.

Three points of the order are forced and are easy to get wrong.

- The problem `[Γ₀(N)]` on the Drinfeld side is not in §4.4. Its relative representability needs
  the cyclicity theorem of §9.3. That theorem instantiates the Axiomatic Isomorphism Theorem of
  §8.4 with the regularity of `[Γ₁(pⁿ)]` from §8.8. Over `ℤ[1/N]` the naive `[Γ₀(N)]` of §3.2
  suffices, which is why Layers 5, 6 and 10 do not wait for Layer 9.
- The naive structures of §3.2 use the multiplication maps of §2.1 and the finite étale and
  quotient infrastructure of §§0.3, 0.4 and 0.7. They do not use the Drinfeld loci of Layer 4.
- Full-level representability in §5.2 uses the rigidity of §3.3. Its determinant refinement and
  the twisted curve of §5.3 also need the Weil pairing of §2.5.

Two cross-links to other work are recorded here.

- §0.1 and the JacobianChallenge cohomology package meet in §1.3. §2.4 then proves, on Tau Ceti's
  relative Picard functor over an arbitrary base, the representability of its degree-zero part by
  the curve and constructs the Poincaré bundle, which JacobianChallenge provides only over a field.
  It also uses the basic isogeny theory of §2.3.
- The equation-level elliptic-curve theory in Tau Ceti supplies the degree input used by §2.1 and
  the normalisation comparison for the Weil pairing in §2.5, the universal Legendre curve of §3.5,
  the automorphism dichotomy used in §6.4 and Layer 10, the supersingularity criteria of §§7.1 and
  7.3, and the formal group law of §7.2. The broad comparison of isogenies with function-field
  extensions belongs to AlgebraicCurves.

This README is the roadmap. [Suggested.lean](Suggested.lean) is its acceptance test: it states the
headline theorems that are statable against the pinned Mathlib and Tau Ceti, each with `sorry`,
on Tau Ceti's carriers, together with the few definitions those statements need, and its module
docstring names the headline theorems that are not statable at the pins and what each lacks.

## Conventions

1. **Elliptic curves.** An elliptic curve over `S` is Tau Ceti's
   `TauCeti.AlgebraicGeometry.EllipticCurveGeom S` (supplier contracts): a morphism
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
   the references. A further source is cited with its relation to the statement here: the same
   statement, a special case, or a more general one. The order of the layers follows the
   dependencies between the statements, worked backwards from the targets. Statements taken from
   Loeffler's notes rather than directly from KM are identified as such.

8. **Quotients of moduli problems.** The integral Katz–Mazur quotient `P/H`, the objectwise
   orbit presheaf, and a coarse scheme quotient are different objects. The notation `P/H` in
   this roadmap always means the quotient problem characterised by KM 7.1's conditions Q1 and Q2;
   it never means the generally non-sheaf-valued presheaf `T ↦ P(T)/H`.

9. **API hygiene.** The layers say what to prove; three habits keep the proofs cheap, and no
   statement of any layer depends on them. Lemmas asserting that a morphism lies over the base,
   and pullback-leg identities, carry `@[reassoc (attr := simp)]`; constructor-style definitions
   carry `@[simps]`; structures with one data field carry `@[ext]`, so that reassociation chains
   and `pullback.hom_ext` blocks are `simp` calls. A composite that proofs keep spelling out (a
   distinguished geometric point, a chain reading points through a Galois equivalence, a base
   change with identity legs) is a definition with its `@[simp]` naturality lemmas. The recurring
   families of side goals get scoped simp sets, so that each family closes with one call. What the
   layers cite for these composites is Mathlib's own API: `pullback.map` with the non-varying legs
   the identity, for base change along a morphism of second factors; `pullback.lift` for the
   section of `pullback.snd π a` induced by a lift of `a` through `π`; and elementwise composition
   of morphisms of sheaves of modules, which is definitional.

10. **Lean names.** Ring-level statements live in the namespaces Mathlib and Tau Ceti use for
   their carriers (`TauCeti.StrictHenselization`, `WeierstrassCurve`), scheme-level statements about
   elliptic curves in `TauCeti.AlgebraicGeometry.EllipticCurveGeom`, and statements about moduli
   problems in `TauCeti.AlgebraicGeometry.ModuliProblem`; the acceptance file `Suggested.lean`
   states its targets in `TauCetiRoadmap.ModularCurves`. A backticked name of this roadmap's own
   is declared in `Suggested.lean`; a name for an object or statement that `Suggested.lean` does
   not declare is a proposal and is written in prose.

## Layer 0: scheme-theoretic prerequisites

This layer contains the general algebraic geometry used by the later layers: relative effective
Cartier divisors, finite locally free group schemes and Cartier duality, quotients by finite groups
and finite locally free equivalence relations, finite étale schemes, descent, Hom-schemes, the
relative Grassmannian, Katz–Mazur's full sets of sections, and henselisation, regularity and
flatness.

### 0.1 Relative effective Cartier divisors

The sources of this section are KM 1.1.1, 1.2.2 and 1.2.3. Use the general divisor and invertible-sheaf
objects supplied by JacobianChallenge. For a separated smooth relative curve `C ⟶ S` the statements
are the following; items 2, 3, 4, 6 and 7 and parts of items 1 and 5 are Tau Ceti's and are consumed
by name. Separatedness is needed for a section to have closed image; all elliptic-curve
applications satisfy it by properness.

1. Use the shared definition, Tau Ceti's
   `AlgebraicGeometry.Scheme.IdealSheafData.IsRelativeEffectiveCartier`: an effective Cartier
   divisor whose closed subscheme is flat over `S`, with its stability under flat pullback and
   under base change along a pullback square (`IsRelativeEffectiveCartier.comap_of_flat`,
   `IsRelativeEffectiveCartier.comap_of_isPullback`). Do not introduce a second carrier. The fibre
   criterion with the fibres over the points of `S` is Tau Ceti's
   `IdealSheafData.isRelativeEffectiveCartier_iff_forall_isEffectiveCartier_comap_fiberι` (for `C`
   locally noetherian and flat over `S` and `D` flat over `S`), and
   `IdealSheafData.IsEffectiveCartier.comap_fst_of_comap_fiberι` passes from the fibre over a point
   to every field-valued point over it. Prove the criterion in its exact geometric form: if `S` is
   locally noetherian, `C ⟶ S` is flat and locally of finite type, and the closed finitely
   presented subscheme `D ⊆ C` is flat over `S`, then `D` is a relative effective Cartier divisor
   if and only if every geometric fibre is an effective Cartier divisor; the new input is the
   passage from one geometric fibre over `s` to the fibre over `s`, by faithfully flat descent
   along the field extension. Prove the limit/descent version used after spreading out to an
   arbitrary base.
2. A section `P : S ⟶ C` defines the relative effective Cartier divisor `[P]`, of degree one: Tau
   Ceti's `Scheme.Hom.isRelativeEffectiveCartier_ker_of_smoothOfRelativeDimension` and
   `Scheme.Hom.finrank_ker_comp_eq_one_of_comp_eq_id`.
3. Sums preserve relative effective Cartier divisors (Tau Ceti's `TauCeti.isRelativeEffectiveCartier_mul`
   and, for finite sums, `TauCeti.isRelativeEffectiveCartier_prod`); inverse images under flat
   morphisms and arbitrary base change do so by the Tau Ceti lemmas cited in item 1.
4. A relative effective Cartier divisor on `C/S` is finite over `S` exactly when it is proper over
   `S`; in that case it is finite locally free. Thus finiteness is a theorem under a properness
   hypothesis, not part of the definition. This is Tau Ceti's
   `IsRelativeEffectiveCartier.isFinite_iff_isProper` (for `C ⟶ S` locally of finite type of
   relative dimension at most one), with local finite presentation from
   `TauCeti.locallyOfFinitePresentation_subschemeι_comp_of_isEffectiveCartier`.
5. Its degree is the locally constant rank of the resulting finite locally free morphism (Tau
   Ceti's `IsRelativeEffectiveCartier.isLocallyConstant_finrank`), additive in sums
   (`IsRelativeEffectiveCartier.finrank_mul_subschemeι_comp`). Owned here: for a finite flat
   morphism of curves, inverse images multiply degrees.
6. The universal incidence locus `D' ≤ D` and universal equality locus `D' = D`, with their scheme
   structures, universal properties and arbitrary base-change compatibility, are Tau Ceti's
   `IdealSheafData.incidenceLocus` and `IdealSheafData.equalityLocus` with
   `incidenceLocus_le_ker_iff`, `equalityLocus_le_ker_iff`, `comap_incidenceLocus` and
   `comap_equalityLocus`, for closed subschemes with `D` finite locally free over `S`.
7. For a finite locally free divisor on a commutative smooth relative curve, the subgroup
   criterion in terms of the identity, inversion and addition maps is Tau Ceti's
   `TauCeti.GroupScheme.exists_grpObj_isMonHom_iff_ker_le`, for every closed subscheme of a group
   object of `Over S`.
8. **Difference divisors.** If `D' ⊆ D` are relative effective Cartier divisors on `C/S`, the
   effective Cartier divisor `D''` with `D = D' + D''` is again a relative effective Cartier
   divisor; if `D'` and `D` are finite locally free over `S` of degrees `d'` and `d`, then `D''` is
   finite locally free of degree `d − d'` (Stacks Project, Tags 0B8V and 0B9F).

*Needs:* Mathlib's ideal sheaves (`Scheme.IdealSheafData`) and morphism properties (`Flat`,
`IsFinite`, `IsProper`, `LocallyOfFinitePresentation`, `Scheme.Hom.finrank`) and Mathlib's limits of
schemes for the limit version; Tau Ceti
`AlgebraicGeometry.Scheme.IdealSheafData.IsRelativeEffectiveCartier` with
`IsRelativeEffectiveCartier.comap_of_flat`, `IsRelativeEffectiveCartier.comap_of_isPullback` and
the declarations named in items 1–7; JacobianChallenge Layer A (invertible sheaves and the
divisor–line-bundle correspondence).

**Checks.**

- On `C = 𝔸¹_S = Spec 𝒪_S[x]`, the section `x = a` gives `[a] = V(x − a)`, finite locally free of
  degree one. The sum `[a] + [a]` is `V((x − a)²)`, of degree two: the sum of divisors multiplies
  ideal sheaves. A sum defined as the union of closed subschemes would return `[a]`, of degree
  one, and would break the degree formula of item 5.
- Over `S = Spec k[ε]/(ε²)`, the closed subscheme `V(εx)` of `𝔸¹_S` is not an effective Cartier
  divisor, since `εx` is a zero divisor, and its fibre over the point of `S` is all of `𝔸¹_k`. The
  divisors `V(x − ε)` and `V(x)` of the sections `x = ε` and `x = 0` are distinct and have the same
  fibre `V(x)` over the point of `S`: over a nonreduced base a relative effective Cartier divisor
  is not determined by its fibres, which is why item 1 is a criterion for being a divisor and not
  a description of one.

Within this roadmap the section is used by the section-divisor and pole-sheaf constructions of
Layer 1, the Picard and Weil-pairing constructions of Layer 2, all Drinfeld structures of §0.8 and
Layer 4, the first three integral level problems of §4.4, `[Γ₀(N)]` in Layer 9, and the regularity
arguments. What does not use *further* Drinfeld-divisor theory is the naive side: once the common
elliptic-curve and torsion foundations exist, §3.2 and the direct Tate-normal-form construction
can proceed in parallel with §0.8 and §§4.1–4.3. This is not a separate construction of elliptic
curves avoiding §0.1. Full-level representability in §5.2 also uses the rigidity of naive level
structures of §3.3 (Tau Ceti's `ModuliProblem.isRigid_gammaNaive`), which uses no Picard duality.
§5.3 and the determinant refinements additionally use the Weil pairing of §2.5.

**Further sources.** Stacks Project: Tag 062T for the definition and Tag 056Q for base change; Tag
062Y for the fibre criterion, proved there for `C ⟶ S` flat and locally of finite presentation, with
fibres over the points of `S` and no noetherian hypothesis, which is more general than the form of
item 1; Tag 0B8U for sums; Tag 0B9D for a smooth relative curve, where a closed subscheme finite
locally free over the base is a relative effective Cartier divisor and the relative effective
Cartier divisors are the closed subschemes locally quasi-finite, flat and locally of finite
presentation over the base; Tag 0B9E for additivity of the degree; Tags 0B8V and 0B9F for item 8.

### 0.2 Finite locally free group schemes and Cartier duality

The sources of this section are KM §1.12, especially 1.12.4 and 1.12.7, and §§2.5, 2.8, and SGA 3, Exposé
VIIA, §3.3 for Cartier duality. KM 2.8.2 cites the Cartier–Nishi theorem to Oda; the Picard and
Poincaré construction used here is specified in §2.4 rather than left as an unnamed black box. KM
§1.11 (extensions of an étale group) is used in §0.8, in the exact form of 1.11.2–1.11.5.

A morphism is **finite locally free** if and only if it is finite, flat, and locally of finite
presentation (Stacks, Tag 02KB). Over a non-noetherian base the last condition is not implied by
the first two — Stacks, Tag 05LB gives an explicit finite flat morphism which is not of finite
presentation — and it is the hypothesis under which Mathlib's
`AlgebraicGeometry.Scheme.Hom.isLocallyConstant_finrank` applies. Every "finite locally free" carrier of this
roadmap — `TauCeti.AlgebraicGeometry.FiniteFlatCommGroupScheme` and `E[N]`, isogenies, the
generator scheme, the relative representing schemes of the First Main Theorem and of `[Γ₀(N)]`,
the map `[Γ₁(N)] ⟶ [Γ₀(N)]`, and finite étale torsors — carries all three conditions; Tau Ceti
registers them as instances for `FiniteFlatCommGroupScheme` and proves them for `[N]`
(`EllipticCurveGeom.isFinite_mulBy_left`, `flat_mulBy_left`,
`locallyOfFinitePresentation_mulBy_left`) and, through the pullback square `isPullback_torsion`
of the kernel over the zero section, for `E[N]` (supplier contracts). For an isogeny of
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
homomorphism (supplier contracts). Scheme-theoretic kernels of arbitrary homomorphisms of
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

Cartier duality over an affine base `Spec R` is Tau Ceti's (supplier contracts): the
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
Tau Ceti's `FiniteFlatCommGroupScheme.pow_eq_one_of_finrank` (supplier contracts), which
says that for `G` of rank `N` at every point of `S` and every point `x : X ⟶ G` over `S`, the
`N`-th power of `x` in the group of `X`-valued points is the unit; applied to the identity of `G`
it says that `[N]`, the `N`-th power of the identity in the group of endomorphisms, is the trivial
endomorphism. This is the input which turns a Drinfeld point of exact order `N` into an
`N`-torsion section and which makes the factorisation construction of the dual isogeny possible.

*Needs:* §0.3 for the fppf quotient; Mathlib's affine group schemes and Hopf algebras
(`AlgebraicGeometry/Group/Affine.lean`) and `Scheme.Hom.isLocallyConstant_finrank`; Tau Ceti
`TauCeti.AlgebraicGeometry.FiniteFlatCommGroupScheme`, `TauCeti.GroupScheme.isPullback_kernel_scheme`,
`TauCeti.GroupScheme.kernelBaseChangeIso`, `FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDuality`
with `cartierDualDualIso`, `cartierDualBaseChangeIso` and `finrank_cartierDual`,
`ConstantGroup.cartierDualIso`, `DiagonalizableGroup.cartierDualIso` and
`FiniteFlatCommGroupScheme.pow_eq_one_of_finrank`.

**Checks.**

- Over `S = Spec 𝔽_p`, `μ_p = Spec 𝔽_p[x]/(x^p − 1) = Spec 𝔽_p[x]/((x − 1)^p)` has one point, while
  `(ℤ/pℤ)_S` is `p` disjoint copies of `S`: both have rank `p` and they are Cartier dual to each
  other, but they are not isomorphic. Over `ℤ[1/p, ζ_p]` the choice of `ζ_p` identifies them. A
  construction of `μ_N` as the constant group would get the first case wrong.
- The kernel of `[p] : 𝔾_m ⟶ 𝔾_m` over `ℤ` is `μ_p`, finite locally free of rank `p`, while the
  kernel of the homomorphism `𝔾_a ⟶ 𝔾_a`, `x ↦ px`, over `ℤ` is `Spec ℤ[x]/(px)`, whose fibre has
  rank one over `ℚ` and is all of `𝔾_a` over `𝔽_p`: a kernel need not be finite locally free.
- Over `𝔽_p`, `μ_{p²}` has a single geometric point and is killed by its rank `p²` but not by `p`:
  `x^p − 1 = (x − 1)^p` is not zero modulo `(x − 1)^{p²}`. The killing integer comes from the rank,
  and a version read off the group of geometric points, which is trivial here, would be false.

**Further sources.** EGM (3.22)–(3.24) construct the Cartier dual of a commutative finite locally
free group scheme over an arbitrary base, with biduality, equality of ranks, compatibility with base
change and the duality between `ℤ/N` and `μ_N`; EGM (4.46) is the multiplicativity of the rank in
short exact sequences over a connected base. Tate–Oort, §1, is the published proof, over an
arbitrary base, of Deligne's theorem that a commutative finite locally free group scheme of rank `N`
is killed by `N`.

### 0.3 Finite quotients and torsors

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
   Tau Ceti's `TauCeti.ComoduleAlgebra.existsUnique_SpecMap_comp_eq` gives the quotient in schemes
   once faithful flatness and the Galois isomorphism are known; owned here are the criterion that
   supplies them and the fppf statement.
3. **Finite locally free equivalence relations and free actions.** SGA 3, Exposé V, Théorème 4.1 in
   the affine case is Tau Ceti's: if `X` is affine and `R ⇉ X` is an equivalence relation whose two
   projections are finite locally free, then the quotient `X/R` exists, is affine, the map
   `X ⟶ X/R` is finite locally free and surjective, and `R = X ×_{X/R} X`, so that `X/R`
   represents the fppf quotient sheaf (`Scheme.Hom.affineCoequalizerπ` with
   `isKernelPair_affineCoequalizerπ`, its finiteness, flatness, surjectivity and finite-presentation
   instances, and `isColimitFppfYonedaAffineCoequalizerCofork`); and for a free action of a finite
   group on an affine scheme the invariant quotient represents the fppf quotient
   (`AffineInvariantQuotient.existsUnique_fppfYoneda_comp_eq`). Deduce the constant-group case: if a
   finite constant group acts freely on `X` and `X` has a group-invariant affine open cover, glue
   the affine invariant quotients of item 1, whose torsor squares are the affine case, and prove
   that the result represents the fppf quotient. Prove that the affine simultaneous moduli
   schemes used in Layers 3, 5, and 6 satisfy this hypothesis. Without such a cover the fppf
   quotient is generally only an algebraic space, and no unrestricted scheme-quotient theorem is
   asserted. The equivalence-relation form, not only the group form, is used in Layer 3.5, because
   the Legendre rigidifier over `ℤ[1/2]` is finite étale but not Galois.

Develop the finite-flat torsor statements needed for rigidifiers and descent. The quotient of an
elliptic curve by a finite subgroup is constructed only after elliptic curves exist, in §2.2.

*Needs:* §0.2 for the group-scheme statements of item 2; Tau Ceti
`TauCeti.AffineInvariantQuotient.quotient`, `projection`, `existsUnique_desc_of_finite`,
`isFinite_projection_of_finiteType`, `isFinite_projection_of_free`, `etale_projection`,
`isPullback_of_free`, `existsUnique_fppfYoneda_comp_eq`, `Scheme.Hom.affineCoequalizerπ`,
`isKernelPair_affineCoequalizerπ`, `isColimitFppfYonedaAffineCoequalizerCofork` and
`TauCeti.ComoduleAlgebra.existsUnique_SpecMap_comp_eq`; Mathlib's scheme gluing (`Scheme.GlueData`)
and `Scheme.fppfTopology`.

**Checks.**

- `C₂` acting on `Spec ℤ[x]` by `x ↦ −x` has invariant ring `ℤ[x²]` and a finite projection, but
  the action is not free in the sense of item 1: `x − (−x) = 2x` generates a proper ideal, and the
  fixed locus `V(2x)` is the zero section together with the whole fibre over `2`. On
  `ℤ[1/2][x, 1/x]` the element `2x` is a unit, the action is free, and the projection to
  `Spec ℤ[1/2][x², 1/x²]` is finite étale of degree two with the torsor square of item 1. A
  freeness condition read only on the generic fibre would accept the action on `ℤ[x, 1/x]`, which
  is trivial modulo `2`.

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

### 0.4 Finite étale schemes and Galois actions

Develop the finite étale results used by the level structures: for `X ⟶ S` finite étale, the
number of geometric points of the fibre over `s` is the rank of `X` at `s`, hence locally constant
on `S` (over a separably closed field this count is Tau Ceti's
`Scheme.Hom.natCard_eq_finrank_of_etale`, and the rank is locally constant by Mathlib's
`Scheme.Hom.isLocallyConstant_finrank`); a section of a separated étale morphism is an open and closed immersion, so the sections of
a finite étale `S`-scheme over a connected `S` are its open and closed subschemes mapping
isomorphically to `S`; and finite étale schemes and their morphisms descend along the coverings of
§0.5. Cancellation (a morphism between finite étale `S`-schemes is finite and
étale: the instances `FiniteEtaleScheme.isFinite_hom_left` and `FiniteEtaleScheme.etale_hom_left`)
and splitting on an étale neighbourhood of each base point
(`AlgebraicGeometry.Scheme.Hom.exists_split_etaleLocally`, Stacks, Tag 04HN) are Tau Ceti's
(supplier contracts).

Over a field `K` with separable closure `Ω`, the equivalence between finite étale `K`-schemes and
finite continuous `Gal(Ω/K)`-sets is Tau Ceti's `FiniteEtaleScheme.galoisEquivalence K Ω`. It
preserves finite products, and Tau Ceti transports along it group objects with their
homomorphisms (`galoisEquivalenceGrp`), commutative group objects (`galoisEquivalenceCommGrp`) and
bilinear alternating pairings (`galoisEquivalenceAlternatingPairingEquiv`); none of this is
rebuilt here. A group scheme over `Spec K` whose underlying scheme is finite étale enters these
equivalences through `FiniteEtaleScheme.essImage_mapGrp_ι_iff`. This is the input for `V_ρ` in
Layer 5.3.

*Needs:* §0.5 for descent; Mathlib `Etale`, `IsFinite`, `Scheme.Hom.finrank`; Tau Ceti
`Scheme.Hom.natCard_eq_finrank_of_etale`, `TauCeti.FiniteEtaleScheme` with `FiniteEtaleScheme.isFinite_hom_left`,
`FiniteEtaleScheme.etale_hom_left`, `FiniteEtaleScheme.essImage_mapGrp_ι_iff`,
`FiniteEtaleScheme.galoisEquivalence`, `galoisEquivalenceGrp`, `galoisEquivalenceCommGrp`,
`galoisEquivalenceAlternatingPairingEquiv`, and `AlgebraicGeometry.Scheme.Hom.exists_split_etaleLocally`.

**Checks.**

- `Spec ℤ[i] ⟶ Spec ℤ` is finite locally free of rank two, with two geometric points over every
  odd prime and one over `2`, where `𝔽̄₂[x]/(x² + 1) = 𝔽̄₂[x]/((x + 1)²)`: it is not étale at `2`,
  and fibre cardinality equals rank only over `ℤ[1/2]`, where it is étale. The count of geometric
  points needs étaleness, not only finite local freeness.

**Further sources.** EGM (3.26), for group objects: étale group schemes over a field correspond to
groups with a continuous action of the Galois group.

### 0.5 Effective descent and spreading out

Effective faithfully flat descent, with cocycle and uniqueness statements, is used below in the
following forms. The following are Tau Ceti's and Mathlib's (supplier contracts) and are not
reproved:

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
equality over a nonreduced base. The elliptic application using `𝒪_E(3[0])` is §1.5, after that
line bundle has been constructed.

*Needs:* §0.2 for the group-scheme cases; Mathlib `Scheme.fpqcTopology` with its subcanonicity and
effective-epimorphism instances, and Mathlib's limits of schemes and finite presentation; Tau Ceti
`TauCeti.DescentDatum`, `TauCeti.sectionDescentEquiv`, `TauCeti.homDescentEquiv`,
`DescentDatum.baseChangeHomEquiv`, `DescentDatum.descended`,
`DescentDatum.isIso_toBaseChangeDescended_hom`, `DescentDatum.isPullback_toDescended`,
`DescentDatum.exists_isAffine_baseChange_hom_isIso`,
`DescentDatum.exists_finiteLocallyFree_baseChange_hom_isIso`,
`DescentDatum.isClosedImmersion_descended_hom` and
`TauCeti.Algebra.DescentDatum.isPullback_proj_map_descendedGradedVal`.

**Further sources.** Stacks Project, Tag 0CCJ: along a surjective finite locally free morphism, a
descent datum on a scheme which carries an ample invertible sheaf is effective. The covering there
is finite locally free and not an arbitrary fpqc covering, so this is a different hypothesis from
the polarised statement used here; it applies to the finite locally free coverings of Layer 3.5.

### 0.6 Hom-schemes and closed loci

Construct the representable Hom functors used in Layers 0.8 and 4. The required general result is the
finite-locally-free Weil-restriction case: if `Z ⟶ S` is finite locally free and `X ⟶ Z` is affine
of finite presentation, the functor `T ↦ Hom_Z(Z ×_S T, X)` on `S`-schemes is represented by an
`S`-scheme which is affine and of finite presentation over `S`. Conrad, *Reductive group schemes*,
Lemma 2.1.3, is the case `X = Z ×_S Y` with `Y` affine of finite presentation over `S`, where the
functor is `T ↦ Hom_T(Z_T, Y_T)`, together with the statement for homomorphisms of group schemes;
the construction in its proof, which writes a `Z`-morphism in the structure constants of a local
basis of `𝒪_Z` over `𝒪_S`, applies to every `X` affine of finite presentation over `Z`. Over an
affine base the construction is Tau Ceti's: `TauCeti.Algebra.WeilRestriction` of a finitely
presented algebra along a finite projective algebra, with its universal property
`WeilRestriction.homEquiv`, its finite presentation and its base change
`WeilRestriction.baseChangeAlgEquiv`, and `TauCeti.Bialgebra.HomAlgebra` for homomorphisms of
group schemes; the closed loci are cut out over an arbitrary base by
`IdealSheafData.weilRestriction` with `weilRestriction_le_ker_iff`. Owned here is the construction
over a non-affine `S` by gluing these along affine opens. The three special cases below are of the
form covered by that lemma. Deduce the special cases representing:

- tuples of sections of a finite locally free `S`-scheme;
- homomorphisms between finite locally free group schemes;
- the ambient schemes in which the full-set, exact-order, and full-level loci are cut out.

Prove compatibility with arbitrary base change.

**Checks.**

- For `Z = S ⊔ S` and `X = 𝔸¹_Z` the functor is `T ↦ 𝒪(T)²`, represented by `𝔸²_S`; a construction
  which returned `X` itself, or `𝔸¹_S`, has forgotten the rank of `Z`.
- For `S = Spec k`, `Z = Spec k[ε]/(ε²)` and `X = 𝔾_{m,Z}` the functor is
  `T ↦ (𝒪(T)[ε]/(ε²))ˣ`, represented by `𝔾_m × 𝔾_a` through `a + bε ↦ (a, b/a)`: the result has
  dimension two and is not `X ×_Z S = 𝔾_m`.
- For `Z = ∅`, of rank zero, the functor has one point on every `T` and is represented by `S`;
  for `Z = S` it is represented by `X`.

*Needs:* §0.2 for the group-scheme case; Tau Ceti `TauCeti.Algebra.WeilRestriction` with
`WeilRestriction.homEquiv` and `WeilRestriction.baseChangeAlgEquiv`, `TauCeti.Bialgebra.HomAlgebra`,
`IdealSheafData.weilRestriction`; Mathlib `Functor.RepresentableBy`, `IsAffineHom`,
`LocallyOfFinitePresentation` and scheme gluing.

### 0.7 Parameter spaces for subgroup schemes

Weil restriction represents maps from a fixed finite locally free source; it does not parameterise
all subgroup schemes. This block owns the relative Grassmannian of a finite locally free
`𝒪_S`-module `E` on a scheme `S`: the functor sending `T → S` to the set of locally free rank-`N`
quotients of `E_T` modulo quotient isomorphism. Mathlib supplies the module-valued functor
`Module.Grassmannian.functor` on affine bases. Tau Ceti supplies the affine case, over
`S = Spec R` for a module `M` (supplier contracts): the scheme
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
free, `Grass_1(F) ≅ Proj_S(Sym F)`, Tau Ceti's relative `Proj` `CategoryTheory.CommMon.relativeProj`
(with `relativeProjToBase` and its twisting sheaves `relativeProjTwistingSheaf`) applied to Tau
Ceti's graded symmetric algebra `TauCeti.AlgebraicGeometry.gradedSymmetricAlgebra F`, generated in
degree one by `F`. Prove here that formation of `Proj_S(Sym F)` commutes with arbitrary base change:
over an affine base this is Tau Ceti's `AlgebraicGeometry.Proj.isPullback_symmetricAlgebra_baseChange`,
and the charts of the relative `Proj` are compatible with restriction by
`CommMon.isLocalization_gradedSections_basicOpen` and `CommMon.isBaseChange_restrictGradedSections`.
Prove that the pullback of `F` to `Proj_S(Sym F)` mapping onto `𝒪(1)` is the universal rank-one
quotient, and that the identification and its `𝒪(1)` comparison commute with arbitrary base
change. Then construct the Plücker map `Grass_N(E) → Grass_1(∧^N E) = P(∧^N E)` classifying the
universal exterior-power quotient `∧^N E_T → det Q` (Tau Ceti's exterior powers of finite locally
free sheaves, of rank `C(n, N)` by `FiniteLocallyFreeSheaf.rank_exteriorPower_apply`, and its
determinant `FiniteLocallyFreeSheaf.det` with the pullback comparison
`FiniteLocallyFreeSheaf.pullbackDetIso`), and prove that it is a closed immersion whose
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
owned here are the gluing over `S`, the compatibility of the scheme with base change (its
ring-level ingredient is Tau Ceti's `Module.Grassmannian.hopfIdealLocus_map`), and the
projectivity. The resulting parameter scheme is
projective and finitely presented over `S`, with the stated universal subgroup. It is not asserted
to be finite: for example, rank-`p` subgroup schemes of `α_p²` form a positive-dimensional family. The elliptic specialisation `G = E[N]` and the name
`[N-Isog]` occur only in Layer 9, after `E[N]` exists.

*Needs:* §0.2 (finite locally free group schemes and Hopf algebras, closed-locus equations);
Mathlib's `Module.Grassmannian.functor`, exterior algebra, scheme gluing and morphism properties;
Tau Ceti `Module.Grassmannian.scheme` with the declarations named above,
`Module.Grassmannian.hopfIdealLocus_map`, `CategoryTheory.CommMon.relativeProj`,
`TauCeti.AlgebraicGeometry.gradedSymmetricAlgebra`, `AlgebraicGeometry.Proj.isPullback_symmetricAlgebra_baseChange`,
`FiniteLocallyFreeSheaf.det` and `FiniteLocallyFreeSheaf.pullbackDetIso`. Weil restriction in §0.6
is a separate parameter-space construction, not an input to the Grassmannian.

### 0.8 Full sets, `A`-structures, and generators

The sources of this section are KM 1.6.2, 1.8.2, 1.8.4, 1.9.1, 1.10.14–1.10.15 and §1.11.

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
and arbitrary base-change compatibility. Over an affine base `S = Spec A`, for `Z = Spec B` with `B`
finite over `A`, these are Tau Ceti's: the definition `TauCeti.IsFullSetOfSections`, tested on the
base changes with free algebra, with `isFullSetOfSections_iff_charpoly` (KM 1.8.2),
`isFullSetOfSections_iff_norm_eq_prod` (the universal-polynomial reduction, for `B` free),
`isFullSetOfSections_baseChange_iff` (base change, and descent along injective maps),
`IsFullSetOfSections.of_localizationSpan` (Zariski locality), `isFullSetOfSections_liftEquiv_comp_iff`
(the full-set locus) and `isFullSetOfSections_pi_iff` (KM 1.8.4). Owned here: the notion over a
non-affine base, fppf locality, and the gluing below.

Using Layer 0.6, construct the ambient Hom-scheme, the universal family of sections, and the closed
subscheme cut out by the norm or characteristic-polynomial identities. Prove independence of an
affine presentation, gluing, and the universal property (KM 1.9.1 and 1.10.13(1); KM 1.6.2 cuts
out the *`A`-structure* locus by the subgroup condition 1.3.7, and is the right citation for the
exact-order locus of Layer 4.1 rather than for this one).

For a finite abelian group `A`, define an `A`-structure on a finite locally free commutative group
scheme `G` and an `A`-generator in the sense of KM Chapter 1. Construct their representing loci and
prove the statements below. Over an affine base, `A`-generators are Tau Ceti's `TauCeti.IsAGenerator`,
with base change `isAGenerator_baseChange_iff` and the representing locus
`quotientGeneratorIdealHomEquivAGenerators` for a free Hopf algebra; owned here are
`A`-structures, the generator scheme over a non-affine base, and the following:

- arbitrary base change and fppf descent;
- the subgroup-divisor criterion;
- the extension results of KM §1.11, in their exact generality. Let `0 → G₁ → G → G₂ → 0` be
  a short exact sequence of finite locally free commutative group schemes of ranks `N₁, N, N₂`,
  and `0 → A₁ → A → A₂ → 0` a short exact sequence of finite abelian groups of the same orders,
  with compatible homomorphisms `φ₁, φ, φ₂` to the `S`-points.
  - **KM 1.11.3**, arbitrary base: if `φ₁` is an `A₁`-generator of `G₁` and `φ₂` is an
    `A₂`-generator of `G₂`, then `φ` is an `A`-generator of `G`. This is transitivity of the
    norm; over an affine base it is Tau Ceti's `IsAGenerator.of_isShortExact`, and the arbitrary
    base follows by Zariski locality.
  - **KM 1.11.2**, the criterion: if `S` is connected and `G₂` is **finite étale**, then for
    `φ : A → G(S)` with kernel `K` of the composite `A → G₂(S)`, `φ` is an `A`-generator of `G`
    if and only if `|K|` is the rank of `G₁` and `φ|K` is a `K`-generator of `G₁`, and `|A/K|` is
    the rank of `G₂` and the induced `A/K → G₂(S)` is an `A/K`-generator of `G₂`.
  - **KM 1.11.4–1.11.5**, the converse of 1.11.3 is false in general: over an `𝔽_p`-algebra
    `R`, for `ζ ∈ μ_p(R)`, the map `ℤ/p ⊕ ℤ/p → μ_{p²}`, `(a,b) ↦ ζ^a`, is a generator of
    `μ_{p²}` while `a ↦ ζ^a` need not be a generator of `μ_p` (take `R = 𝔽_p[X]/(X^p − 1)`,
    `ζ = X`); the product examples with `α_p × α_p` and `μ_p × μ_p` show that neither
    end need be a generator when the middle is. The `μ_{p²}` example is Tau Ceti's
    (`RootsOfUnityGroup.isAGenerator_comp_fst`, `RootsOfUnityGroup.exists_not_isAGenerator`) and is
    kept as a regression test; no unrestricted equivalence is stated.
- product decompositions for factors of coprime order (KM 1.10.14–1.10.15), whose group-scheme part,
  `G ≅ G[m] × G[n]` for `G` of rank `mn` with `m` and `n` coprime, is Tau Ceti's
  `FiniteFlatCommGroupScheme.isIso_tensorHom_torsionι_comp_mul`;
- factorisation into the prime-primary parts of `A`;
- the corresponding decomposition of full sets of sections and generator schemes.

This general finite-abelian-group package is the prime-power reduction used in Layer 8; the roadmap
does not replace it by four unrelated factorisation arguments.

*Needs:* §§0.1, 0.6; Mathlib `Algebra.norm`, `LinearMap.charpoly`; Tau Ceti `TauCeti.IsFullSetOfSections`
with the declarations named above, `TauCeti.IsAGenerator`, `IsAGenerator.of_isShortExact`,
`RootsOfUnityGroup.exists_not_isAGenerator` and `FiniteFlatCommGroupScheme.isIso_tensorHom_torsionι_comp_mul`.

**Checks.**

- For `Z = S ⊔ S` (rank two) the two inclusions `s₁, s₂` form a full set: a function `f = (f₁, f₂)`
  has norm `f₁f₂ = s₁^*(f) · s₂^*(f)`. The pair `(s₁, s₁)` does not: it gives `f₁²`, which differs
  from `f₁f₂` already for `f = (1, 0)`.
- For `Z = Spec k[x]/(x(x − 1)²)` over a field `k` of characteristic `≠ 2`, of rank three with the
  two sections `x = 0` and `x = 1`, the triple `(0, 1, 1)` is a full set and `(0, 0, 1)` is not: for
  `f = x + 1` the norm is `1 · 2 · 2 = 4`, while `(0, 0, 1)` gives `1 · 1 · 2 = 2`. Both triples meet
  both points, so a definition asking only that the sections cover `Z` pointwise would accept both;
  the full set records the multiplicities of the divisor `[0] + 2[1]`.
- For `Z = Spec k[x]/(x^p)` the only section is `x = 0`, and the `p`-tuple `(0, …, 0)` is a full set:
  multiplication by `f` is triangular with diagonal `f(0)`, so `Norm(f) = f(0)^p`.

**Further sources.** Conrad, Lemma 2.3.1, states the mechanism of KM 1.11.2 for a short exact
sequence of finite locally free commutative group schemes of constant rank with étale quotient;
constant rank takes the place of connectedness of the base. Česnavičius, Definition 4.2.2 and Remark
4.2.3: the definition of an `A`-structure for subgroups of the smooth locus of a generalized
elliptic curve, and the statement that it is an isomorphism of the constant group onto a subgroup
when the order of `A` is invertible.

### 0.9 Henselisation, regularity, and flatness

This section owns the general scheme-level API on local rings, regularity, and flatness that the
roadmap uses:

- strict henselisation, strictly henselian local rings, the recognition of henselisations, the
  maps out of them and their uniqueness, and completion of strict henselisations (the paragraph
  *Strict henselisation* below);
- comparison of a finite moduli scheme after strict henselisation and completion (used in
  Layer 8.2);
- regular schemes in terms of regular local rings and Krull dimension at a point: Tau Ceti's
  `TauCeti.AlgebraicGeometry.IsRegular` and `TauCeti.AlgebraicGeometry.IsRegularOfDim`;
- preservation and reflection of regularity and dimension under completion of noetherian local
  rings, which are Tau Ceti's (`TauCeti.AdicCompletion.ringKrullDim_eq`, Stacks, Tag 07NV;
  `TauCeti.AdicCompletion.isRegularLocalRing_iff`, Stacks, Tag 07NY; the supplier contracts)
  and are consumed, not restated;
- locality and invariance under isomorphism and étale morphisms, whose étale invariance is Tau
  Ceti's `Scheme.Hom.isRegularLocalRing_stalk_iff_of_etale` and
  `Scheme.Hom.isRegularOfDim_iff_of_etale_of_surjective`;
- openness of the regular locus for schemes locally of finite type over an excellent base,
  as in the finite-type integral rigidifiers of Layer 3.5; openness of the flat locus for the
  finite algebras over locally noetherian bases occurring in the proofs of Layer 8. State and verify
  these hypotheses; there is no unrestricted regular-locus openness theorem (Tau Ceti's
  `TauCeti.Excellence.regularLocus` is the locus, with no openness statement);
- the coherent kernel/cokernel support argument used in the homogeneity argument of Layer 8.3;
- miracle flatness for finite morphisms between regular local schemes of equal dimension, which
  follows from Tau Ceti's `Scheme.Hom.flat_stalkMap_of_isCohenMacaulay_of_quasiFiniteAt` (a
  quasi-finite point with Cohen–Macaulay source, regular target and equal dimensions is flat) and
  `TauCeti.IsRegularLocalRing.isCohenMacaulay`;
- descent of regularity and the corrected dimension condition along the finite faithfully flat
  covers occurring in KM's Notes Added in Proof, from Tau Ceti's
  `TauCeti.AlgebraicGeometry.IsRegular.of_flat_of_surjective` and
  `Scheme.Hom.topologicalKrullDim_opens_eq_of_flat_of_surjective` (which need the cover locally
  quasi-finite, as a finite cover is);
- local constancy of the rank of a finite locally free morphism, and constancy when the
  target is connected. Over arbitrary bases, keep the local finite-presentation hypothesis
  from Layer 0.2; finite and flat alone does not supply it.

**Strict henselisation.** The construction is Tau Ceti's `TauCeti.StrictHenselization.algebra R Ω`
(supplier contracts); `Suggested.lean` states the targets below that Tau Ceti does not prove,
except the colimit at a prime, the completion clauses and normality, which are specified here
only. Let `(R, 𝔪, κ)` be a local ring and `Ω` a separable closure of `κ` (Mathlib
`IsSepClosure κ Ω`, an `R`-algebra through `R → κ`). The construction is the filtered colimit of
étale neighbourhoods of Stacks, Tag 04GW, pointed by an `R`-algebra map to `Ω`. The henselisation
`R^h` of the local ring `R` is Tau Ceti's `TauCeti.Henselization.algebra (maximalIdeal R)`
(supplier contracts), the henselisation of the pair `(R, 𝔪)` as the colimit of the étale
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
  not, since with `of_isSepClosed` it would close a cycle of instances; a Tau Ceti statement that
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
- The properties of Stacks, Tag 04GP, in Tau Ceti: `henselianLocalRing`, `isLocalRing`,
  `isLocalHom_algebraMap`, the filtered-colimit description (`neighbourhood_isFiltered`, `algebra`,
  and its consequence `exists_stage_eq`), `maximalIdeal_eq_map` (`𝔪 R^{sh}` is the maximal ideal),
  and `ker_toTarget_eq_maximalIdeal` with `toTarget_surjective` (`R^{sh}/𝔪 R^{sh} = Ω` over `R`).
  The one part of clause (2) not in Tau Ceti is the target
  `isSepClosed_residueField_strictHenselization`: the residue field of `R^{sh}` is separably
  closed, which follows from the last two through the isomorphism `R^{sh}/𝔪 R^{sh} ≅ Ω` and
  `IsSepClosed Ω`. Clause (1) of Tag 04GP, the local map `R^h → R^{sh}`, is Tau Ceti's
  `fromHenselization`.
- The **universal property** `existsUnique_lift` (Stacks, Tag 08HQ applied to each stage), in the
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
  The clause of Tag 06LJ that `R` is Noetherian iff `R^h` is, is Tau Ceti's
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
  Tau Ceti's `henselianLocalRing` and `toTarget_surjective`; the second is
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
  `Ω ≅ κ` over `R`, `R → R^{sh}` is an isomorphism (Tau Ceti's `algEquivOfResidueFieldEquiv`),
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

*Needs:* §0.2 for the rank statement; Mathlib `IsRegularLocalRing`, `AdicCompletion`,
`HenselianLocalRing`; Tau Ceti `TauCeti.AlgebraicGeometry.IsRegular`, `IsRegularOfDim`,
`Scheme.Hom.isRegularLocalRing_stalk_iff_of_etale`, `Scheme.Hom.flat_stalkMap_of_isCohenMacaulay_of_quasiFiniteAt`,
`TauCeti.IsRegularLocalRing.isCohenMacaulay`, `TauCeti.AlgebraicGeometry.IsRegular.of_flat_of_surjective`,
`TauCeti.HenselianLocalRing.comp_bijective` (the étale-retraction ingredient of Stacks 04GG) and the
strict-henselisation carriers named above. Nothing outside Layer 0 is used.

### Examples

- On `C = 𝔸¹_S`, the section divisors `[a]` and the sums `[a] + [b] = V((x − a)(x − b))` are
  relative effective Cartier divisors of degrees one and two (§0.1).
- `μ_N = D_S(ℤ/Nℤ)` and `(ℤ/Nℤ)_S` are Cartier dual over every base, and isomorphic over
  `ℤ[1/N, ζ_N]` but not over `𝔽_p` for `p ∣ N` (§0.2).
- The free action of `C₂` on `Spec ℤ[1/2][x, 1/x]` by `x ↦ −x` has the finite étale quotient
  `Spec ℤ[1/2][x², 1/x²]`, a `C₂`-torsor (§0.3).
- For `R = ℤ_(p)`, the strict henselisation is a discrete valuation ring with residue field an
  algebraic closure of `𝔽_p` and uniformizer `p`, and it is not complete (§0.9).

### Dependencies

Mathlib's schemes, morphism properties, ideal sheaves, affine group schemes, descent, the fpqc
topology and the commutative algebra of regular and henselian local rings; Tau Ceti's relative
effective Cartier divisors, finite locally free group schemes, Cartier duality over an affine
base, affine invariant quotients and the affine equivalence-relation quotient, finite étale
schemes, descent, Weil restriction, the affine Grassmannian, relative `Proj`, full sets of sections
and `A`-generators over an affine base, regular schemes and the henselisation and strict
henselisation of a local ring; JacobianChallenge Layer A for §0.1. No other layer of this roadmap
is used.

## Layer 1: elliptic curves over a base scheme

The sources of this layer are KM 2.1 and 2.2 and Deligne–Rapoport II.1. It builds the theory of elliptic
curves over an arbitrary base that the moduli problems presuppose: the projective Weierstrass
models, their points, the pole sheaves `𝒪_E(n[0])` and the Weierstrass presentation, the group
law, and descent of elliptic curves.

### 1.1 Projective Weierstrass models

For `W : WeierstrassCurve R`, Tau Ceti's `WeierstrassCurve.projModel` is the projective cubic

```text
Y²Z + a₁XYZ + a₃YZ² = X³ + a₂X²Z + a₄XZ² + a₆Z³
```

as the `Proj` of its homogeneous coordinate ring, with structure morphism `projModelOver` and
zero section `projModelZero` at `[0:1:0]`; properness, smoothness of relative dimension one when
`W.IsElliptic`, integrality over a domain, and the pointed isomorphism induced by a
`VariableChange` are in the library (supplier contracts), and so is its compatibility with
arbitrary base change along `Spec R' ⟶ Spec R`: `WeierstrassCurve.isPullback_projModelBaseChange`
makes the projective model of `W.map f` the base change of that of `W`, with
`projModelOverBaseChangeIso` in `Over (Spec R')` and `isPullback_projModelZero_projModelBaseChange`
for the zero sections.

`EllipticCurveGeom S`, with the pointed local-Weierstrass condition of Convention 1, is Tau
Ceti's (supplier contracts). Its atlas field and the quantifier form of Convention 1 agree
in both directions (`nonempty_pointedWeierstrassAtlas_iff`): an atlas yields, at every point, an
affine open, an elliptic equation over its coordinate ring and a pointed isomorphism over it,
comparing the chart's pullback square with Mathlib's chosen `pullback`; and a choice of such data
at every point assembles an atlas. Base change `EllipticCurveGeom.baseChange`, its pullback
square `isPullback_baseChange` and its functoriality `baseChangeMap_id`, `baseChangeMap_comp` are
in the library as well. This section therefore states no target of its own: its carriers are
consumed as they stand by the rest of the roadmap, and Convention 1 is read on them.

*Needs:* Tau Ceti `WeierstrassCurve.projModel`, `projModelOver`, `projModelZero`,
`isProper_projModelOver`, `smoothOfRelativeDimension_one_projModelOver`, `isIntegral_projModel`,
`projModelVariableChangeIso`, `isPullback_projModelBaseChange`,
`TauCeti.AlgebraicGeometry.EllipticCurveGeom` with `nonempty_pointedWeierstrassAtlas_iff`,
`EllipticCurveGeom.baseChange`, `isPullback_baseChange`, `baseChangeMap_id` and
`baseChangeMap_comp`; Mathlib `Proj`, `WeierstrassCurve`.

### 1.2 The points dictionary

The comparison with equation-level points is stated in stages.

1. Over a field and under `W.IsElliptic`, sections of `projModel W ⟶ Spec K` are equivalent to
   `W.toAffine.Point`, with infinity corresponding to the zero section: this is Tau Ceti's
   `WeierstrassCurve.projModelPointsEquiv`, and `toEllipticCurveGeomPointsMulEquiv` makes it an
   isomorphism of groups for the scheme-theoretic group law of §1.4. Owned here is its naturality
   in the field: for a field extension `K ⟶ L`, base change of sections corresponds to the map
   `W.toAffine.Point ⟶ (W.map (algebraMap K L)).toAffine.Point`.
2. Over a local ring, the sections are the classes of unimodular solutions of the projective
   Weierstrass equation: Tau Ceti's `WeierstrassCurve.projModelPointsEquivUnimodular`, with no
   ellipticity hypothesis.
3. Over a ring with trivial Picard group, use the same description after proving triviality of the
   relevant line bundle.
4. For an arbitrary base `T`, describe a `T`-point by a line bundle with three generating sections,
   satisfying the cubic equation, modulo the usual isomorphism, and prove the dictionary by Zariski
   descent.

No theorem identifies an arbitrary `T`-point with one global unimodular triple.

*Needs:* §1.1; §0.5 for the Zariski descent of item 4; Tau Ceti
`WeierstrassCurve.projModelPointsEquiv`, `WeierstrassCurve.projModelPointsEquivUnimodular` and
`WeierstrassCurve.toEllipticCurveGeomPointsMulEquiv`; Mathlib `WeierstrassCurve.Affine.Point`,
`WeierstrassCurve.Projective`.

**Checks.**

- Without ellipticity, `W.toAffine.Point` omits the singular affine points: for `y² = x³` over
  `𝔽₅` the projective cubic has six rational points (cubing is a bijection of `𝔽₅`, so each `y`
  has exactly one `x`, and the point at infinity is added), while `W.toAffine.Point` has five,
  the singular point `(0, 0)` being left out. A dictionary for a singular model must use its full
  point set or restrict the scheme side to its smooth locus.

### 1.3 Pole sheaves, Weierstrass coordinates, and variable changes

The sources of this section are KM 2.1–2.2. The relative effective Cartier divisor `[0]` and its multiples are
Tau Ceti's: on a projective model, `WeierstrassCurve.zeroSectionDivisor` with
`isRelativeEffectiveCartier_zeroSectionDivisor`, `isRelativeEffectiveCartier_zeroSectionDivisor_pow`
and the base-change identities `zeroSectionDivisor_map` and `zeroSectionDivisor_pow_map`; on an
elliptic curve `E/S`, `n[0]` is `EllipticCurveGeom.pointsDivisor` of the family taking the value
`0` with multiplicity `n`, a relative effective Cartier divisor by
`isRelativeEffectiveCartier_pointsDivisor`, of degree `n` by `finrank_pointsDivisor`. Construct the
line bundles

```text
ℒ_n = 𝒪_E(n[0]).
```

Use fibrewise Riemann–Roch and Serre duality, followed by Grauert's theorem and cohomology and base
change, to prove for `n>0` (the local freeness and the ranks are the input of Loeffler, Proposition
3.3.2, for `n ≤ 5`)

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
unit. This constructs a pointed Weierstrass equation rather than assuming one (KM 2.2.5–2.2.6; Loeffler,
Proposition 3.3.2, whose sketch lists the bases of `π_*𝒪_E(n[0])` for `n ≤ 5` used below).

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

The Weierstrass variable-change group

```text
x = u²x' + r,
y = u³y' + su²x' + t,
```

with its multiplication, inverse, action on the five coefficients and the transformation law of the
equation, is Mathlib's `WeierstrassCurve.VariableChange` with its `Group` and `MulAction`
instances. Owned here: its action on the coordinates `x`, `y` of the projective model and on the
invariant differential: the differentials `ω = dx/(2y + a₁x + a₃)` of the old equation and `ω'` of
the new one satisfy `ω = u⁻¹ω'`. The classification theorem which is needed before any gluing argument,

> Every pointed isomorphism between projective Weierstrass models over the same base is induced by
> a unique variable change,

is Tau Ceti's: over an affine base `WeierstrassCurve.existsUnique_eq_eqToHom_comp_projModelVariableChangeIso_hom`,
and over an arbitrary base `S`, for equations with coefficients in `Γ(S, ⊤)`,
`WeierstrassCurve.existsUnique_hom_comp_eq_comp_projModelVariableChangeIso_hom`, proved by descent
from the affine opens with uniqueness on overlaps. Over a field this is AEC III.3.1(b); over a base
it is part of KM 2.2.5–2.2.6. Using it, prove that the bases and multiplication maps above are
independent of the chosen pointed equation.

Finally prove the Weierstrass-presentation theorem: a smooth proper relative genus-one curve with a
section is Zariski-locally on the base pointed-isomorphic to a projective Weierstrass model
(KM 2.2.5–2.2.6; Deligne–Rapoport II.1.1). This is
the theorem later used to show that a quotient `E/C` again satisfies the local-model condition.

*Needs:* §§0.1, 0.5, 1.1–1.2; JacobianChallenge Layer A (invertible sheaves and divisors), §B.4
(Riemann–Roch and Serre duality on a curve over a field) and §§C.1–C.2 (higher direct images,
cohomology and base change, Grauert's theorem); Mathlib `WeierstrassCurve.VariableChange`; Tau Ceti
`WeierstrassCurve.zeroSectionDivisor`, `isRelativeEffectiveCartier_zeroSectionDivisor_pow`,
`zeroSectionDivisor_pow_map`, `EllipticCurveGeom.pointsDivisor`,
`isRelativeEffectiveCartier_pointsDivisor`, `existsUnique_eq_eqToHom_comp_projModelVariableChangeIso_hom`
and `existsUnique_hom_comp_eq_comp_projModelVariableChangeIso_hom`.

**Checks.**

- On `y² = x³ + ax + b`, `x` has a pole of order two and `y` of order three along `[0]`. The seven
  monomials `1, x, y, x², xy, x³, y²` have pole order at most six, while `π_*𝒪_E(6[0])` has rank
  six, so they satisfy exactly one relation, the Weierstrass equation. A rank `n + 1`, the
  genus-zero count, would leave no relation in pole order six.
- The automorphism `[−1]` of the projective model of `W` is induced by the variable change
  `(u, r, s, t) = (−1, 0, −a₁, −a₃)`: it fixes all five coefficients, sends `(x, y)` to
  `(x, −y − a₁x − a₃)` and `ω` to `−ω`. The change `(−1, 0, 0, 0)` would replace `a₁, a₃` by
  `−a₁, −a₃` and is an isomorphism onto a different model unless `a₁ = a₃ = 0`. The classification
  is of isomorphisms, so an automorphism of the pointed curve is a variable change fixing `W`, an
  element of Tau Ceti's `WeierstrassCurve.autGroup`.

**Further sources.** Loeffler, Proposition 3.3.2: an elliptic curve over a scheme has a Weierstrass
equation Zariski-locally on the base, determined by a local basis of `π_*Ω¹_{E/S}`; the same
statement as the presentation theorem, proved there in outline, with the local freeness of the
sheaves `π_*𝒪_E(n[0])` taken from the cohomology of the fibres. AEC III.3.1(a) and (b): over a
field, the Weierstrass equation from the Riemann–Roch spaces of `n[0]`, and the variable changes
between two such equations; the special case of a field of both theorems.

### 1.4 The scheme-theoretic group law

Construct the group law on the projective Weierstrass model by the following chart calculation.

1. Give a finite open cover of `E ×_S E` on which the addition formulae are regular.
2. Define the formula on each chart and prove that every pair lies in at least one chart.
3. Prove equality of the formulae as scheme morphisms on every overlap, including over nonreduced
   bases; equality on field-valued points is not sufficient.
4. Glue the chart morphisms, using the pointed-isomorphism classification of Layer 1.3 to compare
   different Weierstrass charts, and prove compatibility with arbitrary base change.
5. Construct the identity and inverse and prove associativity, commutativity, and the inverse laws.
6. Prove agreement with Mathlib's pointwise group law on every field-valued fibre.

Steps 1–5 are Tau Ceti's: it glues the addition morphisms of the projective models over a
pointed atlas to `EllipticCurveGeom.addition` and the negations to `neg`, proves the group axioms
on the points of every chart, and registers the result as the instances `EllipticCurveGeom.grpObj`
and `isCommMonObj` on `Over.mk E.structureMap`, with unit the zero section (`one_left`), so that
`E.toCommGrp` is the curve as a commutative group object (supplier contracts). Step 6 is
owned here, for every elliptic curve `E/S` and every point `Spec K ⟶ S` with values in a field:
the group of `K`-points of `E` is identified, as a group, with `W.toAffine.Point` for any elliptic
Weierstrass equation `W` of the fibre over `K`. For the curve of an equation this is Tau Ceti's
`WeierstrassCurve.toEllipticCurveGeomPointsMulEquiv`; a general fibre is such a curve by
`EllipticCurveGeom.exists_iso_toEllipticCurveGeom` (an elliptic curve over a local ring is globally
Weierstrass), and the identification is independent of `W` by the classification of §1.3.
Uniqueness among all compatible group structures follows in §2.4 from the theorem that pointed
morphisms are automatically homomorphisms.

*Needs:* §§0.5, 1.1–1.3; Tau Ceti `EllipticCurveGeom.addition`, `EllipticCurveGeom.neg`,
`EllipticCurveGeom.grpObj`, `EllipticCurveGeom.isCommMonObj`, `EllipticCurveGeom.toCommGrp`,
`WeierstrassCurve.toEllipticCurveGeomPointsMulEquiv`, `EllipticCurveGeom.exists_iso_toEllipticCurveGeom`,
`EllipticCurveGeom.pointsBaseChangeEquiv`; Mathlib `WeierstrassCurve.Affine.Point` with its
`AddCommGroup` instance.

**Checks.**

- On `y² + y = x³ − x` over `ℚ` (conductor `37`), the chord through `(0, 0)` and `(1, 0)` meets the
  curve again at `(−1, 0)`, so `(0, 0) + (1, 0) = −(−1, 0) = (−1, −1)`; step 6 asks the scheme
  morphism `addition` to give this sum on `ℚ`-points. A sign slip in the negation, `(x, y) ↦ (x, −y)`
  instead of `(x, −y − 1)`, would give `(−1, 0)`, which is not the sum.

**Further sources.** Over a field, EGM (1.14) and (1.15): a morphism of abelian varieties is a
homomorphism followed by a translation, and the group structure with a given identity is unique and
commutative. Stacks Project, Tag 0BFD, is the commutativity.

### 1.5 The cubic polarisation and elliptic descent

The unit `𝒪_T ⟶ (π_T)_*𝒪_{E_T}` is an isomorphism for every `T ⟶ S`: this is Tau Ceti's
`EllipticCurveGeom.isIso_structureMap_app` (for every open `U` of the base, `Γ(U, 𝒪) ≅ Γ(π⁻¹U, 𝒪)`)
applied to the base change `E_T`, itself an elliptic curve over `T`. Prove that `𝒪_E(3[0])` is
relatively ample and commutes with arbitrary base change.

Apply the polarised-projective descent theorem of Layer 0.5 to descend an elliptic curve together
with this polarisation and its zero section. Then descend the group law and its axioms, finite
locally free subgroup schemes, Cartier-divisor equalities, and level structures. Prove the same
statements for the universal elliptic curve in a rigidifier construction. This is the elliptic
application of the general descent machinery, not an assumption in Layer 0.5.

*Needs:* §§0.1, 0.5, 1.1–1.4; Tau Ceti `EllipticCurveGeom.isIso_structureMap_app`,
`EllipticCurveGeom.baseChange` and `TauCeti.AlgebraicGeometry.LineBundleClass.IsAmple` (ampleness on
a scheme, used on the fibres); JacobianChallenge Layer A for `𝒪_E(3[0])`.

**Further sources.** Stacks Project, Tag 0E62(a): for a proper flat morphism `f : X ⟶ S` of finite
presentation with `H⁰(X_s, 𝒪) = κ(s)` at every point `s`, the unit `𝒪_S ⟶ f_*𝒪_X` is an
isomorphism, and remains one after every base change. This is the first statement, more generally;
its fibre hypothesis holds here because every fibre is a smooth projective Weierstrass cubic over
a field, hence geometrically integral. Stacks Project, Tag 0D3D: for a proper morphism and an
invertible sheaf, the locus of the base over which the sheaf is relatively ample is open and its
formation commutes with base change. It reduces the relative ampleness of `𝒪_E(3[0])` to the
fibres, where a divisor of degree three on a curve of genus one is ample.

### Examples

- The projective model of an elliptic Weierstrass equation is proper and smooth of relative
  dimension one, and its field-valued sections agree with the equation-level point group (§§1.1,
  1.2, 1.4).
- `y² + y = x³ − x` over `ℤ[1/37]` is an elliptic curve over `Spec ℤ[1/37]` (its discriminant is
  `37`); its base change to `Spec 𝔽₂` is `y² + y = x³ + x`, which has `5` rational points.
- `𝒪_E(3[0])` embeds every fibre as a plane cubic: on the projective model, `1, x, y` are the basis
  of `π_*𝒪_E(3[0])` of §1.3 and give the closed immersion into `ℙ²`.

### Dependencies

Layer 0 (§§0.1 and 0.5); JacobianChallenge Layers A–C for line bundles, curve cohomology and
cohomology and base change (§1.3); Tau Ceti's projective Weierstrass models, `EllipticCurveGeom`
with its group law, base change, global sections and the classification of pointed isomorphisms;
Mathlib's `Proj`, Weierstrass curves and variable changes.

## Layer 2: isogenies, duality, and the Weil pairing

The sources of this layer are KM 2.3.1, 2.5.1, 2.6.1–2.6.3 and §2.8. It builds the homomorphisms of elliptic
curves over a base, quotients by finite locally free subgroups, the two constructions of the dual
isogeny and their comparison, Cartier–Nishi duality with the Weil pairing, and the degree and trace
of endomorphisms.

### 2.1 Group homomorphisms, multiplication maps, and their degree

`Hom_S(E,E')` means from the outset homomorphisms of commutative group schemes over `S`: Tau
Ceti's `E.toCommGrp ⟶ E'.toCommGrp` (supplier contracts), an abelian group, with `End_S(E)`
its endomorphism ring and multiplication by an integer `n` the endomorphism
`(n : End E.toCommGrp)`, whose underlying morphism of `Over S` is `E.mulBy n`
(`intCast_hom_hom_hom`). A bare pointed scheme morphism is not silently coerced to this type. The
theorem that every pointed morphism is automatically a group homomorphism is §2.4, where the
relative Picard machinery used to prove it exists.

KM 2.3.1 is Tau Ceti's for every integer `n ≠ 0`, over every base (supplier contracts):
`EllipticCurveGeom.mulBy n`, the `n`-th power of the identity in the group of endomorphisms of
`Over.mk E.structureMap` and the underlying morphism of `(n : End E.toCommGrp)`, with
`isFinite_mulBy_left`, `flat_mulBy_left`, `locallyOfFinitePresentation_mulBy_left`,
`surjective_mulBy_left` and `finrank_mulBy_left` (rank `n²`), packaged as `isIsogeny_intCast` and
`degree_intCast`; `E.torsion n`, the kernel of `[n]` (`torsion_eq_kernel`) and the fibre of `[n]`
over the zero section (`isPullback_torsion`), finite locally free of rank `n²`
(`finrank_torsion_hom`) and étale exactly when `n` is nonzero in every residue field of `S`
(`etale_torsion_hom_iff`); and the inclusions `torsionInclusion m n : E[m] ⟶ E[mn]` with the
multiplication maps `torsionMulBy m n : E[mn] ⟶ E[n]`, resting on the composition law `mulBy_mul`
(`[m n] = [n] ≫ [m]`). Its route, which later layers reuse, is: construct `[N]` compatibly with
base change; on every geometric fibre compare it with the equation-level multiplication map, so
that it is nonconstant and quasi-finite, hence finite, being proper; compute the field-level degree
`N²`; deduce that every geometric fibre has length `N²`, so that `[N]` is surjective; prove
flatness; and compute the differential of `[N]` at the identity, which makes `[N]` and `E[N]` étale
where `N` is invertible. The degree bridge is Tau Ceti's as well:
`WeierstrassCurve.projModelFunctionFieldEquiv` identifies the function field of `projModel W` over
a domain with `W.toAffine.FunctionField`, `projModelFunctionFieldEquiv_mulByFunctionFieldPullback`
identifies the pullback of rational functions along `[n]` with the equation-level `fieldPullback`
of `TauCeti.Isogeny.mulByIntIsogenyOfNeZero`, `finrank_fieldRange_mulByFunctionFieldPullback` gives
`[K(E) : [n]^* K(E)] = n²` from `TauCeti.Isogeny.degree_mulByIntIsogenyOfNeZero` (including the
inseparable cases), and `finrank_projModelMulBy` reads off the rank `n²` of `[n]` over a field.

Owned here is the curve-flatness lemma in its general form: a finite morphism between `S`-smooth
relative curves whose geometric fibres all have the same length is finite locally free. Derive it
from the local criterion for flatness after noetherian approximation, with Tau Ceti's fibrewise
criterion `Scheme.Hom.flat_of_flat_pullback_fiberι` (a finite morphism `X ⟶ Y` over `S`, locally
of finite presentation, with `X` flat over `S`, is flat when it is flat on every fibre over `S`);
later layers apply it to isogenies. The broad comparison between arbitrary isogenies and function-field
embeddings belongs to AlgebraicCurves.

The geometric-point statement is Tau Ceti's: over a separably closed field `K` in which `N` is
invertible, a homomorphism `(ℤ/Nℤ)² →* E(K)` is injective exactly when its image is `E[N](K)`
(`isFiberwiseInjective_iff_range_eq_ker`), and such a homomorphism exists
(`exists_isFiberwiseInjective`), so `E[N](K) ≅ (ℤ/Nℤ)²`. It is never used in residue characteristic
dividing `N`. The locally constant degree of an isogeny and the constant-degree predicate of
Convention 3 are Tau Ceti's `TauCeti.GroupScheme.degree` (locally constant by
`TauCeti.GroupScheme.isLocallyConstant_degree`, multiplicative by `degree_comp`) and
`TauCeti.GroupScheme.IsogenyOfDegree`.

*Needs:* §§0.5, 1.1–1.5 for the curve-flatness lemma; Tau Ceti `EllipticCurveGeom.toCommGrp`,
`EllipticCurveGeom.mulBy`, `EllipticCurveGeom.torsion` and the declarations named above,
`Scheme.Hom.flat_of_flat_pullback_fiberι`, `TauCeti.GroupScheme.degree`,
`TauCeti.GroupScheme.IsogenyOfDegree`; Mathlib's local criterion for flatness and limits of
schemes.

**Checks.**

- Over `𝔽₂`, `E: y² + y = x³` has `E[2](𝔽̄₂) = 0`: the partial derivative in `y` is `1`, so no point
  of order two exists, yet `E[2]` has rank `4`; and `E[3](𝔽̄₂) ≅ (ℤ/3ℤ)²`, with `(0, 0)` of order
  three. A definition of `E[N]` by its geometric points would have rank `1` at `N = 2` here.
- On that curve `[2]` is not étale and `[3]` is, `3` being a unit in `𝔽₂`, as `etale_torsion_hom_iff`
  says. For the elliptic curve `y² + y = x³ − x` over `ℤ[1/37]`, `E[2]` is étale exactly over
  `ℤ[1/74]`, although the curve has good reduction at `2`: étaleness of `E[N]` is about `N` being
  invertible, not about reduction.

**Further sources.** Over a field and in every dimension `g`, Stacks Project, Tag 0BFG, and EGM
(5.9): multiplication by `d` on an abelian variety is finite locally free of degree `d^{2g}`.
Česnavičius, Proposition 2.2.9: a homomorphism of generalized elliptic curves over an arbitrary base
is, Zariski-locally on the base, an isogeny or zero.

### 2.2 Isogenies and quotients

An isogeny is a finite locally free surjective homomorphism of elliptic curves: Tau Ceti's
`EllipticCurveGeom.IsIsogeny`, characterised by `EllipticCurveGeom.isIsogeny_iff` (finite, flat and
surjective; local finite presentation is automatic). For a finite locally free subgroup scheme
`C ⊆ E`, construct the quotient by the following fixed route.

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
kernel and that `E/ker φ ⟶ E'` is an isomorphism; the input is Tau Ceti's
`TauCeti.GroupScheme.isColimitKernelCofork`, which makes a quasi-compact, flat and surjective
homomorphism the cokernel of its scheme-theoretic kernel in the category of group objects.

*Needs:* §§0.1–0.3, 0.5, 1.3–1.5, 2.1; Tau Ceti `EllipticCurveGeom.IsIsogeny`,
`EllipticCurveGeom.isIsogeny_iff`, `TauCeti.GroupScheme.isColimitKernelCofork`,
`TauCeti.AffineInvariantQuotient.quotient`; JacobianChallenge Layer A for the norm of invertible
sheaves and §§C.1–C.2 for the fibrewise genus.

**Checks.**

- For `C = E[N]`, `N ≥ 1`, the quotient is `E` itself with `q_C = [N]`: `[N]` is finite, flat and
  surjective with kernel `E[N]`, so by the cokernel property it is the quotient map. A quotient
  construction that ignored `C` would return `q_C = 1`, with kernel `0`.
- For `C = 0` the quotient is `E` and `q_C` the identity; for `E: y² + y = x³` over a field of
  characteristic `≠ 3` and `C` the subgroup generated by the point `(0, 0)` of order three, `E/C`
  is an elliptic curve with a `3`-isogeny from `E`, of degree `3 = rank C`.

**Further sources.** Česnavičius, Theorem 2.2.4, constructs the quotient of a generalized elliptic
curve by a finite locally free subgroup of its smooth locus over an arbitrary base and proves that
it commutes with base change; Corollary 2.2.7 there gives the universal property of the quotient,
the identification of a surjective homomorphism with the quotient by its kernel, and successive
quotients. This is more general than the elliptic case treated here. EGM (4.39) is the quotient of a
group scheme by a finite locally free subgroup over a locally noetherian base; over a field, EGM
(5.2), (5.3) and (4.40).

### 2.3 The factorisation dual

Let the isogeny `φ : E ⟶ E'` have constant degree `n`. By §0.2, `ker φ`, which has rank `n`, is
killed by `n`, so `[n]_E` factors uniquely through `φ`; this defines

```text
φ̂_fac : E' ⟶ E,
```

with `φ̂_fac ∘ φ = [n]_E` and, by fpqc cancellation along the surjective `φ`, `φ ∘ φ̂_fac = [n]_{E'}`.
The construction and the two identities, with the source and target of each displayed, are Tau
Ceti's for every locally finitely presented isogeny of commutative group schemes of constant degree
(supplier contracts): `TauCeti.GroupScheme.factorisationDual`, `comp_factorisationDual`
(`φ ≫ φ̂_fac = [n]` on the source), `factorisationDual_comp` (`φ̂_fac ≫ φ = [n]` on the target) and
the uniqueness `eq_factorisationDual`. It uses the cokernel property of `φ`, not the quotient
`E/ker φ` of §2.2. Owned here: `φ̂_fac` is an isogeny of degree `n`, its formation commutes with
arbitrary base change, `(φ̂_fac)^_fac = φ`, `[m]^_fac = [m]` and `([m] ∘ φ)^_fac = φ̂_fac ∘ [m]`, and
`(ψ ∘ φ)^_fac = φ̂_fac ∘ ψ̂_fac` for isogenies of constant degree.

*Needs:* §0.2 and Convention 3; Tau Ceti `TauCeti.GroupScheme.factorisationDual`,
`comp_factorisationDual`, `factorisationDual_comp`, `eq_factorisationDual`,
`TauCeti.GroupScheme.IsogenyOfDegree`, `TauCeti.GroupScheme.degree_comp`.

**Checks.**

- For `φ = [m]`, of constant degree `m²`, uniqueness gives `φ̂_fac = [m]`, since `[m] ∘ [m] = [m²]`:
  the dual of `[m]` has degree `m²`, as the degree statement requires (`m² · m² = deg [m²]`), and a
  dual defined by factoring multiplication by `m` instead of by the degree would give the identity.
- In characteristic `p`, the relative Frobenius `F : E ⟶ E^{(p)}` has degree `p` and dual the
  Verschiebung `V` of §7.1, with `V ∘ F = [p]`; on a supersingular curve both are purely
  inseparable, on an ordinary one `V` is étale.

**Further sources.** Over a field and in every dimension, EGM (5.12), by the same factorisation of
multiplication by the degree.

### 2.4 Picard duality and comparison of the duals

Construct the relative genus-one Picard package needed here rather than assuming the field-valued
Jacobian endpoint in arbitrary families. For an elliptic curve `E/S`, write `π = E.structureMap`:

1. the fppf Picard functor, the sheafification of `T ↦ Pic(E_T)/Pic(T)`, and its zero-rigidified
   version are Tau Ceti's `relativePicardFppfSheaf π`, `relativePicardPresheaf π` and
   `rigidifiedPicardFunctor π E.zero E.zero_comp` with `rigidifiedPicardFunctorIso` (supplier
   contracts), consumed as they stand;
2. prove that `π` is `GeometricallyConnected`: the fibre over a field-valued point `Spec K ⟶ S` is
   an elliptic curve over `K` (`EllipticCurveGeom.baseChange`), which by its pointed Weierstrass
   atlas over the one-point base is the projective model of an elliptic Weierstrass curve over
   `K`, integral by `WeierstrassCurve.isIntegral_projModel` and therefore connected; Tau Ceti's
   `WeierstrassCurve.geometricallyIntegral_projModelOver` gives the same over every field
   extension at once. The atlas is
   what the argument uses: a disjoint union of two elliptic curves over `K`, pointed in one of
   them, is smooth and proper of relative dimension one with a section, and is not geometrically
   connected. The degree-zero subfunctor defined by fibrewise degree and its fppf sheafification
   are then Tau Ceti's `relativePicardDegreeZeroSubfunctor π` and
   `relativePicardDegreeZeroFppfSheaf π`. Prove that the degree-zero part is open and closed: for a
   line bundle on `E_T`, the set of points of `T` at which its fibre degree vanishes is open and
   closed in `T`, the fibre degree `χ(L_t) − χ(𝒪_t)` being locally constant in the flat proper
   family `E_T ⟶ T` (JacobianChallenge §§C.1–C.2);
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

*Needs:* §§0.1, 0.5, 1.3–1.4, 2.3; Tau Ceti `relativePicardPresheaf`, `rigidifiedPicardFunctor`,
`rigidifiedPicardFunctorIso`, `relativePicardFppfSheaf`, `relativePicardDegreeZeroSubfunctor`,
`relativePicardDegreeZeroFppfSheaf`, `relativePicardDegreeZeroFppfSheafι`,
`abelJacobiMapToPicZeroFppf`, `EllipticCurveGeom.baseChange`, `WeierstrassCurve.isIntegral_projModel`,
`WeierstrassCurve.geometricallyIntegral_projModelOver`, `EllipticCurveGeom.hom_ext_left`; Mathlib
`AlgebraicGeometry.GeometricallyConnected`; JacobianChallenge Layer A (invertible sheaves), Layer B
and §§C.1–C.2 (coherent cohomology, cohomology and base change).

**Checks.**

- The normalisation of the Poincaré bundle is forced: restricting
  `L = L₀ ⊗ pr₁^*(i₁^*L₀)⁻¹ ⊗ pr₂^*(i₂^*L₀)⁻¹ ⊗ π^*(c^*L₀)` along `i₁` gives
  `i₁^*L₀ ⊗ (i₁^*L₀)⁻¹ ⊗ π_E^*(c^*L₀)⁻¹ ⊗ π_E^*(c^*L₀)`, trivial, because `pr₂ ∘ i₁` is the zero
  section composed with `π_E` and `i₂ ∘ 0 = c`; without the last factor the restriction would be
  `π_E^*(c^*L₀)⁻¹`, which is nontrivial when the Hodge line is.
- With `t_P(Q) = Q + P`, `t_{−P}^*𝒪_E([0]) = 𝒪_E([P])`, since `t_{−P}` sends `P` to `0`; so
  `λ_E(P) = 𝒪_E([P] − [0])`. The opposite convention `t_P^*𝒪_E([0])` gives `𝒪_E([−P] − [0])` and
  the map `P ↦ λ_E(−P)`, the negative of `λ_E`.
- Over a field `K`, on `K`-points `λ_E` is Tau Ceti's `WeierstrassCurve.pointAddEquivPicZero`,
  `P ↦ 𝒪(P − O)` from `W.toAffine.Point` to `Pic⁰` of the projective model: a relative statement
  whose `K`-points disagreed with it would have the wrong sign or the wrong base point.

**Further sources.** Over a field, EGM (6.1), (6.18) and (7.9) for the Picard functor, the dual
abelian variety and biduality, and EGM (1.12) and (1.14) for the rigidity lemma and the homomorphism
property of pointed morphisms.

### 2.5 Cartier–Nishi duality and the Weil pairing

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

*Needs:* §§0.1, 0.2, 2.4; for item 8, Tau Ceti `TauCeti.Isogeny.weilPairing`,
`TauCeti.Isogeny.weilPairing_self`, `TauCeti.Isogeny.weilPairing_nondegenerate` and the points
dictionary `WeierstrassCurve.toEllipticCurveGeomTorsionPointsMulEquiv`.

**Checks.**

- Alternation is not skew-symmetry: on `(ℤ/2ℤ)²` the pairing `((a, b), (c, d)) ↦ (−1)^(ac + bd)` with
  values in `μ₂` is bilinear and skew-symmetric, every value being its own inverse, but sends
  `((1, 0), (1, 0))` to `−1`. This is why item 5 is a separate milestone proved by the diagonal
  argument and not deduced from item 4.
- For a basis `(P, Q)` of `E[2]` over an algebraically closed field of characteristic `≠ 2`,
  `e₂(P, Q) = −1`: an alternating perfect pairing on `(ℤ/2ℤ)²` with values in `μ₂` is nontrivial
  on a basis. The swapped basis `(Q, P)` has determinant `−1` in item 7, giving `e₂(P, Q)⁻¹`.
- Over `𝔽_p` with `E` supersingular, `E[p](𝔽̄_p) = 0`, so `e_p` is trivial on geometric points
  while it is a perfect pairing of finite locally free group schemes of rank `p²`: perfection is
  a scheme-theoretic statement, as item 6 says.

**Further sources.** Oda, Theorem 1.1 and Corollary 1.3, proves the duality between the kernel of an
isogeny and the kernel of the dual isogeny for abelian schemes of every dimension over an arbitrary
base, which is more general. EGM (7.4) isolates, over a base, the statement about torsors behind it.
Over a field, EGM (11.11) defines the pairings, which are perfect and bilinear by their construction
from (7.5), and (11.12) describes them explicitly; (11.17) and (11.21) give the compatibilities with
the transpose and with composition, and (11.22) the alternation for a polarisation; the sign
convention of (11.17) is to be compared with the one fixed here.

### 2.6 Endomorphism degree and trace

Define degree as a locally constant natural-number-valued function and trace as a locally constant
integer-valued function on the base. Over a preconnected base, identify them with integers, cast
the degree to `ℤ` in the endomorphism ring, and prove

```text
α̂ = [tr α] - α,
α² - [tr α]α + [deg α] = 0,
(tr α)² ≤ 4 deg α
```

in the precise forms of KM 2.6.2–2.6.3. On isogenies the degree is Tau Ceti's
`TauCeti.GroupScheme.degree`; the degree of an arbitrary endomorphism extends it by `0` on the open
and closed part of the base where the endomorphism vanishes.

*Needs:* §§0.5, 2.1–2.4; Tau Ceti `TauCeti.GroupScheme.degree`, `isLocallyConstant_degree`. The
characteristic-polynomial identity uses the general Picard dual of §2.4; the Weil pairing of §2.5 is
not needed.

**Checks.**

- For `α = [n]`, `tr α = 2n` and `deg α = n²`, so `α̂ = [2n] − [n] = [n]` and the inequality is an
  equality; a trace normalised as `n` would give `α̂ = 0`.
- For the Frobenius `π` of `y² = x³ − x` over `𝔽₃`, which has `4 = 3 + 1 − tr π` rational points,
  `tr π = 0` and `deg π = 3`, so `π² + 3 = 0` and `0 ≤ 12`. For `y² + y = x³ + x` over `𝔽₂`, with
  `5` rational points, `tr π = −2`, `π² + 2π + 2 = 0` and `4 ≤ 8`.

**Further sources.** Over a field and in every dimension, EGM (12.15), (12.16) and (12.19)–(12.21)
for the degree as a polynomial function on endomorphisms and for the characteristic polynomial, and
EGM (12.26) for the positivity of the Rosati involution, from which the inequality
`(tr α)² ≤ 4 deg α` follows in dimension one.

### Examples

- For `[NeZero N]`, `E[N]` has finite-flat rank `N²`; if `N` is invertible over an algebraically
  closed field, its geometric points form `(ℤ/Nℤ)²` (§2.1).
- The Picard dual and the quotient-factorisation dual of an isogeny agree, and their kernel pairing
  gives the scheme-theoretically perfect Weil pairing (§§2.3–2.5).
- On a supersingular elliptic curve in characteristic `p`, `E[p]` has rank `p²` and no nonzero
  geometric point, and `e_p` is perfect on it (§2.5).
- For the curve `y² = x³ − x` over `𝔽₃`, the Frobenius endomorphism has trace `0` and degree `3`,
  and `π̂ = −π` (§2.6).

### Dependencies

Layer 0 (§§0.1–0.3, 0.5) and Layer 1. Tau Ceti: the group law and `toCommGrp`, multiplication maps,
torsion and its étale locus, the degree of homomorphisms of group schemes, isogenies, the
factorisation dual and the cokernel property, the relative Picard functor with its degree-zero part
and Abel–Jacobi map, and the equation-level degree of `[n]` and Weil pairing. JacobianChallenge
Layers A–C for line bundles and cohomology.

## Layer 3: moduli problems for elliptic curves

The sources of this layer are KM 4.2, 4.6.2, 4.7.0, Corollary 4.7.2 and 4.12, with the rigidifier families of
KM 2.2.9–2.2.11; KM 2.3.1 and 2.7.1–2.7.4 for naive level structures and their rigidity; SGA 3,
Exposé V, Théorème 4.1; and Loeffler 3.7.4.

This layer contains what can be said about moduli problems before any Drinfeld structure is
defined: the carrier, the naive level structures, which exist where the level is invertible, their
rigidity, and the representability of rigid problems.

### 3.1 Moduli problems over `Ell/R`

The category fibred in groupoids `Ell/R` is Tau Ceti's: over an `R`-scheme `T`, its objects are
elliptic curves over `T` and its arrows are cartesian pointed morphisms; every arrow is strongly
cartesian (`EllObj.isStronglyCartesian`), the forgetful functor to schemes over `R` is a fibred
category (`EllObj.isFibered_forget`), and an arrow is an isomorphism exactly when its morphism of
bases is (`EllObj.isIso_iff_isIso_base`), so that the fibres are groupoids. An elliptic curve with
additional structure is first a groupoid-valued pseudofunctor on `Ell/R`. Construct its presheaf of
isomorphism classes and, where necessary, its fppf sheafification.

Define representability, relative representability, affine, finite, flat, and étale properties over
`Ell/R`. Define rigidity as triviality of automorphisms of an object with structure. Only after
rigidity is proved pass to the corresponding set-valued moduli problem. This is not a general
theory of algebraic stacks; it is the bookkeeping needed for descent and quotient problems.

Tau Ceti carries the set-valued side (supplier contracts): the objects `EllObj (Spec R)`
and cartesian pointed arrows `EllObj.Hom` of `Ell/R` with its category instance,
`ModuliProblem (Spec R)`, relative-representability data `ModuliProblem.RelRepData` (a scheme
`rep X` over the base of every `X = (E/S)` representing the fibre `T ↦ 𝒫(E_T/T)` on schemes over
`S`, the functor of KM 4.2, with the representing bijections `representableBy`), the properties
`RelRepData.HasProperty`, rigidity `ModuliProblem.IsRigid`, and representability by an object,
Mathlib's `Functor.RepresentableBy`. `Suggested.lean` adds only the bundled representable étale
surjective rigidifiers `EtaleRigidifier` of §3.6.

*Needs:* Layer 1 and §0.5 for the fppf sheafification; Tau Ceti `TauCeti.AlgebraicGeometry.EllObj`,
`EllObj.Hom`, `EllObj.isFibered_forget`, `EllObj.isStronglyCartesian`, `EllObj.isIso_iff_isIso_base`,
`TauCeti.AlgebraicGeometry.ModuliProblem`, `ModuliProblem.RelRepData`, `RelRepData.HasProperty`,
`ModuliProblem.IsRigid`; Mathlib `Functor.RepresentableBy`, `Scheme.fppfTopology`.

**Checks.**

- The trivial problem `[Γ(1)]` is relatively representable, by the base itself, and not rigid:
  `[−1]` is an automorphism of every elliptic curve over a nonempty base and is not the identity,
  since on a fibre over a field it fixes only `E[2]`. By Tau Ceti's
  `ModuliProblem.isRigid_of_representableBy`, a representable problem is rigid, so `[Γ(1)]` is not
  representable; this is why the passage to a set-valued problem comes after rigidity.

**Further sources.** Conrad, Theorem 3.1.2: the isomorphism functor of two generalized elliptic
curves is a quasi-finite separated scheme of finite presentation over the base, the representability
of the diagonal which lies behind relative representability. Conrad, §2.4, and Česnavičius, §4.1.2,
express level problems as stacks with a forgetful morphism to the stack of elliptic curves, in place
of functors on `Ell/R`; Česnavičius, Proposition 6.3, is a dictionary between the two languages.

### 3.2 Naive level structures

Over a base on which `N` is invertible, `E[N]` is finite étale (KM 2.3.1), so the definitions
below use no Drinfeld divisor condition and are independent of Layers 0.8 and 4. The rigidifiers
of Layer 3.5 and the fine curves of Layers 5.1–5.2 are built on these naive problems alone.

Two of the three naive problems are Tau Ceti's (supplier contracts), defined over every base `B`,
and they are the naive structures of KM where `N` is invertible on `B`:

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
  in `E[p](k)`, which has at most `p` points: the naive `[Γ(N)]` problem is empty over `𝔽_p`, the
  Drinfeld problem of §4.2 is not. The naive `[Γ₁(p)]` problem is not empty over `𝔽_p`: an
  ordinary curve over `𝔽̄_p` has points of order `p`. It is empty on a supersingular curve, where
  `E[p](𝔽̄_p) = 0`, so it is neither finite étale nor of constant rank over `Ell/𝔽_p`.
- For `N = 2`, `[−1]` fixes every naive structure, so neither naive problem is rigid; rigidity
  (Layer 3.3) begins at `N = 3` for `[Γ(N)]` and at `N = 4` for `[Γ₁(N)]`.

*Needs:* §§0.3–0.4, 0.7, 2.1; Tau Ceti `ModuliProblem.gammaNaive`, `gammaOneNaive`,
`gammaNaiveAction`, `gammaNaiveToGammaOneNaive`, `gammaNaiveRelRepData`, `gammaOneNaiveRelRepData`
with their `hasProperty_etale_…`, `hasProperty_isFinite_…` and `hasProperty_surjective_…`,
`eq_one_of_gammaNaiveAction_hom_app_eq_self`, `EllipticCurveGeom.IsFiberwiseInjective` and
`isFiberwiseInjective_iff_range_eq_ker`. There is no dependency on §0.8 or Layer 4.

### 3.3 Rigidity of naive level structures

The naive-level rigidity results of KM 2.7.1–2.7.4 are at
the pin (supplier contracts), over every base and with no noetherian or reducedness
hypothesis: an automorphism of `E/S` fixing the zero section and two sections `φ a`, `φ b` of a
fibrewise-injective homomorphism `φ : A →* E(S)` with `a² ≠ 1`, `b ≠ 1` and `b ≠ a^{±1}` is the
identity (`IsFiberwiseInjective.eq_id_of_isPullback`: it fixes the three points `φ a`, `−φ a`
and `φ b`, distinct in every fibre), so the naive `A`-structures are rigid for every such `A`
(`isRigid_naiveLevel`), in particular naive full level for `N≥3` (`isRigid_gammaNaive`, KM
2.7.2) and naive `[Γ₁(N)]` for `N≥4` (`isRigid_gammaOneNaive`, the semi-Borel case). Owned here
is the corresponding statement for the fixed-pairing frames of `Y(ρ)` (Layer 5.3), deduced from
these through the morphism of moduli problems that forgets the frame, to the naive full-level
problem (`IsRigid.of_hom`: a problem mapping to a rigid problem is rigid). Rigidity of a naive
quotient `[Γ(N)]/H` is not deduced this way: the quotient receives a morphism from `[Γ(N)]`
rather than mapping to it, and it is rigid only for suitable `H` (for `H = GL₂(ℤ/Nℤ)` it is
`[Γ(1)]`, which is not rigid); the criterion is §6.2's.

**Checks.**

- The bounds are sharp: `[−1]` fixes every naive `[Γ(2)]`-structure, and on `Y² + Y = X³` over
  a field containing a primitive cube root of unity `ζ` the automorphism `(X, Y) ↦ (ζX, Y)`
  fixes the point `(0, 0)` of order `3`, so naive `[Γ₁(3)]` is not rigid; a rigidity statement
  with the bound `N ≥ 2` or `N ≥ 3` for `[Γ₁(N)]` would be false.
- Rigidity holds over a nonreduced base, for example `Spec k[ε]/(ε²)`: an automorphism of a
  constant curve `E_k[ε]` fixing a basis of `E[N]` for `N ≥ 3` is the identity, although the
  fibrewise criterion alone sees only its reduction.

Do not extend this assertion to the integral Drinfeld structures of §4.2. If `E` is supersingular
over `𝔽̄_p`, the pair `(0, 0)` is a Drinfeld `[Γ(p)]`-structure, and `[−1]` fixes it; thus integral
full-level rigidity is false even when `p ≥ 3`.

*Needs:* §§2.1, 3.1, 3.2; Tau Ceti `IsFiberwiseInjective.eq_id_of_isPullback`,
`ModuliProblem.isRigid_naiveLevel`, `isRigid_gammaNaive`, `isRigid_gammaOneNaive` and
`ModuliProblem.IsRigid.of_hom`. The pinned proof compares an automorphism with the identity on
three sections distinct in every fibre; it uses neither the endomorphism identities of §2.6 nor the
Picard dual of §2.4.

**Further sources.** Conrad, Lemma 3.1.8 and Theorem 4.2.1(2), for generalized elliptic curves: the
automorphism scheme of a curve with level structure over an algebraically closed field is finite,
and the compactified stack has trivial automorphism groups once a divisor `d ≥ 3` of `N` is inverted
for `Γ(N)`, respectively a divisor `d ≥ 5` for `Γ₁(N)`. The second threshold is that of the
compactified problem and differs from the bound `N ≥ 4` for elliptic curves used here.

### 3.4 The Weierstrass presentation

Let

```text
W_R = Spec R[a₁,a₂,a₃,a₄,a₆,Δ⁻¹].
```

Use the variable-change group and the pointed-isomorphism classification of §1.3. Form the action
groupoid of `VariableChange` on `W_R` and prove that it presents the groupoid of elliptic curves:

- the Weierstrass-presentation theorem of §1.3 gives an effective Zariski atlas on objects;
- the unique-variable-change theorem identifies the arrows on every overlap;
- the group laws of Mathlib's `WeierstrassCurve.VariableChange` give the cocycle and groupoid laws;
- the curve, zero section, invariant differential, and additional structure descend;
- the presentation and the descent equivalence commute with arbitrary base change.

These statements are the precise substitute, in this roadmap, for saying that the Weierstrass
scheme presents the moduli stack. This section packages the theorems of §1.3 for the moduli
formalism; it does not re-prove the classification needed to construct the group law.

*Needs:* §§0.5, 1.3–1.5, 3.1; Mathlib `WeierstrassCurve.VariableChange` and its `MulAction` on
`WeierstrassCurve`; Tau Ceti `WeierstrassCurve.existsUnique_hom_comp_eq_comp_projModelVariableChangeIso_hom`.

**Checks.**

- The stabiliser of a point `W` of `W_R` in the action groupoid is the automorphism group of the
  curve: for `y² = x³ + x` over `ℚ(i)` it is `{u ∈ μ₄}` acting by `(x, y) ↦ (u²x, u³y)`, of order
  four, and for a curve with `j ≠ 0, 1728` over a domain it is `{±1}` (Tau Ceti's
  `WeierstrassCurve.eq_one_or_eq_negVariableChange_of_smul_eq`). A presentation by the action of
  the subgroup `u = 1` only would make every curve rigid and could not present `[−1]`.

**Further sources.** Loeffler, Proposition 3.3.2: an elliptic curve over a scheme `S` has a
Weierstrass equation Zariski-locally on `S`, determined over an open subscheme by a basis of
`π_*Ω¹_{E/S}` there; this is the atlas on objects. AEC III.3.1(b): over a field, two systems of
Weierstrass coordinates of the same pointed curve differ by a change of variables
`x = u²x' + r`, `y = u³y' + su²x' + t`; this is the statement on arrows over a field, a special
case of the classification theorem of Layer 1.3, which is over an arbitrary base and includes
uniqueness.

### 3.5 Rigidifiers and KM 4.7.0

Carry out Katz–Mazur's rigidifier construction in the following definite form.

1. Over `ℤ[1/2]`, construct the Legendre problem of KM 2.2.9 and 4.6.2: pairs `(φ₂, ω)` of a
   basis `φ₂ : (ℤ/2ℤ)² ≅ E[2]` and a nowhere-vanishing differential `ω` such that the
   `ω`-adapted coordinate normalised by `x(P₂)=0` satisfies `x(Q₂)=1`. Prove that it is
   representable by `Spec ℤ[1/2][λ, 1/λ(λ-1)]` with the universal curve
   `y²=x(x-1)(x-λ)`, and that for every `E/S` the scheme of Legendre structures is finite étale
   of degree `12` over `S[1/2]`: it is the `μ₂`-torsor of square roots of `x(Q₂)-x(P₂)` over the
   `GL₂(𝔽₂)`-torsor of level-two bases. The statement about equations is Tau Ceti's (supplier
   contracts): by `WeierstrassCurve.UniversalLegendre.existsUnique_legendre`, an elliptic
   Weierstrass curve over a ring with two points at which `ψ₂` vanishes and a unit `u` with
   `x₂ − x₁ = u²` is carried to the base change of the universal Legendre curve by exactly one
   ring homomorphism out of `ℤ[1/2][λ, 1/λ(λ − 1)]` and one change of variables of scaling `u`.
   Owned here: the identification of such data on a Weierstrass chart with a pair `(φ₂, ω)`, the
   points being `φ₂(1, 0)` and `φ₂(0, 1)` and `u` the ratio of `ω` to the invariant differential
   of the chart; the gluing over charts, which makes the pinned statement the representability
   of the problem on `Ell/ℤ[1/2]`; and the finite étaleness of degree `12`.
2. Over `ℤ[1/3]`, naive full level three with its `GL₂(𝔽₃)`-action and its affine universal
   family are Tau Ceti's (KM 2.2.10–2.2.11, the supplier contracts): `EllObj.universalLevelThree`
   is the level-three normal form `Y² + 3μXY + (μ³ − 1)Y = X³` over
   `B × Spec ℤ[1/3, ζ₃][μ, 1/(μ³ − 1)]` with its basis of the `3`-torsion, and it represents
   `gammaNaive B 3` over every base (`gammaNaiveThreeRepresentableBy`); the problem is étale,
   finite and surjective over `Ell/ℤ[1/3]` and `GL₂(𝔽₃)` acts freely on it over nonempty bases
   (Layer 3.2), which is what "finite étale `GL₂(𝔽₃)`-torsor" means here.
3. Tau Ceti's: for a relatively representable affine problem `𝒫` and a rigidifier `δ`
   represented by `U`, the simultaneous problem `(𝒫,δ)` is represented by the base change of `U`
   to `𝒫_U`, an affine scheme `𝕄(𝒫,δ)` over the base of `U` (`RelRepData.tensorRepresentableBy`),
   and `(𝒫,δ,δ)` by the relative representing scheme `δ_{𝕄(𝒫,δ)}`, finite étale over `𝕄(𝒫,δ)`
   by either projection when `δ` is finite étale (`doubleRepresentableBy`, `doubleSnd`,
   `mem_doubleSnd_base`).
4. Tau Ceti's: rigidity of `𝒫` makes `𝕄(𝒫,δ,δ) ⟶ 𝕄(𝒫,δ) ×_{ℤ[1/N]} 𝕄(𝒫,δ)` a monomorphism
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
this implication. Only this direction is used here. The converse is cheap, and its rigidity half is
Tau Ceti's `ModuliProblem.isRigid_of_representableBy`; KM records it: its Appendix A.4 opens with the
tautology (A.4.1.2) that `𝒫` is representable exactly when `𝒫̃` is representable and `𝒫` is rigid,
and Proposition A.4.2 gives the three-way equivalence under the étale-sheaf hypothesis that relative
representability supplies. The passage from
representability to a **smooth affine relative curve** also uses that the problem is
étale over `Ell` and affine over it. The naive problems in Layers 5.2 and 5.3 have these
properties over `ℤ[1/N]` and `ℚ`, respectively; representability alone does not imply smoothness
or relative dimension one.

*Needs:* §§0.3, 0.5, 1.5, 3.1–3.4; Tau Ceti `WeierstrassCurve.UniversalLegendre.existsUnique_legendre`,
`EllObj.universalLevelThree`, `ModuliProblem.gammaNaiveThreeRepresentableBy`,
`RelRepData.tensorRepresentableBy`, `RelRepData.doubleRepresentableBy`, `RelRepData.doubleSnd`,
`RelRepData.mem_doubleSnd_base`, `RelRepData.mono_pullback_lift_baseChangeFunctorHom_doubleSnd`,
`IsRigid.eq_one_of_comp_simultaneousAction_base_eq`, `IsRigid.span_range_smul_sub_eq_top`,
`AffineInvariantQuotient.etale_projection`, `AffineInvariantQuotient.isPullback_of_free`,
`Scheme.Hom.affineCoequalizerπ` with `isKernelPair_affineCoequalizerπ`, and
`ModuliProblem.isRigid_of_representableBy`. The rigidifiers are naive structures, so this section
does not use the integral Drinfeld loci.

**Checks.**

- The Legendre problem has degree `12` over `Ell/ℤ[1/2]`: the six ordered bases `(P₂, Q₂)` of
  `E[2]` times the two square roots of `x(Q₂) − x(P₂)`. For `y² = x(x − 1)(x − 2)` over `ℚ` the
  differences `x(Q₂) − x(P₂)` over the six ordered pairs of `{0, 1, 2}` are `±1, ±2, ±1`, of which
  exactly two, both equal to `1`, are rational squares; hence exactly four of the twelve
  structures are rational, which a torsor under a constant group of order `12` with a rational
  point cannot have.
- The level-three normal form `Y² + 3μXY + (μ³ − 1)Y = X³` has `c₄ = 9μ(μ³ + 8)` and
  `Δ = 27(μ³ − 1)³`, so it is elliptic exactly where `3(μ³ − 1)` is a unit, which is the base
  `Spec ℤ[1/3, ζ₃][μ, 1/(μ³ − 1)]` of item 2; the point `(0, 0)` is a flex, of order three.

**Further sources.** Conrad, Theorem 2.2.5, is the corresponding statement in the language of
stacks: an Artin stack whose geometric points have trivial automorphism functors is an algebraic
space. The conclusion there is an algebraic space; that the result is a scheme is the affine
quotient argument of this section, for which see the sources of Layer 0.3.

### 3.6 Regularity of a moduli problem

Define regularity in Katz–Mazur's sense (KM 4.12). If `𝒫` is relatively representable and `δ` is a
representable étale rigidifying problem, then `𝒫` is regular of dimension `d` when the scheme
representing `(𝒫,δ)` is regular of dimension `d`. KM quantifies over *all* modular families, so
independence of the rigidifier is built into the definition rather than a theorem of KM's; Tau
Ceti proves it for the formulation adopted here. KM's Notes Added in Proof
(p. 505) correct 4.12: "being of given dimension" is not étale-local, and the intended reading is
that the representing scheme is non-empty and every non-empty Zariski open is `d`-dimensional.
Tau Ceti's predicate `RelRepData.IsRegularOfDim d` (supplier contracts) is the formal
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

*Needs:* §§3.1, 3.5, 0.9; Tau Ceti `RelRepData.IsRegularOfDim`,
`RelRepData.isRegularOfDim_iff_of_representableBy`, `TauCeti.AlgebraicGeometry.IsRegularOfDim`;
Mathlib `IsRegularLocalRing`, `ringKrullDim`.

**Checks.**

- For the trivial problem `[Γ(1)]`, the scheme of the level-three rigidifier is
  `Spec ℤ[1/3, ζ₃][μ, 1/(μ³ − 1)]` and that of the Legendre rigidifier is
  `Spec ℤ[1/2][λ, 1/λ(λ − 1)]`: both are open subschemes of an affine line over a Dedekind ring, so
  both are regular of dimension two, as independence of the rigidifier requires.
- Without surjectivity of the rigidifier, the empty problem would be a representable étale
  rigidifier whose scheme is empty, and the non-emptiness clause of the corrected reading of KM 4.12
  would fail for every problem; with KM's literal reading of "dimension `d`", the disjoint union of
  `Spec ℤ[1/2][λ, 1/λ(λ − 1)]` with a scheme of dimension one would also count as two-dimensional.

### Examples

- The naive `[Γ(3)]` problem over `ℤ[1/3]` is represented by the level-three normal form over
  `Spec ℤ[1/3, ζ₃][μ, 1/(μ³ − 1)]`, a `GL₂(𝔽₃)`-torsor over `Ell/ℤ[1/3]` (§3.5, item 2).
- The Legendre problem over `ℤ[1/2]` is represented by `y² = x(x − 1)(x − λ)` over
  `Spec ℤ[1/2][λ, 1/λ(λ − 1)]`; it is finite étale of degree `12` and not Galois (§3.5).
- `[Γ(1)]` is relatively representable, affine and not rigid, hence not representable (§3.1).

### Dependencies

Layers 0–2 (§§0.3–0.5, 0.7, 0.9, 1.3–1.5, 2.1). Tau Ceti: `Ell/R` with its moduli problems,
relative representability and rigidity, the naive level problems with their representability,
rigidity and étaleness, the level-three rigidifier and the simultaneous-problem steps of KM 4.7.0,
the universal Legendre curve, and regularity of dimension `d`. No Drinfeld level structure is used.

## Layer 4: Drinfeld level structures

The sources of this layer are KM 1.3.5–1.3.7, 1.4, 1.10.1, 1.10.5, 1.10.13 and §§3.1–3.7. It defines the
level structures that make sense over every base, compares them with the naive ones where the level
is invertible, and proves relative representability for `[Γ(N)]`, `[Γ₁(N)]` and balanced `[Γ₁(N)]`.

### 4.1 Exact order and cyclic subgroups

In Tau Ceti (supplier contracts), a section `P` of an elliptic curve has exact order `N`
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

*Needs:* §§0.1, 0.2, 0.8, 2.1; Tau Ceti `EllipticCurveGeom.IsOfExactOrder`, `multiplesDivisor`,
`IsOfExactOrder.pow_eq_one`, `IsOfExactOrder.pointsPullback`, `exactOrderScheme`,
`exactOrderPointsEquivOfIsPullback`, `isFinite_exactOrderScheme_hom`,
`isOfExactOrder_iff_isOfNaiveExactOrder`, `EllipticCurveGeom.IsCyclicSubgroup` with
`IsOfExactOrder.isCyclicSubgroup_multiplesDivisor`, `IsCyclicSubgroup.toTorsion` and
`IsCyclicSubgroup.comap`, `EllipticCurveGeom.pointsDivisor`, and `TauCeti.IsFullSetOfSections`.

**Further sources.** Conrad, Definition 2.3.4, Theorem 2.3.5 with Definition 2.3.6, and Theorem
2.3.7, and Česnavičius, Definition 4.2.6 and Proposition 4.2.7, give the definition of a cyclic
subgroup, the standard cyclic subgroups and the criterion by the scheme of generators for subgroups
of the smooth locus of a generalized elliptic curve, which is more general; for elliptic curves both
refer to KM. Kottwitz–Wake, §4.1 and §4.2, define the primitive elements of a truncated
`p`-divisible group from the group scheme alone and identify them, for an elliptic curve, with the
points of exact order `pⁱ`; the comparison uses the flatness theorem of Layer 8.8, so it is a second
description and not a second proof.

### 4.2 The four level structures

Three of the four are Tau Ceti's (supplier contracts), over `Ell/B` for every base `B`:

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
Cᴰ ≅ ker(q̂_C : E/C ⟶ E),
```

the orientation of `Q(P)`, compatibility with arbitrary base change, and compatibility with the
Weil pairing, and prove its base-change functoriality. The relative representability of `[Γ(N)]`
and `[Γ₁(N)]` is Tau Ceti's and that of the balanced problem is §4.4. The cyclicity
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

*Needs:* §§0.1, 0.2, 0.8, 2.1–2.2, 2.4–2.5, 4.1; Tau Ceti `ModuliProblem.gamma`, `gammaAction`,
`gammaLevelOneIso`, `gammaOne`, `gammaOneOneIso`, `gammaZero`, `gammaOneToGammaZero`,
`EllipticCurveGeom.IsDrinfeldBasis` with `isDrinfeldBasis_iff`, `IsDrinfeldBasis.pointsPullback`
and `isDrinfeldBasis_comp_mulEquiv_iff`.

**Further sources.** Conrad, Definitions 2.4.1 and 2.4.2, define `Γ₁(N)`- and `Γ(N)`-structures on
generalized elliptic curves; on an elliptic curve the ampleness condition there is empty and they
are the structures of this section. Conrad, Theorem 2.3.2, and Česnavičius, Proposition 4.2.5, prove
that multiplying a `ℤ/N`-structure or a Drinfeld basis by `N/d` gives a structure of level `d`, for
generalized elliptic curves. The balanced problem is not treated in either.

### 4.3 Comparison with naive level structures

The naive–Drinfeld comparison of KM 1.4.4 and §3.7 for `[Γ₁(N)]` and `[Γ(N)]` is Tau Ceti's
(supplier contracts). Over every base, a naive `[Γ(N)]`-structure is a Drinfeld basis
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

*Needs:* §§2.5, 3.2–3.3, 4.1, 4.2; Tau Ceti `IsFiberwiseInjective.isDrinfeldBasis`,
`isDrinfeldBasis_iff_isFiberwiseInjective`, `isOfExactOrder_iff_isOfNaiveExactOrder`,
`ModuliProblem.gammaNaiveToGamma`, `gammaIsoGammaNaive`, `gammaOneToGammaOneNaive`,
`isIso_gammaOneToGammaOneNaive`, `isRigid_gamma`, `isRigid_gammaOne`,
`eq_one_of_gammaAction_hom_app_eq_self` and `hasProperty_etale_gammaRelRepData`.

**Further sources.** Česnavičius, Remark 4.2.3: where the order of `A` is invertible, a Drinfeld
`A`-structure is an isomorphism of the constant group onto a subgroup.

### 4.4 Relative representability of `[Γ(N)]`, `[Γ₁(N)]`, and balanced `[Γ₁(N)]`

KM 3.6.0 proves the relative representability of these three problems. KM Remark 3.6.1 expressly
excludes `[Γ₀(N)]`: its relative representability needs the cyclicity theorem of Layer 9.3,
whose proof uses the regularity of `[Γ₁(pⁿ)]` proved in Layer 8.8.

Two of the three are Tau Ceti's (supplier contracts), over every base and with no invertibility
hypothesis on `N`:

- `[Γ₁(N)]` is relatively representable by the exact-order scheme of Layer 4.1
  (`gammaOneRelRepData`), finite over `Ell/B` for `N ≠ 0`
  (`hasProperty_isFinite_gammaOneRelRepData`);
- `[Γ(N)]` is relatively representable by the closed Drinfeld-basis locus
  `EllObj.drinfeldBasisScheme` of `E[N] ×_S E[N]` (`gammaRelRepData`), finite over `Ell/B`
  (`hasProperty_isFinite_gammaRelRepData`).

Their formation commutes with arbitrary base change (`RelRepData.isPullback`), and over `ℤ[1/N]`
they are the naive problems through the isomorphisms of Layer 4.3, hence finite étale there. For
`[Γ(N)]` this is Tau Ceti's `hasProperty_etale_gammaRelRepData`. Owned here:

- the étaleness of `gammaOneRelRepData` over a base on which `N` is invertible, by transport
  along the pinned isomorphism `isIso_gammaOneToGammaOneNaive` from the étaleness of the naive
  problem (`hasProperty_etale_gammaOneNaiveRelRepData`). The last clause of
  `firstMainTheorem_gammaOne`, for `E/S` in `Ell/ℤ` with `N` a unit on `S`, is this statement for
  `B = S`: the transport needs `N` invertible on `B`, and the exact-order scheme
  (`exactOrderScheme`, a subscheme of `E`) is the same for `(S, S → Spec ℤ, E)` in `Ell/ℤ` and
  for `(S, 𝟙, E)` in `Ell/S`;

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

*Needs:* §§0.1–0.2, 0.6, 0.8, 2.1–2.5, 3.1, 4.1–4.3; Tau Ceti `ModuliProblem.gammaRelRepData`,
`hasProperty_isFinite_gammaRelRepData`, `gammaOneRelRepData`, `hasProperty_isFinite_gammaOneRelRepData`,
`EllObj.drinfeldBasisScheme`, `RelRepData.isPullback`, `isIso_gammaOneToGammaOneNaive`,
`hasProperty_etale_gammaOneNaiveRelRepData`.

**Further sources.** Česnavičius, Proposition 4.3.2: forgetting a Drinfeld `(ℤ/n)²`-structure is
representable, finite and locally free of degree `#GL₂(ℤ/nℤ)`, and étale over `ℤ[1/n]`, for
generalized elliptic curves. Conrad, Theorem 3.2.2: isomorphism schemes of curves with `Γ(N)`- or
`Γ₁(N)`-structure are finite.

### Examples

- On a supersingular elliptic curve in characteristic `p`, `E[p]` has rank `p²` but no nonzero
  geometric points. The zero section is nevertheless a Drinfeld point of exact order `p`, since
  `p[0] = ker(F_{E/S})` as degree-`p` divisors (§4.1).
- Over `ℤ[1/N]` the four Drinfeld problems are the naive ones, finite étale over `Ell/ℤ[1/N]` of
  ranks `|GL₂(ℤ/Nℤ)|`, `N² ∏_{p ∣ N}(1 − 1/p²)`, `N² ∏_{p ∣ N}(1 − 1/p²) · φ(N)` and
  `N ∏_{p ∣ N}(1 + 1/p)`; for `N = 4` these are `96`, `12`, `24` and `6` (§§4.3–4.4, with
  `[Γ₀(N)]` in §9.4).

### Dependencies

Layers 0–3 (§§0.1–0.2, 0.6, 0.8, 2.1–2.5, 3.1–3.3). Tau Ceti: points of exact order, cyclic
subgroups, Drinfeld bases, the problems `[Γ(N)]`, `[Γ₁(N)]` and `[Γ₀(N)]` with the relative
representability of the first two, and the naive–Drinfeld comparison for `[Γ(N)]` and `[Γ₁(N)]`.
The relative representability of `[Γ₀(N)]` is §9.4.

## Layer 5: affine fine modular curves after inverting `N`

The sources of this layer are KM 2.7.2, 3.7.1, 4.7.0 and Corollary 4.7.2, and Loeffler 3.3.4, 3.3.6, 3.4.4
and §3.8. It builds the fine affine curves over `ℤ[1/N]`: `Y₁(N)` for `N ≥ 4`, the full
ordered-basis curve `Y_full(N)` for `N ≥ 3` with its determinant, and the twisted curve `Y(ρ)`.

### 5.1 Tate normal form and `Y₁(N)` for `N≥4`

The direct Tate-atlas construction, items 1–5, is Tau Ceti's (supplier contracts).

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

6. **Relative dimension one.** For `N ≥ 4` invertible on `B`, the morphism `Y₁(N) ⟶ B` is smooth
   of relative dimension one: `smoothOfRelativeDimension_one_yOne_structureMap` in
   `Suggested.lean`. This is more than item 4. The pinned `smooth_yOne_structureMap` proves
   Mathlib's `Smooth`, which does not determine the dimension of the fibres: the base
   `B × Spec ℤ[a,b,Δ⁻¹]` of the universal Tate normal form, in which `Y₁(N)` is a subscheme, is
   smooth over `B` of relative dimension two. Layers 6.4 and 10 use `Y₁(N)` as a relative curve.
   Route. Let `𝒫` be the naive `[Γ₁(N)]`-problem and let `δ` be the level-three rigidifier of
   Layer 3.5 over `B[1/3]`. Its base `T = B × Spec ℤ[1/3, ζ₃][μ, 1/(μ³ − 1)]` is étale over an
   open subscheme of `𝔸¹_B`, hence smooth of relative dimension one over `B`. The scheme `𝕄(𝒫, δ)`
   of Layer 3.5, item 3, represents pairs of a `𝒫`-structure and a `δ`-structure, so it is at once
   the relative representing scheme of `𝒫` on the universal level-three curve, which is finite
   étale over `T` by item 5, and the scheme of level-three structures on the universal curve over
   `Y₁(N)`, which is étale and surjective over `Y₁(N)[1/3]` by Layer 3.2. The first description
   makes `𝕄(𝒫, δ)` smooth of relative dimension one over `B`. By the second, if `Y₁(N) ⟶ B` has
   relative dimension `m` near a point `x` of `Y₁(N)[1/3]`, then `𝕄(𝒫, δ) ⟶ B` has relative
   dimension `m` near a point above `x`; the rank of the module of relative differentials at a
   point of a smooth morphism is well defined, so `m = 1`. Over `B[1/2]` the same argument applies
   to the Legendre rigidifier of Layer 3.5, item 1, whose base `B × Spec ℤ[1/2][λ, 1/λ(λ − 1)]` is
   an open subscheme of `𝔸¹_B` and whose problem is finite étale and surjective over
   `Ell/ℤ[1/2]`; and `B = B[1/2] ∪ B[1/3]`. In terms of the pinned equivalence between "smooth of
   relative dimension `n`" and "smooth and of pure relative dimension `n`" (supplier contracts), what is proved is that every fibre of `Y₁(N) ⟶ B` is of pure dimension one.

For `N≥4`, this construction directly represents `Y₁(N)`; it is not routed through KM 4.7.0. No
fine representability assertion is made for `N≤3`, where the indicated point structure does not
rigidify every elliptic curve. Items 1–5 are Tau Ceti's and are not restated in `Suggested.lean`.

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
- Relative dimension, item 6: on `a = 1` the discriminant is
  `b³(1 − 1 − 8b + 36b − 27b − 16b²) = b⁴(1 − 16b)`, so `Y₁(4)` over `ℤ[1/2]` is
  `Spec ℤ[1/2][b, 1/b(1 − 16b)]`, an open subscheme of the affine line, of relative dimension one.
  The base `Spec ℤ[a, b, Δ⁻¹]` of the Tate normal form is an open subscheme of the affine plane,
  smooth of relative dimension two. Both are smooth, so a statement of item 6 with `Smooth` in
  place of relative dimension one would not distinguish them, and would not supply the hypothesis
  of the quotient-smoothness theorem of Layer 6.4.
- For `B = ∅` the scheme `Y₁(N)` is empty and item 6 holds vacuously: relative dimension one is
  a condition at the points of the source.

*Needs:* §§1.1–1.4, 2.1, 3.2; for the Drinfeld form of item 4, §4.3; for item 6, §3.5 (the two
rigidifiers and the simultaneous scheme of its item 3). Tau Ceti
`EllipticCurveGeom.existsUnique_tateNormalForm`, `EllObj.universalTate`, `EllObj.yOne`,
`ModuliProblem.gammaOneNaiveRepresentableBy`, `ModuliProblem.gammaOneRepresentableBy`,
`EllObj.isAffineHom_yOne_structureMap`, `EllObj.smooth_yOne_structureMap`,
`hasProperty_etale_gammaOneNaiveRelRepData`, `hasProperty_isFinite_gammaOneNaiveRelRepData` and
`TauCeti.AlgebraicGeometry.smoothOfRelativeDimension_iff_smooth_and_pureRelativeDimension`;
Mathlib `SmoothOfRelativeDimension`, `Smooth`.

**Further sources.** DR IV 3.4 and IV 6.7, Conrad, Theorem 3.2.7 and Theorem 4.2.1(2), and
Česnavičius, §4.1.2 and Lemma 4.1.3, prove that the compactified moduli stack of a level structure
is smooth where the level is invertible and that its locus without automorphisms is a scheme, for
every level; `Y₁(N)` is the locus of elliptic curves in the case `Γ₁(N)`. These are more general in
the level and include the cusps. None of them contains the universal property of the Tate normal
form over a base, for which KM remains the locator.

### 5.2 Full ordered bases and fixed pairing

For `N ≥ 3`, the rigidity of the naive full-level problem (KM 2.7.2, `isRigid_gammaNaive`) and its
relative representability by the open full-level locus in `E[N]×_S E[N]`, étale, finite and
surjective over `Ell/B` where `N` is invertible (KM 3.7.1, §3.2), are Tau Ceti's. Prove its
representability by an elliptic curve over a scheme `Y_full(N)` affine and smooth of relative
dimension one over `B`, for every base `B`, in particular over `ℤ[1/N]` (KM 4.7.0 and Corollary
4.7.2, which is a statement about a curve): `exists_representableBy_gammaNaive` in
`Suggested.lean`. Over `ℤ[1/N]` this is the application of `exists_representableBy_of_isRigid` of
Layer 3.5 together with the argument of Layer 5.1, item 6: over `ℤ[1/3N]`, and likewise over
`ℤ[1/2N]` with the Legendre rigidifier, the simultaneous scheme `𝕄([Γ(N)], δ)` is finite étale
over the base of the rigidifier `δ`, which is smooth of relative dimension one, and it is étale
and surjective over `Y_full(N)`; smoothness and the relative dimension descend along an étale
surjection of the source. Over a general `B` the representing object is the base change of
`Y_full(N)/ℤ[1/N]` along `B → Spec ℤ`, affine and smooth of relative dimension one over `B` as the
base change of the composite `Y_full(N) → Spec ℤ[1/N] → Spec ℤ` of an affine morphism smooth of
relative dimension one with the open immersion of a principal open. It represents
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

**Checks.**

- For `N = 3` the representing scheme over `B` is `B × Spec ℤ[1/3, ζ₃][μ, 1/(μ³ − 1)]` (Layer 3.5,
  item 2), étale over an open subscheme of `𝔸¹_B`: relative dimension one, and empty over the
  points of `B` of residue characteristic `3`.
- Over a base `B` on which `N` is nowhere invertible, for instance `B = Spec 𝔽_p` with `p ∣ N`,
  the representing scheme is empty and every clause of the statement holds vacuously.
- `𝔸²_B ⟶ B` is affine and smooth and is not a relative curve: the clause on the relative
  dimension is what a statement with `Smooth` alone would lose.
- For `g = [[0,1],[1,0]]`, `(P, Q)g = (Q, P)` and `det g = −1`, and the formula gives
  `e_N(Q, P) = e_N(P, Q)⁻¹`, as alternation requires; for `g = [[a,0],[0,1]]` it gives
  `e_N(aP, Q) = e_N(P, Q)^a`. A left action `(P, Q) ↦ (aP + bQ, cP + dQ)` would have the same
  determinant law but would compose in the opposite order: `(PQ·g)·h = PQ·(gh)` holds for the row
  action and fails for it when `g` and `h` do not commute.

*Needs:* for the representability of `Y_full(N)`, §§3.2, 3.3 and 3.5 with Tau Ceti
`ModuliProblem.gammaNaive`, `isRigid_gammaNaive`, `gammaNaiveRelRepData` and its
`hasProperty_etale_…`, `hasProperty_isFinite_…`, `hasProperty_surjective_…`; for the determinant
map and the fixed-pairing decomposition, the Weil pairing of §2.5 and Mathlib `Polynomial.cyclotomic`.
No further Cartier-divisor theorem is used.

**Further sources.** Conrad, Theorem 3.2.7, Theorem 4.1.1(3) and Theorem 4.2.1(2): the stack of
`Γ(N)`-structures on generalized elliptic curves is smooth over `ℤ[1/N]`, the Weil pairing defines
its morphism to `Spec ℤ[ζ_N]`, and it is a scheme once a divisor `d ≥ 3` of `N` is inverted.
Scholze, Theorem 4.3, states the representability by a smooth affine curve over `ℤ[1/m]` for
`m ≥ 3`.

### 5.3 The twisted curve `Y(ρ)`

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
The algebraic reduction is Tau Ceti's, with geometric connectedness as an explicit hypothesis; the
external contract for it is recorded below:

7. prove that `Y(ρ) ⊗ ℚ̄` is nonempty and smooth — the base change of a smooth morphism is smooth —
   and apply the pinned theorem that a connected scheme smooth over a field is irreducible
   (`TauCeti.AlgebraicGeometry.Smooth.irreducibleSpace_of_connectedSpace`: smooth over a field
   gives local noetherianness and regular, hence integral, local rings, and a connected locally
   noetherian scheme with integral local rings is irreducible), in its form over `AlgebraicClosure K`
   (`Smooth.irreducibleSpace_baseChange_algebraicClosure_of_connectedSpace`, applied with
   `K = ℚ`; the supplier contracts). Together these reduce geometric irreducibility of `Y(ρ)`
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
pinned `TauCeti.connectedSpace_primeSpectrum_tensorProduct_of_isAlgClosed` (supplier contracts) carries connectedness from `ℚ̄` to every field extension of it.

This roadmap takes no dependency on the two statements and keeps them as hypotheses: every
statement about `Y(ρ)` here carries the connectedness of `Y(ρ) ⊗ ℚ̄` visibly rather than assuming
it, and no unconditional irreducibility theorem is asserted. Where the two statements are proved is
recorded under Scope and ownership.

*Needs:* §§0.3–0.5, 2.5, 3.3, 5.2; Tau Ceti `FiniteEtaleScheme.galoisEquivalence`,
`galoisEquivalenceCommGrp`, `galoisEquivalenceAlternatingPairingEquiv`,
`AffineInvariantQuotient.etale_projection`, `AffineInvariantQuotient.isPullback_of_free`,
`TauCeti.AlgebraicGeometry.Smooth.irreducibleSpace_of_connectedSpace`,
`Smooth.irreducibleSpace_baseChange_algebraicClosure_of_connectedSpace` and
`TauCeti.connectedSpace_primeSpectrum_tensorProduct_of_isAlgClosed`. The construction uses no new
Cartier-divisor result beyond the Weil pairing of §2.5, whose normalisation uses Tau Ceti's
equation-level pairing.

**Checks.**

- For `N = 3` and `ρ` the `3`-torsion of an elliptic curve `E₀` over `ℚ` with its Weil pairing,
  `E₀` with the identity frame `E₀[3] ≅ V_ρ` is a rational point of `Y(ρ)`: the twisted curve is
  built so that it is nonempty for the representations it is used on. By contrast `Y_full(3)` has
  no `ℚ`-point: the Weil pairing of a basis of `E[3]` defined over `ℚ` would be a rational
  primitive cube root of unity.
- For `N ≤ 2` the construction is excluded: `[−1]` acts trivially on `E[2]`, so the diagonal
  action in item 6 is not free and the quotient is not a fine moduli scheme.

**Further sources.** Conrad, Theorem 4.2.1(1), is a locator for the connectedness hypothesis in the
untwisted case: the fibres of the stack of `Γ(N)`-structures over `ℤ[ζ_N]` are geometrically
connected. The proof there compares with the complex-analytic theory in characteristic zero, so it
does not remove the transcendental input named in Scope and ownership.

### Examples

- Tate normal form gives `Y₁(5)` over `ℤ[1/5]`: the locus `b = a − 1` of
  `Y² + aXY + bY = X³ + bX²`, on which `Δ = (1 − a)⁵(a² + 9a − 11)`, so
  `Y₁(5) = Spec ℤ[1/5][a, 1/(1 − a)(a² + 9a − 11)]`, an open subscheme of the affine line (§5.1).
- `Y₁(4)` over `ℤ[1/2]` is `Spec ℤ[1/2][b, 1/b(1 − 16b)]` (§5.1).
- `Y_full(3)` over `ℤ[1/3]` is `Spec ℤ[1/3, ζ₃][μ, 1/(μ³ − 1)]` (§3.5 item 2, §5.2). The full
  ordered-basis scheme has its determinant map to `μ_N^prim`, and fixing a primitive root gives
  `Y(N, ζ)` (§5.2).
- The points of `Y(ρ)` over a characteristic-zero field have the expected
  Galois-representation-with-pairing description (§5.3).

### Dependencies

Layers 0–3 (§§0.3–0.5, 1.1–1.4, 2.1, 2.5, 3.2–3.3, 3.5), and §4.3 for the Drinfeld form of §5.1
item 4. Tau Ceti: the Tate normal form and `Y₁(N)`, the level-three normal form, the naive level
problems and their rigidity, finite étale schemes over a field, affine invariant quotients, and the
algebraic reduction of geometric irreducibility.

## Layer 6: quotient problems, coarse moduli schemes, and the `j`-line

The sources of this layer are KM 7.1.2–7.1.4, 7.4.2, 8.1.1–8.1.3.1, 8.1.5, 8.1.6, 8.2.1, 8.2.2 and the Notes
Added in Proof (pp. 508–509); Igusa, *Fiber systems of Jacobian varieties III*, §2; and Loeffler
§§3.6 and 3.8.

The quotient and coarse-moduli formalism is general, and its applications in this layer are over
`ℤ[1/N]`. No regularity theorem is used; the integral statements about the same quotients are in
Layers 8.5, 8.9, 9.5, and 9.6.

### 6.1 Katz–Mazur quotient problems

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

*Needs:* §§0.3, 0.5, 3.1, 3.4–3.5, 4.3–4.4; Tau Ceti `AffineInvariantQuotient.existsUnique_desc_of_finite`,
`AffineInvariantQuotient.isFinite_projection_of_finiteType`, `AffineInvariantQuotient.etale_projection`,
`AffineInvariantQuotient.isPullback_of_free` and `CategoryTheory.CommMon.existsUnique_relativeSpecπ_comp_eq`
(the invariant quotient of a scheme affine over a base by a finite group is a categorical quotient
in all schemes), `ModuliProblem.RelRepData`.

**Checks.**

- The orbit presheaf is not the quotient. For the naive `[Γ(2)]` over `ℤ[1/2]` and
  `H = GL₂(𝔽₂)`, the quotient is the trivial problem `[Γ(1)]` (§6.2, item 1 with `d = 1`), with one
  structure on every curve; but `y² = x³ − 2` over `ℚ` has no rational point of order two, since
  `x³ = 2` has no rational root, so it has no naive `[Γ(2)]`-structure over `ℚ` and its orbit set is
  empty.
- Freeness in the fixed reading of item 2: over the empty base each standard problem has one
  structure, fixed by all of `H`, so the literal set-level reading would fail for every `H ≠ 1`,
  while the scheme-theoretic reading holds for the naive `[Γ(N)]`, `N ≥ 3`, with `H` any subgroup
  of `GL₂(ℤ/Nℤ)` (Tau Ceti's `eq_one_of_gammaNaiveAction_hom_app_eq_self` over nonempty bases).

**Further sources.** SGA 1, Exposé V, Proposition 1.1, Corollaire 1.2, Corollaire 1.5, Proposition
1.8 and Proposition 1.9, for quotients by finite groups, their finiteness and flat base change, and
Proposition 2.2 and Corollaire 2.3 there for free actions. EGM (4.8) treats a finite group acting on
an affine scheme and (4.16) a finite locally free group scheme over an arbitrary base; finiteness of
the quotient morphism is stated there for a locally noetherian base. Rydh, Theorem (4.1) and
Corollary (5.4), treat finite locally free groupoids with no noetherian hypothesis. Česnavičius,
Proposition 6.3, identifies the quotient problem `[Γ(n)]/H` with the stack of elliptic curves with
level structure for the inverse image of `H`, and its coarse moduli scheme with the coarse space of
that stack.

### 6.2 The standard quotient problems after inverting `N`

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

*Needs:* §§2.5, 3.2–3.3, 4.3, 5.2, 6.1; Tau Ceti `ModuliProblem.gammaNaiveAction`,
`gammaNaiveToGammaOneNaive`, `gammaOneToGammaZero`, `isRigid_gammaOneNaive`.

**Checks.**

- The Borel `B = {[[a,b],[0,d]]}` has index `|GL₂(ℤ/Nℤ)|/|B| = N ∏_{p ∣ N}(1 + 1/p)`, the degree of
  `[Γ₀(N)]` of item 4; for `N = p` prime it is `(p² − 1)(p² − p)/((p − 1)² p) = p + 1`, the number of
  lines in `𝔽_p²`. The lower triangular group, which fixes `⟨Q⟩` rather than `⟨P⟩` in the row
  convention, has the same index, so the index does not detect the convention; item 4's map
  `(P, Q) ↦ ⟨P⟩` does.
- In `SL₂`, `[[a,0],[0,d]]` with `ad = 1` sends `(P, Q)` to `(aP, dQ)`, so the diamond operator
  indexed by the lower-right entry `d` acts by `P ↦ d⁻¹P`; indexing it by `d` and acting by
  `P ↦ dP` inverts every diamond operator.

**Further sources.** Česnavičius, §4.1.2 and Proposition 6.3, treat every subgroup `H` uniformly in
the language of stacks. The seven cases are not listed there, and the row-vector convention has to
be matched by hand.

### 6.3 Coarse moduli schemes

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

**Checks.**

- For a problem represented by `𝔼/M`, the data are `M` with the classifying maps of the
  representing bijection: a family of maps `g` is determined by its value on the universal
  structure, which is the unique `φ`, and over an algebraically closed field the classifying map is
  the bijection `𝒫(E/k)/≅ ⟶ M(k)` itself.
- For `[Γ(1)]` the scheme is `𝔸¹_j` (Layer 6.5), and the curves with `j = 0` and `j = 1728` are
  single points although their automorphism groups have orders `6` and `4` away from
  characteristics `2` and `3`, against `2` elsewhere: the data record isomorphism classes and not
  automorphisms. With the same classifying maps `ℙ¹_j` fails surjectivity on algebraically closed
  points, no elliptic curve having `j = ∞`.
- The universal property is not implied by the two conditions on points. Over `𝔽_p` take `𝔸¹`
  with the classifying maps `Frob ∘ j`: Frobenius is bijective on the points of an algebraically
  closed field, so both conditions on points hold, but the family `g = j` would need `φ` with
  `φ(T^p) = T`, and `p · deg φ = 1` has no solution.
- Algebraic closedness is needed in the injectivity clause: `y² = x³ − x` and `y² = x³ − 4x` have
  `j = 1728` over `ℚ` and are not isomorphic over `ℚ`, the ratio `1/4` of the coefficients not
  being a fourth power there. Stated for all fields, the clause would fail for `𝔸¹_j`.

*Needs:* §§0.3, 3.1–3.2, 3.5, 5.2, 6.1; Tau Ceti `AffineInvariantQuotient.quotient`,
`AffineInvariantQuotient.existsUnique_desc_of_finite`, `EllObj.universalLevelThree`; Mathlib's scheme
gluing.

**Further sources.** Conrad, *The Keel–Mori theorem via stacks*, Theorem 1.1, constructs the coarse
space of an Artin stack which is locally of finite presentation and has finite inertia, and Rydh,
Theorem (6.12), does so with finite inertia alone; both are more general. Theorem 3.1 of the former
is the case of a stack with a finite locally free cover by a scheme in which every orbit lies in an
affine open, which contains the quotients by finite groups used here. Česnavičius, Lemma 6.2, after
DR IV 3.10(iii), is the bridge `M(𝒫)/H ≅ M(𝒫/H)` for the compactified coarse curves of full level.

### 6.4 Smoothness of finite quotients and the curves `Y_H`

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

Apply it once, in the vocabulary of Layer 10: for `N ≥ 4`, `Y₁(N)/ℤ[1/N]` is a smooth affine
relative curve (Layer 5.1, items 4 and 6) carrying the diamond action `P ↦ aP` of Layer 6.2, on which `−1` acts trivially, so for
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
over the principal ideal domain `ℤ[1/N]`, so by the kernel base-change lemma stated below it
suffices that `A^H/p ⟶ (A/p)^H` be surjective for every prime `p ∤ N`. This map is injective, and
`Spec (A/p)^H ⟶ Spec (A^H/p)` is a finite surjective morphism of curves which are smooth over `𝔽_p`
by the theorem above, applied to `Y_full(N)` over `ℤ[1/N]`, a smooth affine relative curve by
Layer 5.2, and to its fibre over `𝔽_p`; it is
therefore finite locally free. The element `−1` acts trivially on `Y_full(N)`, and on the invariant
open subscheme `j ≠ 0, 1728`, the preimage of an open subscheme of the `j`-line under the pinned
`jMap`, the automorphism group of every geometric fibre is `{±1}` (Tau Ceti's, in every
characteristic: `WeierstrassCurve.eq_one_or_eq_negVariableChange_of_smul_eq`, supplier contracts), so that the
group `H/(H ∩ {±1})` acts freely there; the torsor square of a free action (Layer 0.3) is stable under
base change, so the map is an isomorphism over that open subscheme, which is dense in the target.
Its rank is therefore one. Česnavičius, Proposition 6.4(b), proves the statement for the
compactified curves of every level, in the language of stacks and over every base on which
`gcd(6,n)` is invertible, which is more general; over `ℤ[1/n]` the proof there has the same steps
(reduction to the fields `𝔽_p`, flatness of a finite morphism of smooth curves, rank one away from
`j = 0` and `j = 1728`), with the rigidification of a stack by `{±1}` in place of the free quotient.
Proposition 6.3 there is the dictionary with the quotient problems and coarse moduli schemes used
here. Remark 6.6 there records that the invertibility of `gcd(6,n)` cannot be dropped: for level
`Γ₁(4)` the statement fails in characteristic `2`.

**Kernel base change.** The lemma used above, and again in §6.5, item 6, is the following.
Let `D` be a principal ideal domain, `M` and `N` modules over `D` with `N` flat, and `f : M ⟶ N` a
`D`-linear map whose cokernel is torsion-free. Then for every `D`-algebra `R` the kernel of
`f ⊗_D R` is the image of `ker f ⊗_D R`. This is Tau Ceti's
`LinearMap.ker_baseChange_of_flat_quotient_range`, which holds over every commutative ring when the
cokernel is flat; over a principal ideal domain a torsion-free module is flat. The module `M` need
not be flat. Owned here is the criterion: under the same hypotheses on `D` and `N`, the cokernel of `f` is torsion-free exactly when
`ker f ⊗ D/𝔭 ⟶ ker(f ⊗ D/𝔭)` is surjective for every maximal ideal `𝔭` of `D`, the kernel of
`im f ⊗ D/𝔭 ⟶ N ⊗ D/𝔭` being the `𝔭`-torsion of the cokernel; this is the form in which the lemma
is applied to `f : A ⟶ ∏_{h∈H} A`, whose kernel is `A^H`.

**Checks.**

- Kernel base change needs the hypothesis on the cokernel: for `f : ℤ ⟶ ℤ`, multiplication by `2`,
  and `R = 𝔽₂`, the kernel of `f ⊗ R` is `𝔽₂` and the image of `ker f ⊗ R` is `0`; the cokernel
  `ℤ/2` has torsion. For the diagonal `ℤ ⟶ ℤ²` the cokernel is `ℤ`, and both sides are `0` for
  every `R`.
- The quotient-smoothness theorem needs a regular base and does not need `|H|` invertible: `x ↦ −x`
  on `ℤ_(2)[x]` has invariants `ℤ_(2)[x²]`, smooth over `ℤ_(2)`, although the action is trivial
  modulo `2`; over the non-regular base `k[ε]/(ε²)` with `char k = 2`, the automorphism
  `t ↦ (1 + ε)t` of the affine line `Spec k[ε][t]`, of order two since `(1 + ε)² = 1`, sends
  `(a + bε)tⁿ` to `(a + (b + na)ε)tⁿ`, so its invariants are `k[ε][t²] ⊕ εt·k[t²]`; this ring is
  not flat over `k[ε]`, the element `εt` being killed by `ε` without being a multiple of `ε`.
- Coarse base change away from the level, at its two ends: for `H = 1` the problem is
  representable and the statement is case 1 of KM 8.1.6; for `H = GL₂(ℤ/Nℤ)` the problem is
  `[Γ(1)]` over `ℤ[1/N]` and the statement is `M([Γ(1)]/R') = Spec R'[j]`, which is Layer 6.5,
  item 6. The statement is about level `N` over `ℤ[1/N]`: Česnavičius, Remark 6.6, for `Γ₁(4)` in
  characteristic `2`, concerns a characteristic dividing the level, which is excluded here.

*Needs:* §§0.3, 0.9 (regular local rings, for the base of the quotient-smoothness theorem),
5.1–5.2, 6.1–6.3; Tau Ceti `LinearMap.ker_baseChange_of_flat_quotient_range`,
`EllipticCurveGeom.jMap` and the `WeierstrassCurve.autGroup` dichotomy for `j ≠ 0, 1728`,
`WeierstrassCurve.eq_one_or_eq_negVariableChange_of_smul_eq`; Mathlib `IsRegularLocalRing`,
`SmoothOfRelativeDimension`.

**Further sources.** DR VI 6.7 proves that the coarse curve of every level is smooth where the level
is invertible by a different method, which does not pass through the general theorem on quotients:
Abhyankar's lemma away from `j = 0, 1728`, and a study of the action of the automorphism group on
the deformation ring in characteristics `2` and `3`. Česnavičius, Proposition 6.4(a), deduces the
same statement from the theorem of KM.

### 6.5 The coarse `j`-line

KM 8.2.1 states that `M([Γ(1)]) = Spec R[j]` over every ring `R`, with `j` normalised as in Tate's
formulaire, and cites Igusa, *Fiber systems of Jacobian varieties III*, §2, for the proof. Prove it
here by the following route, which uses only material already constructed.

1. The morphism `j:[Γ(1)]⟶𝔸¹_ℤ` is Tau Ceti's (supplier contracts):
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
   KM 8.2.1, for which KM cite Igusa. It has two routes. The first: the statement is the case
   `H = GL₂(ℤ/Nℤ)`, for `N = 3` and `N = 4`, of the coarse base change away from the level of
   Layer 6.4. Indeed `[Γ(N)]/GL₂(ℤ/Nℤ) = [Γ(1)]` over `ℤ[1/N]` (Layer 6.2, item 1, with `d = 1`),
   so `M([Γ(1)]/R) = M([Γ(1)]/ℤ[1/N]) ⊗ R` for every `ℤ[1/N]`-algebra `R`, which is `Spec R[j]`
   by items 1–5 over `ℤ[1/N]`; for an arbitrary `R` the cases `N = 3` over `R[1/3]` and `N = 4`
   over `R[1/2]` glue, coarse formation commuting with these localisations by case 2 of KM 8.1.6.
   The second route computes the fibres directly and uses no smoothness theorem. Work over `D = ℤ[1/N]` with the Galois rigidifier `[Γ(N)]`, `N = 3` on
   `D(3)` and `N = 4` on `D(2)`, and let `A_N` be the coordinate ring of `Y_full(N)`, flat over
   `D` with `G = GL₂(ℤ/Nℤ)` acting; `M([Γ(1)]/R) = Spec (A_N ⊗_D R)^G` for every `D`-algebra
   `R`. The invariant ring is the kernel of `φ : A_N ⟶ ∏_{g∈G} A_N`, `a ↦ (ga - a)_g`, and
   the kernel base-change lemma of Layer 6.4 (base change of the kernel of a linear map into
   a flat module over a principal ideal domain with torsion-free cokernel; the source need not be
   flat, since the image is a submodule of a flat module and so flat) says that
   `A_N^G ⊗_D R ⟶ (A_N ⊗_D R)^G` is an isomorphism for every `R` as soon as it is surjective
   modulo every prime `p` of `D`, i.e. as soon as `(A_N/p)^G = 𝔽_p[j]` for every `p ∤ N`.
   Prove those fibre computations: for `N = 3` by the invariant computation of step 2 over
   `𝔽_p[ζ₃]` (`isInvariant_tetrahedralGroup` applies for `p ≠ 2, 3`), including the split case
   `p ≡ 1 mod 3` in which `Y_full(3)_{𝔽_p}` has two components interchanged by `det` and the
   invariants are those of `SL₂(𝔽₃)` on one component. The fibre of `N = 3` at `p = 2` is a
   computation of its own, because `2` is not a nonzerodivisor of `𝔽₂` and no `𝔽₂`-algebra is a
   `ℤ[1/2]`-algebra, so that `N = 4` says nothing about it. There
   `A₃/2 = 𝔽₄[μ, 1/(μ³+1)]` is a domain, free of rank `12` over `𝔽₄[u]`
   (`finrank_levelThreeRing`), where `u = μ³(μ³+8)³/(μ³−1)³` reduces to `μ¹²/(μ³+1)³` and
   `j = 27u = u`. The tetrahedral substitutions `μ ↦ ζ₃μ` and `μ ↦ (μ+2)/(μ−1)` reduce to
   `μ ↦ ζ₃μ` and `μ ↦ μ/(μ+1)`, which generate the group of the twelve substitutions
   `μ ↦ aμ/(cμ+1)`, `a ∈ 𝔽₄^×`, `c ∈ 𝔽₄`, and fix `u`:
   `u(μ/(μ+1)) = μ¹²/((μ+1)³(μ²+μ+1)³) = u`, since `μ³ + (μ+1)³ = μ²+μ+1`. A faithful group of
   order `12` on `𝔽₄(μ)`, of degree `12` over `𝔽₄(u)`, has fixed field `𝔽₄(u)`; the invariants of
   `A₃/2` lie in it and are integral over the normal ring `𝔽₄[u]`, so they are `𝔽₄[u]`. An
   element of determinant `−1` fixes `j = u` and acts on `𝔽₄` by `ζ₃ ↦ ζ₃²`, which leaves
   `𝔽₂[u] = 𝔽₂[j]`. For
   `N = 4` by the Legendre section argument of steps 3–4 over `𝔽_p`, `p` odd, which needs only
   that `M([Γ(1)]/𝔽_p)` is reduced. Then glue over `D(6)`. Alternatives are to formalise Igusa's
   theorem directly, or to redo the invariant computation uniformly over arbitrary rings including
   the fibres at `2` and `3`; whichever is chosen, the arbitrary-base statement must not be discharged by an
   appeal to KM 8.1.6, none of whose four cases covers it. The statement is
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

*Needs:* §§0.3, 1.3, 3.4–3.5, 5.2, 6.1, 6.3; item 6 also uses §6.4, for the kernel base-change
lemma in both routes and for the coarse base change away from the level in the first, and §6.2,
item 1. Tau Ceti `EllipticCurveGeom.jMap`, `EllipticCurveGeom.j`, `jMap_baseChange`, `j_eq_of_iso`,
`appTop_j_of_isPullback`, `TauCeti.LevelThreeRing` with `finrank_levelThreeRing`,
`LevelThreeRing.tetrahedralGroup` and `LevelThreeRing.isInvariant_tetrahedralGroup`,
`TauCeti.LegendreRing` with `finrank_legendreRing`, `LegendreRing.equivLocalization`,
`LegendreRing.anharmonicGroup` and `LegendreRing.isInvariant_anharmonicGroup`; Mathlib
`WeierstrassCurve.j`. §6.4 uses the pinned `jMap` and no statement of this section.

**Checks.**

- With Tate's normalisation `j = c₄³/Δ`, `y² = x³ + 1` has `c₄ = 0` and `j = 0`, and `y² = x³ + x`
  has `c₄ = −48`, `Δ = −64` and `j = (−48)³/(−64) = 1728`. A `j` normalised as `c₄³/(1728Δ)` would
  put the second curve at `1` and change the scheme `V(j, j − 1728) = Spec ℤ/1728ℤ` into
  `V(j, j − 1) = ∅`.
- On the Legendre line, `j = 2⁸u` with `u = (λ² − λ + 1)³/(λ²(λ − 1)²)`, and `λ = −1` gives
  `u = 27/4` and `j = 1728`, the curve `y² = x³ − x`; on the level-three line, `j = 27u` with
  `u = μ³(μ³ + 8)³/(μ³ − 1)³`, and `μ = 0` gives `j = 0`, the curve `Y² − Y = X³`.

**Further sources.** Česnavičius, Proposition 3.3.2: the coarse space of the stack of elliptic
curves is the affine `j`-line and its formation commutes with arbitrary base change. The statement
over `ℤ` is taken there from DR VI 1.1, which treats the compactified `j`-line, and the base change
is proved by the reduction to the fields `𝔽_p` used in item 6; Lemma 3.3.1 there is the general
criterion, for a Deligne–Mumford stack which is separated, flat and locally of finite type over `ℤ`.

### Examples

- `Spec ℤ[j]` is coarse but not fine; the exceptional automorphism loci occur at `j = 0` and
  `j = 1728` away from characteristics `2` and `3`, with the stated corrections in those
  characteristics (§6.5).
- For `N ≥ 3`, over `ℤ[1/N]`, `Y₀(N)` is the Borel quotient of `Y_full(N)` and is not a fine moduli
  scheme; its integral construction uses the cyclicity locus of Layer 9 (§§6.2–6.3, 9.6).
- For prime `N ≥ 5`, `Y₁(N)/H` is a smooth affine relative curve over `ℤ[1/N]` for every
  `H ≤ (ℤ/Nℤ)ˣ/{±1}`, including over `𝔽₂` and `𝔽₃`, where `|H|` may be even or divisible by `3`
  (§6.4).

### Dependencies

Layers 0–5 (§§0.3, 0.5, 0.9, 1.3, 2.5, 3.1–3.5, 4.3–4.4, 5.1–5.2). Tau Ceti: affine invariant
quotients and their universal property, the relative categorical quotient, the `j`-invariant of an
elliptic curve over a base, the invariant rings of the Legendre and level-three lines, the
automorphism dichotomy for `j ≠ 0, 1728`, and kernel base change. No regularity theorem of Layers
7–9 is used.

## Layer 7: an elliptic curve at a prime

The sources of this layer are Katz, *Serre–Tate local moduli*, Theorem 1.2.1; the points of use in KM
§§5.2–5.3 are cited statement by statement.

This layer studies one elliptic curve and one prime `p`: the `p`-divisible group, the formal
group, the supersingular curves, and the deformation theory. No level structure enters, except
that PD-6 is stated on the rigidifier schemes of Layer 3.5. The named statements are PD-1 to PD-6
and ST-1, ST-2; with the formal parameter of Layer 7.2 and the universal deformation of Layer 7.4
they are the whole input from this theory to Layers 8 and 9.

### 7.1 The `p`-divisible group, the connected–étale sequence, and Frobenius

The regularity theorems of Layer 8 consume a short, specific list of statements about
`p`-divisible groups and the ordinary/supersingular dichotomy. They are enumerated here and in Layer 7.3 as targets,
each with its base, hypotheses, conclusion, and KM point of use. No general Dieudonné theory and
no Oort–Tate classification are scheduled: the argument never classifies group schemes of order
`p` (rigidity runs through Frobenius kernels, Layer 8.7, and homogeneity through Serre–Tate,
Layers 7.5 and 8.3), and no later layer of this roadmap consumes such a classification.

**PD-1, the tower.** Base: an elliptic curve `E/S` over an arbitrary scheme, `p` prime.
Construct `E[p^∞] = (E[pⁿ])_{n≥0}`: each `E[pⁿ]` finite locally free of rank `p^{2n}`
(§2.1), each `E[pⁿ]` the kernel of `pⁿ` on `E[p^{n+1}]`, multiplication by `p` carrying
`E[p^{n+1}]` onto `E[pⁿ]` as an fppf epimorphism, formation commuting with arbitrary base
change. The clauses are Tau Ceti's at every finite level: `EllipticCurveGeom.torsionMulBy m n` is
finite, flat and surjective (`isFinite_torsionMulBy_left`, `flat_torsionMulBy_left`,
`surjective_torsionMulBy_left`), `E[m]` is its kernel (`isPullback_torsionInclusion`), and both
commute with base change (`torsionInclusion_left_comp_torsionMap`); owned here is the tower as an
object with these structure maps. This is the carrier quantified over by Reg. 3 (KM pp. 129–130) and by G2 of Layer 8.5;
`Suggested.lean` renders its isomorphisms as `PDivisibleGroupIso`, compatible systems of
isomorphisms of finite levels.

**Checks.**

- For `E = E'` the identities of the `E[pⁿ]` form such a system. The system which is `[−1]` on
  `E[p]` and the identity on every other level is excluded by the compatibility with
  `E[p] ⊆ E[p²]` when `p` is odd, since `[−1] ≠ 1` on `E[p]`, the map `[2]` being an automorphism
  of `E[p] ≠ 0`; for `p = 2` the same holds one level up, `[2]` being nonzero on `E[4]`. A
  definition by a family of isomorphisms with no compatibility would admit both.
- Over a separably closed field in which `p` is invertible, `E[pⁿ]` is the constant group
  `(ℤ/pⁿℤ)²` and a system is an isomorphism of Tate modules `T_p E ≅ T_p E'` read modulo each
  `pⁿ`: the systems from `E` to itself form `GL₂(ℤ_p)`, and one exists between any two curves,
  isogenous or not.
- Over an algebraically closed field of characteristic `p` there is none between an ordinary and
  a supersingular curve: `E[p]` has `p` points on one side and one on the other.
- For `p = 1` every `E[1ⁿ]` is the trivial group and there is exactly one system between any two
  curves, which is why Reg. 3 and G2 take `p` prime.

**PD-2, connected–étale.** Base: a henselian local ring. Construct the connected–étale
sequence of a finite locally free commutative group scheme, functorial, compatible with local
base change of henselian local rings. Over a perfect field the sequence splits; for a
henselian local base with perfect residue field, this is a splitting of the special fibre,
not an assertion that the whole sequence over the local ring splits. Applied to `E₀[pⁿ]`
over a field it defines the dichotomy the theorems of Layer 8 turn on: `E₀/k` is **ordinary** if
`E₀[p]⁰` has rank `p`, **supersingular** if `E₀[p]` is connected (`Suggested.lean`,
`IsSupersingular`, on Tau Ceti's `E₀.torsion p`). Prove the comparison with the pinned notion
(supplier contracts): for an elliptic Weierstrass curve `W` over a field `k`, with `E₀` the
elliptic curve of its projective model, and every `p ≥ 1`, the scheme `E₀[p]` is connected if and
only if `W.IsSupersingular p`. Both sides say that `E₀[p]` has no point over an algebraic closure
of `k` other than the origin: a finite `k`-scheme is connected exactly when it has one point,
the point of the origin is `k`-rational and so carries exactly one point with values in the
algebraic closure, and the points dictionary of Layer 1.2 identifies the points of `E₀[p]` over
the algebraic closure with the `p`-torsion of `W` there. The comparison holds over imperfect
fields as well, which is why the pinned notion uses the algebraic closure and not the separable
one. *Needs:* Layer 1.2, Layer 2.1 (`E[p]` is finite over the base), the pinned
`WeierstrassCurve.IsSupersingular`.

**Checks** (for the comparison).

- Over `𝔽₂`, `y² + y = x³` has `j = 0`: the partial derivative of the equation in `y` is `1`, so
  there is no point of order two over any extension, `E₀[2]` has one point, and the pinned
  criterion in characteristic `2` gives supersingular. `y² + xy = x³ + 1` has `j = 1`: the point
  `(0, 1)` has order two, `E₀[2]` has two points, and the pinned criterion gives ordinary.
- Over the imperfect field `𝔽₂(t)`, `y² + xy = x³ + t` has `j = 1/t ≠ 0` and its only nonzero
  point of order two is `(0, √t)`, defined over `𝔽₂(√t)`. `E₀[2]` has two points, the origin and a
  point with residue field `𝔽₂(√t)`, so it is not connected, and the curve is ordinary in both
  senses. A definition which read the points over a separable closure would call it supersingular.
- For `p` different from the characteristic, `E₀[p]` is étale of rank `p² ≥ 4` and is never
  connected, and `W` has nonzero `p`-torsion over the algebraic closure: both sides are false.
  For `p = 1` both sides are true.

**PD-3, Frobenius and Verschiebung.** Over a base of characteristic `p`: relative Frobenius
`F : E₀ ⟶ E₀^{(p)}` and Verschiebung `V` with `V∘F = p = F∘V`, for elliptic curves and
their finite levels. Input to PD-4 and to every kernel identification of Layer 8.7. Over a field
the Verschiebung of a Weierstrass curve is Tau Ceti's as an isogeny of function fields
(`TauCeti.Isogeny.verschiebungIsogeny`, with both composites equal to `[p]`, degree `p`, and pure
inseparability exactly for supersingular curves; the supplier contracts), and the relative
Frobenius of a commutative group scheme over a base of characteristic `p` is Tau Ceti's
`AlgebraicGeometry.Scheme.relativeFrobeniusCommGrpHom`. Owned here are the Verschiebung as a
morphism of group schemes over a base of characteristic `p`, the identities `V∘F = p = F∘V`, the
restriction of `F` and `V` to the finite levels, and their agreement over a field with the pinned
isogenies.

*Needs:* §§0.2, 1.2, 1.4, 2.1; Tau Ceti `EllipticCurveGeom.torsion`, `torsionInclusion`,
`torsionMulBy` with the transition lemmas named in PD-1, `WeierstrassCurve.IsSupersingular`,
`TauCeti.Isogeny.verschiebungIsogeny` and `AlgebraicGeometry.Scheme.relativeFrobeniusCommGrpHom`;
Mathlib `HenselianLocalRing`.

**Further sources.** EGM (10.10) and (10.15) for `p`-divisible groups over a base scheme and their
height, and (10.16) for the `p`-divisible group of an abelian variety over a field; EGM (4.45) and
(10.21) for the connected–étale sequence over a field, a special case of PD-2; EGM (5.18) and (5.19)
for the Verschiebung of a flat commutative group scheme over a base of characteristic `p`, with
`V∘F = p` and the duality between `F` and `V` for finite locally free groups.

### 7.2 Formal completion at the zero section

For an elliptic curve over a complete local ring `A`, construct the formal completion at the zero
section intrinsically as a one-dimensional smooth commutative formal group. Prove its compatibility
with the scheme group law and with complete local base change. After choosing a parameter—that is,
a trivialisation of the conormal line—construct an isomorphism of the completed local ring with
`A[[X]]`; prove that another parameter acts by a power series `X↦uX+⋯` with `u∈Aˣ`, and state all
coordinate formulae equivariantly under this change. In the chosen coordinate identify the
completed divisor `n[0]` with `(Xⁿ=0)`. Relate the formal `p`-series to Frobenius and Verschiebung.

For a Weierstrass curve the objects are Tau Ceti's (supplier contracts), after AEC IV.1:
the formal group law `WeierstrassCurve.formalGroup W`, a commutative `FormalGroup R` compatible
with base change, and the formal point `WeierstrassCurve.projModelFormalPoint W`, the point
`[z : −1 : w(z)]` of the projective model with values in `R⟦z⟧`, which exhibits `z = −X/Y` as a
parameter along the zero section; an isomorphism of projective models preserving the zero
sections changes it by `z` times a unit of `R⟦z⟧`
(`exists_unit_projModelFormalPoint_comp_eq`). In a chart, the addition morphism of the projective
model restricted along pairs of formal points is the formal group law
(`WeierstrassCurve.lift_projModelFormalPoint_additionMorphism`), the divisor `n[0]` pulls back to
`(Xⁿ)` (`zeroSectionDivisor_pow_comap_projModelFormalPoint`), and this ideal does not change when
the parameter is multiplied by a unit (`zeroSectionDivisor_pow_comap_subst_unit_projModelFormalPoint`).
Owned here: the completion of an elliptic curve `E/A` along its zero section as a formal group,
defined without a Weierstrass equation; its identification, in a Weierstrass chart, with `A[[X]]`
carrying `WeierstrassCurve.formalGroup` of the chart through the parameter `z`, so that the group law
of §1.4 induces the pinned formal group law; the independence of the chart; base change; and the
relation of the `p`-series with `F` and `V` of PD-3. The height of the formal group of a Weierstrass
curve over a field of characteristic `p` is Tau Ceti's (`WeierstrassCurve.height_formalGroup_eq_one_iff`,
after AEC IV.7); PD-5 uses it for the supersingular case, where the height is two.

*Needs:* §§0.1, 1.3, 1.4 and the Frobenius of PD-3; Tau Ceti `WeierstrassCurve.formalGroup`,
`WeierstrassCurve.projModelFormalPoint`, `exists_unit_projModelFormalPoint_comp_eq`,
`lift_projModelFormalPoint_additionMorphism`, `zeroSectionDivisor_pow_comap_projModelFormalPoint`,
`zeroSectionDivisor_pow_comap_subst_unit_projModelFormalPoint`,
`WeierstrassCurve.height_formalGroup_eq_one_iff`; Mathlib `FormalGroup`, `PowerSeries`,
`AdicCompletion`.

**Checks.**

- For `n = 1` the completed divisor `[0]` is `(X = 0)`, the zero section of the formal group; a
  coordinate in which `[0]` were `(X − c = 0)` with `c ≠ 0` is not a parameter at the origin.
- Changing the parameter by `X ↦ uX + ⋯` with `u ∈ Aˣ` carries `(Xⁿ = 0)` to itself, since
  `uX + ⋯` is `X` times a unit of `A[[X]]`; with `u` not a unit the substitution is not an
  automorphism of `A[[X]]`, and for `A = k[ε]/(ε²)`, `u = ε` it sends `X` to a zero divisor.
- For the multiplicative formal group law `X + Y + XY` the `p`-series is `(1 + X)^p − 1`, equal
  to `X^p` in characteristic `p`: height one. The formal group of a supersingular curve has
  `p`-series beginning in degree `p²`, so an identification of the completion of a supersingular
  curve with the multiplicative formal group is excluded by the height.

### 7.3 Supersingular curves

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
`m` roots: a supersingular `j` exists and there are at most `m` of them. For `p = 2`, and
again for `p = 3`, (a) is Tau Ceti's: an elliptic Weierstrass curve over a field of
characteristic `2`, respectively `3`, is supersingular exactly when `j = 0`
(`WeierstrassCurve.isSupersingular_iff_j_eq_zero_of_char_two` and
`WeierstrassCurve.isSupersingular_iff_j_eq_zero_of_char_three`, the supplier contracts), so
`j = 0` is the unique supersingular invariant in these characteristics; with the comparison of PD-2 this is the
statement about the connectedness of `E₀[p]`. In all of (a) "supersingular" is the pinned notion
for a Weierstrass equation of the curve, which is the one AEC V.4.1 uses, and the comparison of
PD-2 passes to the group scheme. Route for (b): the `k`-points of
`𝕄(δ)` above a given `j` are the pairs `(E, α)` with `j(E) = j` up to isomorphism, finitely
many because `E` is determined by `j` up to isomorphism over `k` and `δ(E/k)` is finite, and
the closed points of the fibre are the Galois orbits of the `𝔽̄_p`-points; the fibre is smooth
of dimension one over `𝔽_p`, so no closed point is isolated. *Needs:* Mathlib
`WeierstrassCurve.j`, Layer 1.3 (Weierstrass coordinates and variable changes), Layer 2.1
(`E[p]` and its rank), PD-2 (the dichotomy and its comparison with the pinned notion), Layer 3.5
(the two rigidifiers and the smoothness of their schemes over `ℤ[1/M]`), and the pinned
`WeierstrassCurve.IsSupersingular` with its `j`-criteria in characteristics `2` and `3` and its
trace criterion `WeierstrassCurve.isSupersingular_iff_dvd_frobeniusTrace` over a finite field.
Witnesses, which also pin the direction of the dichotomy: for `p = 3`, `H_3 = 1 + t` has the
single root `λ = −1`, giving `y² = x³ − x`, which the pinned trace criterion certifies as
supersingular by its trace `a_3 = 0`, and the pinned `j`-criterion by `j = 1728 = 0` in `𝔽₃`; for `p = 5`,
`H_5 = t² − t + 1` has two roots, conjugate in `𝔽₂₅`, both with `j = 0`, so there is exactly one
supersingular `j`-invariant, and a count that reported the roots of `H_p` instead of the
`j`-invariants would give two; for `p = 7`, `H_7 = (t + 1)(t² + t + 1)` has three roots in
`𝔽₇`, all with `j = 1728 = 6`; for `p = 2`, `y² + y = x³` has three points over `𝔽₂`, so
`a_2 = 0` and it is supersingular, while `y² + xy = x³ + 1` has the point `(0, 1)` of order
two and is ordinary. On the rigidifier schemes: the fibre of `𝕄([Γ(3)])` over `𝔽̄₂` has
`|GL₂(𝔽₃)|/|Aut(y² + y = x³)| = 48/24 = 2` supersingular points, and the Legendre line over
`𝔽̄_p` has the roots of `H_p` as its supersingular points, `1`, `2` and `3` of them for
`p = 3, 5, 7`, in each case the quotient `12/|Aut E|` with `|Aut E| = 12, 6, 4`.

*Needs:* §§7.1–7.2; for PD-6, §§1.3, 2.1 and 3.5 and the pinned criteria for supersingularity
named there; for PD-5, Lazard's classification of one-dimensional formal groups of height two over
an algebraically closed field, a target of this section, and the `p`-divisible group of the formal
group `Ê₀`.

**Further sources.** DR VI 1.2 for the finiteness of the set of supersingular `j`-invariants over an
algebraically closed field, without the bound of PD-6; EGM (5.26) for the supersingular curve
`y² + y = x³` in characteristic `2`.

### 7.4 Universal deformations of elliptic curves

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

*Needs:* §§1.4, 3.1; Mathlib `WittVector`, `PowerSeries`, `IsArtinianRing`, `IsLocalRing`; Tau
Ceti `EllObj`, `EllipticCurveGeom.baseChange`.

**Checks.**

- Test algebras: `k` itself, `k[ε]/(ε²)` and `W₂(k) = W(k)/p²` are test algebras; `W(k)` is not
  Artinian and `k × k` is not local. The condition that the residue map restricts to the
  projection `W(k) ⟶ k` excludes `A = k` with the Frobenius of `k` as residue map, which is
  surjective with kernel the maximal ideal `0` and would twist the special fibre.
- Over the test algebra `k` a deformation is a curve `E/k` with an arrow of `Ell/W(k)` from `E₀`
  over the identity of `Spec k`, that is, an isomorphism `E₀ ≅ E`: there is exactly one up to
  unique isomorphism, and the universal property gives the one map `T ↦ 0`.
- A map `ψ` of the universal property sends `T` to a nilpotent element, because it lies over the
  residue maps, and is determined by `ψ(T)`: if `ψ(T)ⁿ = 0` then `ψ` factors through
  `W(k)[T]/(Tⁿ)`. Over `k[ε]/(ε²)` the maps are `T ↦ cε`, `c ∈ k`, a line, as are the
  deformations of `E₀` there.
- The pullback of a universal family along `T ↦ T²` is not universal: every `T ↦ cε` then induces
  the deformation of `T ↦ c²ε² = 0`, so a nontrivial deformation over `k[ε]/(ε²)` has no `ψ`.
  A family constant in `T` fails uniqueness as well: `T ↦ 0` and `T ↦ ε` induce the same
  deformation.

**Further sources.** DR III 1.2: an elliptic curve over a field, and likewise an `n`-gon with `n`
prime to the characteristic, has no infinitesimal automorphisms, and its deformation functor is
effectively pro-representable by a ring of power series in one variable; this is more general and
includes the effectivity that provides a curve over `W(k)[[T]]`. Oort, Theorem (2.2.1): the local
moduli functor of an abelian variety of dimension `g` is pro-representable by a ring of power series
in `g²` variables over the Witt vectors.

### 7.5 The Serre–Tate equivalence

Serre–Tate theory enters through the statements ST-1 to ST-5 and no others. Throughout, `k` is a
perfect field of characteristic `p` (algebraically closed at every point of use), `W(k)` its Witt
vectors, and the base category is that of artinian local `W(k)`-algebras with residue field `k`,
as in Layer 7.4. The first two statements involve no moduli problem and are stated here; ST-3 is
Layer 8.3, and ST-4 and ST-5 are Layer 8.6.

**ST-1, the Serre–Tate equivalence.** For `R` artinian local as above and `E₀/k`, the functor
`E/R ↦ E[p^∞]` is an equivalence from the groupoid of deformations of `E₀` over `R` to the
groupoid of deformations of `E₀[p^∞]` over `R`, functorially in `R` and compatibly with the
identifications of special fibres. KM invoke this by name and do not prove it (p. 134); the
proof source is Katz, *Serre–Tate local moduli*, Theorem 1.2.1 (the references).

**ST-2, the universal deformation of the `p`-divisible group.** For `E₀/k` supersingular, `k`
algebraically closed, and `E/W(k)[[T]]` the universal formal deformation of Layer 7.4: `E[p^∞]` over
`W(k)[[T]]` is the universal formal deformation of `E₀[p^∞]` (KM p. 134, via ST-1).

Record, as separate lemmas, the compatibility of ST-1 with connected–étale sequences and with the
ordinary/supersingular dichotomy of PD-5.

*Needs:* §§0.2, 7.1, 7.3, 7.4; Katz, *Serre–Tate local moduli*, Theorem 1.2.1, as the proof
source of ST-1.

**Further sources.** Katz, Theorem 1.2.1, is stated for abelian schemes of every dimension, over a
ring in which `p` is nilpotent and for an arbitrary nilpotent ideal; ST-1 is the case of an elliptic
curve over an artinian local ring.

### Examples

- On a supersingular elliptic curve in characteristic `p`, `E[p]` has rank `p²` but no nonzero
  geometric points, and the zero section is a Drinfeld point of exact order `p`, since
  `p[0] = ker(F_{E/S})` as degree-`p` divisors (§§7.1–7.3).
- Over `𝔽̄_p` the supersingular `j`-invariants are `0` for `p = 2, 3, 5` and `1728` for `p = 7`
  (PD-6 witnesses, §7.3).
- The universal deformation of `E₀/k` lives over `W(k)[[T]]`, and its tangent space `T ↦ cε` over
  `k[ε]/(ε²)` is a line (§7.4).

### Dependencies

Layers 0–3 (§§0.1–0.2, 1.2–1.4, 2.1, 3.1, 3.5). Tau Ceti: torsion and its transition maps, the
relative Frobenius of commutative group schemes, the equation-level Verschiebung and
supersingularity criteria, the formal group law of a Weierstrass curve with its formal point and
height criterion. Katz's proof of the Serre–Tate theorem is the source for ST-1.

## Layer 8: the axiomatic theorems and regularity of `[Γ(N)]`, `[Γ₁(N)]`, and balanced `[Γ₁(N)]`

The sources of this layer are KM 5.1.1, 5.2.1, 5.2.2, 5.3.1–5.3.6, 5.4, 6.2.1, 7.5.1–7.5.3 and 7.6.1.

Layers 8.1–8.5 are about an arbitrary moduli problem, or morphism of moduli problems, satisfying a
list of axioms; no particular level structure enters. Layers 8.6–8.9 verify the regularity axioms
for the three problems of Layer 4.4 and for their standard quotients, and conclude. The axioms of
Layer 8.4 are verified in Layer 9.3, and the `[Γ₀(N)]` clause of the regularity theorem is
Layer 9.4.

### 8.1 The regularity axioms

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

State the Axiomatic Regularity Theorem (KM 5.2.1; `axiomaticRegularity`): a moduli problem
satisfying these axioms is finite flat of constant rank at least one and regular of dimension
two. Its proof is Layer 8.3. KM 5.1.1 is the First Main Theorem, the same conclusion for the three
problems of Layer 4.4 and for `[Γ₀(N)]`: Layer 8.8 obtains it for the three by verifying the
axioms, and Layer 9.4 proves it for `[Γ₀(N)]`.

*Needs:* §§3.1, 3.6, 7.1, 7.4; Tau Ceti `ModuliProblem.RelRepData`, `RelRepData.IsRegularOfDim`; Mathlib `Scheme.Hom.finrank`.

**Checks.**

- The trivial problem `[Γ(1)]`, represented over every `E/S` by `S`, satisfies the four axioms at
  every prime: the identity is finite and étale, `𝒫(E₀/k)` is a point, and `𝒫_𝔈` is the spectrum of
  `W(k)[[T]]`, regular local of dimension two with parameters `p` and `T`. The theorem gives rank
  `1`.
- The empty problem satisfies Reg. 1–Reg. 3 and fails the nonemptiness of Reg. 4A; its rank is
  `0`, so without that clause the theorem's positive rank would be false.
- The problem `𝒫(E/S) = E[p](S)` of sections of `E[p]` satisfies Reg. 1–Reg. 3 and Reg. 4A, a
  supersingular `E₀[p]` having the one point `0` over `k`, and fails Reg. 4B: `𝒫_𝔈` is the spectrum
  of `W(k)[[T, X]]/([p](X))` with `[p](X) = X · g(X)`, `g(0) = p`, so `[p](X)` lies in the square of
  the maximal ideal `(p, T, X)` and the quotient, of dimension two, is neither regular nor a
  domain. The problem is finite flat of rank `p²` and not regular, so Reg. 4B cannot be dropped;
  the problem `[Γ₁(p)]` of points of exact order `p` removes the factor `X`.

### 8.2 Local algebra and local schemes

Apply the strict-henselisation, completion, regularity, openness, support, miracle-flatness, and rank
theorems owned by Layer 0.9. For a geometric point of a rigidified finite moduli scheme, identify its
completed strict-henselian local ring with the ring prorepresenting the corresponding marked
deformation groupoid. Prove that this identification transports the universal family and the level
structure and is functorial under a change of rigidifier. This is the local-moduli comparison used
in the homogeneity and regularity arguments; it does not reconstruct the general local-scheme API.
Its point of use is the proof of KM 5.2.1 (pp. 132–134, cited in Layer 8.3).

*Needs:* §§0.9, 3.1, 3.5, 7.4; Tau Ceti `TauCeti.StrictHenselization.algebra`, `TauCeti.AdicCompletion.ringKrullDim_eq`, `TauCeti.AdicCompletion.isRegularLocalRing_iff`.

**Checks.**

- For the trivial problem and a rigidifier `δ`, at a geometric point of characteristic `p` of
  `𝕄(δ)`, smooth of relative dimension one over an open subscheme of `Spec ℤ`, the completed
  strict-henselian local ring is `W(k)[[T]]`, regular of dimension two, which is the ring of the
  universal deformation of Layer 7.4: the two sides agree, and a comparison with the completed
  local ring of the fibre over `𝔽_p` would give `k[[T]]`, of dimension one.
- The strict henselisation is needed before completing: at a closed point with residue field
  `𝔽_p` the completed local ring is `ℤ_p[[T]]`, whose residue field is not algebraically closed,
  and it pro-represents no deformation problem over `W(𝔽̄_p)`.
- For two rigidifiers `δ` and `δ'` the scheme `𝕄(𝒫, δ, δ')` is étale over `𝕄(𝒫, δ)` and over
  `𝕄(𝒫, δ')`, so the completed strict-henselian local rings of the three schemes at corresponding
  geometric points are identified; a comparison which depended on `δ` would not be functorial.

**Further sources.** Conrad, Corollary 3.1.9: for a `Γ(N)`- or `Γ₁(N; n)`-structure on a
generalized elliptic curve over a separably closed field there is a universal formal deformation
ring over a Cohen ring of the field, and the universal formal deformation is uniquely
algebraizable over its spectrum. This is the same comparison in the language of stacks, deduced
there from the general fact that geometric points of a Deligne–Mumford stack admit universal
formal deformations; it includes the cusps and is restricted to the two families of level
structures named. Conrad, Lemma 3.3.4, applies it with KM 5.2.1 and 5.2.2 as the regularity
criteria.

### 8.3 Homogeneity and the proof of the Axiomatic Regularity Theorem

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

*Needs:* §§0.9, 3.5–3.6, 7.3, 7.5, 8.1, 8.2; Tau Ceti `Scheme.Hom.flat_stalkMap_of_isCohenMacaulay_of_quasiFiniteAt`, `TauCeti.IsRegularLocalRing.isCohenMacaulay`.

### 8.4 The Axiomatic Isomorphism Theorem

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

*Needs:* §§0.5, 0.9, 3.5, 7.3–7.5, 8.1–8.3.

### 8.5 Axiomatic regularity of quotients

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

Make the invariant-ring input explicit. Prove KM 7.5.2 in the following form: let `A` be a
complete noetherian regular local ring with perfect residue field and regular parameters
`x₁, …, xₙ`, and let a finite group `H` act faithfully on `A` by ring automorphisms which induce
the identity on the residue field and fix `x₁, …, x_{n−1}`. Then `A^H` is a complete noetherian
regular local ring with regular parameters `x₁, …, x_{n−1}, N(xₙ)`, where `N(xₙ) = ∏_{h∈H} h(xₙ)`,
and `A` is free over `A^H` on `1, xₙ, …, xₙ^{|H|−1}`. Nothing is assumed of the elements `h(xₙ)`:
each `h` induces an automorphism of the discrete valuation ring `A/(x₁, …, x_{n−1})`, so `h(xₙ)`
is a uniformiser of it, `N(xₙ)` is a unit multiple of `xₙ^{|H|}` there, and
`A/(x₁, …, x_{n−1}, N(xₙ))A` has length `|H|`. The route: the residue field of `A^H` is that of
`A` (the Teichmüller representatives are fixed by `H` in residue characteristic `p`, and the
average over `H` lifts residues in residue characteristic zero), so by completeness the `|H|`
powers of `xₙ` generate `A` over the closed subring `A^H`; they are independent because the
fraction field of `A` has degree `|H|` over that of `A^H`, the action being faithful; and
regularity descends along the finite free local homomorphism `A^H → A`. Prove Variant 7.5.3 by
iterating: for a product `H₁×⋯×H_n` acting faithfully, trivially on the residue field, with `H_i`
fixing `x_j` for every `j ≠ i`, the ring `A^{H₁×⋯×H_n}` is regular with parameters
`N₁(x₁), …, N_n(x_n)` and `A` is free over it of rank `|H₁|⋯|H_n|`.

*Needs:* §§0.9, 6.1, 7.1, 8.1–8.3; Tau Ceti `TauCeti.IsRegularLocalRing.of_flat_of_isLocalHom` (regularity descends along a flat local homomorphism); Mathlib `IsRegularLocalRing`, `AdicCompletion`.

**Checks.**

- For `H = 1` the axioms G1–G3 hold with the generator `1`, and the theorem is the Axiomatic
  Regularity Theorem with a projection of degree `1`.
- A group `H ≠ 1` acting trivially on a nonempty problem fails G1, every point being fixed; the
  projection is then an isomorphism, of degree `1` and not `|H|`.
- G3 is what separates regular from singular invariant rings. On `A = k[[x, y]]`, `p` odd, the
  group `{±1}` acting by `y ↦ −y` has `A^H = k[[x, y²]]` and `A = A^H ⊕ A^H y`, two generators
  and a regular quotient; acting by `(x, y) ↦ (−x, −y)` it has `A^H = k[[x², xy, y²]]`, and
  `A/𝔪_{A^H}A = k[x, y]/(x², xy, y²)` has dimension `3 > |H|`, so `A` needs three generators and
  `A^H` is the cone `uw = v²`, not regular.
- The lemma covers a group which does not multiply the last parameter by a unit. On
  `A = k[[x, y]]` in characteristic `2` the involution `y ↦ y + x` fixes `x`, and `y + x` is not a
  unit multiple of `y` (it is nonzero modulo `y`); `N(y) = y² + xy`, `A^H = k[[x, y² + xy]]` and
  `A = A^H ⊕ A^H y`, two generators and a regular quotient. This is the shape of the unipotent
  element `[[1,1],[0,1]]` of the semi-Borel of Layer 8.9, which sends `X(Q)` to
  `X(P + Q) = F(X(P), X(Q))`, congruent to `X(P)` modulo `X(Q)`.
- The residue field must be perfect. On `A = k[[y]]` with `k = 𝔽_p(t)` the continuous automorphism
  `t ↦ t + y`, `y ↦ y` has order `p` and induces the identity on `k`, and `n = 1` leaves no
  parameter to fix; it fixes `y`, so `N(y) = y^p` is not a parameter of `A^H`, and `1, y` are
  dependent over `A^H`. The residue field of `A^H` is `𝔽_p(t^p)`.
- In G1 the test objects are nonempty: the unique morphism from the empty scheme is fixed by
  every `h`, and without the restriction G1 would say `H = 1`.

### 8.6 Deformation rings with level structure

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

*Needs:* §§4.4, 7.3, 7.4, 8.1.

### 8.7 The three characteristic-`p` calculations

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
   gives `p = 0`. This first conclusion, on Mathlib's `FormalGroup` carrier, is Tau Ceti's
   `FormalGroup.natCast_eq_zero_of_pow_mem_span` (for a prime `p` and `n ≠ 0`); owned here is the
   second, the identification of the subgroup with `Ker(Fⁿ)`.
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
   is constant, by Tau Ceti's `exists_iso_baseChange_iterateFrobenius` (for `r ≫ 0`, `E^{(p^r)}`
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

*Needs:* §§0.1, 0.8, 2.1–2.2, 2.4, 4.1–4.2, 7.1–7.3, 8.1, 8.6; Tau Ceti `FormalGroup.natCast_eq_zero_of_pow_mem_span`, `EllipticCurveGeom.exists_iso_baseChange_iterateFrobenius`, `IsAGenerator.of_isShortExact` (KM 1.11.3).

### 8.8 Verification of the axioms and assembly

Verify Reg. 1–Reg. 4 for each of the three problems at prime-power level. Use the `A`-structure
product theorems of Layer 0.8 to assemble coprime levels.

Conclude that `[Γ(N)]`, `[Γ₁(N)]`, and balanced `[Γ₁(N)]` are finite flat of constant positive
rank over `Ell/ℤ`, regular of dimension two, and finite étale after inverting `N`. For the pinned
`[Γ(N)]` and `[Γ₁(N)]` with their relative-representability data this is `firstMainTheorem_gamma`
and `firstMainTheorem_gammaOne` in `Suggested.lean`; the balanced problem has no carrier at the
pin. The clause after inverting `N` is stated there as: the representing scheme is étale over
every `E/S` on whose base `N` is a unit. `firstMainTheorem_gammaOne` carries it;
`firstMainTheorem_gamma` does not: the pinned `hasProperty_etale_gammaRelRepData` gives the
clause for the problem over a base `B` on which `N` is invertible, and the clause over `Ell/ℤ` is
that lemma for `B = S`. The representing scheme of `E/S` is the Drinfeld-basis scheme
`EllObj.drinfeldBasisScheme` (`gammaRelRepData_rep`), the Drinfeld-basis locus of
`E[N] ×_S E[N]`, in whose construction the structure morphism `S → B` plays no part; identify it
for `(S, S → Spec ℤ, E)` in `Ell/ℤ` and for `(S, 𝟙, E)` in `Ell/S`, where `N` is invertible on the
base `S` by hypothesis. The base change `RelRepData.isPullback` compares the representing
schemes of one problem over one base and does not give this change of base.

*Needs:* §§0.8, 4.3–4.4, 7.1, 8.1, 8.3, 8.7; Tau Ceti `ModuliProblem.gammaRelRepData`, `gammaOneRelRepData`, `hasProperty_etale_gammaRelRepData`, `EllObj.drinfeldBasisScheme`, `FiniteFlatCommGroupScheme.isIso_tensorHom_torsionι_comp_mul`.

**Checks.**

- For `N = 1` the representing scheme of both problems is the base, of rank `1`, and the identity
  is étale.
- Over `S = Spec 𝔽_p` with `p ∣ N` the integer `N` is not a unit and the clause says nothing, as it
  must: for a supersingular curve the scheme of points of exact order `p` is the nonreduced
  `Spec k[X]/(X^{p²−1})`, finite flat of rank `p² − 1` and not étale.
- The rank of `[Γ₁(N)]` is read after inverting `N`: for `N = 4` it is `16 − 4 = 12`, the points of
  `(ℤ/4)²` of order exactly four.

**Further sources.** Conrad, Lemma 3.3.4 and Theorem 4.1.1(2), and Česnavičius, Theorem 4.3.5 and
Theorem 4.4.4, extend the regularity to the compactified stacks over `ℤ`, cusps included, and Conrad
to mixed level; on the locus of elliptic curves both take the theorem of this section from KM 5.1.1
and do not reprove it. Scholze, Theorem 6.2, states the case of level `pⁿ` with an auxiliary level
prime to `p`.

### 8.9 Regular quotients at prime-power level

Verify G1–G3 of Layer 8.5 for the standard quotient problems at prime-power level, and prove
KM 7.6.1:

- for `p^n`, the quotients of `[Γ(p^n)]` by subgroups of the semi-Borel or by product
  subgroups `H₁×H₂` of the diagonal Cartan are regular of dimension two and finite flat
  over `Ell`; the projections from `[Γ(p^n)]` to those quotients are finite flat. The semi-Borel
  is the group `{[[1,b],[0,d]]}` of Layer 6.2, item 3, the stabiliser of `P` in the convention
  `(P,Q)g = (aP + cQ, bP + dQ)`. This clause is `regular_quotient_gamma_primePow` in
  `Suggested.lean`, for a finite group `H` mapping injectively to `GL₂(ℤ/pⁿℤ)` and acting through
  the pinned `gammaAction`, and for every Katz–Mazur quotient formed on `gammaRelRepData`: the
  quotient is finite flat of constant positive rank and regular of dimension two, and the
  projection is finite flat of degree `|H|`;
- for subgroups `G,H⊆(ℤ/p^nℤ)ˣ`, the quotients of balanced `[Γ₁(p^n)]` by `G×H` and of
  `[Γ₁(p^n)]` by `G` are regular of dimension two and finite flat over `Ell`, and the
  projections from the source problems to their quotients are finite flat. The direction
  is source to quotient; no morphism from a quotient back to its source is asserted.

*Needs:* §§6.1–6.2, 8.5, 8.7–8.8; Tau Ceti `ModuliProblem.gammaAction`. No section of this layer uses the curves of Layers 5 and 10 directly; §8.9 reaches §5.2 only through the identifications of §6.2.

**Checks.**

- The pinned action sends the pair `(P, Q)` of a matrix `[[a,b],[c,d]]` to `(aP + cQ, bP + dQ)`,
  so `[[1,b],[0,d]]` gives `(P, bP + dQ)` and fixes `P`, while the transpose `[[1,0],[c,d]]` gives
  `(P + cQ, dQ)` and does not: the semi-Borel condition is on the entries `a = 1`, `c = 0`.
- `H = 1` gives `[Γ(pⁿ)]` and the full semi-Borel gives `[Γ₁(pⁿ)]` (Layer 6.2, item 3, over `ℤ` by
  Layer 9.5), both regular by Layer 8.8; the degree `|H| = pⁿ φ(pⁿ)` of the projection agrees with
  the ranks after inverting `p`: `p^{4n}(1 − 1/p)(1 − 1/p²)` for `[Γ(pⁿ)]` against
  `p^{2n}(1 − 1/p²)` for `[Γ₁(pⁿ)]`.
- For `p = 2`, `n = 1` the group `GL₂(𝔽₂)` has order `6`, the semi-Borel is `{1, [[1,1],[0,1]]}`
  and the diagonal Cartan is trivial; the quotient by the semi-Borel has rank `6/2 = 3`, the three
  points of order two.
- A homomorphism to `GL₂(ℤ/pⁿℤ)` which is not injective has a nontrivial kernel acting trivially;
  the quotient is that by the image, and the degree of the projection is the order of the image
  and not `|H|`.

**Further sources.** Česnavičius, Theorem 4.5.1, obtains the regularity of a stack of level `H` by a
different route: from a proper flat surjection from the compactified stack of full level, in place
of rings of invariants.

### Examples

- The trivial problem `[Γ(1)]` satisfies Reg. 1–Reg. 4 at every prime, and the Axiomatic
  Regularity Theorem gives rank `1` (§8.1).
- The problem of sections of `E[p]` is finite flat of rank `p²` and fails Reg. 4B; `[Γ₁(p)]`
  satisfies it, with the parameters `T, X(P)` of the KM 5.4 table (§§8.1, 8.7).
- The quotient of `[Γ(p)]` by the semi-Borel is `[Γ₁(p)]`, regular of dimension two, with a
  projection of degree `p(p − 1)` (§8.9).

### Dependencies

Layers 0, 3, 4, 6 and 7 (§§0.1, 0.5, 0.8–0.9, 2.1–2.2, 2.4, 3.1, 3.5–3.6, 4.1–4.4, 6.1–6.2,
7.1–7.5). Tau Ceti: the strict henselisation and completions of Noetherian local rings, miracle
flatness at a quasi-finite point, descent of regularity along flat local homomorphisms, the
formal-group computation of KM 5.3.4, the high Frobenius twists of an elliptic curve over an
Artinian local ring, and the Drinfeld problems with their relative representability data.

## Layer 9: `[N-Isog]`, cyclicity, and `[Γ₀(N)]`

The sources of this layer are KM 6.1.1, §§6.3–6.6 and the Notes Added in Proof, and KM 7.4.2 for the integral
quotient identifications.

### 9.1 The problem `[N-Isog]` and its finiteness

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

*Needs:* §§0.7, 0.8, 2.1, 3.1, 7.1, 7.3; Tau Ceti `Module.Grassmannian.schemeHopfIdealLocus`, `Module.Grassmannian.subgroupScheme`, `isPullback_schemeHopfIdealLocusFamilyHom`, `isProper_subschemeι_schemeHopfIdealLocus_toSpec`.

**Further sources.** Česnavičius, Proposition 4.2.15(b): the finite locally free subgroups of rank
`n` of an elliptic curve are parametrised by a scheme finite locally free over the base, of rank the
number of subgroups of order `n` of `(ℤ/nℤ)²`, and étale where `n` is invertible. This is the
statement of KM 6.8.1, stronger than the finiteness proved here, and it is stated there for
generalized elliptic curves.

### 9.2 Generator schemes and the cyclicity theorem

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

*Needs:* §§0.2, 0.8, 4.1; Tau Ceti `TauCeti.IsAGenerator`, `quotientGeneratorIdealHomEquivAGenerators`, `isAGenerator_baseChange_iff`, `EllipticCurveGeom.IsCyclicSubgroup`.

**Further sources.** Conrad, Theorem 2.3.7, and Česnavičius, Proposition 4.2.7(a) and (b): the same
criterion for subgroups of the smooth locus of a generalized elliptic curve, with the additions that
cyclicity may be tested fpqc-locally and that the scheme of generators is étale where the order is
invertible. Both reduce to KM 6.1.1 for elliptic curves.

### 9.3 The cyclicity theorem at prime-power level

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

*Needs:* §§0.8, 4.1, 4.3, 7.1–7.3, 8.4, 8.6–8.8, 9.2; Mathlib `PowerSeries`, `MvPowerSeries` and Weierstrass division in one variable over a complete local ring (`PowerSeries.IsWeierstrassDivisionAt`, `PowerSeries.IsWeierstrassDivisorAt`).

### 9.4 The cyclicity locus and `[Γ₀(N)]`

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
finite, flat, of constant rank `N ∏_{p∣N}(1 + 1/p)` and regular of dimension two, and étale over
every `E/S` on whose base `N` is a unit. KM §6.8's stronger theorem
that the whole `[N-Isog]`-problem is finite flat requires an additional lifting theorem for
homomorphisms and is outside this roadmap's endpoint; only its finiteness from Layer 9.1 is used here.

*Needs:* §§0.9, 3.2, 3.6, 4.2–4.4, 8.8, 9.1–9.3; Tau Ceti `ModuliProblem.gammaZero`, `gammaOneToGammaZero`, `TauCeti.AlgebraicGeometry.IsRegular.of_flat_of_surjective`, `Scheme.Hom.topologicalKrullDim_opens_eq_of_flat_of_surjective`.

**Further sources.** Česnavičius, Proposition 4.2.7(c): the cyclicity locus is a closed subscheme of
finite presentation, for generalized elliptic curves. Conrad, Lemma 4.2.3(4), is the finite flat
morphism from the stack of `Γ₁(N)`-structures to that of `Γ₀(N)`-structures, and Conrad, Lemma
3.3.4, proves the regularity of the mixed problem `Γ₁(N;n)` on elliptic curves, which for `N = 1` is
`Γ₀(n)`, by descent of regularity along a finite locally free covering, the route of this section.
Česnavičius, Theorem 5.13, proves the regularity of the compactified stack `X₀(n)` over `ℤ`.

### 9.5 The standard quotient identifications over `ℤ`

Prove the seven identifications of Layer 6.2 over `ℤ`. After adjoining an arbitrary representable
étale rigidifier, prove that source and target are finite normal schemes over the rigidifier and
are the normalisation in the same finite étale algebra over the generic open, where the
identification is that of Layer 6.2. Invoke a separately proved uniqueness theorem for
normalisation to obtain the integral isomorphism. A comparison on field-valued points is not a
proof in residue characteristic dividing `N`. Normality of the problems involved is supplied by
the regularity theorems of Layers 8.8 and 9.4.

*Needs:* §§3.5, 6.1–6.2, 8.8, 9.4; Mathlib `Scheme.Hom.normalization` with `normalizationDesc` and `normalization.hom_ext`.

**Further sources.** Česnavičius, Proposition 6.3, with Theorem 4.4.4 and Theorem 5.13, gives the
identifications for `Γ₁(n)` and `Γ₀(n)` over `ℤ` in the language of stacks, cusps included: the
stacks are the normalisations of the level-one stack, and the quotient problems are their loci of
elliptic curves.

### 9.6 The coarse Borel formula for `Y₀(N)`

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

*Needs:* §§4.3, 5.2, 6.2–6.3, 9.4.

**Further sources.** Česnavičius, Lemma 6.2, and DR IV 3.10(iii): the coarse space of level `H` is
the quotient of the coarse space of full level by the image of `H`, for every `H` and with the
cusps.

### Examples

- For `N = p` prime and `E` ordinary over `𝔽̄_p`, `E[p] ≅ μ_p × ℤ/pℤ` has exactly two subgroups of
  rank `p`, `μ_p` and `ℤ/pℤ`, both cyclic; for `E` supersingular it has one, `ker F` (§9.1).
- `[Γ₀(N)]` has rank `N ∏_{p ∣ N}(1 + 1/p)` over `Ell/ℤ`: `p + 1` for `N = p`, `6` for `N = 4`, `12`
  for `N = 6` (§9.4).
- For `N ≥ 3`, over `ℤ[1/N]`, `Y₀(N)` is the coarse Borel quotient `Y_full(N)/B` (§9.6).

### Dependencies

Layers 0, 2–4, 7 and 8 (§§0.2, 0.7–0.9, 2.1, 3.1–3.2, 3.6, 4.1–4.4, 7.1–7.3, 8.4, 8.6–8.8), and,
for §§9.5 and 9.6 only, Layers 3, 5 and 6 (§§3.5, 4.3, 5.2, 6.1–6.3). Tau Ceti: the Hopf-ideal
locus over an affine base, `A`-generators over an affine base, `[Γ₀(N)]` with the map from
`[Γ₁(N)]`, and descent of regularity along flat surjections; Mathlib's relative normalisation and
Weierstrass division.

## Layer 10: compactified coarse curves over `ℤ[1/N]`, cusps, and the Shimura covering

The sources of this layer are KM 8.6 (cusps by normalisation near infinity; compactified coarse moduli
schemes), KM 8.11 (computation of the cusps via the Tate parameter), KM 10.5–10.9 (10.6 for
cusp-labels, 10.8–10.9 for the structure near infinity and the basic moduli problems), and Mazur,
*Modular curves and the Eisenstein ideal*, II §§1–2.

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
away from the level, and the Mazur interface, recorded under Scope and ownership, identifies the
remaining suppliers. **The
consumer is Mazur Ch. II §§1–2 — the curve geometry — and nothing more.** Mazur's torsion theorem
and the Eisenstein-ideal arithmetic are *not* targets of this roadmap, and no layer below claims
an interface to them; see the boundary paragraph of the Mazur interface under Scope and ownership. The method is that of
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
§§10.3 and 10.4 use Mazur's normalisation `n = num((N−1)/12)` and his Table 1, which are stated
for prime level, and no composite-level assertion is made here. Per-item hypotheses beyond
membership: the smoothness, cusp, Cartier-divisor, and geometric-fibre base-change milestones of
§§10.1–10.2 are asserted for **every** member of the class; §10.3 concerns the two ends
(`X₁(N) → X₀(N)`); §10.4 takes `H` the unique subgroup of `Δ` of order `gcd(N−1, 12)/2`.

`Suggested.lean` states no theorem of this layer: the diamond action of `(ℤ/Nℤ)ˣ` on `Y₁(N)`, and
with it `Y_H`, is not available at the pins, and its module docstring says so. Mathlib's relative
normalisation (`Scheme.Hom.normalization` with `toNormalization`, `fromNormalization`,
`normalizationDesc` and `normalization.hom_ext`) is consumed as it stands, and the functorial map
between relative normalisations over a common target is Tau Ceti's `Scheme.Hom.normalizationMap`;
neither is restated.

The modular conclusions of §§10.1–10.4 are stated on their actual input objects. The projective
`j`-line over `ℤ[1/N]` is Tau Ceti's `TauCeti.AlgebraicGeometry.projectiveLine`, with its affine chart
`projectiveLine.polynomialChartι` and its infinity section `projectiveLine.infinitySection`;
construct the quotient `Y₁(N)/H` with its coarse-moduli/quotient identification and the
corresponding `j`-map, and state each theorem on those objects, with `N ≥ 5` prime and `H ≤ Δ`, or on data equipped with those
identifications and all required compatibility squares. A proper smooth relative curve with
a section does not identify `ℙ¹_j`; arbitrary qcqs maps do not identify modular curves.
No unused prime-level field or membership docstring can replace these hypotheses.

This applies to every modular conclusion, not just the two exceptional members: finiteness of
the compactification map, identification of the affine open, properness and smoothness,
relative Cartier and flatness statements for the full cusp fibre, finite étaleness of its
reduction, geometric-fibre normalisation comparison, extensions of modular maps, and the
Shimura covering with degree `(N − 1)/gcd(N − 1, 12)`. For `X₀(N)`, the two-section statement is about
the reduced cusp model; the six-row ramification table is about the specified map
`X₁(N) → X₀(N)` and consumes §10.3's named different/Riemann–Hurwitz package. None of these
claims is asserted for arbitrary generic normalisation data.

### 10.1 The compactified coarse curve

For a standard problem of this layer (the class fixed above) with coarse scheme `Y_H/ℤ[1/N]` and its
`j`-map to the coarse `j`-line `𝔸¹_j` (KM 8.2.2, §6.5), define `X_H` as the normalisation of `ℙ¹_j`
over `ℤ[1/N]` in `Y_H`, using Mathlib's relative normalisation `Scheme.Hom.normalization` with
`toNormalization`, `fromNormalization`, `normalizationDesc` and the universal property
`normalization.hom_ext`, so that the definition exists as soon as the morphism `Y_H ⟶ ℙ¹_j` does.
The milestones are the modular-curve statements: `fromNormalization` is **finite** in this
situation (Tau Ceti's `isFinite_fromNormalization_of_isJapanese` gives finiteness of the
normalisation of an integral scheme with Japanese rings of sections in a finite extension of its
function field, applied at the generic points of `Y_H`); the restriction of `X_H`
over `𝔸¹_j` is identified with `Y_H`; `X_H` is a smooth proper relative curve over `ℤ[1/N]` —
smooth on the interior `Y_H` by Layer 6.4's quotient-smoothness theorem (KM, Notes Added in
Proof) applied to `Y₁(N)` with its diamond action, and smooth along the boundary by §10.2's
formal-cusp calculation, **two separate inputs**, the first of which is a theorem consumed
from Layer 6.4 and not a consequence of regularity and flatness — with,
as everywhere in this roadmap, **no** connectedness or irreducibility assertion (Scope and ownership, and
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
nonreduced. (i) **Smooth base change is supplied**: Mathlib's comparison morphism
`normalizationPullback` is an isomorphism for smooth `g`, by an instance. (ii) The
stronger statement this roadmap needs is exactly one theorem, stated now and **in Mathlib's
direction**: **geometric-fibre base change** — for every algebraically closed field `k` with
`char k ∤ N`, the canonical comparison
`Norm_{ℙ¹_k}(Y_H ×_{ℤ[1/N]} k) ⟶ X_H ×_{ℤ[1/N]} k` (the arrow `normalizationPullback`
produces: normalisation of the base change *to* base change of the normalisation) is an
isomorphism, compatibly with the open immersion of `Y_{H,k}`, with the cusp subscheme of
§10.2, with the compactified `X₁(N) → X₀(N)` morphism of §10.3, and with the group action
defining the inertia there. The displayed inverse `X_{H,k} ≅ Norm_{ℙ¹_k}(Y_{H,k})` is a
corollary, not the canonical map. Passing to a residue characteristic is not smooth, so
(i) does not give this, and §10.3's fibrewise table stands on (ii). **Order matters, and
this theorem comes last**: its proof consumes §10.2's formal-cusp package, so the internal
order of §§10.1–10.2 is — define `X_H`; prove `fromNormalization` finite and identify
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

*Needs:* §§0.1, 5.1, 6.3–6.5, and §10.2 for the boundary; Mathlib `Scheme.Hom.normalization`,
`toNormalization`, `fromNormalization`, `normalizationDesc`, `normalization.hom_ext`,
`normalizationPullback` with its `IsIso` instance for smooth base change; Tau Ceti
`TauCeti.AlgebraicGeometry.projectiveLine`, `projectiveLine.polynomialChartι`,
`projectiveLine.infinitySection`, `isFinite_fromNormalization_of_isJapanese`,
`Scheme.Hom.normalizationMap`.

**Checks.**

- For the qcqs open immersion `D(t) ↪ Spec k[t]` the relative normalisation is `Spec k[t]`, and
  after base change to `t = 0` the source is empty while the base change of the normalisation is
  `Spec k`: normalisation does not commute with arbitrary base change, which is why the
  geometric-fibre comparison is a theorem with four steps and not bookkeeping.
- Adjoining a disjoint copy of `ℙ¹_j` to `X_H` gives a normal scheme, finite over `ℙ¹_j` and
  receiving `Y_H` over the `j`-line, that is not `X_H`: the universal property characterises `X_H`
  by maps out of it, and an isomorphism characterisation needs `Y_H` schematically dense and
  meeting every component.

### 10.2 The cusp locus and the formal-cusp package

Define
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
arguments need, and this is the statement §10.1's geometric-fibre comparison stands on
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
8.7–8.11 and 10.8, built here as its own milestone**. The Tate curve is Tau Ceti's
`TauCeti.tateCurve`, a Weierstrass curve over `ℤ⟦q⟧` that is elliptic over `ℤ((q))`
(`isElliptic_baseChange_tateCurve`) with `j = q⁻¹(1 + 744q + ⋯)` (`exists_tateCurve_j_eq`). Built here
are its base change to `ℤ[1/N]((q))`, the groups `T[N]` with their subgroup schemes and
`[Γ₀(N)]`-structures, the integral closure of the `q`-adic local ring in the corresponding level
cover, and the resulting formal parameters along `Cusps_H`, with the cusp count as the orbit count
of KM 10.6's cusp-labels. The point-level Tate uniformisation `L^× / q^ℤ ≅ E_q(L)` over a complete
rank-one valued field is a different object and does not supply this formal calculation; the two
are related, and neither substitutes for the other.

*Needs:* §§0.1, 2.2, 3.2, 10.1; Tau Ceti `TauCeti.tateCurve` with
`isElliptic_baseChange_tateCurve` and `exists_tateCurve_j_eq` (the Tate curve over `ℤ((q))`, with
`j = q⁻¹ + 744 + ⋯`), `Scheme.Hom.isRelativeEffectiveCartier_ker_of_smoothOfRelativeDimension` (a
section of a separated smooth relative curve is a relative effective Cartier divisor); Mathlib
`PowerSeries`, `LaurentSeries`.

**Checks.**

- For `N = 5`: `Y₁(5)` has `|H| = 1` and `deg j = (25 − 1)/2 = 12`, and its reduced cusp scheme has
  rank `4`, two cusps of width `1` and two of width `5`, with `2 · 1 + 2 · 5 = 12`; `X₀(5)` has
  `deg j = 6 = 1 + 5`, the cusp `∞` of width `1` and `0` of width `5`. A cusp count of `deg j`
  points, reading the scheme-theoretic fibre as reduced, would give `12` and `6`.
- The fibre `Cusps₀(N) = [∞] + N[0]` is not reduced. After a nonreduced base change `T` the
  base-changed cusp model `D₀ × T` is two disjoint copies of `T`, while the reduction of
  `Cusps₀(N) × T` is two copies of `T_red`, strictly smaller: reduction and base change do not
  commute, which is why the sections are stated on `D₀ × T`.

### 10.3 The ramification table of `X₁(N) → X₀(N)`

The source of this section is Mazur II §2, Table 1, all six rows. The
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
`Aut(E)` carrier is Tau Ceti's `WeierstrassCurve.autGroup` with its finiteness and its
value `{±1}` for `j ≠ 0, 1728` (supplier contracts), but not these
computations, and what is needed here is more than the group: the classification
`Aut(E)/±1 ≅ A₄` (characteristic `2`, `j = 0 = 1728`) and `Aut(E)/±1 ≅ S₃` (characteristic
`3`), its action on the cyclic order-`N` subgroup schemes of `E`, and the normaliser and
orbit computation on top (Silverman App. A; Mazur II pp. 65–66, the references). The output
consumed by the table: in characteristic `2` an order-`3` subgroup of `A₄` is
self-normalising (two points survive) while an order-`2` subgroup has Klein-four normaliser
whose extra element interchanges the two stabilised subgroups (the pair collapses to one
point); in characteristic `3` the two behaviours are exchanged in `S₃`. The wild break
`ν = 1` is proved by comparing the degree of the global different across characteristics:
Kähler differentials in the exact sequence of `X₁(N) → X₀(N)`, the global different, the
**Riemann–Hurwitz formula in its Euler-characteristic form**
`deg 𝔡 = −2·χ(X₁, O) + 2·d·χ(X₀, O)` with `d = (N−1)/2` — deliberately *not* the
`2g − 2` form: this roadmap asserts no connectedness, and the `χ` form is valid
componentwise for a disconnected smooth proper curve, whereas `2g − 2` is not even defined
for one — constancy of the two **Euler characteristics** across the fibres, from coherent
cohomology and base change in the smooth proper families, and the local formula
`v(𝔡) = Σ_{i≥0} (|G_i| − 1)` — a named dependency package, not a footnote, with named suppliers.
The different divisor and the Hurwitz genus formula of a finite separable extension of function
fields are Tau Ceti's (`TauCeti.hurwitz_genus_formula`), and so is **Hilbert's different formula**
`d(P′∣P) = Σ_{i≥0}(|G_i| − 1)` with the lower-numbering ramification groups `G_i(P′∣P)`
(`TauCeti.Place.differentExponent_eq_finsum_card_ramificationGroup_sub_one`); these are the
statements of [AlgebraicCurves](../AlgebraicCurves/README.md) §§7.1–7.4 and 8.6–8.7, lower
numbering only. The Kähler-differential comparison is AlgebraicCurves Layer 9, and its Layer 12
dictionary carries those function-field statements to the smooth proper fibres used here, one
connected component at a time — which is exactly why the `χ` form, valid componentwise, is the
form of record. What remains owned by this layer is the
fibrewise constancy of the two Euler characteristics and the assembly across
characteristics.

*Needs:* §§6.2–6.4, 10.1–10.2; Tau Ceti `WeierstrassCurve.autGroup`, `finite_autGroup`,
`WeierstrassCurve.eq_one_or_eq_negVariableChange_of_smul_eq`, `TauCeti.hurwitz_genus_formula`,
`TauCeti.Place.differentExponent_eq_finsum_card_ramificationGroup_sub_one`; AlgebraicCurves Layer 9
(the comparison of Weil and Kähler differentials) and Layer 12 (the dictionary between function
fields and regular projective curves); JacobianChallenge §§C.1–C.2 for the constancy of `χ(·, 𝒪)` in
smooth proper families.

**Checks.**

- For `N = 13`, `13 ≡ 1 mod 3` and `13 ≡ 1 mod 4`, so in characteristic `≠ 2, 3` both inertia
  types occur: two points of `X₀(13)` over `j = 1728` with inertia of order `2` and two over `j = 0`
  with inertia of order `3`. For `N = 11` neither congruence holds and `X₁(11) → X₀(11)` is
  unramified away from the cusps as well. For `N = 7`, `7 ≡ 1 mod 3` only: inertia of order `3` at
  the two points over `j = 0`, none over `j = 1728`.
- The Euler-characteristic form `deg 𝔡 = −2χ(X₁, 𝒪) + 2dχ(X₀, 𝒪)` with `d = (N − 1)/2` agrees with the
  `2g − 2` form on connected fibres: for `N = 11`, `X₀(11)` has genus `1` and `X₁(11)` genus `1`,
  `d = 5`, and `deg 𝔡 = 2 · 0 − 2 · 5 · 0 = 0`, an unramified covering of degree `5` between genus-one
  curves, as Riemann–Hurwitz `0 = 5 · 0 + deg 𝔡` requires.

### 10.4 The Shimura covering

The source of this section is Mazur II, Cor. 2.3. Put `G = (ℤ/N)ˣ/±1`, cyclic of order
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
geometric stabilisers. At the cusps the inertia is trivial by §10.3's cusp unramifiedness —
which is §10.3's milestone, not a consequence of the affine covering being étale. *Flatness*: killing inertia proves nothing about flatness, and in residue
characteristics `2` and `3` invertibility of the degree is unavailable as an excuse. The route
recorded here is the smooth-curves route: `X₂(N)` and `X₀(N)` are smooth proper relative curves
over `ℤ[1/N]` (§§10.1–10.2 applied to their level problems), the quotient morphism is finite,
**miracle flatness** for a finite morphism between smooth relative curves gives flat, and
finite + flat + unramified is finite étale. (Proving the `G/H`-action free as a *scheme* action
and quoting the finite-étale torsor theorem would also give the statement, but it has to argue
freeness at the cusp sections, which the smooth-curves route avoids.) This formulation, with
`H` named by its order, is the one to formalise. The covering is the geometric substrate of
the Shimura subgroup of `J₀(N)`, which is where this roadmap stops and the Mazur interface
under Scope and ownership hands over.

*Needs:* §§6.3–6.4, 10.1–10.3; Tau Ceti `Scheme.Hom.flat_stalkMap_of_isCohenMacaulay_of_quasiFiniteAt`
and `TauCeti.IsRegularLocalRing.isCohenMacaulay` (miracle flatness); Stacks Tag 00R4.

**Checks.**

- `n = num((N − 1)/12)`: for `N = 11`, `n = 5` and `|H| = gcd(10, 12)/2 = 1`, so `X₂(11) = X₁(11)` and
  `X₁(11) → X₀(11)` is itself cyclic and étale of degree `5`, as §10.3 says (no elliptic points
  ramify); for `N = 13`, `n = 1` and `X₂(13) = X₀(13)`; for `N = 37`, `n = 3`. A degree `(N − 1)/2`, the whole diamond group, would
  be ramified at the elliptic points whenever `N ≡ 1 mod 4` or `N ≡ 1 mod 3`.
- `H` of order `gcd(N − 1, 12)/2` contains every inertia group: for `N = 13` it is all of
  `(ℤ/13ℤ)ˣ/{±1}`, of order `6`, which contains the inertia of orders `2` and `3`.

### Examples

- For `N = 5`, `X₀(5)` has the two cusps `∞` and `0`, interchanged by `w₅`, and the coarse `j`-map
  has ramification index `1` at `∞` and `5` at `0`, so that `Cusps₀(5) = [∞] + 5[0]` has rank `6`
  (§10.2).
- For `N = 11`, `X₁(11) → X₀(11)` is unramified everywhere and is the Shimura covering, cyclic of
  degree `5` (§§10.3–10.4).
- For `N = 13`, both elliptic inertia types occur in `X₁(13) → X₀(13)`, and the Shimura covering is
  trivial, `X₂(13) = X₀(13)`; for `N = 37` it has degree `3` (§§10.3–10.4).

### Dependencies

Layer 0 (§0.1, relative effective Cartier divisors) and §5.1 (the fine curve `Y₁(N)`); §§2.2 and 3.2
(the quotient isogeny and the naive `[Γ₀(N)]`-structures, which define `w_N`); Layer 6 (quotients,
coarse schemes, the `j`-line, and, for the interior smoothness of every `Y_H`, §6.4's
quotient-smoothness theorem, KM Notes Added in Proof pp. 508–509, applied to `Y₁(N)` with its
diamond action); Mathlib's relative normalisation (the finiteness of `fromNormalization` in this
situation is a milestone here); Tau Ceti's projective line, Tate curve and `Aut(E)` carrier
`WeierstrassCurve.autGroup` (the characteristic-`2`/`3` classification and normaliser
computations on top of it are §10.3's own milestone); and, for §10.3's wild break, the global
different and Riemann–Hurwitz package for curves over a field with the local higher-ramification
formula, from Tau Ceti and AlgebraicCurves, together with the constancy of `χ(·, 𝒪)` in smooth
proper families from JacobianChallenge §§C.1–C.2. Nothing here uses characteristic-`N` geometry,
the relative regular-differential and duality package of Mazur II §3, or any Jacobian; §10.3 does
use Kähler differentials, the global different, Riemann–Hurwitz, and the local different formula.
Layers 7–9 are not used.

The targets of this layer, in dependency order, each standing only on entries before it, with the
owner named wherever a target is consumed rather than built:

1. the formal Tate/cusp package (§10.2) — built in this layer;
2. finiteness of `fromNormalization`, and the identification of `X_H` over `𝔸¹_j` with `Y_H`
   (§10.1) — this layer, on Mathlib's normalisation carrier;
3. the Cartier-divisor and boundary-smoothness statements for `Cusps_H` (§10.2) — this
   layer, standing on 1;
4. interior smoothness: every `Y_H` is a smooth affine relative curve over `ℤ[1/N]` — consumed
   from Layer 6.4, whose quotient-smoothness theorem (KM, Notes Added in Proof, pp. 508–509) is
   applied to `Y₁(N)` with its diamond action; with 2 and 3 this makes all of `X_H` smooth,
   which is the normality of the target used in 5;
5. the geometric-fibre base-change theorem for the normalisation (§10.1, in the four steps
   stated there) — this layer, standing on 3 and 4;
6. extension of the Galois covering over the fixed `j`-line using 2 and the normalisation
   universal property; separately, extension of `w_N` using the formal-cusp package in 1,
   the finite extension of `j ∘ w_N`, and the second normalisation identification in §10.2;
7. the characteristic-`2`/`3` automorphism classification and normaliser computations
   (§10.3) — this layer, on the pinned carrier `WeierstrassCurve.autGroup`;
8. the different and Riemann–Hurwitz package (§10.3) — consumed from Tau Ceti and from
   AlgebraicCurves Layers 9 and 12, as itemised at §10.3; the fibrewise Euler-characteristic
   constancy is this layer's, standing on 2–5;
9. the miracle-flatness half of the Shimura covering's étaleness (§10.4) — this layer,
   standing on 2–7.

This list is the dependency contract: no statement of this layer consumes an entry ahead of its
position.

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
- The Eisenstein-ideal application of Mazur's paper consumes Layer 10; the split of its Chapter II
  §§1–2 between this roadmap and others is the Mazur interface under Scope and ownership.
- ModularCurvesPartII imports the layers of this roadmap, cited by the lettered labels below
  (generalized elliptic curves, integral compactifications and the analytic comparison are built
  there); its §6.5 discharges the connectedness hypothesis of §5.3 for `Y(ρ)`.
- FiniteFlatGroupsAndIntegralPadicHodgeTheory consumes the finite locally free group schemes,
  quotients, finite étale schemes and descent of §§0.2–0.5, the elliptic quotients of §2.2 and the
  torsion towers of §§7.1 and 7.3, cited by the labels 0B–0E, 2B and 7E.
- EtaleCohomologyFoundations §F.3a consumes Layer 0.9's strict henselisation of a discrete
  valuation ring (`StrictHenselization.isDiscreteValuationRing_algebra`, strictly henselian by
  `IsStrictlyHenselianLocalRing`) for its strictly henselian traits, and
  LefschetzPencilsAndVanishingCycles Layer LPV.0 consumes those traits. Layer 0.9's
  `IsHenselization` serves every henselisation, including the henselisation of a local ring (the
  case `L = κ`), and compares every model of one with every other through
  `IsHenselization.existsUnique_comp_eq` and `IsHenselization.bijective_of_comp_eq`.

### Labels used by other roadmaps

Other roadmaps cite sections of this roadmap by the labels in the first column. Each label
resolves to the sections in the second column. A label with a letter is unambiguous. A bare layer
number in the six rows after the lettered labels is read by the topic the citing text names. An
item label `0A.k` is item `k` of Layer 0.1, whose items 1–8 keep their numbers. The six rows after
those are former heading anchors, and the last row resolves the items of Layer 10. Every other former heading anchor resolves through its label: an
anchor `#<label>-…` of a lettered section, such as `#0e-effective-descent-and-spreading-out` or
`#2b-isogenies-and-quotients`, resolves as the row of that label (Layer 0E is Layer 0.5, Layer 2B
is Layer 2.2), and an anchor `#layer-n-…` of a layer heading resolves as the bare layer number
`n`; Layers 0, 1, 2, 5 and 10 keep their numbers.

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
| `#layer-6-the-three-elementary-integral-level-problems` | Layers 4.4 (relative representability) and 9.1 (`[N-Isog]`) |
| Layer 10, item `k` (`k = 1, …, 4`) | Layer 10.`k` |


## Provenance

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
rewritten keeps the Apache-2.0 attribution. What they share with this roadmap is in Tau Ceti and
is consumed from it: the Galois equivalence for finite étale schemes over a field (Layer
0.4), effective descent of affine schemes along an affine flat cover and descent of sections and
morphisms (Layer 0.5), the relative Picard fppf sheaf with its degree-zero part (Layer 2.4, items
1–2), and the strict henselisation of Layer 0.9, which Tau Ceti builds on the roadmap's carrier
while both repositories work with strict local rings of schemes at geometric points. The one
pointer to a target not in Tau Ceti is the file
[`AlgebraicGeometry/Descent/AffineDescentEffective.lean`](https://github.com/AxiomMath/Weil/blob/27cdb2049be62ee2911429b47f54774078450e32/Weil/AlgebraicGeometry/Descent/AffineDescentEffective.lean)
of AxiomMath/Weil: a descent datum whose structure morphism is affine is effective along a flat
surjective quasi-compact morphism which need not be affine (Stacks, Tag 0245), the first of the
remaining forms of Layer 0.5. Its descent data are that repository's, not `TauCeti.DescentDatum`.

## Scope and ownership

**This roadmap owns** the scheme-theoretic theory of elliptic curves needed for modular curves and
the moduli theory of Katz and Mazur built on it:

- elliptic curves over an arbitrary base as smooth proper commutative group schemes of relative
  dimension one: the points dictionary over arbitrary bases, the pole sheaves `𝒪_E(n[0])` with
  their low-degree relative cohomology, the Weierstrass presentation, the cubic polarisation and
  elliptic descent (Layer 1);
- quotients by finite locally free subgroups, the properties of the factorisation dual, the Picard
  dual with the representability of the degree-zero relative Picard sheaf by the curve and the
  Poincaré bundle, KM 2.5.1, Cartier–Nishi duality, the scheme-theoretic Weil pairing, and the
  degree and trace of endomorphisms (Layer 2);
- the groupoid formalism of `Ell/R`, the naive `[Γ₀(N)]`, the Weierstrass presentation of the
  moduli groupoid, the Legendre rigidifier, KM 4.7.0 and regularity of moduli problems
  (Layer 3);
- KM 1.10.1, 1.10.5 and 1.10.13, balanced `[Γ₁(N)]`, the balanced and `[Γ₀(N)]` comparisons, and
  the étaleness of `[Γ₁(N)]` where `N` is invertible (Layer 4);
- the relative dimension of `Y₁(N)`, the full ordered-basis scheme `Y_full(N)` for `N ≥ 3` with
  its determinant and fixed-pairing fibres, and the twisted curve `Y(ρ)` for `N ≥ 3` (Layer 5);
- quotient problems, coarse moduli schemes, the smoothness of finite quotients of curves, the
  curves `Y_H` and the coarse `j`-line over `ℤ` and over every ring (Layer 6);
- one elliptic curve at one prime: the `p`-divisible group, the connected–étale sequence, Frobenius
  and Verschiebung, the formal completion, supersingular curves, the universal deformation and the
  Serre–Tate statements needed for KM 5.1.1 (Layer 7);
- the axiomatic regularity and isomorphism theorems and the First Main Theorem (Layers 8 and 9),
  `[N-Isog]`, the cyclicity theorem and `[Γ₀(N)]` (Layer 9);
- the compactified coarse curves `X_H` over `ℤ[1/N]` for prime `N ≥ 5` (Layer 10): the KM 8.6
  normalisation of the projective `j`-line in `Y_H`, the cusps via the Tate parameter (KM 8.11),
  the ramification table of `X₁(N) → X₀(N)` including characteristics `2` and `3`, and the étale
  Shimura covering;
- the general scheme theory of Layer 0 that these use and that is not in the libraries: the
  geometric-fibre and limit forms of the relative Cartier criterion, difference divisors and the
  degree of inverse images (§0.1); Cartier duality and quotients over a non-affine base (§0.2);
  Hopf–Galois torsors and the gluing of quotients by finite locally free equivalence relations
  (§0.3); sections and descent of finite étale schemes (§0.4); the remaining forms of descent and
  spreading out (§0.5); Hom-schemes over a non-affine base (§0.6); the relative Grassmannian with
  its Plücker embedding and the relative Hopf-ideal locus (§0.7); full sets, `A`-structures and
  generators over a non-affine base, KM 1.11.2 and the coprime decompositions (§0.8); and the
  strict henselisation statements, regular-locus openness and the regularity statements of §0.9.

Compactified coarse curves are included **as coarse-curve geometry only**: the compactification is
by normalisation of the coarse `j`-line, with no boundary moduli interpretation, no stacks, and no
generalized elliptic curves; the characteristic-`N` fibres of the compactified curves are excluded.

**Already in the libraries and consumed** (supplier contracts below), each named at its point of
use above: the relative effective Cartier divisor predicate with its fibre criterion, section
divisors, sums, finiteness, degree, incidence and equality loci and the closed-subgroup criterion
(§0.1); finite locally free commutative group schemes, kernels, Cartier duality over an affine base
and the killing theorem (§0.2); affine invariant quotients by finite groups, the affine case of SGA
3, Exposé V, Théorème 4.1, and the fppf quotient of a free affine action (§0.3); finite étale schemes
and their Galois description (§0.4); the affine, finite locally free and closed-subscheme cases of
descent (§0.5); Weil restriction and Hom-algebras over an affine base (§0.6); the affine Grassmannian
with its Hopf-ideal locus, the relative `Proj` and the base change of `Proj(Sym M)` over an affine
base (§0.7); full sets of sections and `A`-generators over an affine base with KM 1.8.2, 1.8.4,
1.9.1, 1.11.3 and 1.11.4–1.11.5 (§0.8); the henselisation and strict henselisation of a local ring
with their universal properties, regular schemes, étale invariance of regularity, miracle flatness
at a quasi-finite point and descent of regularity (§0.9); the projective Weierstrass models with base
change, their points over fields and local rings, the classification of pointed isomorphisms by
variable changes, the divisors `n[0]`, `EllipticCurveGeom` with its group law and global sections
(Layer 1); KM 2.3.1, isogenies and their degree, the factorisation dual, the cokernel property of
isogenies and the relative Picard functor with its degree-zero part and Abel–Jacobi map (Layer 2);
`Ell/R`, moduli problems, the naive level problems with their rigidity and representability data,
the level-three rigidifier and the simultaneous-problem steps of KM 4.7.0 (Layer 3); exact order,
cyclic subgroups, Drinfeld bases, `[Γ(N)]`, `[Γ₁(N)]`, `[Γ₀(N)]` and the naive–Drinfeld comparison
(Layer 4); `Y₁(N)` from the Tate normal form (Layer 5); the invariant rings of the Legendre and
level-three lines, the `j`-invariant over a base and kernel base change (Layer 6); the torsion
transitions, the relative Frobenius of group schemes, the formal group law of a Weierstrass curve
and supersingularity over a field (Layer 7); the ring-theoretic core of KM 5.3.4 and the high
Frobenius twists of KM 5.3.6 (Layer 8); and the projective line, the Tate curve, finiteness of
normalisation over a Japanese base, and the Hurwitz and Hilbert formulas for function fields
(Layer 10).

**Owned elsewhere and consumed here.**

- *Line bundles and the cohomology of curves*: JacobianChallenge Layer A (invertible sheaves and
  the divisor–line-bundle correspondence), §B.4 (Riemann–Roch and Serre duality for proper curves
  over a field) and §§C.1–C.2 (proper-flat coherent cohomology, Grauert's theorem, cohomology and
  base change). General coherent cohomology, the general Riemann–Roch theorem and the general
  Picard scheme are not reconstructed here; because JacobianChallenge constructs the Picard scheme
  only for a curve over a field, §2.4 owns, for an elliptic curve over an arbitrary base, the
  representability of the degree-zero relative Picard sheaf by the curve itself and the Poincaré
  bundle. The fppf descent statements for line bundles and the additional scheme data used here
  are §0.5's, from Tau Ceti's descent library, not JacobianChallenge's.
- *Curves and function fields*: AlgebraicCurves Layer 9 (Weil and Kähler differentials) and Layer 12
  (the dictionary with regular projective curves), for the ramification table of §10.3; the broad
  comparison between arbitrary scheme isogenies and embeddings of function fields is
  AlgebraicCurves', and §2.1 keeps only the narrow degree bridge, which is Tau Ceti's.
- *Equation-level elliptic curves*: the arithmetic of Weierstrass equations is Tau Ceti's and
  EllipticCurves', and everything this roadmap uses of it is in Tau Ceti (supplier contracts): the
  degree of `[n]`, the Weil pairing over a separably closed field, supersingularity with its
  `j`-, Verschiebung- and trace-criteria, the automorphism group of a Weierstrass curve, the
  universal Legendre curve and the formal group law.
- *The Grassmannian beyond finite locally free sheaves*: the description of the image of the
  Plücker map by the quadratic Plücker relations, the coherent extension to finite-type
  quasi-coherent `E`, the relative tangent sheaf, smoothness of relative dimension `N(n − N)` and
  flag schemes are AlgebraicModuliForArithmeticGeometry §1.3's; §0.7 owns the finite locally free
  quotient Grassmannian with its charts, universal quotient, rank-one identification and Plücker
  closed immersion, on which the projectivity of the Hopf-locus parameter scheme and the
  "projective plus quasi-finite implies finite" step of §9.1 rest.
- *The geometric connectedness of `Y(ρ)`*: §5.3 reduces geometric irreducibility of `Y(ρ)` to the
  connectedness of `Y(ρ) ⊗ ℚ̄` and keeps that as a hypothesis. The two statements behind it, the
  uniformisation `(Y(ρ) ⊗ ℂ)^an ≅ ℍ/Γ̃` and the comparison of algebraic and analytic connectedness
  for a smooth affine complex curve, are ModularCurvesPartII's (§§4.9, 6.4 and 6.5, which discharge
  the hypothesis) and ComplexComparisonPartII's (§C4.5, `affineCurveConnectedness`). This roadmap
  takes no dependency on them, and no unconditional irreducibility theorem is asserted for `Y(ρ)` or
  for any fine curve.

**Not in this roadmap.** Generalized elliptic curves, Igusa curves and the characteristic-`N`
compactified geometry (crossings at supersingular points, minimal regular resolutions), a general
theory of algebraic stacks or algebraic spaces, modular forms and Hecke operators, Néron models,
complex uniformisation, and geometric connectedness or irreducibility of the fine curves, apart
from the conditional reduction of §5.3 described above. SchemeAndStackFoundations names several of
the Layer 0 objects of this roadmap as owned here and supplies nothing to it.

The intended homes of the implementation are `TauCeti/AlgebraicGeometry/EllipticCurve/Scheme/` and
`TauCeti/AlgebraicGeometry/ModularCurve/`, with reusable material on Cartier divisors, finite group
schemes, finite quotients and descent placed in the corresponding general directories.

### The Mazur interface

Mazur's paper (IHÉS 47, 1977) is the acceptance test this roadmap is measured against on the
arithmetic side, and its Chapter II §§1–2 is a precise bill of materials. **This is an interface
for Mazur Ch. II §§1–2, the modular-curve geometry, and not for Mazur's theorems.** The torsion
theorem in particular is out of scope, and not only for Jacobian-side reasons: its Chapter III §5
descent step consumes the **boundary moduli interpretation of the cusps** — a section through a
curve with rational `N`-torsion specialises to `∞` or to `0` according to whether the cyclic
subgroup meets the identity component of the special fibre — and that is a statement about
generalised elliptic curves, which this roadmap excludes. This roadmap supplies the curves; it
makes no claim, conditional or otherwise, about the theorems Mazur proves with them.

**Owned by this roadmap.** The affine curves `Y₀(N)`, `Y₁(N)` integrally and over `ℤ[1/N]`
(Layers 5, 6 and 9); `[Γ₀(N)]` with cyclicity (Layer 9); the quotient and coarse theory with the
`j`-line (Layer 6); the compactified coarse curves, the two cusps of `X₀(N)`, the ramification table
of `X₁(N) → X₀(N)`, and the étale Shimura covering (Layer 10). Mazur's split-Cartan-normaliser
problem has an affine `[Γ_H]` quotient in Layer 6's scope. Its compactification `X_split(N)`
(Ch. III §6) is not supplied by Layer 10: that subgroup of `GL₂(ℤ/Nℤ)` is not a subgroup of the
diamond group `Δ` defining the class of Layer 10, and it is not part of this Ch. II §§1–2 interface.

**Not built here.** The following inputs of Mazur's paper are outside this roadmap:

- **Characteristic-`N` geometry**: the two-component semistable special fibre obtained by gluing
  two copies of the `j`-line along the supersingular points (with Frobenius in the gluing),
  regularity of `M₀(N)/ℤ` away from `j ∈ {0, 1728}`, and the minimal regular resolution
  `X₀(N)/ℤ`, whose bad fibre adds the exceptional chains of `ℙ¹`s over the stacky points
  `j = 0, 1728` (Mazur II §1 and Diagram 1; the Mazur–Rapoport appendix; DR IV 6.9; KM Ch. 12–13).
  It is not a Kodaira fibre and is not to be described as one. It belongs with generalized
  elliptic curves and Igusa curves (Conrad).
- **Regular differentials and relative duality** for Cohen–Macaulay curve morphisms (Mazur II §3;
  DR I 2.1.1), beyond the JacobianChallenge foundations consumed here.
- **`J₀(N)` and its Néron model**, `Pic⁰` of the regular model, component groups at `N` (Mazur's
  conventions page and the Mazur–Rapoport appendix).
- **The Hecke algebra `𝕋` acting on `J₀(N)`**, the cuspidal and Shimura subgroups as subgroup
  schemes, the Eisenstein ideal and quotient (Mazur II §§6–19). The Shimura covering of §10.4 is
  the last statement of this roadmap on this side of that boundary.
- **Admissible group schemes over `ℤ`** (Mazur Ch. I §1(f), p. 47): for `p ≠ N`, an admissible
  `p`-group is a commutative, quasi-finite, separated, **flat** group scheme of finite presentation
  over `ℤ`, **killed by a power of `p`**, whose restriction to `ℤ[1/N]` is finite flat and admits a
  filtration by finite flat subgroup schemes with successive quotients `(ℤ/p)_{ℤ[1/N]}` or
  `μ_{p,ℤ[1/N]}`; its restriction to `ℤ[1/p]` is quasi-finite étale and its restriction to
  `ℤ[1/pN]` is finite étale. The finite locally free carrier of §0.2 is the `ℤ[1/N]`-side
  interface it meets. (The level prime `N` and the residual prime `p` are different primes;
  flatness over `ℤ` and the filtration living on the `ℤ[1/N]`-restriction are both part of the
  definition, and dropping either changes the category.)

**Further sources.** Česnavičius, Theorem 6.7: for every `n`, the coarse curve `X₀(n)` over `ℤ` is
regular away from the closed points with `j = 0` or `j = 1728` in the characteristics dividing `n`.
This is more general than the statement of Mazur II §1 for prime level, and includes the cusps.

## Exact supplier contracts

### From Mathlib

The following are consumed as they stand.

- Schemes and their morphism-property library: `Scheme`, `Spec`, `Proj`, fibre products, `Over`,
  finite, flat, étale, smooth (`Smooth`, and `SmoothOfRelativeDimension n`, a different class),
  proper, separated, immersions, quasi-finite morphisms (`LocallyQuasiFinite`,
  `Scheme.Hom.QuasiFiniteAt`) and descent results; ideal sheaves (`Scheme.IdealSheafData`), closed
  subschemes and kernels of scheme morphisms; representable functors (`Functor.RepresentableBy`),
  `Over`-categories and scheme gluing.
- `AlgebraicGeometry.Scheme.Hom.finrank` and `AlgebraicGeometry.Scheme.Hom.isLocallyConstant_finrank`
  (`Mathlib/AlgebraicGeometry/Morphisms/FlatRank.lean`): finite, flat and locally of finite
  presentation give a locally constant rank, the rank of Convention 3 and §2.1.
- Group objects of a cartesian monoidal category, `GrpObj`, `IsCommMonObj` and `IsMonHom`, with the
  group structure on morphisms into a commutative group object (Convention 2 and §2.1); the
  correspondence between commutative Hopf algebras and affine group schemes
  (`Mathlib/AlgebraicGeometry/Group/Affine.lean`, with `algSpec`, `bialgSpec`, `hopfSpec`, fully
  faithful), consumed by §0.2; and commutativity of a proper geometrically integral group scheme
  over a field (`Mathlib/AlgebraicGeometry/Group/Abelian.lean`), which over a general base applies
  fibrewise only (for Weierstrass models commutativity is immediate from the symmetric addition
  formula).
- `AlgebraicGeometry.Scheme.fpqcTopology` (`Mathlib/AlgebraicGeometry/Sites/Fpqc.lean`) with its
  instance that the fpqc topology is subcanonical and its instances that a flat surjective morphism
  which is quasi-compact, or locally of finite presentation, is an effective epimorphism (§0.5);
  `Scheme.fppfTopology`; the limit lemmas `Scheme.exists_π_app_comp_eq_of_locallyOfFinitePresentation`
  and `Scheme.exists_hom_comp_eq_comp_of_locallyOfFiniteType` for spreading out (§0.5).
- `AlgebraicGeometry.GeometricallyConnected`, every fibre over a field-valued point connected
  (§2.4).
- The relative normalisation `Scheme.Hom.normalization` with `toNormalization`,
  `fromNormalization`, `normalizationDesc` (for an integral morphism), `normalization.hom_ext` and
  the comparison `normalizationPullback`, an isomorphism for smooth base change by an instance
  (`Mathlib/AlgebraicGeometry/Normalization.lean`; §§9.5, 10.1).
- Weierstrass curves, their invariants and `WeierstrassCurve.j`, variable changes
  (`WeierstrassCurve.VariableChange` with its `Group` instance and its `MulAction` on
  `WeierstrassCurve`), division polynomials, and the pointwise group law on
  `WeierstrassCurve.Affine.Point` (§§1.2–1.4).
- Finite, flat and étale ring maps, finite locally free rank, invariant subrings, Hopf algebras,
  regular local rings (`IsRegularLocalRing`), completions (`AdicCompletion`), Krull dimension
  (`ringKrullDim`), henselian local rings (`HenselianLocalRing`), separable closures (`IsSepClosure`,
  `IsSepClosed`), Witt vectors (`WittVector`), power series and Weierstrass division
  (`PowerSeries.IsWeierstrassDivisionAt`), and `FormalGroup` with its field `toPowerSeries`
  (§§0.9, 7.2–7.4, 8.7, 9.3).

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
  are the cases of §0.5 in Tau Ceti.
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
  property of the degree-zero part, and the Poincaré bundle are targets of §2.4.
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

- `TauCeti.AlgebraicGeometry.smoothOfRelativeDimension_iff_smooth_and_pureRelativeDimension`
  (file `TauCeti/AlgebraicGeometry/Morphisms/Smooth/PureRelativeDimension.lean`): a morphism of
  schemes is smooth of relative dimension `n` exactly when it is smooth and of pure relative
  dimension `n` (`PureRelativeDimension n`). Mathlib's `Smooth` and `SmoothOfRelativeDimension n`
  are different classes, and the pinned `EllObj.smooth_yOne_structureMap` proves the first:
  `𝔸²_B ⟶ B` is `Smooth` and is not `SmoothOfRelativeDimension 1`. The dimension of the fibres of
  `Y₁(N)` and `Y_full(N)` is owned by Layer 5.1, item 6, and Layer 5.2.
- `WeierstrassCurve.IsSupersingular` and `IsOrdinary` with
  `WeierstrassCurve.isSupersingular_iff_of_isAlgClosed`,
  `WeierstrassCurve.isSupersingular_baseChange_iff`,
  `WeierstrassCurve.isSupersingular_variableChange_iff`,
  `WeierstrassCurve.isSupersingular_iff_j_eq_zero_of_char_two` and
  `WeierstrassCurve.isSupersingular_iff_j_eq_zero_of_char_three`
  (file `TauCeti/AlgebraicGeometry/EllipticCurve/Supersingular.lean`);
  `TauCeti.Isogeny.verschiebungIsogeny` with `verschiebungIsogeny_comp_relativeFrobeniusIsogeny`,
  `relativeFrobeniusIsogeny_comp_verschiebungIsogeny` and `degree_verschiebungIsogeny` (file
  `EllipticCurve/Isogeny/RelativeFrobenius/Verschiebung/Basic.lean`);
  `WeierstrassCurve.isSupersingular_iff_isPurelyInseparable_verschiebungIsogeny` (file
  `Isogeny/RelativeFrobenius/Supersingular.lean`); and
  `WeierstrassCurve.isSupersingular_iff_dvd_frobeniusTrace` (file
  `Isogeny/Frobenius/Supersingular.lean`). For a Weierstrass curve `W` over a field `K`,
  `W.IsSupersingular p` says that `W` has no nonzero point of order dividing `p` over
  `AlgebraicClosure K`; the algebraic closure may be replaced by any algebraically closed
  extension, and the property is invariant under field extension and under changes of variables.
  An elliptic `W` in characteristic `2`, and likewise in characteristic `3`, is supersingular
  exactly when `j = 0`. As embeddings of function fields, the Verschiebung `V : W^{(p)} → W`
  satisfies `V∘F = [p]` and `F∘V = [p]`, has degree `p`, and is purely inseparable exactly when
  `W` is supersingular; over a finite field of characteristic `p`, `W` is supersingular exactly
  when `p` divides the trace of Frobenius. These are statements about points over a field and
  about isogenies as embeddings of function fields. Layer 7.1 owns the comparison of PD-2's
  notion, the connectedness of the group scheme `E₀[p]`, with this one, and the Frobenius and
  Verschiebung of group schemes (PD-3); PD-6(a) of Layer 7.3 consumes the two `j`-criteria.
- `WeierstrassCurve.autGroup` with `eq_one_or_eq_negVariableChange_of_smul_eq`,
  `eq_one_or_eq_negVariableChange_map`, `autGroupMulEquiv` and `finite_autGroup` (file
  `TauCeti/AlgebraicGeometry/EllipticCurve/Aut.lean`): the automorphism group of a Weierstrass
  curve, as the stabiliser of the curve under the changes of variables. Over an integral domain,
  an elliptic curve with `j ≠ 0` and `j ≠ 1728` is fixed only by the identity and by the change
  of variables of `[−1]`, in every characteristic, so that its automorphism group is cyclic of
  order two; and the automorphism group of an elliptic curve over an integral domain is finite.
  Layer 6.4 consumes the dichotomy on the locus `j ≠ 0, 1728`; Layer 10, item 3, builds its
  classification in characteristics `2` and `3` on this carrier.
- `WeierstrassCurve.UniversalLegendre.Ring`, `curve`, `lift` and `existsUnique_legendre` (file
  `TauCeti/AlgebraicGeometry/EllipticCurve/Legendre.lean`): the ring `ℤ[1/2][λ, 1/λ(λ − 1)]` with
  the curve `y² = x(x − 1)(x − λ)` over it. For an elliptic Weierstrass curve over a commutative
  ring, two points `(x₁, y₁)` and `(x₂, y₂)` at which `ψ₂ = 2y + a₁x + a₃` vanishes, and a unit
  `u` with `x₂ − x₁ = u²`, exactly one pair of a ring homomorphism out of this ring and a change
  of variables with scaling `u` carries the curve to the base change of the universal one and the
  two points to `(0, 0)` and `(1, 0)`. This is a statement about equations. Layer 3.5, item 1,
  owns the identification of these data with a basis of `E[2]` and a differential, the moduli
  problem over `Ell/ℤ[1/2]`, and its finite étaleness.
- `WeierstrassCurve.formalGroup` with `map_formalGroup` and `isComm_formalGroup` (file
  `TauCeti/AlgebraicGeometry/EllipticCurve/FormalGroup/Basic.lean`),
  `WeierstrassCurve.projModelFormalPoint` with `SpecMap_constantCoeff_projModelFormalPoint` and
  `exists_unit_projModelFormalPoint_comp_eq` (file `EllipticCurve/Scheme/FormalPoint.lean`), and
  `WeierstrassCurve.height_formalGroup_eq_one_iff` (file `EllipticCurve/FormalGroup/Height.lean`):
  the formal group law of a Weierstrass curve over any commutative ring `R`, a commutative
  `FormalGroup R` of Mathlib whose formation commutes with base change; the point
  `[z : −1 : w(z)]` of the projective model with values in `R⟦z⟧`, which restricts to the zero
  section at `z = 0` and which an isomorphism of projective models over `Spec R` preserving the
  zero sections carries to the same point reparametrised by `z` times a unit of `R⟦z⟧`; and, over
  a field of characteristic `p`, the criterion that this formal group has height one exactly when
  the coefficient of `T^{p−1}` in the expansion of the invariant differential is nonzero. Layer 7.2
  owns the completion of an elliptic curve over a complete local ring along its zero section and
  its comparison with these in a Weierstrass chart.

- *Relative effective Cartier divisors* (§0.1; files under
  `TauCeti/AlgebraicGeometry/EffectiveCartierDivisor/` and `IdealSheaf/IncidenceLocus.lean`):
  `IdealSheafData.isRelativeEffectiveCartier_iff_forall_isEffectiveCartier_comap_fiberι` (for `X`
  locally noetherian, `f : X ⟶ S` flat and `D` flat over `S`, `D` is a relative effective Cartier
  divisor exactly when every fibre over a point of `S` is an effective Cartier divisor) and
  `IdealSheafData.IsEffectiveCartier.comap_fst_of_comap_fiberι` (from a fibre to every field-valued
  point over it); `Scheme.Hom.isRelativeEffectiveCartier_ker_of_smoothOfRelativeDimension` (a
  section of a separated smooth relative curve is a relative effective Cartier divisor) and
  `Scheme.Hom.finrank_ker_comp_eq_one_of_comp_eq_id` (of degree one); `TauCeti.isRelativeEffectiveCartier_mul`
  and `TauCeti.isRelativeEffectiveCartier_prod` (sums); `IsRelativeEffectiveCartier.isFinite_iff_isProper`
  (for `f` locally of finite type of relative dimension at most one) with
  `TauCeti.locallyOfFinitePresentation_subschemeι_comp_of_isEffectiveCartier`;
  `IsRelativeEffectiveCartier.isLocallyConstant_finrank` and the additivity
  `IsRelativeEffectiveCartier.finrank_mul_subschemeι_comp`; `IdealSheafData.incidenceLocus` and
  `equalityLocus` with `incidenceLocus_le_ker_iff`, `equalityLocus_le_ker_iff`, `comap_incidenceLocus`
  and `comap_equalityLocus` (for `V(J)` finite locally free over `S`); and the closed-subgroup
  criterion `TauCeti.GroupScheme.exists_grpObj_isMonHom_iff_ker_le` (file
  `GroupScheme/ClosedSubgroup/Criterion.lean`).
- *Quotients and Hom-schemes over an affine base* (§§0.2, 0.3, 0.6): `TauCeti.GroupScheme.isColimitKernelCofork`
  (a quasi-compact, flat and surjective homomorphism of group schemes is the cokernel of its
  kernel, file `GroupScheme/Cokernel.lean`); `Scheme.Hom.affineCoequalizerπ` with
  `isKernelPair_affineCoequalizerπ`, the instances `isFinite_affineCoequalizerπ`,
  `flat_affineCoequalizerπ`, `surjective_affineCoequalizerπ` and
  `locallyOfFinitePresentation_affineCoequalizerπ`, and `isColimitFppfYonedaAffineCoequalizerCofork`
  (SGA 3, Exposé V, Théorème 4.1 for an affine `X` and an equivalence relation with finite locally
  free projections, file `Quotient/EquivalenceRelation.lean`);
  `TauCeti.AffineInvariantQuotient.existsUnique_fppfYoneda_comp_eq` (for a free action the affine
  invariant quotient represents the fppf quotient, file `Quotient/FiniteGroup/Fppf.lean`);
  `CategoryTheory.CommMon.existsUnique_relativeSpecπ_comp_eq` (the invariant quotient of a scheme
  affine over a base by a finite group is a categorical quotient in all schemes, file
  `Quotient/FiniteGroup/Relative.lean`); `TauCeti.ComoduleAlgebra.existsUnique_SpecMap_comp_eq` (the
  affine quotient of a faithfully flat Hopf–Galois extension, file `Quotient/HopfGalois.lean`);
  `TauCeti.Algebra.WeilRestriction` with `WeilRestriction.homEquiv` and
  `WeilRestriction.baseChangeAlgEquiv`, `TauCeti.Bialgebra.HomAlgebra`, and the closed loci
  `IdealSheafData.weilRestriction` with `weilRestriction_le_ker_iff` (Weil restriction along a finite
  projective algebra over an affine base).
- *Finite étale schemes* (§0.4): `Scheme.Hom.natCard_eq_finrank_of_etale` (over a separably closed
  field, the points of a finite étale scheme number its rank).
- *Graded algebras, `Proj` and determinants* (§0.7): the relative `Proj`
  `CategoryTheory.CommMon.relativeProj` with `relativeProjToBase` and the twisting sheaves
  `relativeProjTwistingSheaf` (files `RelativeProj/Basic.lean`, `TwistingSheaf.lean`);
  `AlgebraicGeometry.Proj.isPullback_symmetricAlgebra_baseChange` (formation of `Proj(Sym M)` over an
  affine base commutes with base change, file `ProjectiveSpectrum/SymmetricBaseChange.lean`); the
  graded symmetric algebra `gradedSymmetricAlgebra` of a quasi-coherent sheaf with
  `CommMon.isLocalization_gradedSections_basicOpen` and `CommMon.isBaseChange_restrictGradedSections`;
  exterior powers of finite locally free sheaves with `rank_exteriorPower_apply`, and the
  determinant with its pullback comparison `FiniteLocallyFreeSheaf.pullbackDetIso`; and
  `Module.Grassmannian.hopfIdealLocus_map` (the Hopf-ideal locus commutes with base change of the
  coefficient ring).
- *Full sets of sections and generators over an affine base* (§0.8):
  `TauCeti.IsFullSetOfSections` with `isFullSetOfSections_iff_charpoly` (KM 1.8.2),
  `isFullSetOfSections_iff_norm_eq_prod` (the universal-polynomial reduction of KM 1.9.1 for a free
  algebra), `isFullSetOfSections_baseChange_iff`, `IsFullSetOfSections.of_localizationSpan`,
  `isFullSetOfSections_liftEquiv_comp_iff` (the full-set locus) and `isFullSetOfSections_pi_iff`
  (KM 1.8.4); `TauCeti.IsAGenerator` with `isAGenerator_baseChange_iff` and the representing locus
  `quotientGeneratorIdealHomEquivAGenerators`; `IsAGenerator.of_isShortExact` (KM 1.11.3);
  `RootsOfUnityGroup.isAGenerator_comp_fst` and `RootsOfUnityGroup.exists_not_isAGenerator` (the
  `μ_{p²}` example of KM 1.11.4–1.11.5); and `FiniteFlatCommGroupScheme.isIso_tensorHom_torsionι_comp_mul`
  (the coprime decomposition of a finite locally free group scheme, KM 1.10.14).
- *Regularity and flatness* (§§0.9, 8.3, 8.5, 9.4, 10.4): regular schemes
  `TauCeti.AlgebraicGeometry.IsRegular`; `Scheme.Hom.isRegularLocalRing_stalk_iff_of_etale` and
  `Scheme.Hom.isRegularOfDim_iff_of_etale_of_surjective`; miracle flatness
  `Scheme.Hom.flat_stalkMap_of_isCohenMacaulay_of_quasiFiniteAt` with
  `TauCeti.IsRegularLocalRing.isCohenMacaulay` and the ring form `TauCeti.Algebra.flat_of_isCohenMacaulay`
  (Stacks 00R4); descent of regularity `TauCeti.AlgebraicGeometry.IsRegular.of_flat_of_surjective`,
  `TauCeti.IsRegularLocalRing.of_flat_of_isLocalHom` and
  `Scheme.Hom.topologicalKrullDim_opens_eq_of_flat_of_surjective`; the regular locus
  `TauCeti.Excellence.regularLocus` (a definition, with no openness theorem); the fibrewise flatness
  criterion `Scheme.Hom.flat_of_flat_pullback_fiberι`; and the ingredient of 04GG
  `TauCeti.HenselianLocalRing.comp_bijective`.
- *Elliptic curves over a base* (Layers 1–2): `WeierstrassCurve.isPullback_projModelBaseChange`,
  `projModelOverBaseChangeIso` and `isPullback_projModelZero_projModelBaseChange` (file
  `Scheme/BaseChange.lean`); `WeierstrassCurve.projModelPointsEquiv` and
  `projModelPointsEquivUnimodular` (file `Scheme/Points.lean`) and
  `WeierstrassCurve.toEllipticCurveGeomPointsMulEquiv` with
  `toEllipticCurveGeomTorsionPointsMulEquiv` (file `Scheme/FieldPoints.lean`);
  `EllipticCurveGeom.exists_iso_toEllipticCurveGeom` (an elliptic curve over a local ring is the
  curve of a Weierstrass equation, file `Scheme/OfWeierstrass.lean`) and
  `EllipticCurveGeom.pointsBaseChangeEquiv`; the classification of pointed isomorphisms by
  variable changes, `WeierstrassCurve.existsUnique_eq_eqToHom_comp_projModelVariableChangeIso_hom`
  over an affine base and `existsUnique_hom_comp_eq_comp_projModelVariableChangeIso_hom` over an
  arbitrary base for equations over `Γ(S, ⊤)` (files `Scheme/VariableChange/Basic.lean`,
  `OverScheme.lean`); the divisors `WeierstrassCurve.zeroSectionDivisor` with
  `isRelativeEffectiveCartier_zeroSectionDivisor`, `isRelativeEffectiveCartier_zeroSectionDivisor_pow`,
  `zeroSectionDivisor_map` and `zeroSectionDivisor_pow_map`, and `EllipticCurveGeom.pointsDivisor`
  with `isRelativeEffectiveCartier_pointsDivisor` and `finrank_pointsDivisor`;
  `EllipticCurveGeom.isIso_structureMap_app` (global sections, file `Geom/GlobalSections.lean`);
  `WeierstrassCurve.geometricallyIntegral_projModelOver`; `WeierstrassCurve.pointAddEquivPicZero`
  (points and `Pic⁰` of the projective model over a field); `TauCeti.GroupScheme.degree` with
  `isLocallyConstant_degree`, `degree_comp` and `TauCeti.GroupScheme.IsogenyOfDegree` (file
  `GroupScheme/Degree.lean`); `EllipticCurveGeom.IsIsogeny` with `isIsogeny_iff`; and the
  factorisation dual `TauCeti.GroupScheme.factorisationDual` with `comp_factorisationDual`,
  `factorisationDual_comp` and `eq_factorisationDual` (file
  `GroupScheme/Isogeny/FactorisationDual.lean`).
- *Moduli problems* (Layer 3): `EllObj.isFibered_forget`, `EllObj.isStronglyCartesian` and
  `EllObj.isIso_iff_isIso_base` (file `ModularCurve/Ell.lean`), and the converse of KM 4.7.0 for
  rigidity, `ModuliProblem.isRigid_of_representableBy`.
- *Kernel base change* (§6.4): `LinearMap.ker_baseChange_of_flat_quotient_range` (file
  `TauCeti/LinearAlgebra/TensorProduct/Kernel.lean`): for a linear map whose cokernel is flat, the
  kernel of its base change is the base change of its kernel, over any commutative ring.
- *One curve at a prime* (Layers 7–8): the transition maps of the torsion tower
  `EllipticCurveGeom.isFinite_torsionMulBy_left`, `flat_torsionMulBy_left`,
  `surjective_torsionMulBy_left`, `isPullback_torsionInclusion` and
  `torsionInclusion_left_comp_torsionMap` (files `Geom/Torsion/Transition.lean`, `Geom/Torsion.lean`);
  the relative Frobenius of a commutative group scheme `AlgebraicGeometry.Scheme.relativeFrobeniusCommGrpHom`
  (file `TauCeti/AlgebraicGeometry/Frobenius/Relative.lean`); the chart-level formal group
  statements `WeierstrassCurve.lift_projModelFormalPoint_additionMorphism`,
  `zeroSectionDivisor_pow_comap_projModelFormalPoint` and
  `zeroSectionDivisor_pow_comap_subst_unit_projModelFormalPoint`; and the first conclusion of KM
  5.3.4, `FormalGroup.natCast_eq_zero_of_pow_mem_span` (file `TauCeti/RingTheory/FormalGroup/CharP.lean`):
  for a one-dimensional formal group law `F` over a commutative ring `R`, a prime `p` and `n ≠ 0`,
  if `F(X, Y)^(p^n)` lies in the ideal `(X^(p^n), Y^(p^n))` then `p = 0` in `R`.
- *Compactification* (Layer 10): the projective line `TauCeti.AlgebraicGeometry.projectiveLine` with
  its affine chart `projectiveLine.polynomialChartι`, its infinity section
  `projectiveLine.infinitySection` and its smoothness of relative dimension one (file
  `ProjectiveSpectrum/ProjectiveLine.lean`); `TauCeti.AlgebraicGeometry.isFinite_fromNormalization_of_isJapanese`
  and `Scheme.Hom.normalizationMap` (files `Normalization/Finite.lean`, `Basic.lean`); the Tate
  curve `TauCeti.tateCurve` with `isElliptic_baseChange_tateCurve` and `exists_tateCurve_j_eq` (file
  `EllipticCurve/TateCurve/Basic.lean`); the Hurwitz genus formula `TauCeti.hurwitz_genus_formula`
  and Hilbert's different formula
  `TauCeti.Place.differentExponent_eq_finsum_card_ramificationGroup_sub_one` (files
  `TauCeti/FieldTheory/FunctionField/Different/Hurwitz.lean`, `Hilbert.lean`).

The carriers and the declarations on which the statements of `Suggested.lean` rest are pinned
there by `#check`; the other declarations listed are cited by name and file.

### From TauCetiRoadmap.JacobianChallenge

- Layer A: invertible sheaves, the divisor–line-bundle correspondence, and base change for
  `𝒪(D)` (§§1.3, 1.5, 2.2, 2.4).
- §B.4: Riemann–Roch and Serre duality for proper curves over a field (§1.3).
- §§C.1–C.2: proper-flat coherent cohomology, Grauert's theorem, and cohomology and arbitrary base
  change (§§1.3, 2.4, 10.3).

These contracts are stated in prose. `Suggested.lean` imports Mathlib and the individual Tau Ceti
modules it uses, and nothing from another roadmap: the library declarations it rests on are listed
above, while these three contracts are consumed as the statements of JacobianChallenge's sections.

### From TauCetiRoadmap.AlgebraicCurves

- Layer 9: the comparison of Weil and Kähler differentials of a function field, used for the
  Kähler differentials of `X₁(N) → X₀(N)` in §10.3.
- Layer 12: the dictionary between function fields and regular projective curves, which carries
  the different, the Hurwitz formula and Hilbert's different formula (Tau Ceti's, above) to the
  smooth proper fibres of §10.3, one connected component at a time.

## References

- N. M. Katz and B. Mazur, *Arithmetic Moduli of Elliptic Curves*, Annals of Mathematics Studies
  108, Princeton University Press, 1985. Abbreviated **KM** and cited by result number. The
  dependency-sensitive statements are at the following printed pages:
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
- B. Conrad, *Reductive group schemes*, notes for the SGA 3 summer school (Luminy, 2011), in
  *Autour des schémas en groupes I*, Panoramas et Synthèses 42–43, Soc. Math. France, 2014,
  Lemma 2.1.3, for the Hom-schemes of Layer 0.6; cited by the numbering of the author's copy.
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
  II §§1–3 and the Mazur–Rapoport appendix, the consumer the Mazur interface under Scope and ownership is written against.
- J. H. Silverman, *The Arithmetic of Elliptic Curves*, 2nd ed., GTM 106, Springer, 2009,
  abbreviated **AEC**,
  III.1.7 and V.4.1 for the Legendre form and the Hasse-polynomial criterion for supersingularity
  (PD-6 of Layer 7.3), III.3.1 for Weierstrass coordinates (Layer 3.4), IV.1 and IV.7 for the
  formal group of a Weierstrass curve and its height (Layer 7.2), III.10.1 and Appendix A for
  automorphisms and the normal forms in characteristics `2` and `3`.
- K. Buzzard, *Formalizing Fermat*, Lecture 8, for `Y(ρ)`.
- N. M. Katz, *Serre–Tate local moduli*, in *Surfaces Algébriques* (Séminaire de Géométrie
  Algébrique d'Orsay 1976–78), LNM 868, Springer, 1981, 138–202 — Theorem 1.2.1 is the
  Serre–Tate equivalence ST-1 of Layer 7.5, which KM invoke without proof.
- M. Lazard, *Sur les groupes de Lie formels à un paramètre*, Bull. Soc. Math. France 83 (1955),
  251–274, for the classification by height of one-dimensional commutative formal groups over an
  algebraically closed field of characteristic `p` (PD-5 of Layer 7.3).
