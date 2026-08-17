<!--tauceti-status:v1 {"roadmap":"EllipticCurves","to_sha":"0c1efce3abbc827ff6d7534077387f04adf9b66c","ts":"2026-08-11T15:34:55Z"}-->
# Status: EllipticCurves

This file documents the status of the EllipticCurves roadmap up until `0c1efce` (2026-08-11T15:34:55Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** No layer is finished. Layer 5's quadratic twists are essentially complete at
equation level; Layer 0 has the function field and its places but no divisor calculus; Layer 1 has
the isogeny type with nothing computed about it. Layers 2, 4 and 7 have only scattered
prerequisites, and the Hasse bound and Mordell–Weil have supporting algebra but not themselves.

### Named results

- **The coordinate ring of an elliptic curve is a Dedekind domain**
  ([`isDedekindDomain_coordinateRing`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Affine/CoordinateRing.html#TauCeti.WeierstrassCurve.Affine.isDedekindDomain_coordinateRing)),
  the normality half
  ([`isIntegrallyClosed_coordinateRing`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Affine/CoordinateRing.html#TauCeti.WeierstrassCurve.Affine.isIntegrallyClosed_coordinateRing))
  being what the induced map on points of an isogeny needs; its fraction field is
  [quadratic](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Affine/FunctionField/Finrank.html#WeierstrassCurve.Affine.finrank_functionField)
  over `K(x)`.
- **Classification of the forms split by a quadratic extension** — for `j(E) ∉ {0, 1728}`, a curve
  becoming isomorphic to `E` over a separable quadratic `L/K` is already `K`-isomorphic to `E` or
  to its quadratic twist by `L`
  ([`exists_smul_eq_or_exists_smul_eq_quadraticTwist`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist.html#WeierstrassCurve.exists_smul_eq_or_exists_smul_eq_quadraticTwist)),
  and those two are genuinely different over `K`
  ([`not_exists_smul_quadraticTwist_eq`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist.html#WeierstrassCurve.not_exists_smul_quadraticTwist_eq)):
  the `H¹` classification for that `j`-range, concretely rather than cohomologically.
- **`Aut(E) = {±1}` away from `j = 0, 1728`** — the stabiliser of `E` among admissible changes of
  variables is `{1, [-1]}`
  ([`autGroupMulEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Aut.html#WeierstrassCurve.autGroupMulEquiv)):
  the rational group, not the geometric one Layer 5's classification needs.
- **The class group and units of the `S`-integers** — `Cl(𝒪_S)` is `Cl(R)` modulo the classes of
  the primes in `S`
  ([`integerClassGroupEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RingTheory/DedekindDomain/SInteger/ClassGroup.html#IsDedekindDomain.integerClassGroupEquiv)),
  hence finite when `Cl(R)` is, and the `S`-units are finitely generated once `Rˣ` is and `S` is
  finite
  ([`unit_fg_of_units`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RingTheory/DedekindDomain/SInteger/Unit.html#Set.unit_fg_of_units)):
  the inputs weak Mordell–Weil needs.

### Notable definitions and infrastructure

- **The isogeny** ([`Isogeny`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Basic.html#TauCeti.Isogeny)),
  seeded verbatim: an algebra map out of the target coordinate ring into the source function
  field, integrality expressing `φ(O₁) = O₂`. It is injective and extends uniquely across the
  fraction field
  ([`fieldPullback`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/FunctionField.html#TauCeti.Isogeny.fieldPullback)),
  so degree and composition can now be defined on it.
- **The two families of places** — the valuation at infinity
  ([`infinityPlace`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Affine/FunctionField/InfinityPlace.html#WeierstrassCurve.Affine.infinityPlace)),
  ramified of index two over the infinite place of `K(x)`, with uniformiser `x / y`; and the
  maximal ideal of an affine point
  ([`pointPlace`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Affine/Point/Place.html#TauCeti.WeierstrassCurve.Affine.CoordinateRing.pointPlace)),
  of degree one, injective, its local ring a discrete valuation ring.
- **The node polynomial**, of discriminant `-c₄c₆`
  ([`nodePolynomial`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/NodePolynomial.html#WeierstrassCurve.nodePolynomial)),
  its roots the tangent slopes at a node, with splitting criteria in residue characteristic two
  and away from it: the split/nonsplit test.

### Roadmap coverage

Layer 0 has coordinate ring, function field, local rings and both families of places, but no
divisors, no induced place along a field embedding, no fundamental identity `Σ e·f = deg`, and no
point–place bijection. Layer 0.5 has base change, the variable-change action on points, and
Galois descent across a quadratic extension, but no translations. Layer 1 has the isogeny type and
`Aut(E)`; degree, `[n]`, relative Frobenius, the hom-group and its degree form, the dual, Vélu and
the formal group are all missing, though two of their inputs exist: the relative ideal norm on
class groups, and a semilinear map of Kähler differentials. Layer 2 is untouched; Layer 3 has
finiteness of `E(𝔽_q)` and an abstract binary-quadratic-form core, not the bound; Layer 4 has only
the node polynomial; Layer 5 lacks only its point-level statements. Layer 6 has the `S`-integer
arithmetic and the Nagell–Lutz integrality lemmas, no heights and no theorem. Layer 7 is untouched.

## The frontier

- **Degree and the Frobenius isogeny.** Nothing is computed on the isogeny type yet: `deg φ` as a
  finrank over the pulled-back function field, finiteness, positivity, composition, `π_q`. That
  [`[K(W) : K(W)^q] = q`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Affine/FrobeniusTower.html#TauCeti.WeierstrassCurve.Affine.finrank_fieldRange_frobeniusAlgHom)
  is already proved, so Frobenius is packaging.
- **Divisors and the class-group anchor.** Layer 0's remainder: the divisor group,
  `deg (div f) = 0`, surjectivity of `toClass`, and the point–place bijection, of which only
  injectivity and degree one are proved. The Weil pairing is built from this calculus, so Layer 2
  waits on it.
- **The Hasse bound.** Finiteness of `E(𝔽_q)` is in, as is the arithmetic core: a rank-two pencil
  determinant is forced to be `q r² - t rs + s²`, and a form non-negative on enough of the lattice
  has non-positive discriminant. The elliptic half — `deg(1 - π_q) = #E(𝔽_q)`, the degree read as
  a determinant — is missing.
- **The two remaining twist milestones.** The point isomorphism `E^L(M) ≅ E(M)` with its Galois
  anti-equivariance, and the theorem that nonsplit multiplicative reduction becomes split after a
  separable quadratic twist, whose input is the node polynomial.
- **Weak Mordell–Weil.** The `S`-integer class group and unit group are in place; finiteness of
  `K(S, n)` and the Kummer map into the square classes of `K[X]/(f)` are not, and no height
  exists.
