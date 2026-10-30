# Roadmap: K-theory of curves and elliptic curves

**Summary.** Build the algebraic K-theory of a regular curve over a field in degrees zero to three, and
specialise it to an elliptic curve given by a Weierstrass equation. The roadmap starts from the
projective Weierstrass scheme and Tau Ceti's function-field theory of elliptic curves, and proves:
the supplied zeroth K-group decomposition `ℤ ⊕ ℤ ⊕ E(F)` agrees with the concrete Weierstrass
point/divisor coordinates and their square-zero multiplication; the localisation sequence of a
curve over all its closed points, with the tame symbol as its degree-two boundary; the special
first K-group, the two-column coniveau description of the third K-group and the Adams weights of
the K-groups of a curve; functoriality along isogenies, where pushforward after pullback is
multiplication by the class of `f_*O`, not by the degree; Harder's theorem and the complete
computation of the K-groups of an elliptic curve over a finite field, with
`#K_{2i}(E) = 1 − a_q q^i + q^{2i+1}`; minimal regular models over rings of `S`-integers of a
number field and the integral part of the second K-group with its vertical-residue description;
and finite-support certificates for sums of symbols, Bloch's correction and Bloch's classes `S_a`,
with transfer and Galois descent. Three worked examples close the roadmap: a certified symbol on
`y² = x(x+1)(x+16)`, a residue at a closed point of degree two, and an integrality failure at a
split multiplicative fibre.

## Scope and ownership

This roadmap owns the K-theory of a regular curve over a field in low degrees and its elliptic
specialisation. Concretely it owns: the comparison of the projective Weierstrass scheme with the
existing function-field theory of elliptic curves (charts, function field, rational points, and compatibility diagrams for AlgebraicCurves’ isogeny scheme morphisms); the compatibility of the supplied elliptic `K_0` decomposition and its ring
structure with the concrete Weierstrass point/divisor equivalence; the localisation sequence of a regular curve over all closed points in degrees zero
to three with its naturality and the identification of its boundaries; the curve invariant
`SK_1`, the two-column coniveau description of `K_3` and the weight components of curve
K-groups; the isogeny projection formula with the determinant obstruction; Harder's theorem and
the finite-field computation of the K-groups of a curve, with the elliptic orders and the twisted
Frobenius kernel; resolution of a specified integral Weierstrass equation, minimal regular models over `O_{F,S}` and the
integral part of `K_2`; and symbol certificates, Bloch's classes, transfer and Galois descent for
the kernel of the tame symbol on `K_2` of the function field.

It also owns the following arithmetic inputs over finite fields: Bass–Milnor–Serre
for coordinate rings of smooth affine curves over a finite field, Quillen's finite generation of the
K-groups of a smooth curve over a finite field, the exact reciprocity sequence
`K_2(F_q(X)) → ⊕_x k(x)^× → F_q^× → 0`, and the degree-one zero-cycle construction.
K2SymbolsBrauer §10.32c owns finite generation of Milnor tame-residue kernels,
`[F : F^p] = p` and characteristic-prime divisibility for global function fields;
§5.5 here identifies their finite prime-to-`p` tame kernel with scheme `K_2(X)` through
Matsumoto and the curve-boundary comparison. Quillen's curveFiniteGeneration remains the
independent higher-degree input to Harder's theorem.
Geisser–Levine’s general characteristic-`p` field comparison is supplied by KTheoryFiniteLocalFields §5.17. The exact supplier contracts below identify the motivic comparisons and arithmetic prerequisites required by these targets.

The libraries and other roadmaps supply the following foundations.

- **Mathlib** supplies Weierstrass curves (`WeierstrassCurve`, `WeierstrassCurve.IsElliptic`,
  `WeierstrassCurve.Affine.Point` with its group law, `Point.map`), the projective spectrum
  (`AlgebraicGeometry.Proj` with `Proj.awayι`), function fields of integral schemes
  (`Scheme.functionField`, `functionField_isFractionRing_of_isAffineOpen`), smooth, proper and
  geometrically integral morphisms, regular local rings, `CommRing.Pic`, finite-field Frobenius
  (`FiniteField.frobeniusAlgHom`) and the uniqueness of maps from a reduced scheme with dense
  open (`ext_of_isDominant_of_isSeparated`).
- **Tau Ceti** supplies the function-field theory of elliptic curves and of curves in general:
  places of a function field (`TauCeti.Place` with `ord`, `ResidueField`, `residueUnit`,
  `normResidue`, `degree`), divisors and principal divisors (`TauCeti.Divisor`,
  `Divisor.principal`, `Divisor.eval`), the degree splitting of the class group
  (`WeilDivisor.OrderSystem.classGroupAddEquivPicZeroProdInt`), the identification of the point
  group with degree-zero divisor classes (`WeierstrassCurve.Affine.pointEquivDegreeZeroDivisorClass`),
  the principal-divisor criterion for rational points (the additive point/class equivalence
  and `Divisor.divisorClass_eq_zero_iff`) and torsion functions
  (`WeierstrassCurve.Affine.exists_principal_eq_zsmul_ofPoint_sub_infinity`), the function-field
  isogeny theory (`TauCeti.Isogeny` with `degree`, `ker`, `fieldPullback`,
  `pullbackDifferential`, `frobeniusIsogeny`), scheme Weil divisors and line-bundle classes
  (`SchemeWeilDivisor.classGroupToLineBundleClassHom`, `LineBundleClass`), the point count and
  Frobenius trace (`WeierstrassCurve.pointCount`, `WeierstrassCurve.frobeniusTrace`), Grothendieck
  groups (`TauCeti.ExactK0`, `TauCeti.AbelianK0`), the truncated Euler characteristic of a
  module sheaf (`Scheme.Modules.eulerCharBelow`) and local models over a DVR (`TauCeti.Model`).
  Tau Ceti also supplies the projective Weierstrass scheme
  (`WeierstrassCurve.projModel` with `projModelOver`, `projModelZero`, `isProper_projModelOver`,
  `isIntegral_projModel`, `smoothOfRelativeDimension_one_projModelOver`, the chart rings
  `Projective.ChartRing` with `awayEquivChartRing`, and `projModelVariableChangeIso`), the
  scheme Weil-class/Picard equivalence `SchemeWeilDivisor.classGroupAddEquivLineBundleClass`,
  the genus-one bijection `SchemeWeilDivisor.degreeOneEquivPicZero`, the Hasse bound
  `WeierstrassCurve.hasse_bound` and the Tate module of an elliptic curve. These are cited, never
  restated.
  The acceptance pin is Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039.
  The implementation at revision 271e1af4dd54c50b9192cf3e213b7686843a0b3a additionally supplies
  `WeierstrassCurve.geometricallyIntegral_projModelOver` (Scheme/Integral.lean, lines 84–90),
  over every commutative ring, and `WeierstrassCurve.isIso_appTop_projModelOver`
  (Scheme/GlobalSections.lean, lines 49–55), also over every commutative ring;
  for elliptic W over a field it supplies `WeierstrassCurve.topologicalKrullDim_projModel`,
  `WeierstrassCurve.isDiscreteValuationRing_stalk_projModel` and
  `WeierstrassCurve.fact_coheight_le_one_projModel` (Scheme/Smooth.lean, lines 224–243),
  `WeierstrassCurve.projModelCodimensionOnePointEquivPlace`,
  `WeierstrassCurve.mem_integers_projModelCodimensionOnePointEquivPlace_iff` and
  `WeierstrassCurve.degree_projModelCodimensionOnePointEquivPlace`
  (Scheme/Place.lean, lines 67–116), and `WeierstrassCurve.projModelPicZeroAddEquiv`,
  `WeierstrassCurve.pointAddEquivPicZero` and `WeierstrassCurve.coe_pointAddEquivPicZero_some`
  (Scheme/PicZero.lean, lines 72–145; the point equivalence also uses decidable equality).
  These paths are relative to TauCeti/AlgebraicGeometry/EllipticCurve/.
  Reuse these declarations for §§1.2–1.4 and 2.4 when integrating the geometry; their absence
  at the acceptance pin does not require another implementation. The acceptance theorem
  `EllipticScheme.geometricallyIntegral` tests the field specialisation against that pin.
  The two-chart description, dimension for singular cubics, genus-one H¹ computation, order and residue identifications,
  open-restriction squares and the additional compatibility diagrams remain the targets below.
- **ModularCurves** (Tau Ceti roadmap) owns the projective Weierstrass model `projModel W` over
  any ring (Tau Ceti’s `WeierstrassCurve.projModel`), its properness,
  smoothness when `W.IsElliptic`, its zero section, the points
  dictionary (Layer 1B), the scheme-theoretic group law (Layer 1D), the comparison of function
  fields `projModelFunctionFieldEquiv` (Layer 2A), isogenies and kernels as group schemes
  (Layers 2B–2C) and Picard duality with the theorem of the square (Layer 2D). This roadmap never
  constructs the Weierstrass scheme again.
- **EllipticCurves** (Tau Ceti roadmap) owns the equation-level theory: the function field with
  its places and divisors (Layer 0), Galois actions and base change (Layer 0.5), isogenies, the dual
  and `[m]` (Layer 1), torsion, the Weil pairing and the Tate module (Layer 2), and the Hasse bound
  with `a_q = q + 1 − #E(F_q)` (Layer 3).
- **AlgebraicCurves** (Tau Ceti roadmap) Layer 12 owns the dictionary between regular projective
  curves and function fields of transcendence degree one, with closed points, places, and the Weierstrass-isogeny specialisation of Layer 12C.
- **JacobianChallenge** (Tau Ceti roadmap) owns the Picard group of a scheme as a group, the
  Weil–Cartier–line-bundle dictionary and the degree (Layer A), and coherent cohomology of
  proper curves with Riemann–Roch (Layer B).
- **StableReduction** (Tau Ceti roadmap) owns blow-ups, contraction and resolution for curve models over a DVR (Layer 4) and regular and minimal models over a discrete valuation ring
  (Layer 5). RelativeJacobiansAndIntegralCurveModels §0.1 owns the global marked-model carrier,
  its morphisms and localisation; its §5.1 owns regular proper model existence over excellent
  Dedekind bases. Here regular proper models mean its proper/regular full subcategory;
  §6.1 identifies the native acceptance adapter with this category. The specified-equation surface resolution and the global common resolution, contraction and blow-down factorisation needed here are §§6.2, 6.4–6.6.
- **NeronModelsAndSemistableAbelianVarieties** §§1.8, 2.7, 6.5 owns the Néron model, its
  identification with the smooth locus of the minimal regular model, and the equivalence between
  good reduction and properness. These supply the comparisons with regular proper models.
- **SchemeAndStackFoundations** (Tau Ceti roadmap) §5.7 owns geometric `K_0` and `G_0`
  (`Chow.K0`, `Chow.G0`) with pullback, rank, determinant and Euler pushforward; §4.13 owns
  regularity of smooth schemes over a regular base; §5.11 owns the Weil bound
  `|#C(F_q) − (q + 1)| ≤ 2g√q` for a smooth projective geometrically irreducible curve over `F_q`.
- **SchemeKTheoryOperations** owns the K-theory of schemes: derived pullback, proper
  pushforward, base change, projection formulas and qcqs inverse-limit continuity (Layer 2, including §2.7), localisation with supports, DVR
  boundaries, curves and arithmetic surfaces (Layer 3), coniveau (Layer 4), homotopy invariance
  and the projective bundle theorem (Layer 5), Adams operations and weights (Layer 6) and the
  self-intersection formula (Layer 7).
- **GeneralAlgebraicKTheory** owns the Quillen K-groups of exact categories (Layer 2),
  filtered colimits of rings (§3.2), and the resolution, dévissage and Serre localisation
  theorems (Layer 4).
- **KTheoryLowDegrees** owns `K_1` of a ring with its determinant and `SK_1` (§8.1), the
  Bass–Milnor–Serre vanishing of `SK_1` for rings of `S`-integers of number fields (§11.2) and the
  rank–determinant ring isomorphism `K_0(X) ≅ ℤ ⋉ Pic(X)` for a regular curve with its class
  formulas (§12.2), with the
  projective-line change of basis (§12.3) and the pointed elliptic decomposition (§12.4).
- **K2SymbolsBrauer** owns Milnor K-theory of finite fields and `K_2(F_q) = 0` (§§5.12, 6.16),
  the identification with Matsumoto's presentation and the graded map to Quillen K-theory
  (§§7.2, 8.2–8.3), the tame symbol with its Steinberg property, independence of the uniformiser,
  ramification formula, finite support and higher residues (§§9.2–9.4, 9.7, 9.11, 9.13), Milnor
  norms and the norm-residue formula (§§10.21, 10.27, 11.6), Weil reciprocity (§§10.29–10.30),
  finite generation of Milnor tame-residue kernels and characteristic-prime divisibility
  (§10.32c), Bass–Tate vanishing of `K_n^M` of a global function field for `n ≥ 3` (§10.33), the
  localisation boundary of a DVR (§11.1), the unramified subgroup (§12.1) and Tate's computation
  of `K_2(ℚ)` (§12.11).
- **K3BlochGroups** owns the indecomposable `K_3` of a field (Layer 2). **GeneralAlgebraicKTheory** §13.8c holds Quillen's computation of the K-groups
  of finite fields, which **KTheoryFiniteLocalFields** consumes in its Layer 1; the latter owns
  restriction and transfer for finite fields (§1.5), the K-groups of their algebraic closure
  (§1.6) and the absence of `p`-torsion in `K_2` of a field of characteristic `p` (§3.4).
  **ArithmeticKTheory** owns rings of `S`-integers as localisations (§1.1), localisation for
  Dedekind domains and injectivity of `K_2(O_{F,S}) → K_2(F)` (§§2.1, 2.4), Quillen's
  finite-generation criterion for a Dedekind domain with finite Picard group (§3.2), and finite
  generation of the K-groups of rings of `S`-integers of number fields with finiteness of their
  positive even groups (§§3.2–3.4). It does not treat curves over finite fields; their finite
  generation is §5.5 here.
- **KTheoryFiniteLocalFields** §§3.0, 3.0a and 5.17 owns the shared Bloch complexes, field diagonal, norm-residue comparison, integral and coefficient motivic-to-K towers, Bloch–Gabber–Kato and Geisser–Levine. **MotivesAndAlgebraicCycles** §§4.7–4.8 consumes the same complexes and maps; §4.4 owns the Suslin–Tate weight-one complex. MotivesAndAlgebraicCycles §4.17 owns its perfect-field higher-Chow comparison. The arbitrary-field weight-one and field-limit adapters are §4.0b here. **SchemeKTheoryOperations** owns the operations in its stated regular ample-family scope; §4.0a here extends pullback-compatible operations to noetherian schemes. **MotivicEtaleKTheory** §2.3 owns the supported rational cycle-to-K comparison for every regular quasi-projective scheme over any field, including the full-support curve specialisation. Its §2.2 identifies the smooth comparison with the universal character. The rational regular-curve comparison, supported cycle construction and weight decomposition belong to those suppliers. Section 4.5 retains the integral motivic-tower extension to regular curves over arbitrary fields and its comparison with the supplied rational map. The compatibility of the supplied smooth motivic-to-K tower with Adams operations and finite-coefficient étale descent is §4.0c here; it is distinct from the rational character.
- **StableHomotopyKTheory** Layer 7 owns Moore-spectrum coefficients, the universal coefficient
  sequences and exact couples. **EtaleDualityAndPerverseSheaves** Layer 0 owns the trace and
  Kummer description of the étale cohomology of a smooth proper curve over an algebraically
  closed field. **WeightsInEtaleCohomology** R34.2 owns arithmetic Frobenius on Tate modules and
  geometric Frobenius on `H¹`. **ArithmeticGaloisDuality** owns the Hochschild–Serre spectral
  sequence with discrete coefficients (Layer R02.2) and with compact coefficients (Layer D7);
  **SelmerIwasawaCohomology** §2.7 identifies `H¹(Ẑ, M)` with `M/(F − 1)M` for a discrete torsion module with continuous action, a finitely generated `ℤ_ℓ`-module with its `ℓ`-adic topology, or a finite-dimensional `ℚ_ℓ`-space with continuous action, evaluating at the chosen arithmetic Frobenius generator; and
  **ProfiniteCohomology** (Tau Ceti roadmap) owns `Hⁱ(Ẑ, −)` and `cd_ℓ Ẑ = 1`.

The general scheme/function-field divisor comparison, its degree and principal-divisor laws are
AlgebraicCurves Layer 12D and the Tau Ceti declarations named below; §2.3 retains only the
Weierstrass chart and open-restriction diagram. The field indecomposable K₃/motivic edge is
K3BlochGroups §2.2; §4.6 retains its contribution to the curve coniveau filtration.
KTheoryLowDegrees §§12.2, 12.4 own the square-zero rank–Picard product and the pointed elliptic ring product; §2.6 reads their product in the concrete Weierstrass coordinates.
SchemeKTheoryOperations §6.9 owns the rational projectors and finite-coefficient generalized
weight decomposition, including every endpoint hypothesis. They are inputs to §4.5.
The function-field Steinberg homology input to Quillen's criterion is §5.5 here, whereas
ArithmeticKTheory §3.2 owns the general Dedekind criterion and its number-field homology proof.

The regulators of the classes constructed here, and every statement about `L`-values, belong to
EllipticRegulators and SpecialValuesBirchTate; the p-adic regulators belong to
PadicHodgeRegulators.

## Conventions

- **Curves.** A curve over a field `F` is a separated integral scheme of finite type over `F` of
  dimension one. "Regular curve" means all local rings are regular; over a perfect field a
  regular curve is smooth, over an imperfect field it need not be (`y² = x^p − t` over `𝔽_p(t)`).
  Closed points `x` have residue fields `k(x)` finite over `F`, of degree `deg x = [k(x) : F]`.
  Every sum over points runs over **all** closed points, not only rational ones.
- **The Weierstrass scheme.** For `W : WeierstrassCurve F` with `W.IsElliptic`, `E_W` denotes
  Tau Ceti's `WeierstrassCurve.projModel W` (ModularCurves Layer 1A), the cubic `Y²Z + a₁XYZ + a₃YZ² = X³ + a₂X²Z + a₄XZ² + a₆Z³` in
  `ℙ²_F` with origin `O = [0 : 1 : 0]`. Its function field is identified with
  `W.toAffine.FunctionField` by ModularCurves' `projModelFunctionFieldEquiv`, its closed points
  with Tau Ceti's places `TauCeti.Place F W.toAffine.FunctionField` (AlgebraicCurves Layer 12),
  and its rational points with `W.toAffine.Point`, the origin with the point at infinity.
- **K-theory.** `K_n(X)` is the K-theory of perfect complexes of SchemeKTheoryOperations; on the
  regular schemes used here it agrees with Quillen K-theory of vector bundles and, through the
  Cartan equivalence (SchemeKTheoryOperations §2.6), with `G_n(X)`. `K_0(X)` is identified with
  SchemeAndStackFoundations' `Chow.K0 X` through the vector-bundle comparison of
  SchemeKTheoryOperations §2.5 (a curve over a field is quasi-projective, so it has the resolution
  property), compatibly with the Chern characters of §7.2. `K_1` of a field
  is its unit group by the determinant; `K_2` of a field is Milnor's `K_2` by Matsumoto's theorem,
  written multiplicatively with symbols `{f, g}`.
- **The tame symbol.** For a discrete valuation `v` with residue field `k_v`,
  `∂_v{f, g} = (−1)^{v(f)v(g)} · (f^{v(g)} / g^{v(f)})‾ ∈ k_v^×`, so that `∂_v{u, π} = ū` and
  `∂_v{π, u} = ū⁻¹` for a uniformiser `π` and a unit `u`. This is K2SymbolsBrauer's convention
  and Dokchitser–de Jeu–Zagier's (3.1); the symbol of Weibel's Lemma III.6.3 is its inverse. The
  degree-two boundary of the localisation sequence is `⊕_x ∂_x` when localisation is normalised
  left-linearly; with Weibel's right-linear normalisation it is the inverse. Inverting a map
  changes no kernel or image, so every exactness and certificate statement reads the same in both.
- **Residue units.** For a place `P` and `f` with `ord_P f = 0`, `TauCeti.Place.residueUnit` is the
  residue of `f` in `P.ResidueField^×`; the tame value at `P` takes values in that group, not in
  `F^×`. Its norm to `F` is `TauCeti.Place.normResidue`.
- **Frobenius.** Over `F_q`, `π` denotes the `q`-power Frobenius on points, `P ↦ Point.map
  (FiniteField.frobeniusAlgHom F_q L) P`, which is arithmetic Frobenius on torsion points. The
  Tate twist `M(i)` multiplies the arithmetic Frobenius action by `q^i`, so Frobenius acts on
  `E[ℓ^∞](i)` by `q^i π`. The trace is `a_q = q + 1 − #E(F_q)`, Tau Ceti's
  `WeierstrassCurve.frobeniusTrace`, and `π² − a_q π + q = 0`.
- **S-integers.** For a number field `F` and a finite set `S` of finite places, `O_{F,S}` is the
  ring of `S`-integers (ArithmeticKTheory §1.1). A model over `O_{F,S}` is an `O_{F,S}`-scheme with a
  fixed identification of its generic fibre with `E_W`; morphisms of models respect that marking.
- **Universes.** Schemes, coefficient fields and their affine covers are small in one fixed universe; categories of sheaves and perfect complexes use the enlarged universe required by the suppliers. The marked-model acceptance signatures use `Scheme.{u}` and base rings in `Type u`.
- **Coefficients.** Rational statements are made in `K_n ⊗ ℚ`. Finite coefficients `ℤ/ℓ^ν` and
  divisible coefficients `ℚ_ℓ/ℤ_ℓ` are those of StableHomotopyKTheory Layer 7; integral,
  finite-coefficient and divisible-coefficient groups are never identified with one another or with
  completions.
- **Weibel's K-book** is cited by the numbering and the page numbers of the author-hosted combined
  draft of 29 August 2013, whose printed page `n` is page `n + 8` of the PDF.

## Exact supplier contracts

**From Mathlib.** `WeierstrassCurve`, `WeierstrassCurve.IsElliptic` (`Δ` a unit),
`WeierstrassCurve.Affine.Point` with its `AddCommGroup` structure and
`WeierstrassCurve.Affine.Point.map (f : F →ₐ[S] K) : (W⁄F).Point →+ (W⁄K).Point`;
`WeierstrassCurve.Affine.irreducible_polynomial` and `equation_iff_nonsingular`;
`WeierstrassCurve.Projective.Point.toAffineAddEquiv`; `AlgebraicGeometry.Proj`, `Proj.awayι`,
`Proj.isSeparated` and properness of `Proj` of a finitely generated graded algebra;
`Scheme.functionField` and `functionField_isFractionRing_of_isAffineOpen`; the morphism properties
`IsProper`, `Smooth`, `SmoothOfRelativeDimension`, `GeometricallyIntegral`, `IsIntegral`;
`IsRegularLocalRing`; `LocallyOfFinitePresentation.iff_locallyOfFiniteType` over a locally
noetherian target (Mathlib/AlgebraicGeometry/Noetherian.lean, lines 271–273); `CommRing.Pic`; `FiniteField.frobeniusAlgHom` (`x ↦ x^q` as an `F_q`-algebra
map); `AddSubgroup.torsionBy`; `IsDedekindDomain.flat_iff_torsion_eq_bot`; and
`AlgebraicGeometry.ext_of_isDominant_of_isSeparated` (two maps from a reduced scheme to a separated
one that agree on a dense open subscheme are equal).

**From Tau Ceti.** `TauCeti.Place k K` is a normalised discrete valuation of `K` trivial on `k`;
`Place.ord`, `Place.ResidueField`, `Place.residueUnit (f) (hf : P.ord f = 0)`,
`Place.normResidue`, `Place.degree`, `Place.exists_eq_zpow_mul_unit` (factorisation through a
uniformiser) and `Place.finite_setOf_ord_ne_zero` (a function has finitely many zeros and poles);
`TauCeti.Divisor` with `Divisor.principal`, `Divisor.divisorClass_eq_zero_iff`,
`Divisor.ker_degreeClass_eq_picZero` and `Divisor.conorm`;
`WeilDivisor.OrderSystem.classGroupAddEquivPicZeroProdInt` (degree splitting of the class group of
an order system with a point of weight one); `WeierstrassCurve.Affine.pointEquivDegreeOnePlace`,
`pointEquivDegreeZeroDivisorClass` and its computation rule
`val_pointEquivDegreeZeroDivisorClass_some` (the point `(x, y)` goes to the class of `(P) − (O)`),
`WeierstrassCurve.Affine.exists_principal_eq_zsmul_ofPoint_sub_infinity` (if `nP = 0` there is a function with divisor
`n(P) − n(O)`, with `n : ℤ`, in `TauCeti.AlgebraicGeometry.EllipticCurve.Affine.FunctionField.TorsionDivisor`), `isIntegrallyClosed_coordinateRing` and
`isDedekindDomain_coordinateRing_of_isIntegrallyClosed`; `TauCeti.Isogeny` with `degree`, `ker`,
`card_ker_le_degree`, `fieldPullback`, `sum_ramificationIdx_mul_inertiaDeg_eq_degree`,
`isSeparable_iff_pullbackDifferential_ne_zero`, `pullbackDifferential_invariantDifferential` and
`frobeniusIsogeny`; `SchemeWeilDivisor.classGroupToLineBundleClassHom` with
`classGroupToLineBundleClass_injective` and `isUnit_toLineBundleClass`;
`AlgebraicGeometry.LineBundleClass` (a commutative group);
`WeilDivisor.OrderSystem.ofScheme` and `Place.orderSystem`; `relativeDegree_ofPoint_of_section`;
`WeierstrassCurve.pointCount` and `WeierstrassCurve.frobeniusTrace`; `TauCeti.ExactK0`,
`TauCeti.AbelianK0` with `AbelianK0.lift`, `TauCeti.moduleResolutionEquiv`;
`Scheme.Modules.eulerCharBelow` with `eulerCharBelow_eq_add`; `TauCeti.Model` and
`TauCeti.genericFiberTowerIso`.

The same Tau Ceti contract includes `WeierstrassCurve.projModel W` for `W` over any commutative
ring, as `Proj` of the homogeneous coordinate ring, with `projModelOver`, `projModelZero`
(`projModelZero_projModelOver`), `isProper_projModelOver`, `isIntegral_projModel` over an integral
domain (no ellipticity), `smoothOfRelativeDimension_one_projModelOver` for `W.IsElliptic`,
`awayι_projModelOver`, the chart rings `Projective.ChartRing W i` with
`Projective.awayEquivChartRing` and `chartRingBaseChangeEquiv`, and `projModelVariableChangeIso`;
`SchemeWeilDivisor.equivFunctionFieldDivisor` with `degree_equivFunctionFieldDivisor`, `equivFunctionFieldDivisor_principalDivisor` and `linearlyEquivalent_equivFunctionFieldDivisor_iff` in TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/FunctionField.lean;
`SchemeWeilDivisor.classGroupAddEquivLineBundleClass` in
`TauCeti.AlgebraicGeometry.WeilDivisor.Scheme.Picard`: the class group of
`WeilDivisor.OrderSystem.ofScheme X` is additively equivalent to
`Additive (LineBundleClass X)` for integral noetherian `X` with codimension-one DVR stalks and
`∀ y, coheight y ≤ 1`; and `SchemeWeilDivisor.degreeOneEquivPicZero` in
the module TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/GenusOne.lean: for a proper genus-one curve, a chosen
degree-one point and the base field integrally closed in its function field, degree-one points
are in bijection with `Pic⁰` by `x ↦ O(x − x₀)`, with the addition/linear-equivalence rule; `WeierstrassCurve.hasse_bound` and `frobeniusTrace_sq_le_four_mul_card`; and the Tate
module `free_tateModule`, `finrank_tateModule`. The projective Weierstrass scheme is available to the Layer 1 acceptance statement; scheme K-groups have no carrier at the pins.

**From ModularCurves.** Layer 1A: `projModel W`, `projModelOver W`, `projModelZero W`,
`isProper_projModelOver`, `smoothOfRelativeDimension_one_projModelOver` (for `W.IsElliptic`),
`isIntegral_projModel`, and compatibility with base change. Layer 1B(1): over a field and for
`W.IsElliptic`, `projModelPointsEquiv` identifies sections of `projModelOver W` with
`W.toAffine.Point`, the zero section with the point at infinity; for `y² = x³` over `𝔽₅` the
projective cubic has six rational points and `W.toAffine.Point` five. Layer 1D(6): the scheme group
law agrees with Mathlib's on field-valued points. Layer 2A: `projModelFunctionFieldEquiv`. Layers 2B–2C:
the kernel of an isogeny as a finite locally free group scheme of rank the degree. Layer 2D: Picard
duality `φ^t = λ^{−1} ∘ Pic⁰(φ) ∘ λ` and the theorem of the square; with `[m]^∨ = [m]` (EllipticCurves
Layer 1) it gives `[m]^* = m` on `Pic⁰`.

**From EllipticCurves.** Layer 0.5: `P ↦ [(P) − (O)]` commutes with base change and Galois
action. Layer 1: `deg [m] = m²`, `E[m]` étale of order `m²` when `char F ∤ m`, the degree quadratic
form on `Hom(E', E)` and the geometric kernel of a separable isogeny with `deg` points. Layer 2:
`E[N] ≃+ (ℤ/N)²` over a separably closed field with `char ∤ N`, the Tate module `T_ℓE` free of
rank two with `V_ℓE / T_ℓE ≅ E[ℓ^∞]`, and the Tate twist. Layer 3: finiteness of `E(F_q)`,
`frobeniusTrace`, the Hasse bound `|a_q| ≤ 2√q` and `π² − [a_q]π + [q] = 0`.

**From AlgebraicCurves.** Layers 12A–12C: regular projective curves over `F` and function fields of
transcendence degree one are anti-equivalent, closed points corresponding to places with residue
degree `[k(x) : F]` (12A–12B, assembled in 12C); Layer 12C: a non-constant morphism of curves
corresponds to a function-field embedding, including its Weierstrass-isogeny specialisation transported through ModularCurves Layer 2A; Layer 12D: scheme Weil divisors correspond to
function-field divisors with matching degrees and principal divisors.

**From JacobianChallenge.** Layer A: `Pic(X)` as a group, the dictionary between Cartier divisor
classes and `Pic(X)` on an integral scheme with `Cl(X) ≅ Pic(X)` on a smooth curve (the noetherian
form with codimension-one DVR stalks is the Tau Ceti equivalence above), and the degree of
a line bundle on a proper curve. Layer B: for a proper curve over a field, `Hⁱ` of a coherent sheaf
is finite-dimensional and vanishes for `i ≥ 2`, the genus `g = dim H¹(O)` and Riemann–Roch
`χ(L) = deg L + 1 − g` when `H⁰(O) = F`. Layer D: the obstruction sequence relating `Pic(X_T)`,
the Picard functor and `H²(T, 𝔾_m)`, which a rational point splits.

**From StableReduction.** Layer 4 supplies blow-ups with affine charts, exceptional curves of the first kind, their contraction and blow-down universal property for models over a DVR. The global surface resolution, common resolution, contraction and factorisation used over a nonlocal Dedekind ring are the targets of §§6.2, 6.4–6.6 here. Layer 5: regular proper models of a smooth projective curve over a discrete
valuation ring, components `C_i` and multiplicities `m_i` of the special fibre with
`div(π) = Σ m_i C_i`, relative minimality as absence of exceptional curves of the first kind, and,
for positive genus, existence, uniqueness and the terminal property of the minimal regular model
(Stacks 55.8.4–55.8.6, 55.10.1–55.10.2).

**From RelativeJacobiansAndIntegralCurveModels.** §0.1 `DedekindModel`, marked morphisms,
`Hom.ext`, properness and total-space regularity predicates, restriction and height-one
localisation, with the category comparison to `TauCeti.Model` over a DVR. Section 6.1 uses its
proper/regular full subcategory and constructs the equivalence with the native acceptance adapter.
§5.1 `exists_regularProperModel`: every smooth
proper geometrically connected curve over the fraction field of an excellent Dedekind base has a
regular proper flat model with a chosen generic marking. Its global normalisation and resolution
construction supplies abstract existence over `Spec O_{F,S}`; §6.2 here resolves a specified integral
Weierstrass equation and compares the resulting marked model.

**From SchemeKTheoryOperations.** §2.2 `Scheme.K.pullback` for every morphism; §2.3
`Scheme.G.pushforward` for proper maps of noetherian schemes and `Scheme.K.pushforward` for proper
perfect maps, with `Scheme.K.pushforward_affine` (for `Spec B → Spec A` finite with `B` perfect over
`A`, pushforward is restriction of scalars); §2.4 Tor-independent base change and the projection
formula `f_*(x · f^*y) = f_*x · y` in all degrees; §2.6 `Scheme.cartan_isEquiv_of_regular`;
§2.7 continuity of scheme K-theory for qcqs inverse limits with affine transition maps,
by descent of finite diagrams of perfect complexes; §3.3
localisation spectra with supports and their oriented boundaries; §3.5 coherent supports and
dévissage; §3.6 `dvrBoundary` with `dvrBoundary_unitLoopClass` and `dvrBoundary_uniformizer`; §3.7
the Dedekind and curve sequences, and on a regular arithmetic surface `𝓧` over a Dedekind ring the
sequence `⊕_v G(𝓧_v) → K(𝓧) → K(𝓧_U)` together with the comparison of the vertical boundary at the
generic point of a fibre component with the DVR boundary of its local ring; §4.5 `coniveauSS` with
`d₁` and `d₁ ∘ d₁ = 0`, identified for a one-dimensional scheme with curve localisation; §§5.1–5.2
homotopy invariance for regular schemes; §5.5 the projective bundle theorem with basis
`O, O(−1), …` and on `ℙ¹` the coordinates `(π_*a, σ^*a − π_*a)`; §6.8 Adams operations `ψ^k`, multiplicative and compatible with pullback in its regular ample-family scope, and singular operations for quasi-projective schemes over a regular base; §6.9 rational weights and finite-coefficient generalized weights, with integral endpoint decompositions and additive Bockstein-compatible operations as hypotheses; the extension to every noetherian scheme is §4.0a here; §6.11 the Gysin weight shift
`ψ^k j_* = k^c j_* ψ^k` for a closed immersion of pure codimension `c` with trivial conormal bundle;
§7.6 the self-intersection formula `i^*i_* = λ_{−1}(I/I²) ·` and `P^*P_* = 0` for a rational point
of a regular curve.

**From GeneralAlgebraicKTheory.** §2.4 `pi1QEquivExactK0`; §2.5 `KGroup` (`K_n(E) = π_{n+1} BQ(E)`)
and `KGroup.map`; §3.2 `KGroup.ofRing_colimit` (K-theory of rings commutes with filtered colimits);
§4.6 the resolution theorem; §4.8 dévissage; §4.14 Serre localisation, natural for exact functors of
Serre pairs.

**From KTheoryLowDegrees.** §8.1: the determinant `K_1(A) → A^×`, `SK_1(A) = ker det`, the natural
splitting `K_1(A) ≅ A^× × SK_1(A)` for commutative `A`, and `K_1(F) = F^×`. §11.2: `SK_1(O_{F,S}) = 0`
for a ring of `S`-integers of a number field (Bass–Milnor–Serre). §12.2: for a connected nonempty
regular noetherian scheme `X` of dimension at most one, rank and determinant give an additive
equivalence `K_0(X) ≃ ℤ × Pic(X)` with inverse `(n, L) ↦ (n − 1)[O] + [L]`, multiplicative for the
square-zero product `(rs, L^{⊗s} ⊗ M^{⊗r})`, with `[O_y] ↦ (0, O(y))` at a codimension-one
closed point `y`. For `X = Spec F`, the unique point instead has `[O_y] = [O_X] ↦ (1, O_X)`.
§12.3: on `ℙ¹_F`, the
rank–Pic coordinates `(r, d)` and projective-bundle coordinates `(a, b)` are related by
`(r, d) = (a + b, −b)`. §12.4 supplies the pointed elliptic decomposition
`K_0(E) ≃ ℤ ⊕ ℤ ⊕ E(F)` through `P ↦ O(P−O)`, with the product of §12.2.

**From K2SymbolsBrauer.** §§5.12, 6.16: `K^M_n(F_q) = 0` for `n ≥ 2` and `K_2(F_q) = 0`; §§7.2, 8.3:
the identification with Matsumoto's presentation; §8.2: the graded map `K^M_* → K_*`;
§10.32c: finite generation of positive-degree Milnor tame-residue kernels over global function
fields, `[F : F^p] = p`, and `p`-divisibility of `K^M_n(F)` for `n ≥ 2`;
§10.33:
Bass–Tate's `K^M_n(F) = 0` for `n ≥ 3` when `F` has transcendence degree one over a finite field.
§§9.2–9.4: the tame symbol in the convention above, its Steinberg and bimultiplicativity
properties and independence of the uniformiser; §9.7: the ramification formula `∂_w = (∂_v)^e`
along a valued extension; §§10.21, 10.27, 11.6: the norm-residue formula `∂_v ∘ N = ∏_{w | v} N_{k_w / k_v} ∘ ∂_w` when the integral closure is finite (written additively there); §9.13:
finiteness of support; §§9.11, 9.15: the specialisation maps and higher Milnor residues; §11.1:
the localisation boundary of a DVR in both normalisations. §10.29: Weil reciprocity
`Σ_P N_{k(P)/F} ∂_P(x) = 0` for `x ∈ K^M_{n+1}` of a function field of one variable, and §10.30
the case `∏_x N_{k(x)/F} ∂_x{f, g} = 1` on a proper regular curve. §12.11:
`K_2(ℚ) ≅ ℤ/2 ⊕ ⊕_{p odd} 𝔽_p^×`; §12.1: the unramified subgroup.

**From K3BlochGroups.** §2.1 `K3ind` (the cokernel of `K^M_3 → K_3`); §2.2 the injectivity of
`K^M_3(F) → K_3(F)` for every field; §2.5 `dim K_3(F) ⊗ ℚ = r_2` for a number field.

**From GeneralAlgebraicKTheory and KTheoryFiniteLocalFields.** GeneralAlgebraicKTheory §13.8c
(`finiteFieldKGroups`, Quillen's computation, consumed by KTheoryFiniteLocalFields Layer 1):
`K_{2i}(F_q) = 0` and `K_{2i−1}(F_q) ≅ ℤ/(q^i − 1)` for `i ≥ 1`. KTheoryFiniteLocalFields §1.5:
restriction and transfer for finite fields; §1.6: `K_{2i−1}(F̄_p) ≅ ⊕_{ℓ ≠ p} ℚ_ℓ/ℤ_ℓ(i)`; §3.4:
`K_2(F)[p] = 0` for every field `F` of characteristic `p`. §3.0 `blochGabberKato` and
`milnor_no_p_torsion`: differential and logarithmic-Witt symbols for every characteristic-`p` field,
with field, coefficient and residue naturality. §3.0a `motivicCycles`: integral Bloch cycle complexes
on separated finite-type schemes over any field, with derived coefficients, localisation, homotopy,
products and transfers. Its `motivicToK` supplies `H^n(F,ℤ(n)) ≅ K^M_n(F)` for every field, including
inseparable norms, the norm-residue comparison for positive invertible coefficients, and the
convergent integral and coefficient motivic-to-K towers on smooth schemes over perfect fields,
with diagonal symbol, localisation, coefficient and transfer compatibility. On a field, for `i≥0`,
`H^a(F,ℤ(i)) = 0` for `a>i`: the cycle degree `2i−a<i` has no codimension-`i` generators.
§5.17 `geisserLevine_motivicConcentration` and `geisserLevine_fieldComparison`: for every field
of characteristic `p`, `n≥0`, `ν≥1`, the coefficient diagonal `K^M_n(F)/p^ν ≅ K_n(F;ℤ/p^ν)`,
no `p`-torsion, and uniquely `p`-divisible kernel and cokernel of the integral symbol map,
with field-map, norm and coefficient naturality (Weibel, VI.4.7, p. 485).

**From ArithmeticKTheory.** §1.1: `O_{F,S}` as a localisation of `O_F`, and the principal-open
description after inverting finitely many primes using the torsion class group. §§2.1, 2.4: the
localisation sequence of a Dedekind domain and injectivity of `K_2(O_{F,S}) → K_2(F)`. §3.2:
Quillen's criterion, for every Dedekind domain `R` with fraction field `K`: if `Pic(R)` is finite
and every `H_q(Aut_R(P); St(P ⊗ K))` is finitely generated, then every `K_n(R)` is finitely
generated. §§3.2–3.4: finite generation of `K_n(O_{F,S})` and finiteness of its positive even
groups for a number field `F`. ArithmeticKTheory does not treat curves over finite fields.

**From MotivesAndAlgebraicCycles.** §4.4: the Suslin–Tate complex and its weight-one identification with `𝔾_m[−1]` over every field. §§4.7–4.8 consume KTheoryFiniteLocalFields §3.0a’s same Bloch complexes, localisation, flat homotopy invariance and cycle descent. Section 4.17 supplies the perfect-field comparison; §4.0b here supplies the arbitrary-field weight-one and field-limit adapters.

**From EnhancedDerivedSheaves.** E0 and E1.2–E1.4 supply enhanced category and functor carriers,
derived pullback, tensor and coherent composition; §4.0a uses these for derived exterior powers.
**From EtaleCohomologyFoundations.** F.0.1–F.0.3 and F.1 supply finite étale coefficients,
Tate twists and derived cohomology diagrams for §4.0c. MotivesAndAlgebraicCycles §4.3 supplies
the Nisnevich topology and sheaves with transfers on the same smooth schemes.

**From MotivicEtaleKTheory.** §2.3 supplies the supported and absolute rational cycle-to-K
isomorphisms for regular quasi-projective finite-type schemes over every field, naturally for flat
pullback and localization with its boundary-sign adapter. In full support,
`CH^j(X,n) ⊗ ℚ ≅ K_n(X)_ℚ^{(j)}`. Section 2.2 identifies this map on smooth schemes with the universal
higher character and the diagonal symbol. No finite-coefficient étale descent is part of this contract.

**From DeligneWeightsAndPurity.** DWP.1 §§1.4, 1.6–1.7: the Weil bound for every smooth
projective geometrically connected curve over a finite field in every extension degree; the
base-point-free curve/Jacobian `H¹` comparison; the `2g` Frobenius roots of the Jacobian, of
absolute value `√q`, paired by `α ↦ q/α` by DWP.0 §0.2(iii) because their characteristic
polynomial has integer coefficients. These are used only for closed-point degrees and
cohomology descent, independently of later purity results. The elliptic specialisation continues
to use EllipticCurves' Hasse bound.

**From StableHomotopyKTheory, EtaleDualityAndPerverseSheaves, WeightsInEtaleCohomology,
ArithmeticGaloisDuality, SelmerIwasawaCohomology and ProfiniteCohomology.** StableHomotopyKTheory §7.1–7.4 and §7.8:
Moore spectra, `0 → K_n ⊗ ℤ/m → K_n(ℤ/m) → K_{n−1}[m] → 0` and its `ℚ_ℓ/ℤ_ℓ` colimit; §§7.21–7.29
filtered spectra, exact couples and convergence. EtaleDualityAndPerverseSheaves §0.3 `curveTrace` and
`curveH1Duality` for a smooth proper geometrically connected curve `X̄` over an algebraically closed field and every positive integer `n` invertible in that field:
`H¹(X̄, μ_n) = J(X̄)[n]` by Kummer theory and `H²(X̄, μ_n) ≅ ℤ/n` by the trace; §0.5 the global
pairings. WeightsInEtaleCohomology R34.2: arithmetic Frobenius `π` on `T_ℓ E` has characteristic
polynomial `X² − a_q X + q`; under `H¹(Ē, ℚ_ℓ) ≅ Hom(V_ℓE, ℚ_ℓ)`, arithmetic Frobenius acts by `(π⁻¹)ᵗ` and geometric Frobenius by `πᵗ`. Arithmetic Frobenius on `H¹(Ē, ℚ_ℓ(j))` therefore has eigenvalues `q^j/α`.
ArithmeticGaloisDuality R02.2: the Hochschild–Serre spectral sequence with discrete coefficients;
Layer D7: its form with compact coefficients. SelmerIwasawaCohomology §2.7: `H¹(Ẑ, M) ≅ M/(F − 1)M`
for a discrete torsion module with continuous action, a finitely generated `ℤ_ℓ`-module with its
`ℓ`-adic topology, or a finite-dimensional `ℚ_ℓ`-space with continuous action, by evaluation at the
chosen arithmetic Frobenius generator. For the trivial discrete module `ℤ`, continuous `H¹` is zero
while the coinvariants are `ℤ`; this module is outside the contract. ProfiniteCohomology Layers 10–11 and its `Ẑ` worked example:
`H²(Ẑ, M) = 0` for divisible or torsion `M`, and `cd_ℓ Ẑ = 1`.

## How to read the build

Layer 1 fixes the elliptic curve as a scheme and compares every scheme-theoretic notion used later
(charts, function field, points, isogenies) with the existing function-field theory. Layer 2
computes `K_0` of a curve and of an elliptic curve. Layer 3 is the localisation sequence of a regular
curve in degrees zero to three, the identification of its boundaries and its naturality. Layer 4 builds the motivic adapters, then
extracts `SK_1`, the coniveau description of `K_3` and the Adams weights. Layer 5 develops
functoriality along isogenies and the projective line, then proves Harder's theorem and the
complete finite-field computation. Layer 6 resolves specified integral Weierstrass models, imports abstract regular-model existence,
and constructs the minimal regular model over `O_{F,S}` and the integral part of `K_2`. Layer 7 constructs symbol classes in the kernel of the tame
symbol by finite certificates, Bloch's classes, transfer and Galois descent. Layer 8 works three
examples that test the whole interface.

Assembled, the roadmap provides, for every elliptic curve E over a field: `K_0, …, K_3` of E, of
its function field and of its residue fields from the one K-theory functor of
SchemeKTheoryOperations; the computation of `K_0(E)` (§2.7); localisation and coniveau (§§3.1–3.2,
4.3–4.4); functoriality (§§5.1–5.3); the rational symbol interface (§§7.2, 7.7–7.9); and, over a
number field, the arithmetic-integral symbol interface (§§6.8, 6.10, 7.3). No statement asserts
finite generation of, or an explicit abstract-group classification of, any K-group of an elliptic
curve over a number field; over a finite field the classification is complete (§5.11).

The acceptance test in Suggested.lean states `EllipticScheme.geometricallyIntegral`, `card_twistedFrobeniusKernel`, `exists_minimalRegularProperModel`, `locallyMinimal_terminal`, `minimal_unique`, `tame_last_point` and `blochCorrection`. Its simple definitions are `twistedFrobeniusKernel`, `RegularProperModel`, `RegularProperModel.genericFibreInclusion`, `RegularProperModel.Hom`, `RegularProperModel.IsMinimal`, `tameValue`, `SymbolCandidate` and `SymbolCandidate.tame`. Scheme K-groups, the motivic tower and étale cohomology lack carriers for the other headlines. An excellence predicate is needed for the broader excellent-Dedekind model statements; the S-integer statements use the native `Set.integer` subalgebra and the projective Weierstrass scheme.

## Layer 1: The Weierstrass curve as a scheme

Every K-group in this roadmap is a K-group of the scheme `E_W`, while every explicit computation
(divisors, residues, isogeny degrees, torsion functions) is carried out with Tau Ceti's
function-field theory of `W`. This layer fixes the dictionary between the two. It constructs
nothing that ModularCurves constructs: the scheme, its structure morphism, zero section,
properness and smoothness are ModularCurves Layer 1A.

### 1.1 The Weierstrass scheme over a field and its charts

Let `W` be a Weierstrass curve over a field `F` with `W.IsElliptic`. Write `E_W` for Tau Ceti's
`WeierstrassCurve.projModel W` (ModularCurves Layer 1A), the closed subscheme of `ℙ²_F` cut out by the
homogeneous cubic `G = Y²Z + a₁XYZ + a₃YZ² − X³ − a₂X²Z − a₄XZ² − a₆Z³`, that is `Proj` of the graded
quotient `F[X, Y, Z]/(G)`, with structure morphism `projModelOver W` and zero section
`O = projModelZero W`, the point `[0 : 1 : 0]`. The notation `E_W` throughout refers to this
supplied scheme; it introduces no new scheme carrier.

Prove the chart description that the rest of the roadmap uses. The standard opens are
`D₊(Z)` and `D₊(Y)`; Tau Ceti identifies the ring of each chart with `Projective.ChartRing W i`, the
quotient of `F[X, Y, Z]` by G and `Xᵢ − 1` (`awayEquivChartRing`). Prove EllipticScheme.charts: for
`Xᵢ = Z` this ring is Mathlib's W.toAffine.CoordinateRing, so `D₊(Z)` is isomorphic over `F` to
`Spec W.toAffine.CoordinateRing` through `Proj.awayι` (dehomogenisation at Z), and `D₊(Y)` is the
affine scheme of the dehomogenisation at Y. Prove EllipticScheme.cover:
`D₊(Z) ∪ D₊(Y) = E_W`, because a point with `Y = Z = 0` on the cubic has `X³ = 0`, hence `X = 0`,
which no point of `ℙ²` satisfies. Prove EllipticScheme.zeroSection_mem: under the two-chart comparison, the supplied zero section
is the closed point in `D₊(Y) − D₊(Z)` with residue field `F`
(Poonen, *Rational points on varieties*, §5.7.6, display (5.7.29), PDF p. 158). *Needs:* ModularCurves Layer 1A; Mathlib `Proj`,
`Proj.awayι`, `WeierstrassCurve.IsElliptic`.

**Checks.**

- `D₊(Z) ∪ D₊(Y) = E_W`; a definition using `D₊(Z)` alone misses the origin.
- `D₊(Z) ≅ Spec W.toAffine.CoordinateRing` over `F`, so the affine
  function-field theory applies to the generic point.
- the zero section lies in `D₊(Y)` and not in `D₊(Z)`, at the closed point
  `[0 : 1 : 0]` with residue field `F`.
- for `y² = x³ − x` over `𝔽₅`, `E_W(𝔽₅)` has 8 elements and the group is
  `ℤ/4 × ℤ/2`.
- for `y² = x³` over `𝔽₅` (discriminant zero) the projective cubic has six
  `𝔽₅`-points while `W.toAffine.Point` has five, and the cubic is not smooth at `[0 : 0 : 1]`; a
  version that drops `W.IsElliptic`, or uses only nonsingular points, does not see this.

### 1.2 Smoothness, properness and geometric integrality

Prove `EllipticScheme.geometricallyIntegral` for every Weierstrass curve `W` over `F` (ellipticity
is not needed): `E_W` is geometrically integral over `F`. Separately prove that it has dimension one, with `H⁰(E_W, O) = F` and
`dim_F H¹(E_W, O) = 1`. Integrality over every extension field follows from Tau Ceti's
`isIntegral_projModel` and the compatibility of the charts with base change
(`chartRingBaseChangeEquiv`); the acceptance statement tests geometric integrality as a property of the
morphism. The cohomology target includes the dimension of H¹. The cubic G is irreducible over every extension field `K`: it is not
divisible by Z, since `G(X, Y, 0) = −X³`, and its dehomogenisation is irreducible, since a factor of
`y`-degree zero divides the leading coefficient `1`, and a factor of `y`-degree one would give
`g ∈ K[x]` with `g² + a₁xg + a₃g` of degree three, impossible because that degree is either
`2 deg g ≥ 4` or at most two (Mathlib's `WeierstrassCurve.Affine.irreducible_polynomial`). A plane
curve cut out by an irreducible form is a curve (Stacks, Lemma 53.9.2, tag 0BYC); applied over
`F̄` it gives geometric integrality, and a plane curve of degree three has `H⁰ = F` and genus
`(3 − 1)(3 − 2)/2 = 1` (Stacks, Lemma 53.9.3, tag 0BYD). Consequently `Scheme.functionField E_W` is a
field (Mathlib's instance needs `IsIntegral`). *Needs:* §1.1; JacobianChallenge Layer B; Mathlib
`GeometricallyIntegral`, `IsIntegral`, `Scheme.functionField`.

**Checks.**

- `χ(E_W, O) = 1 − 1 = 0`.
- `Scheme.functionField E_W` is a field.
- `y² = x³` is geometrically integral but not smooth, so integrality
  does not imply smoothness.

### 1.3 Regularity in the form the divisor API uses

Prove EllipticScheme.isRegular: if `W.IsElliptic`, then `E_W` is noetherian, every stalk is a
regular local ring, every point has coheight at most one, and the stalk at every codimension-one
point is a discrete valuation ring. These are exactly the hypotheses `[IsIntegral X]`,
`[IsNoetherian X]`, `[∀ y : CodimensionOnePoint X, IsDiscreteValuationRing (stalk y)]` and
`∀ y, coheight y ≤ 1` of Tau Ceti's `SchemeWeilDivisor.toInvertibleSheaf` and
classGroupToLineBundleClassHom. The proof: smooth over a field implies regular local rings
(SchemeAndStackFoundations §4.13, IsRegular.of_smooth); a
one-dimensional regular local ring is a discrete valuation ring; `Proj` of a finitely generated
graded `F`-algebra is noetherian (Stacks, Lemma 29.15.6, tag 01T6, for the finite-type scheme;
Lemma 10.140.3 for smooth algebras over a field; Lemma 10.119.7, tag 00PD, for dimension-one
regular local rings). *Needs:* §§1.1–1.2; Mathlib
`IsRegularLocalRing`; Tau Ceti `SchemeWeilDivisor.classGroupToLineBundleClassHom`.

**Checks.**

- Tau Ceti's classGroupToLineBundleClassHom applies to
  `E_W`.
- every closed point's local ring is a discrete valuation ring.
- over `𝔽_p(t)` the regular curve `y² = x^p − t` is not smooth, so the
  hypothesis package is regularity, not smoothness.

### 1.4 The function field and closed points

Prove EllipticScheme.closedPointEquivPlace_compat: compose the supplied closed-point/place
correspondence with the supplied function-field comparison, and identify its valuations and residue
maps with Tau Ceti's Weierstrass-place API. This differs from the general curve correspondence by
fixing the actual `F`-algebra map on the affine chart: for each closed point `x`, transport of
ord_x is P.ord, its residue-field isomorphism intertwines reduction of local units with
P.residueUnit, and `[k(x) : F] = P.degree`. At the origin it gives `Place.infinity W`; at rational
points it agrees with pointEquivDegreeOnePlace (AlgebraicCurves Layers 12A–12C and ModularCurves
Layer 2A; Stacks, Theorem 53.2.6, tag 0BY1). This is what turns every statement of Layer 3 about the K-theory of the function field into a
statement about the existing function-field API. W.toAffine.CoordinateRing is a Dedekind domain
for elliptic `W` by Tau Ceti's `isIntegrallyClosed_coordinateRing` and
`isDedekindDomain_coordinateRing_of_isIntegrallyClosed`; it is derived, not assumed. *Needs:*
§§1.1–1.2; ModularCurves Layer 2A; AlgebraicCurves Layers 12A–12C; Tau Ceti
pointEquivDegreeOnePlace.

**Checks.**

- the transported closed-point correspondence uses the supplied
  `projModelFunctionFieldEquiv` as an `F`-algebra map, and intertwines orders and residue maps;
  an arbitrary abstract field isomorphism would not suffice.
- the origin corresponds to the place at infinity, of degree one
  (`TauCeti.Place.degree_infinity`).
- on `y² = x³ + 1` over `ℚ`, the closed point `x² + 2x + 4 = 0, y = 3`
  has residue field `ℚ(√−3)` and corresponds to a place of degree two, not to a point of
  `W.toAffine.Point`.

### 1.5 Rational points and the group law

Prove EllipticScheme.pointsDivisor_compat: the supplied field-valued points equivalence and
group law commute with the Weierstrass-place and divisor-class identifications of Tau Ceti.
Precisely, a section corresponding to `P : W.toAffine.Point` gives the degree-one place
`pointEquivDegreeOnePlace P`, and its divisor difference from the zero section gives
`pointEquivDegreeZeroDivisorClass P`. Also show the same diagram after the supplied projective
and Jacobian coordinate changes (Projective.Point.toAffineAddEquiv,
`Jacobian.Point.toAffineAddEquiv`). The target adds these diagrams, rather than another
points equivalence or group law (Weibel, *K-book*, Example I.5.16, pp. 58–59, for the divisor
interpretation; Tau Ceti's computation rule `val_pointEquivDegreeZeroDivisorClass_some`).
*Needs:* §§1.1, 1.4; ModularCurves Layers 1B, 1D; Tau Ceti's two point/place/class equivalences.

**Checks.**

- for `y² = x³ − x` over `𝔽₅` both sides have eight elements and the group is
  `ℤ/4 × ℤ/2`.
- the zero section corresponds to `Point.zero` and `[x : y : 1]` to
  `Point.some x y h`.
- for `y² = x³` over `𝔽₅` the cubic has six `𝔽₅`-points and
  `W.toAffine.Point` five, so the ellipticity hypothesis cannot be dropped.

### 1.6 Isogenies as finite morphisms, and the zero morphism

Tau Ceti's isogeny theory is a theory of function fields: `TauCeti.Isogeny` is an embedding of
function fields with a degree, a separability condition, a kernel of rational points and a pullback
of differentials. Use AlgebraicCurves Layer 12C’s isogeny-to-scheme-morphism correspondence, transported through ModularCurves Layer 2A’s `projModelFunctionFieldEquiv` (Stacks, Theorem 53.2.6, tag 0BY1). A non-zero isogeny `φ : E' → E` gives a finite pointed morphism `E_{W'} → E_W`. The additional targets here are the following compatibility diagrams:
- the degree of the morphism (its generic rank) is TauCeti.Isogeny.degree
  (Isogeny.toSchemeHom_degree);
- the morphism is separable exactly when the pinned isogeny is, which by
  `isSeparable_iff_pullbackDifferential_ne_zero` is the non-vanishing of the pullback of the
  invariant differential, and the invariant differential pulls back by
  `pullbackDifferential_invariantDifferential` (Isogeny.toSchemeHom_separable);
- the `F`-points of the scheme-theoretic kernel form TauCeti.Isogeny.ker, with
  `card_ker_le_degree`; the kernel group scheme, of rank the degree, is ModularCurves Layers 2B–2C's
  (Isogeny.toSchemeHom_ker);
- scheme pullback of divisors is TauCeti.Divisor.conorm along the function-field embedding, and
  `Σ_{x ↦ y} e_x f_x = deg φ` is `sum_ramificationIdx_mul_inertiaDeg_eq_degree`
  (Isogeny.toSchemeHom_pullback_divisor).

The zero morphism, the constant map to O, is a morphism of schemes outside this correspondence,
because it induces no embedding of function fields. Define it separately as zeroHom, and prove
zeroHom_pullback_lineBundle: it pulls every line bundle back to the trivial one; divisor pullback
along it is defined only for divisors whose support avoids O, where it is zero. *Needs:* §1.4;
AlgebraicCurves Layer 12C; ModularCurves Layers 2B–2C; Tau Ceti `TauCeti.Isogeny`,
TauCeti.Divisor.conorm.

**Checks.**

- the identity isogeny gives the identity morphism, of degree one.
- multiplication by m with `char F ∤ m` gives a finite étale morphism of degree
  `m²`.
- the zero morphism is not finite and is not in the image of toSchemeHom;
  `[0]^*L ≅ O` for every line bundle `L`.
- every point maps to the origin; a constant map to a nonzero point fails this
  Check even though it also trivialises line bundles.
- composing on either side with an origin-preserving isogeny is again
  zeroHom; the identity morphism fails this Check for a nonconstant isogeny.

### Examples

For `y² = x³ − x` over `𝔽₅` the scheme has eight rational points forming `ℤ/4 × ℤ/2`, the origin is
the only point on `Z = 0`, and the two charts cover. For `y² = x³` over `𝔽₅` the projective cubic has
six rational points, one of them the singular point `(0, 0)` which `W.toAffine.Point` omits.
On `y² = x³ + 1` over `ℚ` the closed point cut out by `x² + 2x + 4` and `y = 3` has degree two.

### Dependencies

ModularCurves Layers 1A, 1B, 1D, 2A, 2B; AlgebraicCurves Layer 12; JacobianChallenge Layer B;
Mathlib's Weierstrass, projective-spectrum and function-field APIs; Tau Ceti's places, divisors,
point–divisor-class equivalence and function-field isogenies.
## Layer 2: K₀ of a curve and of an elliptic curve

The zeroth K-group of a regular curve is determined by rank and determinant; for an elliptic curve
with a rational origin the determinant splits by degree and the point group. This layer assembles
that computation, fixes its ring structure, and records what the rational origin is used for.

### 2.1 Rank and determinant on K₀ of a curve

For a connected nonempty regular noetherian scheme `X` of dimension at most one, rank and determinant
give an isomorphism `rank ⊕ det : K_0(X) ≅ ℤ ⊕ Pic(X)` (Weibel, *K-book*, Proposition II.8.2.1,
p. 146, which also gives `SK_0(X) = 0`). This is KTheoryLowDegrees §12.2 (`regularCurve_rankDetEquiv`),
consumed here together with its class formulas:
`[L] ↦ (1, L)` for a line bundle `L`, in particular `[O_X] ↦ (1, O_X)`, and the skyscraper O_x at a
codimension-one closed point `x` maps to `(0, O(x))`, from the exact sequence
`0 → O(−x) → O → O_x → 0`. For `X = Spec F`, its unique point has `O_x = O_X`, hence rank one
and trivial determinant; the point-divisor formula does not apply. Prove
K0Curve.rankDet_natural: the isomorphism is natural for pullback along a morphism of such curves,
in particular along a finite morphism; KTheoryLowDegrees §12.2 supplies the compatibility with
localisation, that is with open immersions, and with extension of the base field. No separatedness
is needed (KTheoryLowDegrees §§12.1–12.2). Weibel's Example II.8.2.4, p. 147, is doubled affine
n-space for `n≥2`; it does not obstruct the curve theorem. Proper-curve and function-field
constructions below retain their own hypotheses. *Needs:* KTheoryLowDegrees §12.2; SchemeAndStackFoundations
§5.7; §1.3.

**Checks.**

- a skyscraper at a codimension-one closed point has rank zero and determinant `O(x)`;
  on `ℙ¹_F` a rational point therefore has rank–degree coordinates `(0, 1)`, fixing the positive sign.
- on `Spec F` the unique point has `[O_x] = 1` and rank one; it is not a rank-zero divisor class.
- `[O_X] = (1, O_X)`, the unit.
- on `ℙ¹_ℚ` the skyscraper at `V(t² + 1)` has determinant of degree two.
- on the affine line with doubled origin, `div(t)=0′+0″`, so the two origin classes are opposite;
  `Pic=ℤ` and `K_0=G_0=ℤ²`. Doubled affine two-space instead has vector-bundle `K_0=ℤ` and `G_0=ℤ²`.

### 2.2 The Euler characteristic and the pushforward to the base

Let `X` be a curve proper over `F` that is separated and regular. Define
eulerChar: `K_0(X) → ℤ` by `χ(M) = dim_F H⁰(X, M) − dim_F H¹(X, M)` on coherent sheaves; prove
eulerChar_additive (additivity on short exact sequences) and that it factors through
`K_0(X) ≅ G_0(X)`. In Tau Ceti terms, `χ` is `Scheme.Modules.eulerCharBelow` at `n = 2`, which is the
Euler characteristic once `Hⁱ` is finite-dimensional and `H²` vanishes (JacobianChallenge Layer B);
its additivity is `eulerCharBelow_eq_add` under those hypotheses, and the induced map out of `G_0` is
`TauCeti.AbelianK0.lift`. Write pushforwardToBase: `K_0(X) → K_0(F) = ℤ` for SchemeAndStackFoundations' Chow.kPushforward
along the structure morphism, `p_*[M] = Σ (−1)^i [R^i p_* M]` (Weibel, *K-book*, II.8.2.3, p. 147;
SchemeKTheoryOperations §2.3), and prove pushforwardToBase_eq_eulerChar. Riemann–Roch
riemannRoch: `χ(L) = deg L + χ(O_X)` is JacobianChallenge Layer B's, with degree from
Layer A; it becomes `deg L + 1 − g` when `H⁰(O_X) = F` and `g = dim_F H¹(O_X)` (Stacks, Lemma 53.5.2, tag 0BS6); it is consumed here, in the form the Checks use. A rational point has degree one (Tau Ceti's
`relativeDegree_ofPoint_of_section`). *Needs:* §2.1; JacobianChallenge Layers A–B;
SchemeKTheoryOperations §§2.3, 2.6; Tau Ceti eulerCharBelow, `AbelianK0.lift`.

The Euler-characteristic API has the following requirements.

- Finite coherent cohomology and vanishing above degree one identify the value with the supplied truncated Euler characteristic.
- Additivity descends the value to a homomorphism out of G₀ and hence K₀ under regular Cartan comparison.
- Structure pushforward is this homomorphism; for a line bundle the value is its degree plus `χ(O_X)`.

**Checks.**

- a rational point `x` has `χ(O_x) = 1 = deg O(x)`.
- on an elliptic curve `χ(O_E) = 0`, so `p_*[O_E] = 0`.
- `χ` is additive on short exact sequences of coherent sheaves.
- `χ` factors through `K_0(X)`.
- on `ℙ¹_F`, `χ(O(n)) = n + 1` while `deg O(n) = n`, so `χ` is not the degree.
- on `ℙ¹_ℚ` the closed point `V(t² + 1)` has `deg O(x) = 2 = χ(O_x)`.
- view `ℙ¹_{𝔽₄}` as a regular proper integral curve over `𝔽₂`. Then
  `χ(O) = 2`, `g = 0`, and `deg O = 0`; the unrestricted formula `deg L + 1 − g` would give one.

### 2.3 Line bundles and divisor classes

For an elliptic Weierstrass curve `E_W/F`, prove classGroupEquivPic_weierstrassCompatibility:
the scheme Weil-class/Picard equivalence, followed by the concrete function-field comparison of
§1.4, sends the class of each Weierstrass point divisor to the corresponding line bundle
`O_{E_W}(P)`, with the positive sign. Include the analogous square after restricting to any open
subcurve of E_W; only places with a centre in that open occur. Use the supplied general
scheme/function-field degree, principal-divisor and linear-equivalence comparison
(AlgebraicCurves Layer 12D; Tau Ceti `SchemeWeilDivisor.equivFunctionFieldDivisor`,
`degree_equivFunctionFieldDivisor`, `equivFunctionFieldDivisor_principalDivisor`) and the
scheme Picard equivalence, rather than constructing them. On the proper curve the resulting
degree is `Σ_x n_x[k(x):F]` (Weibel I.5.15, p. 58).
*Needs:* §§1.3–1.4; Tau Ceti `SchemeWeilDivisor.classGroupAddEquivLineBundleClass`;
JacobianChallenge Layer A; AlgebraicCurves Layer 12D.

**Checks.**

- the composite of the two supplied equivalences is additive and bijective, and its
  closed-point classes are `O(x)`, not `O(−x)`.
- `O_{E_W}(O)` has degree one.
- on `𝔸¹_F`, the point at infinity of `F(t)/F` is absent; `Cl(𝔸¹_F) = 0`
  while the full proper-model class group is `Cl(ℙ¹_F) = ℤ`.
- a principal divisor maps to the trivial class (Tau Ceti's
  toLineBundleClass_principalDivisor).

### 2.4 The Picard group of an elliptic curve

Prove picardDecomposition_weierstrassCompatibility: on an elliptic curve with rational origin O the degree splits
`Pic(E_W) ≅ ℤ ⊕ Pic⁰(E_W)`, and `Pic⁰(E_W)` is canonically `W.toAffine.Point`, the class of a point
`P` corresponding to the class of `(P) − (O)`. The function-field form is proved in Tau Ceti:
classGroupAddEquivPicZeroProdInt splits the class group of an order system with a weight-one
rational point by degree, and `pointEquivDegreeZeroDivisorClass` identifies the point group with
the degree-zero divisor classes of `W.toAffine.FunctionField`, with computation rule
`val_pointEquivDegreeZeroDivisorClass_some`; together, after exchanging factors, they give `Cl(F(W)/F) ≅ ℤ × W.toAffine.Point`.
This target adds the commutative diagram identifying the group-valued Weierstrass
point/class equivalence with the scheme genus-one bijection degreeOneEquivPicZero; it does not
reconstruct either supplied equivalence. The degree-first splitting then follows through §2.3 (Weibel, *K-book*,
Example I.5.16, pp. 58–59, over an algebraically closed field). The splitting depends on the chosen
origin. Without a point of degree one the degree map need not be onto: its image is `iℤ` with i
the index, an abstract splitting `Pic ≅ Pic⁰ ⊕ ℤ` still exists but its `ℤ`-component is not the
degree; for the conic `x² + y² + z² = 0` over `ℝ` the image is `2ℤ`. *Needs:* §§2.1, 2.3; Tau Ceti
classGroupAddEquivPicZeroProdInt, `pointEquivDegreeZeroDivisorClass`,
`Divisor.ker_degreeClass_eq_picZero`, Place.degree_infinity.

**Checks.**

- the class of `O(P)` has coordinates `(1, P)`.
- `O(O)` has coordinates `(1, O)`, so `n ↦ n[O(O)]` is the splitting.
- on the real conic `x² + y² + z² = 0` the degree has image `2ℤ`.

### 2.5 Descent of line-bundle classes

Let `X` be a proper geometrically integral curve over `F`, `F^s` a separable closure and
`G = Gal(F^s/F)`. Prove lineBundleDescent_injective: `Pic(X) → Pic(X_{F^s})^G` is injective; and
lineBundleDescent_of_rationalPoint: it is an isomorphism when `X(F)` is non-empty (Poonen,
*Rational points on varieties*, Exercise 6.10, PDF p. 217; the cokernel embeds into
`ker(Br F → Br X)`, Corollary 6.7.8, PDF p. 209). For `E_W` with its rational origin prove it
directly: an invariant class `c` of degree d satisfies
`c − d[O(O)] ∈ Pic⁰(E_{F^s})^G ≅ E(F^s)^G = E(F)`, because `P ↦ [(P) − (O)]` is Galois-equivariant
(EllipticCurves Layer 0.5), and degrees are preserved. Use the separable closure, not an algebraic
closure: over an imperfect field `Pic⁰(E_{F̄})^{Aut(F̄/F)}` can contain classes coming from
`E(F^{perf}) ⊋ E(F)`. The general relative statement belongs to ModularCurves Layer 2D; this target is
its pointed field-valued specialisation, the case `T = Spec F` of JacobianChallenge Layer D's
obstruction sequence written with Galois invariants. *Needs:* §2.4; EllipticCurves Layer 0.5;
ModularCurves Layer 2D; JacobianChallenge Layer D.

**Checks.**

- for `y²=x³−x` over `ℝ`, `O((0,0)−O)` is a nontrivial real line class of order two;
  its complexification is fixed by conjugation and descends to the same nonzero real point.
- for the conic `x² + y² + z² = 0` over `ℝ`, the degree-one class on
  `C_ℂ ≅ ℙ¹_ℂ` is `Gal(ℂ/ℝ)`-invariant but not in the image of `Pic(C)` (Poonen, Exercise 2.12,
  PDF p. 68).
- two line bundles on `E_W` that become isomorphic over `F^s` are
  isomorphic.

### 2.6 The ring structure

For `X` as in §2.1, KTheoryLowDegrees §12.2 makes `rank ⊕ det` a ring isomorphism when
`ℤ ⊕ Pic(X)` carries the product `(a₁, L₁)·(a₂, L₂) = (a₁a₂, L₁^{a₂} ⊗ L₂^{a₁})`, written additively
`(a₁a₂, a₂L₁ + a₁L₂)`: the square-zero extension `ℤ ⊕ M` of `ℤ` by the `ℤ`-module `M = Pic(X)`
(Mathlib's `TrivSqZeroExt ℤ M`), so `K̃_0(X) = Pic(X)` is an ideal of square zero. This rests on
`rank(E ⊗ E') = rank E · rank E'` and `det(E ⊗ E') = det(E)^{rank E'} ⊗ det(E')^{rank E}` (Weibel,
*K-book*, II.8.1, p. 145). Read this supplied ring isomorphism through the Weierstrass compatibility of §2.4: in coordinates
`(r, d, P) ∈ ℤ ⊕ ℤ ⊕ E(F)` (rank, degree of the determinant, point), the product is
`(r₁, d₁, P₁)·(r₂, d₂, P₂) = (r₁r₂, r₁d₂ + r₂d₁, r₁P₂ + r₂P₁)` with unit `(1, 0, O)`; this is not the
product ring. *Needs:* §§2.1, 2.4; KTheoryLowDegrees §12.2.

**Checks.**

- `[O_x]·[O_y] = 0` for codimension-one closed points `x, y`, including `x = y`;
  on `ℙ¹_F` this gives `(0, 1)² = (0, 0)` for a rational point.
- on `Spec F` the unique point instead has `[O_x]² = 1`, since its class is the unit of `K_0(F) = ℤ`.
- `([L] − 1)² = 0` for every line bundle `L`.
- `(0, 1, O)² = 0`, whereas with componentwise multiplication on the two integer coordinates
  the degree coordinate would instead square to one. No ring structure on `E(F)` is assumed.

### 2.7 K₀ of an elliptic curve

Use KTheoryLowDegrees §12.4’s pointed elliptic decomposition: for `E=E_W/F`, its coordinates
are rank, determinant degree d, and the point P with `det ≅ O(P+(d−1)O)`; its product is §12.2’s.
Prove K0Elliptic.weierstrassCompatibility: its point coordinate is the one obtained from
`pointEquivDegreeZeroDivisorClass` through §§1.5, 2.3–2.4, so the diagram with the concrete
Weierstrass point/divisor equivalence commutes, with `P ↦ O(P−O)`. The assertion includes
compatibility with base change and Galois action through §2.5. Over an algebraically closed field
this agrees with `ℤ ⊕ ℤ ⊕ J(X̄)` (Weibel, VI.6.4, p. 503, case `n=0`).
*Needs:* §§1.5, 2.3–2.6; KTheoryLowDegrees §§12.2, 12.4.

**Checks.**

- for `y² = x³ − x` over `𝔽₅`, `K_0(E) ≅ ℤ² ⊕ ℤ/4 ⊕ ℤ/2`.
- `(0, 1, O)² = 0` in `K_0(E)`.
- the skyscraper at a rational point `P` has coordinates `(0, 1, P)`, and at
  the origin `(0, 1, O)`. For `P=(2,1)` on `y²=x³−x` over `𝔽₅`, `2P=(0,0)` and
  `−P=(2,4)≠P`, so `[O_P]−[O_O]` has point coordinate P, not −P.

### Examples

On `ℙ¹_ℚ`, `K_0 ≅ ℤ ⊕ ℤ` by rank and degree, the skyscraper at `V(t² + 1)` is `(0, 2)` and `χ(O(n)) = n + 1`.
For `y² = x³ − x` over `𝔽₅`, `K_0 ≅ ℤ² ⊕ ℤ/4 ⊕ ℤ/2`, and the difference `[O_P] − [O_Q]` of two
skyscrapers at rational points is `(0, 0, P − Q)`, a class of finite order.

### Dependencies

Layer 1; KTheoryLowDegrees §§12.2, 12.4; JacobianChallenge Layers A–B; AlgebraicCurves Layer 12D;
SchemeAndStackFoundations §5.7; SchemeKTheoryOperations §§2.3, 2.6; EllipticCurves Layer 0.5;
ModularCurves Layer 2D; Tau Ceti's divisor-class and line-bundle APIs.
## Layer 3: The localisation sequence of a curve

The localisation sequence of a regular curve links the K-theory of the curve, of its function field
and of all its residue fields. This layer states it in degrees zero to three over all closed points,
identifies each boundary map, proves its naturality for open immersions and finite maps, and draws
the two injectivity consequences for `K_2` that later layers use.

### 3.1 The sequence over all closed points

Let `X` be a regular, separated, integral curve over a field `F` with function field `F(X)`. Prove
curveLocalisation: there is a long exact sequence
```text
K₃(X) → K₃(F(X)) → ⊕ₓ K₂(k(x)) → K₂(X) → K₂(F(X))
      → ⊕ₓ k(x)^× → K₁(X) → F(X)^× → ⊕ₓ ℤ → K₀(X) → ℤ → 0,
```
where `x` runs over all closed points, the maps into the sums are the residues, the maps out of them
are the transfers `(i_x)_*`, and the last map is the generic rank `K_0(X) → K_0(F(X)) = ℤ`, onto
because `[O_X] ↦ 1` (Weibel, *K-book*, V.6.12, p. 416). The sequence is SchemeKTheoryOperations
§3.7's localisation sequence of a one-dimensional noetherian scheme, from the sum over its closed
points through `G(X)` to K-theory of the function field, read through the Cartan equivalence
`K(X) ≃ G(X)` for regular `X` (SchemeKTheoryOperations §2.6); that sequence comes from Quillen's
localisation for the Serre subcategory `M_0(X)` of coherent sheaves of finite length, with
`M(X)/M_0(X) ≅ M(F(X))` (GeneralAlgebraicKTheory §4.14), and dévissage
`K(M_0(X)) ≃ ⊕_x K(k(x))` (GeneralAlgebraicKTheory §4.8; SchemeKTheoryOperations §3.5). The target
here is its form for a regular curve in degrees zero to three, with the terms and the tail
identified. It is not obtained by gluing affine sequences, which do not glue. The
sum runs over all closed points: restricting to rational points breaks exactness. *Needs:* §§1.4,
2.1; GeneralAlgebraicKTheory Layers 2 and 4; SchemeKTheoryOperations §§2.6, 3.5, 3.7;
KTheoryLowDegrees §8.1.

**Checks.**

- On `ℙ¹_ℚ`, `div(t²+1)=[V(t²+1)]−2[∞]`; the degree is `2−2=0`, so the two terms have the same image in `Pic(ℙ¹)=ℤ`.
- For `{t,t²+1}` the tame values at `0`, `V(t²+1)` and `∞` are `1`, i and `1`; the quadratic norm is `N(i)=1`. Reversing the symbol gives `−i` at the quadratic point and still norm one.
- on `ℙ¹_ℚ`, `(t² + 1)/(t² + 2)` has trivial divisor at every
  rational point and is not constant; only the closed points `V(t² + 1)`, `V(t² + 2)` see it.
- the bottom row is the divisor sequence
  `F(X)^× → Div(X) → Pic(X) → 0` direct-summed with the rank `K_0(X) → ℤ`.
- replacing the generic rank by `a ↦ deg(det a)` breaks exactness:
  on `ℙ¹_ℚ`, `[O_X]` has degree zero and is not in the image of the sum over closed points.

### 3.2 The degree-two boundary is the tame symbol

Let `x` be a closed point with valuation v_x on `F(X)`. Prove curveBoundary_two_eq_tame: with
localisation normalised left-linearly, the `x`-component of `K_2(F(X)) → ⊕_x k(x)^×` is
K2SymbolsBrauer's tame symbol `∂_x{f, g} = (−1)^{v(f)v(g)} · (f^{v(g)}/g^{v(f)})‾`, so
`∂_x{u, π} = ū` and `∂_x{π, u} = ū⁻¹` for a uniformiser `π` and a unit `u`. With Weibel's right-linear
normalisation, in which Quillen's boundary satisfies `∂{π, u} = ū`, the boundary is the inverse of
`∂_x` (Weibel, *K-book*, V.6.6, p. 409, and Lemma III.6.3, p. 234). The comparison for a single
discrete valuation ring, in both normalisations, is K2SymbolsBrauer §11.1 (localisation boundary);
this target specialises it to the local ring of `X` at each closed point through
SchemeKTheoryOperations §§3.6–3.7, which identify the `x`-component of the curve boundary with the
boundary of `O_{X,x}`. The residue field may be larger than `F`, and the symbol lands in
`k(x)^×`. The Steinberg relation and independence of the uniformiser come from K2SymbolsBrauer
§§9.3–9.4. *Needs:* §3.1; K2SymbolsBrauer §§9.2–9.4, 11.1; SchemeKTheoryOperations §§3.6–3.7.

**Checks.**

- `∂_x{u, π} = ū` and `∂_x{π, u} = ū⁻¹`.
- on `{π, u}` the boundary gives `ū⁻¹`, the inverse of the K-book value.
- on `ℙ¹_ℚ` at `x = V(t² + 1)`, where `t² + 1` is a uniformiser and t a
  unit, `∂_x{t, t² + 1} = t̄ = i ∈ ℚ(i)^×`, a value outside `ℚ^×`, and `∂_x{t² + 1, t} = −i`.
- the kernel and image of the boundary are the same in both
  normalisations.

### 3.3 The divisor boundary and the generic rank

Prove curveBoundary_one_eq_div: the boundary `K_1(F(X)) = F(X)^× → ⊕_x K_0(k(x)) = ⊕_x ℤ` is the
divisor `f ↦ Σ_x ord_x(f) · [x]`: SchemeKTheoryOperations §3.7 identifies the codimension-one
component of the boundary with the length order, which at the discrete valuation ring of a closed
point of the regular curve is ord_x, the boundary of a parameter s being `[R/sR] = [k(x)]`
(Weibel, *K-book*, V.6.6, p. 409, through V.6.1.2). Prove
curveTransfer_zero: the transfer `⊕_x ℤ → K_0(X)` sends `[x]` to `[O_x]`, which is `(0, O(x))` in
rank–determinant coordinates (§2.1); and curveGenericRank: the last map `K_0(X) → ℤ` is the generic
rank and is onto. So the tail of the sequence is the divisor sequence direct-summed with the rank.
*Needs:* §§2.1, 3.1; KTheoryLowDegrees §8.1; SchemeKTheoryOperations §3.7.

**Checks.**

- on `ℙ¹_ℚ`, `t² + 1 ↦ [x] − 2[∞]` with `k(x) = ℚ(i)`.
- `[O_X] ↦ 1`.
- `a ↦ deg(det a)` in place of the rank breaks exactness at `K_0(X)`.

### 3.4 Naturality for open immersions

Let Z be a finite set of closed points and `j : U = X − Z → X` the inclusion. Prove
curveLocalisation_restrict: restriction gives a morphism from the sequence of `X` to that of U;
the function-field terms are equal, the residue term of U is the sub-sum over the closed points of
U, the map between residue terms is the projection killing the terms at Z, and `j^*` is the map on
the K-groups of the curves. The functor `j^* : M(X) → M(U)` is exact, preserves finite length, and
induces the identity of `M(X)/M_0(X) = M(F(X)) = M(U)/M_0(U)`; Quillen localisation is natural for
such exact functors (GeneralAlgebraicKTheory §4.14). Consequently a class whose residues vanish
outside U can be computed on U. *Needs:* §3.1; GeneralAlgebraicKTheory §4.14;
SchemeKTheoryOperations §2.2.

**Checks.**

- on `ℙ¹_ℚ`, restriction to `𝔸¹` sends `div(t)=[0]−[∞]` to `[0]`;
  restriction again to `𝔾_m` sends it to zero.
- the residue map of U is that of `X` followed by projection away
  from Z.
- for `Z = ∅` the morphism is the identity.

### 3.5 Naturality for finite pullback

Let `φ : X → Y` be a finite morphism of regular integral curves over `F`, hence flat. Prove
curveLocalisation_pullback: pullback gives a morphism of localisation sequences whose component
`⊕_y K_n(k(y)) → ⊕_x K_n(k(x))` is `Σ_{x ↦ y} e(x/y) · (k(y) → k(x))_*`; in degree two,
`∂_x{φ^*a, φ^*b} = ∂_y{a, b}^{e(x/y)}` read in `k(x)^×` for `a, b ∈ F(Y)^×`. Flat pullback preserves
torsion sheaves (SchemeKTheoryOperations §2.2), dévissage of `O_X/m_y O_X` gives `Σ_x e_x [k(x)]`, and
the degree-two formula is K2SymbolsBrauer §9.7's ramification formula (Weibel, *K-book*, Remark
III.6.3.1, p. 234). On divisors this is Tau Ceti's `Divisor.conorm`. *Needs:* §§3.1–3.2;
K2SymbolsBrauer §9.7; SchemeKTheoryOperations §2.2; Tau Ceti `Divisor.conorm`.

**Checks.**

- for `φ : ℙ¹_ℚ → ℙ¹_ℚ`, `s ↦ t = s²`, with `x = (s = 0)` over `y = (t = 0)`
  and `e = 2`, and `u ∈ ℚ^×`: `∂_y{u, t} = u` and `∂_x{u, s²} = u²`.
- `φ = id` gives the identity.
- in degree zero the component sends `[y]` to `Σ_{x ↦ y} e(x/y)[x]`, and
  `Σ_{x ↦ y} e(x/y)[k(x) : k(y)] = deg φ`.

### 3.6 Naturality for finite transfer

For a finite morphism `φ : X → Y` of regular integral curves, prove curveLocalisation_transfer:
the transfers `N_{F(X)/F(Y)}` and `φ_* = N_{X/Y}` form a morphism of localisation sequences whose
component on residue terms is `⊕_y Σ_{x ↦ y} N_{k(x)/k(y)}`; in particular
`∂_y(N a) = ∏_{x ↦ y} N_{k(x)/k(y)}(∂_x a)` for `a ∈ K_2(F(X))`. Finite pushforward gives a map of
coherent localisation sequences with its residue terms (SchemeKTheoryOperations §3.7): direct image
along a finite map is exact on coherent and on torsion sheaves, and the functors `M(X) → M(Y)`,
`M_0(X) → M_0(Y)` are compatible (Weibel, *K-book*, V.6.6.3–6.6.4, p. 410, in the Dedekind case,
applied at each local ring). The target is its form for regular curves, with the residue component
and the degree-two formula, which is K2SymbolsBrauer's norm-residue formula (§§10.27, 11.6).
*Needs:* §3.1; GeneralAlgebraicKTheory §4.14; SchemeKTheoryOperations §§2.3, 3.7; K2SymbolsBrauer
§§10.27, 11.6.

**Checks.**

- for `φ = id`, N is the identity.
- in degree one the residue-term map is the norm `N_{k(x)/k(y)}`.
- `N ∘ φ^* = deg φ` on `K_*(F(Y))`.

### 3.7 K₂ of a curve over a number field, rationally

Let `X` be a regular integral curve over a number field `k`. Prove K2_curve_injective_rat:
`K_2(X) ⊗ ℚ → K_2(k(X)) ⊗ ℚ` is injective. By exactness at `K_2(X)` the kernel of
`K_2(X) → K_2(k(X))` is the image of `⊕_x K_2(k(x))`, which is torsion: each `k(x)` is a number field,
`K_2` of a number field `L` is the filtered colimit of the finite groups `K_2(O_{L,S})`
(GeneralAlgebraicKTheory §3.2; ArithmeticKTheory §3.4), and `⊗ ℚ` is exact. The statement applies at
every closed point, not only rational ones, and needs no common exponent. Exactness says only that
the kernel of the tame symbol on `K_2(k(X))` is the image of `K_2(X)`; identifying it with `K_2(X)` is
this theorem after `⊗ ℚ`, not a definition (Weibel, *K-book*, V.6.12, p. 416). *Needs:* §3.1;
GeneralAlgebraicKTheory §3.2; ArithmeticKTheory §§2.1, 2.4, 3.4.

**Checks.**

- On `ℙ¹_ℚ`, `∞_*{−1,−1}` is nonzero: structure pushforward returns `{−1,−1}`, the order-two generator of `K_2(ℚ)`. Its generic restriction is zero because it has support at infinity; rationalisation kills it.
- The two projective-bundle summands of `K_2(ℙ¹_ℚ)` are `K_2(ℚ)²`; each is torsion, so source and generic image are both zero rationally.
- For `𝔸¹_ℚ`, generic restriction identifies the constant `K_2(ℚ)` summand with its image in `K_2(ℚ(t))`; the nonzero kernel above depends on the projective support summand.

### 3.8 K₂ of a curve over a finite field, integrally

Let `X` be a regular integral curve over `F_q`. Prove K2_curve_injective_finite:
`0 → K_2(X) → K_2(F_q(X)) → ⊕_x k(x)^×` is exact, so `K_2(X)` is the kernel of the tame symbol. Every
`k(x)` is finite and `K_2` of a finite field vanishes (K2SymbolsBrauer §§5.12, 6.16; Weibel, *K-book*,
VI.6, opening, p. 502). *Needs:* §3.1; K2SymbolsBrauer §§5.12, 6.16.

**Checks.**

- On `ℙ¹_{𝔽₂}`, the point `V(t²+t+1)` has residue field `𝔽₄`; for `{t,t²+t+1}` its tame value is `θ`, of order three, while the values at `0` and `∞` are one. Its norm is `θ³=1`; omitting degree-two points would erase this nonzero residue.
- for `X = ℙ¹_{F_q}`, `K_2(X) = K_2(F_q)² = 0`, so the tame symbol on `K_2(F_q(t))` is
  injective (Weibel, *K-book*, Example III.6.7.1, p. 239).
- the residue term `⊕_x K_2(k(x))` vanishes, which is exactly what makes
  the integral statement hold.

### Examples

On `ℙ¹_ℚ`: `div(t² + 1) = [x] − 2[∞]` with `k(x) = ℚ(i)`; the tame symbol of `{t, t² + 1}` at `x` is
i; the function `(t² + 1)/(t² + 2)` is invisible at rational points. On `ℙ¹_{F_q}` the tame symbol
on `K_2(F_q(t))` is injective with image the kernel of the norm to `F_q^×`.

### Dependencies

Layers 1–2; GeneralAlgebraicKTheory Layers 2 and 4 and §3.2; SchemeKTheoryOperations §§2.2–2.6,
3.5–3.7; KTheoryLowDegrees §8.1; K2SymbolsBrauer §§5.12, 6.16, 9.2–9.7, 10.27, 11.1, 11.6;
ArithmeticKTheory §§2.1, 2.4, 3.4; Tau Ceti
`Divisor.conorm`.
## Layer 4: K₁, SK₁, coniveau and weights

The localisation sequence splits into short exact pieces. In degree one it isolates the curve
invariant `SK_1`; in degree three it gives the two-column coniveau description of `K_3`; and the
Adams operations separate the field's contribution from the geometry of the curve.

### 4.0a Adams pullback beyond regular schemes

Construct noetherianAdams: for every noetherian scheme Y and k≥1, an additive operation
`ψ^k : K_n(Y) → K_n(Y)` for every n≥0, agreeing with SchemeKTheoryOperations §6.8 on its
domain. Use derived exterior powers on perfect complexes and their natural K-space operations;
construct their coherent affine restriction maps and descend them along the supplied Zariski
K-theory descent equivalence. The maps are operations on K-spaces and their nonnegative
homotopy groups; an integral map of spectra is not asserted. This target includes the
derived exterior-power construction on perfect complexes and its descent, rather than
assuming that exterior powers are exact functors (Barwick–Glasman–Mathew–Nikolaus,
Theorem 1.1 and §2; Köck–Zanchetta, arXiv v2, Theorem 4.1 and Corollary 4.2 for comparison on their
noetherian finite-dimensional divisorial domain; Weibel IV.5.3–5.5 for the affine identities).

Its API requires the following laws, with the comparisons made on the same K-groups.

- Every morphism f:X→Y of noetherian schemes satisfies `f^*ψ^k=ψ^k f^*`, with identity and
  composition compatibility, including nonflat morphisms and singular X.
- The operations preserve the actual graded K-product, satisfy `ψ^1=id` and
  `ψ^aψ^b=ψ^{ab}`, and agree with the supplied regular and affine operations.
- On a line bundle L, `ψ^k[L]=[L^{⊗k}]`; on a unit u in degree one the value is `[u^k]`.
  Thus the zero operation and the identity operation in every weight are excluded.

**Checks.**

- On `K_0(ℙ¹)`, let `z=1−[O(−1)]`, so `z²=0`. Then `ψ²(z)=2z` and
  `ψ²ψ³(z)=6z=ψ⁶(z)`; the identity operation would give z.
- Over `ℚ[ε]/(ε²)`, `ψ²[1+ε]=[1+2ε]` in K₁. Pullback to ℚ gives `[1]=0` on both
  paths; regularity is unavailable on the source scheme.
- The empty scheme has zero K-groups. On `Spec ℚ`, `ψ²[2]=[4]` in K₁, whereas in
  degree zero `ψ²[ℚ²]=2`; scalar multiplication by two in every degree fails the latter.

*Needs:* SchemeKTheoryOperations §§1.6–1.7, 2.1–2.2, 2.5, 4.1, 6.8; EnhancedDerivedSheaves E0 and E1.2–E1.4; GeneralAlgebraicKTheory Layers 2, 5–6's
K-space and exact-category models; the derived exterior-power and coherent descent construction
is part of this target.

### 4.0b Weight one and continuity over fields

Prove fieldMotivicAdapters: for every field F, identify its shared Bloch weight-one complex
with `F^×[−1]`, compatibly with the field-valued Suslin–Tate identification of
MotivesAndAlgebraicCycles §4.4 and with finite-extension norms. Construct the comparison by
the divisor map on the pointed projective line; its parameter has boundary +1 in the
last-slot residue convention. In particular `H^a(F,ℤ(1))` is F× for a=1 and zero otherwise.
This is a comparison of the two specified models, rather than a new motivic complex
(Kahn–Levine, Proposition 4.8.1 and proof, p. 51; MotivesAndAlgebraicCycles §§4.4, 4.17).

Prove fieldMotivicContinuity: express F as the filtered union of its finitely generated
subfields. For n≥0 identify its shared integral diagonal `H^n(F,ℤ(n))`, its Milnor-symbol
map, and in characteristic p its `ℤ/p^ν` diagonal and logarithmic comparison for ν≥1,
with the filtered colimits of the same maps over those subfields. A finite cycle, its face
conditions, a bounding chain, and a finite norm diagram all descend to a finite stage;
include these facts in the proof, so that agreement on symbols is agreement on the
specified maps (KTheoryFiniteLocalFields §§3.0–3.0a, 5.17; Weibel VI.4.1–4.3, VI.4.7).

The adapter API has the following requirements.

- The units comparison intertwines restriction and every finite-extension norm, including
  inseparable norms, and agrees with the perfect-field comparison wherever both apply.
- The continuity isomorphisms commute with coefficient triangles and the integral symbol map.
- Logarithmic symbols and the coefficient diagonal commute with every field embedding and
  the same finite-extension transfers as the integral diagonal.

**Checks.**

- At F=ℚ, `H¹(F,ℤ(1))=ℚ×` sends the class of 2 to 2, of 2-adic valuation 1;
  `H⁰` and `H²` vanish. An unshifted units model in degree zero fails these values.
- For `𝔽₂(t)/𝔽₂(t²)`, the weight-one norm sends t to t². Its logarithmic symbol
  `dt/t` is nonzero over `𝔽₂(t)`, so replacing the coefficient comparison by zero fails.
- In `𝔽₂(s,t)`, the coefficient class `{s,t}` maps to `dlog(s)∧dlog(t)≠0`.
  Both s and t and this class descend to the finitely generated field `𝔽₂(s,t)` itself;
  the n=0 diagonal is ℤ integrally and `ℤ/2^ν` with coefficients, rather than zero.

*Needs:* MotivesAndAlgebraicCycles §§4.4, 4.7–4.8, 4.17;
KTheoryFiniteLocalFields §§3.0–3.0a, 5.17; GeneralAlgebraicKTheory §3.2.

### 4.0c The supplied motivic tower, Adams action and étale comparison

For every smooth separated finite-type scheme X over a perfect field F, construct
motivicTowerComparison on the integral and coefficient towers of KTheoryFiniteLocalFields
§3.0a. For n,j≥0 and k≥1, prove that the supplied Adams operation acts on the weight-j
layer by `k^j`, with the same action on the abutment. Identify the induced rational
weight comparison with MotivicEtaleKTheory §§2.2–2.3's character; the tower and the
character use the same cycle and symbol maps (Levine, Theorem 12.12, pp. 58–59, and
Theorem 14.7, pp. 73–74). Naturality concerns smooth F-schemes and constant-field
extensions; rational eigenspace pullback outside this domain is §4.0a.

For every positive m invertible in F, construct the map of coefficient spectral
sequences induced by the supplied norm-residue morphism
`ℤ/m(j) → Rε_*μ_m^{⊗j}`, whose truncation in cohomological degrees at most j is an
isomorphism. Here ε maps the étale site to the Nisnevich site. Its target is the étale
hypercohomology descent sequence with layers `μ_m^{⊗j}`; construct this sequence from
the sheafified K-tower and its coefficient maps, rather than assuming an étale
K-theory carrier. Prove compatibility with localization, finite-extension transfer,
geometric base change, coefficient triangles and the unit/section edge maps. Pass
compatibly to the `ℚ_ℓ/ℤ_ℓ` colimit for every prime ℓ invertible in F. No integral
étale-descent assertion outside the stated truncation follows from this construction
(Weibel VI.4.1–4.2, pp. 479–481; VI.6.4–6.7 and proofs, pp. 503–505).

The comparison API records the following facts.

- On diagonal field symbols it is the supplied product of K₁ classes and the corresponding
  ordered cup product; on weight one it is the Kummer map.
- Rationalizing identifies each simultaneous Adams summand with the same higher-Chow
  group as the supplied character, including on the localization maps.
- Finite and divisible coefficient comparisons commute with both Bockstein maps and
  with geometric restriction, so the edge and section maps in §5.7 have fixed domains.

**Checks.**

- On `Spec 𝔽₃`, `K₂(𝔽₃;ℤ/2)=K₁(𝔽₃)[2]=ℤ/2` and the coefficient edge has
  a nonzero unit class. Using only `K₂(𝔽₃)/2=0` loses it.
- On `ℙ¹`, the class `z=1−[O(−1)]` satisfies `ψ²(z)=2z` and has cycle image +1
  in degree one. The rank class has eigenvalue 1, fixing the distinct weight indices.
- Over `𝔽̄₂`, the ℓ=3 divisible-coefficient degree-two group on `ℙ¹` is
  `(ℚ₃/ℤ₃(1))²`; the arithmetic degree-one integral group on `ℙ¹_𝔽₂` is zero.
  Interchanging integral and coefficient groups fails this test. For m=1 all groups
  and comparison maps with these coefficients are zero.

*Needs:* §§4.0a–4.0b; KTheoryFiniteLocalFields §3.0a; MotivicEtaleKTheory §§2.2–2.3;
SchemeKTheoryOperations §§2.2–2.4, 3.3, 6.8–6.9; StableHomotopyKTheory Layer 7;
EtaleCohomologyFoundations F.0–F.1 (étale sites, coefficients and hypercohomology); MotivesAndAlgebraicCycles §4.3 (Nisnevich topology).

### 4.1 K₁ and SK₁ of a proper curve

Let `X` be an integral regular curve, proper over `F`, with `H⁰(X, O_X) = F`. Prove curveK1Image:
the image of `K_1(X)` in `K_1(F(X)) = F(X)^×` is `F^×`. The composite factors through the determinant
`K_1(X) → Γ(X, O_X)^× = F^×` (naturality of det, KTheoryLowDegrees §8.1), and pullback along
`π : X → Spec F` makes `F^×` a subgroup of the image. Define
```text
curveSK1 X := ker (K₁(X) → K₁(F(X))).
```
Prove curveSK1_eq_range_pushforward: `SK_1(X)` is the image of `⊕_x (i_x)_* : ⊕_x k(x)^× → K_1(X)`,
and curveSK1_eq_coker: it is isomorphic to the cokernel of the tame symbol
`∂ : K_2(F(X)) → ⊕_x k(x)^×`, compatibly with the maps from `⊕_x k(x)^×` (exactness of §3.1). Prove
curveSK1_split: `π^*` splits `K_1(X) = π^*K_1(F) ⊕ SK_1(X)`, because `π^*` followed by restriction to
the generic point is the inclusion `F^× ⊂ F(X)^×`; and curveSK1_norm:
`π_*((i_x)_* u) = N_{k(x)/F}(u)` for `u ∈ k(x)^×` (Weibel, *K-book*, V.6.12.1, proof, p. 417). Prove
curveSK1_affine_eq_stableSK1: for an affine regular integral curve `Spec R`, the same kernel is the
stable `SK_1(R) = ker(det)`, since `R^× → F(X)^×` is injective (Weibel, *K-book*, V.6.8, proof,
p. 412). For proper `X` the invariant can be non-zero even when a covering by affine opens has
vanishing stable `SK_1`, as the projective-line check shows. There is no assertion that every affine
regular curve over an arbitrary field has vanishing stable `SK_1`. Regularity
is used for `K = G` in the localisation sequence, not for the image statement. *Needs:* §§1.2, 3.1;
KTheoryLowDegrees §8.1; SchemeKTheoryOperations §§2.2–2.3, 5.5.

The special-group API has the following requirements.

- The kernel inclusion is the image of the sum of closed-point pushforwards, with the tame-symbol cokernel identification.
- Structure pullback splits the constant-unit quotient for a proper curve with exact constant field F.
- On affine regular curves the subgroup agrees with the determinant kernel of the ring; on point classes structure pushforward is the residue-field norm.

**Checks.**

- `SK_1(ℙ¹_F) = ∞_*(F^×) ≅ F^×` and `K_1(ℙ¹_F) ≅ F^× ⊕ F^×` (Weibel,
  *K-book*, V.6.13.2, p. 417).
- for `𝔸¹_F = Spec F[t]`, `ker(K_1(F[t]) → F(t)^×) = SK_1(F[t]) = 0` by
  homotopy invariance.
- `ℙ¹_F = Spec F[t] ∪ Spec F[t⁻¹]` with `SK_1` of both charts zero, yet
  `SK_1(ℙ¹_F) ≅ F^× ≠ 0` for `F ≠ 𝔽₂`.
- for `ℙ¹_F`, `coker(∂ : K_2(F(t)) → ⊕_x k(x)^×) ≅ k(∞)^× = F^×`, and the
  isomorphism sends the class of `u ∈ k(∞)^×` to `∞_*(u)`.

### 4.2 The rational base-point splitting

Let `X` be as in §4.1 and `P ∈ X(F)` a rational point with closed immersion `P : Spec F → X`. Prove
basePoint_pushforward: `π_* ∘ P_* = id` on `K_*(F)` and `π_* ∘ (i_x)_* = N_{k(x)/F}` on `K_1(k(x))`;
hence basePoint_split: `P_* : F^× → SK_1(X)` is a section of `π_*|_{SK_1(X)}` and
`K_1(X) = π^*F^× ⊕ P_*F^× ⊕ V(X)` with `V(X) = ker(π_*|_{SK_1(X)})`. Prove basePoint_pullback_zero:
`P^* ∘ (i_x)_* = 0` for every closed point `x`, so `P^* : K_1(X) → K_1(F)` is the identity on
`π^*F^×` and zero on `SK_1(X)`. For `x ≠ P` the fibre product `Spec F ×_X Spec k(x)` is empty
(Tor-independent base change, SchemeKTheoryOperations §2.4); for `x = P` the self-intersection
formula gives `P^*P_*(u) = λ_{−1}(N^∨)·u = (1 − 1)·u = 0`, the conormal line being trivial
(SchemeKTheoryOperations §7.6; Weibel, *K-book*, V.6.12.1, proof, p. 417). The points `P` and i_x are
proper and perfect because `X` is regular. *Needs:* §4.1; SchemeKTheoryOperations §§2.3–2.4, 7.6.

**Checks.**

- for `X = ℙ¹_F` and `P = ∞`, `V(ℙ¹_F) = 0` and `K_1(ℙ¹_F) = π^*F^× ⊕ ∞_*F^×`.
- `P^*` restricted to `SK_1(X)` is zero.
- on `ℙ¹_ℚ`, for `x = V(t² + 1)` and `u = i`, `π_*(i_x)_* u = N(i) = 1`.

### 4.3 The two-column coniveau spectral sequence

For a regular integral curve `X` over `F`, prove curveConiveau: the coniveau spectral sequence of
SchemeKTheoryOperations §4.5 has `E_1^{0,−n} = K_n(F(X))`, `E_1^{1,−n−1} = ⊕_x K_n(k(x))` and
`d_1 = ∂`, the residue map of §3.1; there are no other columns, so `E_2 = E_∞`. With the coniveau
filtration `F¹K_n(X) := im(⊕_x (i_x)_* : ⊕_x K_n(k(x)) → K_n(X))`, `F⁰ = K_n(X)`, `F² = 0`, prove for
every `n ≥ 0` the short exact sequence
```text
0 → coker(∂_{n+1} : K_{n+1}(F(X)) → ⊕ₓ Kₙ(k(x))) → Kₙ(X) → ker(∂ₙ : Kₙ(F(X)) → ⊕ₓ K_{n−1}(k(x))) → 0
```
with `K_{−1}(k(x)) = 0` when `n = 0`; its maps are those of the localisation sequence (Weibel, *K-book*, V.9.5 and (9.5.1), p. 438, and
V.9, opening, p. 435). The left term is in general non-zero: if `X` is proper with a rational point
`P`, then `π_*P_* = id` makes `P_* : K_n(F) → F¹K_n(X)` injective; it may vanish: for `𝔸¹_F`,
`K_n(𝔸¹_F) = K_n(F)` (homotopy invariance) injects into `K_n(F(t))` (Weibel, *K-book*, V.6.7.1,
p. 411), so `F¹K_n(𝔸¹_F) = 0`. Its API identifies each page and filtration map.

- The first-page terms and differential are the residue-field groups and boundary above.
- The first filtration subgroup is the image of closed-point pushforwards, and the second is zero.
- The filtration exact sequence agrees with localization, with left term the stated cokernel and quotient the stated kernel.
- All differentials from the second page onward vanish because their target column is absent. *Needs:* §3.1;
SchemeKTheoryOperations §§2.3, 4.5, 5.1–5.2.

**Checks.**

- for `X = Spec F` (dimension zero) there is one column and `F¹ = 0`; for a curve
  only the columns `p = 0, 1` can be non-zero; individual entries can vanish.
- `F¹K_3(ℙ¹_F) = ∞_*K_3(F) ≅ K_3(F)` and `ker ∂_3 = K_3(F)`; for `F = ℚ`
  both are `ℤ/48` and `K_3(ℙ¹_ℚ) ≅ (ℤ/48)²`.
- `F¹K_3(𝔸¹_F) = 0`.
- `⊕_x K_n(k(x)) → F¹K_n(X) ⊂ K_n(X)` is `⊕_x (i_x)_*`.

### 4.4 The third K-group of a curve

Prove curveK3_extension: for a regular integral curve `X` over `F`, `K_3(X)` sits in the exact sequence
```text
0 → coker(∂₄ : K₄(F(X)) → ⊕ₓ K₃(k(x))) → K₃(X) → ker(∂₃ : K₃(F(X)) → ⊕ₓ K₂(k(x))) → 0,
```
the case `n = 3` of §4.3, with the maps of the localisation sequence (Weibel, *K-book*, V.6.12, p. 416;
VI.6.8, proof, p. 505, for the notation). Both ends are needed: the kernel alone is the associated
graded piece `K_3(X)/F¹`, not the group, and the extension carries the content. The quotient `K_3^ind(F(X)) = coker(K^M_3 → K_3)` (K3BlochGroups §2.1) is compared
with this sequence rationally by the weight-two projection of §4.6. No integral map from that
quotient into `K_3(X)` is asserted. *Needs:* §4.3; K3BlochGroups §2.1.

**Checks.**

- for `E = 37a1` over `ℚ` (origin rational), `K_3(E)` contains
  `π^*K_3(ℚ) ⊕ O_*K_3(ℚ) ≅ (ℤ/48)²`, so `K_3(E)` is not the image of `K_3^ind` of the base field.
- `K_3(E) → ker ∂_3` is not injective for `E = 37a1`, since
  `F¹K_3(E) ⊇ O_*K_3(ℚ) ≅ ℤ/48`.
- `K_3(ℙ¹_ℚ) ≅ K_3(ℚ)²`, with `F¹ = ∞_*K_3(ℚ)` and quotient `ker ∂_3 = K_3(ℚ)`.

### 4.5 Adams weights of the K-theory of a curve

Let `X` be a regular curve over `F`. Use SchemeKTheoryOperations §6.9's rational weight
subgroups `K_n(X)_ℚ^{(j)} = {a : ψ^k a = k^j a for every k≥1}`, projectors and finite direct-sum
decomposition over `0≤j≤n+1`. Use MotivicEtaleKTheory §2.3's full-support comparison
`K_n(X)_ℚ^{(j)} ≅ CH^j(X,n) ⊗ ℚ`; a separated regular curve over a field is quasi-projective,
so its hypotheses apply even when the curve is not smooth over that field. In cohomological
notation the right side is `H^{2j−n}(X,ℚ(j))` on the shared Bloch complexes. The codimension bound
is `j≤dim(X×Δ^n)=n+1`. The supplied projectors have nonzero rational denominators; an integral
weight splitting is not asserted (Levine, Theorem 14.7(3),(5), pp. 73–74).

Construct regularCurveMotivicTower for every regular curve X over every field F by the
simplicial perfect K-spectra with supports in `X×Δ^m` meeting every face in codimension at
least j. Prove regularCurveMotivicTower_layers by the support-category cycle-class map:
the successive cofibres are the shared codimension-j cycle complexes. Termwise regular
Cartan comparison and homotopy invariance apply to the polynomial schemes `X×Δ^m`,
so smoothness over F is not assumed. Prove regularCurveMotivicTower_converges and
regularCurveMotivicTower_adams: the tower abuts to K(X), with Adams action `k^j` on its
weight-j layer (Levine §3.2, Lemma 3.3, Proposition 3.5, pp. 12–14; Theorem 12.12 and proof,
pp. 58–59; Theorem 14.7 and proof, pp. 73–74). The integral tower extends the smooth
perfect-field tower; its rational cycle isomorphism is the supplied comparison, rather
than a second cycle theory. Prove regularCurveMotivicTower_smoothComparison: on smooth
curves over perfect fields the support and cycle maps identify it with the imported
KTheoryFiniteLocalFields §3.0a tower, with the Adams comparison of §4.0c.

The integral curve-tower API has the following requirements.

- Every layer is identified by the same support-cycle map with the shared Bloch complex,
  compatibly with face restrictions and localization boundaries.
- The filtration converges to K(X), and its rational weight pieces agree with the supplied
  rational character. Differentials between distinct Adams weights have torsion image.
- On a smooth curve the comparison with the supplied tower preserves coefficients,
  geometric restriction and Adams action; it does not replace the point-coniveau filtration.

Prove curveWeightFiltrationComparison: on `K_0(X)` the integral rank splitting has weights zero
and one, with `ker(rank)=Pic(X)` and `ψ^k[L]=[L^{⊗k}]`. For a proper curve with exact constant
field F, structure pullback `π^*F^×` has weight one and `SK_1(X)` weight two rationally, the latter
by the codimension-one Gysin shift `ψ^k(i_x)_*=k(i_x)_*ψ^k`. Identify these subgroups with the
corresponding supplied cycle-weight summands, compatibly with the localization sequence
(SchemeKTheoryOperations §6.11; Levine, Theorem 14.7 and proof, pp. 73–74).

For finite coefficients consume SchemeKTheoryOperations §6.9 with all its hypotheses: `n≥2`,
odd `ℓ≠char F`, `ν≥1`, `ℓ>N+1`, simultaneous integral ℓ-local endpoint decompositions of
`K_n(X)` and `K_{n−1}(X)` in weights `0,…,N`, and commuting additive coefficient Adams operations
compatible with both Bockstein maps. Its summands are generalized weights
`ker(ψ^k−k^j)²` for a primitive root k modulo ℓ, rather than ordinary scalar eigenspaces.
For every morphism of noetherian schemes use §4.0a's pullback-compatible operations to preserve
rational eigenspaces. The cycle comparison and the finite weight bound apply after scalar
extension only when the resulting curve remains regular.
*Needs:* §§2.1, 4.0a–4.0c, 4.1, 4.4; SchemeKTheoryOperations §§2.6, 3.3, 5.1–5.2, 6.8–6.11; KTheoryFiniteLocalFields §3.0a; StableHomotopyKTheory §§7.21–7.29; MotivicEtaleKTheory §§2.2–2.3.

**Checks.**

- on `ℙ¹_F`, the cycle layers give the two summands with the weight shift
  of the hyperplane class; in degree zero they are exactly rank and degree.
- in characteristic two, for `F = 𝔽₂(t)`, the regular curve
  `Spec(F[x,y]/((y−x)²−t))` becomes non-reduced over `F(√t)`. Its tower and rational
  comparison are still required over `F`. Over `F(√t)` the ring is `F(√t)[x,ε]/(ε²)`: pullback still preserves eigenspaces, but the regular comparison does not apply there.
- for an elliptic curve, the motivic tower has the weight-two
  `SK_1` layer, although the codimension-of-points coniveau sequence of §4.3 has only two
  columns. The two filtrations are compared through their maps, not identified by their names.
- On `0→ℤ/5→ℤ/25→ℤ/5→0`, multiplication by `12` acts by `2` on both endpoints. On the middle group, `12−2=10≠0`, but `10²=100=0 mod 25`; this is a generalized weight with non-scalar action.
- for `ℙ¹_F`, `ψ^k(1 − [O(−1)]) = k(1 − [O(−1)])`, so
  `K_0(ℙ¹_F) = ℤ·1 ⊕ ℤ·(1 − [O(−1)])` with weights `0, 1`.
- in `K_0(ℙ²_F) = ℤ[z]/(z³)`, `z = 1 − [O(−1)]`, the weight-one eigenvector is
  `z + z²/2 ∉ K_0(ℙ²_F)`, and `ℤ·1 ⊕ ℤ(2z + z²) ⊕ ℤ·z²` has index two (Weibel, *K-book*, II.8.6, p. 149).
- for `ℙ¹_F`, `ψ^k` acts by `k` on `π^*F^×` and by `k²` on `∞_*F^× ⊂ K_1(ℙ¹_F)`.
- for `X = Spec F` and `n ≥ 1`, `K_n(F)_ℚ^{(0)} = 0` and `K_1(F)_ℚ = K_1(F)_ℚ^{(1)}`.

### 4.6 The indecomposable K₃ is the weight-two part

Use K3BlochGroups §2.2's natural integral edge equivalence
`K_3^ind(L) ≅ H¹(L,ℤ(2))` for every field L, and MotivicEtaleKTheory §2.3's rational
weight comparison. Together they identify `K_3^ind(L)_ℚ` with `K_3(L)_ℚ^{(2)}`;
`K_3(L)_ℚ` has only weights two and three and its Milnor image is weight three.
Weights j≥4 vanish by `2j−3>j` and the field diagonal bound; weight one is zero
by §4.0b and weight zero is zero in positive degree. The diagonal symbol is
`H³(L,ℤ(3)) ≅ K^M_3(L)` (KTheoryFiniteLocalFields §3.0a; Weibel VI.4.3, p. 481).
For a regular curve `X` over `F` prove K3_curve_weights: pullback maps `K_3^ind(F)_ℚ` into
`K_3(X)_ℚ^{(2)}`, and `F¹K_3(X)_ℚ` has weights three and four, the Gysin shift of the weights two and
three of the residue fields. This separates the base field's indecomposable contribution from the
geometry of the curve. Rational coefficients are essential to the claimed Adams eigenspace splitting: integral
eigenvalues do not supply integral projectors. The map `K^M_3(L) → K_3(L)` itself is
injective (Weibel, *K-book*, Proposition VI.4.3.2, p. 482); the weaker bound that its kernel
is killed by two does not exhibit a nonzero kernel. The integral indecomposable quotient
is supplied by K3BlochGroups §2.1. *Needs:* §4.5; K3BlochGroups §§2.1–2.2, 2.5;
KTheoryFiniteLocalFields §3.0a; MotivicEtaleKTheory §2.3; §4.0b; SchemeKTheoryOperations §§6.8, 6.11.

**Checks.**

- `K_3^ind(ℚ)_ℚ = 0 = K_3(ℚ)_ℚ^{(2)}`, consistent with `K_3(ℚ) ≅ ℤ/48`.
- for a number field `L` with r_2 complex places, `dim K_3(L)_ℚ^{(2)} = r_2`
  (K3BlochGroups §2.5).
- on `ℙ¹_F`, `∞_*K_3(F)_ℚ` lies in weights three and four, not two.

### Examples

For `ℙ¹_F`: `K_1 = F^× ⊕ F^×`, `SK_1 = ∞_*F^×`, `V(ℙ¹_F) = 0`, `K_3 ≅ K_3(F)²` with `F¹ = ∞_*K_3(F)`, and
the weights of `K_0` are `0, 1` with basis `1, 1 − [O(−1)]`. For `E = 37a1`, `K_3(E)` contains
`(ℤ/48)²` from the base field and the origin.

### Dependencies

Layers 2–3; EtaleCohomologyFoundations F.0–F.1; StableHomotopyKTheory Layer 7; EnhancedDerivedSheaves E0 and E1.2–E1.4; MotivicEtaleKTheory §§2.2–2.3; MotivesAndAlgebraicCycles §§4.4, 4.17; KTheoryLowDegrees §8.1; SchemeKTheoryOperations §§2.2–2.4, 4.5, 5.1–5.5, 6.8–6.11, 7.6;
K3BlochGroups §§2.1–2.2, 2.5; KTheoryFiniteLocalFields §3.0a; MotivicEtaleKTheory §2.3; §4.0b.
## Layer 5: Functoriality, isogenies and curves over finite fields

This layer makes K-theory of curves functorial along the maps of Layer 1, computes the effect of an
isogeny, treats the projective line as the first worked case, and then computes the K-groups of a
curve over a finite field completely: Harder's finiteness theorem, the geometric curve as a Galois
module, Frobenius descent, and the elliptic groups with their orders.

### 5.1 Pullback and pushforward for curves

K-theory of noetherian schemes is contravariant for every morphism, by derived pullback of perfect
complexes (SchemeKTheoryOperations §2.2, `Scheme.K.pullback`), and covariant for proper morphisms of
finite Tor-dimension, by derived pushforward (§2.3, `Scheme.K.pushforward`); G-theory is covariant for
every proper morphism (`Scheme.G.pushforward`) (Weibel, *K-book*, V.3.11, p. 395, with the published
correction inserting "pseudocoherent" in the definition of the flasque model). Use their supplied identity, composition and Tor-independent base-change laws (§2.4). Prove KPushforward_eq_transfer: for a finite flat morphism the pushforward is the transfer
attached to the module structure, by `Scheme.K.pushforward_affine` on each affine restriction
`Spec B → Spec A` with `B` finite locally free over `A`, in every degree (Weibel, *K-book*, V.3.3.2,
p. 386). Prove isogeny_finiteFlat: for a non-zero isogeny `f : E' → E`, the scheme morphism of §1.6
is finite and flat of locally free rank `deg f` (a finite dominant morphism of regular curves is
flat, and its generic rank is the function-field degree), hence proper and perfect; its K-pullback is
induced by `Lf^*` and its K-pushforward by `Rf_* = f_*`, which on affine pieces is restriction of
scalars and agrees with the classical finite-flat transfer in every non-negative degree. The constant
map to the origin is excluded. Pushforward along the structure morphism of a proper curve is the
Euler characteristic in degree zero (§2.2). *Needs:* §§1.6, 2.2; SchemeKTheoryOperations §§2.2–2.4;
GeneralAlgebraicKTheory §4.14.

**Checks.**

- for `π : ℙ¹_F → Spec F`, `π_*[O(n)] = n + 1` in `K_0(F) = ℤ`; in
  particular `π_*[O(−1)] = 0`.
- for an elliptic curve with origin O, `π_*[O_E] = 0` and
  `π_*[O_E(O)] = 1`, agreeing with Tau Ceti's eulerCharBelow.
- for `Spec L → Spec F` with `L/F` finite, `f_* : K_1(L) → K_1(F)` is
  `N_{L/F}` and `f^*` is the inclusion.
- for the generic point `j : Spec F(X) → X` (neither proper nor of finite
  type), `j^* : K_1(X) → F(X)^×` is the map of §4.1.
- for `j : 𝔸¹_F → ℙ¹_F`, `j_*O` is quasi-coherent and not coherent, so
  sheaf direct image gives no map `G_0(𝔸¹_F) → G_0(ℙ¹_F)`.
- the identity isogeny gives identity maps in every degree.

### 5.2 The projection formula and isogenies

For a proper morphism `f` of noetherian schemes the projection formula
`f_*(x · f^*y) = f_*(x) · y` holds for `x ∈ G_*(X)`, `y ∈ K_*(Y)`, and for `x ∈ K_*(X)` when `f` has
finite Tor-dimension (SchemeKTheoryOperations §2.4; Weibel, *K-book*, V.3.12, p. 395). Prove
isogeny_pushPull: taking `x = 1`, for an isogeny `f`, `f_* f^*(y) = [f_*O_{E'}] · y` on `K_*(E)`. The
class `[f_*O_{E'}]` has rank `deg f` but is **not** `deg f · 1` in integral K-theory in general:
whether it is is decided by its determinant, a degree-zero line bundle (§5.3). *Needs:* §5.1;
SchemeKTheoryOperations §2.4.

**Checks.**

- for `[3]` over `ℚ`, `f_*f^*(1,0,O)=(9,0,O)`; for a separable degree-two isogeny
  in characteristic zero, the value is `(2,0,P_f)` with `P_f≠O` as in §5.3.
- `rank [f_*O_{E'}] = deg f`.
- for a separable isogeny of degree two in characteristic not two,
  `f_*f^*(1) ≠ 2 · 1` in `K_0(E)` (§5.3).

### 5.3 The class of `f_*O` and the determinant obstruction

Let `f : E' → E` be a non-zero isogeny of elliptic curves over `F` of degree d. Prove
pushforwardStructureSheaf_class: `f_*O_{E'}` is locally free of rank d and
`L_f := det(f_*O_{E'}) ∈ Pic⁰(E)`. The rank is the function-field degree (Tau Ceti's
TauCeti.Isogeny.degree through §1.6); `deg L_f = χ(f_*O_{E'}) − d · χ(O_E) = 0 − 0`. Write `P_f ∈ E(F)` for
the point of L_f (§2.4). Prove isogeny_rankDet_action: in the coordinates of §2.7,
`[f_*O_{E'}] = (d, 0, P_f)` and, by the square-zero product of §2.6,
```text
f_* f^* (r, e, P) = (d r, d e, d P + r P_f).
```
So `f_*f^* = d` on `K_0(E)` if and only if `L_f ≅ O_E`, and then `f_*f^* = d` on every `K_n(E)`. Then
prove three cases.
- if `f` is separable, `L_f^{⊗2} ≅ O_E`: for `f` finite étale the trace
  pairing `f_*O ⊗ f_*O → O` is perfect, so `f_*O ≅ (f_*O)^∨` and `det^{⊗2}` is trivial. Hence
  `[f_*O_{E'}] = d · 1` in `K_0(E) ⊗ ℚ` and `f_*f^* = d` on `K_*(E) ⊗ ℚ`.
- if `f = [m]` with m odd and `char F ∤ m`, then `L_{[m]} ≅ O_E`, so
  `[[m]_*O_E] = m²` in `K_0(E)` and `[m]_*[m]^* = m²` on `K_*(E)`. The fibre square
  `E ×_{[m], E, [m]} E ≅ E × E[m]` gives `[m]^*[m]_*O_E ≅ O_E^{m²}` by flat base change, so
  `[m]^*L_{[m]}` is trivial; `[m]^*` acts on `Pic⁰` as multiplication by m (theorem of the square,
  ModularCurves Layer 2D, with `[m]^∨ = [m]` from EllipticCurves Layer 1), so `L_{[m]}` is m-torsion, and with the separable case it is also
  2-torsion; m odd forces triviality.
- if `char F ≠ 2` and `f` is separable of degree two, then
  `f_*O_{E'} = O_E ⊕ L` with `L = ker(½ Tr)`, `h⁰(L) = h⁰(E', O) − h⁰(E, O) = 0`, so `L ≇ O_E` and
  `L_f = L` is a non-trivial 2-torsion line bundle: `[f_*O_{E'}] ≠ 2` in `K_0(E)` and
  `f_*f^*(1) ≠ 2 · 1`.

(Weibel, *K-book*, V.3.12, p. 395, with `x = 1`.) *Needs:* §§1.6, 2.4–2.7, 5.1–5.2; ModularCurves
Layer 2D; EllipticCurves Layer 1; Tau Ceti TauCeti.Isogeny.degree.

**Checks.**

- evaluating on `[O_E] = (1, 0, O)` gives `(d, 0, P_f)`; the point component
  detects a non-trivial determinant.
- for `[3]` on any E over `ℚ`, `[3]_*[3]^* = 9` on `K_*(E)`.
- for `E : y² = x³ − x` over `ℚ` and its 2-isogeny to `y² = x³ + 4x`,
  `[f_*O_E] = (2, 0, P_f)` with `P_f ≠ O`, so `f_*f^*(1) ≠ 2` in `K_0`.
- for every separable isogeny `f_*f^* = deg f` on `K_*(E) ⊗ ℚ`.

### 5.4 The projective line

SchemeKTheoryOperations §5.5 supplies the projective-bundle equivalence for `ℙ¹_F`, in the following coordinates: with `π : ℙ¹_F → Spec F` and the section `σ` at infinity,
`(a, b) ↦ π^*a + [O(−1)] · π^*b` is an isomorphism `K_n(F) ⊕ K_n(F) ≅ K_n(ℙ¹_F)` in every degree, with
inverse `x ↦ (π_*x, σ^*x − π_*x)`, and in `K_0` the coordinates are `(χ(x), rank(x) − χ(x))`:
`[O(m)] = (m + 1, −m)`, `[O] = (1, 0)`, `[O(−1)] = (0, 1)`, `[O_∞] = (1, −1)` (Weibel, *K-book*, II.8.5,
p. 149, in degree zero over a quasi-compact base; V.1.5, p. 369, over a quasi-projective base;
V.6.13.2, p. 417, for a regular noetherian base). The comparison with the rank–Pic basis is
KTheoryLowDegrees §12.3: `(r, d) = (a + b, −b)`. Prove projectiveLine_finiteField: over `F = F_q`,
by Quillen's computation (GeneralAlgebraicKTheory §13.8c), `K_{2i}(ℙ¹) = 0` and
`K_{2i−1}(ℙ¹) ≅ (ℤ/(q^i − 1))²` for `i ≥ 1`. For an elliptic curve the odd groups have the same shape
(§5.11), but the even ones are twisted elliptic torsion; the vanishing of the even groups of `ℙ¹`
does not transfer to E. Prove elliptic_K0_generated_iff: `K_0(E)` is generated by `[O_E]` and
`[O_E(−O)]` over `K_0(F)` if and only if `E(F) = 0`. *Needs:* §5.1; SchemeKTheoryOperations §5.5; KTheoryLowDegrees §12.3;
GeneralAlgebraicKTheory §13.8c.

**Checks.**

- `[O] = (1, 0)`, `[O(−1)] = (0, 1)` and `[O_∞] = (1, −1)`.
- over `𝔽₂`, `K_1(ℙ¹) = 0`, `K_2(ℙ¹) = 0` and `K_3(ℙ¹) ≅ (ℤ/3)²`.
- for `37a1` over `𝔽₂`, `E(𝔽₂) ≅ ℤ/5`, so `K_0(E)` is not generated by
  `[O_E], [O_E(−O)]`; for `y² + y = x³ + x + 1` over `𝔽₂`, `E(𝔽₂) = 0` but `#K_2(E) = 5 ≠ 1 = #K_2(ℙ¹)`.
- `SK_1(ℙ¹_F) = ∞_*F^×`.

### 5.5 Arithmetic inputs over a finite field

Four arithmetic theorems and a degree-one zero-cycle construction enter the finite-field computation. Let `X` be a
smooth projective geometrically connected curve over `F_q`, `q = p^r`, with function field `F`.

Prove closedPoints_coprimeDegrees: there are closed points of two coprime degrees. More
precisely, there is a closed point of every sufficiently large degree: Möbius inversion of
`#X(F_{q^n}) = Σ_{d∣n} d · #X_closed_degree_d`, together with the curve Weil bound
`|#X(F_{q^n}) − (q^n + 1)| ≤ 2g q^{n/2}`, makes the degree-`n` count positive for all sufficiently
large `n`; choose two consecutive such degrees. The bound is SchemeAndStackFoundations §5.11
applied to the base change of `X` to `F_{q^n}`, equally DeligneWeightsAndPurity DWP.1 §1.6; the
genus-one Hasse bound alone does not cover a curve of higher genus. *Needs:* SchemeAndStackFoundations §5.11 or DeligneWeightsAndPurity DWP.1 §1.6; finite-extension point counting and Möbius inversion.

Define
degreeOneZeroCycle to be a chosen finite integral zero-cycle `z = Σ n_x[x]` with
`Σ n_x[k(x):F_q] = 1`, obtained by Bézout from those degrees; its coefficients may be negative. *Needs:* closedPoints_coprimeDegrees and integer Bézout.

Prove zeroCycle_splitting: `Σ n_x N_{k(x)/F_q} i_x^*` retracts structure pullback on every
`K_n(F_q)`, since restriction followed by transfer is multiplication by `[k(x):F_q]`.
In degree one, `u ↦ Σ n_x(i_x)_* res_x(u)` is a section of `π_*` into `SK_1(X)`, by the projection
formula and `Σ n_x deg x = 1`. This supplies the base-point-free splitting needed below
(Weibel, *K-book*, VI.6.5–6.7, pp. 504–505, together with the finite-transfer formula V.6.6.4, p. 410).
The zero-cycle API has the following requirements.

- Its weighted residue degree is one, with integral coefficients of either sign.
- A rational point gives the one-term degree-one cycle.
- The weighted restriction–transfer sum retracts structure pullback in every degree.
- The weighted point-pushforward sum is a section of structure pushforward into `SK_1`. *Needs:* degreeOneZeroCycle; finite transfer and the projection formula, SchemeKTheoryOperations §§2.3–2.4 and KTheoryFiniteLocalFields §1.5; §4.1 for the special K-group.

**Checks for the zero-cycle.**

- On `ℙ¹` the rational origin is a one-term degree-one cycle, and the retraction is its pullback.
- For points of degrees two and three, `z = [x₃] − [x₂]` has degree one; the induced composite is
  `3 − 2 = 1`. Requiring effective coefficients would lose this construction.
- A single degree-two point gives composite multiplication by two, so cannot replace z.
- The zero cycle with all coefficients zero has degree zero and is rejected.

BMS_functionField: if `R` is the coordinate ring of a smooth affine curve over a finite field, then
`SK_1(R) = 0` (Bass–Milnor–Serre; Weibel, *K-book*, Variant III.2.5.1, p. 195). Hence for an affine
open `U = Spec R` of `X`, `K_1(R) = R^×`. The proof is the Mennicke-symbol argument of Bass–Milnor–Serre
for Dedekind rings of arithmetic type, which covers rings of `S`-integers of global function fields
with `S` non-empty; KTheoryLowDegrees §11.2 proves the number-field case, and this target is the
function-field case of the same argument. *Needs:* KTheoryLowDegrees §§10.1–10.3 and 11.2 for the Mennicke-symbol relations and arithmetic comparison; the function-field arithmetic-ring argument of Weibel III.2.5.1 is the target here.

Prove functionFieldSteinbergHomology: for the coordinate ring R of a smooth affine integral
curve over a finite field, fraction field F, every finite projective R-module P of positive rank,
and every h≥0, the integral group `H_h(Aut_R(P);St(P⊗_R F))` is finitely generated. Here St is the
top reduced integral homology of the building of proper nonzero F-subspaces; in rank one use
the augmented empty-building convention `St(F)=ℤ` in degree −1. This is the function-field
input to the supplied Dedekind criterion, proved independently of positive K-group finiteness
(Quillen, Oberwolfach report 26/1974, p. 7, second theorem; Grayson, pp. 69–90; Weibel IV.6.9,
preceding paragraph, p. 325). For a complement of one closed point the stronger statement is
finiteness for h>0; the general affine statement follows by localization of the arithmetic ring
and its building argument. *Needs:* ArithmeticKTheory §3.2's building, Steinberg module and
rank-filtration criterion; the function-field building and arithmetic-group homology argument is
part of this target.

**Checks for Steinberg homology.**

- For `R=𝔽₂[t]`, rank one has automorphism group `𝔽₂^×=1`, so `H₀=ℤ` and `H₁=0`.
- For `R=𝔽₃[t]`, rank one has `Aut(R)=ℤ/2`, so `H₀=ℤ` and `H₁=ℤ/2`; positive homology need not vanish.
- For `R=𝔽₂[t,t⁻¹]`, rank one has `Aut(R)=ℤ`, so `H₀=ℤ` and `H₁=ℤ`. Finite generation holds, while the stronger finiteness statement for a one-point complement does not extend to this two-point complement.

curveFiniteGeneration: if `R` is the coordinate ring of a smooth affine curve over a finite field,
then `K_n(R)` is finitely generated for every `n ≥ 0`; consequently `K_n(X)` is finitely generated
for every smooth projective curve `X` over `F_q` (Quillen; Weibel, *K-book*, Theorem IV.6.9 and the
paragraph before it, p. 325, used in the proof of Theorem VI.6.1, p. 502). The proof applies
ArithmeticKTheory §3.2's finiteness criterion, which holds for every Dedekind domain. Its first
hypothesis holds: `Pic(R)` is the quotient of `Pic(X)` by the classes of the finitely many deleted
closed points, and `Pic(X)` is an extension of a subgroup of `ℤ` by the finite group `Pic⁰(X)`,
while the deleted points have positive degree, so `Pic(R)` is finite. Its second hypothesis is functionFieldSteinbergHomology above: for every finite projective `R`-module `P` of positive rank and `q≥0`, `H_q(Aut_R(P);St(P⊗F))` is finitely generated. This input is proved here independently of Harder’s finiteness corollary. Quillen’s finite-generation conclusion is stated in Weibel IV.6.9, p. 325; Grayson’s exposition, pp. 69–90, is cited for its proof. Harder, Korollar (3.2.3), p. 175, assumes Quillen finite generation and cannot supply that step without a cycle. For
`X`, choose a closed point `x₀`: in the localisation sequence
`K_n(k(x₀)) → K_n(X) → K_n(X − x₀)` the left group is finitely generated (finite for `n ≥ 1` by
GeneralAlgebraicKTheory §13.8c, and `ℤ` for `n = 0`) and the right one finitely generated, so
`K_n(X)` is finitely generated. Finite generation is not
finiteness: `K_1(F_q[t, t⁻¹]) ≅ F_q^× × ℤ`. *Needs:* ArithmeticKTheory §3.2; functionFieldSteinbergHomology in this section; §3.1; GeneralAlgebraicKTheory §13.8c; JacobianChallenge Layers A–B for the Picard group.

reciprocitySequence_exact: the sequence
`K_2(F) → ⊕_x k(x)^× → F_q^× → 0`, whose second map is `⊕_x N_{k(x)/F_q}`, is exact. Weil reciprocity
(K2SymbolsBrauer §10.30) gives only that the composite vanishes, hence a surjection
`coker ∂ → F_q^×`. For injectivity: `SK_1(X) ≅ coker ∂` (§4.1); for any closed point `x₀`, the
localisation sequence for `X ⊃ X − x₀` and BMS_functionField give
`SK_1(X) ⊆ (i_{x₀})_* k(x₀)^×`, so `|coker ∂|` divides `q^{deg x₀} − 1`; two closed points of coprime
degree, which every such curve has, give `|coker ∂| ≤ q − 1`. With a rational point `P`, directly:
`SK_1(X) = P_*F_q^× ≅ F_q^×` (§4.2). This corrects the K-book, whose VI.6 opening attributes the
exactness to Weil reciprocity alone (p. 502). Consequently `K_1(X) ≅ F_q^× ⊕ F_q^×` and `V(X) = 0`. *Needs:* BMS_functionField, closedPoints_coprimeDegrees, zeroCycle_splitting for norm surjectivity, §4.1 and K2SymbolsBrauer §10.30.

tameKernel_finite: the tame kernel `K_2(X) = ker(∂ : K_2(F) → ⊕_x k(x)^×)` is finite of order prime
to `p`, for the smooth projective geometrically connected X of this subsection. Through
Matsumoto and §3.2, §3.8 identifies this scheme group with the Milnor tame-residue kernel over
all closed points. Use its finite generation and `p`-divisibility of the ambient Milnor group
from K2SymbolsBrauer §10.32c, with absence of `p`-torsion from KTheoryFiniteLocalFields §3.4
(Weibel, *K-book*, Theorem III.6.7, p. 238). The residue groups have orders prime to `p`, so
multiplication by `p` is bijective on their direct sum and on `K_2(F)`; it is therefore bijective
on the kernel. A finitely generated uniquely `p`-divisible abelian group is finite of order
prime to `p`. This is the scheme-K₂ corollary of the field-theoretic arithmetic inputs, with
the tame-boundary convention of §3.2. The independent Quillen theorem curveFiniteGeneration
also gives finite generation of this kernel and is needed in all higher degrees in §5.6;
it is not an input to K2SymbolsBrauer §10.32c. *Needs:* §§3.2, 3.8;
K2SymbolsBrauer §§7.2, 8.3, 10.32c; KTheoryFiniteLocalFields §3.4.

**Checks.**

- `SK_1(F_q[t]) = 0`, and for `R = F_q[t, t⁻¹]`, `K_1(R) = R^× ≅ F_q^× × ℤ`.
- over `𝔽₂`, `⊕_x k(x)^× → 𝔽₂^× = 1` is the zero map onto the trivial group, and
  the image of `∂` is everything.
- the vanishing of the normed composite alone does not give
  `K_1(X) ≅ F_q^× ⊕ F_q^×`; the coprime-degree argument does.
- for `X = ℙ¹_{F_q}`, the tame kernel is `0`.
- for a global function field `F`, `K^M_3(F) = 0`
  (K2SymbolsBrauer §10.33), so `K_3(F)` is uniquely `p`-divisible by
  KTheoryFiniteLocalFields §5.17 `geisserLevine_fieldComparison`.
- the imported comparison at `F=𝔽₂`, `n=0`, gives `ℤ/2^ν` on both sides; at
  `F=𝔽₂(s,t)`, `n=2`, the class `{s,t}` modulo two has nonzero `dlog(s)∧dlog(t)`.

### 5.6 Harder's theorem

Prove constantFieldReduction: for an integral smooth projective curve `X/F_q`, `k_X = H⁰(X,O_X)` is a finite field extension of `F_q`, and `X/k_X` is geometrically connected (Stacks, Lemmas 33.9.3–33.9.4, tags 0BUG and 0FD1). A smooth projective curve with several connected components is their finite disjoint union, and each component is integral. K-theory takes that union to a finite direct product. *Needs:* JacobianChallenge Layer B; SchemeKTheoryOperations §2.1 and localisation for open-and-closed components.

Prove harder: for every smooth projective curve `X` over a finite field of characteristic
`p` and every `n ≥ 1`, `K_n(X)` is finite of order prime to `p` (Weibel, *K-book*, Harder's Theorem VI.6.1
and proof, p. 502). First apply constantFieldReduction componentwise and replace `F_q` by the exact constant field. For a geometrically connected component, `n = 1` gives `K_1(X) ≅ F_q^× ⊕ F_q^×` (§5.5). For `n = 2`: `K_2(X)` is the tame kernel
(§3.8), finite of order prime to `p` (§5.5). For `n ≥ 3`: Bass–Tate gives `K^M_n(F) = 0` (K2SymbolsBrauer
§10.33), so by KTheoryFiniteLocalFields §5.17’s `geisserLevine_fieldComparison` `K_n(F)` and `K_{n+1}(F)` are uniquely `p`-divisible; the
residue groups `K_n(k(x))`, `K_{n−1}(k(x))` are finite of order prime to `p` (GeneralAlgebraicKTheory
§13.8c); the five-term segment
`K_{n+1}(F) → ⊕_x K_n(k(x)) → K_n(X) → K_n(F) → ⊕_x K_{n−1}(k(x))` and the five lemma for
multiplication by `p` make `K_n(X)` uniquely `p`-divisible. The first term must be kept: a four-term
argument does not give injectivity. Finally `K_n(X)` is finitely generated (curveFiniteGeneration
of §5.5: Quillen's theorem for the affine complement of a closed point and localisation with a
finite residue field), and a finitely generated abelian group with bijective
multiplication by `p` has rank zero and no `p`-torsion. Every closed residue field is finite, including at
non-rational points. The conclusion is stronger than finite generation and is a statement about curves;
it does not assume Parshin's conjecture in higher dimension. For an elliptic curve with its rational
origin this is harder_elliptic. *Needs:* §§3.1, 3.8, 4.1, 5.5; K2SymbolsBrauer §10.33;
GeneralAlgebraicKTheory §13.8c; KTheoryFiniteLocalFields §5.17 `geisserLevine_fieldComparison`.

**Checks.**

- properness cannot be removed: `F_q[t, t⁻¹]` has `K_1 ≅ F_q^× × ℤ`, infinite.
- For `ℙ¹_{𝔽₄}` regarded over `𝔽₂`, the exact constant field is `𝔽₄` and `K_1 ≅ (ℤ/3)²`, of order nine; using the stated base `𝔽₂` would incorrectly give zero.
- For `ℙ¹_{𝔽₂} ⊔ ℙ¹_{𝔽₄}`, the same degree-one K-group is `(ℤ/3)²`, as the first component contributes zero.
- for `ℙ¹_{F_q}`, `K_n = K_n(F_q)²`, finite of order prime to `p` for `n ≥ 1`.

### 5.7 The geometric curve as a Galois module

In §§5.7–5.11, `X/F_q` is smooth projective and geometrically connected. For any integral smooth projective curve, apply these formulas over k_X from §5.6, using `q_X = #k_X` and `Gal(k̄_X/k_X)`; for a disconnected curve take the finite product over components. Let `X̄ = X ×_{F_q} F̄_q`, `G = Gal(F̄_q/F_q)`, J the Jacobian of `X` (for an elliptic curve with its
origin, `J = E`), and `D = ⊕_{ℓ ≠ p} ℚ_ℓ/ℤ_ℓ`, so that `μ_{p'}(F̄_q) ≅ D(1)`.

Construct curveEInvariant: for `i≥1`, the natural map `e_{X,i} : K_{2i−1}(X) → H⁰(F_q,D(i))`; identify its restriction along structure pullback with the finite-field isomorphism `K_{2i−1}(F_q) ≅ H⁰(F_q,D(i))`. The same map for `F_q(X)` agrees with it under generic restriction. Use the odd K-theory e-invariant and its finite-field Harris–Segal summand, including the coefficient edge-map construction (Weibel, VI.2.1–2.5 and Remark VI.2.5.1; Example VI.6.3). The exceptional-field alternatives of VI.2.5.1 are not needed over a finite field. *Needs:* KTheoryFiniteLocalFields §§1.5–1.6; the coefficient comparison §4.0c; StableHomotopyKTheory §§7.4, 7.8.

Construct curveCoefficientEdge: for `ℓ≠p` and `i≥1`, the edge map `e^{div}_{X,i} : K_{2i}(X;ℚ_ℓ/ℤ_ℓ) → H⁰(X,ℚ_ℓ/ℤ_ℓ(i))`. Prove curveCoefficientEdge_split: structure pullback from `K_{2i}(F_q;ℚ_ℓ/ℤ_ℓ)` is a section after its finite-field edge identification, and the analogous statement holds over `F̄_q`. Thus the two surviving pieces split by this specified section, with complementary term identified by the trace. *Needs:* curveEInvariant; §4.0c; StableHomotopyKTheory §§7.4, 7.8; EtaleDualityAndPerverseSheaves §0.3 (Weibel, proof of VI.6.4, pp. 503–504).

Prove curveEInvariant_naturality: these edge and section maps commute with finite constant-field restriction, the coefficient connecting maps and geometric base change; the colimit splitting is G-equivariant. Use the natural continuity comparison of SchemeKTheoryOperations §2.7 for the curves, and GeneralAlgebraicKTheory §3.2 for their constant fields and function fields. The scheme comparison intertwines restriction and Galois pullback, and, after forming Moore-spectrum coefficients, the coefficient connecting maps. In particular these splittings split the actual base-change map on odd positive K-groups used in §5.9. *Needs:* the preceding two constructions, their natural coefficient spectral sequence maps from §4.0c, SchemeKTheoryOperations §2.7, StableHomotopyKTheory §§7.4, 7.8, and GeneralAlgebraicKTheory §3.2.

The API for the odd invariant and the coefficient edge records the following facts.

- The odd invariant retracts structure pullback through the finite-field isomorphism, and agrees with the function-field invariant under generic restriction.
- The coefficient edge retracts the specified structure-pullback section; its kernel is the complementary filtered piece, identified by the trace after the comparison.
- Both maps and the section commute with constant-field restriction, coefficient connecting maps and the Galois action over the algebraic closure.

**Checks for the splitting.**

- For `X=ℙ¹_{𝔽₃}` and `i=1`, the constant `−1∈K_1(𝔽₃)` maps under the e-invariant to `−1`, not to `1`; a zero retraction fails.
- Over `𝔽̄₃` with `ℓ=2`, the coefficient edge and section have composite `1` on `ℚ₂/ℤ₂(i)`. At `i=1`, the element of order four is sent back to itself, while arithmetic Frobenius multiplies it by `3`, giving its negative; both paths around the Galois square agree.
- Restriction from `𝔽₃` to `𝔽₉` in degree one sends `−1` to `−1`; the norm back is `(−1)^4=1`, in agreement with multiplication by the extension degree two. On `ℙ¹`, these identities hold in each of the two summands.

Prove
geometricK_galoisModule: for `i ≥ 1`, as G-modules,
```text
K_{2i−1}(X̄) ≅ D(i) ⊕ D(i),    K_{2i}(X̄) ≅ J(F̄_q)[1/p](i),
```
where `D(i)` has arithmetic Frobenius `q^i` and the prime-to-`p` torsion of J, on which arithmetic
Frobenius acts by `π`, acquires the extra twist `q^i π` (Weibel, *K-book*, Theorem VI.6.4, p. 503). For
`ℓ ≠ p` the divisible-coefficient groups are distinct objects:
`K_{2i}(X̄; ℚ_ℓ/ℤ_ℓ) ≅ (ℚ_ℓ/ℤ_ℓ(i))²` and `K_{2i−1}(X̄; ℚ_ℓ/ℤ_ℓ) ≅ J(F̄_q)[ℓ^∞](i − 1)`: degree `2i − 1`
with coefficients carries twist `i − 1`, integral degree `2i` carries twist i. Proof: write `X̄` as the
inverse limit of the qcqs curves over `F_{q^ν}`, indexed by divisibility of ν, with affine
transition maps (finite constant-field base change), and use scheme K-theory continuity
(SchemeKTheoryOperations §2.7), naturally for the maps of curveEInvariant_naturality; by
Harder every positive geometric K-group is torsion with no `p`-part (§5.6); the universal coefficient
sequences (StableHomotopyKTheory §§7.4, 7.8) and the motivic spectral sequence with its étale
comparison (KTheoryFiniteLocalFields §3.0a; §4.0c; §4.0b) reduce the computation to `Hⁱ(X̄, ℚ_ℓ/ℤ_ℓ(j))`, `i = 0, 1, 2`,
which are `ℚ_ℓ/ℤ_ℓ(j)`, `J(F̄_q)[ℓ^∞](j − 1)` by Kummer theory, and `ℚ_ℓ/ℤ_ℓ(j − 1)` by the trace
(EtaleDualityAndPerverseSheaves §0.3); the spectral sequence degenerates and the two even coefficient
terms split by curveCoefficientEdge_split and curveEInvariant_naturality (Weibel, *K-book*, Example VI.6.3, p. 503). A
two-piece associated graded does not by itself determine the group or its G-action. The coefficient
table of VI.6.4, p. 503, correctly uses X̄. In its proof on p. 504, the e-invariant source
must instead read `K_{2i}(X̄;ℚ_ℓ/ℤ_ℓ)` (weibel line 30724); the arithmetic and geometric groups differ (at `n = 2`,
`X = ℙ¹/𝔽₂`, integral `K_1(X) = 0` while `K_2(X̄; ℚ_ℓ/ℤ_ℓ)` has two non-zero divisible summands). The
source's `μ(i)` means `ℚ/ℤ[1/p](i)`, the roots of unity with the twist, not one further twist. *Needs:*
§5.6; curveEInvariant, curveCoefficientEdge_split and curveEInvariant_naturality in this section; SchemeKTheoryOperations §2.7; KTheoryFiniteLocalFields §1.6; KTheoryFiniteLocalFields §3.0a; §4.0c; §4.0b;
EtaleDualityAndPerverseSheaves §0.3; StableHomotopyKTheory §§7.4, 7.8.

**Checks.**

- `K_1(X̄) ≅ F̄_q^× ⊕ F̄_q^×` with arithmetic Frobenius acting by `q`.
- `K_2(Ē)` is the prime-to-`p` torsion of `E(F̄_q)` with the additional first
  twist.
- the coefficient group in degree `2i − 1` has twist `i − 1`, integral `K_{2i}`
  has twist i.

### 5.8 Twisted cohomology descent

For every smooth projective geometrically connected curve `X/F_q`, with Jacobian J of
dimension g, `ℓ ≠ p` and `j ≥ 2`, prove cohomologyDescent: the natural maps give
`H^r(X, ℚ_ℓ/ℤ_ℓ(j)) ≅ H^r(X̄, ℚ_ℓ/ℤ_ℓ(j))^G ≅ H^{r+1}(X, ℤ_ℓ(j))` for `r ≥ 0`, and these groups vanish for
`r ≥ 3`. The geometric groups `H⁰, H¹, H²` are `ℚ_ℓ/ℤ_ℓ(j)`, `J(F̄_q)[ℓ^∞](j − 1)` and
`ℚ_ℓ/ℤ_ℓ(j − 1)`. If the eigenvalues of `π` on `V_ℓJ` are `α₁,…,α_{2g}`, then
`|α_s| = √q` and their multiset is stable under `α ↦ q/α` (DeligneWeightsAndPurity DWP.1
§§1.4, 1.6–1.7, with DWP.0 §0.2(iii)). Arithmetic Frobenius on twisted cohomology has eigenvalues `q^j` in degree zero,
`q^j/α_s`, equivalently the multiset `q^{j−1}α_s`, in degree one, and `q^{j−1}` in degree two.
Thus `F − 1` is invertible on the rational spaces and surjective on the divisible groups.
For an elliptic curve this specialises to the roots of `T² − a_qT + q`.
For `j ≥ 2` no eigenvalue is one; the continuous Hochschild–Serre
sequence (ArithmeticGaloisDuality R02.2 for the discrete coefficients `ℚ_ℓ/ℤ_ℓ(j)`, Layer D7 for
`ℤ_ℓ(j)`) with `cd_ℓ Ẑ = 1` (ProfiniteCohomology Layer 11) and `H¹(Ẑ, M) = M/(F − 1)M`
(SelmerIwasawaCohomology §2.7, for these discrete torsion and compact `ℓ`-adic modules) gives the invariants, and the coefficient triangle
`ℤ_ℓ(j) → ℚ_ℓ(j) → ℚ_ℓ/ℤ_ℓ(j)` gives the degree shift (Weibel, *K-book*, VI.6.5–6.6, p. 504). The
restriction `j ≥ 2` is essential: the K-book's paragraph before Example VI.6.5 asserts
`H^*(X, ℚ_ℓ(i)) = H^*(X̄, ℚ_ℓ(i))^G` for every i, which fails for `i = 0`, where
`H¹(Spec F_q, ℚ_ℓ) = ℚ_ℓ`. *Needs:* §5.7; DeligneWeightsAndPurity DWP.0 §0.2 and DWP.1 §§1.4, 1.6–1.7;
EtaleDualityAndPerverseSheaves §§0.3, 0.5; ArithmeticGaloisDuality R02.2 and Layer D7;
ProfiniteCohomology Layers 10–11; SelmerIwasawaCohomology §2.7.

**Checks.**

- For `y²=x³−x` over `𝔽₃`, there are four rational points and `a₃=0`. Arithmetic Frobenius on `V_ℓE` has determinant `3`; its action on untwisted `H¹` has determinant `1/3`, while geometric Frobenius on `H¹` has determinant `3`. The twisted arithmetic determinant at `j=2` is `3⁴/3=27`.
- On `ℙ¹_{𝔽̄₂}`, the étale sheaf `μ₂` is zero, so `H²_et(ℙ¹,μ₂)=0`; `ℤ/2` has two elements. For `n=3`, trace instead gives `H²_et(ℙ¹,μ₃)=ℤ/3`. Thus Kummer and trace require positive invertible `n`.
- for trivial action, `H¹(Ẑ,ℤ/3)=ℤ/3` and `H¹(Ẑ,ℤ_ℓ)=ℤ_ℓ` with the latter
  module carrying its compact topology. For discrete `ℤ`, continuous homomorphisms have finite
  image and are zero, whereas the coinvariants are `ℤ`; the formula excludes this coefficient.
- at `j = 0`, `H¹(Spec F_q, ℚ_ℓ) = ℚ_ℓ`, so the unrestricted invariants
  identity is false.
- `H¹(Ē, ℚ_ℓ/ℤ_ℓ(j))` carries elliptic torsion with twist `j − 1`.
- for `j = 2` all three rational operators `F − 1` are invertible.
- for `ℙ¹`, `J = 0`, so the middle geometric cohomology group vanishes;
  for genus two the rational Tate module has dimension four and its Frobenius polynomial has four roots over an algebraic closure, counted with multiplicity. The proof must cover both.

### 5.9 Descent of positive K-groups

Prove positiveK_descent: for every `n > 0` the base-change map `K_n(X) → K_n(X̄)^G` is an
isomorphism (Weibel, *K-book*, Theorem VI.6.7 and proof, p. 505). It is a calculation for curves, made
through the divisible-coefficient comparison and Harder's theorem, not a claim of unrestricted integral
Galois descent for scheme K-theory. By §5.6 compute `K_n(X)` one prime `ℓ ≠ p` at a time as
`K_{n+1}(X; ℚ_ℓ/ℤ_ℓ)` by universal coefficients; the curve's motivic spectral sequence with the descent of
§5.8 in weights `j ≥ 2` identifies the geometric base-change map with taking invariants and has no
surviving differentials; curveCoefficientEdge_split and curveEInvariant_naturality (§5.7) handle the two odd summands compatibly with base change. Treat `n = 1`
separately by the exact reciprocity sequence and the degree-one zero-cycle splitting of §5.5, which covers the
weight-one boundary without applying §5.8 outside its range. Assemble the primary parts using finite
support. The resulting map is the base-change map of K-theory, not an arbitrary additive equivalence.
*Needs:* §§4.1–4.2, 5.5–5.8; KTheoryFiniteLocalFields §3.0a; §4.0c; §4.0b; StableHomotopyKTheory §§7.4, 7.8.

**Checks.**

- for `n = 1` the map identifies both copies of `F_q^×` inside the two geometric
  root-of-unity copies.
- `K_0(E) ≅ ℤ² ⊕ E(F_q)` is not finite; the finiteness statements are for
  `n > 0`, and in degree zero the base-change map is the isomorphism of §2.5 onto
  `ℤ² ⊕ E(F̄_q)^G = ℤ² ⊕ E(F_q)`.
- base change to `F_{q^r}` replaces the arithmetic generator `σ` by `σ^r`.

### 5.10 The twisted Frobenius kernel

Let `k` be a finite field with `q` elements and characteristic `p`, `W` an elliptic Weierstrass curve
over `k`, `L/k` a field extension and `i ≥ 0`. The following subgroup definition also makes sense
for the nonsingular point group of any Weierstrass equation; its interpretation as an elliptic
K-group requires `W.IsElliptic`. Define
```text
twistedFrobeniusKernel W L i := { P ∈ (W⁄L).Point | (∃ m > 0, gcd(m, p) = 1, m • P = 0) ∧ q^i • π(P) = P },
```
where `π = Point.map (FiniteField.frobeniusAlgHom k L)` is the `q`-power map on points, as an
AddSubgroup of Mathlib's point group. It is closed under addition (product of coprime annihilators)
and negation, and the Frobenius condition is preserved because `π` is additive. For `L = F̄_q` it is the
G-fixed subgroup of the prime-to-`p` torsion with the extra i-th twist, `E(F̄_q)[1/p](i)^G`
(Weibel, *K-book*, VI.6.4 and VI.6.7, pp. 503–505, with the twist convention of Definition VI.1.7).
Nothing about Tate modules, K-groups or scheme models is defined again. Its API has the following requirements.

- Membership in `twistedFrobeniusKernel` is exactly the prime-to-characteristic torsion and Frobenius conditions above; zero belongs for every i.
- For a k-rational prime-to-p torsion point, membership after base change is equivalent to `(q^i−1) • P=0`.
- Every k-algebra field map transports the subgroup through `Point.map`; an isomorphism induces an additive equivalence with that underlying point map.
- If `p • P=0` and P belongs, then `P=0`, since its order divides coprime annihilators. *Needs:* Mathlib `WeierstrassCurve.Affine.Point`,
`Point.map`, `FiniteField.frobeniusAlgHom`, `AddSubgroup.torsionBy`; EllipticCurves Layers 1–2;
WeightsInEtaleCohomology R34.2.

**Checks.**

- `0 ∈ B_i` for every `i ≥ 0`, including `i = 0`.
- on `y² = x³ − x` over `𝔽₃`, the point `(0, 0)` has order two
  and lies in `B₁(W, 𝔽₃)`, since `q − 1 = 2`.
- on `y² + xy = x³ + 1` over `𝔽₂`, the rational
  point `(0, 1)` has order two and is not in `B₀(W, 𝔽₂)`, although Frobenius fixes it.
- for `y² + y = x³ + x + 1` over `𝔽₂`, `#B₁(W, F̄₂) = 5` while
  `#B₀(W, F̄₂) = 1`; omitting the twist gives the wrong group.
- for `y² + y = x³ + x` over `𝔽₂`, `#E(𝔽₂) = 5`, `a = −2` and
  `#B₁(W, F̄₂) = 13`, against `a = 2` and order five for the previous curve.

### 5.11 The K-groups of a curve over a finite field

Prove finiteFieldK_odd: for a smooth projective geometrically connected curve `X` over `F_q` and
`i ≥ 1`, `K_{2i−1}(X) ≅ K_{2i−1}(F_q) ⊕ K_{2i−1}(F_q) ≅ (ℤ/(q^i − 1))²` as abelian groups; in degree one,
`K_1(X) ≅ F_q^× ⊕ F_q^×`. The field summand is split by curveEInvariant (§5.7), with the coefficient edge and section compatible with descent by curveEInvariant_naturality; the complementary summand is identified by the trace. In degree one a degree-one zero-cycle supplies the second section (§5.5); cyclic generators are not canonical (§§5.7, 5.9;
GeneralAlgebraicKTheory §13.8c; Weibel, *K-book*, Theorem VI.6.7, p. 505). Prove finiteFieldK_even:
`K_{2i}(X) ≅ ⊕_{ℓ ≠ p} J(F̄_q)_ℓ(i)^G`, and for an elliptic curve E with origin,
`K_{2i}(E) ≅ twistedFrobeniusKernel W F̄_q i = ⊕_{ℓ ≠ p} ker(1 − q^i π : E[ℓ^∞] → E[ℓ^∞])`. Each primary
term is canonically `coker(1 − q^i π : T_ℓE → T_ℓE)`: `1 − q^i π` is invertible on `V_ℓE` because
`|q^i α| = q^{i + 1/2} > 1`, and the snake lemma on `0 → T_ℓE → V_ℓE → E[ℓ^∞] → 0` gives the
cokernel-to-kernel isomorphism (an invariant-lattice kernel is zero here and is not the group). Only
finitely many primes contribute: use a direct sum. Prove finiteFieldK_orders, whose even half is the Lean statement `card_twistedFrobeniusKernel`
(`Nat.card (twistedFrobeniusKernel W (AlgebraicClosure k) i) = 1 − a_q q^i + q^{2i+1}` for `i ≥ 1`): with
`a_q = q + 1 − #E(F_q)` (Tau Ceti's `frobeniusTrace`),
```text
#K_{2i−1}(E) = (q^i − 1)²,     #K_{2i}(E) = D_i := 1 − a_q q^i + q^{2i+1}   (i ≥ 1).
```
`D_i = deg(1 − [q^i]π) = (1 − q^iα)(1 − q^iβ) > 0` by the quadratic degree form and
`π² − [a_q]π + [q] = 0` (EllipticCurves Layers 1 and 3); `D_i ≡ 1 mod p`; the differential of
`1 − [q^i]π` is the identity, so the isogeny is separable and its geometric kernel, of order D_i and
prime to `p`, is exactly B_i. A cardinality does not determine the invariant factors of the even
group. Finally ellipticFiniteField_summary collects these: every positive K-group of `E/F_q` is finite
of order prime to `p`, `K_1 ≅ (F_q^×)²`, `SK_1(E) ≅ F_q^×`, the odd groups are two copies of those of
`F_q`, and the even groups are twisted Galois invariants of elliptic torsion; this does not follow from
the K-theory of `F_q` alone. *Needs:* §§2.7, 5.5–5.10; GeneralAlgebraicKTheory §13.8c; EllipticCurves
Layers 1–3; WeightsInEtaleCohomology R34.2; Tau Ceti `frobeniusTrace`, TauCeti.Isogeny.frobeniusIsogeny.

**Checks.**

- for every elliptic `E/𝔽₂`, `K_1(E) = 0` and `K_3(E) ≅ (ℤ/3)²`.
- for every elliptic `E/𝔽₃`, `K_1(E) ≅ (ℤ/2)²`, independent of `#E(𝔽₃)`.
- for `i = 1` the operator is `1 − qπ`, not `1 − π` and not `1 − q²π`.
- for `y² + y = x³ − x` over `𝔽₂` (`a = −2`): `K_0(E) ≅ ℤ² ⊕ ℤ/5`, `K_1(E) = 0`,
  `#K_2(E) = 13`, `K_3(E) ≅ (ℤ/3)²`, `#K_4(E) = 41`.
- for `y² + y = x³ + x + 1` over `𝔽₂` (`#E = 1`, `a = 2`): `#K_2 = 5`, `#K_4 = 25`; `K_4 ≅ ℤ/25`
  is not inferred from the order.
- for `y² = x³ − x` over `𝔽₃` (`#E = 4`, `a = 0`): `#K_2(E) = 28`.
- `D_i ≡ 1 mod p`, an independent check that the characteristic is excluded.

### Examples

Over `𝔽₂` the curve `37a1`, `y² + y = x³ − x`, has `E(𝔽₂) ≅ ℤ/5`, `a = −2`, `K_1 = 0`, `#K_2 = 13`,
`K_3 ≅ (ℤ/3)²`, `#K_4 = 41`; the curve `y² + y = x³ + x + 1` has `E(𝔽₂) = 0`, `a = 2`, `#K_2 = 5`,
`#K_4 = 25`; `ℙ¹_{𝔽₂}` has `K_2 = 0` and `K_3 ≅ (ℤ/3)²`. For `[3]` on any elliptic curve over `ℚ`,
`[3]_*[3]^* = 9`; for the 2-isogeny from `y² = x³ − x` to `y² = x³ + 4x`, `f_*f^*(1) = (2, 0, P_f)` with
`P_f ≠ O`.

### Dependencies

Layers 1–4; EtaleCohomologyFoundations F.0–F.1; MotivicEtaleKTheory §§2.2–2.3; SchemeKTheoryOperations §§2.2–2.4, 2.7, 5.5; GeneralAlgebraicKTheory §§3.2, 4.14;
SchemeAndStackFoundations §5.11;
KTheoryLowDegrees §§11.2, 12.3; K2SymbolsBrauer §§10.30, 10.32c, 10.33; GeneralAlgebraicKTheory §13.8c;
KTheoryFiniteLocalFields §§1.6, 3.0, 3.4, 5.17; ArithmeticKTheory §3.2; KTheoryFiniteLocalFields §3.0a; §4.0c; §4.0b; StableHomotopyKTheory §§7.4, 7.8; SelmerIwasawaCohomology §2.7;
EtaleDualityAndPerverseSheaves §§0.3, 0.5; WeightsInEtaleCohomology R34.2; ArithmeticGaloisDuality
R02.2 and Layer D7; DeligneWeightsAndPurity DWP.0 §0.2 and DWP.1 §§1.4, 1.6–1.7; ProfiniteCohomology
Layers 10–11; ModularCurves Layer 2D; EllipticCurves Layers 1–3.
## Layer 6: Regular models over S-integers and the integral part

Over a number field the K-theory of E is compared with that of a regular arithmetic surface. This
layer resolves a specified Weierstrass equation over a ring of `S`-integers, uses the supplied
regular-model existence theorem, and proves existence and uniqueness of the
minimal one by reduction to StableReduction's local theory over discrete valuation rings, defines the
integral part of `K_2(E) ⊗ ℚ`, proves it independent of the model, and describes it by vertical
residues.

Throughout, `F` is a number field, `S` a finite set of finite places, `O = O_{F,S}`, and `E = E_W` an
elliptic curve over `F`.

### 6.1 Regular proper models

For a Dedekind domain O with fraction field F and fixed `toField : C → Spec F` (here `C = E`),
use the full subcategory of RelativeJacobiansAndIntegralCurveModels §0.1's `DedekindModel`
on proper models with regular total space. Minimality and K-theory below use this category.
The acceptance definition `RegularProperModel O F C toField` is a native adapter: a scheme `𝓔` with a proper flat
morphism `𝓔 → Spec O`, all of whose local rings are regular, together with an isomorphism
`genericIso : 𝓔 ×_O F ≅ C` **over `F`**, expressed by
`genericIso.hom ≫ toField = pullback.snd`; an absolute scheme isomorphism alone is insufficient.
The adapter bundling, the marked morphisms and the outgoing-minimality predicate make sense for any
commutative ring O, field `F` with an O-algebra structure, and scheme `C → Spec F`; the
uniqueness of marked morphisms in §6.3 needs only that O is Dedekind with fraction field `F`.
The existence, minimality, uniqueness and localisation results of §§6.2–6.7 use only that O is
an excellent Dedekind domain with torsion class group; they are stated for `O_{F,S}` and hold, with
the same proofs, over the ring of functions regular outside a non-empty finite set of places of a
global function field. The integral part of §§6.8–6.10 is stated over number fields.
The curve here is the scheme of Layer 1 (Conrad, *Minimal models for elliptic curves*, Definition 3.1, p. 6, over a discrete
valuation ring; Scholl, *Integral elements in K-theory*, 1.1.1–1.1.2, p. 3, for projective regular models
over rings of `S`-integers).

Construct regularProperModelEquivalence from the category of these adapters and their
`RegularProperModel.Hom` maps to the proper/regular full subcategory of `DedekindModel` over
`Spec O`. Its inverse retains the same total scheme, structure morphism and marking; in the
forward direction finite presentation follows from properness over the noetherian base.
The comparison uses the canonical pullback identification for the generic fibre, not an
unmarked isomorphism of total schemes. Its API has the following requirements.

- Both functors preserve total schemes and structure maps, with the given generic-fibre marking over the fixed `Spec F`; their unit and counit have identity underlying scheme maps.
- The hom-set bijections preserve the underlying scheme maps, identity and composition, so they preserve and reflect isomorphisms of total schemes.
- The equivalence commutes, through the canonical base-change identifications, with restriction to open bases and height-one localisation. Its local comparison is the supplier's equivalence with `TauCeti.Model`.
- Define outgoing minimality on the proper/regular full subcategory by requiring every outgoing marked morphism to be an isomorphism. Prove regularProperModelEquivalence_minimal_iff: this is equivalent to `RegularProperModel.IsMinimal` of the adapter.

**Checks for the adapter equivalence.**

- For a smooth proper elliptic model over `ℤ[1/37]`, both composites return its total scheme, its structure map and its marking; the underlying composite map is the identity.
- On `37a1`, the elliptic involution sends the point `(0,0)` of the generic fibre to `(0,−1)`. An identity map with one marking twisted by this involution fails the marked-morphism equation on both sides; forgetting the marking would admit it.
- A point blow-up at `(2,x,y)` has exceptional fibre `ℙ¹_{𝔽₂}`. Both categories contain its blow-down and neither contains a marked inverse; localisation at 2 keeps this curve and localisation at 3 makes the blow-down an isomorphism.

*Needs for the equivalence:* RelativeJacobiansAndIntegralCurveModels §0.1; Mathlib properness,
`LocallyOfFinitePresentation.iff_locallyOfFiniteType`, scheme pullbacks and their canonical comparison
isomorphisms. The adapter comparison is specific to the acceptance presentation; it introduces
no additional global model theory.

Regularity is required at every point, including the closed points of the
fibres, while the fibres themselves may be singular, reducible and non-reduced. For a closed point `v` of
`Spec O` the fibre `𝓔_v = 𝓔 ×_O k(v)` is a proper curve over `k(v)` with irreducible components `C_i` and
multiplicities `m_i`, and `div(π_v) = Σ m_i C_i`; these come from StableReduction Layer 5 over the local
ring `O_(v)` (Stacks, Lemma 55.9.1, tag 0C5Z). The model API records the following facts.

- Every total-space stalk is regular, including those on singular fibres.
- The fibre is the actual scheme base change to `k(v)`, with its finite set of irreducible components.
- The multiplicity `m_i` is the length of the fibre local ring at the generic point of `C_i`, equal to `ord_{C_i}(π_v)`.
- The divisor of the local base uniformiser is `Σ m_i C_i`. Two natural candidates are compared, not excluded by fiat. Prove
weierstrassModel_regular_iff: the projective Weierstrass model of an equation minimal at `v` is regular
over `v` if and only if the minimal regular model has irreducible fibre at `v` (Conrad, Corollary 4.7 and
proof, p. 12; this covers Kodaira types I_0, I_1, II). The comparison Checks below use the
Néron-model supplier contract: smoothness alone does not give a regular proper model.
*Needs:* §1.2; ArithmeticKTheory §1.1; StableReduction Layer 5; ModularCurves Layer 1A over O;
NeronModelsAndSemistableAbelianVarieties §§1.8, 2.7, 6.5.

**Checks.**

- with `O = F = ℚ(s)`, composing a marking with the absolute scheme
  automorphism induced by `s ↦ s + 1` fails the required equality over the fixed `Spec F`.
  The identity marking passes, and `genericFibreInclusion ≫ toBase` equals the fixed structure
  map of C followed by `Spec(F) → Spec(O)`; this is the required triangle for the marked inclusion.
- for `y² + y = x³ − x` over `ℤ` (`Δ = 37`, type I_1 at 37), the fibre at 37
  is singular only at `(5, 18)` and `F(5, 18) = 222 ≢ 0 mod 37²`, so the projective Weierstrass model is a
  regular proper model.
- for `y² + y = x³ − x² − 10x − 20` (type I_5 at 11), `F(5, 5) = 0` and
  both partial derivatives are divisible by 11 at `(5, 5)`, so `F ∈ (11, x − 5, y − 5)²` and the
  Weierstrass model is not regular.
- `y² = x³ − 81x`, the rescaling of `y² = x³ − x` by `u = 3`, has good reduction
  at 3, but its Weierstrass model is not regular at `(3, x, y)`.
- over `ℤ[1/37]` the Néron model of `37a1` is its smooth proper
  Weierstrass model, a regular proper model.
- over `ℤ` the fibre at 37 of the Néron model of `37a1` is the smooth
  locus of the nodal cubic, a non-split torus since `a_37 = −1`, and is not proper.

### 6.2 Resolution of a specified Weierstrass model

Prove excellentSurfaceResolution: for an integral excellent noetherian scheme Y of dimension two, there is a projective birational morphism `r : X → Y` with `X` regular, obtained by finite normalization and normalized blow-ups with centres away from the regular locus; r is an isomorphism over that locus. Excellence gives finite normalization and geometrically regular formal fibres, hence normal completions of the normal surface; its singular locus is a finite set of closed points. Apply the normalized-blow-up resolution and its local-to-global construction (Stacks, Theorem 54.14.5, tag 0BGP, proof of (4) ⇒ (3)). This target extends the curve-model existence of RelativeJacobiansAndIntegralCurveModels §5.1 to a modification of a specified excellent surface; StableReduction Layer 4 supplies the DVR case. *Needs:* Mathlib’s noetherian scheme carriers and StableReduction Layer 4’s blow-up construction; the excellent-normalization and normal-completion inputs and their local-to-global use in Stacks 54.14.5 are included in this target.

**Checks for surface resolution.**

- For the regular surface `Spec ℤ[t]`, choose the identity: every fibre and the generic fibre are unchanged.
- For `Spec ℚ[x,y,z]/(xy−z²)`, the vertex has embedding dimension three and dimension two; a resolution changes it but is the identity on its regular complement.
- For `11a1` over `ℤ`, `(11,x−5,y−5)` is singular; for `37a1` the candidate point at 37 has `F(5,18)=6·37`, not a multiple of `37²`, so its total space is already regular.

Use RelativeJacobiansAndIntegralCurveModels §5.1's `exists_regularProperModel` in its
`DedekindModel` proper/regular subcategory for abstract existence over `Spec O_{F,S}`;
transport it to the acceptance adapter through regularProperModelEquivalence of §6.1.
Prove weierstrassModel_resolution: for a specified integral
Weierstrass equation W_O with generic curve E, construct a marked regular proper model X and
a projective birational O-morphism `X → W_O`, inducing the fixed generic marking; the
resolution is an isomorphism over the regular locus of W_O, in particular over the primes where the
equation has unit discriminant. W_O is integral, two-dimensional, proper, flat and of finite type over
the excellent Dedekind domain `O_{F,S}` (ModularCurves Layer 1A over O), so it has a resolution of
singularities `X → W_O` by Lipman's theorem (Stacks, introduction to Resolution of Surfaces, tag 0ADX,
with Theorem 54.14.5, tag 0BGP); `X` is regular and proper over O, and flat because it is integral and
dominates `Spec O`. Preservation of the regular locus follows by taking normalization and the
normalized blow-ups supported at singular points in the proof of Stacks, Theorem 54.14.5,
tag 0BGP. Compare X with any supplied marked regular model by the common resolution of §6.4,
without asserting a canonical choice of resolution. Lemma 55.8.3, tag 0C2U, supplies local existence. A normal surface can still have singular points that must be resolved. Over each localisation `O_(v)` a minimal regular model exists and is unique in genus one
(StableReduction Layer 5; Stacks, Lemma 55.10.1, tag 0C6B; Conrad, Theorem 3.10, p. 8). *Needs:* §6.1; excellentSurfaceResolution in this section; StableReduction Layer 5 for the local minimal model; ModularCurves Layer 1A;
RelativeJacobiansAndIntegralCurveModels §5.1. *Needs for the comparison:* §6.4; it is not an input to resolution.

**Checks.**

- for `37a1` over `ℤ` the resolution is the identity.
- the resolution changes nothing over the primes of good reduction of an
  integral equation with unit discriminant there.
- for `11a1` over `ℤ` the resolution is not an isomorphism over 11.
- the surface `xy = z²` over a field of characteristic different from two is
  normal and singular at its vertex; resolution cannot preserve the entire normal locus.

### 6.3 Model morphisms and minimality

A model morphism `f : X → Y` between regular proper models of the fixed marked curve E is an
O-morphism inducing the identity of E: it respects the structure maps and `i_X ≫ f = i_Y` for the
generic-fibre embeddings `i_X = genericFibreInclusion`. Use the supplier's marked morphisms,
identity, composition and Hom.ext through the full subcategory of §6.1. The native
`RegularProperModel.Hom` bundles the underlying scheme map and these same two equations;
regularProperModelEquivalence identifies it with that hom-set. Use the supplier's generic-density
uniqueness: between two such models there is at most one marked morphism, since `X` is reduced
(regular), its generic fibre is dense (flatness) and Y is separated over O (proper), as in Mathlib's
`ext_of_isDominant_of_isSeparated`. Define `RegularProperModel.IsMinimal M` on the adapter:
every model morphism `M → N` is an isomorphism on total schemes (Conrad, Definition 3.8 and Example 3.9,
p. 8: the marking is part of the object). Prove the reformulation using isomorphisms of total schemes for every outgoing model morphism, and that an identity-marked isomorphism preserves this property. Local relative
minimality of `M` means that for every closed point `v` of `Spec O`, `M ×_O O_(v)` has no exceptional curve
of the first kind in the sense of StableReduction Layers 4–5 (Stacks, Definition 55.8.4, tag 0C2V). Prove
toLocalModel: localising at `v` and forgetting regularity and properness gives Tau Ceti's
`TauCeti.Model O_(v) F E`, with the same marking; toLocalModelHom sends a model morphism to a
TauCeti.Model.Hom by base change, its generic-fibre equality using `TauCeti.genericFiberTowerIso`; and
toLocalModel_totalIso identifies the total scheme of toLocalModel M v with `M ×_O O_(v)`. Regularity and
properness are kept as separately verified properties; no second local model carrier is introduced.
*Needs:* §6.1; RelativeJacobiansAndIntegralCurveModels §0.1; StableReduction Layers 4–5; Mathlib `ext_of_isDominant_of_isSeparated`; Tau Ceti
`TauCeti.Model`, genericFiberTowerIso.

**Checks.**

- Hom.id M respects both triangles; every marked endomorphism is this map.
- the nontrivial elliptic involution extends to the model of
  `37a1`, but fails Hom.generic with fixed marking, although it is an automorphism over `ℤ`.
- the blow-down from a point blow-up is a marked morphism to
  the original model; an inverse morphism would make the blow-down an isomorphism and cannot exist.
- the model `y²z + yz² = x³ − xz²` over `ℤ[1/37]` is smooth, proper and minimal:
  `Δ = 37` is a unit and its fibres are smooth genus-one curves.
- the same model over `ℤ` is regular and minimal although its fibre at 37 is nodal
  (type I_1, irreducible, no exceptional curve).
- blowing up the rational point `(0, 0)` of the fibre at 2 of the smooth model
  gives a regular proper flat model with the same marking that is not minimal: its blow-down has
  exceptional fibre `ℙ¹_{𝔽₂}` and is not an isomorphism.

### 6.4 Regular models linked by blow-ups

Prove regularModels_linked: for regular proper flat models `𝓔₁, 𝓔₂` of E over `O_{F,S}` there is a
regular proper model `X` with model morphisms `X → 𝓔₁` and `X → 𝓔₂`, each a composite of blow-ups in closed
points (Stacks, Lemma 54.17.2, tag 0C5S, with base `Spec O`). The models are integral, regular of dimension
two, proper over the noetherian `Spec O` and O-birational; each blow-up is again regular and proper, and
flat because integral and dominant. This is the global common-resolution target; the local common-resolution theorem of StableReduction Layer 4 is used only over a DVR. *Needs:* §6.1; the global point-blow-up factorisation of proper birational maps between regular two-dimensional schemes, included in this target (Stacks, Lemmas 54.17.1–54.17.2).

**Checks.**

- for two minimal regular models the chain is trivial (§6.7).
- for `𝓔₂` the blow-up of `𝓔₁` in a closed point, `X = 𝓔₂` with the blow-down and the
  identity.
- blow up `(0,0)` on the fibre at 2 of the smooth `37a1` model. The blow-down has
  identity generic marking; composing it with `(x,y)↦(x,−y−1)` sends generic `(0,0)` to
  `(0,−1)` and fails that marking.

### 6.5 Existence of a locally minimal model

Prove exists_locallyMinimal: there is a projective regular proper flat `O_{F,S}`-model `M` of E such
that `M ×_O O_(v)` is relatively minimal for every closed point `v`, obtained from a projective regular
proper model by finitely many contractions of vertical exceptional curves of the first kind, each fixing
the marked generic fibre. Start from the projective model of §6.2. The non-smooth locus is closed and
misses the generic point, so only finitely many primes have non-smooth fibres and they have finitely many
components; in a smooth fibre a component is the divisor of a uniformiser locally, with trivial normal
sheaf, so it is not exceptional. A local exceptional component is the same closed Cartier curve on the
global surface, since localisation at its prime preserves the local rings along it and its normal sheaf.
Prove and apply globalExceptionalContraction: for a projective finite-type morphism `X → S` over a noetherian base and an exceptional curve of the first kind contained in a fibre, there is a contraction `X → X'` with `X'` projective over `S`. It is the blow-up of a regular two-dimensional point and is an isomorphism away from the curve (Stacks, Lemma 54.16.9(1), tag 0C2N). This includes the nonlocal base; StableReduction Layer 4 supplies its DVR specialisation. In the present regular surface case, the contracted point has a regular two-dimensional local ring, the map is an
isomorphism elsewhere, and the target is projective, regular, integral, with generic fibre E, and flat
because its local rings are torsion-free O-modules (Mathlib's `IsDedekindDomain.flat_iff_torsion_eq_bot`).
Each contraction removes one component over the fixed finite set of primes; induct on that count (Stacks,
Lemma 55.8.5, tag 0CD9, and Proposition 55.8.6, tag 0C2W, in the local case). Exceptional curves are
effective Cartier divisors isomorphic to `ℙ¹` over their field of constants with normal sheaf `O(−1)`, not
merely rational components with a guessed self-intersection. *Needs:* §§6.2–6.3; StableReduction Layers
4–5 for the local theory; globalExceptionalContraction in this section.

**Checks.**

- a smooth proper elliptic model is already an output, with no contraction.
- A point blow-up of `Spec ℤ[t]` at `(2,t)` has exceptional curve `ℙ¹_{𝔽₂}` with normal bundle `O(−1)`; global contraction recovers `Spec ℤ[t]`.
- a point blow-up of such a model requires one contraction; regularity of the
  initial model does not imply minimality.
- In the smooth fibre of an elliptic model, the whole fibre has trivial normal bundle, of degree zero; it fails the `O(−1)` condition and is not contracted.

### 6.6 The terminal property and the local criterion

Prove `locallyMinimal_terminal`: for a regular proper `O_{F,S}`-model M of the marked E with
`RegularProperModel.IsMinimal M`, every regular proper model X has exactly one marked morphism
`X → M`. First establish this when each localisation of M is relatively minimal. By §6.4 take a common regular model
Z with `Z → X` a finite sequence of closed-point blow-ups and a model morphism `Z → M`. For the last
blow-up `Z → X'`, its exceptional curve lies over one prime `v`; `M_(v)` is terminal among local regular
models (StableReduction Layer 5; Stacks, Lemma 55.10.2, tag 0C9Z), so `Z → M` contracts that curve to a
point. Prove and apply globalBlowdownFactorisation: for a contraction `b : Z → X'` of an exceptional curve on a noetherian scheme, any morphism from Z sending that curve to a point factors uniquely through b (Stacks, Lemma 54.16.1, tag 0C5J). Thus the map factors over O and respects the marking; the global universal property is owned here. Repeat; uniqueness is §6.3. The first
sentence of the proof of Stacks 55.10.2 reverses the arrow: the morphism produced goes from the arbitrary
regular model to the minimal one. Prove minimality_local_criterion: for a regular proper model `M` the
following are equivalent: (i) M.IsMinimal; (ii) every localisation `M ×_O O_(v)` is relatively minimal;
(iii) every regular proper model of the marked E has exactly one model morphism to `M`. (ii) ⇒ (iii) ⇒ (i)
by the first part and uniqueness; given (i), the locally minimal `L` of §6.5 receives a model morphism
`M → L`, an isomorphism by (i), so `M_(v) ≅ L_(v)` is relatively minimal. The acceptance statement `locallyMinimal_terminal` uses the equivalent hypothesis
`RegularProperModel.IsMinimal M`, and asserts unique existence of a marked morphism from each X.
In particular prove `exists_minimalRegularProperModel`: a minimal regular proper model exists (Conrad, Definition 3.8, Theorem 3.10 and Remark 3.11, p. 8, over a discrete valuation
ring). Positive genus is essential: for genus zero the corresponding statement fails (Stacks, Example
55.10.3). *Needs:* §§6.3–6.5; StableReduction Layers 4–5.

**Checks.**

- the terminal morphism from a point blow-up of `M` is the blow-down.
- for `X = M` the unique endomorphism is the identity.
- the smooth and the nodal `37a1` models of §6.3 satisfy (i)–(iii); the point blow-up
  fails (i) and (ii).

### 6.7 Uniqueness and inversion of primes

Prove `minimal_unique`: for minimal regular proper `O_{F,S}`-models `M, N` of the marked E there is a
unique O-isomorphism `M ≅ N` inducing the identity on E, and every model morphism `M → N` is it; its
localisation agrees with the unique marked isomorphism over each `O_(v)` (Stacks, Lemma 55.10.1, tag 0C6B).
Uniqueness is among identity-marked isomorphisms: unmarked schemes can have more automorphisms. Prove
minimal_localisation: for `S ⊆ S'` finite, `M ×_{O_{F,S}} O_{F,S'}` is the minimal model over
`O_{F,S'}`, canonically and with identity marking, and the comparisons for `S ⊆ S' ⊆ S''` compose. Using the
finite class group, choose for each `v ∈ S' − S` an `h_v ≥ 1` and a_v with `v^{h_v} = (a_v)` and put
`a = ∏ a_v`; then `O_{F,S'} = O_{F,S}[1/a]` (ArithmeticKTheory §1.1), so base change is the principal open
`D(a)`, which preserves properness, flatness and regularity; at every retained prime the local model is
unchanged, and §6.6 applies over `O_{F,S'}` (Conrad, Remark 3.11, p. 8). Only inversion of primes in the
same number field is asserted; arbitrary ramified extensions of the base can change regularity and
minimality. *Needs:* §6.6; ArithmeticKTheory §1.1; Mathlib `ext_of_isDominant_of_isSeparated`.

**Checks.**

- changing the starting resolution gives canonically isomorphic minimal models.
- the `37a1` model has the involution `(x, y) ↦ (x, −y − 1)`, which is not an
  identity-marked isomorphism.
- inverting 37 in the nodal `37a1` model gives the smooth minimal model of §6.3; for
  `S = S'` the comparison is the identity.

### 6.8 The integral part and model independence

Let `𝓔` be a regular proper flat model of E over `O_F` and `j : E → 𝓔` the inclusion of the generic fibre.
Define
```text
integralPart E   := im(j^* : K₂(𝓔) ⊗ ℚ → K₂(E) ⊗ ℚ),
integralPartS E S := im(K₂(𝓔_S) ⊗ ℚ → K₂(E) ⊗ ℚ),   𝓔_S = 𝓔 ×_{O_F} O_{F,S},
```
Prove finite_S_exhaustion: `⋃_{S finite} integralPartS E S = K_2(E) ⊗ ℚ`, by scheme K-theory continuity for the inverse system of qcqs schemes `𝓔_S` with affine transition maps and limit E (SchemeKTheoryOperations §2.7). Each transition is the base change of a localisation of `O_F`, hence affine; each `𝓔_S` is proper over a noetherian affine base, hence qcqs. The base limit is `Spec F`. A perfect-complex K-class and its finite diagram therefore descend to a finite localisation, and tensoring with ℚ preserves the filtered colimit. These images are `ℚ`-subspaces of `K_2(E) ⊗ ℚ` (Scholl, 1.1.2, p. 3, and Theorem 1.1.6(iii), p. 4). Prove
integralPart_le_integralPartS and integralPartS_mono: `K_2(E)_{ℤ,ℚ} ⊆ K_2(E)^S_{ℤ,ℚ} ⊆ K_2(E)^{S'}_{ℤ,ℚ}` for
`S ⊆ S'`, by functoriality of pullback along open immersions (SchemeKTheoryOperations §2.2); the
inclusions can be equalities (§6.9) and can be strict, since an unramified class need not be integral
(Dokchitser–de Jeu–Zagier, §3, p. 5, and Theorem 8.3, p. 23). Prove integralPart_le_unramified: the image
of the integral part in `K_2(F(E)) ⊗ ℚ` lies in the unramified subspace, the kernel of all tame symbols at
closed points of E (K2SymbolsBrauer §12.1). Neither space is asserted finite-dimensional or to contain a
lattice of full rank; the integral subgroup `im(K_2(𝓔) → K_2(E))` is a different object, whose finite
generation is Bass's conjecture.

Prove integralPart_model_independent: for regular proper flat models `𝓔, 𝓔'` over `O_{F,S}`,
`im(K_n(𝓔) → K_n(E)) = im(K_n(𝓔') → K_n(E))` for every `n`, integrally and rationally. Reduce by §6.4 to a
model morphism `π : 𝓔' → 𝓔`. Then `j = π ∘ j'` gives `im j^* ⊆ im j'^*`; conversely for
`a ∈ K_n(𝓔') = G_n(𝓔')`, `π_*a ∈ G_n(𝓔) = K_n(𝓔)` (Cartan, SchemeKTheoryOperations §2.6) and
`j^*π_*a = j'^*a` by flat base change along j, `π` being an isomorphism over E (§2.4) (Scholl, 1.3.3,
p. 8). No blow-up formula is used. This argument uses regularity of both total schemes for the Cartan
isomorphisms. Scholl, Remark 1.1.7, p. 4, warns that the analogous model-independence assertion for
`K'` of arbitrary non-regular proper flat models is false, including for elliptic generic fibres, and refers to de Jeu for those examples.
*Needs:* §§3.7, 6.1–6.4; SchemeKTheoryOperations §§2.2, 2.4, 2.6–2.7, 3.7; K2SymbolsBrauer §12.1.

The integral-part API has the following requirements.

- The image is a rational subspace, independent of the marked regular proper model, and its generic image is unramified at every horizontal place.
- Inclusion of finite prime sets induces inclusion of the corresponding subspaces, with the empty set giving the integral part.
- The directed union over all finite prime sets is the full rational curve group, and good primes leave the subspace unchanged.

**Checks.**

- `K_2(E)_{ℤ,ℚ} ⊆ K_2(E)^S_{ℤ,ℚ}` for every `S`.
- for `37a1` (good reduction at 2), `K_2(E)^{{2}}_{ℤ,ℚ} = K_2(E)_{ℤ,ℚ}`;
  integrally `K_2(𝓔) → K_2(𝓔[1/2])` is onto because `K_1(𝓔_2) = (𝔽₂^×)² = 0` (§6.9).
- for `C : y² + (x + 12)y + x³ = 0` over `ℚ` (conductor 390, split
  multiplicative I_6 at 2) and `M = {y²/x³, 1 − x/4}`, which has trivial tame symbol at every closed point,
  no non-zero multiple of `M` is integral (Dokchitser–de Jeu–Zagier, Theorem 8.3(2), p. 23, with
  `m(x) = x − 4`, `p = 2`; §6.10).
- The union over finite `S` is all of `K_2(E) ⊗ ℚ`: a class of `K_2(𝓔[1/6]) ⊗ ℚ` lies in the term `S={2,3}` by definition, while the zero class lies in the term `S=∅`. The non-integral DGJK class of §8.3 lies in some finite term and its residue forces that term to contain 3. No infinite set is an input to the finite-`S` definition.
- on the regular models both Cartan maps are isomorphisms; on a
  non-regular model the proof cannot replace G_n by K_n without an additional theorem (Scholl,
  Remark 1.1.7).

### 6.9 Good primes impose no condition

Let `v` be a finite prime at which E has good reduction, and `𝓔` a regular proper model smooth over `v`
(the minimal one, by §6.8 any choice gives the same images). Prove goodPrime_no_condition:
`G_1(𝓔_v) = K_1(𝓔_v) ≅ k(v)^× ⊕ k(v)^×` is finite (§5.11), hence
`K_2(E)^S_{ℤ,ℚ} = K_2(E)^{S ∪ {v}}_{ℤ,ℚ}` for every `S` not containing `v`. The localisation sequence
`K_2(𝓔_S) → K_2(𝓔_{S ∪ {v}}) → G_1(𝓔_v)` (SchemeKTheoryOperations §3.7) has finite cokernel term, so the
first map is onto after `⊗ ℚ` (Scholl, Proposition 1.3.6 and proof, p. 9; Weibel, *K-book*, VI.6, opening,
p. 502). Consequently only the finitely many primes of bad reduction can distinguish the integral part from
the unramified part. *Needs:* §§5.11, 6.8; SchemeKTheoryOperations §3.7.

**Checks.**

- for `37a1` and `v = 2`, `K_2(𝓔) → K_2(𝓔[1/2])` is onto since `K_1(𝓔_2) = 0`.
- `K_1` of a good fibre over `𝔽_q` has order `(q − 1)²`.
- at a split multiplicative prime `K_1'` of the fibre has rank one, so the
  argument does not apply there (Young, Theorem 3.3, p. 41).

### 6.10 The vertical-residue description

Prove badFibreG1_rank: for a regular proper flat model of an elliptic curve over a ring of
integers of any number field and any finite residue prime v, `G_1(𝓔_v) ⊗ ℚ` has dimension
one when the elliptic curve has split multiplicative reduction at v and is zero for good,
additive or non-split multiplicative reduction. This statement concerns the full fibre,
including its multiplicities; dévissage first identifies its G-theory with that of its
reduction. Normalize each reduced component and compare localization away from the finite
singular set: the normalization's smooth proper components have torsion positive K-groups
by §5.6, while the remaining rational term is the Frobenius-invariant first homology of the
geometric incidence graph. Its vertices are the normalized geometric components and the
geometric singular points, and one edge joins a component to a singular point for each
branch above that point. The graph includes a separate singular-point vertex even at a
point with three branches; the graph formed by joining every pair of intersecting components
would give a false cycle at a type IV fibre. The Kodaira incidence graphs have a single invariant cycle exactly in
the split multiplicative case; blowing up adds trees and leaves this term unchanged
(Young, Theorem 3.3 and proof, p. 41; StableReduction Layer 5;
NeronModelsAndSemistableAbelianVarieties §5.3b). This supplies the fibre assertion used by
the integral-symbol targets of Layer 7. *Needs:* §5.6; GeneralAlgebraicKTheory §4.8;
SchemeKTheoryOperations §3.7; StableReduction Layer 5 and
NeronModelsAndSemistableAbelianVarieties §5.3b for the fibre graphs.

**Checks for fibre K-theory.**

- A split nodal I₁ fibre has two vertices, the normalized component `c` and the singular point `s`,
  and two parallel branch edges `e₁, e₂`. Orient both edges from `c` to `s`: then
  `∂e₁ = s − c = ∂e₂`, so the incidence map has rank one and
  `H₁ = ℚ·(e₁ − e₂)`. Frobenius fixes this generator, giving invariant dimension one.
- For a non-split nodal I₁ fibre Frobenius fixes `c, s` and exchanges `e₁, e₂`, sending
  `e₁ − e₂` to `−(e₁ − e₂)`. The invariant subspace has dimension zero over ℚ;
  it would have dimension one if branch orientation were forgotten.
- A type IV fibre with three components through one point has four incidence vertices
  and three edges, hence first Betti number `3−4+1=0`; the pairwise-intersection triangle
  would incorrectly give `3−3+1=1`.
- A type II fibre has no graph cycle, giving rational dimension zero. A smooth good
  fibre over `𝔽₃` instead has finite K₁ of order four and again rational dimension zero.

Let `𝓔` be a regular proper flat model of E over `O_F`. For each finite prime `v` and each irreducible
component C of `𝓔_v`, let `∂_C : K_2(F(E)) → k(C)^×` be the tame symbol of the discrete valuation
ord_C, whose value on `π_v` is the multiplicity m_C. Prove integralPart_iff_vertical: for
`α ∈ K_2(E) ⊗ ℚ`, viewed in `K_2(F(E)) ⊗ ℚ` (§3.7), `α ∈ K_2(E)_{ℤ,ℚ}` if and only if `∂_C(α) = 0` in
`k(C)^× ⊗ ℚ` for every vertical C; at primes of good reduction the condition holds automatically, so it
is a finite set of conditions. For an integral class `β ∈ K_2(E)`, if every vertical tame
value of its generic restriction is one, then some positive integer multiple of `β` lies in
`im(K_2(𝓔) → K_2(E))` (Dokchitser–de Jeu–Zagier, (3.5)–(3.6), p. 6, and Remark 3.8; Scholl,
introduction, (0.1), p. 1). Proof: localisation for `𝓔 ⊃ 𝓔_U` and the colimit over dense opens of the base
give the exact `K_2(𝓔) → K_2(E) → ⊕_v G_1(𝓔_v)` (SchemeKTheoryOperations §§2.7, 3.7); coniveau on the
one-dimensional fibre (SchemeKTheoryOperations §4.5; Weibel, *K-book*, V.9.5, p. 438) shows that the kernel
of `G_1(𝓔_v) → ⊕_C K_1(k(C))` is a quotient of `⊕_{x ∈ 𝓔_v closed} K_1(k(x))`, a torsion group (finite
residue fields, GeneralAlgebraicKTheory §13.8c); the composite `K_2(E) → G_1(𝓔_v) → k(C)^×` is `∂_C^{±1}`
by the vertical boundary comparison of SchemeKTheoryOperations §3.7 and the normalisation of §3.2. Hence
after `⊗ ℚ` the class is in the image exactly when every `∂_C(α)` is torsion. *Needs:* §§3.2, 3.7, 6.8–6.9;
SchemeKTheoryOperations §§2.7, 3.7, 4.5; K2SymbolsBrauer §§9.2, 11.1; GeneralAlgebraicKTheory §13.8c.

**Checks.**

- For `E : y²=x³−x` and the horizontally constant symbol `{−1,3}`, a vertical valuation at 3 of multiplicity m gives residue `(−1)^m`, of order at most two and zero after `⊗ ℚ`. Its rational constant K-class is zero, hence integral.
- For `u=1/3` in §8.3, the component with `ord(v)=1`, `ord(w)=0` has residue `1/w̄`, with nonzero divisor on its function field and therefore infinite order; every nonzero multiple remains excluded.
- for `C : y² + (x + 12)y + x³ = 0` over `ℚ` and `M = {y²/x³, 1 − x/4}`, some
  component D of the fibre at 2 of the regular model has `∂_D(M)` of infinite order
  (Dokchitser–de Jeu–Zagier, proof of Theorem 8.3(2)).
- only the finitely many bad primes give conditions.

### Examples

`37a1` over `ℤ`: the Weierstrass model is regular and minimal, its fibre at 37 nodal; over `ℤ[1/37]` it is
smooth; blowing up `(0, 0)` in the fibre at 2 gives a non-minimal regular model whose blow-down is the
terminal map; inverting 2 imposes no integrality condition. `11a1`: the Weierstrass model is not regular at
`(11, x − 5, y − 5)`. The curve `y² + (x + 12)y + x³ = 0` carries an unramified class that is not integral.

### Dependencies

Layers 1, 3 and 5; StableReduction Layers 4–5; NeronModelsAndSemistableAbelianVarieties §5.3b; RelativeJacobiansAndIntegralCurveModels §§0.1, 5.1; ModularCurves Layer 1A; ArithmeticKTheory §1.1;
SchemeKTheoryOperations §§2.2–2.7, 3.7, 4.5; K2SymbolsBrauer §§9.2, 11.1, 12.1; GeneralAlgebraicKTheory §13.8c;
Tau Ceti `TauCeti.Model`, genericFiberTowerIso; Mathlib `ext_of_isDominant_of_isSeparated`,
`IsDedekindDomain.flat_iff_torsion_eq_bot`.
## Layer 7: Symbol certificates and Bloch's classes

Explicit elements of `K_2` of a curve are written as finite sums of symbols in `K_2` of its function field
whose tame symbols vanish at every closed point. This layer expresses that condition by finite local proof data,
proves the reciprocity that makes one point free, constructs Bloch's classes from torsion points, and
moves classes along constant-field extensions. The regulators of these classes belong to
EllipticRegulators.

Throughout, `k` is a field and `K/k` a function field of one variable with `IsFunctionField k K` (for
an elliptic curve, `K = W.toAffine.FunctionField`); its places are Tau Ceti's `TauCeti.Place k K`, which
correspond to the closed points of the regular projective model (§1.4).

### 7.1 The tame value at a place, and symbol candidates

For a place `P` and `f, g ∈ K^×`, the function `f^{ord_P g} / g^{ord_P f}` has order zero at `P`. Define
```text
tameValue P f g := (−1)^{ord_P f · ord_P g} · residueUnit_P (f^{ord_P g} / g^{ord_P f})  ∈ P.ResidueField^×,
```
K2SymbolsBrauer's tame symbol at the valuation of `P` evaluated on `{f, g}` (Dokchitser–de Jeu–Zagier,
(3.1), p. 4; Weibel, *K-book*, Lemma III.6.3, p. 234, has the inverse convention). Prove
tameValue_eq_leading: for a uniformiser t at `P` with `f = t^a u`, `g = t^b w` (Tau Ceti's
`Place.exists_eq_zpow_mul_unit`), `tameValue P f g = (−1)^{ab} · ū^b · w̄^{−a}`; in particular the value
does not depend on t. Prove tameValue_of_ord_eq_zero: if `ord_P f = ord_P g = 0` then
`tameValue P f g = 1`; and the Steinberg properties multiplicativity in each argument, tameValue_swap (`tameValue P g f = (tameValue P f g)⁻¹`) and
tameValue_one_sub (`tameValue P f (1 − f) = 1` for `f ≠ 0, 1`), which are the properties of K2SymbolsBrauer §§9.2–9.4 for
this valuation.

A symbol candidate is a finitely supported function `α : K^× × K^× →₀ ℤ`, read as the formal sum
`Σ n_{(f,g)} {f, g}`. Define `SymbolCandidate.tame P α := ∏ tameValue P f g ^ n_{(f,g)}`, multiplicative
in `α`, and SymbolCandidate.toK2 α := `Σ n_{(f,g)} {f, g} ∈ K_2(K)` through Matsumoto's presentation
(K2SymbolsBrauer §§7.2, 8.3). Prove that the tame value of α at P is the tame symbol at `P` of
toK2 α. *Needs:* §3.2; K2SymbolsBrauer §§7.2, 8.3, 9.2–9.4; Tau Ceti TauCeti.Place.ord, `residueUnit`,
exists_eq_zpow_mul_unit.

The tame-value API has the following requirements.

- The leading-unit expression above is independent of the uniformiser.
- It is multiplicative in both arguments, inverts on swapping them, and satisfies the Steinberg relation for `f≠0,1`.
- When both orders are zero the value is one in the actual residue-unit group.

**Checks.**

- for a uniformiser t and `ord_P u = 0`, `tameValue P u t = ū` and
  `tameValue P t u = ū⁻¹`; when `ū = 2` in characteristic zero these are `2` and `1/2`.
- For `ord_P f = 1, 2`, the values of `{−1,f}` are `−1,1`; in residue characteristic two both become `1`.
- For two order-zero units of residues `2,3` over a characteristic-zero residue field, the tame value is `2⁰/3⁰=1`.
- `tameValue P f f = (−1)^{ord_P f}`, which a version without the sign would get wrong at
  a simple zero.

The candidate API has the following requirements.

- Finite formal integer sums form an additive commutative group; zero has empty support and negation reverses every coefficient.
- `SymbolCandidate.tame` sends sums to products and integer multiples to powers, with zero mapping to one.
- The map to K₂ respects addition and intertwines every tame symbol; a nonzero formal Steinberg candidate has zero image.

The candidate representation has its own Checks, separate from those of a single tame symbol.

**Checks.**

- the zero finitely supported function has empty support, maps to zero in
  `K_2(K)`, and has tame value one at every place.
- for `α = [(f,g)] − [(f,h)]`, the tame value is
  `tameValue P f g / tameValue P f h`; if `g=h`, the candidate is zero and the tame quotient is one.
- for `f ≠ 0, 1`, the formal candidate `[(f,1−f)]` is nonzero
  (its coefficient is one), but its toK2 image is zero and every tame value is one. The
  candidate carrier therefore must precede the Steinberg quotient.

### 7.2 Certificates

A certificate means finite local mathematical proof data, with no executable verification procedure. A certificate for a candidate `α` consists of: (i) a named finite set `S` of places; (ii) for every place
`P ∉ S` and every `(f, g)` in the support of `α`, a proof that `ord_P f = ord_P g = 0`; (iii) for every
`P ∈ S`, a uniformiser t_P with the orders and leading units of the functions involved; (iv) for every
`P ∈ S`, a proof that the tame value of α at P is one **in** `P.ResidueField^×`, computed from (iii) by tameValue_eq_leading.
Define SymbolCertificate α with fields support, unit_outside, uniformizer (with
`ord_P (uniformizer P) = 1` on the support) and tame_eq_one. Prove tame_eq_one_everywhere: a certified
candidate has tame value one at every place; nonempty_iff: `α` has a certificate if and only if
the tame value of α at P is one for all `P`, the union of the zeros and poles of the functions involved being an admissible
`S` (finite by Tau Ceti's `Place.finite_setOf_ord_ne_zero`); and sound: toK2 α lies in the kernel of the
tame symbol, hence in the image of `K_2(X)` for the regular projective model `X` (§3.1), and over a number
field defines a class in `K_2(X) ⊗ ℚ` (§3.7) (Dokchitser–de Jeu–Zagier, §4, opening, p. 7). The condition in
(iv) is triviality in the residue field, not triviality of its norm to `k`; at a place of degree larger than
one these differ. Triviality is the same condition in K2SymbolsBrauer's convention and in the K-book's, but
recorded values must name the convention. *Needs:* §§3.1, 3.7, 7.1; K2SymbolsBrauer §§9.2, 9.13; Tau Ceti
`Place.finite_setOf_ord_ne_zero`, `Divisor.principal`.

The certificate API has the following requirements.

- Forgetting local leading-unit data gives trivial tame values at every place.
- Such data exist exactly when all tame values are one; finite support includes every zero and pole.
- The represented K-class lies in the image of the curve group, and over number fields its rational preimage is unique.

**Checks.**

- the zero candidate has a certificate with empty support.
- If `ord_P c=0`, `ord_P t=1` and `c̄=2≠1`, the singleton `{c,t}` has tame value `2` and admits no certificate; a condition testing only the empty support would falsely accept it.
- on `y² + y = x³ − x²` over `ℚ` (`11a3`), `{x, y} + {−1, x}` has a certificate with
  support `{(0, 0), (0, −1), (1, 0), O}`: the tame values of `{x, y}` there are `−1, −1, 1, 1` and those of
  `{−1, x}` are `−1, −1, 1, 1`; `{x, y}` alone has none.
- on `y² = x³ + 1` over `ℚ` (`36a1`), `{x − 1, −1}` has tame value `−1` in
  `ℚ(√2)` at the degree-two place `x = 1` and value one elsewhere; every normed value is one, but there is
  no certificate. A definition that tests norms would accept it.
- the tame value of α at P is one in K2SymbolsBrauer's convention if and only if the
  K-book's value at `P` is one.
- on `11a3`, the candidate `5{x, y} + Σ_P {f_P, tame_P{x, y}}` over the four non-zero
  rational torsion points, with `div f_P = 5(P) − 5(O)` (§7.5), has a certificate and every tame
  value on the union of the supports equals one.

### 7.3 Integral certificates

Let `k` be a number field, `X` a regular proper flat model of E over O_k (§6.1). An integral certificate
for `α` consists of a certificate (§7.2), a named finite set `S'` of maximal ideals of O_k with a proof
that for every `p ∉ S'` the fibre X_p is smooth and irreducible and every function involved has order zero
along X_p, and for every `p ∈ S'` the list of irreducible components D of X_p with the orders of the
functions along D, their leading units in `k(D)`, and a proof that the tame value of `α` at the generic
point of D is one in `k(D)^×`. Define IntegralCertificate with primes, and prove
IntegralCertificate.sound: an integrally certified candidate is killed by every codimension-one tame
symbol of `X`, so its class lies in the integral part `K_2(E)_{ℤ,ℚ}` (§6.10; Dokchitser–de Jeu–Zagier,
Remark 3.8, p. 6). Outside `S'` the vertical condition holds because every function is a unit at the generic
point of the fibre. Rationally, vertical conditions can fail non-trivially only at primes of split
multiplicative reduction, where `K_1'` of the fibre has rank one; elsewhere it is torsion (§6.10, badFibreG1_rank; Young,
*K_2 and L-series of elliptic curves over real quadratic fields*, Theorem 3.3, p. 41). *Needs:* §§6.1,
6.10, 7.2.

The integral-certificate API has the following requirements.

- Forgetting the vertical data gives the horizontal certificate.
- Enlarging the finite prime set and supplying the same component residues preserves the witness.
- Its represented rational class lies in the model-independent integral part.

**Checks.**

- on `11a3` the minimal Weierstrass model over `ℤ` is regular (type I_1 at 11,
  good elsewhere), and `{x, y} + {−1, x}` has an integral certificate with `S' = {11}`: `x` and `y` have order
  zero along the irreducible fibre at 11.
- for `u = 1/3`, `α = {v, w} + {−1, h}` on `y² = x(x + 1)(x + u²)` has a
  certificate and no non-zero multiple has an integral certificate (§8.3).
- `{c, d}` with `c, d ∈ O_k^×` has an integral certificate with horizontal
  support `S = ∅` and `S'` containing the bad primes of the chosen model; every vertical value is one.
  Taking `S' = ∅` is allowed only when all fibres meet the smoothness and irreducibility condition.

### 7.4 Reciprocity and the last rational point

Prove `tame_last_point`: if α has tame value one at every place other than a place `P₀` of degree one, then
`tame P₀ α = 1`; more generally, if α has tame value one for all `P ≠ P₀`, then
`N_{k(P₀)/k}(tame P₀ α) = 1`, which does not force `tame P₀ α = 1` when `deg P₀ > 1`. The input is Weil
reciprocity `∏_P N_{k(P)/k}(tame P α) = 1` for the residue-field norms (K2SymbolsBrauer §10.30; Weibel,
*K-book*, Weil Reciprocity Formula V.6.12.1, p. 416, proof p. 417), with the multiplicativity of tame in
the candidate; at a degree-one place the norm is the identity. The product over geometric points, with all
embeddings of each finite residue extension `L/k`, gives the norm only when each embedding value is raised to `[L:k]_insep`. Equivalently the orders of the base-changed functions carry these multiplicities. Unweighted embeddings suffice for separable residue extensions; a product taking one value per closed point is not
(Dokchitser–de Jeu–Zagier, proof of Lemma 4.2, p. 8). *Needs:* §7.2; K2SymbolsBrauer §10.30; Tau Ceti
`Place.normResidue`, Place.finiteDimensional_residueField.

**Checks.**

- On `ℙ¹` over `k = 𝔽₂(s)`, the symbol `{s,t²−s}` has tame value s at the purely inseparable degree-two point and `s⁻²` at infinity. Their norms multiply to `s²s⁻² = 1`; the unweighted embedding product is `s⁻¹ ≠ 1`.
- in the certificate for `{x, y} + {−1, x}` on `11a3`, the value at O follows from the
  other three.
- on `36a1`, `{x − 1, −1}` has value `−1` (norm one) at the degree-two place
  `x = 1` and value one elsewhere, so the degree-one hypothesis is needed.
- on `36a1`, `{y − 3, x}` has tame values `1/2` at `(2, 3)`, `1/x₀` at the place
  `x² + 2x + 4 = 0, y = 3` (norm `1/4`), `−2` at `(0, 1)`, `−4` at `(0, −1)` and `1` at O; the normed
  product is `(1/2)(1/4)(−2)(−4)(1) = 1`, while the product with `x₀` read as `−1 + √−3` is `−1 − √−3`.

### 7.5 Principal divisors on rational torsion

Let `W` be elliptic over `k`. Define blochRho: for `C ≥ 1` prime to `char k`, if the full
geometric C-torsion is rational, choose `ρ` with
`div ρ = (C² − 1)(O) − Σ_{0 ≠ a ∈ E[C]} (a)`. This is the full-torsion aggregate needed for
§7.7, beyond the supplied function for one torsion point. The divisor has degree zero and its
point sum is zero: pair a and `−a`; the remaining subgroup is trivial for odd C and is
`(ℤ/2)²`, whose sum is zero, for even C. Apply the supplied principal-divisor criterion.
Its API requires the following facts.

- The chosen function has exactly the displayed divisor, including the coefficient at O.
- Two choices differ by a nonzero constant, since the proper elliptic curve has exact constant field k.
- After any field extension the chosen function has the pulled-back divisor, and agrees with a new choice up to a nonzero constant. The functions f_T used below are those
of `WeierstrassCurve.Affine.exists_principal_eq_zsmul_ofPoint_sub_infinity`; apply it with the integer annihilator `n = (C : ℤ)`. Their scheme-divisor interpretation is
torsionFunction_divisor_compat, through §1.4 and §2.3. Non-rational torsion is handled over a
finite extension (§7.8). This is the divisor construction for the correction in Young,
Lemma 3.1, pp. 37–38, specialised to full prime-to-characteristic torsion. *Needs:* §2.4;
EllipticCurves Layer 2; the point/divisor and torsion-function supplier contracts.

**Checks.**

- on `11a3` the functions with divisor `5(P) − 5(O)` at the four non-zero rational
  torsion points are `x² + xy + y`, `−x² + (y + 1)x + (y + 1)`, `−2x² + (y + 3)x − 1` and `2x² + (y − 2)x + 1`;
  for instance the norm of the first to `ℚ(x)` is `−x⁵`.
- on the ordinary elliptic curve `y² + xy = x³ + 1` over `𝔽₂`,
  the geometric points of `E[2]` form `ℤ/2`, with nonzero point `(0, 1)`. They do not form
  `(ℤ/2)²`, and their sum is nonzero; thus the full-torsion formula requires `char k ∤ C`.
- when `C = 1`, the prescribed divisor is zero, so any nonzero constant
  is a choice of `ρ`; its divisor remains zero after a field extension.
- on `y² = x³ − x` over `ℚ` with `C = 2`, `ρ = 1/y` has divisor
  `3(O) − ((0, 0)) − ((1, 0)) − ((−1, 0))` and `f_{(0,0)} = x`.
- on `y² = x³ − x` over `ℚ`, `((0, 0)) − (O)` is not principal, since `(0, 0) ≠ O`.

### 7.6 Bloch's correction

Let E be an elliptic curve over `k`, T a finite subgroup of `E(k)` and `C ≥ 1` with `C · T = 0`. Let
`f, g ∈ k(E)^×` have divisors supported on T. For each non-zero `P ∈ T` let f_P have divisor
`C(P) − C(O)` (§7.5) and `c_P = tame P {f, g} ∈ k^×`, `P` being rational. Prove `blochCorrection`: the
candidate `C{f, g} + Σ_{0 ≠ P ∈ T} {f_P, c_P}` has tame value one at every place. This is the
algebraic extension of Young, Lemma 3.1, pp. 37–38: there the coefficient is `#T` over a totally
real number field; here any positive annihilator C works over any field by the following
valuation and Weil-reciprocity argument. Outside T all functions are units; at a non-zero `P ∈ T`,
`tame P {f_P, c} = c^{−C}`, so the value is `c_P^C · c_P^{−C} = 1`; at O, `tame O {f_P, c} = c^C` and the
value is one by §7.4, all places of T having degree one. Equivalently, the tame symbol of `{f, g}` lies in
`Div(E) ⊗ k^×`; its image in `Pic(E) ⊗ k^×` is `(O) ⊗ ∏ c_x + Σ (x − O) ⊗ c_x`, the first term vanishing by
Weil reciprocity and the second killed by C, and the exact sequence
`k(E)^× ⊗ k^× → Div(E) ⊗ k^× → Pic(E) ⊗ k^× → 0` supplies the correction. This tensor description is an alternative derivation of the
explicit valuation calculation above. *Needs:* §§7.2, 7.4–7.5.

**Checks.**

- on `11a3` with `T = E(ℚ)_tors` (order five), `f = x`, `g = y`, `C = 5`: the tame
  values of `{x, y}` at the four non-zero points are `−1, −1, 1, 1`, and `5{x, y} + Σ {f_P, c_P}` has tame
  value one at all points of T and at O.
- without the factor C the statement fails (§7.7, blochClass_C2_needs_factor).
- `tame P {f_P, c} = c^{−C}` at `P` and `c^{C}` at O in K2SymbolsBrauer's
  convention.

### 7.7 Bloch's classes S_a and their normalisation

Let `C ≥ 1` be prime to `char k` and let `E/k` have its full geometric C-torsion rational,
so `E[C] ≅ (ℤ/C)²` and, for `C ≥ 3`, `μ_C ⊂ k`; over `ℚ`
only `C ≤ 2` occurs, and classes over `ℚ` come from §7.9. Let `K_2^T(E)` be the kernel of the tame symbol on
`K_2(k(E))` and Q_E the subgroup generated by torsion and the symbols `{c, d}` with `c, d ∈ k^×`. Define the choice-dependent lift
blochClassLift a ∈ `K_2^T(E) ⊗ ℤ[1/C]` for `0 ≠ a ∈ E[C]` as `1/C` times the class of
`A_a = C{ρ, f_a} + Σ {f_i, c_i}`, the correction of §7.6 for `(ρ, f_a)`. Define the canonical class
blochClass a in `(K_2^T(E)/Q_E) ⊗ ℤ[1/C]` as its image. Here Q_E means the subgroup of
`K_2^T(E)` generated by its torsion and by constant symbols, which are unramified. Prove blochClass_wellDefined: `S_a` is independent of the choices of `ρ` and
f_a (each fixed up to a constant) and of the correction, modulo Q_E; when `K_2(k)` is torsion (a number
field) it is well defined modulo torsion. For this well-definedness target, use the following tensor-exactness argument: two corrections
differ by an element of the image of
`k(E)^× ⊗ k^×` in the kernel of the tame symbol, which is the image of `ker(div ⊗ id)`, generated by
`k^× ⊗ k^×` together with lifts of `Tor(Pic(E), k^×)`. Explicit generators of the latter
have the form `{h, ζ}`, where `div h = nD` and `ζ^n = 1`, and are themselves killed by `n`;
thus the image is indeed contained in constants plus torsion, rather than merely having a
torsion quotient by constants; changing `ρ` or f_a by constants changes `C{ρ, f_a}` by symbols
`{c, h}`, absorbed the same way. Only `C{ρ, f_a}` is guaranteed to be correctable by §7.6, so division by C is made only
after obtaining an unramified class. The construction combines §7.6 (Young, Lemma 3.1,
pp. 37–38) with the tensor argument just given.

The primary-source comparison is with Bloch, *Algebraic K-Theory and Zeta Functions of
Elliptic Curves*, ICM Helsinki 1978, vol. 2 (1980), p. 514, the unnumbered construction
immediately after the localisation sequence. In characteristic zero, with `N = C`, that
construction takes an integral corrected element
`S_a^ICM = C{ρ, f_a} + Σ_i {h_i, d_i} ∈ K_2^T(E)`; in the paper's multiplicative notation,
the coefficient C is the exponent on `{ρ, f_a}`. Its `ρ` and f_a have exactly the
divisors of §§7.5–7.6. There is no division by C in that displayed construction.
Writing `π_C : K_2^T(E) → (K_2^T(E)/Q_E) ⊗ ℤ[1/C]` for quotient followed by localisation,
the comparison target blochClass_eq_Bloch is therefore

```text
C · blochClass a = π_C(S_a^ICM),     or equivalently
blochClass a = (1/C) · π_C(S_a^ICM).
```

With the same correction, `C · blochClassLift a = S_a^ICM ⊗ 1`; with another correction,
the equality is in the quotient displayed above. Bloch's page asserts existence in the
tame kernel and independence of the regulator from the correction. The quotient by
constants and torsion, its choice-independence proof, and the extension to positive
characteristic prime to C are supplied by the algebraic argument above. The notation `S_a`
in this roadmap denotes the divided class blochClass a.

The ICM display does not specify a valuation formula for its tame map. The comparison
uses its kernel, which is unchanged on inverting every tame value. More explicitly, take
`h_P = f_P`, `d_P = tame P {ρ, f_a}` in this roadmap's convention. Then
`tame P {f_P, d_P} = d_P^{−C}`, cancelling `d_P^C`; at O use §7.4.
If the inverse tame convention is used, the same correction is unramified and its
constants d_P are the inverses of the raw tame values in that convention. Thus neither
reversing the entries in the correction nor negating the entire class is part of the
comparison. This fixes the orientation without attributing an unstated convention to Bloch.

The classes are not claimed to be linearly independent; Dokchitser–de Jeu–Zagier,
Proposition 4.3(1), p. 8, gives relations among the related three-point classes. The class API records the following requirements.

- The lift is the corrected integral tame-kernel element divided by C in the stated tensor product; its image defines the quotient class.
- Changing either torsion function by a nonzero constant leaves the quotient class unchanged.
- Changing the correction leaves the quotient class unchanged, with difference generated by constants and torsion.
- In characteristic zero multiplication of the quotient class by C is the image of Bloch's integral ICM class, with the correction orientation fixed above. *Needs:* §§2.4, 7.2, 7.5–7.6.

**Checks.**

- on `y² = x³ − x` over `ℚ`, `C = 2`, `a = (0, 0)`: `{1/y, x}` has tame values
  `(−1, 1, −1, 1)` at `((0, 0), (1, 0), (−1, 0), O)`, its image in `Pic(E) ⊗ ℚ^×` is `(1, 0) ⊗ (−1) ≠ 0`, so it
  cannot be corrected by symbols `{h, c}` with `c ∈ ℚ^×`; `2{1/y, x}` can.
  For the nonzero tensor assertion, `(1,0)` is not twice a rational point: the doubling
  formula would require a rational root of `z⁴−4z³+2z²+4z+1`, whose only possible
  rational roots `±1` both give `4`. Apply the sign homomorphism `ℚ^× → ℤ/2` to the
  tensor factor; the image is the nonzero class of `(1,0)` in `E(ℚ)/2E(ℚ)`.
- for three distinct rational points `P₁, P₂, P₃` with pairwise torsion differences,
  the symbols `S₁, S₂, S₃` of Dokchitser–de Jeu–Zagier's Construction 4.1 span a subgroup of rank at most
  one of `K_2^T` modulo torsion (Construction 4.1 and Proposition 4.3(1), arXiv v2 p. 8).
- on `y² = x³ − x` over `ℚ`, take `P₁ = P₂ = O`, `P₃ = (0,0)`. All pairwise differences
  are torsion, but `f₁ = 1/x` has divisor `2(O) − 2(P₃)` and `f₁(P₁) = 0`, so the three-point
  normalisation is undefined. In contrast, for the distinct triple `O, (0,0), (1,0)`,
  one may use `f₁ = x/(x−1)`, `f₂ = x−1`, `f₃ = 1/x`; their normalising values
  at `P₁, P₂, P₃` are respectively `1, −1, 1`, all nonzero.
- for `C = 2` on `y² = x³ − x`, `div(1/y) = 3(O) − ((0, 0)) − ((1, 0)) − ((−1, 0))`.
- replacing f_a by `c f_a`, `c ∈ k^×`, changes `C S_a` by an element of the
  subgroup generated by torsion and `{k^×, k^×}`.
- there is no nonzero `a ∈ E[1]`, so the class family is empty; this
  does not introduce a class indexed by the origin or divide by zero.
- for distinct formal symbols `s, t`, put
  `A = 3[s] + [t]` in the rational-coefficient extension of §7.1's candidate carrier.
  The coefficients of `(1/3)A` at `s, t` are `1, 1/3`, while those of `A` are `3, 1`.
  These are checks before the Steinberg quotient; they do not assume an actual corrected
  K-class is nonzero. They distinguish the divided convention from the ICM convention.
- locally, if `ord_P h = 3`, `ord_P c = 0` and
  the residue of `c` is `2` in characteristic zero, then `{h, c}` has tame value `1/8`
  and `{c, h}` has value `8`. A raw symbol of tame value `2` contributes `8` after
  multiplication by `C = 3`, so the correction in the first order gives `1`; the
  reversed order gives `64`. This is a local computation, not a claim that full
  rational `E[3]` exists over `ℚ`.
- in the first Check, one may take
  `A_a = 2{1/y, x} + {x, −1} + {x + 1, −1}`. Its tame values are all one:
  at `(0,0)` and `(−1,0)` the correction values are `(−1)^{−2} = 1`, at `(1,0)`
  they are one, and at O they are `(−1)^2 = 1`. Thus this is an integral
  ICM representative and blochClassLift a = `A_a/2` for these choices. Division
  takes place in the tame kernel tensor product, even though `{1/y,x}` alone
  cannot be corrected integrally as the first Check shows.

### 7.8 Transfer along a constant-field extension

Let `L/k` be finite, `E_L = E ×_k L`, and `N : K_2(L(E)) → K_2(k(E))` the transfer of the field extension
`L(E)/k(E)`, of degree `[L : k]` because E is geometrically integral. Prove transfer_tame: for every place
`P` of `k(E)`, `tame P (N β) = ∏_{Q | P} N_{k(Q)/k(P)}(tame Q β)` (K2SymbolsBrauer's norm-residue
formula, §§10.21, 10.27, at `P` and the places of `L(E)` above it, which are the closed points of E_L above `P`). Hence N
maps `K_2^T(E_L)` to `K_2^T(E)`, a certificate for `β` over `L` yields one for `N β` over `k` with residues
computed by the norms, `N ∘ res = [L : k]`, and `N{f, c} = {N f, c}` for `c ∈ k^×` (Weibel, *K-book*, Remark
V.6.6.3–6.6.4, p. 410, for compatibility of transfer with localisation;
III.6.3.1, p. 234, for restriction). *Needs:* §§3.6, 7.2; K2SymbolsBrauer §§10.21, 10.27.

**Checks.**

- for `E : y² = x³ − 2x` over `ℚ`, `L = ℚ(√2)` and `β = {x − √2, y}`,
  `N β = {x² − 2, y}`. At the degree-two place `Q₂ = {x² = 2, y = 0}`, with `x₀` the class of `x`,
  `tame Q₂ (N β) = 1/x₀ = x₀/2`; above it lie `(√2, 0)` and `(−√2, 0)`, where `tame β` is `1/4` and `−2√2`, and
  transporting the second along `√2 ↦ −x₀` gives the product `(1/4)(2x₀) = x₀/2`.
- for `ℚ(√2)/ℚ`, restriction sends `2` to `2` on `K_1`, and its norm is `4`; for
  `β={x−√2,y}` above, `res(Nβ)={x²−2,y}=β+σβ`.
- for `L = k`, N is the identity.

### 7.9 Galois descent

Let `L/k` be finite Galois with group G. Prove galoisDescent: restriction `res : K_2^T(E) → K_2^T(E_L)^G`
satisfies `N ∘ res = [L : k]` and `res ∘ N = Σ_{σ ∈ G} σ` (Weibel, *K-book*, Exercise IV.6.13, p. 327; the
first by the projection formula); hence its kernel and cokernel are killed by `[L : k]`, and
`res ⊗ ℚ : K_2^T(E) ⊗ ℚ ≅ (K_2^T(E_L) ⊗ ℚ)^G` with inverse `N/[L : k]` (Dokchitser–de Jeu–Zagier, Remark
4.14, p. 11). Both maps preserve the kernels of the tame symbols (§7.8). An actual G-invariant element `β ∈ K_2^T(E_L) ⊗ ℚ` descends to `N(β)/[L:k]`. For a G-invariant combination of the quotient classes `S_a`, choose lifts to the rational tame kernel, then average the lift over G; descend this invariant lift. Prove galoisDescent_quotient: restriction and transfer preserve Q_E and `Q_{E_L}`, respectively, and induce the same rational descent isomorphism on `(K_2^T/Q) ⊗ ℚ`. Indeed restriction preserves constants and torsion; transfer of a constant class is the constant-field transfer by base change, and transfer preserves torsion. Both composite identities descend, and averaging is exact over `ℚ`. The descended quotient class is independent of the lifts. Over a number field `K_2(k)` is torsion, so the rational quotient equals the rational tame kernel.
Integrally the statement holds only up to `[L : k]`-torsion. Descent does not give integrality: a descended
class need not lie in the integral part, which is the separate vertical condition of §6.10. *Needs:* §7.8;
K2SymbolsBrauer §§10.21, 10.27; §7.3.

**Checks.**

- For `L = ℚ(√2)`, `E : y² = x³ − 2x`, and `β = {x − √2,y}`, `res(Nβ) = β + σβ = {x²−2,y}` and `N(res(Nβ)) = 2Nβ`. For the certified constant class `a = {−1,−1}`, the corresponding composites are `N(res a) = 2a = 0` and `res(N(res a)) = res a + σ(res a) = 0`; rationally they are multiplication by two.
- For the trivial Galois group, two lifts differing by a constant `{c,d}` have the same quotient class. Over `ℚ` the constant rational class is zero; over `ℚ(s,t)`, `{s,t}` has residue s at `t=0` of infinite order and is nonzero rationally, so a quotient class cannot be treated as an actual lift.
- the DGJK class with `u = 1/3` is defined over `ℚ`, hence invariant under any base
  change, and no non-zero multiple is integral (§8.3).
- for `L = k` the statement is trivial, res and N being the identity.

### Examples

On `11a3`, `y² + y = x³ − x²`, the rational torsion has order five, `{x, y}` has tame values `−1, −1, 1, 1` at
`(0, 0), (0, −1), (1, 0), O`, and `{x, y} + {−1, x}` is certified and integrally certified with `S' = {11}`.
On `36a1` the symbols `{x − 1, −1}` and `{y − 3, x}` show the difference between residue-field values and
their norms. On `y² = x³ − x` with `C = 2`, `{1/y, x}` is not correctable while `2{1/y, x}` is.

### Dependencies

Layers 2, 3 and 6; K2SymbolsBrauer §§7.2, 9.2–9.4, 10.21, 10.27, 10.30; Tau Ceti places, residue units, divisors and the elliptic
point–divisor-class equivalence.
## Layer 8: Worked examples

Three computations exercise the whole interface: a certificate on a curve with large rational torsion
whose class is not constant, a residue at a closed point of degree two, and an integrality failure at a
split multiplicative fibre. Each is a target: its numbers are part of the statement and are what a
formalisation must reproduce.

### 8.1 A certified symbol on y² = x(x+1)(x+16)

For `u∈ℚ` with `u≠0,1,−1`, put `E_u : y²=x(x+1)(x+u²)` and define the nonzero
rational functions `v_u=(x+u²)/y`, `w_u=(u−xv_u)/(u+xv_u)` and
`h_u=(u(x+1)+y)/(x+u)`. The discriminant `16u⁴(u²−1)²` is nonzero; none of
`y`, `u+xv_u`, `x+u` is the zero function, so these expressions define function-field
units, even where their values at individual points have zeros or poles
(Dummigan–Golyshev–de Jeu–Kerr, Proposition 10.2 and its proof, pp. 29–31).
The API of this family has the following requirements.

- The expression for wᵤ equals `(u(x+1)−y)/(u(x+1)+y)` as a rational function.
- The divisor of vᵤ is `((−u²,0))−((0,0))−((−1,0))+(O)`. The divisor of wᵤ is
  `((−u,−u²+u))+((u,u²+u))−((−u,u²−u))−((u,−u²−u))`. The divisor of hᵤ is
  `((−1,0))+((u,−u²−u))−((−u,−u²+u))−(O)`. These determine all zeros and poles;
  local values at removable points are read in local rings (Proposition 10.2, pp. 29–30).
- Every rational field extension preserving u transports these functions to the same
  expressions on the base-changed curve.

**Checks for the family.**

- At `u=4`, `(x,y)=(4,20)` gives `v=1`, `w=0`, `h=5`; constant functions cannot
  satisfy these values and the following opposite-point values simultaneously.
- At `(4,−20)` the values are `v=−1`, a simple pole of w, and `h=0`. At `(0,0)`,
  v has a simple pole, while w and h extend with values `1,1`.
- At `u=0,1,−1` the discriminant is zero and the family domain rejects the equation.
  At `u=1/3` it is `1024/6561≠0`, so the denominator example remains inside the domain.

The following targets use `u=4` and `u=1/3`, both in this domain.

Let `E₄ : y² = x(x + 1)(x + 16)` over `ℚ` (conductor 15, torsion `ℤ/4 × ℤ/2`), the member `u = 4` of the
family `E_u : y² = x(x + 1)(x + u²)`, and put
```text
v = (x + 16)/y,   w = (4 − x v)/(4 + x v) = (4(x + 1) − y)/(4(x + 1) + y),   h = (4(x + 1) + y)/(x + 4),
α = {v, w} + {−1, h}.
```
Prove example_certificate_E4: the divisors are
```text
(v) = ((−16, 0)) − ((0, 0)) − ((−1, 0)) + (O),
(w) = ((−4, −12)) + ((4, 20)) − ((−4, 12)) − ((4, −20)),
(h) = ((−1, 0)) + ((4, −20)) − ((−4, −12)) − (O),
```
and `α` has a certificate with support `S = {O, (0, 0), (−1, 0), (−16, 0), (4, 20), (4, −20), (−4, 12),
(−4, −12)}`: the tame values of `{v, w}` there are `−1, 1, −1, 1, 1, −1, 1, −1` and those of `{−1, h}` the
same, so every tame value of `α` is one (Dummigan–Golyshev–de Jeu–Kerr, *The 2-part of the Bloch–Kato
conjecture, and indivisibility results, for K₂ of some elliptic curves*, arXiv:2605.11100v1, Proposition
10.2(1) and proof, pp. 29–30, for general `u`). The divisors of `v` and w have no common point, so the
values are read off from `w(P) = 1` at `(−16, 0)` and `(0, 0)`, `w(P) = −1` at `(−1, 0)` and at O, and
`v(P) = ∓1` at the four points of `(w)`; the value at O also follows from the other seven by §7.4. Prove
example_E4_not_constant: `α` is not in the image of `K_2(ℚ)`. The specialisations at `P = (0, 0)` and
`Q = (−16, 0)`, defined on the kernel of the tame symbol at those places by K2SymbolsBrauer §9.11's
higher Milnor residues, agree on constants, but `h(P) = w(P) = 1` gives `0` at `P`, while `h(Q) = 5`,
`w(Q) = 1` give `{−1, 5}` at Q (Dummigan–Golyshev–de Jeu–Kerr, Section 10 after Remark 10.3 and Table
10.4, p. 31), and `{−1, 5} ≠ 0` in `K_2(ℚ)` because its tame symbol at 5 is `−1 ∈ 𝔽₅^×` (K2SymbolsBrauer
§12.11). That `α` has infinite order is a regulator statement of EllipticRegulators. *Needs:* §§7.2, 7.4;
K2SymbolsBrauer §§9.11, 12.11.

**Checks.**

- all eight tame values of `α` equal one.
- `i_Q^*(α) = {−1, 1 + u} = {−1, 5}`, and the tame symbol of `{−1, 5}` at 5 is `−1`.
- each of `(v)`, `(w)`, `(h)` has degree zero. Exhaustiveness additionally
  follows by factoring their numerator and denominator zero loci in the coordinate ring and checking
  the order at O; degree zero alone would permit omitted pairs of a zero and a pole.

### 8.2 A residue at a closed point of degree two

On `E : y² = x³ + 1` over `ℚ` (`36a1`), prove example_degree_two_residue: `{y − 3, x}` is supported on
`(2, 3)`, the closed point `Z = {x² + 2x + 4 = 0, y = 3}` of degree two with residue field
`ℚ(x₀) = ℚ(√−3)`, `(0, 1)`, `(0, −1)` and O; `div(y − 3) = ((2, 3)) + Z − 3(O)` and
`div(x) = ((0, 1)) + ((0, −1)) − 2(O)`; its tame values are `1/2`, `1/x₀ = −x₀/4 − 1/2`, `−2`, `−4` and `1`;
`N_{ℚ(x₀)/ℚ}(1/x₀) = 1/4` and the normed product is `(1/2)(1/4)(−2)(−4)(1) = 1` (K2SymbolsBrauer §10.30), while
the product of the values with `x₀` read as `−1 + √−3` is `−1 − √−3 ≠ 1`. Moreover `{x − 1, −1}` has tame
value `−1` (norm one) at the degree-two point `{x = 1, y² = 2}` and value one elsewhere, so it is not in the
kernel of the tame symbol although every normed value is one (Weibel, *K-book*, III.6.5.3, p. 236, for the
norms). *Needs:* §§7.2, 7.4; K2SymbolsBrauer §10.30; Tau Ceti `Place.normResidue`.

**Checks.**

- the five tame values listed.
- the normed product is one and the unnormed product is not.
- `{x − 1, −1}` is not in the kernel of the tame symbol.

### 8.3 Integrality at a split multiplicative fibre

Prove example_bad_fibre. (a) On `11a3`, `y² + y = x³ − x²` (minimal discriminant `−11`, type I_1, split
multiplicative at 11, good elsewhere), the minimal Weierstrass model over `ℤ` is regular and proper, every
fibre is irreducible, and `x, y` have order zero along every fibre; hence `{x, y} + {−1, x}` has an integral
certificate with `S' = {11}` (§7.3). (b) For `u = 1/3` and `E : y² = x(x + 1)(x + 1/9)` (type I_4, split
multiplicative at 3), `α = {v, w} + {−1, h}` with `v=v_u`, `w=w_u`, `h=h_u` from §8.1 has a certificate, but
on the model `3(V² − Z²)(W² − Z²) + 4VWZ² = 0` (the equation `(V² − Z²)(W² − Z²) + 4uVWZ² = 0` with
denominators cleared, `v = V/Z`, `w = W/Z`) the local ring at the generic point `η` of the component `V = 0`
of the fibre at 3 is a discrete valuation ring with uniformiser 3: from `4vw = −3(v² − 1)(w² − 1)` with w
and `(v² − 1)(w² − 1)` units at `η`, `v` is 3 times a unit. So `ord_η v = 1`, `ord_η w = 0`, and the vertical
tame value of `{v, w}` is the class of `1/w`, of infinite order in `𝔽₃(w)^×`; that of `{−1, h}` is `±1`. A
regular proper model can be chosen to map to this projective model and to be an isomorphism over
the regular point `η`, so no non-zero multiple of
`α` is integral (Dummigan–Golyshev–de Jeu–Kerr, proof of Proposition 10.2(2), pp. 30–31). Only split
multiplicative primes can produce such a failure rationally: at good, additive and non-split fibres `K_1'`
of the fibre is torsion, so vertical conditions hold after multiplying by an integer (Young, Theorem 3.3,
p. 41). *Needs:* §§6.10, 7.3; §6.1.

**Checks.**

- (a) holds with `S' = {11}`.
- the vertical tame value of `m α` at `η` is not one for any `m ≠ 0`.
- when `4u` is an integer, for instance `u = 4`, `2α` is integral, so the failure in
  (b) comes from the denominator of `4u` (Dummigan–Golyshev–de Jeu–Kerr, Proposition 10.2(2)).

### Examples

The three targets of this layer are the examples.

### Dependencies

Layers 6–7; K2SymbolsBrauer §§9.2, 9.11, 10.30, 12.1, 12.11.

## Downstream consumers

- **EllipticRegulators** computes the Deligne regulator of the classes of Layer 7 and of the integral part
  of Layer 6 (the divisor formula, Bloch's classes and the Beilinson statement for elliptic curves); it
  uses the scheme of Layer 1, functoriality of Layer 5 and divisor_blochRho. Its input
  `S_a` is the divided class of §7.7; the integral ICM class maps to `C S_a`.
- **SpecialValuesBirchTate** states the higher special-value conjectures for elliptic curves in terms of
  `K_2(E)_{ℤ,ℚ}` (§6.8) and the finite-field orders of §5.11.
- **PadicHodgeRegulators** uses the functoriality of Layer 5 for the elliptic and higher-weight
  p-adic regulators.

## References

- C. Barwick, S. Glasman, A. Mathew and T. Nikolaus, *K-theory and polynomial functors*,
  [arXiv:2102.00936v2](https://arxiv.org/abs/2102.00936v2), Theorem 1.1 and §2.
- B. Köck and F. Zanchetta, *Comparison of exterior power operations on higher K-theory of
  schemes*, Mathematische Zeitschrift 309 (2025), article 63,
  [published article](https://doi.org/10.1007/s00209-025-03681-2),
  [arXiv:2110.06599v2](https://arxiv.org/abs/2110.06599v2), Theorem 4.1 and Corollary 4.2.
- B. Kahn and M. Levine, *Motives of Azumaya algebras*,
  [author preprint](https://webusers.imj-prg.fr/~bruno.kahn/preprints/Azumaya15.pdf),
  Proposition 4.8.1 and proof, p. 51 (the ordinary codimension-one Bloch complex).
- D. Quillen, *Finite generation of K-groups for rings of S-integers*,
  [Oberwolfach report 26/1974](https://oda.mfo.de/bitstream/handle/mfo/1481/full-text.pdf?isAllowed=y&sequence=1),
  p. 7, the second theorem (Steinberg homology of a one-point affine complement).

- Marc Levine, *K-theory and motivic cohomology of schemes, I*, author draft, December 2001,
  [author PDF](https://www.esaga.uni-due.de/f/marc.levine/publ/KthyMotI12.01.pdf):
  §3.2, Lemma 3.3 and Proposition 3.5 (pp. 12–14), Proposition 6.8 (pp. 19–20),
  Theorem 12.12 (pp. 58–59) and Theorem 14.7 (pp. 73–74).

- C. A. Weibel, *The K-book: an introduction to algebraic K-theory*, Graduate Studies in Mathematics 145,
  AMS, 2013; author-hosted combined draft of 29 August 2013,
  [Kbook.pdf](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf) (page `n` is PDF page `n + 8`), and
  its chapter files Kbook.III.pdf, Kbook.V.pdf, Kbook.VI.pdf at the same address. Results used:
  I.5.14–5.16; II.8.1, II.8.2.1, II.8.2.3–8.2.4, II.8.5–8.6; III.2.5.1; III.6.3, III.6.3.1, III.6.5.3,
  III.6.7, III.6.7.1, III.7.2; IV.6.9, Exercise IV.6.13; V.1.5, V.3.3.2, V.3.11–3.12, V.6.6, V.6.6.3–6.6.4,
  V.6.7.1, V.6.8, V.6.12–6.12.1, V.6.13.2, V.9.5; VI.1.7, VI.2.1–2.5.1, VI.4.1–4.3, VI.4.7, VI.6.1–6.8.
- S. Bloch, *Algebraic K-Theory and Zeta Functions of Elliptic Curves*, Proceedings of the
  International Congress of Mathematicians, Helsinki 1978, vol. 2, Helsinki, 1980, pp. 511–515,
  [IMU proceedings](https://www.mathunion.org/fileadmin/ICM/Proceedings/ICM1978.2/ICM1978.2.ocr.pdf#page=10):
  p. 514, the unnumbered corrected-symbol construction after the localisation sequence
  and the following torsion-point specialisation (one-based PDF page 10). The comparison
  in §7.7 records the integral convention of this paper and the divided convention here.
- M. A. Young, *K₂ and L-series of elliptic curves over real quadratic fields*, PhD thesis, Durham, 1995,
  [Durham E-Theses 5114](https://etheses.durham.ac.uk/id/eprint/5114/1/5114_2567.PDF): Lemma 3.1 (p. 37),
  Theorem 3.3 (p. 41).
- T. Dokchitser, R. de Jeu, D. Zagier, *Numerical verification of Beilinson's conjecture for K₂ of
  hyperelliptic curves*, Compositio Math. 142 (2006), 339–373,
  [arXiv:math/0405040v2](https://arxiv.org/abs/math/0405040): (3.1), (3.5)–(3.6), Remark 3.8, Construction 4.1,
  Lemma 4.2, Proposition 4.3, Remark 4.14, Theorem 8.3.
- N. Dummigan, V. Golyshev, R. de Jeu, M. Kerr, *The 2-part of the Bloch–Kato conjecture, and
  indivisibility results, for K₂ of some elliptic curves*,
  [arXiv:2605.11100v1](https://arxiv.org/abs/2605.11100): Proposition 2.2, Proposition 10.2, Remark 10.3,
  Table 10.4. In the proof of Proposition 2.2(1) the discriminant of `y² = x(x + 1)(x + u²)` is
  `16u⁴(u² − 1)²`, not `16u⁴(u² − 1)⁴`.
- A. J. Scholl, *Integral elements in K-theory and products of modular curves*, in *The arithmetic and
  geometry of algebraic cycles* (Banff 1998), NATO Sci. Ser. C 548 (2000), 467–489; author's preprint
  [k1.pdf](https://www.dpmms.cam.ac.uk/~ajs1005/preprints/k1.pdf): introduction (0.1), 1.1.1–1.1.7, 1.3.3,
  1.3.6.
- B. Conrad, *Minimal models for elliptic curves*, notes, 2015,
  [minimalmodel.pdf](https://math.stanford.edu/~conrad/papers/minimalmodel.pdf): Definitions 3.1, 3.8,
  Example 3.9, Theorem 3.10, Remark 3.11, Corollary 4.7, Example 5.3.
- The Stacks project, Lemmas 33.9.3–33.9.4 (tags 0BUG, 0FD1); Chapter 53 (Algebraic Curves): tags 0BY1, 0BY3, 0BYC, 0BYD, 0BS6; Chapter 54
  ([Resolution of Surfaces](https://stacks.math.columbia.edu/download/resolve.pdf)): tags 0ADX, 0BGP, 0C2N,
  0C5J, 0C5S; Chapter 55 ([Semistable Reduction](https://stacks.math.columbia.edu/download/models.pdf)): tags
  0C2U, 0C2V, 0CD9, 0C2W, 0C5Z, 0C6B, 0C9Z, Example 55.10.3.
- B. Poonen, *Rational points on varieties*, Graduate Studies in Mathematics 186, AMS, 2017; author's draft
  [Qpoints.pdf](https://math.mit.edu/~poonen/papers/Qpoints.pdf): §5.7.6 and (5.7.29), Corollary 6.7.8,
  Exercises 2.12 and 6.10.
- H. Bass, J. Milnor, J.-P. Serre, *Solution of the congruence subgroup problem for SLₙ (n ≥ 3) and Sp₂ₙ (n ≥ 2)*, Publ. Math. IHÉS 33 (1967), 59–137 (Numdam).
- T. Geisser, M. Levine, *The K-theory of fields in characteristic p*, Invent. Math. 139 (2000), 459–493, as
  stated in Weibel, *K-book*, Theorem VI.4.7.
- G. Harder, *Die Kohomologie S-arithmetischer Gruppen über Funktionenkörpern*, Invent. Math. 42 (1977),
  135–175, as stated in Weibel, *K-book*, Theorem VI.6.1.
- D. Grayson, *Finite generation of K-groups of a curve over a finite field (after Daniel Quillen)*,
  in *Algebraic K-theory, Part I* (Oberwolfach, 1980), Lecture Notes in Math. 966, Springer, 1982,
  pp. 69–90, as stated in Weibel, *K-book*, Theorem IV.6.9 and the paragraph before it, p. 325.
