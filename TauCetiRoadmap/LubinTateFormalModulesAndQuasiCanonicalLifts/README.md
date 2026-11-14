# Roadmap: lubin–tate formal modules and quasi-canonical lifts

**Summary.** This roadmap builds the theory of one-dimensional formal modules over the integers of
local fields, starting from Mathlib's one-dimensional `FormalGroup`, Tau Ceti's formal-group
homomorphisms, logarithms and evaluated points, and the formal Lie groups and `p`-divisible groups
of FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1. It equips a commutative formal group law with a
coefficient-ring action, constructs the Lubin–Tate formal module of a uniformizer by Lubin–Tate
interpolation, computes its torsion and Tate module, identifies the supplied division fields in
primitive-root coordinates, and compares its Galois character with the arithmetic local Artin map
of Tau Ceti and ClassFieldTheory. It then proves the
finite-height deformation theorem for formal `O_K`-modules with a specified coefficient ring,
Honda's functional-equation theory over unramified bases and its supersingular elliptic
specialization, integral lattice quotients and finite-residue descent of the supplied quadratic
quasi-canonical lifts, higher-degree lattice classification and marked fields of moduli (the ring
class fields of Gross and Yu), and the explicit tame and
anticyclotomic towers of Burungale–Kobayashi–Ota with the formal traces between them. The end
theorems are the Lubin–Tate existence and uniqueness theorem with its formal-module structure, the
degree of the Lubin–Tate division fields, the explicit reciprocity law `Art_K(π^r u) = [u⁻¹]_f` on
their torsion and their norm groups, the representability of marked finite-height deformations, the
Lubin–Tate structure of the formal group of a supersingular elliptic curve with scalar Frobenius,
the classification and fields of moduli of quasi-canonical lifts, and the trace-compatible
comparison of the two BKO towers.

The formal-module foundations of Layer 0 hold over an arbitrary commutative coefficient ring, and
the Lubin–Tate construction of Layer 1 over any discrete valuation ring with finite residue field
(either characteristic, complete or not). The torsion, Tate-module, division-field and
reciprocity results of Layer 2 and the deformation theory of Layer 3 hold for every
nonarchimedean local field `K`; their comparisons with `p`-divisible groups, with the `p`-adic
deformation suppliers and with elliptic curves are stated for finite extensions of `ℚ_p`. For the
CM construction the coefficient field `F₀` and the CM field `F` are distinguished; the quadratic
results cover ramified and unramified `F/F₀`, including residue characteristic two. Only the BKO
layers impose `p ≥ 5` and `Φ/ℚ_p` unramified quadratic.

## Scope and ownership

**Owned here.** The coefficient-ring action on a commutative formal group law with its tangent
condition, and the `O_K`-height (§0.1); the `O`-module structure, Galois action and elliptic
comparisons on evaluated formal points (§0.2); the evaluated logarithm homomorphism and its deep
analytic inverse over finite extensions of `ℚ_p` (§0.3); number-field models of finite extensions of
`ℚ_p` carrying Tau Ceti's elliptic formal-point homomorphism (§0.4). Lubin–Tate series and
polynomials, the interpolation lemma, the Lubin–Tate formal module and its coordinate independence
(Layer 1). Finite-height torsion and the `π`-adic Tate module of a formal `O_K`-module, the
primitive-root presentation of the supplied Lubin–Tate division fields, their coordinate and
Tate-module comparisons, the arithmetic Artin comparison and the change-of-uniformizer twist (Layer
2). Marked deformations of formal `O_K`-modules over a specified coefficient ring, their coefficient
algebra, cocycles, lifting torsors, tangent space and the extension of universal deformations to
arbitrary specified coefficient bases (Layer 3). Honda type operators, functional-equation
integrality and the unramified and supersingular elliptic Lubin–Tate comparisons (Layer 4). Tate
lattices, integral lattice quotients of formal modules with their Frobenius-twisted markings,
homomorphisms and descent (Layer 5). Finite-residue descent and higher-degree lattice classification
of canonical and quasi-canonical lifts, quadratic order algebra and fields of moduli (Layer 6).
Finite-residue quadratic ring-class degrees, the uniformizer property of the quasi-canonical
modulus, the BKO primed tower, the ramified Honda boundary example and neighbouring lattices (Layer
7). The BKO character data, cyclotomic and anticyclotomic directions, fixed fields and generator
comparisons (Layer 8). Formal traces with their logarithm comparison, tame descent, the sign
correction of traces between differently indexed generators and the trace-compatible tower square
(Layer 9).

**Taken from other owners, not restated.**

- The finite Lubin–Tate division fields and their compatible scalar-action Galois isomorphisms,
  and the infinite unit-group comparison: RelativeFarguesFontaine §2.5. Sections 2.3–2.4 identify
  these objects with the elementary series construction and its primitive-root coordinates and
  Tate character; §2.5 adds the comparison with the pinned arithmetic Artin map.
- Quadratic canonical and quasi-canonical lifts over the completed strict base, with markings,
  orders, orbit sizes and integral endomorphism lifting filtrations:
  GrossZagierAndArithmeticHeights §7.2. Layers 6–7 add finite-residue descent, higher-degree lattice
  classification, explicit moduli coordinates and the comparisons used by the BKO towers.
- The marked strict formal `O`-module deformation rings at the finite-residue base `O_r`, and
  the algebraically closed residue-field spaces: EndoscopicTransferAndUnitaryTraceComparison
  §§10.2, 12.3. Section 3.6 constructs the functor over arbitrary specified `B` and residue field,
  for `K` of either characteristic, and for `K/ℚ_p` finite identifies its restriction with these
  supplied functors, retaining their markings.
- The formal-group algebra on Mathlib's carrier: homomorphisms, isomorphisms and strict
  isomorphisms of one-dimensional formal group laws with composition and base change, the formal
  inverse series, the multiplication series `[n]`, evaluated points on complete Hausdorff linearly
  topologized algebras, the normalized logarithm and exponential over `ℚ`-algebras (every additive
  series along `F` is a multiple of the logarithm, and `ℓ_G ∘ φ = φ′(0)·ℓ_F` for every homomorphism
  `φ`), integral logarithm coefficient bounds and convergence, exponential convergence on the
  standard disc, the height over a field of characteristic `p` with its invariance under
  isomorphism and base change, the Lazard ring with Lazard's polynomial theorem and the symmetric
  two-cocycle lemma, and finite-height rigidity: already in Tau Ceti, the development planned by
  BordismFormalGroups §F1, with the exact declarations below. The universal deformation ring
  `W(k)[[u₁,…,u_(h−1)]]` of a height-`h` formal group over a perfect field `k`: BordismFormalGroups
  §F5. Section 3.6 differs by the coefficient action of `O_K`, an arbitrary residue field and an
  arbitrary specified coefficient ring.
- Formal Lie groups `FormalLieGroup` of any dimension with `FormalLieGroup.Hom`,
  `FormalLieGroup.End`, `FormalLieGroup.Points` and the dimension-one comparison
  `FormalLieGroup.ofFormalGroup`; the equivalence `BarsottiTate.equivFormalLieGroup` between
  `p`-divisible formal Lie groups and connected `p`-divisible groups; the `ℤ_p`-Tate module
  `BarsottiTate.tateModule`; schematic closure `schematicClosure_flat`; quotients
  `BarsottiTate.quotientFiniteFlatSubgroup` by finite flat subgroups over a complete discrete
  valuation ring; relative Frobenius and Verschiebung `frobeniusHom`, `verschiebungHom` and finite
  Dieudonné theory `dieudonneEquivalenceFinite`: FiniteFlatGroupsAndIntegralPadicHodgeTheory
  §§R07.1.1, R07.1.8, R07.1.12–R07.1.13, R07.1.20–R07.1.20a, R07.2.6–R07.2.8. Sections 2.1–2.2
  differ by working `π`-adically with the `O_K`-action; §5.2 differs by constructing the quotient
  as a formal `O₀`-module with an explicit integral coordinate and a Frobenius-twisted marking.
- The elliptic formal group law and its base change (`WeierstrassCurve.formalGroup`,
  `WeierstrassCurve.map_formalGroup`), its adic point group `WeierstrassCurve.FormalGroupPoint`
  and the formal-point homomorphisms `WeierstrassCurve.formalPointHom` and
  `WeierstrassCurve.formalPointHomAdicCompletion` with its injectivity and range: already in Tau
  Ceti. The elliptic formal logarithm, exponential and their convergence on maximal ideals:
  EllipticCurves Layer 1. Frobenius on elliptic curves over finite fields and the Hasse bound:
  EllipticCurves Layer 3.
- Finite locally free commutative affine group schemes over an affine base, as spectra of finite
  projective bicommutative Hopf algebras: already in Tau Ceti; §2.1 builds the torsion group
  schemes of a formal module as such spectra. Exactness for short sequences of finite locally free
  group schemes, finite quotients, elliptic isogenies and quotients, formal completion at the zero
  section, universal elliptic deformations, elliptic `p`-divisible groups and Serre–Tate theory:
  ModularCurves §§0B, 0C, 2B, 7C, 7D, 7E, 7F.
- The arithmetic local Artin map `TauCeti.ClassFieldTheory.artinMap` with its finite restrictions
  and norm subgroups: already in Tau Ceti; local existence and the local class-field
  correspondence: ClassFieldTheory Layers 6–8. The cyclotomic case of the explicit reciprocity law
  of §2.5 (`K = ℚ_p`, `f = (1 + X)^p − 1`: the Artin symbol of `p^k u` raises `p`-power roots of
  unity to the power `u⁻¹`) is already in Tau Ceti as
  `TauCeti.ClassFieldTheory.localCyclotomicCharacter_artinMap_padic` and
  `TauCeti.ClassFieldTheory.localArtinMap_cyclotomic_padic_primePow`; §2.5 proves the statement for
  every Lubin–Tate polynomial over every nonarchimedean local field. No Lubin–Tate construction of
  reciprocity is made here; Layer 2 compares the Lubin–Tate character with the existing map.
- Finite extensions of local fields, the unit filtration `TauCeti.unitFiltration`, Teichmüller
  lifts and the logarithm isomorphism `U(K,i) ≃ 𝓂[K]^i` for `(p−1)i > e`: LocalFieldsRamification
  Layers 0–1 and Tau Ceti. The maximal unramified extension `K^ur` and arithmetic Frobenius:
  LocalFieldsRamification Layer 2. Its completion `K̂^ur`, with `G_(K̂^ur) ≅ I_K`:
  RamificationOfCompleteDiscretelyValuedFields §4a.3.

## Conventions

- `K` is a nonarchimedean local field with integers `O = O_K`, uniformizer `π`, maximal ideal
  `𝔪_K` and residue field `k_K` of cardinality `q`. In Layer 1, `O` may be any discrete valuation
  ring with finite residue field of cardinality `q` and `π` any irreducible element; Layers 2–3
  allow either characteristic and assume `K/ℚ_p` finite only in the clauses that say so; in
  §§0.3–0.4 and Layers 4–9, `K` has characteristic zero, so `K/ℚ_p` is finite with ramification
  index `e` and residue degree `f`.
- A formal `A`-module over an `A`-algebra `R` (`FormalModule`, §0.1) is a commutative
  one-dimensional Mathlib `FormalGroup R` together with an action `a ↦ [a]` of `A` by
  endomorphisms `TauCeti.FormalGroupHom F F`, additive for the formal sum `[a + b] = F([a], [b])`,
  multiplicative for composition, with `[1] = X` and linear coefficient of `[a]` the image of `a`
  under the structure map `A → R`. Its `O_K`-height `h` is read off `[π]` over a field; for
  `K/ℚ_p` finite the underlying `p`-height is `h[K:ℚ_p]`, and in characteristic `p` it is infinite,
  since `[p] = [0] = 0`.
- A coordinate change `X ↦ uX + ⋯` is strict when `u = 1`. A marked deformation carries an
  isomorphism of its special fibre with a given residual module, and marked isomorphisms preserve
  that whole isomorphism. Strictness and marking are different conditions.
- Formal logarithms have zero constant term and linear coefficient one. They converge on maximal
  ideals of finite extensions of `ℚ_p`; their exponentials are inverse only on a sufficiently deep
  ideal, and torsion lies in the kernel of the logarithm.
- Separable closures and embeddings are fixed before fields are formed. The local Artin map is
  arithmetically normalized: a uniformizer maps to a lift of arithmetic Frobenius. Thus
  `χ_π(Art_K(π^r u)) = u⁻¹` for `u ∈ O_K^×`, and replacing `π` by `uπ` multiplies `χ` by the
  unramified character sending arithmetic Frobenius to `u`.
- The deformation coefficient ring `B` is specified together with its residue field; no Cohen ring
  of an imperfect field is chosen implicitly. For the CM problem with finite `k_F`, `B = O_(F_u)`
  with `F_u` the maximal subextension of `F/F₀` that is unramified over `F₀`. The symbols `K^ur`
  and `F^ur` always denote maximal unramified extensions inside a fixed algebraic closure, and
  `K̂^ur`, `F̂^ur` their completions.
- For a lattice `L ⊃ T` with `[L:T] = q₀^N` the lattice quotient is marked to the `q₀^N`-Frobenius
  twist of the special fibre; multiplication by `π_F` compares markings when the exponent changes
  by the residue degree.
- For quadratic `F/F₀`, `O_s = O₀ + ϖ₀^s O_F` uses the uniformizer `ϖ₀` of the smaller field.
  Fields of moduli are smallest fields containing `F` over which the marked deformation is
  defined.
- In the BKO layers `p ≥ 5`, `Φ/ℚ_p` is unramified quadratic with integers `O = O_Φ`, and
  `π = −p`. The field `Φ_n` is generated by `π^(n+1)`-torsion; `Ψ′_s` is the level-`s`
  quasi-canonical field. A `π`-adic Tate generator `(v_n)` satisfies `[−p]v_(n+1) = v_n`, and the
  `p`-adic generator is `w_n = [(−1)^n]v_n`.
- Polynomial iterates are written `f^{∘m}`, with `f^{∘0} = X`; in Lean this is
  `(f.comp)^[m] Polynomial.X`.

## Exact supplier contracts

### From Mathlib

- `FormalGroup` (one-dimensional formal group law: zero constant term, linear terms `X` and `Y`,
  associativity; no commutativity and no inverse field), `FormalGroup.IsComm`, `FormalGroup.map`
  and `FormalGroup.Point`, in `Mathlib/RingTheory/FormalGroup/Basic.lean`. `FormalGroup.Point`
  consists of power series with nilpotent constant coefficient; it is not a group of
  maximal-ideal-valued points of a valued field.
- `PowerSeries.subst`, `MvPowerSeries.subst` and `PowerSeries.HasSubst`: substitution, agreeing
  with polynomial evaluation even outside `PowerSeries.HasSubst`. For general power series the
  substitution laws used here require `HasSubst`; every substitution here has zero constant term.
- `PowerSeries.substInv`, `PowerSeries.substInvOfIsUnit`, `PowerSeries.subst_substInv_left` and
  `PowerSeries.subst_substInv_right`: the two-sided substitution inverse of a series with zero
  constant term and invertible linear coefficient.
- `PowerSeries.eval₂Hom` and `PowerSeries.comp_eval₂`: evaluation at an element with
  `PowerSeries.HasEval` in a complete separated linearly topologized ring, and its compatibility
  with continuous ring maps.
- `PowerSeries.exists_isWeierstrassFactorization` and
  `PowerSeries.IsWeierstrassFactorizationAt.algEquivQuotient`: Weierstrass preparation over an
  adically complete local ring for a series with nonzero reduction, and the identification of the
  power-series quotient with the polynomial quotient.
- `IsNonarchimedeanLocalField`, `Valuation.integer` (notation `𝒪[K]`), `IsLocalRing.ResidueField`
  (notation `𝓀[K]`), `IsDiscreteValuationRing`, `IsLocalRing.residue`, `Polynomial.Monic`,
  `PowerSeries.map`, `AlgebraicClosure`, `IntermediateField.adjoin`, `Field.absoluteGaloisGroup`,
  `Field.absoluteGaloisGroupAbelianization` (`TopologicalAbelianization` of the absolute Galois
  group), `IsKrasner` and `IsKrasner.krasner`, `spectralNorm`, `WittVector`, `GaloisField`,
  `WeierstrassCurve.map`, `WeierstrassCurve.Δ`, `WeierstrassCurve.Affine.Point`,
  `IsDedekindDomain.HeightOneSpectrum.adicCompletion` and
  `IsDedekindDomain.HeightOneSpectrum.adicCompletionIntegers`.

**Checks.**

- Over `ℤ`, substituting the constant `1` into the polynomial `X` gives `1`, although `1` is
  not nilpotent and fails `HasSubst`; a rule forcing all inadmissible substitutions to zero
  would give the wrong polynomial value.

### From Tau Ceti

- `TauCeti.FormalGroupHom` and `TauCeti.FormalGroupIso`
  (`TauCeti/RingTheory/FormalGroup/Hom.lean`): origin-preserving homomorphism series and mutually
  inverse homomorphisms on the native formal-group carrier, with `TauCeti.FormalGroupHom.id`,
  `TauCeti.FormalGroupHom.comp` (composition is substitution, outer map first), base change
  `TauCeti.FormalGroupHom.map` and `TauCeti.FormalGroupIso.map`, and strictness
  `TauCeti.FormalGroupIso.IsStrict` (linear coefficient one). Sums of homomorphisms are not
  bundled there; this roadmap writes them as the formal sum `F(φ, ψ)`.
- `FormalGroup.addInvX` (`…/FormalGroup/AddInv.lean`), the formal inverse series;
  `FormalGroup.nsmulSeries` and `FormalGroup.zsmulSeries` (`…/NSMul/Basic.lean`, `…/ZSMul.lean`),
  the multiplication series `[n]_F` with linear coefficient `n`, and `FormalGroup.zsmulHom`, the
  endomorphism `[n]` of a commutative law.
- `FormalGroup.log`, `FormalGroup.exp`, `FormalGroup.logIso` and
  `FormalGroup.subst_toPowerSeries_eq_add_iff` (`…/Logarithm/Basic.lean`): over a `ℚ`-algebra, the
  normalized logarithm and exponential, the strict isomorphism to the additive law, and the fact
  that the additive series along `F` are exactly the multiples of the logarithm;
  `TauCeti.FormalGroupHom.subst_log` and `TauCeti.FormalGroupHom.coeff_one_injective`
  (`…/Logarithm/Naturality.lean`): `ℓ_G ∘ φ = φ′(0)·ℓ_F` for a homomorphism `φ : F → G`, and a
  homomorphism over a `ℚ`-algebra is determined by its linear coefficient.
- `FormalGroup.height`, `FormalGroup.height_map` and `TauCeti.FormalGroupIso.height_eq`
  (`…/Height/Basic.lean`): the height of a formal group law over a field at a prime `p` (`⊤` when
  `[p] = 0`), its invariance under field extension and under isomorphism.
- `TauCeti.LazardRing`, `TauCeti.LazardRing.lift` and `TauCeti.LazardRing.mvPolynomialEquiv`
  (`…/LazardRing/Basic.lean`, `…/LazardRing/Polynomial.lean`): the Lazard ring, its universal
  property for commutative laws and Lazard's polynomial theorem; and
  `TauCeti.existsUnique_eq_smul_lazardCocycle` (`…/SymmetricCocycle/Classification.lean`): a
  homogeneous symmetric additive two-cocycle of degree `n ≥ 2` over any commutative ring is a
  unique multiple of the divided binomial cocycle.
- `FormalGroup.exists_iso_lifting_coordinate` (`…/CoordinateChange/Lifting.lean`): over a
  coefficient map surjective on elements and on units, a prescribed change of coordinates of the
  reduction lifts to an isomorphism onto a lift with the prescribed special fibre.
- `FormalGroup.TopNilpotentPoint` (`TauCeti/RingTheory/FormalGroup/TopNilpotentPoint/Basic.lean`)
  has a coordinate and a `PowerSeries.HasEval` proof. Its group structure requires a complete
  Hausdorff linearly topologized algebra, and commutativity requires `F.IsComm`.
  `TauCeti.FormalGroupHom.toTopNilpotentPointHom` (`…/TopNilpotentPoint/Hom.lean`) evaluates a
  homomorphism on those points. For a local field extension these are used on `O_L` with its
  maximal-ideal adic topology, not on `L` with a field-linear topology.
- `FormalGroup.norm_coeff_log_le_inv_norm_natCast`, `FormalGroup.onOpenDisc_log`,
  `FormalGroup.summable_norm_coeff_log_mul_pow` and `FormalGroup.summable_coeff_log_mul_pow`
  (`TauCeti/RingTheory/FormalGroup/Logarithm/Convergence.lean`): for a coefficient map to a
  characteristic-zero normed field taking every coefficient into the closed unit ball, the
  normalized logarithm has coefficient bound `‖n⁻¹‖` and converges for `‖x‖ < 1`; the last result
  requires completeness. `FormalGroup.summable_coeff_exp_mul_pow`
  (`…/Exponential/Padic.lean`) supplies exponential convergence in a complete normed `ℚ_p`-algebra
  field for `‖x‖ < p^(−1/(p−1))`, including `p = 2`.
- `TauCeti.FormalGroupHom.eq_of_map_residue_eq` and
  `TauCeti.FormalGroupIso.eq_of_map_residue_eq` (`…/Rigidity.lean`): over a maximal-ideal-adically
  Hausdorff local ring with residue characteristic `p`, homomorphisms and isomorphisms between
  commutative formal groups agree if their reductions agree and the source has finite residual
  `p`-height. Section 3.4 uses them for `K/ℚ_p` finite, with residual `p`-height `h[K:ℚ_p]`; in
  characteristic `p` the residual `p`-height is infinite and §3.4 proves rigidity itself.
- `WeierstrassCurve.formalGroup`, `WeierstrassCurve.isComm_formalGroup` and
  `WeierstrassCurve.map_formalGroup` (`TauCeti/AlgebraicGeometry/EllipticCurve/FormalGroup/Basic.lean`):
  the elliptic formal group law in the parameter `z = −x/y`, its commutativity and base change.
- `WeierstrassCurve.FormalGroupPoint` (`…/FormalGroup/AdicPoint.lean`): parameters in an adic ideal
  with evaluated elliptic addition, inverse and `AddCommGroup` structure.
- `WeierstrassCurve.formalPointHom` (`…/FormalGroup/Point/Hom.lean`), an injective homomorphism into
  affine points under an explicit auxiliary-point hypothesis; and
  `WeierstrassCurve.formalPointHomAdicCompletion`,
  `WeierstrassCurve.formalPointHomAdicCompletion_injective` (`…/Point/AdicCompletion.lean`) and
  `WeierstrassCurve.range_formalPointHomAdicCompletion` (`…/Point/Range.lean`): for a curve over the
  integers of the completion of a Dedekind domain at a height-one prime, elliptic over the
  completed fraction field, the unconditional injective formal-point homomorphism and its range,
  the kernel of reduction.
- `TauCeti.ClassFieldTheory.artinMap` (`TauCeti/NumberTheory/ClassFieldTheory/Local/ArtinMap.lean`):
  the arithmetic local Artin map `Kˣ →* Field.absoluteGaloisGroupAbelianization K` of a
  nonarchimedean local field, with `TauCeti.ClassFieldTheory.artinMap_restrict` (finite
  restrictions are the finite local Artin maps), `TauCeti.ClassFieldTheory.exists_artinMap_mem_iff`
  (preimages of open subgroups are norm subgroups), `TauCeti.ClassFieldTheory.artinMap_norm` and
  `TauCeti.ClassFieldTheory.artinMap_congr` (norm functoriality and naturality in the field).
- `TauCeti.ClassFieldTheory.localCyclotomicCharacter_artinMap_padic` and
  `TauCeti.ClassFieldTheory.localArtinMap_cyclotomic_padic_primePow`
  (`TauCeti/NumberTheory/ClassFieldTheory/Local/ExplicitCyclotomicSymbol/ArtinMap.lean`): a lift of
  the Artin symbol of `p^k u`, `u ∈ ℤ_p^×`, has cyclotomic character `u⁻¹` and raises every root of
  unity of order dividing `p^n` to the power `u⁻¹ mod p^n`. This is the case `K = ℚ_p`,
  `f = (1 + X)^p − 1` of §2.5, proved there without Lubin–Tate theory.
- `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat` and
  `TauCeti.finiteLocallyFreeBicommutativeHopfAlgCatOpEquivFiniteLocallyFreeCommAffineGroupSchemeCat`
  (`TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/FiniteLocallyFree.lean`): commutative
  affine group schemes over `Spec R` that are finite, flat and locally of finite presentation, and
  `Spec` as an anti-equivalence onto them from finite projective commutative and cocommutative
  Hopf `R`-algebras, for any commutative ring `R`. These are ordinary spectra: the formal spectrum
  of an adic ring has as points only the open primes, the zero locus of an ideal of definition
  (`TauCeti.FormalScheme.Spf.carrier_eq_zeroLocus`,
  `TauCeti/AlgebraicGeometry/FormalScheme/Spf/Carrier.lean`).
- `TauCeti.unitFiltration` (`TauCeti/NumberTheory/LocalField/UnitFiltration/Basic.lean`):
  `U(K,i) ⊂ Kˣ`, the image of `O_K^×` for `i = 0` and `1 + 𝔪_K^i` for `i ≥ 1`.
- `TauCeti.teichmuller` (`TauCeti/RingTheory/Henselian/Teichmuller.lean`) and
  `TauCeti.GlobalNumberFields.weakApproximation_denseRange`
  (`TauCeti/NumberTheory/NumberField/Global/Approximation/Weak.lean`).

### From TauCetiRoadmap.RelativeFarguesFontaine

§2.5 supplies `E_m = E(LT[π^m])`, their compatible inclusions and scalar-action isomorphisms
`Gal(E_m/E) ≅ (O_E/π^m)^×`, and the infinite unit-group comparison, for a nonarchimedean local
field `E` of either characteristic. Sections 2.3–2.4 identify this same tower with `K(F_f[π^m])`
for every Lubin–Tate series `f` for `π`, using the same-parameter coordinate comparison. Under that
identification the scalar `a` acts by `[a]_f`; §2.5 determines its inverse-unit value on
arithmetic Artin symbols.

### From TauCetiRoadmap.GrossZagierAndArithmeticHeights

§7.2 supplies quadratic canonical and level-`s` quasi-canonical lifts over the completed strict
integer ring of `F`, their special-fibre markings and prescribed tangent CM embedding, orders
`O_s`, degree-`q₀^s` quotient isogenies, and marked orbit `O_F^×/O_s^×`. For `s ≥ 1` its size is
`q₀^(s−1)(q₀+1)` when unramified and `q₀^s` when ramified; level zero has one class. Its integral
endomorphism filtrations and lifting lengths remain with that supplier. Sections 6.1–6.6 identify
the quadratic base changes of the finite-residue lattice models with these lifts and markings;
§7.1 identifies their finite-residue fields with the fields whose strict completions occur there.
For each comparison choose the supplier's residual module to be the designated Frobenius twist
and transport the same residual CM embedding and marking.

### From TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison

§10.2 supplies the marked strict `O`-module deformation functor for its residual modules over
`κ_r` and its ring `O_r[[T₁,…,T_(h−1)]]`; §12.3 supplies the corresponding algebraically closed
residue-field deformation spaces. The tangent action is the structural action, and markings
preserve it. Section 3.6 extends to arbitrary specified complete noetherian local `B` with residue
field `k` and identifies the specialization with those same functors by their marked universal
properties; it does not construct a second finite-residue deformation space.

### From TauCetiRoadmap.BordismFormalGroups

§F5 supplies the universal deformation ring `W(k)[[u₁,…,u_(h−1)]]` of a specified height-`h`
formal group over a perfect field `k`, with its universal property, coordinate changes and
automorphism action, assumed with the hypotheses stated there; §3.6 here specializes to it when
`O_K = ℤ_p`, `k` is perfect and `B = W(k)`. The formal-group algebra that §F1 plans is consumed
from its Tau Ceti implementation, through the declarations listed under "From Tau Ceti".

### From TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory

§R07.1.12 supplies `FormalLieGroup`, `FormalLieGroup.Hom`, `FormalLieGroup.End`,
`FormalLieGroup.Points F S J` (for an algebra `S` over the complete noetherian local base that is
complete and separated for an ideal `J`, the tuples with coordinates in the radical of `J`, with
convergent addition and functoriality along continuous algebra maps carrying the ideals into one
another), `FormalLieGroup.evalPoints` and `FormalLieGroup.ofFormalGroup`. Section 0.2 uses
`FormalLieGroup.Points` only through the comparison stated there: when the topology of `S` is
the `J`-adic one, the native points with coordinate in `J` form the subgroup of
`FormalLieGroup.Points` of points with coordinate in `J`, all of it exactly when `J` is
radical. §R07.1.13 supplies
`BarsottiTate.equivFormalLieGroup` over a complete noetherian local ring with residue
characteristic `p`. §R07.1.8 supplies `BarsottiTate.tateModule`, free of rank the height over
`ℤ_p` with continuous Galois action, over a henselian local domain with fraction field of
characteristic zero. §R07.1.20 supplies `schematicClosure_flat` over a Dedekind base and
§R07.1.20a supplies `BarsottiTate.quotientFiniteFlatSubgroup`, with the exact sequence
`0 → T_p(G) → T_p(G/H) → H(K̄) → 0`, over a complete discrete valuation ring of mixed
characteristic. §R07.1.1 supplies `frobeniusHom` and `verschiebungHom` with `V∘F = [p] = F∘V`;
§§R07.2.6–R07.2.8 supply the contravariant finite Dieudonné module and
`dieudonneEquivalenceFinite`. Variances are those of the supplier.

### From TauCetiRoadmap.EllipticCurves

Layer 1 supplies isogenies, the dual isogeny, the invariant differential and the four elliptic
formal-group milestones: the law, the logarithm and exponential over a `ℚ`-algebra, convergence on
the maximal ideal of a complete valued field, and the identification with the kernel of reduction.
Layer 3 supplies the Frobenius endomorphism of an elliptic curve over a finite field, its
characteristic polynomial `T² − a_q T + q` with `#E(𝔽_q) = q + 1 − a_q`, and positivity and
multiplicativity of the isogeny degree.

### From TauCetiRoadmap.ModularCurves

§0B (finite locally free commutative group schemes and Cartier duality), §0C (finite quotients and
torsors), §2B (isogenies and quotients of elliptic curves by finite locally free subgroups), §7C
(formal completion at the zero section, with coordinate changes `X ↦ uX + ⋯`), §7D (universal
marked deformations of an elliptic curve over an algebraically closed field of characteristic `p`,
over `W(k)[[T]]`), §7E (the elliptic `p`-divisible group, PD-1 to PD-5) and §7F (the Serre–Tate
equivalence ST-1 and ST-2). The elliptic comparisons of §§3.7 and 5.5 are stated on the domains of
these theorems.

### From TauCetiRoadmap.ClassFieldTheory

Layers 6–7: finite local reciprocity, the absolute local Artin map with its arithmetic
normalization, unramified coordinate, norm functoriality and naturality (implemented in Tau Ceti as
`TauCeti.ClassFieldTheory.artinMap`), with the Frobenius convention of its Conventions C.6 (a
uniformizer maps to arithmetic Frobenius, and `χ_cyc(Art_K(u)) = N_(K/ℚ_p)(u)⁻¹` for units `u`
of a finite extension `K/ℚ_p`). Layer 8: the local norm subgroups and the class-field
correspondence, including `localAbelianExistence` for finite extensions of `ℚ_p`, used to identify
fields of moduli and fixed fields by their norm groups.

### From TauCetiRoadmap.LocalFieldsRamification

Layer 0: finite extensions of local fields with their integers, residue fields, uniformizers and
normalized valuations, and finite Galois fixed fields. Layer 1: the unit filtration, the
Teichmüller section, the structure of `Kˣ` and of `O_K^×`, and the logarithm isomorphism
`U(K,i) ≃ (𝔪_K^i, +)` with inverse `exp` when `(p − 1)i > e`. Layer 2: unramified extensions,
the algebraic maximal unramified extension `K^ur` inside a fixed algebraic closure, and arithmetic
Frobenius. The completion of `K^ur` is not built there.

### From TauCetiRoadmap.RamificationOfCompleteDiscretelyValuedFields

§4a.3 supplies the completion `K̂^ur` of the maximal unramified extension `K^ur` of `K`: a field
complete for a discrete valuation with `e(K̂^ur/K) = 1` and residue field an algebraic closure of
`k_K`, the equivalence between finite separable extensions of `K^ur` and of `K̂^ur`, and the
identification `G_(K̂^ur) ≅ I_K` of its absolute Galois group with the inertia group of `K`. These
are assumed with the hypotheses stated there. Sections 2.5–2.6 use `K̂^ur` as the base over which
Lubin–Tate modules of different uniformizers become isomorphic, and §6.6 uses `F̂^ur` for Gross's
formulation of the field of moduli.

## How to read the build

Layer 0 adds the coefficient action to the existing formal-group carrier, the module structure on
evaluated points, analytic logarithms and number-field models of local fields. Layer 1 constructs
the Lubin–Tate formal module of an admissible series by interpolation. Layer 2 computes its torsion
and Tate module, identifies the supplied division tower and character in primitive coordinates, and
compares the character with the arithmetic Artin map. Layer 3 is the deformation theory of formal
`O_K`-modules of finite height. Layer 4 is Honda's theory over unramified bases and the
supersingular elliptic comparison. Layer 5 builds integral lattice quotients of formal modules and
their homomorphisms. Layer 6 descends quadratic canonical and quasi-canonical lifts from their
supplied strict-base models and proves the higher-degree lattice classification and finite-residue
fields of moduli; Layer 7 computes the finite-residue quadratic degrees, the uniformizer property
and the BKO primed tower. Layer 8 builds the BKO tame and anticyclotomic towers and Layer 9 the
formal traces between them. Layers 3–4 depend only on Layers 0–2, and Layer 5 on Layers 0, 2 and 3;
Layers 6–9 depend on their predecessors as listed in each layer's dependencies. No section requires
a later one: a consequence of an early construction for objects built later is stated with those
objects (the coordinate comparison of §1.4 in §§2.1–2.4, the logarithm of a formal trace in §9.1,
the comparison of the quadratic levels of the §6.2 lattice quotients with the supplied lifts in §6.5,
the Artin action on marked lattice classes in §6.6, the signs of traces between differently indexed
generators in §9.3), and the remaining forward references are pointers only.

The companion `Suggested.lean` states the headline theorems that are statable against the pinned
libraries, with the formal-module structure `FormalModule` of §0.1 and the two predicates
`IsLubinTateSeries` and `IsLubinTatePolynomial` of §1.1: the Lubin–Tate theorem
`exists_formalModule_of_isLubinTateSeries` (§1.3) and the interpolation of homomorphisms
`existsUnique_lubinTate_intertwiner` (§1.2), the division-field degree
`finrank_adjoin_primitive_lubinTate_root` (§2.3), the explicit reciprocity law
`artinMap_apply_lubinTate_root` and the norm-group comparison
`artinMap_fixes_lubinTate_roots_iff` with Tau Ceti's Artin map (§2.5), and the Lubin–Tate
structure of the supersingular elliptic formal group `isLubinTateSeries_zsmulSeries_formalGroup`
(§4.4). Its module docstring lists the headline theorems that need carriers absent at the pins.

## Layer 0: Formal modules, points and analytic logarithms

This layer extends the native commutative formal group law by a coefficient-ring action, puts the
module structure on native `FormalGroup.TopNilpotentPoint`, compared with
FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.12, constructs the evaluated logarithm
homomorphism and its deep inverse from the supplied convergence bounds, and realizes finite
extensions of `ℚ_p` as completions of number
fields so that Tau Ceti's elliptic formal-point homomorphism applies to them.

### 0.1 One-dimensional formal modules

Let `A` be a commutative ring and `R` a commutative `A`-algebra. Define `FormalModule A F`, a
formal `A`-module structure on a `FormalGroup R` `F`: `F` is commutative, and `a ↦ [a]_F` is a map
from `A` to the endomorphisms `TauCeti.FormalGroupHom F F` with `[1]_F = X`,
`[ab]_F = [a]_F ∘ [b]_F`, `[a + b]_F = F([a]_F, [b]_F)` (the formal sum), and linear coefficient
of `[a]_F` equal to the image of `a` in `R`. A homomorphism of formal `A`-modules is a
formal-group homomorphism commuting with every `[a]`. When `A = O_K` and `R = k` is a field over
`k_K`, the height of `F` is the integer `h` such that the first nonzero coefficient of `[π]_F` is
that of `X^(q^h)`, and is infinite when `[π]_F = 0`; the height of a module over a local ring is the
height of its special fibre. Over a field the first nonzero term of `[π]_F` sits in a `q`-power
degree, because differentiating the homomorphism equation forces a `p`-power and commuting with
`[ζ]` for the residue units `ζ ∈ k_K^×` forces a power of `q` (VZ07, Definition 1.1, pp.57–58;
Lemma 2.1 and Definition 2.2, p.60).

API:

- A commutative formal group law, an action map into its endomorphisms and the identities above
  determine a formal module; two formal modules on the same law are equal when all action series
  agree.
- The restriction of the action to `ℤ` is multiplication: `[n]_F` is Tau Ceti's
  `FormalGroup.zsmulSeries F n` for every integer `n`, so `[0]_F = 0` and `[−1]_F` is the formal
  inverse `FormalGroup.addInvX`.
- Base change along an `A`-algebra map `R → R′` maps the law and every action series, and is
  compatible with identities and composites.
- Restriction of scalars along a ring map `A → A′` turns a formal `A′`-module into a formal
  `A`-module with the same law.
- Conjugating the law and all action series by an isomorphism of formal group laws gives an
  isomorphic formal module; height is unchanged.
- For a finite extension `F/F₀` of local fields of degree `n`, a formal `O_F`-module of
  `O_F`-height `h` has `O_(F₀)`-height `nh`; in particular, for `F/ℚ_p` finite, its `p`-height,
  Tau Ceti's `FormalGroup.height` at `p` of the special fibre, is `h[F:ℚ_p]`.
- Over a `ℚ`-algebra the action is determined by the law: `[a]_F` is the unique endomorphism with
  linear coefficient `a`, by `TauCeti.FormalGroupHom.coeff_one_injective`, and
  `ℓ_F ∘ [a]_F = a·ℓ_F` is `TauCeti.FormalGroupHom.subst_log` for that endomorphism; these are
  library facts, not targets.

**Checks.**

- The multiplicative formal group `X + Y + XY` over `𝔽_p` with `[a] = (1+X)^a − 1` (binomial
  series, `a ∈ ℤ_p`) has `[p] = X^p` and height one; a definition reading height off the linear
  coefficient would give infinity, since that coefficient is `p = 0`.
- The additive formal group over `𝔽_p` with `[a] = aX` has `[p] = 0` and infinite height.
- A Lubin–Tate `O_F`-module for quadratic `F/F₀` restricted to `O_(F₀)` has height two, not one.
- Take `A = R = ℚ(i)` with the identity structure map and the additive law. The unital action
  `[a](X) = ā X` (complex conjugation) satisfies every ring identity but has linear coefficient
  `−i ≠ i` at `a = i`, so it is not a formal `A`-module for this structure map; the tangent
  condition is not implied by the other axioms.
- Additivity is not implied either. Take `A = 𝔽_p[t]` acting on `R = 𝔽_p` through `t ↦ 0`, the
  additive law, and the map sending `t^k b` with `b(0) ≠ 0` to `b(0)X^(p^k)` (and `0` to `0`). It
  is unital, multiplicative (`b(0)c(0)^(p^k) = b(0)c(0)` on `𝔽_p`), has the right linear
  coefficients, and every value is an endomorphism; but it sends `1 + t` to `X`, whereas
  `F([1], [t]) = X + X^p`. The honest structure sends `1 + t` to `X + X^p`.
- Over `𝔽_p`, the series `X + X^p` is a strict automorphism of the additive formal group commuting
  with the `𝔽_p`-action, and it is not the identity: strictness does not identify an isomorphism
  with `X`.

*Needs:* Mathlib `FormalGroup`, `FormalGroup.IsComm`, `FormalGroup.map`; Tau Ceti
`TauCeti.FormalGroupHom` (with `id`, `comp` and `map`), `TauCeti.FormalGroupIso`,
`FormalGroup.zsmulSeries`, `FormalGroup.addInvX`, `FormalGroup.height`.

### 0.2 The module of adic points

Let `R` be a complete Hausdorff linearly topologized commutative `A`-algebra and `I` an ideal of
topologically nilpotent elements, and let `F` be a formal `A`-module over `R`. On the evaluated
point group `F(I)`, the subgroup of `FormalGroup.TopNilpotentPoint F R` with coordinate in `I`
(a subgroup because `F(X,Y) − X − Y ∈ XY·R[[X,Y]]`, `ι_F(X) + X ∈ X²·R[[X]]` for the formal inverse
`ι_F` and `[a]_F ∈ X·R[[X]]`, and evaluation is a ring homomorphism), define the `A`-module
structure by evaluating `[a]_F`, and prove the module axioms by continuity of substitution.
Compare `F(I)` with `FormalLieGroup.Points` of FiniteFlatGroupsAndIntegralPadicHodgeTheory
§R07.1.12, whose coordinates range over the radical of the ideal: when `F` is defined over a
complete noetherian local ring `Λ`, `R` is a `Λ`-algebra and the topology of `R` is the `I`-adic
one, prove that the identity on coordinates identifies `F(I)` with the subgroup of
`FormalLieGroup.Points (FormalLieGroup.ofFormalGroup F) R I` of points with coordinate in `I`,
and that the two carriers are equal exactly when `I` is a radical ideal, as for `I = 𝔪_L` in the
integers of a finite extension `L/K`. For a non-radical `I`, such as the deep ideals `𝔪_L^r` of
§0.3, only the native subgroup `F(I)` is used. A
continuous coefficient map `R → R′` carrying `I` into `I′` induces an `A`-linear point map. For a
finite extension `L/K` the module `F(𝔪_L)` is defined, and `F(𝔪_(K̄))` is the union of the
`F(𝔪_L)` over finite subextensions `L` of a fixed algebraic closure, with the induced action of the
absolute Galois group; no evaluation on the incomplete field `K̄` is used (LT65, §1, p.383,
formulas (12)–(13) and the following paragraph).

API:

- Two points are equal exactly when their parameters are equal.
- A continuous coefficient map carrying the ideals into one another induces a continuous
  `A`-linear map of point modules, compatible with composites; an isomorphism of formal modules
  induces an isomorphism of point modules.
- Under the hypotheses of the comparison above, the identity on coordinates is an injective
  additive map `F(I) → FormalLieGroup.Points (FormalLieGroup.ofFormalGroup F) R I` carrying
  `[a]_F` to `FormalLieGroup.evalPoints` of `[a]_F`, with image the points whose coordinate lies
  in `I`; it is surjective exactly when `I` equals its radical.
- For a Weierstrass curve `W` over `R` and an ideal `I` defining the topology of `R` (the `IsAdic I`
  hypothesis of `WeierstrassCurve.FormalGroupPoint`), the identity on parameters is an
  `A`-linear isomorphism between the point module `F(I)` of `WeierstrassCurve.formalGroup` and
  `WeierstrassCurve.FormalGroupPoint W I`, respecting addition and inverse; both carriers consist
  of the parameters in `I` itself.
- Galois automorphisms fixing the coefficients act continuously and `A`-linearly on `F(𝔪_(K̄))`,
  and the inclusions `F(𝔪_L) ⊂ F(𝔪_(L′))` are Galois equivariant.
- For a curve over the integers of a height-one adic completion of a Dedekind domain, the
  composite of the parameter isomorphism with `WeierstrassCurve.formalPointHomAdicCompletion` is
  injective with range given by `WeierstrassCurve.range_formalPointHomAdicCompletion`, exactly in
  that presentation.

**Checks.**

- `F(0)` is the zero module.
- For the multiplicative group `x +_F y = x + y + xy`; over `ℤ_p` with `x = y = p` this is
  `2p + p²`, not `2p`.
- For prime `p` and `R = ℤ_p`, Mathlib's `FormalGroup.Point` with no power-series variables has
  only the zero parameter, because `ℤ_p` is reduced and the constant must be nilpotent, whereas
  the evaluated additive group `𝔾_a(pℤ_p)` contains the nonzero parameter `p`: the two point
  constructions are different.
- For the additive group over `ℤ₃`, whose `3`-adic topology is also its `9`-adic topology, and
  `I = 9ℤ₃`, the native module `F(I)` has coordinates `9ℤ₃`, whereas
  `FormalLieGroup.Points` for the ideal `9ℤ₃` has coordinates in its radical `3ℤ₃`: the
  coordinate `3` lies in the second carrier and not in the first. For the radical ideal
  `I = 3ℤ₃` both carriers are `3ℤ₃` and coincide. A comparison identifying the two carriers for
  every ideal would be false.
- For a finite extension `K ⊂ L`, the inclusion `F(𝔪_K) → F(𝔪_L)` commutes with every `[a]` and
  with every coordinate isomorphism defined over `O_K`.
- In a Dedekind adic-completion presentation, the composite map sends the zero parameter to the
  identity point, matching `WeierstrassCurve.formalPointHomAdicCompletion` at zero.

*Needs:* §0.1; Tau Ceti `FormalGroup.TopNilpotentPoint`,
`TauCeti.FormalGroupHom.toTopNilpotentPointHom`; FiniteFlatGroupsAndIntegralPadicHodgeTheory
§R07.1.12 (`FormalLieGroup.Points`, `FormalLieGroup.evalPoints`, `FormalLieGroup.ofFormalGroup`)
for the comparison only; Mathlib `PowerSeries.eval₂Hom`, `PowerSeries.comp_eval₂`; Tau
Ceti `WeierstrassCurve.FormalGroupPoint`, `WeierstrassCurve.map_formalGroup`,
`WeierstrassCurve.formalPointHomAdicCompletion`,
`WeierstrassCurve.formalPointHomAdicCompletion_injective`,
`WeierstrassCurve.range_formalPointHomAdicCompletion`; LocalFieldsRamification Layer 0.

### 0.3 Convergence of the formal logarithm

Let `K/ℚ_p` be finite and `F` a commutative formal group law over `O_K`. Using the supplied
coefficient bounds and convergence, prove that evaluation of the normalized logarithm
`ℓ_F ∈ X·K[[X]]` on `𝔪_L` for every finite extension `L/K` defines a homomorphism `F(𝔪_L) → (L, +)`;
that for each `L` there is `r ≥ 1` such that `ℓ_F` and its formal inverse are mutually inverse
analytic isomorphisms between `F(𝔪_L^r)` and `𝔪_L^r`; and that the evaluated logarithm commutes with
field embeddings and with coordinate isomorphisms over `O_K`. Its compatibility with formal traces
is a property of the traces and is stated with them in §9.1. The kernel of `ℓ_F` on `F(𝔪_L)`
contains the torsion, so no injectivity on `F(𝔪_L)` is asserted. A proof route: use the supplied
logarithm and exponential summability to evaluate the formal addition and inverse identities on a
deep ideal; extend the addition identity to the maximal ideal by convergence. For nonzero `x`, the
supplied bound gives `n·v_L(x) − v_L(n) → ∞`; choosing `(p−1)r > e_L` puts `𝔪_L^r` in the
exponential disc (H70, §1, pp.216–219; LT65, §1, p.383).

**Checks.**

- For the multiplicative group, `ℓ(x) = log(1 + x)` agrees with the logarithm of
  LocalFieldsRamification Layer 1 on `U(K,i)` for `(p−1)i > e`.
- For `x = ζ_p − 1 ∈ 𝔪_(ℚ_p(ζ_p))`, `ℓ(x) = log ζ_p = 0` although `x ≠ 0`.
- For the additive group the logarithm is `X`, and `r = 1` works.
- At `p = 2`, the coefficient of `X²` in `log(1+X)` is `−1/2`, of norm `2 = ‖2⁻¹‖`. The
  exponential disc is `‖x‖ < 1/2`; over `ℚ₂`, `r = 2` gives `‖4‖ = 1/4 < 1/2`.

*Needs:* §0.2; Tau Ceti `FormalGroup.log`, `FormalGroup.exp` (logarithm and exponential identities),
`FormalGroup.summable_coeff_log_mul_pow`, `FormalGroup.norm_coeff_log_le_inv_norm_natCast`,
`FormalGroup.summable_coeff_exp_mul_pow`; LocalFieldsRamification Layers 0–1.

### 0.4 Number-field models of local fields and the elliptic point map

Let `L₁ ⊂ L₂ ⊂ ⋯ ⊂ L_r` be finite extensions of `ℚ_p` inside a fixed algebraic closure. Prove that
there are number fields `E₁ ⊂ E₂ ⊂ ⋯ ⊂ E_r` and height-one primes `𝔭_i` of their rings of integers,
with `𝔭_(i+1)` above `𝔭_i`, and continuous field isomorphisms
`IsDedekindDomain.HeightOneSpectrum.adicCompletion E_i 𝔭_i ≃ L_i` compatible with the inclusions.
Transport along these isomorphisms the integer rings, maximal ideals, a Weierstrass curve `W` over
`O_(L_r)` that is elliptic over `L_r`, its formal group law and logarithm, and the formal-point
homomorphism `WeierstrassCurve.formalPointHomAdicCompletion`, compatibly with the inclusions
`L_i ⊂ L_(i+1)`. A proof route: realize `L₁ = ℚ_p(α₁)` by approximating the minimal polynomial of
`α₁` by a rational polynomial and applying Krasner's lemma, so that `E₁ = ℚ(α₁′)` is dense in `L₁`;
inductively, approximate the minimal polynomial of a generator of `L_(i+1)/L_i` by a polynomial
over the dense subfield `E_i` and apply Krasner's lemma again; weak approximation chooses the
approximations.

API:

- The isomorphisms carry `IsDedekindDomain.HeightOneSpectrum.adicCompletionIntegers` onto `O_(L_i)` and its maximal ideal onto
  `𝔪_(L_i)`, and are compatible with the inclusions.
- The transported curve has transported discriminant, and its formal group law is the transport of
  `WeierstrassCurve.formalGroup` by `WeierstrassCurve.map_formalGroup`.
- On points of §0.2, the transported formal-point homomorphism is injective with range the kernel
  of reduction of the transported model, and commutes with the inclusions and with the Galois
  actions of the towers.

**Checks.**

- For `L₁ = ℚ_p`, one may take `E₁ = ℚ` and `𝔭₁ = (p)`.
- For odd `p` and `L = ℚ_p(√u)` unramified quadratic with `u` a non-square unit, `E = ℚ(√u′)` for
  an integer `u′ ≡ u mod p` is inert at `p` and has completion `L`; an integer `u′` that is a nonzero
  square modulo `p` splits `p`, and both completions are `ℚ_p`, not `L`.
- Krasner's lemma needs the approximation to be closer than the distances between conjugates: for
  `L = ℚ_2(√−1)`, the polynomial `X² + 1 + 2` has root field `ℚ_2(√−3)`, which is unramified and
  different from `L`.

*Needs:* §0.2; Mathlib `IsKrasner.krasner`, `IsDedekindDomain.HeightOneSpectrum.adicCompletion`;
Tau Ceti `TauCeti.GlobalNumberFields.weakApproximation_denseRange`,
`WeierstrassCurve.formalPointHomAdicCompletion`, `WeierstrassCurve.range_formalPointHomAdicCompletion`;
LocalFieldsRamification Layer 0.

### Examples

The multiplicative formal `ℤ_p`-module has points `1 + 𝔪_L` and logarithm `log(1 + x)`; the
additive module has points `𝔪_L` with `[a]x = ax`; the formal group of an elliptic curve over `ℤ_p`
with its `ℤ_p`-action has point module the kernel of reduction (§§0.2, 0.4).

### Dependencies

Mathlib `FormalGroup`, power-series substitution and evaluation, Krasner's lemma and the adic
completions of a Dedekind domain at a height-one prime; Tau Ceti's elliptic formal group
and formal-point homomorphisms, native general points, logarithm and exponential convergence,
and weak approximation, and the formal-group algebra (homomorphisms, `[n]`, logarithm, height);
FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.12; LocalFieldsRamification Layers 0–1.

## Layer 1: The Lubin–Tate construction

Throughout this layer `O` is a discrete valuation ring with finite residue field of cardinality
`q`, and `π ∈ O` is irreducible. Completeness of `O` and the characteristic of its fraction field
play no role: the construction is a coefficient induction whose error terms are divisible by `π`.

### 1.1 Lubin–Tate series and polynomials

Define `IsLubinTateSeries π q f` for `f ∈ O[[X]]`: the constant coefficient of `f` is zero, its
linear coefficient is `π`, and its image in `k[[X]]` under reduction modulo the maximal ideal is
`X^q`. Define `IsLubinTatePolynomial π q f` for `f ∈ O[X]`: `f` is monic of degree `q`, with
constant coefficient zero, linear coefficient `π` and reduction `X^q`. The standard example is
`πX + X^q` (LT65, §1, p.380, condition (1)). These definitions are made over any local ring; the
theorems use them with `q` the residue cardinality.

API:

- A Lubin–Tate polynomial, viewed as a power series, is a Lubin–Tate series.
- `πX + X^q` is a Lubin–Tate polynomial whenever `q ≥ 2`.
- The predicates depend only on the coefficients, and are preserved by a ring isomorphism carrying
  `π` to `π′` and inducing a bijection of residue fields; changing the uniformizer is a different
  operation from changing coordinates for the same `π`.
- A Lubin–Tate series has zero constant term, so it is admissible for substitution.

**Checks.**

- For `O = ℤ_p` and `π = p`, `(1 + X)^p − 1` is a Lubin–Tate polynomial: its constant term is `0`,
  its linear coefficient is `p`, and it reduces to `X^p`.
- `πX` alone is not a Lubin–Tate series: its reduction is `0`, not `X^q`.
- Over `O = W(𝔽_(p²))`, `−pX + X^(p²)` is a Lubin–Tate polynomial for `−p` and not for `p`
  (its linear coefficient is `−p`), and `pX + X^p` is not one for `q = p²`: its reduction is
  `X^p`.
- `πX + X^q + X^(q+1)` is a Lubin–Tate series for no `π`: its reduction `X^q + X^(q+1)` is not
  `X^q`; it is also not a Lubin–Tate polynomial, being of degree `q + 1`.

*Needs:* Mathlib `PowerSeries.map`, `IsLocalRing.residue`, `Polynomial.Monic`.

### 1.2 Lubin–Tate interpolation

Let `f, g` be Lubin–Tate series for the same `π` and `q` the residue cardinality, and let
`a₁, …, a_n ∈ O`. Prove that there is a unique `H ∈ O[[X₁,…,X_n]]` with zero constant term and linear part
`Σ a_i X_i` satisfying `f(H(X₁,…,X_n)) = H(g(X₁),…,g(X_n))`, and that it is also the unique such series with coefficients
in the fraction field of `O`. The arity-one case is `existsUnique_lubinTate_intertwiner`: for every
`a ∈ O` there is a unique `φ ∈ O[[X]]` with zero constant term, linear coefficient `a` and
`f ∘ φ = φ ∘ g` (LT65, Lemma 1 and the remarks after it, pp.381–382). A proof route: solve degree by
degree; in degree `r ≥ 2` the error is divisible by `π`, because `f` and `g` reduce to the `q`-power
map and every residue `b` satisfies `b^q = b`, and it is corrected by dividing by `π − π^r`, which is
`π` times a unit. Uniqueness over the fraction field follows from `π − π^r ≠ 0`.

**Checks.**

- For `a = 1` and `f = g`, the unique solution is `φ = X`; for `a = 0` it is `φ = 0`.
- For odd `p`, `O = ℤ_p`, `f = (1 + X)^p − 1` and `g = pX + X^p`, the derivative-one
  intertwiner has `X²` coefficient `1/2 ∈ ℤ_p`, since `(p²−p)c = p(p−1)/2`; it is not `X`.
- At `p = 2`, both series are `2X + X²`, so the derivative-one intertwiner is `X`, with
  degree-two coefficient `0`.
- Over `O = W(𝔽_(p²))` the series `g = pX + X^p` has the coefficient shape of a Lubin–Tate series
  for `q = p`, but `p` is not the residue cardinality. For `a` the Teichmüller lift of
  `ā ∈ 𝔽_(p²) ∖ 𝔽_p` no `φ = aX + ⋯` with `g ∘ φ = φ ∘ g` exists: reducing gives
  `φ̄(X)^p = φ̄(X^p)`, whose `X^p` coefficients are `ā^p ≠ ā`. The cardinality hypothesis is
  essential.

*Needs:* §1.1.

### 1.3 The Lubin–Tate formal module

For a Lubin–Tate series `f`, interpolation with linear forms `X + Y` and `aX` gives a series
`F_f(X,Y)` and series `[a]_f`. Prove that `F_f` is a commutative formal group law over `O`, that
`a ↦ [a]_f` makes it a formal `O`-module (`FormalModule O F_f`, §0.1) with `[π]_f = f`, that its
special fibre has `O`-height one, and that `F_f` is the unique formal group law over `O` of which
`f` is an endomorphism, that is, the only `G` admitting a `TauCeti.FormalGroupHom G G` with series
`f` (`exists_formalModule_of_isLubinTateSeries`). Consequently a commutative formal group law over `O`
with an endomorphism that is a Lubin–Tate series is the Lubin–Tate module of that series in its own
coordinate (LT65, Theorem 1 and the paragraph following it, pp.382–383). A proof route: both sides
of associativity, commutativity, additivity and multiplicativity of the action solve the same
interpolation problem, so they agree by uniqueness.

API:

- `[π]_f = f`, `[1]_f = X` and `[0]_f = 0`, and the linear coefficient of `[a]_f` is `a`.
- The series `f` determines the law and the whole action.
- A commutative formal group law over `O` carrying an endomorphism with linear coefficient `π` and
  reduction `X^q` is equal to `F_f` for that endomorphism `f`.
- Transport along an isomorphism of the coefficient data commutes with the construction; base
  change along `O → R` maps the law and action, and the uniqueness applies whenever the image
  data again satisfy the hypotheses.
- The `O`-height of `F_f` is one; for `O = O_K` with `K/ℚ_p` finite its `p`-height is `[K:ℚ_p]`.

**Checks.**

- For `f = (1 + X)^p − 1` over `ℤ_p`, `F_f = X + Y + XY` is the multiplicative group.
- For `f = πX + X^q`, `[π]_f = πX + X^q`, not the scalar multiplication series `πX`.
- For `O = W(𝔽_(p²))` and `π = −p`, the module has `O`-height one and `ℤ_p`-height two.
- Over a discrete valuation ring `O` of characteristic zero the additive law `X + Y` admits no
  Lubin–Tate endomorphism: an endomorphism `φ` of the additive law satisfies
  `φ(X + Y) = φ(X) + φ(Y)`, which over a ring without additive torsion forces `φ` to be linear, so
  its reduction cannot be `X^q`.
- In equal characteristic the additive law is itself Lubin–Tate: over `O = 𝔽_q[[t]]` with `π = t`,
  `f = tX + X^q` is a Lubin–Tate series (constant term `0`, linear coefficient `t`, reduction
  `X^q`), and `f(X + Y) = f(X) + f(Y)` because `(X + Y)^q = X^q + Y^q` in characteristic `p`; so
  `F_f = X + Y` by uniqueness, with `[a]_f = aX` for `a ∈ 𝔽_q` and `[t]_f = f`. The claim that the
  additive law is never a Lubin–Tate module fails here: the preceding bullet needs characteristic
  zero.

*Needs:* §§1.1–1.2; §0.1; Tau Ceti `TauCeti.FormalGroupHom`.

### 1.4 Coordinate independence

For Lubin–Tate series `f, g` for the same `π`, the arity-one interpolation with `a = 1` gives a
strict `O`-linear isomorphism `[1]_(f,g) : F_g → F_f`. Prove that it is the unique strict
isomorphism commuting with the actions, that `[1]_(f,g) ∘ [1]_(g,h) = [1]_(f,h)`, that it commutes
with base change, and that it induces `O`-linear isomorphisms `F_g(I) ≅ F_f(I)` of the point modules
of §0.2, compatible with the coefficient maps and Galois actions there (LT65, Theorem 1, equations
(8)–(11), pp.382–383). Its consequences for torsion, Tate modules, division fields and characters
are stated with those objects in §§2.1–2.4, which use this section; nothing here depends on them.
Its reduction need not be the identity, so it is not a marked isomorphism in the sense of §3.1.

**Checks.**

- `[1]_(f,f) = X`.
- For `f = πX + X^q` and `g = πX + X^q + πX²`, write `[1]_(f,g) = X + cX² + ⋯`. Comparing `X²`
  coefficients of `f ∘ φ = φ ∘ g` gives `c(π − π²) = π`, so `c = (1 − π)⁻¹`: the comparison is
  strict, integral and not `X`.
- Interpolation with `a = u ∈ O^×` gives an isomorphism `[u]_(f,g) : F_g → F_f` with linear
  coefficient `u`; it is strict exactly when `u = 1`. Over `ℤ₂` with `f = g = 2X + X²`, `u = 1`
  gives `X`, of derivative `1`, and `u = 3` gives `(1 + X)³ − 1 = 3X + 3X² + X³`, of derivative
  `3 ≠ 1`, which commutes with `f` since both composites are `(1 + X)⁶ − 1`. The claim that every
  unit comparison is non-strict fails at `u = 1`.

*Needs:* §1.3; §0.2.

### Examples

Over `ℤ_p` with `π = p`, the series `(1 + X)^p − 1` gives `𝔾_m`, and every other Lubin–Tate series
for `p` gives a strictly isomorphic module. Over `W(𝔽_(p²))` with `π = −p`, `−pX + X^(p²)` gives the
height-one module used in the BKO layers.

### Dependencies

§0.1 (formal modules); §0.2 (point modules, for §1.4); Mathlib power-series substitution; Tau Ceti
`TauCeti.FormalGroupHom`.

## Layer 2: Torsion, Tate modules and the Artin comparison

Throughout this layer `K` is a nonarchimedean local field of either characteristic, `O = O_K`, and
Lubin–Tate series are taken for a uniformizer `π` and `q = #k_K`. Torsion is computed by Weierstrass
preparation; the Lubin–Tate character is compared with Tau Ceti's arithmetic Artin map, which is
defined in either characteristic. Only the comparisons with `p`-divisible groups (the `p`-power
levels in §2.1 and `BarsottiTate.tateModule` in §2.2) assume `K/ℚ_p` finite: in characteristic `p`
the element `p` is zero in `O_K`, so `[p] = 0`.

### 2.1 Finite-height torsion

Let `R` be a complete noetherian local `O_K`-algebra with residue field of characteristic `p`, and
`G` a formal `O_K`-module over `R` whose special fibre has finite `O_K`-height `h`. Put
`A_m = R[[X]]/([π^m]_G)`. Prove that for `m ≥ 1` the algebra `A_m` is free of rank `q^(hm)` over `R`
with basis `1, X, …, X^(q^(hm)−1)`. Define the torsion group scheme `G[π^m] = Spec A_m` over
`Spec R`, the ordinary spectrum, with the Hopf `R`-algebra structure on `A_m` given by the formal
law: comultiplication `X ↦ G(X ⊗ 1, 1 ⊗ X)`, counit `X ↦ 0`, antipode `X ↦ ι_G(X)` and action
`X ↦ [a]_G(X)` for `a ∈ O_K`. These series are evaluated in `A_m` and `A_m ⊗_R A_m`, which are
finite free over `R` and so `𝔪_R`-adically complete, at elements that are topologically nilpotent
because `X^(q^(hm)) ∈ 𝔪_R A_m`; the comultiplication is well defined because
`[π^m]_G(G(X, Y)) = G([π^m]_G(X), [π^m]_G(Y))` lies in the ideal generated by `[π^m]_G(X)` and
`[π^m]_G(Y)`, modulo which `R[[X, Y]]` is `A_m ⊗_R A_m`. Prove that `G[π^m]` is a finite locally
free commutative group scheme of rank `q^(hm)`, killed by `π^m` and so carrying an
`O_K/π^m`-action; that its formal completion along the special fibre, the formal spectrum of `A_m`
for the `𝔪_R`-adic topology, is the kernel of `[π^m]_G` on the formal Lie group `Spf R[[X]]`; that
`0 → G[π^m] → G[π^(m+n)] → G[π^n] → 0` (second map `[π^m]`) is exact; and, when `K/ℚ_p` is finite
with ramification index `e`, that the `p`-power levels `G[p^r] = G[π^(er)]` are the levels of the
connected `p`-divisible group attached to `G` by `BarsottiTate.equivFormalLieGroup`, of height
`h[K:ℚ_p]`. When `R = O_L` for a finite extension
`L/K`, prove that `φ ↦ φ(X)` identifies the `L̄`-points of the generic fibre `Spec(A_m ⊗_R L)`
with the `π^m`-torsion of the point module `G(𝔪_(L̄))` of §0.2, compatibly with the group laws and
the `O_K`-actions; these are the geometric points `G[π^m](L̄)` of §2.2 onward. Coefficient base
change and coordinate isomorphisms identify these group schemes; for Lubin–Tate modules the
comparison `[1]_(f,g)` of §1.4 identifies `F_g[π^m]` with `F_f[π^m]` and their geometric points
(VZ07, Definition 2.2 and the height discussion, pp.60–61; Y95, §3, p.295). A proof route: the
reduction of `[π^m]_G` has first nonzero term in degree `q^(hm)`, so Weierstrass preparation applies
and `PowerSeries.IsWeierstrassFactorizationAt.algEquivQuotient` gives the basis; Weierstrass
division in each variable identifies `R[[X, Y]]/([π^m]_G(X), [π^m]_G(Y))` with `A_m ⊗_R A_m`; and
the Hopf axioms are the associativity, unit, inverse, commutativity and action identities of `G`.

API:

- `A_m` with these structure maps is a finite free commutative and cocommutative Hopf `R`-algebra,
  so `G[π^m]` is an object of `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat` over `R` through
  `TauCeti.finiteLocallyFreeBicommutativeHopfAlgCatOpEquivFiniteLocallyFreeCommAffineGroupSchemeCat`.
- The inclusion `G[π^m] → G[π^(m+n)]` corresponds to the quotient map `A_(m+n) → A_m`, and
  `[π^m] : G[π^(m+n)] → G[π^n]` to `A_n → A_(m+n)`, `X ↦ [π^m]_G(X)`, which makes `A_(m+n)` free
  of rank `q^(hm)` over `A_n`.
- The `𝔪_R`-adic and `(𝔪_R, X)`-adic topologies on `A_m` coincide, since `X^(q^(hm)) ∈ 𝔪_R A_m`;
  the formal completion of `G[π^m]` along its special fibre is the closed formal subgroup of
  `Spf R[[X]]` cut out by `[π^m]_G`.
- For `R = O_L`, an `O_L`-algebra map `A_m → L̄` sends `X` to a zero of `[π^m]_G` in `𝔪_(L̄)`,
  and `φ ↦ φ(X)` is an `O_K`-linear bijection from `G[π^m](L̄)` onto the `π^m`-torsion of
  `G(𝔪_(L̄))`, equivariant for the absolute Galois group of `L`.
- A homomorphism `φ : G → G′` of formal `O_K`-modules over `R` induces `G[π^m] → G′[π^m]`, on
  algebras `X ↦ φ(X)`, compatibly with identities, composites and the maps above; base change
  along a local homomorphism of complete noetherian local rings commutes with the construction.

**Checks.**

- At `m = 0` the quotient is `R[[X]]/(X) = R`, and `G[π^0] = Spec R` is the trivial group of rank
  one, with formal completion `Spf R`.
- For the multiplicative module over `ℤ₃` and `m = 1`, `[3](X) = 3X + 3X² + X³`, and `T = 1 + X`
  gives `A_1 ≅ ℤ₃[T]/(T³ − 1)` with comultiplication `T ↦ T ⊗ T`, counit `T ↦ 1` and antipode
  `T ↦ T²`: `G[3] = μ₃`, of rank `3`, with special fibre `𝔽₃[X]/(X³)`. Its spectrum has the
  three primes `(T − 1)`, `(T² + T + 1)` and `(3, T − 1)`, and its geometric generic fibre the
  three points `X = 0, ζ₃ − 1, ζ₃² − 1`, the zeros of `[3]` in `𝔪_(ℚ̄₃)`. The formal spectrum of
  `A_1` for its `3`-adic topology has only the open prime `(3, T − 1)`: defining `G[π^m]` as the
  formal spectrum loses the generic fibre and the geometric points used in §§2.2 and 5.1.
- Over the square-zero base `R = 𝔽₃[ε]/(ε²)` the same module has `[3] = X³` and
  `A_1 = R[X]/(X³)`, of rank `3`; its `𝔪_R`-adic topology is discrete, so the spectrum and the
  formal spectrum agree. An artinian test base cannot separate the two constructions.
- For the multiplicative module over `ℤ_p` and `m = 1`, `ℤ_p[[X]]/((1+X)^p − 1)` is free of rank
  `p = q^(1·1)` with `h = 1`.
- For `O_K = W(𝔽_(p²))`, `π = −p` and the Lubin–Tate module, `G[π]` has rank `p²`, and the same
  group viewed as `ℤ_p`-module torsion has `p`-height `2`: the ranks are `q^(hm)` at `π`-level `m`
  and `p^(h[K:ℚ_p]r)` at `p`-level `r`.
- Over `R = O_K = 𝔽_q[[t]]` with `π = t`, the Lubin–Tate module of `tX + X^q` has
  `A_1 = R[[X]]/(tX + X^q)`, free with basis `1, X, …, X^(q−1)` of rank `q = q^(1·1)`, while
  `[p] = 0`, so `R[[X]]/([p])` is not finite: the `π`-power levels exist in either
  characteristic, and the `p`-power clause needs `K/ℚ_p` finite.
- For the additive module over `𝔽_p` (infinite height) `[π] = 0`, so `R[[X]]/([π])` is not finite:
  the finite-height hypothesis is needed.

*Needs:* §0.1; §0.2 for the geometric points; §1.4 for the Lubin–Tate comparison; Mathlib
`PowerSeries.exists_isWeierstrassFactorization`,
`PowerSeries.IsWeierstrassFactorizationAt.algEquivQuotient`; Tau Ceti
`TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat`,
`TauCeti.finiteLocallyFreeBicommutativeHopfAlgCatOpEquivFiniteLocallyFreeCommAffineGroupSchemeCat`;
FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1.12–R07.1.13 (the formal Lie group
`Spf R[[X]]`, `BarsottiTate.equivFormalLieGroup`); ModularCurves §0B (exactness of short sequences
of finite locally free commutative group schemes).

### 2.2 The π-adic Tate module

Let `L/K` be finite and `G` a formal `O_K`-module over `O_L` of `O_K`-height `h`. Define
`T_π G = lim_m G[π^m](L̄)` with transition maps `[π]`, where `G[π^m](L̄)` are the geometric points
of the generic fibre of `G[π^m] = Spec A_m` (§2.1), identified there with the `π^m`-torsion of the
point module `G(𝔪_(L̄))` of §0.2. Prove that `T_π G` is free of rank `h` over `O_K`, that
`T_π G/π^m T_π G ≅ G[π^m](L̄)`, that the absolute Galois group of `L` acts continuously and
`O_K`-linearly, that `(T_π G ⊗ K)/T_π G ≅ G[π^∞](L̄)`, and, when `K/ℚ_p` is finite, that the
underlying `ℤ_p`-module of `T_π G` is `BarsottiTate.tateModule` of the associated `p`-divisible
group, of rank `h[K:ℚ_p]` (Y95, §3, p.295; LT65, Theorem 2 and the discussion before it,
pp.383–384). A proof route: the generic fibres of the levels are étale in either characteristic,
because invariance of Tau Ceti's `FormalGroup.invariantDifferential` under the endomorphism `[π]_G`
gives `[π]_G′ = π·unit` in `O_L[[X]]`, nonzero at every point of `𝔪_(L̄)`; `[π]` is surjective
on geometric points, so the elementary divisor theorem gives `G[π^m](L̄) ≅ (O_K/π^m)^h`; compatible
bases lift along the surjective transitions, and for `K/ℚ_p` finite `p = π^e·unit` compares the
cofinal systems.

API:

- An element is a compatible sequence with `[π]t_(m+1) = t_m`; projections commute with these
  transitions.
- Projection to level `m` induces the `O_K`-linear isomorphism
  `T_π G/π^m T_π G ≅ G[π^m](L̄)`, compatible with level reduction.
- The coordinatewise absolute Galois action is continuous and `O_K`-linear.
- The rational quotient `(T_π G ⊗ K)/T_π G` identifies with the divisible geometric torsion,
  compatibly with scalar multiplication and Galois action.
- For `K/ℚ_p` finite, cofinality of the `π`-power and `p`-power levels identifies the underlying
  `ℤ_p`-module with `BarsottiTate.tateModule`, of rank `h[K:ℚ_p]`.
- An isomorphism of formal `O_K`-modules over `O_L` induces, through the point modules of §0.2, an
  `O_K`-linear Galois-equivariant isomorphism of Tate modules compatible with the projections; for
  Lubin–Tate modules this applies to the coordinate comparison `[1]_(f,g)` of §1.4.

**Checks.**

- For the multiplicative module over `ℤ_p`, `T_p G = ℤ_p(1)` with the cyclotomic action;
  its level-`m` quotient is `ℤ/p^m` with that action, and its rational quotient is
  `(ℚ_p/ℤ_p)(1)`, which is divisible torsion.
- For a Lubin–Tate module over `O_K`, `T_π G` has `O_K`-rank one, and `ℤ_p`-rank `[K:ℚ_p]` when
  `K/ℚ_p` is finite. Over `K = 𝔽_q((t))` it is free of rank one over `𝔽_q[[t]]` and killed by `p`,
  so it is no `ℤ_p`-lattice and the `BarsottiTate.tateModule` comparison has no meaning there.
- The direct limit `G[π^∞](L̄)` is divisible torsion and not free; a definition by direct limit
  fails the freeness statement.

*Needs:* §§2.1, 0.2; §1.4 for the Lubin–Tate comparison; FiniteFlatGroupsAndIntegralPadicHodgeTheory
§R07.1.8 (`BarsottiTate.tateModule`).

### 2.3 Lubin–Tate division fields

Let `f` be a Lubin–Tate series over `O_K` and `m ≥ 1`. Identify its division fields and scalar
Galois action with the tower of RelativeFarguesFontaine §2.5, through the same-parameter coordinate
comparison of §1.4. Prove the primitive-coordinate refinement: the points of `F_f[π^m](K̄)` not
killed by `π^(m−1)` are exactly the generators of the free rank-one `O_K/π^m`-module
`F_f[π^m](K̄)`; that for any such `t`, `K(t) = K(F_f[π^m])` is totally ramified of degree
`(q − 1)q^(m−1)` with uniformizer `t`. Under this identification the supplied scalar-action Galois isomorphism
acts by `σ(t) = [a]_f(t)`, and compatible primitive generators satisfy `[π]_f t_(m+1) = t_m`. For a
Lubin–Tate polynomial `f` the torsion `F_f[π^m](K̄)` is the set of roots of `f^{∘m}` in `K̄`, and the
degree and splitting statements are `finrank_adjoin_primitive_lubinTate_root`: if `t ∈ K̄` is a root
of `f^{∘m}` but not of `f^{∘(m−1)}`, then `[K(t):K] = (q − 1)q^(m−1)` and every root of `f^{∘m}`
lies in `K(t)` (LT65, Theorem 2 and its proof, pp.383–384). A proof route: for `πX + X^q` the root
`t₁` satisfies the Eisenstein polynomial `X^(q−1) + π`, so it is a uniformizer of `K(t₁)`; given a
uniformizer `t_m`, the polynomial `X^q + πX − t_m` is Eisenstein over `O_(K(t_m))` and a root
`t_(m+1)` is again a uniformizer with `[π]_f t_(m+1) = t_m`; the torsion action embeds the Galois
group in `(O_K/π^m)^×`, agreeing with the supplied scalar action; other `f` follow by §1.4.

**Checks.**

- For `m = 1` the degree is `q − 1`; for `K = ℚ_2`, `π = 2`, `f = 2X + X²`, the root `t = −2` lies in
  `ℚ_2`, matching `q − 1 = 1`, and at `m = 2` the roots of `f(X) = −2` satisfy the Eisenstein
  polynomial `X² + 2X + 2`, of degree `2 = (2 − 1)·2`.
- In equal characteristic, for `K = 𝔽_q((t))`, `π = t` and `f = tX + X^q`, the nonzero roots of `f`
  satisfy the Eisenstein polynomial `X^(q−1) + t`, so the first division field has degree
  `q − 1 = (q − 1)q⁰` with a root as uniformizer; the roots are simple although `p = 0`, because
  `f′ = t ≠ 0`.
- For `K = ℚ_p`, `π = p`, `f = (1 + X)^p − 1`, the roots of `f^{∘m}` are `ζ − 1` for `ζ^(p^m) = 1`,
  and the division field is `ℚ_p(ζ_(p^m))` of degree `(p − 1)p^(m−1)`.
- At `K = ℚ₃`, the supplied fields and the primitive cyclotomic presentation both give
  degrees `2` and `6` at levels `1` and `2`; a unit `a` acts by `ζ ↦ ζ^a` in both.
- The index `m` counts `π`-torsion levels: the BKO field `Φ_n` of Layer 8 is the division field at
  `m = n + 1`, so `[Φ₀:Φ] = p² − 1`, not `1`.
- A root of `f^{∘m}` that is also a root of `f^{∘(m−1)}` generates a smaller field: `t = 0`
  generates `K`.

*Needs:* §§1.3, 1.4, 2.2; Mathlib `IntermediateField.adjoin`, `AlgebraicClosure`;
LocalFieldsRamification Layer 0; RelativeFarguesFontaine §2.5.

### 2.4 The Lubin–Tate character

The Galois action on the rank-one `O_K`-module `T_π F_f` defines a continuous character
`χ_π : G_K → O_K^×` with `σ(t) = [χ_π(σ)]_f(t)` for every torsion point `t`. Identify it with
the scalar character of RelativeFarguesFontaine §2.5 on the same tower
`K_π = ⋃_m K(F_f[π^m])`. Prove that this comparison agrees at every finite level and that the
Tate-module construction does not depend on the choice of basis of `T_π F_f` or of the Lubin–Tate series for `π`
(through §1.4); and that its kernel is the subgroup fixing all torsion, whose fixed field is `K_π`
inside the chosen separable closure (LT65, Theorem 2, pp.383–384).

API:

- Two Galois elements have equal character values exactly when they act equally on every finite
  torsion level.
- For every `m` and every `t ∈ F_f[π^m](K̄)`, `σ(t) = [χ_π(σ)]_f(t)`.
- The comparison `[1]_(f,g)` of §1.4 intertwines the characters of `F_f` and `F_g`.
- Over a finite extension `L/K`, the character of the base-changed module is the restriction of
  `χ_π` to `G_L`.
- `Gal(K_π/K) ≅ O_K^×` as topological groups.
- Every coordinate isomorphism over `O_K` commuting with the actions gives the same character.

**Checks.**

- For `K = ℚ_p`, `π = p` and `f = (1 + X)^p − 1`, `χ_π` is the `p`-adic cyclotomic character.
- Modulo `π` the image is all of `k_K^×`, of order `q − 1`.
- Replacing a basis `v` of `T_π F_f` by `[u]v` with `u ∈ O_K^×` changes no character value.
- After adjoining `F_f[π^m]` the restricted image is `U(K,m)`, equal to `1 + π^m O_K` for
  `m ≥ 1`; at `m = 0` the field is `K` and the image is `O_K^×`.

*Needs:* §§2.2, 2.3, 1.4; RelativeFarguesFontaine §2.5.

### 2.5 Comparison with local reciprocity

Let `Art_K = TauCeti.ClassFieldTheory.artinMap K` be the arithmetic local Artin map. Prove that for
`x = π^r u` with `u ∈ O_K^×`, every lift `σ ∈ G_K` of `Art_K(x)` satisfies `χ_π(σ|_(K_π)) = u⁻¹`,
that is, `σ(t) = [u⁻¹]_f(t)` for every torsion point `t`; in particular `Art_K(π)` fixes `K_π`.
For a Lubin–Tate polynomial `f` this explicit reciprocity law is
`artinMap_apply_lubinTate_root`, stated without evaluating power series on `K̄`: let
`φ = [u⁻¹]_f` (zero constant term, linear coefficient `u⁻¹`, `f ∘ φ = φ ∘ f`, unique by §1.2), and
let `P ∈ O_K[X]` be congruent to `φ` modulo `f^{∘m}` in `O_K[[X]]` (such `P` exist by Weierstrass
division by `f^{∘m}`, which is monic with non-leading coefficients in `𝔪_K`); then every lift of
`Art_K(ϖ^r u)`, with `ϖ ∈ Kˣ` equal to `π`, sends each root `t` of `f^{∘m}` to `P(t)`. Since
`t ∈ 𝔪_(K(t))` and evaluation at `t` is a continuous ring map `O_K[[X]] → O_(K(t))` killing
`f^{∘m}`, `P(t)` is the value `[u⁻¹]_f(t)`. Consequently, for every `m ≥ 0` the norm group of
`K(F_f[π^m])/K` is `π^ℤ · U(K,m)`. For a Lubin–Tate polynomial `f` this norm-group statement is
`artinMap_fixes_lubinTate_roots_iff`: for `ϖ ∈ Kˣ` equal to `π` and `x ∈ Kˣ`, every lift of
`Art_K(x)` fixes every root of `f^{∘m}` if and only if `x ∈ ⟨ϖ⟩ · TauCeti.unitFiltration K m`
(LT65, §2, Theorem 3, its corollary and proof, pp.385–387). This compares the Lubin–Tate tower with
the existing reciprocity map and constructs no second one. A proof route: `π` is a norm from every
`K(t_m)` by the Eisenstein calculation of §2.3; the norm subgroups of Tau Ceti
(`TauCeti.ClassFieldTheory.exists_artinMap_mem_iff`) and the degree `(q − 1)q^(m−1)` identify the
norm group with `π^ℤ U(K,m)`; Lubin–Tate's uniformizer-comparison argument (LT65, Lemma 2) over the
completed maximal unramified extension `K̂^ur` (RamificationOfCompleteDiscretelyValuedFields
§4a.3), together with the unramified normalization of `Art_K`, gives the inverse unit; continuity
and density of `Kˣ` pass to the limit. The argument uses §1.2 directly and does not use §2.6.

**Checks.**

- For `K = ℚ_p`, `π = p` and `f = (1 + X)^p − 1`, the statement is the local Kronecker–Weber
  description: `ℚ_p(ζ_(p^m))` has norm group `p^ℤ · U(ℚ_p,m)`, with
  `U(ℚ_p,m) = 1 + p^m ℤ_p` for `m ≥ 1`, and `χ_cyc(Art(u)) = u⁻¹`, the
  normalization of ClassFieldTheory Conventions C.6, already proved in Tau Ceti as
  `TauCeti.ClassFieldTheory.localCyclotomicCharacter_artinMap_padic`. Here `[a]_f = (1 + X)^a − 1`,
  and for `b ∈ ℕ` with `b ≡ u⁻¹ mod p^m` the polynomial `P = (1 + X)^b − 1` is congruent to
  `[u⁻¹]_f` modulo `f^{∘m} = (1 + X)^(p^m) − 1`, so the explicit law sends `ζ − 1` to `ζ^b − 1`.
- Over `ℚ₂` with `f = (1 + X)² − 1`, `m = 4` and `x = −3`: `(−3)⁻¹ ≡ 5 mod 16`, so a lift of
  `Art(−3)` sends `ζ₁₆ − 1` to `ζ₁₆⁵ − 1`; the geometric normalization would give `ζ₁₆¹³ − 1`
  (Tau Ceti's `TauCeti.ClassFieldTheory.localArtinMap_Q2_neg_three`).
- The remainder must be taken modulo `f^{∘m}`, not by truncation: over `ℚ₂` with
  `f = 2X + X²`, `m = 1` and `u = 3`, `[1/3]_f = (1 + X)^(1/3) − 1 = X/3 − X²/9 + ⋯`, whose
  truncation `X/3` takes the value `−2/3` at the root `t = −2`, whereas `P = X` is congruent to it
  modulo `f` and gives `−2 = σ(t)`, as it must since `t ∈ ℚ₂`.
- At `m = 0` the right side is `π^ℤ × O_K^× = Kˣ` and the left side holds for every `x`, since the
  only root of `X` is `0`.
- With geometric normalization the unit formula would read `u` instead of `u⁻¹`; the norm-group
  statement is the same for both normalizations, so the unit formula is the discriminating test.
- `x = π²` fixes every Lubin–Tate tower for `π`, while for `π′ = uπ` with `u ≢ 1 mod π` the element
  `π` does not fix `K(F_(f′)[π′])` for a Lubin–Tate series `f′` for `π′`.

*Needs:* §§2.3, 2.4, 1.2; Tau Ceti `TauCeti.ClassFieldTheory.artinMap`,
`TauCeti.ClassFieldTheory.artinMap_restrict`, `TauCeti.ClassFieldTheory.exists_artinMap_mem_iff`,
`TauCeti.unitFiltration`; Mathlib Weierstrass division (for the existence of `P`) and
`PowerSeries.eval₂Hom` (for the value `[u⁻¹]_f(t)`); ClassFieldTheory Layers 6–8 and Conventions
C.6; LocalFieldsRamification Layers 1–2; RamificationOfCompleteDiscretelyValuedFields §4a.3.

### 2.6 Change of uniformizer

Let `π′ = uπ` with `u ∈ O_K^×`. Prove that Lubin–Tate modules for `π` and `π′` become isomorphic
over the completion `K̂^ur` of the maximal unramified extension of `K`
(RamificationOfCompleteDiscretelyValuedFields §4a.3), by an isomorphism `θ` defined over the
integers of `K̂^ur` with `θ^(Frob) = θ ∘ [u]` (Frobenius acting on coefficients), and that
`χ_(π′) = χ_π · η_u`, where `η_u` is the unramified character sending arithmetic Frobenius to
`u`. The isomorphism need not descend
to `O_K`. The two towers coincide for `u = 1` and are different fields for `u ≠ 1` (LT65, §2, Lemma 2, Theorem 3 and its corollary,
pp.385–387). A proof route: solve the Frobenius-semilinear coefficient equations of Lemma 2; then
`χ_π(Art(u)) = u⁻¹`, `χ_π(Art(π)) = 1`, and `χ_(π′)(Art(π′)) = 1` determine the twist on inertia
and on a Frobenius lift.

**Checks.**

- For `u = 1`, `π′ = π`, `η_u = 1` and the two towers coincide; for the same series, take
  `θ = id`.
- For `u ≠ 1`, `Art_K(π)` fixes `K_π` but has character value `u` on `K_(π′)`, so the towers
  differ, including when `u ≡ 1 mod π`.
- For `u = −1` the twist `η_(−1)` sends Frobenius to `−1`.
- Evaluating at `Art(π′) = Art(u)Art(π)`: `χ_π(Art(π′)) = u⁻¹` and `η_u(Art(π′)) = u`, so
  `χ_(π′)(Art(π′)) = 1`, as §2.5 requires for `π′`.
- On units `v`, both `χ_π(Art(v))` and `χ_(π′)(Art(v))` equal `v⁻¹`, so `η_u` is trivial on
  inertia; twisting by `η_u⁻¹` instead would give `χ_(π′)(Art(π′)) = u⁻²`.

*Needs:* §§1.4, 2.5; LocalFieldsRamification Layers 0 and 2;
RamificationOfCompleteDiscretelyValuedFields §4a.3.

### Examples

For `K = ℚ_p` and `π = p` this layer recovers the cyclotomic tower and the cyclotomic character.
For `K = W(𝔽_(p²))[1/p]` and `π = −p`, the first division field has degree `p² − 1` and Galois group
`𝔽_(p²)^×`; the tower `K_π` has Galois group `O_K^×`.

### Dependencies

Layers 0–1; Mathlib Weierstrass preparation, `IntermediateField.adjoin` and `AlgebraicClosure`;
Tau Ceti's finite locally free commutative affine group schemes, local Artin map, its cyclotomic
normalization and unit filtration; ClassFieldTheory Layers 6–8;
LocalFieldsRamification Layers 0–2; RamificationOfCompleteDiscretelyValuedFields §4a.3;
FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1.8, R07.1.12–R07.1.13; ModularCurves §0B;
RelativeFarguesFontaine §2.5.

## Layer 3: Marked deformations at finite height

Fix a nonarchimedean local field `K` of either characteristic, a field `k` over `k_K`, a formal
`O_K`-module `G₀` over `k` of finite height `h ≥ 1`, and a complete noetherian local `O_K`-algebra
`B` with residue field identified with `k` (the setting of VZ07, §1, p.58: a complete discretely
valued field with finite residue field). This layer proves lifting, rigidity, the
action-sensitive lifting torsor and the `(h−1)`-dimensional tangent computation, and constructs the
universal deformation over arbitrary specified `B`, with ring `B[[t₁,…,t_(h−1)]]`; for `K/ℚ_p`
finite it identifies it with the supplied universal deformation functors. The residue field is not
assumed algebraically closed or perfect. For `O_K = ℤ_p`, perfect `k` and `B = W(k)` the result is
the universal Lubin–Tate deformation ring of BordismFormalGroups §F5. The elliptic comparison of
§3.7 has `O_K = ℤ_p`.

### 3.1 Marked deformations

For a local artinian `B`-algebra `R` with residue field identified with `k`, define a deformation
of `G₀` over `R` as a formal `O_K`-module `G` over `R` together with an `O_K`-linear isomorphism
`ι : G ⊗_R k ≃ G₀`. A morphism of deformations is an isomorphism of formal `O_K`-modules over `R`
whose reduction is compatible with the two markings. Extend to complete noetherian local
`B`-algebras through compatible systems over the artinian quotients (LT66, §2, pp.51–52, and
Theorem 3.1, pp.56–57; Y95, §2, pp.294–295).

API:

- A law, an action and a special-fibre isomorphism determine a deformation; deformations are equal
  when law, action and marking agree.
- Local `B`-algebra maps induce base change of law and marking, compatible with identities and
  composites.
- The automorphism group of `G₀` acts on deformations by composing the marking, coherently.
- An integral coordinate isomorphism transports a deformation and its marking by its actual
  reduction.
- Over a complete base, deformations are equivalent to compatible systems over `R/𝔪_R^n`.

**Checks.**

- At height one the universal deformation has no parameters: every deformation over `R` is
  uniquely isomorphic to the base change of the one over `B`.
- Over `𝔽_p`, the multiplicative formal `ℤ_p`-module with the identity marking and the strict
  residual automorphism `[1 + p] = X + X^p + X^(p+1)` over `𝔽_p` has derivative `1` but is
  not the identity, so it is strict and does not preserve the identity marking. Its integral lift
  `(1+X)^(1+p)−1` over `ℤ_p` has derivative `1+p`, so is not strict; at `p = 2` it is
  `3X + 3X² + X³`, with reduction `X + X² + X³`.
- For `k = 𝔽_(p²)`, a marking is an isomorphism defined over `𝔽_(p²)`; two lifts that become
  isomorphic only over `𝔽̄_p` are different objects of the functor over `B = W(𝔽_(p²))`.
- For `B = ℤ₃`, `F = ℚ₃(π)`, `π² = 3`, and `R = O_F/(π²)`, restriction to `O_F`-algebras
  commutes with coefficient base change: continuous local maps from `B[[t]]` over `B`, and from
  `O_F[[t]]` over `O_F`, both have the three possible images `t ∈ 𝔪_R = {0,π,2π}`. This is
  the height-two `ℤ₃`-module problem. Requiring the height-one `O_F`-action instead gives one
  marked deformation class, with no parameter.

*Needs:* §0.1; Tau Ceti `TauCeti.FormalGroupIso`, `TauCeti.FormalGroupHom.map`,
`FormalGroup.exists_iso_lifting_coordinate`.

### 3.2 The coefficient algebra of formal O-modules

Construct the graded `O_K`-algebra `Λ_O` representing formal `O_K`-module laws with fixed tangent
action in a coordinate: the quotient of the polynomial algebra on the coefficients of the law and
of all action series by the formal identities. Prove that `Λ_O` is a polynomial algebra over `O_K`
on one generator in each positive degree (grading by coefficient degree minus one), and that in
degree `q^j − 1` a generator can be chosen as the coefficient of `X^(q^j)` in `[π]`. Consequently
every formal `O_K`-module over `k` lifts to `B` (VZ07, Theorem 1.4 and proof, pp.58–59). This is
the `O_K`-analogue of Tau Ceti's Lazard ring `TauCeti.LazardRing`; it differs by the action series
and by the distinguished `q`-power degrees. Prove also that over the fraction field `K` every
formal `O_K`-module whose structure map is the inclusion has a unique strict isomorphism, its
logarithm, onto the additive law with `[a] = aX` (VZ07, Lemma 1.3, p.58): over a `ℚ`-algebra this is
Tau Ceti's `FormalGroup.log`, and in either characteristic its degree-`n` coefficient is solved
from an `a ∈ O_K` with `a^n ≠ a`. A proof route: compute the homogeneous relation module in each
degree from symmetric cocycles, separating `q`-power degrees from others by the factors `a^n − a`,
and use that logarithm, which identifies `Λ_O ⊗ K` with a polynomial algebra on one generator in
each degree, to exclude torsion.

API:

- `O_K`-algebra maps `Λ_O → R` correspond to formal `O_K`-module laws over `R` in a coordinate,
  naturally in `R`.
- The universal law and action evaluate to the given coefficients; two maps agreeing on the
  universal coefficients are equal.
- In degree `q^j − 1` the `X^(q^j)`-coefficient of `[π]` generates the indecomposables.

**Checks.**

- The `XY` coefficient of the law has degree one.
- The `X^q` coefficient of `[π]` has degree `q − 1`.
- A residual law over `k` lifts to `B` by lifting the images of the polynomial generators, without
  assuming `k` algebraically closed.
- Different coordinate laws can give the same deformation class, so `Λ_O` is not the deformation
  ring of §3.6.
- Over `K = 𝔽_q((t))` the Lubin–Tate module of `tX + X^q` has the additive law, yet its logarithm
  is `Σ_(i≥0) c_i X^(q^i)` with `c_0 = 1` and `c_i = c_(i−1)/(t − t^(q^i))`, from comparing
  `X^(q^i)` coefficients of `ℓ(tX + X^q) = tℓ(X)`: it depends on the action and not only on the
  law, and `c_1 = 1/(t − t^q)` is not integral.

*Needs:* §0.1; Tau Ceti `TauCeti.LazardRing`, `TauCeti.LazardRing.mvPolynomialEquiv`,
`TauCeti.existsUnique_eq_smul_lazardCocycle`, `FormalGroup.log` (over a `ℚ`-algebra).

### 3.3 Deformation cocycles

For a small extension `R′ → R` of local artinian `B`-algebras with kernel `I` annihilated by
`𝔪_(R′)`, define the `k`-vector space of cocycles of `G₀` with values in `I`: pairs consisting of a
symmetric correction `Δ(X,Y)` of the law and corrections `δ_a(X)` of every action series that
satisfy the linearized associativity, additivity and multiplicativity identities and leave every
linear coefficient fixed. A coordinate correction `ψ(X)` with zero constant term induces a
coboundary; its linear coefficient need not vanish. Define `H²_O(G₀; I)` as cocycles modulo
coboundaries (VZ07, §3, equations (3.1)–(3.7), p.62; LT66, §2, Proposition 2.4, Remark 2.5 and
Proposition 2.6, pp.52–55).

API:

- Cocycles form a `k`-vector space; two cocycles with equal `Δ` and equal `δ_a` are equal.
- A coordinate correction induces the coupled law and action correction.
- A `k`-linear map `I → J` transports cocycles and coboundaries.
- Extracting `δ_π` detects the class through its low `q`-power coefficients.
- A change of residual coordinate transports the quotient isomorphically.

**Checks.**

- `I = 0` gives the zero space.
- The correction `ψ = iX` with `i ∈ I` is a coboundary: a marked infinitesimal coordinate change can
  have linear coefficient `1 + i`, and excluding it would make `H²_O` too large.
- A correction to the linear coefficient of `[a]` is rejected, since the tangent action is fixed.
- A correction `Δ` solving the linearized associativity alone need not extend to an action
  correction compatible with `[π]`: for ramified `O_K`, a bare formal-group cocycle does not give a
  formal-module cocycle.

*Needs:* §3.1.

### 3.4 Lifting and rigidity

Prove that for every small extension `R′ → R`, every deformation over `R` lifts to `R′`; that, once a
lift is fixed, isomorphism classes of lifts form a torsor under `H²_O(G₀; ker(R′ → R))`; and
rigidity: a homomorphism `α` of formal `O_K`-modules between two lifts over `R′` whose reduction to
`R` is zero is zero, since `α ∘ [π] = [π] ∘ α` vanishes (the coefficients of `α` lie in the kernel,
which `𝔪_(R′)` kills) while `[π]` is nonzero modulo `𝔪_(R′)` because `h` is finite (VZ07, Lemma 2.6,
p.61). Hence a marked comparison is unique. For `K/ℚ_p` finite
rigidity also follows from `TauCeti.FormalGroupHom.eq_of_map_residue_eq` and
`TauCeti.FormalGroupIso.eq_of_map_residue_eq` on the underlying commutative formal groups, of
residual `p`-height `h[K:ℚ_p]`; in characteristic `p` they do not apply, since `[p] = 0`. Pass the
lifting and torsor assertions to complete noetherian local bases by inverse limits (VZ07,
Proposition 3.2 and Lemma 3.3, pp.62–63; LT66, Proposition 2.4 and its proof, pp.52–54). A proof
route: lifts exist by §3.2; two lifts differ by a cocycle and are isomorphic exactly when it is a
coboundary; rigidity makes a marked comparison unique and the action on lifting classes free.

**Checks.**

- The zero homomorphism is determined by its reduction (it is the only lift of `0`).
- Over `R′ = k[ε]/(ε²) → k`, the lifts of `G₀` form a torsor under `H²_O(G₀; k)`, cocycles modulo
  coboundaries, not under all cocycles: for the multiplicative module with law
  `F = X + Y + XY` over `k = 𝔽_p` and `c ∈ 𝔽_p^×`, transporting the constant lift by the marked
  coordinate change `X ↦ (1 + εc)X` changes the law by `εc(F − X∂_X F − Y∂_Y F) = −εcXY ≠ 0`,
  giving `X + Y + (1 − εc)XY`, a nonzero coboundary between isomorphic lifts. The dimension of
  this space is computed in §3.5.
- At infinite height rigidity fails: over `k[ε]/(ε²)` the additive formal `O_K`-module with
  `[a] = āX` has the endomorphism `εX^q` (it commutes with `[a]` because `ā^q = ā`), whose
  reduction is zero.

*Needs:* §§3.2, 3.3; for `K/ℚ_p` finite, the alternative rigidity route through Tau Ceti
`TauCeti.FormalGroupHom.eq_of_map_residue_eq`, `TauCeti.FormalGroupIso.eq_of_map_residue_eq`.

### 3.5 Finite-height tangent space

Prove that `H²_O(G₀; k)` has dimension `h − 1` over `k`; after a normalization of the reduced
`[π]`, the coefficients of `X^(q^i)` in `δ_π`, `1 ≤ i < h`, form a basis of its dual (VZ07,
Corollary 3.4, Lemma 3.5 and Proposition 3.6, pp.63–65; LT66, Proposition 2.6, pp.54–55). The
statement is over `k` itself. A proof route: normalize over a separable extension degree by degree
and compute on finite jets, where a class is a coboundary exactly when the remaining `δ_π` is a
series in `X^(q^h)`; descend the finite-dimensional linear equations to `k` jet by jet, using the
stabilization of their images (Mittag-Leffler) and rigidity for uniqueness, without interchanging
infinite products with field extensions.

**Checks.**

- At `h = 1` the dimension is `0`, not `1`.
- For the elliptic case `O_K = ℤ_p`, `h = 2`, the dimension is `1`, matching the one-parameter
  base of ModularCurves §7D.
- For `O_K = W(𝔽_(p²))` and the restriction to `ℤ_p` of a Lubin–Tate module (height two over
  `ℤ_p`), the `ℤ_p`-deformation space has dimension one while the `O_K`-deformation space has
  dimension zero.

*Needs:* §§3.4, 3.2.

### 3.6 The universal finite-height deformation

Prove that the marked deformation functor of §3.1 is represented on complete noetherian local
`B`-algebras by `B[[t₁,…,t_(h−1)]]` with a universal deformation: pullback gives a bijection, natural
in the base, between continuous local `B`-algebra maps and isomorphism classes of deformations,
and the marked comparison of each pullback is unique. Residue-field and coefficient extensions
induce specified comparison maps; the coordinates `t_i` are not canonical (LT66, Theorem 3.1 and
proof, pp.56–57, Proposition 3.3, pp.57–58; VZ07, Theorem 3.8 and proof, p.65; Y95, §2,
pp.294–295). For `K/ℚ_p` finite, prove that this functor extends the marked functors of
EndoscopicTransferAndUnitaryTraceComparison §§10.2, 12.3 to the coefficient bases of §3.1. A proof
route: choose a lift over `B` and `h − 1` tangent directions from §3.5, build a family over the
truncations, and induct on artinian length using §§3.4–3.5. For the comparison, at `B = O_r` for the
residual modules of the supplier, identify both functors and universal families by the identity
on laws, strict actions and markings; do the same at its algebraically closed residue base.

**Checks.**

- At height one the representing ring is `B`.
- At height two there is exactly one parameter.
- At the finite-residue base `B = O_r`, heights `1` and `2` give `O_r` and `O_r[[T]]` in both
  interfaces; a pullback is compared by the same marked isomorphism, not by an unmarked change
  of coordinate.
- For `O_K = ℤ_p`, `k` perfect and `B = W(k)` the representing ring is that of BordismFormalGroups
  §F5; for `k = 𝔽_p(t)` (imperfect) the theorem still applies with any specified `B`, and no Cohen
  ring is chosen.
- In equal characteristic, for `O_K = 𝔽_q[[t]]`, `k = 𝔽_q`, `B = O_K` and the additive module with
  `[t] = X^q` (height one, the reduction of the Lubin–Tate module of `tX + X^q`), the representing
  ring is `B`, although `[p] = 0` and the finite-`p`-height rigidity of Tau Ceti does not apply.

*Needs:* §§3.1, 3.4, 3.5; for the comparison (`K/ℚ_p` finite),
EndoscopicTransferAndUnitaryTraceComparison §§10.2, 12.3.

### 3.7 Elliptic deformation comparison

For a supersingular elliptic curve `E₀` over an algebraically closed field `k` of characteristic `p`,
prove that formal completion at the zero section identifies the marked deformation functor of `E₀`
(ModularCurves §7D) with that of its connected height-two `p`-divisible group (ModularCurves §7F,
ST-1 and ST-2) and with the deformation functor of §3.1 for `O_K = ℤ_p`, `G₀ = Ê₀` and `B = W(k)`;
the representing rings `W(k)[[T]]` and `W(k)[[t₁]]` are isomorphic through this functor isomorphism.
Formal logarithms and completed endomorphisms commute with completion; a formal `O`-action on a
lift is not asserted to come from a global endomorphism (LT66, §3.5, pp.58–59). A proof route:
compose ModularCurves §§7C, 7F with `BarsottiTate.equivFormalLieGroup`, keeping the markings.

**Checks.**

- Both functors have one parameter, by §3.5 and ModularCurves §7D.
-  An `O_F`-action on the formal group of a lift `E` (for instance the lift whose formal group is,
  through §§3.6–3.7, the restriction to `ℤ_p` of a Lubin–Tate `O_F`-module of §1.3 for quadratic
  `F/ℚ_p`) extends to `E` only through elements of the global endomorphism ring of `E₀`
  (Serre–Tate), and that ring can meet `O_F` in `ℤ` alone: formal complex multiplication does not
  imply complex multiplication.
- The comparison identifies the parameters through the functor isomorphism, not by name: a
  coordinate change `t ↦ ut + ⋯` on one side is matched by the induced change on the other.

*Needs:* §§3.1, 3.6, 2.1; ModularCurves §§7C, 7D, 7E, 7F;
FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.13; EllipticCurves Layer 1.

### Examples

For `G₀` the reduction of a Lubin–Tate module (height one) the deformation ring is `B`; for the
formal group of a supersingular elliptic curve over `𝔽̄_p` with `O_K = ℤ_p` it is `W(𝔽̄_p)[[t]]`;
for the restriction to `ℤ_p` of a height-one `W(𝔽_(p²))`-module it is `W(𝔽_(p²))[[t]]` over `ℤ_p`
but `W(𝔽_(p²))` as an `O_K`-module problem.

### Dependencies

§§0.1, 2.1; BordismFormalGroups §F5; ModularCurves §§7C–7F;
FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.13; EllipticCurves Layer 1;
EndoscopicTransferAndUnitaryTraceComparison §§10.2, 12.3; Tau Ceti's Lazard ring, symmetric cocycle
lemma, coordinate lifting and finite-height rigidity.

## Layer 4: Honda theory and the elliptic comparisons

Honda's theory describes formal groups by the functional equation of their logarithm. The
Frobenius lift in the type operator is data, never suppressed notation. Over the unramified ring
`W(𝔽_(p²))` it identifies the explicit logarithm of the Lubin–Tate module for `±p`, and with the
recognition statement of §1.3 it shows that the formal group of a supersingular elliptic curve with
scalar Frobenius is a Lubin–Tate module. These results hold for every prime `p`.

### 4.1 Honda type operators

Let `O` be a discrete valuation ring of characteristic zero, complete or not, with fraction field
`K`, uniformizer `π` and residue characteristic `p`, let `q = p^r` with `r ≥ 1`, and let `σ` be an
endomorphism of `K` preserving `O` and inducing the `q`-power map on the residue field (Honda's
condition (F), with a positive power of `p`; `q` need not be the residue cardinality, and
completeness is not assumed: H70, §2, p.220). In the skew power-series ring `O_σ[[T]]` with
`Ta = σ(a)T`, call `u = π + Σ_(i≥1) c_i T^i` special. For `ℓ ∈ X·K[[X]]` put
`(u ⋆ ℓ)(X) = π ℓ(X) + Σ_(i≥1) c_i ℓ^(σ^i)(X^(q^i))`, where `ℓ^(σ^i)` applies `σ^i` to the
coefficients; `ℓ` is of type `u` when `u ⋆ ℓ ∈ π O[[X]]` (H70, §2, condition (F), special elements
and type, pp.220–223). Because `q ≥ 2` and `ℓ` has no constant term, the `i`-th term has order at
least `q^i`, so only the terms with `q^i ≤ n` contribute to the coefficient of `X^n`; this is where
`r ≥ 1` is used (H70, §2, p.221, the well-definedness remark after the definition of `u ⋆ f`).

API:

- For `q ≥ 2`, the coefficient of `X^n` in `u ⋆ ℓ` is the finite sum over `i` with `q^i ≤ n` of
  semilinearly twisted `q`-power terms.
- Two special elements with equal coefficients define the same operator and type predicate.
- Composition of operators realizes multiplication in `O_σ[[T]]`.
- A coefficient map intertwining the Frobenius lifts preserves types.
- `ℓ` has type `u` exactly when every coefficient of `u ⋆ ℓ` lies in `πO`.

**Checks.**

- Over `W(𝔽_(p²))` with `σ` the Frobenius lift and `q = p`, `σ² = 1`, so `T²` raises exponents to the
  `p²` power and acts trivially on coefficients.
- For `a` not fixed by `σ`, `T ⋆ (aX) = σ(a)X^q`, not `aX^q`.
- For `ℓ = Σ_(j≥0) (−p)^(−j) X^(p^(2j))` over `W(𝔽_(p²))`, `(p + T²) ⋆ ℓ = pX`: the coefficient of
  `X^(p^(2j))`, `j ≥ 1`, is `p(−p)^(−j) + (−p)^(−j+1) = 0`. Hence `ℓ` has type `p + T²`, and not type
  `p − T²`, for which the same coefficient is `2p(−p)^(−j)`, equal to `2/p ∉ pO` at `j = 2` for every
  prime `p`.
- A series with nonzero constant term is excluded: the infinite sum `Σ c_i ℓ^(σ^i)(X^(q^i))` would
  not be locally finite.
- The exponent `r = 0` is excluded: over `O = ℤ₂` with `π = 2`, `σ = id`, `q = 1`, `ℓ = X` and
  `u = 2 + Σ_(i≥1) T^i`, every term would contribute to the coefficient of `X`, giving
  `2 + 1 + 1 + ⋯`, which does not converge in `ℚ₂`. With `q = 2` (and still `σ = id`, which
  induces the squaring map on `𝔽₂`) the same `u` gives `u ⋆ X = 2X + X² + X⁴ + X⁸ + ⋯`, with
  coefficient `2` in degree one, `1` in each degree `2^i` and one contribution to each.

*Needs:* §0.1; Tau Ceti `FormalGroup.log` (logarithm over `ℚ`-algebras).

### 4.2 Honda's functional-equation integrality

Under (F) with `q = p^r`, `r ≥ 1`, as in §4.1, prove: a normalized logarithm `ℓ` of special type `u`
defines an integral commutative formal group law `ℓ⁻¹(ℓ(X) + ℓ(Y))`; two normalized logarithms of
the same type have integral strict comparison `ℓ₂⁻¹ ∘ ℓ₁`; for source type `u`, target type `v` and
`C ∈ O`, the series `ℓ_v⁻¹(C·ℓ_u)` is integral exactly when `vC = tu` for some `t ∈ O_σ[[T]]`. For
`O` the integers of an unramified extension of `ℚ_p`, finite or infinite, `π = p`, `q = p` and `σ`
the Frobenius lift (condition (F1)), prove the converse: every formal group law over `O` has a type,
and strict isomorphism classes correspond to left-associate classes of special elements. When `O` is
moreover complete, prove that a law of height `h` has a type `p + Σ_(ν=1)^h b_ν T^ν` with `b_h` a
unit and `b_1, …, b_(h−1) ∈ pO`, and that two such normal forms give strictly isomorphic laws only
when they coincide (H70, Lemmas 2.3–2.4 and Theorems 2–3, pp.222–225, and Proposition 3.3 and
Theorem 4, pp.226–228, none of which assumes completeness; Lemma 3.4 and Proposition 3.5,
pp.228–230, which do). The converse is not used over ramified coefficient rings (§7.5 shows why).

**Checks.**

- For the multiplicative group over `ℤ_p`, `ℓ = log(1 + X)` has type `p − T`:
  `p·log(1+X) − log(1+X^p) ∈ pℤ_p[[X]]`.
- The rational series `X + X²/p` is a logarithm over `ℚ_p` but of no special type over `ℤ_p`, and
  `ℓ⁻¹(ℓ(X) + ℓ(Y))` has nonintegral `XY` coefficient `−2/p` for odd `p`. At `p = 2` this
  coefficient is the integral `−1`, but the `X²Y²` coefficient is `−5/2 ∉ ℤ₂`; a rational
  logarithm alone does not give integrality.
- With `u = v` and `C = 1` the criterion holds with `t = 1`, giving the identity comparison.
- Over the integers of `ℚ_p^ur`, which are not complete, the multiplicative group still has type
  `p − T` and every law has a type; the normal form `p + Σ b_ν T^ν` is asserted only over the
  complete ring `W(𝔽̄_p)`, where its construction is a `p`-adic limit.

*Needs:* §4.1; Tau Ceti `FormalGroup.log`, `FormalGroup.exp`, `TauCeti.FormalGroupHom`,
`TauCeti.FormalGroupIso.IsStrict` (homomorphisms, strict isomorphisms).

### 4.3 The unramified Honda–Lubin–Tate comparison

Let `p` be prime, `O = W(𝔽_(p²))`, `q = p²` and `s ∈ {1, −1}`. Let `G` be a commutative formal group
law over `O` whose reduction satisfies `[sp]_Ḡ = X^q`, that is, its `q`-power Frobenius is `[sp]`.
Prove: (i) `[sp]_G` is a Lubin–Tate series for `sp`, so `G` carries a unique formal `O`-module
structure with `[sp] = [sp]_G`, and it is the Lubin–Tate module of §1.3 for `sp`; (ii) the
logarithm of `G` has type `p − sT²` for the Frobenius lift with `q = p`; (iii) `G` is strictly
isomorphic over `O` to the formal group with logarithm `ℓ_s = Σ_(j≥0) (sp)^(−j) X^(q^j)`, which is
itself a Lubin–Tate module for `sp` (H70, Lemma 4.2, p.231, Lemma 2.4, p.222, and Theorem 3,
p.225, Proposition 3.3, pp.226–228; H68, Theorem 2, pp.204–205). Part (i) follows from §1.3, since
`[sp]_G` has linear coefficient `sp` and reduction `X^q`. For (ii), Honda's Lemma 4.2 applied to
`[sp]_G ≡ X^q mod p` gives `sp·ℓ_G − ℓ_G(X^q) ∈ pO[[X]]`, which is type `p − sT²` because `σ² = 1`
and `s² = 1`; `ℓ_s` has the same type, and §4.2 gives (iii). The strict isomorphism of (iii) need
not reduce to the identity, so it is not a marked isomorphism.

BKO21, Lemma 5.1(ii), p.956, pairs `a_(p²) = 2sp` with type `p + sT²` and parameter `−sp`; the
correct pairing is type `p − sT²` and parameter `sp`, since the parameter of a Lubin–Tate module
reduces to the `q`-power Frobenius. The two readings differ for both signs. BKO21's local
construction (§5.0.1, p.955) takes `a_p = 0`, so `a_(p²) = a_p² − 2p = −2p` and `s = −1`, and uses
the Lubin–Tate module of parameter `−p`: that is the correct pair, type `p + T²` and parameter
`−p`, as in H68, Corollary 4, p.212, whereas the printed lemma would give parameter `p` there.

**Checks.**

- For `s = −1` the type is `p + T²` and the parameter is `−p`; `ℓ_(−1) = Σ (−p)^(−j) X^(p^(2j))`
  satisfies `(p + T²) ⋆ ℓ_(−1) = pX` (§4.1).
- For `s = 1`, `ℓ₁ = Σ p^(−j) X^(p^(2j))` satisfies `p·ℓ₁ − ℓ₁(X^(p²)) = pX`, type `p − T²`.
- The sign is detected by `[sp]`: for `s = 1` (`a_(p²) = 2p`) the `p²`-Frobenius of the reduction
  is `[p]`, so `[p]_G` reduces to `X^(p²)` and `pX + X^(p²)` is a Lubin–Tate series for `p` and not
  for `−p` (its linear coefficient is `p`, §1.1); the printed pair for `s = 1`, type `p + T²` with
  parameter `−p`, therefore fails. The Honda model has logarithm `ℓ₁` of type `p − T²`; the
  given law is strictly isomorphic to that model.
- For `f = 2X + X⁴`, the normalized logarithm of `F_f` has `X⁴` coefficient
  `1/(2−2⁴) = −1/14`, whereas the Honda logarithm `ℓ₁` has coefficient `1/2`. The strict
  comparison from `F_f` to the Honda model has coefficient `−1/14−1/2 = −4/7` in degree four,
  so it is integral and nonidentity; equality of normalized logarithms is not asserted.

*Needs:* §§4.2, 1.3, 0.1; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.1 (`frobeniusHom`)
and §R07.2.8 (`dieudonneEquivalenceFinite`) for the Dieudonné reading of scalar Frobenius.

### 4.4 The supersingular elliptic comparison

Let `p` be prime, `O = W(𝔽_(p²))` and `W` a Weierstrass curve over `O` with `Δ` a unit. If the
reduction `W̄` over `𝔽_(p²)` has `#W̄(𝔽_(p²)) = p² + 1 − 2sp` with `s ∈ {1, −1}`, prove that the
`p²`-power Frobenius of `W̄` equals `[sp]`, that the multiplication series
`FormalGroup.zsmulSeries` of `WeierstrassCurve.formalGroup W` at `sp` is a Lubin–Tate series for
`sp`, and that the elliptic formal group law carries a formal `O`-module structure (§0.1) whose
action of `sp` is that series (`isLubinTateSeries_zsmulSeries_formalGroup`); by §1.3 the elliptic
formal group is the Lubin–Tate `O`-module for `sp` in the parameter `z = −x/y`, and the
`O`-structure is unique. In particular, for `E` over `ℤ_p` with good
reduction and `a_p(E) = 0`, `a_(p²) = a_p² − 2p = −2p`, so the formal group of `E ⊗ O` is a
Lubin–Tate module for `−p`. The comparison identifies logarithms (normalized by the invariant
differential), torsion and `π`-adic Tate modules; the passage to `p`-adic Tate generators, with
its signs, is built on this comparison in §8.5 (H70, Theorem 9 and its
proof, pp.240–241, which treats curves over `ℚ` by Lemma 4.2; H68, Corollary 4, p.212; BKO21, Lemma
5.1 and its application, pp.955–957). A proof route: the characteristic polynomial
`T² − a_q T + q = (T − sp)²` of EllipticCurves Layer 3 gives `(Frob_q − [sp])² = 0`, and the
endomorphism ring of `W̄` has no nonzero nilpotents by positivity of the degree, so
`Frob_q = [sp]`; its action on the parameter `z` is `z ↦ z^q`. No global complex multiplication of
`E` is inferred.

**Checks.**

- For `p = 2` and `y² + y = x³` over `ℤ_2` (`Δ = −27`, a unit), `#E(𝔽₂) = 3` so `a₂ = 0`, and
  `#E(𝔽₄) = 9 = 4 + 1 + 4`, so `s = −1`: the formal group over `W(𝔽₄)` is Lubin–Tate for `−2`.
- `s = 1` corresponds to `#W̄(𝔽_(p²)) = (p − 1)²` and parameter `p`; both values `±2p` are the
  extremes of the Hasse bound `|a_q| ≤ 2p`.
- For `E` over `𝔽_p` with `a_p = 0`, the `p`-power Frobenius satisfies `Frob_p² = −p` but is not a
  scalar; equality of traces does not give scalar Frobenius at level `p`, and the comparison is made
  over `𝔽_(p²)`.
- An ordinary reduction (`p ∤ a_q`) has `[p]_Ē` of height one, so no endomorphism of `Ê` reduces to
  `X^(p²)` with linear coefficient `±p`.

*Needs:* §§4.3, 1.3, 0.1; Tau Ceti `WeierstrassCurve.formalGroup`, `WeierstrassCurve.isComm_formalGroup`,
`WeierstrassCurve.map_formalGroup`, `FormalGroup.zsmulSeries`;
Mathlib `WittVector`, `GaloisField`, `WeierstrassCurve.map`, `WeierstrassCurve.Affine.Point`;
EllipticCurves Layers 1 and 3; ModularCurves §§7C, 7E.

### Examples

Over `W(𝔽_(p²))` choose the Honda model of the Lubin–Tate module for `−p`, with logarithm
`Σ (−p)^(−j) X^(p^(2j))` and type
`p + T²`; the formal group of an elliptic curve over `ℤ_p` with `a_p = 0`, base changed to
`W(𝔽_(p²))`, is strictly isomorphic to it.

### Dependencies

§§0.1, 1.3; EllipticCurves Layers 1 and 3; ModularCurves §§7C, 7E;
FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1.1, R07.2.8; Tau Ceti's elliptic formal group,
its multiplication series `FormalGroup.zsmulSeries`, logarithm, homomorphisms and strict
isomorphisms; Mathlib `WittVector`, `GaloisField` and Weierstrass curves.

## Layer 5: Lattice kernels and integral quotient isogenies

Let `F₀/ℚ_p` be finite with integers `O₀`, uniformizer `ϖ₀` and residue cardinality `q₀`, and let `G`
be a formal `O₀`-module of finite height over the integers `R` of a finite extension `K` of `F₀`,
with `K̄` a fixed algebraic closure of `K`, `T = T_(ϖ₀) G` and `V = T ⊗ F₀` (§2.2). An embedded
lattice above `T` is a finite subgroup of torsion; this layer builds the integral quotient of `G`
by it as a formal `O₀`-module with an explicit coordinate, its Frobenius-twisted marking, its
homomorphisms and its descent.

### 5.1 Tate lattices and finite kernels

Define an `O₀`-lattice in `V` as a finitely generated `O₀`-submodule spanning `V`. For `L ⊃ T` put
`C_L = L/T ⊂ V/T ≅ G[ϖ₀^∞](K̄)`. Prove that `L ↦ C_L` is a bijection between lattices containing `T`
and finite `O₀`-stable subgroups of geometric torsion, that a Galois element preserves `C_L`
setwise exactly when it preserves `L`, and that over the integers `R′` of any finite extension over
which `C_L` is setwise Galois stable, the schematic closure of the generic-fibre subgroup with
geometric points `C_L` in the base change to `R′` of the torsion level `G[ϖ₀^m] = Spec A_m` of §2.1,
for any `m` with `ϖ₀^m L ⊂ T`, is a finite flat `O₀`-stable subgroup scheme, independent of `m`
(Y95, §3, pp.295–296; G86, §5, p.324). The closure is `schematicClosure_flat` of
FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.20.

API:

- Lattices are equal when their subsets of `V` agree.
- For `T ⊂ L`, `L/T` gives the closed finite flat subgroup.
- An isomorphism of Tate modules transports lattices and kernels, compatibly with composites.
- Lattices above `T` correspond to finite `O₀`-stable geometric torsion subgroups.
- The setwise stabilizer of `C_L` in the Galois group equals that of `L`.

**Checks.**

- `L = T` gives the zero kernel.
- `L = ϖ₀^(−m) T` gives the whole `ϖ₀^m`-torsion.
- In rank two, an index-`q₀` lattice gives a line in `G[ϖ₀]`, of order `q₀`, not all of `G[ϖ₀]`, of
  order `q₀²`.
- A Galois element acting on a torsion line by a nontrivial residue scalar preserves the line
  setwise while moving its nonzero points: setwise stability is weaker than rationality of points.

*Needs:* §§2.1, 2.2; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.20
(`schematicClosure_flat`); ModularCurves §§0B, 0C.

### 5.2 Integral lattice quotients

For `L ⊃ T` and `R` the integers of a finite extension over which `C_L` is setwise stable, construct
a formal `O₀`-module `G_L` over `R` and an isogeny `g_L : G → G_L` of formal `O₀`-modules with kernel
exactly the finite flat subgroup of §5.1. Over a splitting extension, `g_L` is the normalized Serre
product `g_L(X) = Π_(c ∈ C_L) (X −_G c)`, a power series; if `#C_L = q₀^N` then `g_L` reduces to
`X^(q₀^N)` and `G_L` reduces to the `q₀^N`-Frobenius twist of the special fibre of `G`, which is its
marking (Y95, §3, pp.295–296; G86, §5, pp.324–325). The underlying `p`-divisible group of `G_L` is
`BarsottiTate.quotientFiniteFlatSubgroup` of FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.20a;
this target adds the formal `O₀`-module structure, the integral coordinate `g_L` and the marking. A
proof route: the factors are integral, so the product is integral and Galois invariant; Weierstrass
preparation of `g_L(X) − Z` over `R[[Z]]` gives a basis `1, X, …, X^(d−1)`, `d = #C_L`, over
`R[[g_L]]`, and a series invariant under translation by `C_L` has vanishing positive-degree
coefficients, by comparing values at the `d` distinct roots of the generic fibre; the invariant
series `g_L(G(X,Y))` and `g_L([a](X))` then factor through `g_L`, defining the quotient law and
action.

API:

- A homomorphism of formal `O₀`-modules killing `C_L` factors uniquely through `g_L`; factorizations
  are equal when their composites with `g_L` are.
- `L ⊂ M` induces `G_L → G_M`, and nested quotients agree with the canonical comparison.
- Coefficient extension commutes with the quotient and its marking.
- Transporting `G` and `L` by an isomorphism gives an isomorphic quotient; the Serre product
  coordinate changes by an integral coordinate isomorphism of the target.

**Checks.**

- For `L = T` the product is `X` and `G_L = G`.
- For `L = ϖ₀^(−m) T` the quotient is isomorphic to `G` through `[ϖ₀^m]`, and its marking is the
  `q₀^(hm)`-Frobenius twist recorded by the reduction of `[ϖ₀^m]`.
- A kernel of order `q₀^N` gives the twist `G₀^(q₀^N)`, which over a non-closed residue field is not
  identified with `G₀` without a comparison.
- For the multiplicative group, `X −_G c = (X − c)/(1 + c)`, so the Serre product
  `Π (X − c)/(1 + c)` differs from the monic product `Π (X − c)` by a unit.

*Needs:* §5.1; §0.2; Mathlib `PowerSeries.exists_isWeierstrassFactorization`,
`PowerSeries.IsWeierstrassFactorizationAt.algEquivQuotient`; FiniteFlatGroupsAndIntegralPadicHodgeTheory
§R07.1.20a; ModularCurves §0C.

### 5.3 Homomorphisms in the lattice isogeny class

For lattice quotients `G_(L₁)`, `G_(L₂)` of a fixed `G`, prove that conjugation by the `g_L`
identifies `Hom(G_(L₁), G_(L₂))` with `{a ∈ End(G) ⊗ F₀ : aL₁ ⊂ L₂}`, compatibly with composition,
scalars and coefficient extension; isomorphisms correspond to `aL₁ = L₂`, and `End(G_L)` is the
multiplier ring of `L` (Y95, §3, p.296). This concerns the known isogeny class; no full faithfulness
of Tate modules is used. A proof route: a homomorphism conjugates to a rational endomorphism
carrying `L₁` into `L₂`; conversely, clearing a denominator `b`, the lattice inclusion makes the
integral map kill the kernel needed for the factorization of §5.2.

**Checks.**

- The zero map corresponds to `a = 0`.
- For `L₁ = L₂ = T`, the statement is `End(G) = {a : aT ⊂ T}`.
- For `L₂ = ϖ₀^(−1) L₁`, multiplication by `ϖ₀^(−1)` is an isomorphism `G_(L₁) ≅ G_(L₂)`, inverse to
  the comparison induced by `[ϖ₀]`.

*Needs:* §5.2; §2.2.

### 5.4 Descent of lattice quotients

For `G` defined over the integers of `K` and a lattice `L ⊃ T`, prove that the normalized product
`g_L` and the quotient `G_L` descend to the integers of the fixed field of the setwise stabilizer of
`C_L`, equivalently of `L`; and that for a Lubin–Tate module with CM by `O_F`, a lift of
`Art_F(a)`, with `a = π_F^r u` and `u ∈ O_F^×`, carries the actual embedded lattice `L` to
`u⁻¹L` (Y95, §4, p.296, unit action; G86, §5, pp.324–325). The induced action on
`π_F^ℤ`-classes of marked quotients, which needs the Frobenius-twist comparisons of §6.2, and
the fields of moduli of the marked quotient are stated in §6.6.

**Checks.**

- Setwise stability controls descent: for unramified quadratic `F/F₀`, where `ϖ₀` is also a
  uniformizer of `F`, at level one `H[ϖ₀] = H[π_F] ≅ k_F` is a plane over `k_(F₀)`, on which
  `Gal(F(H[π_F])/F) ≅ k_F^×` acts by multiplication (§§2.3–2.4). The setwise stabilizer of a `k_(F₀)`-line, a cyclic kernel of order
  `q₀`, is `k_(F₀)^×`, so the kernel and its quotient descend to the fixed field, of degree
  `(q₀² − 1)/(q₀ − 1) = q₀ + 1` over `F`, while the nonzero points of the kernel generate the
  whole division field, of degree `q_F − 1 = q₀² − 1`. The two degrees differ once `q₀ ≥ 3`; at
  `q₀ = 2` a line has a single nonzero point and both degrees are `3`.
- For `a ∈ O_F^×` with `aL = L` the Galois action fixes the quotient.
- For `a = π_F` and `L = T`, `χ(Art_F(π_F)) = 1` and the actual image is `T`, not `π_F⁻¹T`:
  `π_F⁻¹T/T` has `#k_F` elements, so `π_F⁻¹T` is a different embedded lattice.
- For units `u`, the inverse in `u⁻¹L` comes from `χ(Art_F(u)) = u⁻¹` (§2.5); the geometric
  normalization would give `uL`. The two differ: for unramified quadratic `F/F₀`, a basis `t` of
  `T = O_F t` and `L = ϖ₀^(−1)O₀ t + T`, `uL = L` exactly when `u ∈ O₀^×(1 + ϖ₀O_F)`, a subgroup of
  index `q₀ + 1` in `O_F^×` with cyclic quotient `k_F^×/k_(F₀)^×`; for `u` of order `q₀ + 1 ≥ 3`
  modulo it, `u²L ≠ L`, so `u⁻¹L ≠ uL`. Fields of definition, which depend only on the setwise
  stabilizer, do not distinguish the two normalizations.

*Needs:* §§5.1, 5.2, 2.5.

### 5.5 Elliptic quotient comparison

Let `E` be an elliptic curve over `R` whose formal completion at the zero section, in a parameter
`X` (ModularCurves §7C), is the formal group underlying the formal `O₀`-module `G`. For
`O₀ = ℤ_p` this is every elliptic curve over `R`: the completion carries exactly one formal
`ℤ_p`-module structure, `[a]` being the limit of `[n]` over integers `n → a`. For `O₀ ≠ ℤ_p` the
`O₀`-action on the completion is part of the data, and a curve whose completion carries none is
excluded. Let `H ⊂ E` be a finite locally free subgroup scheme whose special fibre is supported at
the zero section; its order is then a power `p^m`, which kills `H`. Being finite and local over the
complete ring `R`, `H` lies in the formal neighbourhood of the zero section: it is
`Spec(R[[X]]/J)` for an ideal `J ⊃ ([p^m]_G)`, a closed finite flat subgroup scheme of the torsion
level `G[p^m] = Spec(R[[X]]/([p^m]_G))` of §2.1. When its geometric points form an
`O₀`-stable subgroup `C_L = H(K̄)` of `G[ϖ₀^∞](K̄)`, as always when `O₀ = ℤ_p`, `H` is the finite
flat subgroup of §5.1 attached to `C_L`, being flat and closed with that generic fibre. Prove that
the completion of the elliptic quotient `E/H` of ModularCurves §2B is canonically isomorphic, as
a formal group, to the formal group underlying `G_L`, and that the completed elliptic isogeny and
`g_L` differ by this integral target coordinate; the `O₀`-action on the completion of `E/H` is the
one transported from `G_L` by this isomorphism (for `O₀ = ℤ_p`, its unique `ℤ_p`-action). The
induced maps on torsion, Tate modules and logarithms agree (BKO21, §5, pp.957–959, for the use of
this transport).

**Checks.**

- For the zero subgroup both sides are the identity.
- For `H = G[p]`, the connected part of `E[p]` (all of `E[p]` when the reduction is
  supersingular), the lattice is `L = p⁻¹T` and both sides are `[p]` up to the target coordinate;
  for ordinary reduction `E[p]` itself is not supported at the zero section and is excluded.
- For the supersingular curve of §4.4 with `G` its height-one formal `W(𝔽_(p²))`-module,
  `E[p] = G[p]` has geometric points `O₀/p ≅ 𝔽_(p²)`; a subgroup scheme `H` of order `p` has an
  `𝔽_p`-line as geometric points, which is not `O₀`-stable, so it corresponds to no `O₀`-lattice:
  it is a lattice kernel only for `G` restricted to `ℤ_p`.
- An ordinary curve is excluded for `O₀ = W(𝔽_(p²))`: its completion has `p`-height one, while a
  formal `W(𝔽_(p²))`-module of `O₀`-height `h` has `p`-height `2h`, so the completion carries no
  `O₀`-action and `[ϖ₀]`, `G[ϖ₀^∞]` and `G_L` are not defined for it; for `O₀ = ℤ_p` the same
  curve is admitted, with `G[p^∞]` its connected part.
- A subgroup not supported at the zero section of the special fibre (an étale subgroup of an
  ordinary curve) is not a subgroup of the formal group, and the comparison does not apply.

*Needs:* §§2.1, 5.1, 5.2; §3.7; ModularCurves §§0B, 2B, 7C, 7E (PD-2, for the connected part);
EllipticCurves Layer 1.

### Examples

For a Lubin–Tate `O_F`-module `H` restricted to `O₀`, the lattices `ϖ₀^(−s)O₀t + T` give the
quasi-canonical quotients of Layer 6; for the multiplicative group over `ℤ_p` the lattice
`p⁻¹ℤ_p(1)` gives the quotient by `μ_p`, isomorphic to `𝔾̂_m` through `[p]`.

### Dependencies

§§0.2, 2.1, 2.2, 2.5, 3.7; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1.20–R07.1.20a;
ModularCurves §§0B, 0C, 2B, 7C, 7E; EllipticCurves Layer 1; Mathlib Weierstrass preparation.

## Layer 6: Canonical and quasi-canonical lifts

Let `F/F₀` be a finite extension of finite extensions of `ℚ_p`, with integers `O_F`, uniformizer
`π_F` and residue field `k_F`. This layer constructs finite-residue lattice models and their
descent and compares their quadratic strict-base extensions with the lifts of
GrossZagierAndArithmeticHeights §7.2. It proves the higher-degree lattice classification and
identifies finite-residue fields of moduli by local class field theory.

### 6.1 The canonical lift

Let `H` be the Lubin–Tate `O_F`-module of `[π_F] = π_F X + X^(#k_F)`, restricted to `O₀ = O_(F₀)`.
Prove that this finite-residue model has `O₀`-height `[F:F₀]` and CM by `O_F`, and that over a
complete noetherian local `O_F`-algebra with specified residue embedding it is the unique marked lift of its
special fibre with this tangent `O_F`-action. In the quadratic case identify its extension to the
completed strict base, with its marking, with the canonical lift of
GrossZagierAndArithmeticHeights §7.2
(G86, §2, Proposition 2.1, p.322; Y95, §4, pp.296–297). A proof route: the `O_F`-module deformation
problem has height one, so §3.6 gives no parameters.

API:

- The action of `O_F` has linear coefficient the given embedding.
- Two marked height-one `O_F`-lifts over the same coefficient ring are uniquely isomorphic.
- The lift and its `O_F`-action commute with coefficient extension.
- Transport by a residual `O_F`-linear isomorphism records the new marking.
- `T_(π_F) H` is free of rank one over `O_F` and of rank `[F:F₀]` over `O₀`.

**Checks.**

- A quadratic `F/F₀` gives `O₀`-height two.
- The endomorphism ring of `H` over `O_F` is `O_F` (level zero).
- Changing the residual CM embedding by the nontrivial automorphism of a quadratic `F` changes the
  marked problem: the conjugate lift is not isomorphic to `H` compatibly with both the marking and
  the given embedding.
- `H` and its marking are defined over `O_F` with residue field `k_F`, before any completion of the
  maximal unramified extension.

*Needs:* §§1.3, 3.6, 2.2; GrossZagierAndArithmeticHeights §7.2 for the quadratic comparison.

### 6.2 Frobenius-marked quasi-canonical lifts

For an `O₀`-lattice `L` in `V = T ⊗ F₀ ≅ F` containing `T`, define `H_L` as the lattice quotient of
§5.2, with its marking to the `q₀^N`-Frobenius twist of the special fibre when `[L:T] = q₀^N`. Extend
to all lattices by multiplying by a power of `π_F` and comparing markings through
`[π_F] ≡ X^(#k_F)`; the invariant is the `π_F^ℤ`-class of `L` with its Frobenius-twist component.
Its endomorphism order is `O_L = {a ∈ F : aL ⊂ L}` (Y95, §4, pp.296–298; G86, §5, pp.324–325).
The quadratic levels and their comparison with the supplied strict-base lifts are stated in §6.5,
with the quadratic orders of §6.4.

API:

- The quotient carries the rational CM action of `F` and the Frobenius marking.
- `O_L` embeds in `End(H_L)` with tangent the embedding of `F`, and equals it.
- `π_F`-homothetic lattices give coherently identified marked quotients in their twist components.
- Coefficient extension preserves the quotient, marking and order.
- Changing the coordinate of `H` transports the lattice and marking and gives the same moduli point.
- The same lattice class in the same twist component gives the same marked deformation class.

**Checks.**

- `L = T` gives the canonical lift.
- Multiplication by `π_F` shifts the Frobenius exponent by the residue degree `[k_F : k_(F₀)]`.
- A unit `a ∈ O_F^×` with `aL ≠ L` gives an isomorphic underlying quotient but a different marked
  deformation.

*Needs:* §§6.1, 5.2, 5.3.

### 6.3 Marked and unmarked classification

Prove that unmarked isomorphism classes of the `H_L` correspond to `F^×`-homothety classes of
lattices, equivalently to `O_F^×`-orbits of `π_F^ℤ`-classes; that within a common twist component two
marked lifts are isomorphic exactly when their `π_F^ℤ`-classes agree; and that the unmarked class is
determined by the order `O_L` together with the isomorphism class of `L` as `O_L`-module (Y95, §4,
Propositions 1–2 and proofs, p.297; corollary, p.298). A proof route: by §5.3 an isomorphism is
multiplication by some `a ∈ F^×`; its reduction is `[a]` on the marked fibre, which is the identity
only for `a = 1`, since the residual `O_F`-action is faithful.

**Checks.**

- For `L₁ = T` and `L₂ = uT`, `u ∈ O_F^×`, the classes coincide (`uT = T`).
- For `L₂ = aL₁` with `a ∉ π_F^ℤ O_(L₁)^×`, the unmarked lifts are isomorphic and the marked ones are
  not.
- Equality of orders alone does not classify lattices outside the quadratic case: for cubic `F/F₀`
  the order `O = O₀ + ϖ₀O_F` is not Gorenstein (`O_F/ϖ₀O_F` has length `3 ≠ 2·1`), so its trace dual
  `O^∨` has multiplier order `O` without being free over `O` (Y95, Proposition 4). The quadratic
  case, where every proper lattice is free, is proved separately in §6.5 and is not used here.

*Needs:* §§6.2, 5.3, 3.4.

### 6.4 Quadratic orders

For quadratic `F/F₀` and `s ≥ 0` define `O_s = O₀ + ϖ₀^s O_F`. Prove that every `O₀`-order in `O_F` is
exactly one `O_s`, that the conductor of `O_s` is `ϖ₀^s O_F`, and that for `s ≥ 1`,
`O_s^× = O₀^×(1 + ϖ₀^s O_F)` (G86, §5, p.325: the two cases, `O_F` or some `O_s` with `s ≥ 1`, for
an order containing `O₀`, before Proposition 5.3, and Proposition 5.3(2) for
`O_F^×/O_s^× ≅ (O_F/ϖ₀^s O_F)^×/(O₀/ϖ₀^s O₀)^×`). A proof route: with an integral basis `1, α` of
`O_F`, an order containing `O₀` is `O₀ + ϖ₀^s O₀α`.

API:

- `x ∈ O_s` exactly when `x = a + ϖ₀^s b` with `a ∈ O₀`, `b ∈ O_F`.
- `O_s = O_t` exactly when `s = t`.
- `O₀`-orders in `O_F` correspond to natural numbers `s`.
- For `s ≥ 1` the unit group is `O₀^×(1 + ϖ₀^s O_F)`.
- An `F₀`-isomorphism of quadratic fields transports every `O_s`.

**Checks.**

- `O_0 = O_F` with conductor `O_F`.
- `O_1` is a proper suborder for every quadratic `F/F₀`.
- If `F/F₀` is ramified, `ϖ₀^s O_F` has `π_F`-valuation `2s`, not `s`.
- At `s = 0` the formula `O₀^×(1 + O_F)` is wrong: `1 + O_F` contains `0`.

*Needs:* LocalFieldsRamification Layer 0.

### 6.5 Quadratic level classification

For quadratic `F/F₀`, write `T = O_F t` with `t` a basis of the Tate module of §6.1, and for
`s ≥ 0` put `L_s = ϖ₀^(−s) O₀ t + T = ϖ₀^(−s) O_s t`, with `O_s` of §6.4. It contains `T`, with
`L_s/T ≅ O₀/ϖ₀^s O₀` cyclic of order `q₀^s`, and its multiplier order is `O_s`; so the
quasi-canonical lift `H_(L_s)` of level `s`, the lattice quotient of §6.2, has endomorphism order
`O_s` and is marked to the `q₀^s`-Frobenius twist of the special fibre (G86, §5, Proposition 5.3,
p.325). Prove that the completed strict-base extension of `H_(L_s)`, with this marking, and the
base change of the degree-`q₀^s` quotient isogeny `g_(L_s) : H → H_(L_s)` of §5.2 identify with a
marked level-`s` lift of GrossZagierAndArithmeticHeights §7.2 and its canonical-to-quasi-canonical
isogeny; the comparison is the unique one preserving the special-fibre marking (Y95, §4,
pp.296–298; G86, §5, pp.324–325). Prove the lattice-algebra assertion that every proper
`O_s`-lattice in `F` is free of rank one over `O_s` (Y95, §5, Proposition 4, p.300). Use these to
identify the finite-residue marked lattice classes of §6.3 in each twist component with the
supplied `O_F^×/O_s^×`-orbit of GrossZagierAndArithmeticHeights §7.2 after completed strict base
change. Prove that this map is equivariant and bijective and that it identifies the unmarked level
class and the multiplier order. A proof route: by §6.1 the base change of `H` is the supplied
canonical lift with its marking; the lattice quotient, its marking and its order commute with
coefficient extension (§§5.2, 6.2), so the base change of `H_(L_s)` is the quotient of the supplied
canonical lift by a cyclic `O₀`-stable kernel of order `q₀^s` whose stabilizer in `O_F` is `O_s`,
and the rigidity of §3.4 makes a marking-preserving comparison unique. Quadratic orders are
Gorenstein and Yu's Proposition 4 gives the lattice freeness; the rank-two integral-basis
calculation identifies the stabilizer with `O_s^×`; the level comparison then identifies the two
orbits.

**Checks.**

- Level zero is the canonical lift, with a single marked class in its component; the lattice
  `ϖ₀O_s` has the same multiplier order as `O_s` and is free on generator `ϖ₀`.
- For `L_s`, `a ∈ O_F` preserves `L_s` exactly when `a ∈ O_s`, so the level-one quotient has the
  proper order `O_1 = O₀ + ϖ₀O_F`, of index `q₀` in `O_F`, not `O_F`: for `a = α` (a generator of
  `O_F` over `O₀`), `αL_1 = ϖ₀^(−1)αO_1 t` is not contained in `L_1`, since `α ∉ O_1`.
- At `q₀ = 2`, `s = 1`, `L_1/T` has `2` elements, so the compared isogeny has degree `2`, whereas
  `ϖ₀^(−1)T/T` has `4`: the level-one kernel is a line, not the whole `ϖ₀`-torsion.
- At `q₀ = 2`, `s = 1`, the comparison identifies the supplied strict-base orbit with `3`
  finite-residue marked classes when unramified and `2` when ramified. An orbit with one class
  would forget the marking.

*Needs:* §§6.4, 6.3, 6.2 (lattice quotients, markings and orders), 6.1 (comparison of the canonical
lift), 5.2 (the quotient isogeny and its coefficient extension), 3.4 (uniqueness of a marked
comparison); GrossZagierAndArithmeticHeights §7.2 (marked quadratic lifts, their isogenies and
orbit).

### 6.6 The field of moduli of a marked quasi-canonical lift

Let `k_F` be finite and `B = O_(F_u)` (Conventions), and fix, for each Frobenius twist
`H̄^(q₀^N)` of the special fibre `H̄` of the canonical lift, a universal deformation of
`H̄^(q₀^N)` over `B[[t₁,…,t_(n−1)]]`,
`n = [F:F₀]` (§3.6; each twist is again a formal `O₀`-module over `k_F` of height `n`). For a
quasi-canonical lift `H_L` let `m_L` be its marked modulus in the deformation space of the twist to
which `H_L` is marked, the twist component of §6.2 (for `L ⊃ T` with `[L:T] = q₀^N` this is
`H̄^(q₀^N)`); a lattice in the same `π_F^ℤ`-class and twist component gives the same modulus. Prove
that a lift of `Art_F(a)`, with `a = π_F^r u` and `u ∈ O_F^×`, sends `m_L` to `m_(a⁻¹L)` in the same
twist component: it acts on actual lattices by `L ↦ u⁻¹L` (§5.4), and the coherent `π_F^ℤ` and
Frobenius-twist identifications of §6.2 turn this into `[L] ↦ [a⁻¹L]` on `π_F^ℤ`-classes (Y95, §4,
p.296, unit action; G86, §5, pp.324–325). Prove that the smallest field containing `F` over which
this marked deformation is defined is `M_L = F(m_L)`, the class field of `π_F^ℤ O_L^× ⊂ F^×` under
the arithmetic Artin map; the statement does not depend on the universal coordinates. After base
change to the completion `F̂^ur` of the maximal unramified extension
(RamificationOfCompleteDiscretelyValuedFields §4a.3) the quadratic case identifies this field with
the field of definition in GrossZagierAndArithmeticHeights §7.2. It does not assert minimality among
fields not containing `F` (Y95, §4, Theorem 1 and proof, p.297; G86, §5, Proposition 5.3,
pp.325–326). A proof route: `m_(a⁻¹L) = m_L` exactly when `a ∈ π_F^ℤ O_L^×` by §6.3;
ClassFieldTheory Layer 8 identifies the field, and representability descends the marked module.

**Checks.**

- For the canonical lift (`O_L = O_F`) the field is `F`.
- For `a = π_F` and `L = T`, the actual image is `T` (§5.4) and the class is
  `[π_F⁻¹T] = [T]`, so `Art_F(π_F)` fixes `m_T`, as `M_T = F` requires; an action on actual
  lattices by `L ↦ a⁻¹L` would instead move `T` to the different embedded lattice `π_F⁻¹T`,
  although the two classes agree.
- The class action distinguishes the normalizations: for unramified quadratic `F/F₀`, `L = L_1`
  of §6.5 and a unit `a` of order `q₀ + 1 ≥ 3` in `O_F^×/O_1^×`, the moduli `m_(a⁻¹L_1)` and
  `m_(aL_1)` lie in the same twist component and differ by §6.3, because `a²` is a unit outside
  `O_1^×`, so `a²L_1` is not `π_F^ℤ`-homothetic to `L_1`; the geometric normalization would send
  `m_(L_1)` to `m_(aL_1)`.
- For quadratic level `s ≥ 1` the field depends only on `O_s` and `π_F`.
- Forgetting the marking changes the answer: for quadratic level `s ≥ 1` all `Gal(M_s/F)`-conjugates
  of `H_(L_s)` are isomorphic as unmarked modules (§6.3), whereas the marked moduli `m_(aL_s)`,
  `a ∈ O_F^×/O_s^×`, are pairwise distinct; a field of definition of an unmarked model need not
  contain `M_s`.

*Needs:* §§6.3, 6.2, 5.4, 2.5, 3.6; §6.5 for the lattices `L_s`; ClassFieldTheory Layer 8;
RamificationOfCompleteDiscretelyValuedFields §4a.3; GrossZagierAndArithmeticHeights §7.2.

### Examples

For quadratic unramified `F/F₀` the level-one lifts are `q₀ + 1` marked classes permuted simply
transitively by `Gal(M_1/F)`; for ramified `F/F₀` there are `q₀`.

### Dependencies

§§1.3, 2.2, 2.5, 3.4, 3.6, 5.2–5.4; ClassFieldTheory Layer 8; LocalFieldsRamification Layer 0;
RamificationOfCompleteDiscretelyValuedFields §4a.3; GrossZagierAndArithmeticHeights §7.2.

## Layer 7: Quadratic degrees, the primed tower and boundary tests

This layer identifies finite-residue quadratic field degrees with the supplied marked orbit
sizes for unramified and ramified `F/F₀`, proves
that the positive-level modulus is a uniformizer, specializes to the BKO primed tower, gives the
ramified example showing that §4.3 needs an unramified base, and computes neighbouring lattices.

### 7.1 Quadratic ring-class degrees

Let `F/F₀` be quadratic, `q₀ = #k_(F₀)`, `π_F` fixed and `s ≥ 1`, and let `M_s` be the field of §6.6
for level `s`. Prove that the finite-residue field `M_s/F` is totally ramified with norm group
`π_F^ℤ O_s^×`, and its strict-base extension is the field of definition of the supplied marked
level-`s` lift of GrossZagierAndArithmeticHeights §7.2. Thus
`Gal(M_s/F) ≅ O_F^×/O_s^× ≅ (O_F/ϖ₀^s O_F)^×/(O₀/ϖ₀^s O₀)^×`, and
`[M_s : F] = q₀^(s−1)(q₀ + 1)` when `F/F₀` is unramified and `q₀^s` when it is ramified; `M_0 = F`
separately. Residue characteristic two is included (G86, Proposition 5.3(2), p.325; Y95, §4,
Theorem 1, p.297). A proof route: §6.6 gives the finite-residue field, §6.5 identifies its
marked orbit with the supplied one, and local reciprocity gives total ramification. As a check
on the supplied orbit sizes, count units in
`O_F/ϖ₀^s O_F`, of order `(q₀² − 1)q₀^(2s−2)` when unramified and `(q₀ − 1)q₀^(2s−1)` when ramified,
and divide by `(q₀ − 1)q₀^(s−1)`.

**Checks.**

- At `s = 1` the degree is `q₀ + 1` (unramified) and `q₀` (ramified).
- At `s = 2`, unramified: `(q₀² − 1)q₀²/((q₀ − 1)q₀) = (q₀ + 1)q₀ = q₀^(2−1)(q₀ + 1)`.
- For `F₀ = ℚ₂` and `F = ℚ₂(√−1)` (ramified) the level-one degree is `2`; for `F = ℚ₂(√−3)`
  (unramified) it is `3`.
- The positive-level formula at `s = 0` would give `(q₀ + 1)/q₀`, not an integer; level zero is
  `M_0 = F`.

*Needs:* §§6.6, 6.4, 6.5; LocalFieldsRamification Layer 1; ClassFieldTheory Layer 8;
GrossZagierAndArithmeticHeights §7.2 (strict-base lifts and orbit sizes).

### 7.2 The quasi-canonical modulus is a uniformizer

In the quadratic case let `B = O_(F_u)` and fix, for each Frobenius twist of the special fibre, a
universal height-two deformation over `B[[t]]` (§3.6). Prove that for every quasi-canonical lift
`H_(L_s)` of level `s ≥ 1` its marked modulus `t_s`, taken in the deformation space of the twist to
which `H_(L_s)` is marked (§6.6), is a uniformizer of `M_s`: with `v_F(π_F) = 1`,
`v_F(t_s) = 1/[M_s : F]`, that is, `1/(q₀^(s−1)(q₀ + 1))` when unramified and `1/q₀^s` when
ramified (G86, Proposition 5.3(3) and its
proof, pp.325–326; Y95, Theorem 2′ and its `n = 2` case, pp.301–302, with proof in §§9–10,
pp.305–309). A proof route: factor the level-`s` quotient into `s` quotients of degree `q₀` and follow
the Newton polygons of the `ϖ₀`-series through them; a change of universal coordinate has unit
linear term and constant term in `𝔪_B`, and `v_F(t_s) < v_F(𝔪_B)` for `s ≥ 1`, so the valuation is
independent of the coordinate.

**Checks.**

- For BKO (`F = Φ`, `F₀ = ℚ_p`, unramified) at `s = 1`, `v_Φ(t₁) = 1/(p + 1)`.
- At `s = 0` the canonical modulus lies in `𝔪_(O_F)`. For unramified quadratic `F/F₀`,
  `B = O_F` and it lies in `𝔪_B`. For ramified quadratic `F/F₀` its valuation is `1`, while
  every nonzero element of `𝔪_B` has valuation at least `2`, so it need not lie in `B`.
- For `F₀ = ℚ₃`, `F = ℚ₃(π)` with `π² = 3`, the canonical `[π] = πX + X³` has
  `[π] ∘ [π]` with linear coefficient `3` and `X³` coefficient `π+π³ = 4π`, of valuation `1`.
  The Newton vertices `(1,2),(3,1),(9,0)` give canonical modulus valuation `1` (Y95, §6,
  p.302, canonical Newton polygon); a coordinate change over `B = ℤ₃` has constant term of
  valuation at least `2` and cannot cancel it.
- In the ramified case at `s = 1`, `v_F(t₁) = 1/q₀`.

*Needs:* §§7.1, 6.6, 3.6, 5.2.

### 7.3 The BKO quasi-canonical fields

Let `p ≥ 5`, `Φ/ℚ_p` unramified quadratic, `O = O_Φ`, `π = −p`, `κ = χ_π` and `H` the canonical lift.
For a generator `t` of `T_π H` and `s ≥ 1` put `L_s = p^(−s)ℤ_p t + T`, `H_s = H_(L_s)` and
`O_s = ℤ_p + p^s O`, and let `Ψ′_s` be the field of moduli of §6.6. Prove that `Ψ′_s` is the fixed
field of `κ⁻¹(ℤ_p^×(1 + p^s O))`, equivalently the class field of `(−p)^ℤ ℤ_p^×(1 + p^s O)`, of degree
`p^(s−1)(p + 1)` over `Φ`; that `End(H_s) = O_s`; that `Ψ′_s` does not depend on `t`; and that
`Ψ′_s ⊂ Ψ′_(s+1)`. Put `Ψ′_0 = Φ` (BKO21, §5.0.2, pp.958–959; G86, Proposition 5.3, p.325; Y95, §4,
Theorem 1, p.297).

API:

- `Ψ′_s` is a subfield of the fixed separable closure, with fixing subgroup
  `κ⁻¹(ℤ_p^×(1 + p^s O))`.
- Replacing `t` by `ut`, `u ∈ O^×`, leaves `Ψ′_s` unchanged.
- `s ≤ r` gives `Ψ′_s ⊂ Ψ′_r`, compatible with restriction.
- Integral coefficient extension preserves the marked modulus and the order `O_s`.
- Transport of the coordinate of `H` and of its Tate lattice preserves the marked class and its
  field.

**Checks.**

- `[Ψ′_1 : Φ] = p + 1`, equal to `6` at `p = 5`.
- `[Ψ′_2 : Ψ′_1] = p`.
- `Ψ′_0 = Φ` has degree one, not `p^(−1)(p + 1)`.
- The first cyclic kernel is defined over `Ψ′_1` while its nonzero points are not rational there:
  they generate the first division field, of degree `p² − 1 > p + 1`.

*Needs:* §§7.1, 6.6, 6.2, 6.5, 2.4.

### 7.4 The infinite primed tower

For `Ψ′_∞ = ⋃_s Ψ′_s`, prove that `κ` induces `Gal(Ψ′_∞/Φ) ≅ O^×/ℤ_p^×`, and that Teichmüller lifts and
the logarithm of LocalFieldsRamification Layer 1 identify this group with `μ_(p+1) × ℤ_p`; the tame
factor is canonical as the prime-to-`p` torsion, while an isomorphism with `ℤ/(p+1) × ℤ_p` needs a
generator and a basis of the minus line (BKO21, §5.0.2, pp.958–959). A proof route:
`⋂_(s≥1) O_s^× = ℤ_p^×`, `O^× = μ_(p²−1) × (1 + pO)`, `ℤ_p^× = μ_(p−1) × (1 + pℤ_p)`, and `pO/pℤ_p` is free
of rank one.

**Checks.**

- The torsion subgroup has order `(p² − 1)/(p − 1) = p + 1`, not `p² − 1`.
- The group is not `ℤ_p` alone: its tame part survives.
- At `p = 5` the finite quotients `Gal(Ψ′_s/Φ)` have orders `6, 30, 150` for `s = 1, 2, 3`.

*Needs:* §§7.3, 2.4; LocalFieldsRamification Layer 1.

### 7.5 A ramified boundary example for Honda's comparison

Prove that the unramified hypothesis of §4.3 cannot be dropped: over `O_(Ψ′_1)`, which is totally
ramified of degree `p + 1` over `O`, the level-one quasi-canonical lift `H_1` has special fibre with
`q`-power Frobenius `[−p]` and height two, but its endomorphism ring over any finite extension is
`ℤ_p + pO`, not `O`; hence it is not isomorphic over any finite extension to a Lubin–Tate
`O`-module, although `[−p]_(H_1)` reduces to the `p²`-power Frobenius modulo the maximal ideal of
`O_(Ψ′_1)` (G86, §5, Proposition 5.3, p.325; Y95, §§3–4, pp.295–298). A proof route: the canonical law for
`−p` has coefficients in `ℤ_p`, the level-one product reduces to the relative `p`-Frobenius, §5.3
computes the endomorphism ring, and an isomorphism to a Lubin–Tate `O`-module would transport the
action of `O`.

**Checks.**

- `[O_(Ψ′_1) : O] = p + 1`, and `v_(Ψ′_1)(−p) = p + 1 > 1`, so `−p` is not a uniformizer there.
- The endomorphism ring `ℤ_p + pO` has index `p` in `O`.
- The reduction of `[−p]_(H_1)` modulo the maximal ideal of `O_(Ψ′_1)` is `X^(p²)`, so the residual
  hypothesis of §4.3 holds; what fails is that `O_(Ψ′_1)` is ramified over `O` and `−p` is not a
  uniformizer there, so neither §1.3 nor condition (F1) applies, and the conclusion of §4.3 is false
  for `H_1`.

*Needs:* §§4.3, 7.3, 5.3.

### 7.6 Neighbouring lattices

In the BKO setting, the `p + 1` lattices containing a rank-two `ℤ_p`-lattice `L` with index `p` give
the neighbouring quotient isogenies. Prove that at level `s ≥ 1` one neighbour has level `s − 1` up
to `Φ^×`-homothety and `p` have level `s + 1`; that at level zero all `p + 1` have level one; that the
stabilizer of the level-`s` class acts transitively on the `p` outward neighbours; and that
`O^×/ℤ_p^×(1 + pO)`, of order `p + 1`, acts simply transitively on the neighbours of the canonical
lattice (BKO21, §§5.0.1–5.0.2, pp.955–959; G86, §5, p.325). The Hecke and local-point recurrences
built from these isogenies belong to the downstream roadmap AnticyclotomicLocalUnits.

**Checks.**

- At `s = 0` there is no level `−1` neighbour.
- The lines of `p⁻¹L/L ≅ 𝔽_p²` number `p + 1`.
- At `s ≥ 1` the inward neighbour of `L_s` is `p⁻¹L_(s−1) = p^(−s)ℤ_p t + p⁻¹T`: its line in
  `p⁻¹L_s/L_s` is the image of `p⁻¹T`, of order `p`, and the other `p` lines are permuted by
  `(1 + p^s O)/(1 + p^(s+1) O)`, of order `p²`, through its quotient of order `p`.

*Needs:* §§6.5, 5.2, 7.3.

### Examples

At `p = 5`: `[Ψ′_1:Φ] = 6`, `[Ψ′_2:Φ] = 30`; the six level-one lifts are permuted simply
transitively by `Gal(Ψ′_1/Φ)`; the canonical lattice has six neighbours, all of level one.

### Dependencies

§§2.4, 3.6, 4.3, 5.2, 5.3, 6.2–6.6; LocalFieldsRamification Layer 1; ClassFieldTheory Layer 8;
GrossZagierAndArithmeticHeights §7.2.

## Layer 8: The BKO tame and anticyclotomic towers

Throughout this layer `p ≥ 5`, `Φ/ℚ_p` is unramified quadratic with integers `O`, `π = −p`, and `H`
is the Lubin–Tate `O`-module for `π` (§§1.3, 6.1). This layer builds the character data, the two
principal-unit eigendirections, the fixed fields `Θ_n` and `Ψ_n`, and the comparisons with the primed
tower of §7.3.

### 8.1 Character data

Define `Φ_n = Φ(H[π^(n+1)])` for `n ≥ 0`, `Φ_(−1) = Φ` and `Φ_∞ = ⋃_n Φ_n`, inside the fixed separable
closure. Prove that the restriction of the character of §2.4 is an isomorphism
`κ : Gal(Φ_∞/Φ) ≅ O^×`; with `Δ = κ⁻¹(μ_(p²−1))` and `Γ = κ⁻¹(1 + pO)`, that restriction
`Δ → Gal(Φ₀/Φ)` is an isomorphism and `Gal(Φ_∞/Φ) = Δ × Γ` canonically; and define `ω = κ|_Δ`, the
Teichmüller character with values in `O^×` (BKO21, §2, pp.947–948; LT65, Theorem 2, pp.383–384).

API:

- `Φ_n` is the finite subfield generated by the `π^(n+1)`-torsion.
- `κ` is a continuous isomorphism onto `O^×`, induced by `T_π H`.
- Multiplication gives `Δ × Γ ≅ Gal(Φ_∞/Φ)`.
- `ω` takes values in `μ_(p²−1) ⊂ O^×`.
- Data are equal when the actions agree on all finite torsion levels.
- Isomorphisms of the coefficient data and of separable closures transport fields and characters;
  coordinate changes for the same `π` and changes of Tate basis give the same fields.

**Checks.**

- `[Φ₀ : Φ] = p² − 1`, not `p + 1`.
- `[Φ₁ : Φ] = (p² − 1)p²`.
- `Δ` has order `p² − 1`, and `Γ ≅ 1 + pO ≅ ℤ_p²` has no nontrivial torsion.
- For a Teichmüller unit `ζ`, `ω` of a lift of `Art_Φ(ζ)` is `ζ⁻¹` (§2.5).

*Needs:* §§2.3, 2.4, 2.5; LocalFieldsRamification Layer 1.

### 8.2 Cyclotomic and anticyclotomic directions

Let `c` be the nontrivial automorphism of `Φ/ℚ_p`. Prove that conjugation by a lift of `c` acts on
`κ`-values by `c` and preserves `Γ`; that under the logarithm `1 + pO ≅ pO` of LocalFieldsRamification
Layer 1 (valid since `(p−1)·1 > 1`), the images `G⁺` and `G⁻` of `(1+c)/2` and `(1−c)/2` satisfy
`Γ = G⁺ × G⁻`, `κ(G⁺) = 1 + pℤ_p` and `κ(G⁻) = {u ∈ 1 + pO : N_(Φ/ℚ_p)(u) = 1}`, each free of rank one
over `ℤ_p`; the factors are canonical, while isomorphisms with `ℤ_p` need a basis (BKO21, §2,
pp.947–948; LT65, §1, Theorem 1, pp.382–383). A proof route: `−p ∈ ℚ_p`, so coefficient conjugation
of `H` composed with the same-`π` comparison of §1.4 gives `cκ(σ) = κ(c̃σc̃⁻¹)`; `log ∘ N = Tr ∘ log`
identifies the minus line with the trace-zero line.

API:

- `G⁺` and `G⁻` are closed subgroups of `Γ`, and multiplication `G⁺ × G⁻ → Γ` is a topological
  isomorphism.
- A principal-unit `κ`-value lies in `κ(G⁻)` exactly when its norm to `ℚ_p` is one.
- The factors are determined by the conjugation equations and are transported by coefficient
  isomorphisms.
- Changing a `ℤ_p`-basis of a line rescales only the coordinate.

**Checks.**

- Every element of `1 + pℤ_p` lies in `κ(G⁺)`.
- For trace-zero `z ∈ pO`, `exp(z) ∈ κ(G⁻)`.
- `G⁺ ∩ G⁻ = 1`, using that `2` is invertible for odd `p`.
- A principal unit whose logarithm has nonzero trace, such as `1 + p`, is not in `κ(G⁻)`.

*Needs:* §8.1; §1.4; LocalFieldsRamification Layer 1; ClassFieldTheory Layer 7 (naturality of the
Artin map, Tau Ceti `TauCeti.ClassFieldTheory.artinMap_congr`).

### 8.3 The fixed fields Θ_n and Ψ_n

For `n ≥ 0` define `Θ_n = Φ_n^Δ` and `Ψ_n = Θ_n^(G⁺)` (fixed fields of the images of `Δ` and `ΔG⁺`).
Prove that `[Θ_n : Φ] = p^(2n)` and `[Ψ_n : Φ] = p^n`, that `Θ₀ = Ψ₀ = Φ`, that the inclusions are
induced from those of the `Φ_n`, that `Gal(Ψ_∞/Φ) ≅ G⁻` for `Ψ_∞ = Φ_∞^(ΔG⁺)`, and that `Ψ_∞/ℚ_p` is
Galois with group `G⁻ ⋊ C₂`, `C₂` acting by inversion; `Ψ_∞` is the maximal subextension of `Φ_∞`
that is pro-`p` over `Φ` and dihedral over `ℚ_p` (BKO21, §2, pp.947–948; §5, pp.955–959). A proof
route: at finite level `κ` gives `O^×/(1 + p^(n+1)O)`; removing the Teichmüller factor leaves
`pO/p^(n+1)O`, and the plus/minus splitting gives the degrees; for a lift `j` of `c`, `j²` lies in the
torsion-free `G⁻`, commutes with `j` and is inverted by it, so `j² = 1`.

API:

- `Θ_n` and `Ψ_n` are subfields of `Φ_n`, with `Gal(Ψ_n/Φ)` the finite minus quotient, compatibly in
  `n`.
- Closed fixing subgroups determine the finite and infinite fields.
- Increasing `n` gives compatible inclusions and restriction maps.
- Coordinate changes for the same `π` and changes of Tate basis give the same fields.

**Checks.**

- `Θ₀ = Ψ₀ = Φ`, although `[Φ₀ : Φ] = p² − 1`.
- `[Θ₁ : Φ] = p²` and `[Ψ₁ : Φ] = p`.
- `Gal(Ψ_n/Φ)` is cyclic of order `p^n`.
- The group `ℤ_p ⋊ C₂` of `Ψ_∞/ℚ_p` is not pro-`p`; its subgroup over `Φ` is.

*Needs:* §§8.1, 8.2; ClassFieldTheory Layer 8.

### 8.4 Field and generator comparisons

Prove: for compatible generators `v_n` of `H[π^(n+1)]`, `Φ_n = Φ(v_n)`, and changing the Tate basis
does not change `Φ_n`, `Θ_n` or `Ψ_n`. With `Δ′ = Δ/μ_(p−1)`, the tame subgroup of `Gal(Ψ′_∞/Φ)` of
order `p + 1`: `Ψ_n = (Ψ′_(n+1))^(Δ′)` for `n ≥ 0` and `(Ψ′_∞)^(Δ′) = Ψ_∞`; for `s ≥ 1`,
`Ψ′_s ∩ Ψ_s = Ψ_(s−1)`, `Ψ′_s Ψ_s = Ψ′_(s+1)`, and restriction identifies `Gal(Ψ′_(s+1)/Ψ′_s)` with
`Gal(Ψ_s/Ψ_(s−1))`; the marked modulus `t_s` of §7.2 generates `Ψ′_s` over `Φ` (BKO21, §2, p.947;
§5.0.2, pp.958–959; Y95, §4, Theorem 1, p.297). A proof route: the fixing subgroup of `Ψ′_(n+1)` is
`κ⁻¹(ℤ_p^×(1 + p^(n+1)O))`; adding the tame subgroup gives `κ⁻¹(μ_(p²−1)(1 + pℤ_p)(1 + p^(n+1)O))`,
the subgroup of `Ψ_n`.

**Checks.**

- The level shift is `n + 1`: `(Ψ′_n)^(Δ′) = Ψ_(n−1)` for `n ≥ 1`, and `(Ψ′_1)^(Δ′) = Φ`.
- Degrees at `s = 1`: `[Ψ′_1 Ψ_1 : Φ] = (p + 1)p/1 = [Ψ′_2 : Φ]`, and the rectangle uses `Ψ₀ = Φ`.
- At `p = 5` the primed degrees `1, 6, 30` and the tame-fixed degrees `1, 5, 25` exhibit the shift.
- The modulus `t_s` and a primitive torsion point generate different fields: `Φ(t₁) = Ψ′_1` of
  degree `p + 1`, while `Φ(v₀) = Φ₀` has degree `p² − 1`.

*Needs:* §§8.3, 7.4, 7.3, 7.2, 2.3.

### 8.5 π-adic and p-adic generators

For a Tate generator `(v_n)` with `[−p]v_(n+1) = v_n` and `v_n` of exact order `p^(n+1)`, define
`w_n = [(−1)^n]v_n`. Prove that `[p]w_(n+1) = w_n`, so `(w_n)` is a `p`-adic Tate generator; that
`(v_n) ↦ (w_n)` is `O`-linear, Galois equivariant, invertible and preserves every division field;
that under an elliptic formal isomorphism `Ê ≅ H` (§4.4) it gives the comparison with
`BarsottiTate.tateModule` with `w₀ = v₀`; and that the logarithm satisfies
`ℓ_H ∘ j_n = (−1)^n ℓ_H` for `j_n = [(−1)^n]_H` (§0.3) (BKO21, §2, footnote 2, p.948; §5,
pp.956–959). The behaviour of formal traces under `j_n` at different indices is stated with the
traces in §9.3.

**Checks.**

- `[p]w_(n+1) = [p][(−1)^(n+1)]v_(n+1) = [(−1)^n][−p]v_(n+1) = [(−1)^n]v_n = w_n`.
- If `[p]w_(n+1) = w_n` then `[−p]w_(n+1) = −w_n`, while `[−p]v_(n+1) = v_n`; at `n = 0` the outputs
  are `[−1]w₀` and `w₀`.
- The sign is the formal `[−1]_H`, not the negation of the parameter: for a formal group whose
  inverse series is `−X + 2X² + ⋯` the two differ in degree two.
- For the point `x ∈ H(𝔪_Φ)` with `ℓ_H(x) = p²` (it exists by §0.3, since `Φ/ℚ_p` is unramified
  and `(p − 1)·2 > 1`), `ℓ_H(j_1 x) = −p²` and `ℓ_H(j_2 x) = p²`; a comparison ignoring the sign
  would give `p²` at `n = 1`.

*Needs:* §§2.2, 4.4, 8.1, 0.3; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.8.

### Examples

At `p = 5`: `[Φ₀:Φ] = 24`, `[Θ₁:Φ] = 25`, `[Ψ₁:Φ] = 5`, `[Ψ′_1:Φ] = 6`, and `Ψ₁ = (Ψ′_2)^(Δ′)` with
`[Ψ′_2 : Ψ₁] = 6`.

### Dependencies

§§0.3, 1.4, 2.2–2.5, 4.4, 7.2–7.4; LocalFieldsRamification Layer 1; ClassFieldTheory Layers 7–8;
FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.8.

## Layer 9: Formal traces and compatible tower maps

### 9.1 Finite formal traces

Let `G` be a formal `O₀`-module over `O_K` and `L/K` finite separable. Define the formal trace
`Tr^G_(L/K) : G(𝔪_L) → G(𝔪_K)` as the formal sum of `σ(x)` over the `K`-embeddings `σ` of `L` into a
finite Galois closure `N`, computed in `G(𝔪_N)`. Prove that the sum is Galois invariant, lies in
`G(𝔪_K)` and does not depend on `N`; that `Tr^G` is `O₀`-linear, natural for formal homomorphisms
defined over `O_K`, transitive in towers and compatible with coordinate isomorphisms and
isomorphisms of the coefficient field; that it commutes with base change along a finite Galois
extension linearly disjoint from `L`; and that `ℓ_G(Tr^G x) = Tr_(L/K)(ℓ_G(x))` (§0.3) (BKO21, §4,
pp.954–955; §5.0.2, pp.958–959; LT65, §1, p.383).

API:

- Maps agreeing on every conjugate point have the same trace value.
- The trace along a tower is the composite of the two traces.
- Formal homomorphisms over `O_K` commute with traces; coordinate isomorphisms intertwine them.
- For a linearly disjoint finite Galois extension of the coefficients, trace commutes with the
  induced inclusion of points.
- The logarithm carries the formal trace to the field trace.

**Checks.**

- `Tr^G_(K/K) = id`.
- For `x ∈ G(𝔪_K)`, `Tr^G_(L/K)(x) = [[L:K]]_G x`.
- For the multiplicative group, `1 + Tr^G(x) = N_(L/K)(1 + x)`, which differs from `1 + Tr_(L/K)(x)`
  in general (for `L = ℚ_p(√p)`, `x = √p`: `N(1 + √p) = 1 − p` while `1 + Tr(√p) = 1`).
- For the additive group the formal trace is the field trace.

*Needs:* §§0.2, 0.3; LocalFieldsRamification Layer 0.

### 9.2 Tame descent on formal points

For `s ≥ 0` in the BKO setting define `D_s = Tr^H_(Ψ′_(s+1)/Ψ_s) : H(𝔪_(Ψ′_(s+1))) → H(𝔪_(Ψ_s))`, a
formal sum over `Δ′` of order `p + 1`, using `Ψ_s = (Ψ′_(s+1))^(Δ′)` (§8.4). Prove that `D_s` is
`O`-linear, compatible with coordinate isomorphisms and with the elliptic comparison of §4.4,
independent of any enumeration of `Δ′`, equal to `[p + 1]_H` on points defined over `Ψ_s`, and
surjective, with section `[(p+1)⁻¹]_H` followed by inclusion (BKO21, §5.0.2, pp.958–959).

API:

- `D_s` is determined by the action of `Δ′` on the source points.
- Composing the inclusion of `H(𝔪_(Ψ_s))` with `[(p+1)⁻¹]_H` gives a right inverse.
- Isomorphisms of the field rectangle, coordinate isomorphisms for the same `π` and the elliptic
  comparison intertwine `D_s`.
- Linearly disjoint finite coefficient extension commutes with `D_s`.

**Checks.**

- `D₀` is the trace of `Ψ′_1/Φ`, of degree `p + 1`.
- For `x` over `Ψ_s`, `D_s(x) = [p + 1]x`; `p + 1` is a unit in `O` because `p ∤ p + 1`.
- `D_s(0) = 0`.
- The normalized projector `[(p+1)⁻¹] ∘ D_s` fixes points over `Ψ_s`, while `D_s` multiplies them by
  `p + 1`; the two maps are different.

*Needs:* §§9.1, 8.4, 4.4.

### 9.3 The trace-compatible square

For `s ≥ 0` and `x ∈ H(𝔪_(Ψ′_(s+2)))`, prove
`Tr^H_(Ψ_(s+1)/Ψ_s)(D_(s+1) x) = D_s(Tr^H_(Ψ′_(s+2)/Ψ′_(s+1)) x)`, the same identity after the
logarithm and after an elliptic formal isomorphism defined over the coefficients, and that `D`
carries trace-compatible systems in the primed tower to trace-compatible systems in the unprimed
tower. For the sign operators `j_n = [(−1)^n]_H` of §8.5, prove that every formal trace `Tr` of
§9.1 between fields of the two towers satisfies `Tr ∘ j_n = j_n ∘ Tr` at a fixed index and, when
its source and target coordinates carry indices `n` and `m`, `Tr ∘ j_n = [(−1)^(n+m)]_H ∘ j_m ∘ Tr`;
so in alternating-sign coordinates attached to different levels the square holds with exactly
this correction. The statement concerns supplied point systems; it does not assert the existence
of a nonzero norm-compatible system (BKO21, §2, footnote 2, p.948; §5.0.2, pp.958–959). A proof
route: both sides are the formal trace from `Ψ′_(s+2)` to `Ψ_s`, by transitivity through
`Ψ_(s+1)` and through `Ψ′_(s+1)`; the sign rules follow from `O`-linearity of the traces and
`[(−1)^n] = [(−1)^(n+m)] ∘ [(−1)^m]`.

**Checks.**

- At `s = 0` the square involves `Ψ′_2`, `Ψ′_1`, `Ψ₁` and `Φ`, all defined.
- Degrees: `[Ψ′_2 : Ψ₁][Ψ₁ : Φ] = (p + 1)p = [Ψ′_2 : Ψ′_1][Ψ′_1 : Φ]`.
- Adjacent sign labels need the factor `[−1]`: take `p = 5`, `s = 0`, source label `1`, target
  label `0`, and the point `x ∈ H(𝔪_Φ) ⊂ H(𝔪_(Ψ′_2))` with `ℓ_H(x) = 5² = 25` (§0.3). Both routes
  of the square give `[30]_H x` (§9.1, since `[Ψ′_2 : Φ] = 30`), of logarithm `750`. Then
  `ℓ_H(Tr(j_1 x)) = −750` and `ℓ_H([(−1)^(1+0)]_H j_0 Tr x) = −750` agree, whereas omitting the
  correction gives `ℓ_H(j_0 Tr x) = 750`. A torsion generator is not a test point here: `w_1`
  generates `Φ₁`, of degree `600` over `Φ`, so it is not a point over the source `Ψ′_2`, of
  degree `30`.

*Needs:* §§9.1, 9.2, 8.4, 8.5, 5.5, 3.6, 0.3.

### Examples

At `s = 0`, `p = 5`: `D₀` sums over six conjugates from `Ψ′_1` down to `Φ`, and the square compares the
traces `Ψ′_2 → Ψ₁ → Φ` and `Ψ′_2 → Ψ′_1 → Φ`, of total degree `30`.

### Dependencies

§§0.2, 0.3, 3.6, 4.4, 5.5, 8.4, 8.5; LocalFieldsRamification Layer 0.

## Downstream consumers

- **AnticyclotomicLocalUnits** (the ColemanPowerSeries, Part II direction) uses Layers 0–2 for formal
  `O`-modules, logarithms, torsion, Tate modules, `κ` and the Artin comparison; §0.4 for the
  number-field realization of `Φ` and its finite extensions carrying the elliptic formal-point
  homomorphism; Layer 4 for the unramified Honda and elliptic comparisons; Layers 5–8 for lattice
  quotients, quasi-canonical fields, neighbouring lattices and the tame and anticyclotomic towers;
  Layer 9 for formal traces and tame descent. It owns local-unit decompositions, distinguished local
  points and their recurrences.
- **FunctionFieldArithmetic** §§4.1–4.2 use §§0.1–0.2, 1.1–1.4 and, at `char K = p`, §§2.1–2.5
  (torsion, division fields, the Lubin–Tate character and its Artin comparison), and add the
  ramification filtration of the division fields, the relative Lubin–Tate fields of elements of
  positive valuation, and local existence and Kronecker–Weber in equal characteristic.
- **RelativeFarguesFontainePartII** and **ScholzeFunctorAndModpCohomologyOfTheLubinTateTower** use
  the formal modules, logarithms and Lubin–Tate modules of Layers 0–1 and the Tate modules of
  Layer 2, with the characteristic-zero hypotheses stated there.
- **NonordinaryCMSpecialValues** uses §§2.2–2.4 (Tate module, division fields, character) and
  §§4.3–4.4 (the unramified and elliptic comparisons); **ComplexMultiplicationAndExplicitReciprocityPartII**
  uses the character and its Artin comparison of §§2.4–2.5.

## References

- **LT65.** Jonathan Lubin and John Tate, *Formal complex multiplication in local fields*, Annals of
  Mathematics 81 (1965), 380–387, DOI 10.2307/1970622.
- **LT66.** Jonathan Lubin and John Tate, *Formal moduli for one-parameter formal Lie groups*,
  Bulletin de la Société Mathématique de France 94 (1966), 49–59.
  [Numdam](https://www.numdam.org/item/10.24033/bsmf.1633.pdf).
- **H70.** Taira Honda, *On the theory of commutative formal groups*, Journal of the Mathematical
  Society of Japan 22 (1970), 213–246.
  [J-STAGE](https://www.jstage.jst.go.jp/article/jmath1948/22/2/22_2_213/_pdf).
- **H68.** Taira Honda, *Formal groups and zeta-functions*, Osaka Journal of Mathematics 5 (1968),
  199–213. [OUKA](https://ir.library.osaka-u.ac.jp/repo/ouka/all/8997/ojm05_02_05.pdf).
- **G86.** Benedict H. Gross, *On canonical and quasi-canonical liftings*, Inventiones Mathematicae
  84 (1986), 321–326. [GDZ](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0084/LOG_0018.pdf).
- **Y95.** Jiu-Kang Yu, *On the moduli of quasi-canonical liftings*, Compositio Mathematica 96
  (1995), 293–321. [Numdam](https://www.numdam.org/article/CM_1995__96_3_293_0.pdf).
- **BKO21.** Ashay A. Burungale, Shinichi Kobayashi and Kazuto Ota, *Rubin's conjecture on local
  units in the anticyclotomic tower at inert primes*, Annals of Mathematics 194 (2021), 943–966,
  DOI 10.4007/annals.2021.194.3.8. [CaltechAUTHORS](https://authors.library.caltech.edu/records/8svwt-jn031).
- **VZ07.** Eva Viehmann and Konstantin Ziegler, *Formal moduli of formal O_K-modules*, Astérisque
  312 (2007), 57–66. [Numdam](https://www.numdam.org/item/AST_2007__312__R1_0.pdf).
