# Roadmap: the Mordell conjecture after Lawrence and Venkatesh, part II

**Summary.** This roadmap builds the higher-dimensional form of the Lawrence–Venkatesh period-map
method and applies it twice. A Hodge–Deligne system on a smooth arithmetic base packages a rational
local system, an étale local system, a filtered flat bundle and a filtered F-isocrystal with their
comparison isomorphisms; a rational integral point of the base then gives a global Galois
representation whose restriction to a decomposition group is read off, on a p-adic residue disk,
from the value of a p-adic period map. Coefficient algebras, their semilinear normalizer groups and
tensor filtrations on these groups make Frobenius and arithmetic descent part of one algebraic group.
Faltings's finiteness lemma leaves finitely many global semisimplifications; a fixed
semisimplification gives finitely many local graded types, which record the auxiliary flag only
through its parabolic, and global purity over ℚ forces the induced Hodge filtrations to be balanced. A
root-pairing estimate bounds the semibalanced filtrations with a prescribed associated graded, and
strongly balanced monodromy distributes the estimate over independent factors in one Frobenius
cycle. The pure Ax–Schanuel theorem for period maps, transferred to p-adic coefficients through
Rückert's Nullstellensatz and Krull intersection, turns the resulting codimension bounds into
non-density.
The end theorems are the coefficient non-density theorem (Lawrence–Sawin, Theorem 8.17), the
higher-dimensional Lawrence–Venkatesh theorem (Theorem 10.1) with its finiteness clause, the
non-density of integral parameters of smooth hypersurfaces of large dimension and degree in `ℙⁿ`
(Proposition 10.2), and Shafarevich finiteness up to `A(K)`-translation for smooth ample
hypersurfaces in abelian varieties of dimension at least 4, of dimension 3 away from an explicit
exceptional set of degrees, and of dimension 2 (Lawrence–Sawin, Theorem 9.2, Corollary 9.3,
Theorems 9.4–9.6).

## Scope and ownership

This roadmap owns:

1. **Hodge–Deligne systems** (Layer 0): the category of compatible Betti, étale, de Rham and
   crystalline realizations on a smooth model, its integral, polarized and integral-Frobenius
   subcollections, its neutral Tannakian structure, constant systems, geometric cohomology systems
   cut out by finite-group projectors, differential monodromy from a tensor generator, and the
   constant Frobenius module on a residue disk.
2. **Arithmetic coefficient systems** (Layer 1): H⁰-algebras and their finite étale operations,
   coefficient modules, equidimensional modules, GL, GSp and GO structures over a coefficient
   algebra, finite-order character systems, Galois-orbit cohomology systems of hypersurfaces in
   abelian varieties, the inversion pairing of those whose hypersurface is inversion-symmetric up to
   translation, and rationality of their Frobenius polynomials.
3. **Semilinear groups and tensor filtrations** (Layer 2): the semilinear coefficient normalizer
   and its Frobenius centralizer bound, the descent of semisimplification to a field of
   characteristic zero in groups with reductive identity component (rational representatives,
   finiteness of geometric classes inside one linear class, finiteness of rational classes over
   p-adic fields, continuity), tensor G-structures and
   G-filtrations, crystalline inner forms, adjoint
   Hodge profiles and their top-weight sums, uniform filtrations, finiteness of global
   coefficient-group types, finiteness of semisimplification geometries, finiteness of local
   nonabelian Galois cohomology and the bijection `H¹(F, L ⋉ U) → H¹(F, L)` for unipotent `U` in
   characteristic zero (EndoscopicTransferAndUnitaryTraceComparison §1.13a states it for a rational
   parabolic of a connected reductive group; the form here also covers the Richardson parabolics of
   disconnected groups).
4. **Period orbits and transcendence transfer** (Layer 3): period maps in one monodromy orbit,
   parabolic stabilizers, the codimension consequence of Ax–Schanuel (§3.3; Lawrence–Sawin,
   Lemma 6.3) and its transfer to p-adic non-density over an arbitrary number field.
5. **Balanced monodromy and balanced filtrations** (Layers 4–5): index classes of subdirect
   products, strong balance, torsion-orbit balance, semisimple orbit codimension, central weights,
   induced Levi filtrations, balance and semibalance, global purity over ℚ, bifiltered Frobenius
   types, unipotent cocycles, Frobenius-stable Levi factors, local type finiteness, the root pairing,
   and the fixed-graded and fixed-type codimension estimates.
6. **The end theorems** (Layers 6–10): the coefficient non-density theorem, the higher-dimensional
   Lawrence–Venkatesh theorem with its bounded-prime argument and finiteness clause, the corrected
   point-count bound for Frobenius centralizers, the Eulerian numerical criteria, the projective
   hypersurface application and hypersurface Shafarevich finiteness.

It uses, and does not redevelop:

- **MordellLawrenceVenkatesh.** Its Layer LV.0 supplies the centralizer of a semilinear
  automorphism and its dimension (§§0.3–0.4) and Goursat's lemma for simple Lie algebras (§0.24);
  Layer LV.1 supplies Faltings's finiteness lemma (§1.2) and the Hodge weight of a pure
  representation (§§1.10, 1.12–1.13); Layer LV.2 supplies residue disks (§2.5), formal horizontal
  sections (§2.6), their complex convergence (§2.8) and the crystalline Frobenius on fibres with its
  Gauss–Manin compatibility for abelian-by-finite families (§2.11). That roadmap stops at the
  one-dimensional S-unit and Mordell arguments of Lawrence–Venkatesh §§2–8 and leaves the
  hypersurface sections and the Ax–Schanuel input to this one. Its period variety (§3.8) is the
  Lagrangian case of the monodromy orbits of §3.1 here.
- **SheafConvolutionOnAbelianVarieties.** It owns character sheaves, sheaf convolution and
  convolution monodromy groups. This roadmap imports its origin-normalized rank-one character
  sheaves (§0.2), the geometric extension comparison (§2.4), the Euler characteristics of a smooth
  ample divisor (§3.1) and the Hodge–Tate row of a generic torsion twist (§3.3), inversion symmetry
  and the classical form (§4.8), the exceptional Pell sequence and the exceptional threefold degrees
  (§§5.2–5.3), classical convolution monodromy (§6.7), and the character generic in every
  Galois conjugate with uniform big monodromy on its orbit (§§8.2–8.3). The exceptional degrees are
  used exactly as that roadmap defines them: the pairs start at (1,5), (5,20), (20,76), and
  `D_j = binomial(a_j + b_j, a_j)/6` for `j ≥ 1`, so `D_1 = 8855`.
- **ClassicalArithmeticCompletion** §§2.18, 2.39 and 2.56 own Eulerian numbers, their basic
  identities and unimodality; `eulerian` in `Suggested.lean` restates §2.18's definition only so
  that the Layer 8 headline can be stated.
- **ReductiveGroups** owns algebraic groups, their closed subgroups, quotients and component groups
  (Layer 3), orbits of algebraic actions (Layer 3A), their tori (Layer 4), unipotent radicals
  (Layer 5), linear reductivity (Layer 6), characteristic-zero Levi complements (Layer 6A), root, Weyl,
  parabolic and Bruhat theory
  (Layer 7) and algebraic parabolics with Levi intersections (Layer 7b). The coefficient-normalizer
  specializations and the remaining disconnected-group statements of Layer 2 (rational
  semisimplification, semisimplification geometries) are owned here.
- **ArithmeticGaloisRepresentations** §1.11, *Complete reducibility and closed tuples*, owns
  G-complete reducibility, the closed-tuple criterion and Levi semisimplification for connected
  reductive groups, and **LanglandsParameterStacks** §§2.3–2.4 extend them to groups with
  reductive identity component and finite étale component group, testing all R-parabolics and
  R-Levis, with Levi semisimplification unique up to `G°(k̄)`-conjugacy over an algebraically
  closed field `k̄`. §2.3 here differs in owning only the descent to a field of characteristic zero
  (parabolics and Levis defined over that field and a rational representative of the geometric
  class), the finiteness of the classes of homomorphisms into `G` inside one linear class, the
  finiteness of rational classes over p-adic fields and continuity; the characteristic-zero criterion
  that a subgroup is G-completely reducible exactly when its identity component is reductive is asked
  of LanglandsParameterStacks §2.3 in the supplier contracts.
- **ReductiveGroupsPartII** §RG2.0.2 owns the analytic manifold structure on the points of a smooth
  group over a characteristic-zero local field; Layer 9 uses it for the Zariski density of open
  subgroups of `SO(E)(ℚ_ℓ)`.
- **ShimuraData** owns variations of Hodge structure (§3.1), their morphisms, kernels and images
  (§3.2), polarized rational and integral variations (§§3.3–3.4), the flat-bundle local comparison
  (§3.5), the transversality criterion (§3.6), the parabolic of a Hodge filtration (§3.7) and
  Mumford–Tate groups with their connectedness and reductivity (§§1.2–1.4). Tau Ceti supplies mixed
  Hodge structures with their morphisms and the strictness of morphisms for `F` and `W`
  (`TauCeti.Hodge.MixedHodgeStructure.Hom.range_inf_F_eq_map_F` and its weight-filtration companions);
  §0.3 applies them fibrewise, and the systems, their local-system gluing and comparisons are owned
  here.
- **MotivesAndAlgebraicCycles** §§6.1–6.3 and 6.8 own neutral Tannakian reconstruction and the
  affine faithfully flat torsor of tensor isomorphisms between two fibre functors; PadicHodgeTheory
  §5.5 specializes that torsor to finite-type groups.
- **PadicHodgeTheory** owns period rings, Fontaine's functors and their tensor exactness
  (§§3.3–3.6), the Sen operator (§4.4), the local torsor theorem for connected reductive groups over
  finite extensions of `ℚ_p` (§5.5), the rational Fontaine–Laffaille comparison (§6.1), the proper
  smooth pushforward of de Rham local systems with its Gauss–Manin connection (§7.3) and the
  rational comparison for proper smooth varieties with its functoriality (§§8.1–8.2);
  CrystallineCohomology §CR.7.3 owns relative crystalline cohomology with its Gauss–Manin
  connection.
- **DeligneWeightsAndPurity** owns Weil numbers, weights and their linear algebra (§§0.1–0.2,
  0.7, 0.9–0.10, 0.16), Zariski density of open subgroups of `Sp(V)(ℚ_ℓ)` (§2.2), purity for smooth
  projective varieties (§§4.3–4.4) and the orthogonality of invariant and vanishing cohomology of a
  hyperplane section (§9.12);
  PadicDifferentialEquationsAndRigidCohomology §RD.7.7 owns the Katz–Messing agreement of
  crystalline and ℓ-adic Weil factors; InverseGaloisAndArithmeticFundamentalGroups §IG.0.T4 owns the
  constant-sheaf point-count trace formula; WeilConjectures Layer WC.5 and
  EtaleDualityAndPerverseSheaves §4.3 own the cohomology and point counts of complete
  intersections.
- **LefschetzPencilsAndVanishingCycles** owns the Picard–Lefschetz formula (§2.8), existence of
  Lefschetz pencils (§3.4), the vanishing quotient and its pairing (§4.4), the Kazhdan–Margulis
  open-image theorem (§5.8) and the orthogonal open-or-finite alternative with the ADE description
  of finite monodromy (§5.10).
- **ComplexKahlerGeometry** K3 §3.4 owns Rückert's Nullstellensatz `I(V(𝔞)) = √𝔞` for convergent
  power series (`ruckert_nullstellensatz`: a germ vanishing on the common zero set of finitely many
  germs has a power in their ideal) and the locally finite decomposition of analytic sets into
  irreducible components; the p-adic transfer (§3.4) applies both to the period ideal without
  restating them;
  **RestrictedPowerSeries** owns evaluation of restricted series (§2.1) and Noetherianity of Tate
  algebras (§5.2); **ComplexComparisonPartII** owns the Gauss–Manin connection (§C5.2), geometric
  Hodge theory (§C5.3), regular singular connections with Deligne's Riemann–Hilbert theory (§C5.6)
  and the Artin comparison (§C6.6), and Griffiths's residue description of the Hodge filtration of a
  smooth projective hypersurface is asked of it in the supplier contracts; §8.6 owns only the
  resulting formula for the primitive Hodge numbers.
- **SchemeAndStackFoundations** owns spreading out (§§0.8–0.9), torsors and torsor classes (§§1.15,
  2.3), contracted products and twisted forms (§1.16) and Hilbert and Quot schemes (§4.14), and
  **PELModuli** §M0.9 owns the description of torsor classes under a smooth affine group over a field
  by continuous Galois cocycles; §2.11 owns only the finiteness of `H¹` over p-adic fields, the
  classification of rational conjugacy classes it gives, and the unipotent-radical bijection.
  **AlgebraicModuliForArithmeticGeometry** owns Hilbert families (§2.1) and the characteristic-zero
  resolution preserving the regular locus (§9.4).
- **AbelianSchemesAndArithmeticModuli** owns abelian schemes (§A0.1), rigidity (§A1.2), extension
  of sections over Dedekind bases (§A1.8), ample cohomology and degrees (§A2.4), the Néron–Severi
  group (§A2.10), multiplication maps and prime-to-characteristic torsion (§A3.2), quotients by
  finite subgroups (§A3.3), theta groups and polarized descent
  (§A3.6), finite rank of Hom (§A6.7), Rosati positivity (§A6.14) and Weil restriction
  (§§A6.30–A6.32). Tau Ceti supplies abelian varieties over a field as
  `TauCeti.AlgebraicGeometry.AbelianVariety`. **JacobianChallenge** Layer F owns the Abel–Jacobi map
  of a pointed smooth proper curve and its Albanese universal property, used for curves in abelian
  surfaces (§10.10).
- **EtaleCohomologyFoundations** §F.3 owns lissity of the higher direct images of a smooth proper
  morphism with finite invertible coefficients, and **ClassicalAdicEtaleCohomology** §8.2 owns
  Huber's comparison of algebraic and analytic proper higher direct images; together they supply the
  lisseness hypothesis of PadicHodgeTheory §7.3 for the smooth projective families of Layer 0.
- **Chebotarev** Layer 10 owns the Chebotarev density theorem.
- **HeightsRationalPointsAndObstructions** §§1.6–1.7 own weak Mordell–Weil and Mordell–Weil, and §5.2
  owns the scheme-theoretic translation stabilizer of a closed subscheme of an abelian variety over a
  field, as a subgroup functor on all test schemes (nilpotent ones included) with membership, action and
  base change; `Stab(H)` of §10.1 is its specialization to a divisor `H`, while the finiteness of the
  stabilizer of an ample divisor, good reduction, primitivity and the finite primitive quotients of §10.7
  are owned here;
  **FaltingsFinitenessAndIsogenyTheorems** §R28.5.15 owns Shafarevich finiteness for curves of
  genus at least two.
- **AbelianSchemesAndArithmeticModuliPartII** Layer B3 owns the o-minimal Ax–Schanuel machinery for
  Kuga mixed Shimura varieties; the pure Ax–Schanuel theorem for period maps is asked of it in the
  supplier contracts.
- **MappingClassGroupsAndCanonicalRepresentations** §5.4 owns the limit theorem for polarizable real
  variations on a punctured disc and the theorem of the fixed part for admissible graded-polarizable real
  variations on a smooth quasi-projective variety; §3.1 applies the latter to polarized integral
  variations, which are admissible.

It leaves to other roadmaps: the general theory of variations of mixed Hodge structure and limiting
Hodge structures; general relative p-adic Hodge theory beyond the good-reduction proper smooth
families used here; any effective bound on integral points (the method is ineffective) and any
finiteness for the quotient of the hypersurface parameter space by `PGL_(n+1)`.

## Conventions

- **Arithmetic models.** A number field `K` comes with a fixed embedding `K → ℂ` and a finite set
  `S` of places; models are over `O_K[S⁻¹]`. Rational-base non-density theorems use a smooth
  geometrically connected `X/ℚ` of positive dimension with a smooth model over `ℤ[S⁻¹]`. Enlarging `S` by
  a stated finite set is a harmless reduction of the arithmetic problem (it enlarges the set of
  integral points); it is kept distinct from changing the base field. A p-adic residue disk is
  taken at a smooth point of good reduction. An abstract field isomorphism `σ : ℚ̄_p ≅ ℂ` (both are
  algebraically closed of characteristic zero and of the cardinality of the continuum), chosen to
  restrict on `K ⊂ ℚ̄_p` to the fixed embedding `K → ℂ`, is used on formal coefficients in `K_v` and
  its finite extensions only, never as a continuous map.
- **Filtrations.** Hodge filtrations `F` are decreasing with `gr^a_F = F^a/F^(a+1)`. Auxiliary
  flags `f` are increasing with `gr_k^f = f_k/f_(k−1)`. A cocharacter μ with weight spaces `V_j`
  gives `F^a = ⊕_(j≥a) V_j`.
- **Adjoint profiles.** For a filtration on a group `H`, `h^a = dim gr^a Lie(H)`, `D = Σ_a h^a`,
  `A = Σ_(a>0) h^a` and `B = Σ_(a>0) a·h^a`. The top-weight function `T` sums the largest weights
  **with multiplicity** and interpolates linearly on `[0, D]`. In the coefficient theorem `h` and
  `T` belong to one classical factor `H`; restriction of scalars of degree `d` scales them by
  `h_Res = d·h` and `T_Res(d·x) = d·T(x)`.
- **Hodge–Tate signs.** The arithmetic convention is `HT(χ_cyc) = +1`; the de Rham filtration of
  `ℚ_p(1)` jumps at `−1`. Geometric Frobenius on `ℚ_p(−1)` is `q` and its de Rham jump is `+1`.
  The torsion-twist multiplicities `d·A(n, q)` of SheafConvolutionOnAbelianVarieties §3.3 occur at
  Hodge–Tate weight `−q` in the arithmetic convention and at descending de Rham degree `q`. Global
  pure Weil weight `w` gives average descending de Rham degree `w/2`, equivalently arithmetic
  Hodge–Tate average `−w/2`, over ℚ; this is not embeddingwise valid over an arbitrary CM field.
  Witness: `ℚ_p(−1)` has Weil weight 2, de Rham jump `+1 = 2/2` and Hodge–Tate weight `−1 = −2/2`;
  `H¹` of an elliptic curve has Weil weight 1, de Rham jumps `0, 1` and Hodge–Tate weights `0, −1`,
  while its Tate module `V_pE = H¹(1)` has Weil weight `−1`, de Rham jumps `0, −1` and Hodge–Tate
  weights `0, 1`.
- **Modular character.** `δ_P⁻¹ = det(Ad | Lie P)⁻¹`. For the upper triangular Borel of `GL₂` it is
  `diag(a, b) ↦ a⁻¹b`; semibalance means that its pairing with the induced cocharacter is `≤ 0`.
- **Dimensions.** For a hypersurface in an `n`-dimensional abelian variety the middle degree is
  `n − 1`: when the hypersurface is inversion-symmetric up to translation, the inversion pairing is
  alternating when `n` is even and symmetric when `n` is odd; otherwise there is no invariant pairing
  and the coefficient structure is `GL`.
  `N = n!·d` with normalized degree `d = φ^n/n!`. In the projective application `n` is the ambient
  dimension, again with middle degree `n − 1`, and the parameter space has dimension
  `binomial(n + d, d) − 1`.
- **Groups.** Algebraic groups are affine of finite type over a field of characteristic zero unless
  stated; "reductive identity component" allows finite component groups, and the orthogonal
  similitude group `GO_(2r)` is kept with its two components.
- **Source versions.** Lawrence–Sawin locators refer to arXiv:2004.09046v5 (pages of that
  preprint); Lawrence–Venkatesh locators refer to printed pages 893–999 of the Inventiones article,
  with its non-strict published inequalities `A ≥ h⁰ + dim Y` and `A ≥ z + e`.

## Exact supplier contracts

### From Mathlib

- `Finsupp` (`Mathlib/Data/Finsupp/Defs.lean`): finitely supported functions, used for
  integer-indexed natural multiplicities `h^a`; `Finsupp.degree` (`Mathlib/Data/Finsupp/Weight.lean`)
  for the total degree of a monomial exponent.
- `Ideal.iInf_pow_eq_bot_of_isLocalRing` (`Mathlib/RingTheory/Filtration.lean`, line 432): in a
  Noetherian local ring the intersection of the powers of a proper ideal is zero (Krull). It is
  applied to localizations of quotients of Tate algebras in §3.4.
- `MvPolynomial.IsHomogeneous`, `MvPolynomial.pderiv`, `MvPolynomial.aeval` and `AlgebraicClosure`:
  the carriers of `IsSmoothHypersurface` and `integralHypersurfaces_not_zariskiDense`.
- `RingTheory.Sequence.IsRegular` (`Mathlib/RingTheory/Regular/RegularSequence.lean`): regular
  sequences, used for the Jacobian ring in §8.6.
- `Equiv.Perm`, `Finset.filter` and `Nat.factorial`: the carriers of `eulerian` and
  `eulerian_central_mass_le_half`.

### From Tau Ceti

- `TauCeti.Cocharacter.parabolic` (`TauCeti/Algebra/AlgebraicGroup/Dynamic/Parabolic.lean`,
  line 154): the dynamic parabolic subgroup functor of a cocharacter, defined by the existence of
  the conjugation limit on Hopf-algebra points. Every Richardson parabolic `P_λ` of Layers 2 and 5
  is this functor; the Levi decompositions under `TauCeti/Algebra/AlgebraicGroup/Dynamic/LeviDecomposition`
  are used with it.
- `TauCeti.Tannaka.fgPointTensorIsoEquiv`
  (`TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/Equivalence.lean`, line 188): for a
  commutative Hopf algebra over a field, its points with values in an algebra are the tensor
  automorphisms of the scalar-extended forgetful functor on finitely generated comodules. This is
  reconstruction for a known group, not the torsor theorem for two arbitrary fibre functors.
- `TauCeti.Hodge.MixedHodgeStructure` (`TauCeti/Geometry/Hodge/Mixed/Basic.lean`, line 72) and
  `TauCeti.Hodge.MixedHodgeStructure.Hom` (`TauCeti/Geometry/Hodge/Mixed/Morphism.lean`, line 77): a
  mixed Hodge structure on an integral carrier with rational and complex base-change models, a finite
  rational weight filtration and a finite complex Hodge filtration whose weight-graded pieces are pure,
  and morphisms as rational maps preserving `W` whose complexification preserves `F`. No finiteness of
  the carriers and no polarization are included. Strictness
  (`TauCeti/Geometry/Hodge/Mixed/Strictness.lean`):
  `TauCeti.Hodge.MixedHodgeStructure.Hom.range_inf_F_eq_map_F` (line 110), `im f ∩ F'^p = f(F^p)`;
  `TauCeti.Hodge.MixedHodgeStructure.Hom.range_inf_WC_eq_map_WC` (line 118), the same for the
  complexified weight filtration; `TauCeti.Hodge.MixedHodgeStructure.Hom.range_inf_WQ_eq_map_WQ`
  (line 131), `im f ∩ W'_k = f(W_k)` rationally. Mixed Hodge structures form an abelian category
  (`TauCeti.Hodge.MixedHodgeStructureCat.abelian`, `TauCeti/Geometry/Hodge/Mixed/Abelian.lean`,
  line 33). Applied fibrewise in §0.3; local systems, connections and comparisons are not part of it.
- `TauCeti.AlgebraicGeometry.AbelianVariety` (`TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean`):
  an abelian variety over a field, bundled as a proper geometrically integral group scheme, with
  derived smoothness, geometric connectedness and commutativity. There is no abelian scheme over a
  base other than a field at the pin, so the good-reduction model of Layer 10 is not available.
- `TauCeti.AlgebraicGeometry.LineBundleClass.IsAmple` (`TauCeti/AlgebraicGeometry/LineBundle/Ample.lean`,
  line 71), `TauCeti.AlgebraicGeometry.Scheme.CartierDivisor`
  (`TauCeti/AlgebraicGeometry/CartierDivisor/Basic.lean`, line 127) and
  `TauCeti.AlgebraicGeometry.Scheme.CartierDivisor.IsEffective`
  (`TauCeti/AlgebraicGeometry/CartierDivisor/Effective/Basic.lean`, line 45): ampleness of a
  line-bundle class on a scheme (quasi-compactness and, at every point, an affine nonvanishing locus of
  a section of a positive power), Cartier divisors on an integral scheme as global sections of
  `𝒦_X^× / 𝒪_X^×`, and their effectivity (every local equation regular at its point); the underlying
  scheme of an abelian variety over a field is integral, so both apply to it. These are the
  carriers of the ample effective divisors of Layer 10 on the abelian variety over `K`.
  `TauCeti.AlgebraicGeometry.LineBundleClass.intersectionNumber`
  (`TauCeti/AlgebraicGeometry/IntersectionNumber/Basic.lean`, line 111) pairs a class `a` on `X` with
  any scheme `C` over a field `k` and morphism `ι : C → X`, as the Euler-characteristic degree
  `TauCeti.AlgebraicGeometry.LineBundleClass.eulerDegree` (`TauCeti/AlgebraicGeometry/LineBundle/Degree.lean`,
  line 130, built on the line-74 degree of an invertible sheaf) of `ι^* a`, computed with the truncation
  `dim H⁰ − dim H¹`. When `C` is a proper curve it is the usual degree of the restriction; for
  `C = X = Spec k` and `ι = id` it is defined and vanishes on the trivial class. It is not a
  numerical-equivalence carrier: numerical equivalence classes of divisors and the top self-intersection
  `φⁿ` are not at the pin.
- `CategoryTheory.Sheaf.NonabelianH1` (`TauCeti/CategoryTheory/Sites/NonabelianCohomology/Torsor.lean`,
  line 226): the pointed set of isomorphism classes of torsors under a sheaf of groups, based at the
  trivial torsor. It is the carrier of `H¹(F, H)` in §2.11, through the torsor classes of
  SchemeAndStackFoundations §§1.15 and 2.3; it carries no Galois-cocycle description and no finiteness.
- `TauCeti.AlgebraicGeometry.projectivePlaneCurve` (`TauCeti/AlgebraicGeometry/Curves/PlaneCurve/Basic.lean`,
  line 101) and `TauCeti.AlgebraicGeometry.projectivePlaneCurve.smoothOfRelativeDimension`
  (`TauCeti/AlgebraicGeometry/Curves/PlaneCurve/Smooth.lean`, line 92): for a homogeneous `G` in three
  variables over a field `k` and an algebraically closed extension `K`, if every nonzero zero of `G` in
  `K³` has a nonzero partial derivative of `G`, then `Proj k[x₀, x₁, x₂]/(G)` is smooth of relative
  dimension one over `k`, in every characteristic. For `n = 2` and `K` the algebraic closure of `k` this
  hypothesis is `IsSmoothHypersurface G`; it is used only in the Checks of §9.1. There is no projective
  hypersurface scheme in higher dimension at the pin.

### From TauCetiRoadmap.MordellLawrenceVenkatesh

- §§0.3–0.4: for a field `E` with an automorphism `σ` of finite order `e` and a σ-semilinear bijection
  `φ` of a `d`-dimensional `E`-vector space, the centralizer `Z(φ)` as an algebra over `E^σ`, with
  `dim_(E^σ) Z(φ) = dim_E Z(φ^e) ≤ d²` (Lawrence–Venkatesh Lemma 2.1); consumed in §2.2, which reduces a
  finite étale algebra `E` over `E₀` with `E^σ = E₀` to this case: `σ` permutes the field factors of `E`
  in one cycle of length `k`, and restriction to one factor `E₁` identifies `Z(φ)` with the centralizer of
  the `σ^k`-semilinear map `φ^k` on that factor, where `σ^k` has fixed field `E₀` on `E₁`.
- §0.24: Goursat's lemma for products of simple Lie algebras; consumed in §4.1.
- §1.2: Faltings's finiteness lemma: for fixed `K`, `S`, rank and weight, finitely many semisimple
  pure Galois representations with integral Frobenius polynomials up to isomorphism; consumed in
  §§2.9 and 7.3, and through §2.9 in §§4.5, 6.1 and 7.6. Its hypotheses are integer characteristic
  polynomials of Frobenius, which §1.9 supplies for the orbit systems.
- §§1.10, 1.12–1.13: global purity forces the conjugation relation on Hodge–Tate exponents, the
  weight of a filtration, and the Hodge weight `w/2` of a pure representation; consumed in §5.4,
  §1.12 through §1.13, whose conclusion is stated in that weight.
- §§2.5, 2.6, 2.8: residue disks with coordinates, formal horizontal sections with integral
  coefficients, and their complex convergence; consumed in §§0.7 and 3.4.
- §2.11: crystalline Frobenius on de Rham cohomology of fibres and its compatibility with
  Gauss–Manin transport, for abelian-by-finite families; §0.7 extends it to the geometric systems
  of §0.5 through CrystallineCohomology §CR.7.3.

### From TauCetiRoadmap.SheafConvolutionOnAbelianVarieties

- §0.2: the origin-normalized rank-one character sheaf `L_χ` of a finite-order character; consumed
  in §1.6.
- §2.4: comparison of convolution groups under extension of algebraically closed fields; consumed
  in §4.3.
- §3.1: for a smooth ample divisor `H` in a complex abelian variety of dimension `n ≥ 2` with
  `d = [H]^n/n!`, `χ(H, Ω^q_H) = (−1)^(n−1−q)·d·A(n, q)` for `0 ≤ q < n` and
  `e_top(H) = (−1)^(n−1)·n!·d`; so a rank-one twist whose cohomology is concentrated in degree
  `n − 1` has rank `N = n!·d` there. §3.3: for such a twist over a p-adic field the Hodge–Tate
  weight `−q` occurs with multiplicity `d·A(n, q)`, `0 ≤ q < n`. Consumed in §§1.7 and 8.1.
- §4.8: inversion symmetry and the classical form on the twisted cohomology: the image is `SL_N`
  unless the hypersurface is a translate of its inversion, in which case the pairing is alternating
  for even `n` (`Sp_N`) and symmetric for odd `n` (`SO_N`); the standard `SL_N` module carries no
  invariant form. Consumed in §1.8 and, for the branch choice, in §10.5.
- §§5.2–5.3: the exceptional Pell pairs and exceptional degrees `D_j`; consumed in §§10.5, 10.6
  and 10.9.
- §6.7: classical convolution monodromy (`SL`, `Sp` or `SO`) for hypersurfaces outside the
  exceptional degrees; consumed in §§4.3 and 10.5.
- §§8.2–8.3: a torsion character of order prime to `p`, generic in every Galois conjugate, with
  big monodromy uniformly on its orbit; consumed in §§1.7, 4.3 and 10.5.

### From TauCetiRoadmap.ClassicalArithmeticCompletion

- §2.18 (Eulerian numbers, `A(n, q)` counting permutations of `Fin n` with `q` descents), §2.39
  (the factorial sum, symmetry, recurrence and Worpitzky's identity) and §2.56 (unimodality of the
  rows); consumed in Layer 8.
- What ClassicalArithmeticCompletion must provide (gap:eulerian-row-log-concavity): for every `n`, the row `q ↦ A(n, q)` is positive exactly on `0 ≤ q < n` when `n ≥ 1` and on `{0}` when `n = 0` (the empty permutation gives `A(0, 0) = 1`), and `A(n, q)² ≥ A(n, q − 1)·A(n, q + 1)` for every `q ≥ 1`.
- What ClassicalArithmeticCompletion must provide (gap:log-concave-convolution): if `a, b : ℤ → ℝ` are nonnegative, finitely supported, supported on integer intervals and log-concave (`a_k² ≥ a_(k−1)·a_(k+1)` for every `k`), then the convolution `k ↦ Σ_j a_j·b_(k−j)` and the reflection `k ↦ a_(−k)` have the same four properties.
- What ClassicalArithmeticCompletion must provide (gap:eulerian-descent-variance): for `n ≥ 2` the descent number of a uniformly random permutation of `Fin n` has mean `(n − 1)/2` and variance `(n + 1)/12`, that is `Σ_q q·A(n, q) = n!·(n − 1)/2` and `Σ_q (q − (n − 1)/2)²·A(n, q) = n!·(n + 1)/12`.
- What ClassicalArithmeticCompletion must provide (gap:eulerian-central-limit): for a uniformly random permutation of `Fin n`, `(des − (n − 1)/2)/√n` converges in law to the centred normal law of variance `1/12` as `n → ∞`.

### From TauCetiRoadmap.ReductiveGroups

- Layer 3 (closed subgroup schemes and kernels, normal subgroups and their fppf quotients, the
  identity component and its finite étale component group), Layer 3A (algebraic actions: an orbit is
  locally closed and open in its closure, and the orbit of a reduced group is smooth), Layer 4 (Jordan
  decomposition, diagonalizable groups and tori), Layer 5 (unipotent groups and the unipotent radical),
  Layer 6 (reductive groups and linear reductivity: in characteristic zero an affine group of finite
  type is linearly reductive exactly when its identity component is reductive), Layer 6A
  (characteristic-zero Levi complements for general affine groups), Layer 7 (Borel and parabolic
  subgroups, roots, Weyl group and Bruhat decomposition) and Layer 7b (algebraic parabolics and Levi
  intersections), all over a field of characteristic zero. Layer 3 is consumed in §2.1, for the
  normalizer as a group scheme and the exactness of `1 → B → G → Aut_(E₀)(E) → 1`; Layers 3A and 6 in
  §2.3, for the geometric finiteness inside a linear class; the layers together are consumed in
  Layers 2, 3, 4 and 5. Connected root theory is used only on identity
  components; complete reducibility for disconnected groups is imported from LanglandsParameterStacks
  §§2.3–2.4, and the other disconnected-group statements are targets here.

### From TauCetiRoadmap.ReductiveGroupsPartII

- §RG2.0.2 (analytic charts in characteristic zero): for a smooth affine finite-type group `G` over a
  nondiscrete locally compact field `K` of characteristic zero, `G(K)` is an analytic manifold of
  dimension `dim G` whose tangent space at the identity is the Lie algebra; used only to see that an open
  subgroup of `SO(E)(ℚ_ℓ)` has full Lie algebra and is Zariski-dense in `SO(E)`. Consumed in §9.2.

### From TauCetiRoadmap.ArithmeticGaloisRepresentations and TauCetiRoadmap.LanglandsParameterStacks

- ArithmeticGaloisRepresentations §1.11, *Complete reducibility and closed tuples*: for a connected
  reductive group over an algebraically closed field, G-complete reducibility of a closed subgroup
  (every parabolic containing it has a Levi containing it), applied to a homomorphism through the
  Zariski closure of its image and over a general field after extension to an algebraic closure;
  conjugacy invariance; equivalence with semisimplicity for `GL(V)`; the closed-tuple criterion; and
  Levi semisimplification from a minimal parabolic, independent of the choices up to conjugacy and a
  cocharacter limit in the unique closed orbit. Consumed in §2.3 through LanglandsParameterStacks.
- LanglandsParameterStacks §2.3: for a group `G` whose identity component is reductive and whose
  component group is finite étale, the R-parabolics `P_λ = {g : lim_(t→0) λ(t) g λ(t)⁻¹ exists}` and
  R-Levis `L_λ = Z_G(λ)` of the cocharacters `λ` of `G°`, and G-complete reducibility tested against all
  of them, whether or not they surject onto the component group. §2.4: over an algebraically closed
  field, the closed-tuple criterion for such `G` under `G°`-conjugation, Levi semisimplification
  from a minimal containing R-parabolic, G-completely reducible and unique up to `G°(k̄)`-conjugacy,
  and the equality of dimension and component count of all minimal containing R-parabolics. In
  characteristic zero every finite component group is étale, so these apply to every group of
  Conventions with reductive identity component. Consumed in §§2.3 and 2.11, and through §2.3 in
  §§2.5, 2.9–2.10, 4.5, 5.2, 5.4–5.5, 5.7–5.8, 6.1, 7.2 and 7.5.
- What LanglandsParameterStacks must provide (gap:complete-reducibility-reductive-criterion): for an algebraic group `G` over a field of characteristic zero whose identity component is reductive, a closed subgroup `H ⊂ G` is G-completely reducible, all R-parabolics of §2.3 being tested, exactly when its identity component `H°` is reductive (Serre for connected `G`; Bate–Martin–Röhrle for reductive identity component; LS, Lemma 5.37, p. 56, LS lines 2574–2577).

### From TauCetiRoadmap.RestrictedPowerSeries and TauCetiRoadmap.ComplexKahlerGeometry

- RestrictedPowerSeries §2.1 (evaluation and substitution of restricted series) and §5.2
  (Noetherianity, factoriality and dimension of `K⟨T₁, …, T_m⟩` over a complete nonarchimedean
  field); quotients and localizations of Tate algebras are then Noetherian. Consumed in §3.4.
- ComplexKahlerGeometry K3 §3.4 (local algebra, the Nullstellensatz, coherence and singular loci):
  Noetherianity of the convergent power-series ring and Rückert's Nullstellensatz `I(V(𝔞)) = √𝔞` for
  every ideal of `ℂ{z₁, …, z_m}`, in the form `ruckert_nullstellensatz`: a germ vanishing near the
  point on the common zero set of finitely many germs `f₁, …, f_k` has a power in `(f₁, …, f_k)`; and the
  locally finite decomposition of a reduced analytic subset into irreducible components, so that a small
  neighbourhood of a point meets only finitely many components, all passing through it. Consumed in
  §3.4, where the germs are the period equations and the vanishing germ is the product of algebraic
  functions vanishing on the finitely many components through the point; for `𝔞 = (z²)` it gives
  `z² ∈ 𝔞` although `z ∉ 𝔞`.

### From TauCetiRoadmap.ComplexComparisonPartII

- §C5.2 (families, Ehresmann and the Gauss–Manin connection), §C5.3 (geometric Hodge theory:
  Hodge decomposition and Hodge numbers of smooth projective varieties), §C5.6 (regular singular
  connections and Deligne's Riemann–Hilbert equivalence) and §C6.6 (integral and rational Artin
  comparison between étale and Betti cohomology). Consumed in Layer 0, §8.6 and §9.2.
- What ComplexComparisonPartII must provide (gap:griffiths-residue-hodge-filtration): for a smooth hypersurface `X = {F = 0}` of degree `d` in `ℙ^(m+1)_ℂ`, `m ≥ 1`, and `0 ≤ q ≤ m`, the Poincaré residue of the forms `P·Ω₀/F^(q+1)`, with `Ω₀ = Σ_i (−1)^i X_i dX₀ ∧ ⋯ ∧ dX_i^ ∧ ⋯ ∧ dX_(m+1)` (the factor `dX_i` omitted) and `P` homogeneous of degree `(q + 1)d − m − 2`, induces an isomorphism from the degree-`((q + 1)d − m − 2)` piece of the Jacobian ring `ℂ[X₀, …, X_(m+1)]/(∂F/∂X₀, …, ∂F/∂X_(m+1))` onto `gr_F^(m−q) H^m(X, ℂ)_prim` (Griffiths; Batyrev–Cox, Theorem 10.13, PDF p. 34, BC line 1344, in the toric generality). Consumed in §8.6 with `m = n − 1`. For the quartic surface (`m = 2`, `d = 4`) the degrees `0, 4, 8` give the pieces `gr_F², gr_F¹, gr_F⁰` of dimensions `1, 19, 1`.

### From TauCetiRoadmap.ShimuraData

- §3.1 (variations of Hodge structure), §3.2 (morphisms of variations, with kernels and images as
  subvariations whose Hodge ranks are locally constant), §3.3 (polarized rational variations), §3.4
  (polarized integral variations), §3.5 (flat-bundle local comparison: local flat frames turn a
  variation into a holomorphic flag map), §3.6 (Griffiths transversality as a tangent condition on
  that flag map), §3.7 (the parabolic of a Hodge filtration), §1.2 (Mumford–Tate groups), §1.3 (the
  Mumford–Tate group of a rational pure Hodge structure is connected) and §1.4 (that of a polarizable
  one is reductive). §3.2 is consumed in §0.3 and §§1.3–1.4 in §3.1; all of them are consumed in
  Layers 0 and 3.
- What ShimuraData must provide (gap:andre-monodromy-normality): for a polarized integral variation of Hodge structure on a connected smooth complex algebraic variety, the identity component of the Zariski closure of its monodromy group is a normal subgroup of the derived group of its generic Mumford–Tate group (Deligne–André).

### From TauCetiRoadmap.AbelianSchemesAndArithmeticModuliPartII

- Layer B2 §B2.6 (semirational Pila–Wilkie block counting) and Layer B3 (definable uniformization
  and the Ax–Schanuel theorem for Kuga mixed Shimura varieties) are the o-minimal machinery on
  which the Ax–Schanuel request below rests.
- What AbelianSchemesAndArithmeticModuliPartII must provide (gap:period-map-ax-schanuel): the Ax–Schanuel theorem for pure polarized integral variations of Hodge structure (Bakker–Tsimerman) in the monodromy-orbit form: for such a variation on a smooth irreducible complex algebraic variety `X`, with `D_mon` the orbit, in the flag variety of a reference fibre, of the identity component of the Zariski closure of monodromy through a Hodge filtration, every irreducible analytic component `U` of the intersection of an algebraic subvariety `W ⊂ X × D_mon` with the graph of a local lift of the period map satisfies `codim_(X×D_mon) U ≥ codim_(X×D_mon) W + codim_(X×D_mon)(graph)` unless the projection of `U` to `X` lies in a proper weakly special subvariety of `X`; all codimensions are taken in `X × D_mon`, not in the product with a larger compact dual.

### From TauCetiRoadmap.MappingClassGroupsAndCanonicalRepresentations

- §5.4 (the limit theorem and the theorem of the fixed part): for a polarizable complex variation of pure
  Hodge structure on a punctured disc, the Hodge bundles extend to subbundles of the canonical extension
  and the limit is a mixed Hodge structure with the monodromy weight filtration, with no
  quasi-unipotence assumed; and for an admissible graded-polarizable real variation `W` on a smooth
  quasi-projective complex variety `X`, `H⁰(X, W)` carries a real mixed Hodge structure for which
  `H⁰(X, W) ⊗ ℝ → W` is a morphism of variations. A polarizable pure real variation is admissible: for a
  one-step weight filtration the two conditions of admissibility are the extension of the Hodge bundles
  and the existence of the monodromy weight filtration given by the limit theorem along each disc.
  Applied to the real variation of a polarized integral variation `V`: the inclusion of the flat
  sections into each fibre is an injective morphism into a pure Hodge structure, hence strict, so the
  flat sections form a real sub-Hodge structure of each fibre, of the same weight; they are defined over
  `ℚ`, so they form a rational sub-Hodge structure, the same in every fibre after parallel transport, and
  a polarized integral variation with trivial monodromy is constant. On a smooth connected variety that
  is not quasi-projective this is applied on a dense affine open subset, which has the same flat
  sections because its fundamental group surjects onto that of the variety. Consumed in §3.1.

### From TauCetiRoadmap.MotivesAndAlgebraicCycles

- §§6.1–6.3: neutral fibre data over a field, reconstruction of the neutral group `G_ω = Aut^⊗(ω)`
  with `C ≃ Rep_fd(G_ω)`, and finite type exactly when one object tensor-generates. Consumed in
  §§0.3, 0.6, 2.4 and 7.1.
- §6.8: for any neutral category and exact faithful tensor fibre `η` with values in finite
  projective `R`-modules, `Isom^⊗(ω_R, η)` is an affine faithfully flat right `G_ω,R`-torsor,
  finitely presented when `G_ω` is of finite type, and `Aut^⊗(η)` is its inner twist. Consumed in
  §§0.6, 2.4, 2.6, 3.1 and 7.1. A finitely presented faithfully flat torsor over a field is a
  nonempty scheme of finite type and so has a point over an algebraic closure.

### From TauCetiRoadmap.PELModuli

- §M0.9 (1) (`smoothAffineTorsor_galoisH1` and its inverse `galoisH1_equiv_torsorClasses`): for a
  smooth affine group `G` of finite type over a field `k`, connected or not, the pointed bijection
  between the torsor classes of SchemeAndStackFoundations §§1.15 and 2.3 and continuous cocycles
  `Gal(k^sep/k) → G(k^sep)` modulo `c_σ ~ g⁻¹c_σ σ(g)`, natural in field extensions and compatible with
  pushforward along homomorphisms. Consumed in §2.11, where the class of a subgroup `gMg⁻¹` defined
  over `F` is the cocycle `σ ↦ g⁻¹σ(g)`; for `G = μ₂` over `ℚ₃` it gives the four classes of
  `ℚ₃^×/ℚ₃^(×2)`.

### From TauCetiRoadmap.PadicHodgeTheory

- §§3.3–3.6: Fontaine's functors, admissibility, the crystalline and semistable classification and
  group-valued filtered data; `D_cris` and `D_dR` are exact faithful tensor functors on crystalline
  representations. Consumed in §§0.3, 1.2, 2.6, 7.1 and 7.5.
- §4.4: the Sen operator on `C ⊗ V` of a finite-dimensional continuous `ℚ_p`-representation `V` of
  `G_K`, whose eigenvalues are the generalized Hodge–Tate weights, with its tensor and dual formulas.
  Consumed in §7.2, together with gap:hodge-tate-image-cocharacter.
- §5.5: the finite-type specialization of the tensor-isomorphism torsor, and the local torsor
  theorem: for a finite extension `F/ℚ_p` and a connected reductive group `G` over `F`, a pointed
  bijection `H¹(F, G) ≃ (π₁(G)_(Γ_F))_tors`, natural in `G` (Kottwitz), so that `H¹(F, G)` is finite.
  The torsor is consumed in §§2.6 and 7.1 and the local torsor theorem in §2.11.
- §6.1: the rational Fontaine–Laffaille comparison with its signs. Consumed in §7.3.
- §7.3: for a proper smooth morphism `f` of smooth rigid spaces and a de Rham local system `L` whose
  higher direct images `Rⁱf_*L` are lisse in every degree used, including every degree entering a
  pairing, `Rⁱf_*L` is de Rham, with associated bundle the relative de Rham cohomology, its Hodge
  graded pieces and its Gauss–Manin connection; on a residue disk this is the horizontality of the
  fibrewise de Rham comparisons. It is applied only to the constant coefficient `L = ℤ_p` (de Rham,
  with trivial filtration) on the analytification of a smooth projective family of `K_v`-varieties,
  where lisseness holds in every degree: `Rⁱf_*(ℤ/pᵐ)` is lisse on the algebraic base because `p` is
  invertible there (EtaleCohomologyFoundations §F.3), and its analytification is the analytic higher
  direct image (ClassicalAdicEtaleCohomology §8.2). For a constant family `Y₀ × X → X` this gives the
  constant local system `Hⁱ(Y₀)`, zero Gauss–Manin connection and identity transport. Consumed in
  §§0.1, 0.5 and 0.7 through gap:relative-crystalline-comparison.
- §§8.1–8.2: for proper smooth `X` with good reduction at `p`, `D_cris(H^i_et(X_C, ℚ_p))` is
  crystalline cohomology of the special fibre with its Frobenius and, over `K`, de Rham cohomology
  with its Hodge filtration; the comparisons commute with pullback, cup product and Tate twists,
  and a cohomological projector restricts them when it is given geometrically on both sides.
  Consumed in §§0.1, 0.5, 0.7, 1.2 and 7.5.
- What PadicHodgeTheory must provide (gap:relative-crystalline-comparison): for a smooth projective morphism `f : 𝒴 → 𝒳` of smooth `W(k)`-schemes with `k` finite and `p` unramified, the fibrewise crystalline comparisons of §8.1 at the points of a residue disk of `𝒳`, which are horizontal for the Gauss–Manin connection on `R^i f_* Ω^•` by the proper smooth pushforward of de Rham local systems of §7.3 applied to the constant coefficient `ℤ_p`, whose higher direct images are lisse, are compatible with the Frobenius of the convergent F-isocrystal `R^i f_crys,*` of CrystallineCohomology §CR.7.3, so that `R^i f_*ℚ_p` and that filtered F-isocrystal are associated in the sense of Faltings.
- What PadicHodgeTheory must provide (gap:hodge-tate-image-cocharacter): for a Hodge–Tate representation `ρ : G_K → GL(V)` of a finite extension `K/ℚ_p` on a finite-dimensional `ℚ_p`-vector space, comparing the graded Hodge–Tate fibre functor with the forgetful fibre functor extended to `C_p`, on the tensor category generated by `V`, gives a cocharacter of the Zariski closure of `ρ(G_K)` over `C_p` that acts by `t^i` on the `C_p(i)`-isotypic part of `V ⊗ C_p`, so that its weights on `V ⊗ C_p` are the Hodge–Tate weights of `V` with their multiplicities (Serre; Sen; the step used in the proof of LS, Lemma 3.14, p. 26, LS lines 1191–1200).

### From TauCetiRoadmap.CrystallineCohomology

- §CR.7.3: relative crystalline cohomology of a proper smooth morphism, its base change and its
  Gauss–Manin connection. Consumed in §§0.5 and 0.7.

### From TauCetiRoadmap.EtaleCohomologyFoundations and ClassicalAdicEtaleCohomology

- EtaleCohomologyFoundations §F.3 (`VanishingCycles.lisseDirectImageTransport`): for a smooth proper
  morphism and finite lisse coefficients whose annihilator is invertible on the base, the higher direct
  images are lisse, with the geometric fibre stalk formula. Consumed in §§0.1, 0.5 and 0.7, for the
  coefficients `ℤ/pᵐ` on smooth projective families over a base on which `p` is invertible.
- ClassicalAdicEtaleCohomology §8.2 (proper algebraic comparison): for a proper morphism of schemes
  locally of finite type over a scheme and its analytification, and torsion
  coefficients, the base-change map from the analytified algebraic higher direct images to the analytic
  higher direct images is an isomorphism. Consumed in §§0.1, 0.5 and 0.7, to carry lisseness from the
  algebraic family to its rigid analytification on a residue disk.

### From TauCetiRoadmap.DeligneWeightsAndPurity, WeilConjectures and PadicDifferentialEquationsAndRigidCohomology

- DeligneWeightsAndPurity §0.1 (Weil `q`-numbers of integer weight), §0.2 (products, inverses and
  integrality of Weil numbers), §0.7 (eigenvalue weights of an endomorphism), §0.9 (purity under
  subobjects, quotients and extensions), §0.10 (`det(1 − tF)` and traces of powers), §0.16
  (eigenvalues under a Frobenius-equivariant perfect pairing), §4.3 (the Weil theorem for smooth
  projective varieties), §4.4 (integral degree factors from distinct weights) and §9.12 (invariant
  and vanishing cohomology of a hyperplane section are orthogonal complements). Consumed in Layers
  0, 1, 5, 7 and 9; §9.12 in §9.1.
- DeligneWeightsAndPurity §2.2: for a nondegenerate alternating form on a finite-dimensional
  `ℚ_ℓ`-vector space `V`, every subgroup of `Sp(V)(ℚ_ℓ)` open for the ℓ-adic topology is Zariski dense
  in `Sp(V)`. Consumed in §9.2.
- WeilConjectures Layer WC.3 (separating integral factors by weight) and Layer WC.5, "Complete
  intersections" (`|#X(k_r) − #ℙ^m(k_r)| ≤ b·q^(m·r/2)` with the primitive middle part the only
  error term). Layer WC.3 is consumed in §0.5 and Layer WC.5 in §7.8.
- PadicDifferentialEquationsAndRigidCohomology §RD.7.7 (Katz–Messing): for smooth projective `X`
  over `𝔽_q` and `ℓ ≠ p`, `det(1 − tφ^f | H^i_crys ⊗ K₀) = det(1 − t·Frob_q | H^i(X_F̄_q, ℚ_ℓ))` in
  `1 + tℤ[t]`. Consumed in §7.3.

### From TauCetiRoadmap.InverseGaloisAndArithmeticFundamentalGroups and EtaleDualityAndPerverseSheaves

- InverseGaloisAndArithmeticFundamentalGroups §IG.0.T4: the constant-sheaf point count
  `#X(𝔽_(q^m)) = Σ_i (−1)^i tr(Frob^m | H^i_c)` for every finite extension. Consumed in §1.9.
- EtaleDualityAndPerverseSheaves §4.3: the cohomology of smooth complete intersections (powers of
  the hyperplane class outside the middle degree, the primitive decomposition in the middle degree,
  Frobenius `q^j` on `H^(2j)`, and families). Consumed in §§7.8 and 9.1.

### From TauCetiRoadmap.LefschetzPencilsAndVanishingCycles

- §2.8 (the Picard–Lefschetz formula for a proper family), §3.4 (existence of Lefschetz pencils),
  §4.4 (the radical quotient of the vanishing subspace and its pairing), §4.5 (cohomology of the
  total space), §5.8 (the Kazhdan–Margulis open-image theorem in the symplectic case) and §5.10
  (in even dimension, with nondegenerate vanishing space, the compact monodromy is open in `O(E)` or
  finite, and finite monodromy is the Weyl group of a positive definite ADE root lattice).
  Consumed in §9.2.

### From TauCetiRoadmap.SchemeAndStackFoundations and AlgebraicModuliForArithmeticGeometry

- SchemeAndStackFoundations §§0.8–0.9 (spreading out over Dedekind bases and Noetherian
  approximation) and §4.14 (`hilbert_quot_schemes`: Hilbert and Quot schemes of a projective
  morphism with a relatively very ample bundle). Consumed in Layers 7, 9 and 10.
- SchemeAndStackFoundations §1.16 (contracted products and twisting: a torsor under the automorphism
  group of `X` contracts to a form of `X`). Consumed in §1.9, for the twisted forms of a fibre of a
  finite multiplication cover defined by a deck element composed with Frobenius.
- SchemeAndStackFoundations §§1.15 and 2.3 (torsors and torsor classes: for a group scheme `G` over a
  base, the pointed set of `G`-torsors on the big fppf site, `NonabelianH1` of the represented sheaf of
  groups, with pushforward along homomorphisms). Consumed in §2.11, for `H¹(F, H)` over a p-adic field.
- AlgebraicModuliForArithmeticGeometry §2.1 (Hilbert families as Quot functors, fixed Hilbert
  polynomial subfunctors) and §9.4 (the characteristic-zero projective birational resolution with
  smooth source preserving the entire regular locus, imported there from
  ResolutionOfSingularitiesCharacteristicZero). §2.1 is consumed in §§9.1 and 10.2, §9.4 in §§7.7
  and 10.4.

### From TauCetiRoadmap.AbelianSchemesAndArithmeticModuli

- §A0.1 (abelian schemes), §A1.2 (rigidity over arbitrary bases: a morphism of abelian schemes is a
  translation followed by a homomorphism), §A1.8 (Weil extension over a connected Dedekind base),
  §A2.4 (ample cohomology, Riemann–Roch and `deg φ_L`), §A2.10 (the Néron–Severi group), §A3.2 (for
  `r ≠ 0` the multiplication `[r]` is finite locally free of rank `r^(2g)`, and `[r]` and `A[r]` are
  finite étale over the locus where `r` is invertible, compatibly with base change), §A3.3
  (quotients by finite locally free subgroups), §A3.6 (theta groups and polarized descent), §A6.7
  (Hom is free of finite rank), §A6.14 (positivity of the Rosati involution) and §§A6.30–A6.32
  (Weil restriction, its geometric splitting along separable extensions and Weil restriction of
  abelian schemes along finite étale maps). Consumed in Layers 1, 2 and 10; §A3.2 in §1.6. §A1.2
  applies only to morphisms between abelian schemes; it is not used for a curve mapping to an abelian
  variety.

### From TauCetiRoadmap.JacobianChallenge

- Layer F (Abel–Jacobi and the universal property): for a smooth proper geometrically connected curve
  `C` over a field `k` with a `k`-point `x₀`, the Abel–Jacobi morphism `a : C → Jac C`, `x ↦ 𝒪(x − x₀)`,
  satisfies `a(x₀) = 0`, and every pointed morphism `(C, x₀) → (A, 0)` to an abelian variety factors
  as `h ∘ a` for a unique homomorphism `h : Jac C → A`. Consumed in §10.10.

### From TauCetiRoadmap.Chebotarev

- Chebotarev Layer 10 (Dirichlet-density Chebotarev): every conjugacy class of a finite Galois group is the
  Frobenius class of a set of primes of positive density. Consumed in §7.3.

### From TauCetiRoadmap.HeightsRationalPointsAndObstructions and FaltingsFinitenessAndIsogenyTheorems

- HeightsRationalPointsAndObstructions §1.6 (`A(K)/mA(K)` finite for `m ≥ 1`) and §1.7 (Mordell–Weil).
  Consumed in §10.8.
- HeightsRationalPointsAndObstructions §5.2 (scheme-theoretic stabilizers): for a closed subscheme `X` of
  an abelian variety `A` over a field `k`, the subgroup functor `T ↦ {a ∈ A(T) : X_T + a = X_T}` on all
  `k`-schemes `T`, nilpotent ones included, represented by a closed subgroup scheme of `A`, with
  membership, translation action and base change; `Stab(A) = A` and `Stab({x}) = 0`. Consumed in §10.1,
  with `X = H` a smooth ample divisor, and through it in §10.7.
- FaltingsFinitenessAndIsogenyTheorems §R28.5.15 (`finite_curves_goodReduction`: finitely many
  isomorphism classes of smooth projective geometrically connected curves of genus `g ≥ 2` over `K`
  with good reduction outside `S`). Consumed in §10.10.

## How to read the build

Layers 0–2 assemble the realizations and coefficients and identify the groups whose filtrations
matter. Layer 3 proves the shared transfer from period codimension to p-adic non-density. Layer 4
treats integral points with semisimple Galois representations and isolates strong balance; Layer 5
handles the associated graded of nonsplit representations, which gives the all-points coefficient
theorem of Layer 6. Layer 7 proves the higher-dimensional Lawrence–Venkatesh theorem through its own
small-centralizer prime argument. Layer 8 is pure combinatorics and Hodge-number asymptotics and can
be built alongside Layers 0–7; Layers 9 and 10 finish the projective and abelian applications. Inside a
layer the subsections are grouped by topic and the `*Needs:*` lines give the order: §2.11 comes before
§§2.3 and 2.9, and §§8.2–8.4 come before §8.1.

## Layer 0: Compatible Hodge–Deligne realizations

This layer assembles the four compatible realizations, their tensor category, geometric systems cut
out by projectors, differential monodromy and the fixed Frobenius module on a residue disk.

### 0.1 Hodge–Deligne systems

Fix a number field `K`, an embedding `K → ℂ`, a smooth geometrically connected `K`-variety `X` with
smooth model `𝒳/O_K[S⁻¹]`, and a rational prime `p` below no place of `S`, unramified in `K`, with a
place `v | p`. Define a **Hodge–Deligne system** on `𝒳` as a tuple consisting of a finite-rank
ℚ-local system `V_B` on `X(ℂ)`, a continuous ℚ_p-local system `V_et` on `𝒳[1/p]`, a finite locally
free bundle `V_dR` on `X` with an integrable connection `∇` and a finite decreasing filtration `F`,
and a filtered convergent F-isocrystal `V_cris` on the `v`-adic tube, together with Betti–étale,
Betti–de Rham and crystalline–de Rham comparison isomorphisms and an associated-sheaf comparison
between `V_et` and `V_cris`. The comparisons preserve tensor products, the connection, the
filtrations and a finite increasing weight filtration `W`. Require `∇` to have regular singularities
at infinity, Griffiths transversality `∇F^a ⊆ F^(a−1) ⊗ Ω¹`, and on each `gr^W_w` fibrewise purity of
Hodge structures of weight `w` and of Frobenius eigenvalues of Weil weight `w`. The Frobenius
eigenvalues are Weil numbers in ℚ̄ but need not be algebraic integers; a polarization and a ℤ-lattice
are further structure (§0.2) (LS, Definition 5.2, pp. 40–42; LS line 1832).

The construction uses the supplied local systems, Deligne's regular singular connections and filtered
F-isocrystals; morphisms and tensor products are componentwise and every comparison diagram is
required to commute, including the associated-sheaf comparison.

API:

- A Hodge–Deligne system is built from its four realizations and compatible comparison data, and each
  realization is recovered with its connection, Frobenius structure and finite filtrations.
- Every comparison isomorphism commutes with pullback along a morphism of smooth models and with the
  tensor product and dual of the supplied realization categories.
- All four realizations have the same rank, and the weight filtrations correspond under every
  comparison.

**Checks.**

- The rational constant unit has rank one, Hodge type `(0,0)` and weight `0` in every realization.
- The dual Tate system ℚ(1) is a system: its crystalline Frobenius eigenvalue `p⁻¹` is not an
  algebraic integer, which the definition permits.
- A filtered connection with `∇F^a ⊄ F^(a−1) ⊗ Ω¹` is rejected, even when its fibre dimensions match a
  variation of Hodge structure.
- A tuple whose Betti realization has rank two and étale realization rank one is rejected: the
  comparison cannot be an isomorphism.

*Needs:* ShimuraData §§3.1, 3.3; ComplexComparisonPartII §C5.6; PadicHodgeTheory §§7.3, 8.1–8.2 with
gap:relative-crystalline-comparison; EtaleCohomologyFoundations §F.3; ClassicalAdicEtaleCohomology
§8.2; DeligneWeightsAndPurity §§0.1, 0.7.

### 0.2 Integral, polarized and integral-Frobenius systems

For a Hodge–Deligne system define three separate predicates. It is **integral** when its Betti
realization contains a locally constant finite free ℤ-lattice spanning it over ℚ. It is **polarized**
when it is pure of a specified weight `w` and carries a flat rational bilinear form polarizing the
variation of Hodge structure. It has **integral Frobenius** when at every closed point of `𝒳` away from
`S` and `p`, and in the crystalline realization, the Frobenius eigenvalues are algebraic integers
(LS, Definitions 5.3–5.5, p. 42).

The lattice and the pairing are transported through the comparisons; a rational polarization is not
required to be integral on the lattice. Integral Frobenius is stated with the Weil-number predicate of
DeligneWeightsAndPurity §0.1.

API:

- The chosen lattice of an integral system, with its rational comparison, is part of the data.
- A polarized system carries its weight and flat form satisfying the Hodge–Riemann relations on every
  fibre.
- Integral Frobenius passes to invariant subobjects and quotients, because the characteristic
  polynomial factors along an invariant subspace and a monic factor of a polynomial with
  algebraic-integer roots has algebraic-integer roots.

**Checks.**

- The unit is integral, polarized of weight zero and has integral Frobenius.
- The Tate object ℚ(−1) with geometric Frobenius `q` has integral Frobenius, its dual ℚ(1) with
  eigenvalue `q⁻¹` does not: integral Frobenius is not closed under duals, though the category of all
  systems is.
- A rank-one rational local system on `𝔾_m` whose monodromy is multiplication by 2 has no
  monodromy-stable ℤ-lattice, so it is not integral.

*Needs:* §0.1; ShimuraData §3.4; DeligneWeightsAndPurity §§0.2, 0.9.

### 0.3 The tensor category of systems

Over the fixed base of §0.1, define morphisms of Hodge–Deligne systems as compatible maps of all four
realizations preserving `W`, `F`, the connection, Frobenius and all comparisons. Prove that with
componentwise tensor products, duals, direct sums and the unit, Hodge–Deligne systems form a ℚ-linear
neutral Tannakian category, with fibre functor the Betti realization at a chosen complex point. The
proof shows that morphisms are strict for `F` and `W` and that componentwise kernels and cokernels
again satisfy the axioms (LS, Definition 5.11, p. 43, and Lemma 5.12, p. 44).

Strictness of morphisms of mixed Hodge structures and exactness of Fontaine's functors on crystalline
representations give the kernels and cokernels with their comparisons. Strictness is applied fibrewise:
at each complex point a morphism of systems is a morphism `TauCeti.Hodge.MixedHodgeStructure.Hom` of
the fibres, and `TauCeti.Hodge.MixedHodgeStructure.Hom.range_inf_F_eq_map_F`,
`TauCeti.Hodge.MixedHodgeStructure.Hom.range_inf_WQ_eq_map_WQ` and
`TauCeti.Hodge.MixedHodgeStructure.Hom.range_inf_WC_eq_map_WC` give `im f ∩ F^p = f(F^p)` and
`im f ∩ W_k = f(W_k)`; a rational fibre is presented on that carrier by any ℤ-lattice spanning it, and
no flat integral lattice on `X` is assumed. The ranks of the induced filtrations on kernels and
cokernels are then locally constant by the argument of ShimuraData §3.2 on each `gr^W_k`, and the
gluing of these fibrewise statements into systems with their comparisons is the work of this target.
Faithfulness of the fibre functor uses connectedness of `X(ℂ)`; rigidity and `End(1) = ℚ` are checked
before the reconstruction of MotivesAndAlgebraicCycles §6.2 is applied.

API:

- Two morphisms of systems with equal Betti maps are equal.
- The Betti fibre functor at a complex point is exact, faithful, ℚ-linear and symmetric monoidal.
- Each realization of a tensor product or dual is naturally the tensor product or dual of the
  realizations.

**Checks.**

- A scalar `c ∈ ℚ` acts on the unit as `c` under every comparison.
- On a disconnected base, a map that is zero on one component and nonzero on the other shows that the
  fibre at a point of one component is not faithful; connectedness is necessary.
- The kernel of a morphism of pure Hodge systems carries the induced strict Hodge filtration, not an
  arbitrary filtration of the same dimensions.
- Strictness is needed beyond the pure case. For the projection `f : ℚ(0) ⊕ ℚ(−1) → ℚ(−1)`, which is
  not a morphism between pure objects of one weight, `im f ∩ F¹` and `f(F¹)` both have dimension 1, and
  `im f ∩ W₀` and `f(W₀)` both have dimension 0. The identity of `ℚ` viewed as a map `ℚ(0) → ℚ(−1)`
  preserves `F` (the source has `F¹ = 0`) but is not strict, as `im ∩ F¹` has dimension 1 and the image
  of `F¹` dimension 0; it is not a morphism, because it sends `W₀ = ℚ` into `W₀ = 0`.

*Needs:* §0.1; MotivesAndAlgebraicCycles §§6.1–6.2; PadicHodgeTheory §§3.3–3.5; ShimuraData §3.2;
`TauCeti.Hodge.MixedHodgeStructure.Hom.range_inf_F_eq_map_F`,
`TauCeti.Hodge.MixedHodgeStructure.Hom.range_inf_WQ_eq_map_WQ`,
`TauCeti.Hodge.MixedHodgeStructure.Hom.range_inf_WC_eq_map_WC`.

### 0.4 Constant arithmetic systems

A Hodge–Deligne system on `𝒳` is **constant** when it is the pullback of a system on
`Spec O_K[S⁻¹]`. For a finite-dimensional ℚ-algebra `E` the **trivial coefficient system** `O_E` has
constant Betti realization `E`, trivial Galois action on `E ⊗ ℚ_p`, trivial connection, Hodge
filtration concentrated in degree zero and Frobenius `1_E ⊗ σ_v`. A constant system may have
nontrivial arithmetic Galois action; constancy means trivial geometric variation (LS, Example 5.8
and Remark 5.9, pp. 42–43; Definition 5.13, p. 44).

API:

- Pullback along `𝒳 → Spec O_K[S⁻¹]` sends systems over the arithmetic point to constant systems.
- `O_E` has trivial coefficient Galois action, and `O_ℚ` is the tensor unit.
- Every constant system has trivial geometric monodromy, while its arithmetic representation need not
  be trivial.

**Checks.**

- `O_ℚ` is the tensor unit of §0.3.
- The `H⁰` system of a nonsplit finite étale `K`-algebra is constant on `X` but has a nontrivial
  permutation action of `Gal(K̄/K)`.
- `H¹` of the Legendre family `y² = x(x − 1)(x − λ)` over `ℙ¹ ∖ {0, 1, ∞}` is a nonisotrivial
  polarized integral variation. Its local monodromy at `λ = 0` is a nontrivial unipotent, conjugate to
  `[[1, 2], [0, 1]]`, so it is not constant.

*Needs:* §0.3.

### 0.5 Geometric cohomology systems and projectors

For a smooth projective morphism `f : Y → X` extending to a smooth projective morphism of models,
construct the Hodge–Deligne system `R^k f_* ℚ` from Betti, étale, algebraic de Rham and crystalline
cohomology with their comparison maps. For a finite group `Γ` acting on `Y` over `X` and an idempotent
`e ∈ ℚ[Γ]`, the image of `e` is a direct-summand system; the intersection of its Betti image with an
integral cohomology lattice modulo torsion is a spanning lattice. Pure geometric systems are polarized
and have integral Frobenius (LS, Example 5.10, p. 43; proof of Lemma 5.29, pp. 49–51).

The four cohomology objects are compared with the supplied proper comparisons, including the
connection and the filtration; the relative de Rham comparison of PadicHodgeTheory §7.3 needs the
higher direct images of `ℤ_p` to be lisse, which holds algebraically by EtaleCohomologyFoundations
§F.3 and passes to the rigid analytification by ClassicalAdicEtaleCohomology §8.2. The algebraic
action of `Γ` gives the same projector in every realization; purity and integral Frobenius pass to the
summand and a positive polarization restricts to it. Coefficient pushforward with arbitrary
coefficients (LS Example 5.10 in general) is not used: only constant coefficients on finite covers
occur.

API:

- Degree-`k` cohomology of a smooth projective family is a Hodge–Deligne system with its four
  comparisons, pure of weight `k`, polarized by a relatively ample class, integral and with integral
  Frobenius.
- The image of a rational idempotent of `ℚ[Γ]` is a subsystem in every realization.
- Images of projectors commute with every realization and with scalar extension.

**Checks.**

- For `f = id` and `k = 0` the construction returns the constant unit.
- For a double cover with involution `τ`, the projector `(1 − τ)/2` gives the anti-invariant rational
  summand, although division by 2 does not preserve the original ℤ-lattice; the new lattice is an
  intersection, not the image of the old one.
- The zero projector gives the rank-zero system and the identity projector the original system.

*Needs:* §§0.2–0.3; ComplexComparisonPartII §§C5.2–C5.3; PadicHodgeTheory §§7.3, 8.1–8.2 with
gap:relative-crystalline-comparison; EtaleCohomologyFoundations §F.3; ClassicalAdicEtaleCohomology
§8.2; CrystallineCohomology §CR.7.3; DeligneWeightsAndPurity §§4.3–4.4; WeilConjectures Layer WC.3.

### 0.6 Differential monodromy from a tensor generator

Let `V` be a system on a smooth geometrically connected `X/K` with a `K`-rational point, or after a
stated finite extension of `K` supplying one. Define the **differential monodromy group** `G_mon` as
the group of tensor automorphisms of the fibre functor at that point on the rigid abelian tensor
category generated by `(V_dR, ∇)`. Prove that its base change to ℂ is the Zariski closure of the
geometric monodromy of `V_B`. A change of fibre point transports `G_mon` through the torsor of tensor
isomorphisms between the two fibre functors, so the group is defined up to inner twist (LS,
Definition 5.6 and the following discussion, p. 42).

Neutral reconstruction applies to the tensor category generated by the regular connection; Deligne's
regular singular Riemann–Hilbert equivalence identifies it after base change to ℂ with the category
generated by `V_B`, whose Tannaka group is the Zariski closure of monodromy.

API:

- `G_mon` is an affine group of finite type with a faithful representation on the chosen fibre.
- A tensor isomorphism between fibre functors transports `G_mon` by an inner twist.
- Over ℂ the faithful representation of `G_mon` has image the Zariski closure of the geometric Betti
  monodromy.

**Checks.**

- A constant system has trivial `G_mon`, even when its arithmetic Galois action is nontrivial.
- A rank-two system with Zariski-dense `SL₂` monodromy has `G_mon = SL₂`, not `GL₂`.
- A system with finite nontrivial monodromy keeps the whole finite group, not only its identity
  component.
- If `X(K)` is empty the finite extension supplying the base point is part of the data; no rational
  point is chosen silently.

*Needs:* §0.3; MotivesAndAlgebraicCycles §§6.2–6.3, 6.8; ComplexComparisonPartII §C5.6.

### 0.7 Constant Frobenius data on a residue disk

For a geometric system of §0.5 and a residue disk `Ω` of a smooth point of good reduction, parallel
transport of the convergent F-isocrystal identifies the crystalline fibres at all points of `Ω` with
one finite-dimensional `(V, φ)`, `φ` semilinear for the residue Frobenius; the Hodge filtrations
`F_x`, transported by the Berthelot–Ogus identification and Gauss–Manin transport, vary analytically
and define the **p-adic period map** `Φ_p : Ω → Flag(V)` (LS, Remark 5.7, p. 42; proof of Theorem
8.17, pp. 83–84). This is a statement on one residue tube, not a global trivialization.

API:

- The crystalline fibres over `Ω` are identified, compatibly with Frobenius, with one `(V, φ)`.
- `Φ_p` is given by convergent power series on `Ω`, and at each `x ∈ Ω` the filtered φ-module
  `(V, φ, Φ_p(x))` is `D_cris` of the local Galois representation at `x`.
- Transport between two points of `Ω` commutes with Frobenius and with the coefficient and pairing
  structures of Layer 1.

**Checks.**

- For a constant family `Y = Y₀ × X` the period map is constant.
- For a nonisotrivial family of elliptic curves the pair `(V, φ)` is fixed on `Ω` while the Hodge line
  varies.
- For the Legendre family and `H¹`, the construction restricts to the abelian-by-finite transport of
  MordellLawrenceVenkatesh §2.11.

*Needs:* §§0.1, 0.5; MordellLawrenceVenkatesh §§2.5–2.6, 2.11; CrystallineCohomology §CR.7.3;
PadicHodgeTheory §§7.3, 8.1 with gap:relative-crystalline-comparison; EtaleCohomologyFoundations
§F.3; ClassicalAdicEtaleCohomology §8.2.

### Examples

A constant `H⁰` system of a nonsplit étale algebra has nontrivial Galois permutation action and trivial
geometric monodromy. The anti-invariant projector `(1 − τ)/2` on a double cover shows that the
integral lattice of a summand is an intersection with the rational image, not the image of the old
lattice.

### Dependencies

ShimuraData §§3.1–3.4; ComplexComparisonPartII §§C5.2–C5.3, C5.6; PadicHodgeTheory §§3.3–3.5,
7.3, 8.1–8.2; EtaleCohomologyFoundations §F.3; ClassicalAdicEtaleCohomology §8.2; CrystallineCohomology
§CR.7.3; MotivesAndAlgebraicCycles §§6.1–6.3, 6.8;
DeligneWeightsAndPurity §§0.1–0.2, 0.7, 0.9, 4.3–4.4; WeilConjectures Layer WC.3;
MordellLawrenceVenkatesh §§2.5–2.6, 2.11; Tau Ceti mixed Hodge strictness
(`TauCeti.Hodge.MixedHodgeStructure.Hom.range_inf_F_eq_map_F`,
`TauCeti.Hodge.MixedHodgeStructure.Hom.range_inf_WQ_eq_map_WQ`,
`TauCeti.Hodge.MixedHodgeStructure.Hom.range_inf_WC_eq_map_WC`).

## Layer 1: Arithmetic coefficient systems

This layer builds H⁰-algebras, coefficient modules with classical structures, torsion-character orbit
cohomology with its polarization, and the rational Frobenius polynomials of the orbit systems.

### 1.1 Étale H⁰-algebras

Define an **H⁰-algebra** as a commutative unital algebra object `E` in the category of §0.3, pure of
weight zero, with `F⁰E_dR = E_dR` and `F¹E_dR = 0`. It is **étale** when its Betti ℚ-algebra is finite
étale. In the arithmetic argument `E` is required to be constant in the sense of §0.4; its étale
realization may carry a nontrivial finite Galois permutation action (LS, Definitions 5.14 and 5.16,
p. 45).

API:

- The realization functors preserve the unit and multiplication of an H⁰-algebra.
- Every field-valued realization of an étale H⁰-algebra is finite étale.
- Pullback preserves the algebra structure, the Hodge type and étaleness.

**Checks.**

- `ℚ × ℚ` with its two idempotents is étale.
- `ℚ[ε]/(ε²)` is an H⁰-algebra but not étale.
- The rank-two permutation algebra of a quadratic field is constant on `X` but is not `O_(ℚ×ℚ)`: its
  Galois action swaps the factors.
- The zero algebra (the empty finite étale algebra, with `1 = 0`) is an étale H⁰-algebra with no
  geometric points; ranks of modules over it are not determined, so §§1.5 and 2.1 require `E ≠ 0`.

*Needs:* §§0.3–0.4.

### 1.2 Finite étale coefficient operations

Construct H⁰-algebras from the trivial algebra `O_E`, the group algebra `ℚ[B]` of a finite abelian
group `B`, the convolution dual `O(B)^∨` of a finite étale commutative group scheme `B` (multiplication
dual to the comultiplication of the group law), `R⁰f_*` of a proper smooth family, and pushforward
along a finite étale map of bases. In the finite-monodromy case the crystalline realization is
`D_cris` of the Galois representation. If `K_v/ℚ_p` is unramified of degree `f`, the semilinear
Frobenius `φ` satisfies that `φ^f` equals, under the unramified comparison, the action of geometric
Frobenius in the representation (LS, Examples 5.15 and 5.17–5.21, pp. 45–47).

API:

- Finite étale pushforward carries a coefficient algebra with its descent action.
- On the crystalline fibre over an unramified place of degree `f`, `φ^f` is the action of the residue
  Frobenius.
- The Betti realization of the group-algebra construction is `ℚ[B]` with its basis and multiplication.
- For finite étale commutative `B` the coefficient algebra is `O(B)^∨` with convolution, and for
  constant `B` its rational realization is `ℚ[B]`.

**Checks.**

- For `B` cyclic of order two, `ℚ[B] ≅ ℚ × ℚ`.
- Over an unramified quadratic p-adic field, a rank-two unramified representation whose residue
  Frobenius swaps two factors keeps the swap in `φ²`; a formula forcing `φ² = id` is wrong.
- The pushforward of the unit along a split two-sheeted étale cover has rank two.
- For constant cyclic `B` of order three, `O(B)^∨ ≅ ℚ[C₃] ≅ ℚ × ℚ(ζ₃)`, whereas the pointwise function
  algebra `ℚ³` is a different ℚ-algebra.

*Needs:* §§0.5, 1.1; PadicHodgeTheory §§3.3–3.5, 8.2.

### 1.3 Modules over coefficient algebras

For an H⁰-algebra `E`, define an **E-module system** as a system `V` with a unital associative action
`E ⊗ V → V` compatible with the four realizations; define `E`-linear maps, and the relative tensor
product `V ⊗_E W` as the coequalizer of the two actions on `V ⊗ E ⊗ W`. For finite étale `E` it is
exact in each argument. A pairing valued in an invertible rank-one `E`-module `L` is **E-balanced**
when `B(e·v, w) = B(v, e·w)` (LS, Definition 5.22 and Remark 5.23, p. 47).

API:

- The action of `E` is unital and associative in every realization.
- An `E`-balanced morphism `V ⊗ W → Z` factors uniquely through `V ⊗_E W`.
- The realization of `V ⊗_E W` is the relative tensor product of the realized `E`-modules.

**Checks.**

- For `E = ℚ` the relative tensor product is the ordinary one.
- For `E = ℚ × ℚ`, `(V₁, V₂) ⊗_E (W₁, W₂) = (V₁ ⊗ W₁, V₂ ⊗ W₂)`, with no cross terms.
- For a nontrivial involution `ι` of `E`, the pairing `B(v, w) = v·ι(w)` is not `E`-balanced:
  balanced pairings are distinct from sesquilinear ones.

*Needs:* §§0.3, 1.1.

### 1.4 Equidimensional coefficient modules

For finite étale `E` over a field `E₀`, an `E`-module `V` is **equidimensional of rank `N`** when
`V ⊗_(E,τ) Ē₀` has dimension `N` for every embedding `τ : E → Ē₀`. A system is equidimensional when
each realization is (LS, Definitions 5.24–5.25 and Lemma 5.26, pp. 47–48).

API:

- Each geometric coefficient idempotent cuts out a piece of rank `N`.
- For finite étale `E`, equidimensionality of rank `N` is equivalent to freeness of rank `N` over `E`.
- Finite scalar extension preserves the common rank, and the total `E₀`-dimension is `N·[E : E₀]`.

**Checks.**

- For `E = ℚ × ℚ`, ranks `(2, 2)` give `N = 2`.
- Ranks `(1, 3)` have total dimension four but are not equidimensional; the total dimension alone does
  not decide.
- Over `E ≠ 0` the zero module is equidimensional of rank zero only; positivity of `N` is a separate
  hypothesis.
- Over the zero algebra `E = 0` there are no embeddings `τ`, so `V = 0` is equidimensional of every rank
  `N` (and free of every rank, `0^N = 0`); the rank of an equidimensional module is unique only for
  `E ≠ 0`.

*Needs:* §1.3.

### 1.5 General linear, symplectic and orthogonal structures

Let `E` be a nonzero finite étale coefficient algebra, so that the rank of an equidimensional module is
determined. For an equidimensional `E`-module `V` of rank `N > 0`, a **`GL_N`-structure** is its
`E`-linear structure. A **`GSp_N`-structure** is a perfect alternating `E`-bilinear pairing
`V ⊗_E V → L` with `L` invertible of `E`-rank one, so `N` is even: on each field factor of a realization
of `E` (there is at least one) it is a perfect alternating form on an `N`-dimensional space. A
**`GO_N`-structure** is a perfect symmetric pairing into such an `L`. Isomorphisms include a compatible
similitude of `L`. The orthogonal similitude group is kept whole, with its two components when `N` is
even (LS, Definition 5.27, p. 48).

API:

- A paired structure carries its perfect `E`-bilinear pairing and its value line of `E`-rank one.
- Isomorphisms are `E`-linear isometries up to an isomorphism of value lines.
- After trivializing `V` and `L` the automorphism group is the standard `GL_N`, `GSp_N` or `GO_N` over
  each factor of `E`.

**Checks.**

- A symplectic rank-two module gives `GSp₂ = GL₂` with multiplier the determinant.
- Over `E = ℚ`, rank `N = 1` admits no perfect alternating form (the only alternating form on a line is
  zero), while `N = 2` with Gram matrix `((0, 1), (−1, 0))`, of determinant 1, is a `GSp₂`-structure.
- Over the zero algebra `E = 0`, `V = 0` is vacuously equidimensional of rank 1, `L = E` is invertible,
  and the zero pairing induces the isomorphism `0 → Hom_E(0, E) = 0`, so it is perfect and alternating
  in odd rank; `N > 0` alone does not supply nontriviality, and the hypothesis `E ≠ 0` is what makes the
  parity conclusion true.
- For `E = ℚ × ℚ` the value line of a perfect `E`-valued symmetric form has ℚ-dimension two; a line of
  ℚ-dimension one is the wrong carrier.
- Split `GO_(2r)` has two components; no connectedness follows from its reductive identity component.

*Needs:* §§1.3–1.4.

### 1.6 Finite-order character systems

Let `A` be an abelian scheme over `O_K[S⁻¹]`, `r` invertible on the base, and `χ` a character of
`A[r]` of finite order, defined after a finite étale splitting extension, with values in `ℚ(μ_r)`.
Pulling back the `χ`-summand of `[r]_*ℚ` gives a rank-one `ℚ(μ_r)`-module system `L_χ`. Descent uses
both Galois transport of the character and cyclotomic transport of its values; a primitive character
does not define a rank-one ℚ-system (LS, Lemma 5.28, p. 49).

API:

- The summand attached to `χ` is a module system over `ℚ(μ_r)`.
- Galois transport sends `L_χ` to `L_(gχ)` with the corresponding coefficient automorphism.
- The étale realization of `L_χ` is the origin-normalized rank-one character sheaf of
  SheafConvolutionOnAbelianVarieties §0.2.

**Checks.**

- The trivial character gives the constant rank-one system.
- A character of order three has coefficient field `ℚ(μ₃)` and ℚ-rank two.
- If `r` is not invertible, `[r]` is not finite étale in residue characteristic dividing `r`, and the
  construction fails.
- The order `r` is invertible on the model and need not be prime: for `p = 5`, a character of order 4
  is allowed once 2 is invertible. Since `p` lies below no place of `S`, an `r` invertible on
  `O_K[S⁻¹]` is automatically prime to `p`; a character of order `p` would need the places above `p`
  in `S`, which §0.1 excludes.

*Needs:* §§0.5, 1.2–1.3; SheafConvolutionOnAbelianVarieties §0.2; AbelianSchemesAndArithmeticModuli
§A3.2.

### 1.7 Galois-orbit cohomology systems

Let `A` be an abelian variety of dimension `n` over `K` extending to an abelian scheme `𝒜` over
`O_K[S⁻¹]`, with `O_K[S⁻¹]` finite étale over `ℤ[S′⁻¹]`; let `X` be smooth over ℚ with a smooth model `𝒳`
over `ℤ[S′⁻¹]`, and let `Y ⊂ X_K × A` be a family of hypersurfaces extending to a closed subscheme of
`𝒳_(O_K[S⁻¹]) ×_(O_K[S⁻¹]) 𝒜` that is smooth over `𝒳_(O_K[S⁻¹])`, hence smooth and proper since `𝒜` is
proper (LS, §5.5, p. 48; LS line 2209).
Let `I` be a finite orbit of pairs `(ι, χ)` under `Gal(ℚ̄/ℚ) × Gal(ℚ^cyc/ℚ)`, with `χ` of order prime to
`p`, such that the twisted cohomology vanishes outside degree `n − 1`. Construct a constant finite
étale H⁰-algebra `E_I` on `X` with geometric idempotents indexed by `I` (nonzero, as an orbit is
nonempty), and an `E_I`-module system
`V_I` whose geometric coefficient fibres are `R^(n−1) f_(ι)* g_(ι)^* L_χ`. Prove that `V_I` has `E_I`-rank
`N = n!·d`, `d = [H]^n/n!`, and ℚ-rank `|I|·N`, and that it is integral, polarized pure of weight
`n − 1` and has integral Frobenius (LS, Lemma 5.29 and proof, pp. 49–51; LS line 2261).

Both the algebra and the cohomology are compatible rational idempotent summands of finite étale
multiplication-cover pushforwards; the orbit of idempotents descends together with the cyclotomic
action, the ranks are computed on the splitting cover from SheafConvolutionOnAbelianVarieties §3.1,
and the lattice, polarization and integral Frobenius come from §0.5.

API:

- After a splitting extension `E_I` is the product indexed by `I` and `V_I` splits into the stated
  twisted cohomology fibres.
- `V_I` has `E_I`-rank `N` and ℚ-rank `|I|·N`.
- The same Galois-equivariant idempotent produces every realization and comparison.

**Checks.**

- A singleton orbit of a rational order-two character satisfying the concentration hypothesis gives
  `E_I = ℚ` and total rank `N`.
- Two idempotents with fibre rank `N = 6` give total rank 12.
- An orbit not stable under cyclotomic transport cannot be descended with the arithmetic permutation
  action alone.
- Pushing forward the cyclotomic field along `K/ℚ` can give the wrong rank; the algebra has rank
  `|I|`.

*Needs:* §§0.2, 0.5, 1.4, 1.6; SheafConvolutionOnAbelianVarieties §§3.1, 8.3.

### 1.8 Inversion and the coefficient-linear pairing

For an orbit system whose generic hypersurface is invariant under inversion up to translation,
construct the induced involution `i` and the pairing `(v, w) ↦ ⟨v, i·w⟩`. Prove that it is
`E_I`-balanced, perfect and valued in an invertible `E_I`-module; for `n` even it is alternating and
gives a `GSp_N`-structure, and for `n` odd it is symmetric and gives a `GO_N`-structure. All
translation and coefficient descent data are carried along (LS, Lemma 5.30 and proof, pp. 51–52; LS
line 2366).

Inversion exchanges a character with its inverse, and cup product identifies the `χ` and `χ⁻¹`
fibres; the translated inversion squares to the identity, and the balancing identity, the parity and
Galois descent are checked on the splitting cover. The original cup-product pairing, which couples `χ`
with `χ⁻¹`, is not itself `E_I`-bilinear.

API:

- The twisted cup-product form is the `E_I`-balanced form `B(v, w) = ⟨v, i·w⟩`.
- `B` identifies `V_I` with its `E_I`-linear dual tensored with the value line.
- `B` has symmetry `(−1)^(n−1)`.

**Checks.**

- For `n = 4` the pairing is alternating.
- For `n = 3` it is symmetric.
- For `χ ≠ χ⁻¹` the unmodified cup product joins different character factors and is not of the
  `E_I`-balanced diagonal form.

*Needs:* §§1.5, 1.7; SheafConvolutionOnAbelianVarieties §4.8.

### 1.9 Rational Frobenius polynomials for geometric orbit systems

For the orbit system `V_I` of §1.7, constructed as the image of a rational idempotent `e ∈ ℚ[Γ]` of the
deck group `Γ` of a finite multiplication cover, prove that at every closed point of good reduction the
characteristic polynomial of geometric Frobenius on the étale realization has rational coefficients and
algebraic-integer roots, hence lies in `ℤ[t]`. This geometric assertion is not part of the definition
of a Hodge–Deligne system; it supplies the integrality hypothesis of Faltings's lemma in §2.9 (LS,
construction in Lemma 5.29, pp. 49–51, used in Lemma 5.49, pp. 61–62).

A route: write `e = Σ_γ c_γ γ` with `c_γ ∈ ℚ`. Frobenius `F` of the fibre over a closed point of
residue field `𝔽_q` normalizes `Γ` and fixes `e` (the orbit `I` is Frobenius-stable), but it permutes
the individual deck elements, which need not commute with `F` and need not be defined over `𝔽_q`. For
every `γ ∈ Γ` and `m ≥ 1`, the element `γF^m` of the finite semidirect product of `Γ` with the finite
group through which `F^m` acts satisfies `(γF^m)^k = F^(mk)` for some `k ≥ 1`: if `F^(mr)` centralizes
`Γ`, then `(γF^m)^r = N·F^(mr)` with `N ∈ Γ`, and `k = r·ord(N)`. So `γF^m` is a Galois descent datum
along `𝔽_(q^(mk))/𝔽_(q^m)` and defines a twisted `𝔽_(q^m)`-form of the fibre of the cover
(SchemeAndStackFoundations §1.16; it is quasi-projective, every finite orbit of `Γ` lying in an affine
open), whose Frobenius acts on cohomology as `γF^m`. The point-count trace formula for that form
(InverseGaloisAndArithmeticFundamentalGroups §IG.0.T4) makes `Σ_i (−1)^i tr(γF^m | H^i)` a rational
integer for every `γ`, hence `Σ_i (−1)^i tr(F^m | eH^i) = Σ_γ c_γ Σ_i (−1)^i tr(γF^m | H^i) ∈ ℚ`
(since `eF^m = F^m e` and `F^m γ = (F^m γ F^(−m))F^m`). The concentration hypothesis of §1.7 gives
`eH^i = 0` for `i ≠ n − 1`, so `tr(F^m | V_I) ∈ ℚ` for every `m ≥ 1`; without concentration the degrees
are separated by weight (DeligneWeightsAndPurity §4.4). Newton's identities give rational coefficients,
and integrality of the eigenvalues gives integer coefficients. No torsion point is required to be
rational over the residue field.

**Checks.**

- For `Γ = C₃ = ⟨γ⟩` with `FγF⁻¹ = γ⁻¹`, the idempotent `e = (2 − γ − γ²)/3` satisfies `e² = e` and
  `FeF⁻¹ = e`, while neither `γ` nor `γ²` commutes with `F`; the semidirect product is `S₃` and
  `(γF)² = γ·γ⁻¹·F² = F²`, so the twisted form defined by `γF` exists although `γ` is not fixed by
  Frobenius. A route that assumes every deck element in the support of `e` commutes with `F` does not
  apply to this `e`.
- A single character summand of order three has Frobenius traces in `ℚ(μ₃)` that need not be rational;
  the full cyclotomic orbit is required.
- For the trivial character the polynomial is the characteristic polynomial of Frobenius on
  `H^(n−1)` of the hypersurface, in `ℤ[t]` by DeligneWeightsAndPurity §4.4.
- The eigenvalues of `V_I` are algebraic integers but the coefficients of an arbitrary summand are only
  algebraic integers; rationality is the content.

*Needs:* §§0.5, 1.7; InverseGaloisAndArithmeticFundamentalGroups §IG.0.T4; SchemeAndStackFoundations
§1.16; DeligneWeightsAndPurity §§0.2, 0.10, 4.4.

### Examples

An orbit of cardinality `m` with `E_I`-rank `N` has ℚ-rank `m·N`. Keeping only one character loses
the arithmetic and cyclotomic orbit and can lose rationality of the Frobenius coefficients, which is
why the full orbit, its idempotent and its descent are retained.

### Dependencies

Layer 0; PadicHodgeTheory §§3.3–3.5, 8.2; SheafConvolutionOnAbelianVarieties §§0.2, 3.1, 4.8, 8.3;
AbelianSchemesAndArithmeticModuli §A3.2; InverseGaloisAndArithmeticFundamentalGroups §IG.0.T4;
SchemeAndStackFoundations §1.16; DeligneWeightsAndPurity §§0.2, 0.10, 4.4.

## Layer 2: Semilinear groups and filtered tensor objects

This layer specializes algebraic-group theory to coefficient normalizers, semisimplification and
crystalline inner forms, defines adjoint profiles, top-weight sums and uniformity, and proves the
finiteness statements for global types, semisimplification geometries and local torsors.

### 2.1 Semilinear coefficient normalizers

Let `E/E₀` be nonzero finite étale in characteristic zero, `V` free over `E` of rank `N > 0`, and
`H = GL_N`, `GSp_N` or `GO_N` in its standard representation (with a perfect `E`-valued form after
trivializing the value line in the paired cases). Put `B = Res_(E/E₀) H` and define the **semilinear coefficient
normalizer** `G = N_(GL_(E₀)(V))(B)`. Prove that `G` is the group of invertible `E`-semilinear maps,
preserving the form up to a semilinear similitude in the paired cases, and that
`1 → B → G → Aut_(E₀)(E) → 1` is exact as a sequence of group schemes, with fppf-local lifts of
coefficient automorphisms. `B` is not the identity component when `H = GO_(2r)` (LS, Definition 5.31 and
Lemma 5.32, pp. 53–54).

After splitting `E`, the scalar algebra is the centralizer of the standard action of `B`, so a
normalizing map permutes the coefficient factors; the normalizer of the classical form on each factor
is the similitude group.

API:

- An element of `G` induces a unique coefficient automorphism `σ`.
- Membership in `G` is equivalent to invertible σ-semilinearity together with the similitude identity
  for the form in the paired cases.
- The kernel of `G → Aut_(E₀)(E)` is the coefficient-linear group `B`.

**Checks.**

- For `E = E₀`, `G = H`.
- For `E = E₀ × E₀` the factor swap lies in `G` but not in `B`.
- For split `GO₄`, `B` is disconnected, so `G°` is not `B`.
- Exactness is a statement about group functors; the sequence of rational points need not be
  surjective on the right.

*Needs:* §1.5; AbelianSchemesAndArithmeticModuli §§A6.30–A6.31; ReductiveGroups Layer 3.

### 2.2 Semilinear Frobenius centralizer bound

In the setting of §2.1, if `σ ∈ Aut_(E₀)(E)` has fixed algebra `E^σ = E₀` and `φ ∈ G` is σ-semilinear,
prove `dim Z_G(φ) ≤ dim H`. More generally, on each σ-cycle of geometric coefficient factors the
projection of `Z_B(φ)` to any one factor is injective, so the bound is one factor dimension per cycle
(LS, Lemma 5.33 and proof, pp. 53–54).

After splitting `E`, fixed algebra `E₀` means one permutation cycle; the commuting equations propagate
each component around the cycle from one component, and the remaining equation constrains that
component. `Z_G(φ)` and `Z_B(φ)` differ by a finite component quotient.

**Checks.**

- For `σ = id` on a split algebra with `d` factors the fixed-algebra hypothesis fails, and
  `dim Z_G(id) = d·dim H`, so no bound independent of `d` holds.
- For `E = E₀` and `φ` regular semisimple in `GL_N`, `dim Z = N ≤ N² = dim H`.
- For `E = E₀ × E₀`, `φ = (a, b)∘swap`, the centralizer projects isomorphically to the centralizer of
  `ab` in one factor.

*Needs:* §2.1; MordellLawrenceVenkatesh §§0.3–0.4.

### 2.3 Semisimplification in groups with reductive identity component

Let `G` be an algebraic group over a field `k` of characteristic zero with reductive identity
component. A **Richardson parabolic** of `G` is an R-parabolic `P_λ = {g : lim_(t→0) λ(t) g λ(t)⁻¹ exists}`
of LanglandsParameterStacks §2.3, for a cocharacter `λ` of `G°`, with R-Levi `L_λ = Z_G(λ)`,
unipotent radical `U_λ` and limit projection `c_λ : P_λ → L_λ`; it is **defined over `k`** when `λ`
is. G-complete reducibility (every Richardson parabolic containing the subgroup has an R-Levi
containing it, all R-parabolics tested) and, over `k̄`, the **Levi semisimplification** (the image
under `c_λ` for a minimal Richardson parabolic containing the subgroup, G-completely reducible and
unique up to `G°(k̄)`-conjugacy) are LanglandsParameterStacks §§2.3–2.4, extending
ArithmeticGaloisRepresentations §1.11, *Complete reducibility and closed tuples*; a subgroup or
homomorphism is tested through the Zariski closure of its image, and over `k` after extension to
`k̄`.

Prove the rational form. For a subgroup `Γ ⊂ G(k)`, let `P_λ` be a Richardson parabolic defined
over `k` and minimal among those defined over `k` that contain `Γ`. Then `c_λ(Γ) ⊂ L_λ(k)` is a
`k`-rational subgroup whose Zariski closure is G-completely reducible over `k̄`, it is
`G°(k̄)`-conjugate to the Levi semisimplification of `Γ`, and two choices of `λ` give
`G°(k̄)`-conjugate images. For `Γ` the image of a representation `ρ` into `G(k)`, the homomorphism
`ρ^ss = c_λ ∘ ρ` is its **G-semisimplification** (LV, §2.3 and Lemmas 2.4–2.5, pp. 905–906; LS,
Definitions 5.34–5.36 and Lemma 5.37, pp. 55–56). For `k` a finite extension of ℚ_p, the closed
`k`-subgroups inside one `G(k̄)`-conjugacy class form finitely many `G(k)`-classes (§2.11 with the
normalizer), and the homomorphisms of a profinite group into `G(k)` that are `G(k̄)`-conjugate to a
given `ρ^ss` form finitely many `G(k)`-classes (§2.11 with the centralizer of the image).

A route: if `c_λ(Γ)` lay in a proper Richardson parabolic of `L_λ` defined over `k`, its preimage
under `c_λ` would be a smaller Richardson parabolic of `G` defined over `k` containing `Γ`; so
`c_λ(Γ)` is irreducible in `L_λ` over `k`, hence completely reducible in `L_λ` and in `G` over `k`,
and over a field of characteristic zero complete reducibility over `k` and over `k̄` agree (the
passage recorded in LV, footnote 1, p. 905). The image is a cocharacter limit of `Γ`, so the
closed-orbit uniqueness of LanglandsParameterStacks §2.4 places it in the class of the Levi
semisimplification. The dynamic
parabolic is `TauCeti.Cocharacter.parabolic`; the characteristic-zero Levi complements of
ReductiveGroups Layer 6A are the `U_λ`-conjugates of `L_λ`, so a reductive subgroup of `P_λ` (the
Zariski closure of a semisimple element, a torus) is unipotently conjugate into `L_λ`.

In characteristic zero a closed subgroup `H ⊂ G` is G-completely reducible exactly when its identity
component `H°` is reductive (LS, Lemma 5.37, p. 56, LS lines 2574–2577;
gap:complete-reducibility-reductive-criterion); such an `H` is then linearly reductive (ReductiveGroups
Layer 6), so for a faithful representation `G → GL_M` the composite of a G-completely reducible
homomorphism with it is semisimple.

Prove the **geometric finiteness inside a linear class**. Let `k̄` be algebraically closed of
characteristic zero, `G` an affine algebraic group of finite type over `k̄` with a faithful
representation `G → GL_M` (no condition on `G°` is needed here), `Γ` a group and `ρ₀ : Γ → GL_M(k̄)` a
semisimple representation. Then the homomorphisms `ρ : Γ → G(k̄)` whose composite with `G → GL_M` is
`GL_M(k̄)`-conjugate to `ρ₀` form finitely many `G(k̄)`-conjugacy classes (LV, Lemma 2.6 and proof,
printed pp. 906–907, LV lines 536–569, for connected reductive `G`, with the double cosets taken for the
centralizer of the image as in LS, proof of Lemma 5.49, pp. 61–62, LS lines 2832–2837; see Source
corrections).

A route: let `L ⊂ GL_M` be the Zariski closure of `ρ₀(Γ)`. Its unipotent radical is normal in `L`, so
its fixed vectors in a simple summand of `ρ₀` form a nonzero `L`-stable subspace, hence the whole
summand; it acts trivially on the faithful representation `k̄^M` and is trivial, so `L°` is reductive
and `L` is linearly reductive (ReductiveGroups Layer 6). The homomorphisms in question are the
`Ad(g) ∘ ρ₀` for `g` in the transporter `X = {g ∈ GL_M : gLg⁻¹ ⊂ G}`, a closed subvariety of `GL_M` on
which `G × Z` acts by `(h, z)·g = hgz⁻¹`, where `Z = Z_(GL_M)(L)`; as `ρ₀(Γ)` is dense in `L`,
`Ad(g) ∘ ρ₀` and `Ad(g′) ∘ ρ₀` are `G(k̄)`-conjugate exactly when `g′ ∈ G(k̄)·g·Z(k̄)`. A tangent vector
`Y·g` to `X` at `g` satisfies `Y − Ad(glg⁻¹)Y ∈ Lie G` for every `l ∈ L`, so the class of `Y` in
`gl_M / Lie G` is fixed by `gLg⁻¹`; a `gLg⁻¹`-stable complement of `Lie G` in `gl_M`, which exists by
linear reductivity, lifts that class to a fixed vector `Y′`, and `Y = (Y − Y′) + Y′` lies in
`Lie G + Lie Z_(GL_M)(gLg⁻¹)`, the tangent space at `g` of the orbit through `g`. The tangent space of
`X` at each point is therefore that of its orbit, so every orbit is open in `X` (ReductiveGroups
Layer 3A for orbits), and the Noetherian space `X` is a finite union of orbits. Nothing requires `L`
to be connected; passing to `L°` would lose classes (Checks).

API:

- Over `k`, a Richardson parabolic defined over `k` and minimal among those containing a given
  `k`-rational subgroup exists, since closed subgroups satisfy the descending chain condition.
- The Levi images of two minimal Richardson parabolics defined over `k` are `G°(k̄)`-conjugate and
  G-completely reducible over `k̄`.
- Levi projection preserves the `G(k̄)`-conjugacy class of the semisimple part of every element, and
  a `k`-torus in `P_λ` is `U_λ(k)`-conjugate to its projection to `L_λ`.
- The semisimplification of a continuous representation into `G(k)`, for `k` a finite extension of ℚ_p,
  is continuous: the Levi projection `P_λ → L_λ` is a morphism of algebraic groups defined over `k`,
  so `P_λ(k) → L_λ(k)` is continuous.
- A G-completely reducible homomorphism has semisimple composite with every faithful representation
  of `G`.
- One `GL_M(k̄)`-class of semisimple representations of `Γ` meets the homomorphisms into `G(k̄)` in
  finitely many `G(k̄)`-classes, for every closed `G ⊂ GL_M`.

**Checks.**

- Over `ℚ`, the rotation `w = ((0, −1), (1, 0))` of order 4 in `GL₂` has eigenvalues `±i`, so it lies in
  no Borel defined over `ℚ`: the minimal Richardson parabolic over `ℚ` is `GL₂` and `⟨w⟩` is its own
  semisimplification. Over `ℚ̄` the minimal ones are the two Borels of its eigenlines, neither
  defined over `ℚ`, and the Levi of the eigenbasis contains `w` (as `diag(i, −i)`): both give the same
  geometric class, and the minimal parabolic over `k` need not be minimal over `k̄`.
- In `SL₂` over `ℚ`, the cocharacter `λ(t) = diag(t, t⁻¹)` conjugates `U = ((1, 1), (0, 1))` to
  `((1, t²), (0, 1))`, with limit `I`: the semisimplification of `⟨U⟩` is trivial, with the same
  characteristic polynomial `(t − 1)²` (trace `2`), although `⟨U⟩` is not trivial; the semisimple part
  of `U` is `I`, as Levi projection requires.
- In `J = SL₂² ⋊ C₂` over `ℚ` (the swap), the subgroup generated by `(U, D)` and `(1, W)`, with
  `D = diag(2, 1/2)` and `W = ((0, −1), (1, 0))`, lies in `P_λ = B × SL₂` for the `ℚ`-cocharacter
  `λ = (diag(t, t⁻¹), 1)`, which contains no element of the swap component; its image is
  `⟨(1, D), (1, W)⟩`, completely reducible since `D` and `W` share no eigenline. A test restricted to
  Richardson parabolics surjecting onto the component group sees only `J` and would leave the subgroup
  unchanged.
- In the split orthogonal group `O₂ = O(xy)` over `ℚ₃`, the reflections `r_b(x, y) = (b y, b⁻¹ x)` are
  `O₂(ℚ̄₃)`-conjugate to `r_1`, and conjugation by `diag(a, a⁻¹)` and by `r_c` sends `r_b` to `r_(a²b)`
  and `r_(c²/b)`; so the homomorphisms `ℤ/2 → O₂(ℚ₃)` sending the generator to a reflection, each its own
  semisimplification, form four `O₂(ℚ₃)`-classes, one per class of `b` in `ℚ₃^×/ℚ₃^(×2)`, while all
  four are conjugate in `GL₂(ℚ₃)`: finite, but finer than the `GL`-classes.
- For `G = GL(V)` the construction over `k` is the semisimplification of the `k`-representation,
  the graded pieces of a maximal `Γ`-stable flag of `k`-subspaces, in agreement with the `GL(V)`
  comparison of ArithmeticGaloisRepresentations §1.11.
- Geometric finiteness, a count above one: for the block-diagonal `G = GL₂ × GL₂ ⊂ GL₄`, `Γ = ℤ` and
  `ρ₀(1) = diag(1, 2, 3, 4)`, a homomorphism into `G` in the `GL₄`-class of `ρ₀` is fixed up to
  `G(k̄)`-conjugacy by the two eigenvalues it places on the first factor: `binomial(4, 2) = 6` classes.
  `1 ↦ (diag(1, 2), diag(3, 4))` and `1 ↦ (diag(1, 3), diag(2, 4))` are `GL₄`-conjugate and not
  `G(k̄)`-conjugate, so finiteness of `GL`-classes is not finiteness of `G`-classes.
- Semisimplicity of `ρ₀` cannot be dropped: in the upper unitriangular group `U₃ ⊂ GL₃`, every
  `u = ((1, a, c), (0, 1, b), (0, 0, 1))` with `ab ≠ 0` has `(u − 1)² ≠ 0` and so is `GL₃`-conjugate to the
  single Jordan block `J₃`, while `(a, b)` is invariant under `U₃`-conjugation (it is the image in the
  abelianization `U₃/[U₃, U₃] ≅ 𝔾_a²`); the homomorphisms `ℤ → U₃` in the `GL₃`-class of `1 ↦ J₃` form
  infinitely many classes. There the image closure is `𝔾_a`, which is not linearly reductive.
- A disconnected image closure: for `Γ = ℤ/2`, `ρ₀(1) = diag(1, 1, −1, −1)` and `G = GL₂ × GL₂ ⊂ GL₄`,
  the involutions of `G` in that `GL₄`-class are classified by the dimension `0`, `1` or `2` of their
  `−1`-eigenspace on the first factor: three classes. The identity component of the image closure is
  trivial, and its conjugates into `G` form one class, so the count cannot be read off `L°`; the
  double cosets are those of `G` and of the centralizer `Z = GL₂ × GL₂` of the image, three of them.

*Needs:* LanglandsParameterStacks §§2.3–2.4 with gap:complete-reducibility-reductive-criterion;
ArithmeticGaloisRepresentations §1.11, *Complete reducibility and closed tuples*; §2.11;
`TauCeti.Cocharacter.parabolic`; ReductiveGroups Layers 3A, 6, 6A, 7, 7b.

### 2.4 Tensor G-structures

For an affine algebraic group `G/k` and a `k`-linear rigid abelian tensor category `C` with fibre functor
`ω` (the category of §0.3 or a tensor subcategory of it), define a **G-object** of `C` as an exact
faithful `k`-linear symmetric monoidal functor `Rep_fd(G) → C` together
with a tensor isomorphism between its composite with `ω` and the forgetful functor. A change of
trivialization conjugates the induced homomorphism of Tannaka groups (LS, Definition 5.38 and Remark
5.39, p. 56).

API:

- A G-object evaluates on a chosen faithful representation of `G`.
- A tensor automorphism changes the induced map of fibre groups by conjugation.
- For representations of a Hopf algebra the induced map on points is
  `TauCeti.Tannaka.fgPointTensorIsoEquiv`, not a second group of points.

**Checks.**

- For `G = GL₁` a G-object is an invertible object with a chosen trivialization of its fibre.
- A functor sending the unit to a two-dimensional space is not monoidal and is rejected.
- A map preserving the standard vector space of `GSp` but not its alternating tensor is not a
  `GSp`-structure.

*Needs:* §0.3; MotivesAndAlgebraicCycles §§6.2, 6.8; `TauCeti.Tannaka.fgPointTensorIsoEquiv`.

### 2.5 Tensor filtrations and cocharacters

For `G` in characteristic zero with reductive identity component, define a **G-filtration** as an exact
tensor-compatible filtration of the forgetful functor `Rep_fd(G) → Vect`, with its associated graded
tensor structure. A splitting cocharacter `μ` gives `F^aV = ⊕_(j≥a) V_j`. Prove that two cocharacters
define the same filtration exactly when their dynamic parabolics agree and they are conjugate in that
parabolic, and that restriction to `G°` identifies G-filtrations with `G°`-filtrations (LS,
Definitions 5.40–5.41 and Lemma 5.42, pp. 56–58). The dynamic parabolic `P_μ` is the stabilizer of the
filtration of `μ` in every representation; it does not determine the filtration, not even the chain of
subspaces once the indices are forgotten, so the conjugacy condition in the criterion cannot be dropped
(see Source corrections).

API:

- A cocharacter induces a decreasing weight filtration on every representation.
- Two cocharacters give equal filtrations exactly when they have the same parabolic and are conjugate
  in it.
- `P_μ` is the subgroup preserving the filtration of `μ` on every representation; equality of
  parabolics alone gives neither equal filtrations nor equal unindexed chains.
- The associated graded is `F^a/F^(a+1)` as a tensor functor, and restriction to `G°` preserves it.

**Checks.**

- In `GL₂`, weights `(1, 0)` and `(2, 0)` have the same upper triangular parabolic but different indexed
  filtrations.
- For `G = 𝔾_m` acting on `V = ℚe₊ ⊕ ℚe₋` through the characters `t` and `t⁻¹`, the cocharacters
  `μ(t) = t` and `ν(t) = t⁻¹` both have dynamic parabolic `G` (the group is commutative), but
  `F¹_μ V = ℚe₊` and `F¹_ν V = ℚe₋`: the chains `0 ⊂ ℚe₊ ⊂ V` and `0 ⊂ ℚe₋ ⊂ V` differ even with the
  indices forgotten. The criterion separates them, since `μ ≠ ν` are not conjugate in the commutative
  group `G`.
- In `SL₃` the regular cocharacters `diag(t, 1, t⁻¹)` and `diag(t², t, t⁻³)` both have the upper triangular
  Borel as dynamic parabolic; on the adjoint representation the root vectors `E₁₂, E₂₃, E₁₃` have weights
  `1, 1, 2` for the first and `1, 4, 5` for the second, so the second chain contains `span(E₁₃, E₂₃)` and
  the first does not. Semisimplicity of `G` does not make the parabolic determine the unindexed chain.
- The trivial cocharacter gives the filtration concentrated in degree zero.
- In `GL₂² ⋊ C₂` a cocharacter with unequal component weights is not stabilized by the swap.
- Filtered vector spaces form an exact category, not an abelian one.

*Needs:* §§2.3–2.4; `TauCeti.Cocharacter.parabolic`.

### 2.6 Crystalline tensor structures and inner forms

Let `G` be an algebraic group over `ℚ_p` with reductive identity component (as in §2.5) and a faithful
representation `G → GL_N`, and let `ρ : Gal(ℚ̄_p/ℚ_p) → G(ℚ_p)` be continuous and **crystalline**,
meaning that its composite with `G → GL_N` is crystalline; this does not depend on the faithful
representation chosen. Applying `D_cris` as an exact tensor functor gives an inner form `G′` of `G` over
`ℚ_p` and a weakly admissible filtered φ-module with `G′`-structure: a Frobenius in `G′(ℚ_p)` and a
`G′`-filtration. A homomorphism `G₁ → G₂` over `ℚ_p` induces a homomorphism `G₁′ → G₂′`, the twist of
`G₁ → G₂` by the `G₁`-torsor of the representation, compatible with tensors and with the filtered
φ-data. In the coefficient-normalizer case, where `G` is the semilinear coefficient normalizer of §2.1
(with `E₀ = ℚ_p`) of the étale fibre `V_et` over the étale fibre `E_et` of the coefficient algebra, and
the composite of `ρ` with `G → Aut_(ℚ_p)(E_et)` is the Galois action on `E_et`, `G′` is identified with
the semilinear coefficient normalizer of the de Rham fibre `V_dR` over `E_dR` through the comparison
isomorphism; for an arbitrary G-object there is no canonical equality `G′ = G`. The base field is `ℚ_p`
and not a finite extension `K`: over `K` the functor `D_cris` takes values in vector spaces over the
maximal unramified subfield `K₀`, with a Frobenius that is semilinear for the Frobenius of `K₀`, and the
Hodge filtration lives on `K ⊗_(K₀) D_cris`; so for `K ≠ ℚ_p` either the Frobenius is not linear
(`K₀ ≠ ℚ_p`) or the filtration is defined only over a larger field than the Frobenius (`K₀ = ℚ_p ≠ K`)
(LS, Lemma 5.43 and proof, pp. 58–60).

The two fibre functors (forgetful and underlying `D_cris`) are compared through their torsor of tensor
isomorphisms; `G′` is the twist of `G` by this torsor. In the standard coefficient representation the
coefficient action and the pairing recognize the de Rham group.

API:

- The inner form `G′` is the group of tensor automorphisms of the `D_cris` fibre functor.
- Functoriality lands in `G₂′`, not in `G₂` without a chosen trivialization.
- In the coefficient case `G′` is the semilinear normalizer of the de Rham coefficient module.

**Checks.**

- For an unramified character with values in `GL₁`, `G′ = GL₁` canonically.
- For `GL_N` the inner form is `GL(D_cris(V))`, isomorphic to `GL_N` after choosing a basis.
- A crystalline representation with values in `PGL₂` whose tensor-isomorphism torsor is nontrivial has
  `G′` a nonsplit inner form; identifying `G′` with `G` rationally is wrong.
- For the trivial character of `Gal(ℚ̄_p/K)` with `K = ℚ_(p²)` the unramified quadratic extension,
  `D_cris = K` and `φ` is the Frobenius `σ` of `K`, which moves every `a ∈ K ∖ ℚ_p`; so
  `φ(a·1) = σ(a) ≠ a·φ(1)` and `φ` is not a point of `GL₁(K)`, which is why the statement is over
  `ℚ_p`. Over `ℚ_p` the trivial character gives `D_cris = ℚ_p` with `φ = 1 ∈ GL₁(ℚ_p)`. The consumers
  §§5.4 and 5.8 restrict a representation of `G_ℚ` to `Gal(ℚ̄_p/ℚ_p)` and meet the hypothesis.

*Needs:* §§2.1, 2.4–2.5; PadicHodgeTheory §§3.3–3.6, 5.5; MotivesAndAlgebraicCycles §6.8.

### 2.7 Adjoint Hodge profiles and top-weight sums

Given a G-filtration on a characteristic-zero group, define the **adjoint Hodge profile**
`h^a = dim gr^a Lie(G)`, a finitely supported function `ℤ → ℕ` (a `Finsupp`); in the polarized weight-zero
adjoint case `h^a = h^(−a)`. Put `D = Σ_a h^a`, `A = Σ_(a>0) h^a` and `B = Σ_(a>0) a·h^a`. List the `D`
weights with multiplicity in nonincreasing order `w₁ ≥ … ≥ w_D`, and define the **top-weight sum**
`T(x) = Σ_(j≤⌊x⌋) w_j + (x − ⌊x⌋)·w_(⌊x⌋+1)` for real `x ∈ [0, D]`, with `T(D) = Σ_j w_j`. `T` is
continuous and piecewise linear, each weight `a` contributing `h^a` times (LS, Definitions 5.44–5.45,
p. 60; LV, (10.2)–(10.3), pp. 968–969, Lawrence–Venkatesh's `T` on printed p. 969).

API:

- `A` counts the positive weights with multiplicity.
- `B` is the sum of each positive weight times its multiplicity.
- For an integer `0 ≤ m ≤ D`, `T(m)` is the sum of the `m` largest weights.
- Repeating the profile `d` times gives `T_rep(d·x) = d·T(x)`.
- For a symmetric profile `D = h⁰ + 2A`.
- `T` is nondecreasing on `[0, A + h⁰]`, strictly increasing on `[0, A]`, and `T(A) = T(A + h⁰) = B`.

**Checks.**

- For weights `2, 0, −2` (each once), `T(1/2) = 1`, `T(1) = 2` and `T(2) = 2`.
- For the zero profile `D = A = B = 0` and only `T(0)` is defined.
- Summing multiplicities instead of weights would give `T(1) = 1` for weights `2, 0, −2`, which is
  wrong.
- Every argument of `T` in a numerical criterion must lie in `[0, D]`.

*Needs:* §2.5; Mathlib `Finsupp`.

### 2.8 Uniform coefficient filtrations

A filtration of a coefficient-normalizer object is **uniform** when the adjoint Hodge profile on `H` is
the same at every geometric embedding of the coefficient algebra. Prove that if `[E : E₀] = d` the
restriction-of-scalars profile is `d` times the single-factor profile, so `T_Res(d·x) = d·T_H(x)`. The
numerical inequalities of the non-density theorems use `h_H` and `T_H`, never the scaled profile (LS,
Definition 5.46 and Lemma 5.48, pp. 60–61).

API:

- Every coefficient embedding carries the same profile `h_H`.
- `h_Res^a = d·h_H^a` and `T_Res(d·x) = d·T_H(x)`.
- Scalar extension preserves the common single-factor profile.

**Checks.**

- For `E = E₀ × E₀` with two identical `SL₂` adjoint profiles the restriction profile doubles each
  multiplicity.
- Two rank-two coefficient factors with Hodge types `(1, 0)` and `(2, 0)` are equidimensional but not
  uniform.
- For `E = E₀` the scaling factor is one.

*Needs:* §§1.4, 2.1, 2.7.

### 2.9 Finiteness of global coefficient-group types

Fix a number field `K`, a prime `p`, a finite set `T` of finite places of `K` containing the places
above `p`, the coefficient normalizer `G/ℚ_p` of §2.1 with its standard representation
`G → GL_(N[E:ℚ_p])` and coefficient permutation action, a rank and an integer weight `w ≥ 0`. Prove that
the continuous G-completely reducible representations `G_K → G(ℚ_p)` unramified outside `T` whose
Frobenius characteristic polynomials (in the standard representation) at every place `v ∉ T` lie in
`ℤ[t]` with roots of Weil weight `w` relative to `Nv` form finitely many `G(ℚ_p)`-conjugacy classes (LS,
Lemma 5.49 and proof, pp. 61–62; LS line 2813). The case `K = ℚ` is the one consumed in §§4.5, 6.1
and 7.6.

A route: the standard representation of such a `ρ` is semisimple, because a G-completely reducible
image has a Zariski closure with reductive identity component (§2.3); so Faltings's lemma over `K`
(MordellLawrenceVenkatesh §1.2) leaves finitely many isomorphism classes of standard representations.
Each such `GL`-class contains finitely many `G(ℚ̄_p)`-classes of homomorphisms into `G`, by the
geometric finiteness inside a linear class of §2.3 applied with `Γ = G_K`, which allows the Zariski
closure of the image to be disconnected; and each `G(ℚ̄_p)`-class of homomorphisms with values in
`G(ℚ_p)` splits into finitely many `G(ℚ_p)`-classes by §2.11 applied to the centralizer of the image.
The finiteness of `GL`-classes alone does not give finiteness of `G`-classes (Checks), and no
reduction to the identity component is made, which matters because the coefficient-linear subgroup
of a `GO` factor is not connected.

**Checks.**

- For `G = GL_N` the statement is Faltings's lemma, MordellLawrenceVenkatesh §1.2, over the same `K`.
- For `K = ℚ(i)`, `G = GL₁` and weight `0`, every unramified finite-order character has Frobenius
  polynomials `t − ζ` with `ζ` a root of unity, in `ℤ[t]` only when `ζ = ±1`; the trivial character
  (polynomial `t − 1` at every `v ∉ T`) is one class. Restricting the statement to `K = ℚ` would exclude
  this valid instance.
- For `G = GO₂` two representations conjugate in `GL₂` need not be `G(ℚ_p)`-conjugate; finiteness
  still holds by §2.11.
- For `E = ℚ_p × ℚ_p` and `H = GL₂` the coefficient normalizer is `G = GL₂² ⋊ C₂ ⊂ GL₄`. The elements of
  `G(ℚ̄_p)` that are `GL₄`-conjugate to `diag(1, 2, 3, 4)` form three `G(ℚ̄_p)`-classes: in `G°` the class
  is fixed by the two eigenvalues on the first factor, six choices exchanged in pairs by the swap,
  and an element `(a, b)·s` of the other component has square `(ab, ba)`, so its eigenvalues come in
  pairs `x, −x`, which `{1, 2, 3, 4}` does not contain. One `GL`-class of standard representations can
  hold several `G`-classes.
- Dropping integrality of the Frobenius polynomials (keeping only algebraic-integer eigenvalues) leaves
  the hypothesis of Faltings's lemma unverified; §1.9 supplies integrality for orbit systems.

*Needs:* §§2.3, 2.11; MordellLawrenceVenkatesh §1.2.

### 2.10 Finitely many semisimplification geometries

Let `G` be an algebraic group over a characteristic-zero field `E` with reductive identity component and
`H ⊂ G` an `E`-defined G-completely reducible subgroup. Prove that up to the action of `Z_G(H)(E)` only
finitely many `E`-defined pairs `(P, M)` occur with `P` a Richardson parabolic, `M` a Levi of `P` and
`H ⊂ M` (LS, Lemmas 5.50 and 5.52, p. 62).

A route: choose a maximal `E`-split torus of `Z_G(H)`; maximal split tori are conjugate under
`Z_G(H)(E)`, so allowable Levi factors are described by its `E`-cocharacters; the finitely many
root-weight hyperplanes cut the cocharacter space into finitely many faces, each recording one parabolic
and Levi. The finite component action is tracked without identifying the parabolic of `G` with that of
`G°`.

**Checks.**

- For `H = 1` and `G = GL₂` there are infinitely many Borels but two classes of pairs up to `GL₂`: the
  Borel pairs `(B, T)` and the trivial pair `(G, G)` given by the trivial cocharacter.
- For `H` the diagonal torus of `GL_n`, `Z_G(H) = H` acts trivially on the pairs, which correspond to
  ordered set partitions of `{1, …, n}` (block-diagonal Levi and an order of the blocks): 13 pairs for
  `n = 3`.
- The statement is finiteness up to centralizer conjugacy, not finiteness of parabolics.

*Needs:* §2.3; ReductiveGroups Layers 4, 7.

### 2.11 Finiteness of local nonabelian Galois cohomology

For a finite extension `F/ℚ_p` and a linear algebraic group `H` over `F`, prove that the pointed set
`H¹(F, H)` of `H`-torsors is finite (Borel–Serre; Serre, *Galois cohomology*, III §4.3, Theorem 4).
Here `H¹(F, H)` is the set of torsor classes of SchemeAndStackFoundations §§1.15 and 2.3 (Tau Ceti
`CategoryTheory.Sheaf.NonabelianH1` on the fppf site of `Spec F`), identified with continuous Galois
cocycles `Gal(F̄/F) → H(F̄)` modulo coboundaries by PELModuli §M0.9; `H` is smooth because `F` has
characteristic zero, and no connectedness is assumed there.
Consequently, for a linear algebraic group `G` over `F` (Serre, *Galois cohomology*, I §5.4,
Corollary 1 to Proposition 36, applied to `G/N` and `G/Z`):

- **Subgroups.** For a closed `F`-subgroup `M ⊂ G` with normalizer `N = N_G(M)`, the closed
  `F`-subgroups that are `G(F̄)`-conjugate to `M` are the `F`-points of `G/N`, and their
  `G(F)`-conjugacy classes are in bijection with `ker[H¹(F, N) → H¹(F, G)]`, a finite set: for
  `M′ = gMg⁻¹` defined over `F`, the class is that of the cocycle `s ↦ g⁻¹s(g)`, which lies in `N`.
- **Homomorphisms.** For a homomorphism `ρ : Γ → G(F)` from an abstract or profinite group, with
  `Z = Z_G(ρ)` the centralizer of its image (a closed `F`-subgroup, equal to the centralizer of the
  Zariski closure of the image), the homomorphisms `Γ → G(F)` that are `G(F̄)`-conjugate to `ρ` form
  `G(F)`-conjugacy classes in bijection with `ker[H¹(F, Z) → H¹(F, G)]`, a finite set.

The two indexing groups differ: an unmarked subgroup is classified by its normalizer, a marked
homomorphism by its centralizer.

Over every field `F` of characteristic zero, prove also that for a linear algebraic group `P = L ⋉ U`
over `F` with `U` unipotent (for instance a Richardson parabolic with an R-Levi, LanglandsParameterStacks
§2.3), the projection to `L` induces a bijection `H¹(F, P) → H¹(F, L)`; in particular `H¹(F, U) = 1`
(the step of LS, proof of Lemma 8.10, p. 78, LS line 3572).

A route: for a finite group `H` this is finiteness of extensions of bounded degree of a p-adic field;
for connected reductive `H` it is the Kottwitz description of PadicHodgeTheory §5.5; the unipotent
radical has trivial `H¹` in characteristic zero; and the general case follows from the exact sequences
of nonabelian cohomology with twisting. For the bijection, `L ⊂ P` splits the projection, so it is
surjective; the fibre through the class of an `L`-valued cocycle `c` is the image, under twisting, of
`H¹(F, U_c)` for the twist `U_c` of `U` by `c`, again unipotent, with a characteristic central series
whose quotients are forms of vector groups; these are vector groups with trivial `H¹` (additive Hilbert
90), so the fibre is a point.

**Checks.**

- `H¹(ℚ_p, GL_n)` is trivial (Hilbert 90).
- `H¹(ℚ_p, μ₂) = ℚ_p^×/ℚ_p^(×2)` has four elements for `p` odd and eight for `p = 2`.
- `H¹(ℚ_p, O_n)` classifies nondegenerate quadratic forms of dimension `n`; it is finite for every `n`
  and every `p`, including `p = 2`, and for `n ≥ 1` it is not a single point. At `n = 1`, `O₁ = μ₂`
  gives the forms `a x²` with `a ∈ ℚ_p^×/ℚ_p^(×2)`: four classes over `ℚ₃` and eight over `ℚ₂`. At
  `n = 0` the only quadratic space is zero and `O₀ = 1`, so `H¹(ℚ_p, O₀)` is a single point; the
  finiteness theorem keeps this case.
- In `G = GL₂` over `ℚ₃`, the maximal tori geometrically conjugate to the diagonal torus `T` form four
  `GL₂(ℚ₃)`-classes, the split torus and the tori `Res_(L/ℚ₃) 𝔾_m` for `L = ℚ₃(√2)`, `ℚ₃(√3)` and
  `ℚ₃(√6)` (one per quadratic étale `ℚ₃`-algebra, `|ℚ₃^×/ℚ₃^(×2)| = 4`). The normalizer `N = T ⋊ C₂` has
  `ker[H¹(ℚ₃, N) → H¹(ℚ₃, GL₂)] = H¹(ℚ₃, N)` of four elements, whereas the centralizer `T` has
  `H¹(ℚ₃, T) = 1` (Hilbert 90): indexing subgroups by the centralizer would undercount.
- For `P = 𝔾_a ⋊ μ₂` over `ℚ₃`, with `μ₂` acting by sign, `H¹(ℚ₃, P) → H¹(ℚ₃, μ₂) = ℚ₃^×/ℚ₃^(×2)` is a
  bijection of four-element sets: the twist of `𝔾_a` by the character of `ℚ₃(√a)` becomes `𝔾_a` after
  multiplication by `√a` and has trivial `H¹`. For the upper Borel `B = T ⋉ U` of `GL₂`,
  `H¹(ℚ₃, B) = H¹(ℚ₃, T) = 1`.
- Characteristic zero is needed for the bijection: over `𝔽_p` the constant group `ℤ/p` is unipotent with
  trivial Levi quotient, while `H¹(𝔽_p, ℤ/p) = Hom(Ẑ, ℤ/p)` has `p` elements.

*Needs:* PadicHodgeTheory §5.5; PELModuli §M0.9; SchemeAndStackFoundations §§1.15, 2.3;
`CategoryTheory.Sheaf.NonabelianH1`; LanglandsParameterStacks §2.3; ReductiveGroups Layers 5, 6A.

### Examples

For the weight list `(2, 0, −2)`, `T(1/2) = 1`, `T(1) = 2` and `T(2) = 2`. In `GL₂`, cocharacters
`(1, 0)` and `(2, 0)` define the same triangular parabolic and different indexed filtrations, so a
filtration is not determined by its parabolic; on `𝔾_m` the cocharacters `t` and `t⁻¹` share the
parabolic `𝔾_m` and give different chains even with the indices forgotten.

### Dependencies

Layers 0–1; ReductiveGroups Layers 3–7b; LanglandsParameterStacks §§2.3–2.4;
ArithmeticGaloisRepresentations §1.11, *Complete reducibility and closed tuples*;
`TauCeti.Cocharacter.parabolic`;
`TauCeti.Tannaka.fgPointTensorIsoEquiv`; `CategoryTheory.Sheaf.NonabelianH1`; MotivesAndAlgebraicCycles
§§6.2, 6.8; PadicHodgeTheory §§3.3–3.6, 5.5; PELModuli §M0.9; SchemeAndStackFoundations §§1.15, 2.3;
AbelianSchemesAndArithmeticModuli §§A6.30–A6.31; MordellLawrenceVenkatesh §§0.3–0.4, 1.2; Mathlib
`Finsupp`.

## Layer 3: Period orbits and transcendence transfer

This layer places period maps in one orbit of the monodromy group, identifies its parabolic
stabilizer, takes the codimension consequence of Ax–Schanuel and transfers it to p-adic non-density
over an arbitrary number field, through formal completion at a `K_v`-point, Rückert's Nullstellensatz
(ComplexKahlerGeometry K3 §3.4) and Krull intersection.

### 3.1 Periods in a single monodromy orbit

For a polarized integral Hodge–Deligne system on `X` (§0.2) with differential monodromy group `G_mon`
(§0.6), prove that every local lift of the complex period map and the p-adic period map `Φ_p` of §0.7 on
a residue disk, after the fibre identifications of §0.6, take values in one orbit of `G_mon` on the flag
variety of the reference fibre, and each of them in one orbit `D_mon` of the identity component
`G_mon°`, the connected monodromy period orbit of §§3.2–3.4. Over a field that is not algebraically
closed the identifications use the torsor of tensor isomorphisms, and no rational trivialization is
chosen without an existence argument (LS, Lemma 6.1, pp. 63–64).

The complex statement comes first (LS line 2910). A route: transported to the reference fibre, the Hodge
cocharacters at the points of the universal cover of `X(ℂ)` factor through the generic Mumford–Tate group
`M`, connected and reductive, and are `M(ℂ)`-conjugate, because conjugacy classes of cocharacters are
discrete; on a finite étale cover the monodromy lies in `G_mon°`, which is normal in `M^der`
(gap:andre-monodromy-normality); the Lie algebra of the centralizer `H′` of `G_mon°` in `M^der` is then a
polarized integral subvariation of `End(V)` with trivial monodromy, so its Hodge structure is constant by
the theorem of the fixed part (MappingClassGroupsAndCanonicalRepresentations §5.4); as
`M^ad = (G_mon°)^ad × (H′)^ad` and the image of a Hodge cocharacter in the torus `M/M^der` is constant, any
two Hodge cocharacters differ by conjugation by `G_mon°(ℂ)`. The transfer to `Φ_p` is the torsor argument
of LS lines 2913–2939. The torsor
`P_V → X_(K′)` of tensor isomorphisms between the fibre functors at a point and at the reference point
`x₀`, on the category generated by `(V_dR, ∇)` (MotivesAndAlgebraicCycles §6.8), carries the
`G_mon`-equivariant morphism `Φ_P : P_V → Flag(V_(x₀))` sending `φ : V_x ≅ V_(x₀)` to `φ(F_x)`, and the
complex and p-adic period maps are `Φ_P ∘ ι_ℂ` and `Φ_P ∘ ι_p` for the sections `ι_ℂ`, `ι_p` obtained by
integrating the connection. Each complex fibre of `P_V` is one `G_mon(ℂ)`-orbit and meets the image of
`ι_ℂ`, so by equivariance the image of `Φ_P` is one `G_mon`-orbit; as an inclusion of constructible
images of morphisms over `K′` this holds over every algebraically closed field containing `K′`, hence
for `Φ_p`. That orbit is a finite disjoint union of `G_mon°`-orbits of equal dimension, each open and
closed in it, and a residue disk is connected. The torsor respects the tensor structure of the
connection, not the Hodge filtrations: a horizontal tensor need not be a Hodge tensor.

**Checks.**

- For a constant system `G_mon` is trivial, the period map is constant and `D_mon` is a point.
- Horizontal tensors do not cut out `D_mon`. For the constant family `E₀ × X` with `E₀ = ℂ/ℤ[i]` (the
  curve `y² = x³ − x`) and `H¹` with rational basis `e₁, e₂` dual to `1, i`, `F¹ = ℂ(e₁ + i e₂)` and
  `D_mon = {F¹}`. Every rational endomorphism is horizontal, and `A = diag(1, 0)` sends `e₁ + i e₂` to
  `e₁ ∉ F¹` (the determinant of `(1, i)` and `(1, 0)` is `−i ≠ 0`); no line is preserved by every
  horizontal endomorphism, while the orbit argument gives the one-point orbit.
- A flag that does not respect a horizontal Hodge tensor is not in `D_mon`: `G_mon` fixes every global
  horizontal tensor, so each point of `D_mon` respects the horizontal tensors that the reference Hodge
  filtration respects, such as the polarization. For a weight-one variation of rank four with flat
  polarization `B` and basis `e₁, e₂, f₁, f₂`, `B(e_i, f_j) = δ_ij`, the plane `span(e₁, f₁)` has
  `B(e₁, f₁) = 1`, so it is not isotropic and is not a Hodge filtration in `D_mon`, while `span(e₁, e₂)`
  is Lagrangian. A line cannot serve as this negative control: every line is isotropic for an
  alternating form.
- Polarization is needed in the complex step. The isotropic planes of `Σ x_i²` in `ℂ⁴` of one ruling
  form a `ℙ¹`; on this `ℙ¹` take the constant local system `ℚ⁴` with `F¹` the tautological plane. If
  `v ∈ F¹ ∩ F̄¹` then `v̄ ∈ F¹` and isotropy gives `Σ v_i v̄_i = Σ |v_i|² = 0`, so `v = 0`: every fibre is a
  weight-one Hodge structure, transversality is automatic and the monodromy is trivial, yet the period
  map embeds `ℙ¹` and leaves the one-point orbit. No flat form polarizes it: a polarized family would be
  a nonconstant holomorphic map from `ℙ¹` to a bounded Siegel domain.
- For the Legendre family `D_mon` is the full `ℙ¹` of lines in `H¹`, the Lagrangian period variety of
  MordellLawrenceVenkatesh §3.8 in rank two.

*Needs:* §§0.2, 0.6–0.7, 2.5; MotivesAndAlgebraicCycles §6.8; ShimuraData §§1.2–1.4, 3.4–3.6 with
gap:andre-monodromy-normality; MappingClassGroupsAndCanonicalRepresentations §5.4; ReductiveGroups
Layer 4.

### 3.2 Parabolic stabilizers of period orbits

For a polarized integral Hodge–Deligne system on `X` (§0.2) with differential monodromy group `G_mon`
(§0.6) and connected monodromy period orbit `D_mon` (§3.1), prove that the stabilizer in the identity
component `G_mon°` of a Hodge filtration in `D_mon` is a parabolic subgroup, so `D_mon` is projective;
a polarized system is pure of one weight (§0.2). The route uses normality of the connected monodromy
group in the derived generic Mumford–Tate group and the Hodge cocharacter:
after a positive power the inner action of the Hodge cocharacter on connected monodromy lifts to a
cocharacter of it, whose dynamic parabolic is the stabilizer; finite components do not change the
connected orbit (LS, Lemma 6.2, p. 64).

**Checks.**

- For `SL₂` acting on `ℙ¹` through a weight-one variation the stabilizer of a Hodge line is a Borel.
- Without normality a reductive group acting on a flag variety can have nonclosed orbits (the diagonal
  torus of `SL₂` on `ℙ¹` has the open orbit `𝔾_m`), so the hypothesis is needed.
- The statement is for the connected monodromy orbit, not for every orbit of a reductive group on a flag
  space.
- Integrality is a hypothesis, because the normality input is stated for polarized integral
  variations. A rank-two rational variation of weight 0 and type `(0, 0)` on `𝔾_m`, polarized by
  `x² + y²`, can have monodromy the rotation `[[3/5, −4/5], [4/5, 3/5]]`. Its eigenvalues `(3 ± 4i)/5`
  are not algebraic integers, so there is no stable ℤ-lattice. The rotation has infinite order, so the
  connected monodromy group is `SO(2)`. The Mumford–Tate group of a type `(0, 0)` structure is trivial,
  so `SO(2)` does not lie in the derived Mumford–Tate group. Here the stabilizer of `F⁰ = V` is all of
  `SO(2)`, so the conclusion still holds, but the route does not apply. No nonintegral extension is
  claimed (as in §3.3).

*Needs:* §§0.2, 0.6, 3.1; ShimuraData §§1.2, 3.4, 3.7 with gap:andre-monodromy-normality;
`TauCeti.Cocharacter.parabolic`.

### 3.3 Algebraic degeneracy from period codimension

Let `X` be smooth irreducible over ℂ of dimension `d ≥ 1`, carrying a pure polarized integral variation
with connected monodromy period orbit `D_mon`: the orbit, in the flag variety of a reference fibre, of the
identity component of the Zariski closure of monodromy through a Hodge filtration, projective by §3.2.
Prove that if an algebraic subset `Z ⊂ D_mon` has codimension at least `d` in `D_mon`, then every
positive-dimensional irreducible analytic component of the inverse image of `Z` under a local lift of the
period map is contained in a proper algebraic subvariety of `X`; zero-dimensional components are points
and are also proper. The statement is componentwise: it does not say that infinitely many components
share one proper algebraic closure (LS, Lemma 6.3, pp. 64–65; LV, Corollary 9.2, p. 964).

A route: apply the pure Ax–Schanuel theorem in the monodromy-orbit form, with all codimensions taken in
`X × D_mon` (LS line 2965 takes the monodromy orbit as the compact dual), to `W = X × Z` and the graph of
the period map. If `U` is a component of `W ∩ graph` whose projection to `X` is Zariski dense, that
projection lies in no proper weakly special subvariety, so
`dim U ≤ dim W + dim graph − dim(X × D_mon) = (d + dim Z) + d − (d + dim D_mon) = d − codim Z ≤ 0`, and a
positive-dimensional component has degenerate projection.

**Checks.**

- For `d = 0` every point is dense in `X`, so positive dimension of `X` is necessary.
- For a constant variation `D_mon` is a point, `Z` has codimension `0 < d`, and the hypothesis fails;
  indeed the inverse image is all of `X`.
- For `X` a curve and `Z` a point of codimension `≥ 1` in `D_mon`, the inverse image is discrete, as the
  theorem predicts.
- Only integral polarized pure variations are covered; no mixed or nonintegral extension is claimed.
- The ambient is `X × D_mon`. On a curve `X` carrying a varying elliptic `H¹` plus a constant elliptic
  `H¹`, `D_mon ≅ ℙ¹` has dimension 1 inside the three-dimensional Lagrangian Grassmannian of the rank-four
  fibre. For `W = X × D_mon` and `U` the graph, the Ax–Schanuel inequality reads `1 ≥ 0 + 1` in
  `X × D_mon`, but `3 ≥ 2 + 3`, false, in the product with the Lagrangian Grassmannian, although the
  projection of `U` is all of `X`, which is not a proper weakly special subvariety.

*Needs:* §3.2; AbelianSchemesAndArithmeticModuliPartII Layer B3 with gap:period-map-ax-schanuel.

### 3.4 Transfer to p-adic non-density

Let `K` be a number field with its fixed embedding `K → ℂ`, `S` a finite set of places, `p` a rational
prime below no place of `S` and unramified in `K`, and `v | p` a place of `K`, as in §0.1. Let `𝒳` be
smooth over `O_K[S⁻¹]` with geometrically connected generic fibre `X` of dimension `d ≥ 1`, carrying a
pure polarized integral Hodge–Deligne system with connected monodromy period orbit `D_mon`, and let
`Ω ⊂ 𝒳(O_(K_v))` be a residue disk with p-adic period map `Φ_p` of §0.7, valued in `D_mon` by §3.1.
Prove that for a closed subscheme `Z ⊂ D_mon` over `K_v` of codimension at least `d`, the set
`Φ_p⁻¹(Z) ∩ Ω` is contained in a proper Zariski-closed subset of `X_(K_v)`; consequently no set of
`K`-points inside it is Zariski dense in `X`, since the ideal of functions vanishing on a set of
`K`-points is defined over `K`. After shrinking to finitely many affinoid subdisks the statement involves
finitely many irreducible components; finitely many residue disks combine by multiplying nonzero
algebraic equations. The case `K = ℚ` is the one consumed in §§4.5, 6.1 and 7.5 (LS, Theorem 6.4,
pp. 65–67, LS line 2979, stated there over an arbitrary number field; LV, Lemma 9.3, pp. 965–968).

A route: a residue disk lies in `𝒳′(O_(K_v))` for every affine open `𝒳′ ⊂ 𝒳` containing its reduction
point, so `𝒳` may be taken affine and the functions below are regular on `X_(K_v)`. Cover `Ω` by
finitely many smaller residue disks on whose images the equations of `Z` are regular, and fix one
irreducible component `W` of the zero locus of the pulled-back equations in the
Tate algebra `R` of such an affinoid disk, with prime ideal `I_W` and a point `x₀ ∈ W(K_v)` (only
`K_v`-points matter). Let `X̂` be the formal completion of `X_(K_v)` at `x₀`, a formal power-series
scheme over `K_v`. Integrating the connection gives the formal horizontal frame over `X̂`
(MordellLawrenceVenkatesh §2.6); it is the common restriction to `X̂` of the p-adic period map and, after
transporting its `K_v`-coefficients by the abstract `σ : ℚ̄_p ≅ ℂ` of the Conventions, of a local complex
period map of `X_ℂ` at `σ(x₀)`, the transported series converging on a complex neighbourhood
(MordellLawrenceVenkatesh §2.8). The period equations, the pullbacks of finitely many equations of `Z^σ`
along that local period map, cut out the inverse image of `Z^σ`; after shrinking to a small ball `B`
around `σ(x₀)` this inverse image is the union of finitely many irreducible analytic components
`U₁, …, U_r` of it in `B`, each through `σ(x₀)` (the locally finite irreducible decomposition of
ComplexKahlerGeometry K3 §3.4). Applying §3.3 to `Z^σ` and each `U_j` gives a nonzero regular function
`H_j` on the affine irreducible `X_ℂ` vanishing on `U_j` (for `U_j = {σ(x₀)}`, any nonzero regular function
vanishing at that point, which exists as `d ≥ 1`). The product `H = H₁⋯H_r` is nonzero because `X_ℂ` is
irreducible, and it vanishes on the entire common zero set of the period equations in `B`; only then does
Rückert's Nullstellensatz (ComplexKahlerGeometry K3 §3.4, `ruckert_nullstellensatz`) place a power `H^m`
in the ideal of germs at `σ(x₀)` generated by the period equations. A function vanishing on one component
only need not have any power in that ideal. Pulled back to `X̂` and transported by `σ⁻¹`, `H^m` is a
regular function on `X_(ℚ̄_p)` vanishing on the formal inverse image of `Z`; it is defined over a finite
extension of `K_v`, and its norm is a nonzero regular function `H′` on `X_(K_v)` with the same vanishing
(LS line 3065). After clearing denominators `H′ ∈ R` lies in every power of the maximal ideal of `x₀` in
the Noetherian domain `R/I_W`;
Krull intersection in the localization at that maximal ideal, into which `R/I_W` injects, gives
`H′ ∈ I_W`, so `H′` vanishes on `W`. The product of these functions over the finitely many components and
disks is nonzero because `X` is irreducible.

**Checks.**

- Formal vanishing at a point is not ideal membership in the Tate algebra; Krull intersection is the
  step that closes this, and it needs a Noetherian local ring.
- For the germ ideal `(xy)` of `ℂ{x, y}`, whose zero germ has the two components `x = 0` and `y = 0`, the
  function `x` vanishes on the first component, but `(xy)` maps to zero in `ℂ{x, y}/(y) = ℂ{x}` while `x^m`
  maps to `x^m ≠ 0`, so no power of `x` lies in `(xy)`; the product `xy` over both components does.
  Rückert's theorem is applied only to the product over all components through the point.
- An infinite union of nondense subsets can be dense (the rational points of `𝔸¹` are a countable union
  of points); only finite unions over components and disks are taken.
- For `Z = D_mon` (codimension zero) and `d ≥ 1` the hypothesis fails, and indeed `Φ_p⁻¹(Z) = Ω` is
  Zariski dense.
- At a centre `a ∈ ℚ_p` transcendental over ℚ, even the coordinate function `t` has Taylor series
  `a + u`, whose constant coefficient lies in no number field; under `σ` it becomes `σ(a) + u`. The
  transfer uses formal coefficients in `K_v` and its finite extensions, moved by the abstract `σ`, and
  needs neither continuity of `σ` nor algebraicity of the centre.
- `σ` restricts to the fixed embedding on `K`, so the transported variety is `X_ℂ` itself, whose Betti
  realization is part of the system; a `σ` inducing another embedding of `K` would land on a conjugate
  variety. For `K = ℚ` there is no choice.

*Needs:* §§0.7, 3.1, 3.3; ComplexKahlerGeometry K3 §3.4; MordellLawrenceVenkatesh §§2.5–2.6, 2.8;
RestrictedPowerSeries §§2.1, 5.2; Mathlib `Ideal.iInf_pow_eq_bot_of_isLocalRing`.

### Examples

For the germ ideal `(z²)`, `z` vanishes on its zero set but lies only in the radical; the power `z²`
supplied by Rückert's theorem (ComplexKahlerGeometry K3 §3.4) is what survives the transfer to p-adic
coefficients. In dimension zero a point is dense in itself, so positive base dimension is essential.

### Dependencies

Layers 0 and 2; ShimuraData §§1.2–1.4, 3.4–3.7; MotivesAndAlgebraicCycles §6.8; ReductiveGroups
Layer 4; AbelianSchemesAndArithmeticModuliPartII Layer B3; MappingClassGroupsAndCanonicalRepresentations
§5.4; ComplexKahlerGeometry K3 §3.4;
RestrictedPowerSeries §§2.1, 5.2; MordellLawrenceVenkatesh §§2.5–2.6, 2.8; `TauCeti.Cocharacter.parabolic`;
Mathlib `Ideal.iInf_pow_eq_bot_of_isLocalRing`.

## Layer 4: Balanced monodromy and semisimple fibres

This layer describes the index partition of a subdirect product, strong balance relative to a
Frobenius permutation and its verification for torsion orbits, bounds fixed semisimple filtration loci
and proves non-density for semisimple integral fibres.

### 4.1 Index classes of subdirect monodromy

Let `H` be a connected semisimple group in characteristic zero with simple adjoint quotient and
`L ⊂ H^I` a closed subgroup surjecting onto each factor, `I` finite and nonempty. For `i, j ∈ I` put
`i ∼ j` when the projection of `L` to `H × H` (factors `i`, `j`) is not the full product, equivalently
is the graph of an isogeny after central quotients. Prove that `∼` is an equivalence relation, and that
projection onto one representative of each class is surjective with finite kernel. This applies to
`SL_N` (`N ≥ 2`), `Sp_(2r)` (`r ≥ 1`) and `SO_N` (`N = 3` or `N ≥ 5`); `SO₂` and `SO₄` are excluded
(LS, Lemma 6.5, pp. 67–68; LS line 3082, with the restriction of Source corrections).

A route: Goursat's lemma for simple Lie algebras applies to each two-factor projection; a three-factor
projection gives transitivity, and induction on the number of classes gives the last assertion.

API:

- The relation `∼` records dependence of two factor projections through the adjoint simple quotient.
- `∼` is reflexive, symmetric and transitive.
- Projection to a set of class representatives is a central isogeny onto the full product.

**Checks.**

- The diagonal `H ⊂ H²` has one class and projects with finite kernel onto either factor.
- The product `H²` has two singleton classes.
- `SO₄` has two simple adjoint factors and fails the hypothesis; Goursat's single-factor conclusion
  would be wrong for it.

*Needs:* MordellLawrenceVenkatesh §0.24; ReductiveGroups Layer 7.

### 4.2 Strongly balanced monodromy

For the index partition of §4.1 and an integer `c ≥ 1`, the subgroup is **c-balanced** when all classes
have the same cardinality and there are at least `c` classes. Given a permutation `σ` of `I`, it is
**strongly c-balanced** when moreover `σ` preserves the partition and every σ-orbit meets at least `c`
distinct classes. For a subgroup of a coefficient normalizer the condition is imposed on its
intersection with the product of the derived classical factors after algebraic closure; scalar centres
and similitude characters supply no independent directions (LS, Definition 6.6 and Example 6.7, p. 68).

API:

- c-balance is equal class sizes with at least `c` classes.
- Strong c-balance adds σ-invariance of the partition and the orbitwise lower bound on classes met.
- Strong c-balance implies strong c′-balance for `1 ≤ c′ ≤ c`, and is invariant under equivariant
  relabelling of `I`.

**Checks.**

- Four classes `{1,2}, {3,4}, {5,6}, {7,8}` with `σ = (13)(24)(57)(68)` are 4-balanced but only strongly
  2-balanced: each σ-orbit meets two classes.
- A diagonal subgroup on `d` indices is strongly 1-balanced for every σ and never strongly 2-balanced.
- The full product has singleton classes; if σ fixes an index it is not strongly 2-balanced, however
  many factors there are.

*Needs:* §§2.1, 4.1.

### 4.3 Torsion-orbit monodromy is strongly balanced

For a family of primitive smooth ample hypersurfaces in an abelian variety of dimension `n > 2`, not
constant up to translation, with classical convolution monodromy as in SheafConvolutionOnAbelianVarieties
§6.7, prove that for every `c ≥ 1` the torsion character of SheafConvolutionOnAbelianVarieties §8.3 can
be chosen so that the coefficient system `V_I` of §1.7 has strongly c-balanced differential monodromy
relative to the residue Frobenius permutation of the index set (LS, Lemma 6.8, pp. 68–69).

A route: the c independent conjugate-character factors of SheafConvolutionOnAbelianVarieties §8.3,
present for every Galois conjugate after the stated Frobenius powers, become independent index classes;
Galois acts transitively on the orbit, giving equal class sizes, and Frobenius preserves the relation.
SheafConvolutionOnAbelianVarieties §2.4 returns from the algebraically closed field of the convolution
groups to the de Rham group.

**Checks.**

- Big monodromy for one selected character is not enough: the conjugate-uniform form is needed so that
  every Frobenius cycle meets `c` classes.
- For `c = 1` the statement is that the partition is σ-stable with equal class sizes.
- A family constant up to translation has finite monodromy on the twisted cohomology and is excluded.

*Needs:* §§0.6, 1.7, 4.2; SheafConvolutionOnAbelianVarieties §§2.4, 6.7, 8.3.

### 4.4 Codimension of semisimple isomorphism orbits

In the setting of §2.1, let a uniform coefficient filtration have single-factor profile `h` on `H` and
strongly c-balanced monodromy relative to σ, with `E^σ = E₀` on the chosen Frobenius cycle. For an
integer `e > 0` assume `A ≥ (e + dim H)/c`. Prove that in the monodromy flag orbit the locus whose filtered Frobenius module is
isomorphic to a prescribed one has codimension at least `e` (LS, Lemma 7.2, pp. 70–71; LS line 3205).

A route: project the period orbit to `c` independent factor flags in one Frobenius cycle; the product
flag variety has dimension `c·A`, while an orbit of the semilinear centralizer has dimension at most
`dim H` by §2.2; the projection from the full monodromy orbit is smooth and homogeneous.

**Checks.**

- With `c = 1` and `e = 1` the hypothesis is `A ≥ 1 + dim H`.
- The estimate is for fixed isomorphism data; the moduli of all filtered φ-modules is not claimed to be
  finite.
- For `H = GL₂` with weights `(1, 0)`, `A = 1` and `dim H = 4`, so `A ≥ (1 + 4)/c` needs `c ≥ 5`
  independent factors; a single factor gives nothing.

*Needs:* §§2.1–2.2, 2.8, 3.2, 4.2.

### 4.5 Non-density for semisimple integral fibres

Let `𝒳` be smooth of finite type over `ℤ[S⁻¹]` with geometrically connected generic fibre `X` of
dimension `d ≥ 1`. Let `E` be a nonzero constant étale H⁰-algebra on `𝒳` (§§0.4, 1.1), let `H` be
`GL_N`, `GSp_N` or `GO_N`, and let `V` be a pure polarized integral Hodge–Deligne system on `𝒳` with
integral Frobenius (§0.2) and Frobenius characteristic polynomials with integer coefficients outside
`S`, which is an equidimensional `E`-module of rank `N > 0` with an `H`-structure (§§1.4–1.5). Let `G`
be the semilinear coefficient normalizer of §2.1 that `E`, `H` and `N` define in each realization (over
`ℚ_p` in the étale one). Assume that the Hodge filtration is uniform with single-factor adjoint profile
`h` on `H` (§2.8), that the differential monodromy is strongly c-balanced relative to residue Frobenius
for an integer `c ≥ 1` (§4.2), and that `A ≥ (d + dim H)/c`. Prove that the integral points whose
global Galois representations into `G(ℚ_p)` are G-completely reducible (§2.3) are not Zariski dense in
`X`. The coefficient permutation representation is fixed, and `S` is enlarged only by finitely many
primes (LS, Theorem 7.3, pp. 71–72; LS line 3259).

A route: §2.9 leaves finitely many semisimple G-representations; on each of finitely many residue disks a
fixed representation gives one centralizer orbit of filtrations, of codimension at least `d` by §4.4
with `e = d`; §3.4 and a finite union conclude.

**Checks.**

- The statement covers only semisimple fibres; the all-points theorem is §6.1.
- For `d = 0` the conclusion is false (a point is dense in itself), and the hypothesis `d ≥ 1` excludes
  it.
- Enlarging `S` enlarges the set of integral points, so non-density for a larger `S` implies it for a
  smaller one.
- For `E = ℚ` and `H = GL_N`, `G = GL_N`, `dim H = N²` and G-complete reducibility is semisimplicity of
  the `ℚ_p`-representation. For `E = ℚ × ℚ` and `H = GL_N`, `dim G = 2N²` while the hypothesis uses
  `dim H = N²`: the cost is that of one classical factor, not of the whole normalizer.

*Needs:* §§0.2, 0.4, 1.1, 1.4–1.5, 1.9, 2.1, 2.3, 2.8–2.9, 3.4, 4.2, 4.4.

### Examples

On eight indices with classes `{1,2}, {3,4}, {5,6}, {7,8}`, the permutation `(13)(24)(57)(68)` preserves
the partition and each orbit meets two classes: the subgroup is 4-balanced, strongly 2-balanced and not
strongly 4-balanced (LS, Example 6.7, p. 68).

### Dependencies

Layers 0–3; SheafConvolutionOnAbelianVarieties §§2.4, 6.7, 8.3; MordellLawrenceVenkatesh §0.24;
ReductiveGroups Layer 7.

## Layer 5: Balanced associated gradeds and codimension

This layer defines central weights, induced Levi filtrations, balance and bifiltered Frobenius types,
derives balance from global purity over ℚ, proves finiteness of local graded types and the root-pairing
estimates, and ends with the fixed-type codimension theorem.

### 5.1 Central weights of filtrations

For an algebraic group `S` in characteristic zero with reductive identity component, define
`a_S = X_*(Z(S°)°) ⊗ ℚ`, identified with the ℚ-dual of `X^*(S°) ⊗ ℚ` through the central pairing; these
geometric spaces are computed over an algebraic closure and keep their Galois action, rational
cocharacters giving invariant classes. The **central weight** `w_S(μ)` of a rational cocharacter `μ` is
its projection to `a_S`. For a Levi `M ⊂ G`, the inclusion of connected centres `Z(G°)° ⊂ Z(M°)°`
gives the canonical inclusion `ι_(GM) : a_G → a_M` (LS line 3391), while restriction of characters
`X^*(G°) → X^*(M°)` gives, dually, the projection `pr_(MG) : a_M → a_G`; they split one another,
`pr_(MG) ∘ ι_(GM) = id`, and `w_G(μ) = pr_(MG)(w_M(μ))` for a cocharacter `μ` of `M`. The **modular
character** of a parabolic `P` is `γ_P = det(Ad | Lie P)⁻¹`, paired additively with cocharacters (LS,
the paragraph before Definition 8.4, pp. 74–75; LV, §§11.1–11.2, pp. 984–986).

API:

- `a_S` is the space of rational central cocharacters, paired with rational characters.
- A cocharacter has a well-defined central weight in `a_S`.
- `ι_(GM)` comes from the centres and `pr_(MG)` is dual to restriction of characters;
  `pr_(MG) ∘ ι_(GM) = id`, and `⟨ι_(GM)(λ), χ|_M⟩ = ⟨λ, χ⟩` for every character `χ` of `G°`.

**Checks.**

- For `GL_r` the central weight of the diagonal cocharacter with exponents `a_i` is their average
  `(Σ a_i)/r` times the scalar cocharacter.
- For semisimple `S`, `a_S = 0`.
- For the upper triangular Borel of `GL₂`, `γ_P(diag(a, b)) = a⁻¹b`; for `μ(t) = diag(t, 1)`,
  `⟨γ_P, μ⟩ = −1`.
- Direction of the maps, for `GL₂` and its diagonal Levi `T`: in scalar-cocharacter coordinates
  `ι_(GM)(a) = (a, a)` and `pr_(MG)(x, y) = (x + y)/2`, so `1 ↦ (1, 1) ↦ 1`, and `(1, 0)` projects to
  `1/2`, the central weight of `diag(t, 1)`. Restriction sends `det` to `(1, 1)`; its dual, in the
  coordinate dual to `det`, is `(x, y) ↦ x + y`, a map `a_T → a_G`, so restriction of characters cannot
  produce the inclusion.

*Needs:* §2.5; ReductiveGroups Layers 4, 7.

### 5.2 Filtrations induced on a Levi quotient

Let `G` be as in §2.3, `P` a Richardson parabolic with Levi quotient `M` and `F` a G-filtration. Choose a
splitting cocharacter of `F` with values in `P`; its projection defines the **induced Levi filtration**
`F_M`. Prove that `F_M` does not depend on the choice: with `Q = P_μ` the stabilizer of `F`, the
μ-fixed points of the single `Q`-orbit `Q·P` in `G/P` are conjugate under `Z_Q(μ)`. For `GL(V)`, `F_M` is
the filtration induced by `F` on the graded pieces of the `P`-flag (LS, Lemma 8.2 and Definition 8.3,
p. 74; LV, Lemmas 11.1–11.2, pp. 986–989; LV printed p. 988 with the corrected graded piece, see
Source corrections).

API:

- The construction returns the `M`-filtration `F_M` from `F` and `P`.
- Changing the `P`-valued splitting leaves `F_M` unchanged.
- For `GL(V)` it is the filtration `F^j ∩ f_k` modulo `f_(k−1)` on `gr_k^f`.

**Checks.**

- For `P = G`, `F_M = F`.
- For `GL₂` and a line `L` (the flag `0 ⊂ L ⊂ V`), the two induced one-dimensional filtrations record
  whether `L` is the Hodge line.
- Two splittings conjugate by an upper unipotent element give the same `F_M`.
- For diagonal `μ` in `SL₂` the two fixed points of `ℙ¹` lie in distinct orbits of the upper Borel and
  are not conjugate under its torus; the fixed-point step needs one `Q`-orbit.

*Needs:* §§2.3, 2.5, 5.1.

### 5.3 Balanced, weakly balanced and semibalanced filtrations

For `F` and `P → M` as in §5.2, with `P` and `F` defined over a field `k`, `F` is **balanced** when
`⟨χ, F_M⟩ = 0` for every character `χ` of `M` defined over `k` and trivial on `Z(G)` (a character of the
whole group `M`, not only of `M°`), **weakly balanced** when `⟨γ_P, F_M⟩ = 0` and **semibalanced** when
`⟨γ_P, F_M⟩ ≤ 0`. Prove that balanced implies weakly balanced implies semibalanced; that when `G` is
connected (so that `M` is) and every character of `M` is defined over `k`, balance is the equality
`w_M(F_M) = ι_(GM)(w_G(F))` in `a_M` of §5.1; and that restriction to `G°` preserves weak balance and
semibalance, which test the one character `γ_P`, but does not preserve balance (LS, Definition 8.4,
Remark 8.5, Example 8.6 and proof of Lemma 8.7, pp. 75–77, LS line 3478, with the correction listed in
Source corrections; LV, §11.4 and (11.7), pp. 989–990). For a disconnected `G` the two differ in both
directions (Checks): the equality in `a_M` can fail for a balanced filtration, as it does for one that
global purity gives, and can hold for one that is not balanced.

A route for the comparison: for connected `G` restriction `X^*(G) ⊗ ℚ → X^*(Z(G)°) ⊗ ℚ` is bijective,
so `⟨ι_(GM)(w_G(F)), χ⟩ = ⟨ψ, F⟩` for the character `ψ` of `G` that agrees rationally with `χ` on `Z(G)°`;
the equality in `a_M` therefore says that `⟨χ − ψ|_M, F_M⟩ = 0` for every `χ`, and the `χ − ψ|_M` are,
up to multiples, the characters of `M` trivial on `Z(G)`.

API:

- Balance tests the characters of `M` defined over the base field and trivial on `Z(G)`; for connected
  `G` whose Levi has all its characters over the base field it is the equality of central weights in
  `a_M`.
- Balance implies weak balance, since `γ_P` is a character of `M` defined over the base field and
  trivial on the centre of `G`; weak balance implies semibalance.
- For `GL(V)`, `F` is balanced exactly when every nonzero graded block has the same average `F`-weight
  as `V`.
- For `GSp(V)` or `GO(V)` with multiplier `ν` and a self-dual flag, `F` is balanced exactly when every
  nonzero graded block has the average `F`-weight `⟨ν, F⟩/2` of `V`: the characters `det_k²·ν^(−dim gr_k)`
  of `M` are trivial on the scalars, and the middle block is self-dual, even when its similitude group
  `GO(gr₀)` is disconnected.

**Checks.**

- In `GL₆` with an increasing `2 + 2 + 2` flag `f₀ ⊂ f₁ ⊂ V` and a two-step filtration with
  `dim F¹ = 3`, write `a₀ = dim F¹ − dim(F¹ ∩ f₁)`, `a₁ = dim(F¹ ∩ f₁) − dim(F¹ ∩ f₀)` and
  `a₂ = dim(F¹ ∩ f₀)` for the contributions of `F¹` to the top, middle and bottom blocks;
  `⟨γ_P, F_M⟩ = 4(a₀ − a₂)` and balance is `(1, 1, 1)`.
- In the same example weak balance is `a₀ = a₂` and semibalance is `a₀ ≤ a₂`. Each `a_i` is a
  dimension inside a two-dimensional block, so `a_i ≤ 2`, and `a₀ + a₁ + a₂ = 3` with `a₀ = a₂` forces
  `(1, 1, 1)`: weak balance and balance coincide here.
- In `GL₁₂` with an increasing `4 + 4 + 4` flag and `dim F¹ = 6`, `⟨γ_P, F_M⟩ = 8(a₀ − a₂)`. The triple
  `(1, 4, 1)` is realized by `F¹ = ℓ_b ⊕ M ⊕ ℓ_t` (a line in `f₀`, a complement of `f₀` in `f₁`, a line
  outside `f₁`) and is weakly balanced, but its block averages `1/4, 1, 1/4` differ from the average
  `1/2` of `V`, so it is not balanced; the balanced triple is `(2, 2, 2)`. Weak balance is strictly
  weaker than balance.
- A generic `F¹` meets `f₀` trivially and `f₁` in a line, giving `(2, 1, 0)`, which is not
  semibalanced; semibalance is not automatic on the flag variety.
- With the inverse-determinant convention the sign is `≤ 0`; with `det(Ad)` it would be `≥ 0`.
- For a disconnected Levi the equality in `a_M` can fail for a balanced filtration. Let `C : y² = x³ − x`,
  `p ≡ 1 mod 4`, `W = H¹_et(C_ℚ̄, ℚ_p)` and `E_et = ℚ(i) ⊗ ℚ_p ≅ ℚ_p × ℚ_p`, on which `G_ℚ` acts through
  `Gal(ℚ(i)/ℚ)` by exchanging the factors. `V = W ⊗_(ℚ_p) E_et` with the diagonal action gives
  `ρ : G_ℚ → G(ℚ_p)` for the coefficient normalizer `G = GL₂² ⋊ C₂` of §2.1 (`E = ℚ_p × ℚ_p`, `H = GL₂`),
  crystalline at `p` and pure of weight 1. Over `ℚ(i)`, `W` is the sum of two characters `ψ, ψ^c`, and the
  `E_et`-line made of the `ψ`-line of the first factor and the `ψ^c`-line of the second is `G_ℚ`-stable,
  complex conjugation exchanging both the lines and the factors. Its Levi has `M° = 𝔾_m⁴`, with
  coordinates `(x₁, y₁ | x₂, y₂)` for the line and the quotient on each factor, and the de Rham degrees
  `(0, 1 | 1, 0)`; so `w_M(F_M) = (0, 1 | 1, 0)` against `ι_(GM)(w_G(F)) = (½, ½ | ½, ½)`. The component of
  `M` outside `M°` exchanges the factors, so the characters of `M` trivial on `Z(G)`, the diagonal
  scalars, are up to finite order the powers of `x₁x₂/(y₁y₂)`, which pairs with `F_M` to
  `(0 + 1) − (1 + 0) = 0`: `F` is balanced, while as a `G°`-filtration it is not (`x₁/y₁` pairs to `−1`).
  The `G°`-statement is the one over `ℚ(i)` that the last Check of §5.8 refutes.
- Connectedness of `G`, not only of `M`, is needed for the comparison with `a_M`: in `G = GL₂² ⋊ C₂`,
  `λ = (diag(t, 1), 1)` is not fixed by the swap, so `P_λ = B × GL₂` and `M = T × GL₂` are connected, but
  `Z(G)` is the diagonal `𝔾_m`, smaller than `Z(G°) = 𝔾_m²`. For `F_M` given by
  `(diag(t^a, t^b), diag(t^c, t^d))` the equality in `a_M` says `a = b`, while balance, through the
  characters `x₁²/det₂` and `y₁²/det₂`, says `a = b = (c + d)/2`.

*Needs:* §§5.1–5.2.

### 5.4 Global purity forces balance over ℚ

Let `G` be an algebraic group over `ℚ_p` with reductive identity component (as in §2.3), with a fixed
faithful representation `G → GL_N`. Let `ρ : G_ℚ → G(ℚ_p)` be continuous and crystalline at `p`, and
suppose there are a finite set `Σ` of primes and an integer `w` such that for every prime `ℓ ∉ Σ`,
`ℓ ≠ p`, the representation is unramified at `ℓ` and the characteristic polynomial of geometric Frobenius
at `ℓ` on the `N`-dimensional representation has algebraic coefficients and only roots that are Weil
`ℓ`-numbers of weight `w` (DeligneWeightsAndPurity §0.1). Suppose the image of `ρ` lies in `P(ℚ_p)` for
a Richardson parabolic `P` of `G` defined over `ℚ_p`. Prove that the de Rham Hodge filtration induced
on the corresponding inner Levi quotient is balanced relative to `P`. For `GL` this says that every global
graded subquotient has average descending de Rham degree `w/2`, equivalently arithmetic Hodge–Tate
average `−w/2` (Conventions: `ℚ_p(−1)`, with geometric Frobenius `q`, has Weil weight 2, de Rham jump
`+1` and Hodge–Tate weight `−1`). The statement is over ℚ; it is false in this form over number fields
with several embeddings (LS, Lemmas 8.1 and 8.7, pp. 73 and 76–77).

For a disconnected Levi the conclusion concerns the characters of `M` itself, not those of `M°` (§5.3,
Checks).

A route: let `χ` be a character of `P` (equivalently of `M`, the unipotent radical having none) defined
over `ℚ_p` and trivial on `Z(G)`. Then `χ ∘ ρ` is crystalline at `p` and pure of weight 0: an element of
`P` acting by a scalar in the faithful representation is central in `G` and so acts trivially on `χ`,
which gives a multiplicative relation between the Frobenius eigenvalues of `ρ` and of `χ ∘ ρ` in which
`χ` occurs and the exponents of the eigenvalues of `ρ` sum to zero (LS, proof of Lemma 8.7, LS lines
3477–3508). MordellLawrenceVenkatesh §1.13 then gives `χ ∘ ρ` Hodge weight 0, that is `⟨χ, F_M⟩ = 0`,
transported through the inner form of §2.6, whose characters are those of `M`.

**Checks.**

- For `ρ = H¹_et(E_ℚ̄, ℚ_p)` of an elliptic curve over ℚ (Weil weight 1, de Rham jumps `0, 1`,
  Hodge–Tate weights `0, −1`) a one-dimensional global subquotient would need de Rham degree `1/2`,
  that is Hodge–Tate weight `−1/2`; there is none, consistent with irreducibility. For the Tate module
  `V_pE = H¹(1)` (Weil weight `−1`, Hodge–Tate weights `0, 1`) the required values are de Rham degree
  `−1/2` and Hodge–Tate weight `+1/2`.
- For `ρ = ℚ_p(−1)` (Weil weight 2) the de Rham degree is `+1 = w/2` while the Hodge–Tate weight is
  `−1`; a balance statement written with Hodge–Tate average `+w/2` would fail on it.
- A CM Hecke character over an imaginary quadratic field has unequal embedding weights; the ℚ statement
  does not extend by notation.
- For `w = 0` and `ρ` unramified with finite image every subquotient has weight 0.

*Needs:* §§2.3, 2.6, 5.3; DeligneWeightsAndPurity §0.1; MordellLawrenceVenkatesh §§1.10, 1.13.

### 5.5 Bifiltered Frobenius objects and graded types

In the setting of §2.1, with `G` the semilinear coefficient normalizer of `V` and
`σ ∈ Aut_(E₀)(E)`, a **bifiltered coefficient Frobenius object** is `(V, φ, F, f)` with `φ ∈ G(E₀)`
σ-semilinear and two G-filtrations (§2.5), the Hodge filtration `F` and the auxiliary filtration `f`,
the latter φ-stable, that is `φ ∈ P_f(E₀)` for the dynamic parabolic `P_f` of `f`. Its **graded type**
is the `G`-conjugacy class of `(P_f, φ_M, F_M)`, where `f` enters only through its parabolic `P_f` (so its
numerical indexing, and whatever else of `f` the parabolic does not record by §2.5, is forgotten) and the
full indexing of `F_M` is kept (LS, Definition 8.8 and Remark 8.9, pp. 77–78).

API:

- A bifiltered object packages two compatible filtrations with φ-stability of the auxiliary one.
- The graded type is the parabolic with the filtered Frobenius Levi data up to `G`-conjugacy.
- The graded type depends on `f` only through `P_f`: replacing `f` by the filtration of a positive power
  of a splitting cocharacter, or by any φ-stable auxiliary filtration with the same parabolic, leaves it
  unchanged.

**Checks.**

- Reindexing a two-step `f` from weights `(1, 0)` to `(5, 0)` leaves the type unchanged.
- Changing `F` from weights `(1, 0)` to `(5, 0)` changes the type.
- Two φ-stable flags with the same quotient dimensions and different Frobenius eigenvalues on the graded
  pieces have different types; types are not characteristic polynomials of the ungraded `φ`.

*Needs:* §§2.1, 2.3, 2.5–2.6, 5.2.

### 5.6 Finite cyclic cocycles in unipotent groups

Let `U` be a unipotent algebraic group in characteristic zero and `ψ` an automorphism of order dividing
`r ≥ 1`. Prove that if `u·ψ(u)⋯ψ^(r−1)(u) = 1` then `u = v⁻¹ψ(v)` for some `v ∈ U`, so `H¹(C_r, U) = 1` for
this action (LS, Lemma 8.13, p. 80; LS line 3661).

A route: induct along a ψ-stable central series with vector-group quotients; on a vector quotient the
averaging homotopy (division by `r`) solves the equation, and the correction lifts into the central
kernel.

**Checks.**

- For `U = 𝔾_a` and `ψ = −1`, `r = 2`, the cocycle condition is `u − u = 0`, always true, and
  `u = −v − v` gives `v = −u/2`.
- In characteristic `p` with `U = 𝔾_a`, `ψ = id` and `r = p`, the norm relation `p·u = 0` holds for every
  `u` but `ψ(v) − v = 0`; characteristic zero is needed.
- Finite order of `ψ` is needed for the statement to apply directly to all of `U`, not for its
  conclusion. If `N = u·ψ(u)⋯ψ^(r−1)(u) = 1` then `ψ(N) = u⁻¹·N·ψ^r(u)` gives `ψ^r(u) = u`, so `u` lies in
  the closed ψ-stable subgroup `U^(ψ^r)`, unipotent as a closed subgroup of `U`, on which `ψ` has order
  dividing `r`; the statement there gives `v ∈ U^(ψ^r)`. On `U = 𝔾_a²` over `ℚ` with `ψ(x, y) = (−x, 2y)`, of
  infinite order, and `r = 2`, the element `u = (2, 0)` satisfies `u + ψ(u) = 0` and equals `ψ(v) − v`
  for `v = (−1, 0)`, inside `U^(ψ²) = {(x, 0)}` (since `4y = y` forces `y = 0`). This is the restriction
  to `Z_U(φ^r)` made in §5.7.

*Needs:* ReductiveGroups Layer 5.

### 5.7 Levi factors stable under semisimple Frobenius

If a semisimple element `φ` of an algebraic group with reductive identity component in characteristic
zero normalizes a connected parabolic `P`, prove that some `U`-conjugate of a chosen Levi of `P` is
φ-stable, where `U` is the unipotent radical. The cocycle of the argument lies in `Z_U(φ^r)` for `r`
killing the induced finite component action, and conjugation by `φ` has order dividing `r` there; it is
not assumed to have finite order on all of `U` (LS, Lemma 8.14, p. 80, with the correction listed
in Source corrections; LS line 3668).

**Checks.**

- Conjugation by `diag(2, 1)` acts on the upper root group of `GL₂` by multiplication by 2, of infinite
  order; §5.6 does not apply directly on all of `U`. There the norm equation `(2^r − 1)·u = 0` forces
  `u = 0`, and `Z_U(φ^r) = 0`, in agreement with the reduction to the fixed subgroup in the Checks of §5.6.
- For `φ` central the chosen Levi is already φ-stable.
- For `φ` regular semisimple in a Borel `P` of `GL₂`, the φ-stable Levi is the maximal torus containing
  `φ`, a unipotent conjugate of the diagonal torus.

*Needs:* §§2.3, 5.6; ReductiveGroups Layers 4, 6A.

### 5.8 Finitely many local types from global semisimplification

Let `G` be the semilinear coefficient normalizer of §2.1 with `E₀ = ℚ_p`, formed for the étale fibre
`V_et` over `E_et`, with its standard representation `G → GL_(ℚ_p)(V_et)`, and let
`ρ₀ : G_ℚ → G(ℚ_p)` be continuous, G-completely reducible (§2.3), crystalline at `p` (§2.6), pure in
the sense of §5.4 (there are a finite set `Σ` of primes and an integer `w` such that for every prime
`ℓ ∉ Σ`, `ℓ ≠ p`, `ρ₀` is unramified at `ℓ` and the characteristic polynomial of geometric Frobenius at
`ℓ` in the standard representation has algebraic coefficients and only roots that are Weil `ℓ`-numbers
of weight `w`), and such that its composite with `G → Aut_(ℚ_p)(E_et)` is the Galois action on `E_et`.
Prove that there is a finite set of bifiltered coefficient Frobenius objects `(V₀, φ₀, F₀, f₀)` (§5.5),
depending only on `ρ₀`, in which `(V₀, φ₀, F₀)` is the filtered φ-module of the restriction of `ρ₀` to
`Gal(ℚ̄_p/ℚ_p)` (§2.6) and `F₀` is balanced relative to `P_(f₀)` (§5.3), with the following property.
For every continuous `ρ : G_ℚ → G(ℚ_p)`, crystalline at `p`, with the same composite to
`Aut_(ℚ_p)(E_et)` and with a G-semisimplification (§2.3) that is `G(ℚ_p)`-conjugate to `ρ₀`, there are a
φ-stable auxiliary filtration `f` on the filtered φ-module `(V, φ, F)` of the restriction of `ρ` to
`Gal(ℚ̄_p/ℚ_p)` and a tensor isomorphism between the `D_cris` fibre functors of `ρ` and `ρ₀` on
`Rep(G)` that carries the graded type of `(V, φ, F, f)` to that of one of them. The finiteness concerns
types, which record the auxiliary filtration only through its parabolic, not flags or extensions (LS,
Lemma 8.10, pp. 78–79, whose final step applies LS, Lemma 8.7, under the purity hypothesis of LS,
Lemma 8.1; see Source corrections).

A route: a G-semisimplification of `ρ` is its Levi projection for a Richardson parabolic `P` defined
over `ℚ_p` (§2.3), so after conjugation `ρ` lands in `P(ℚ_p)` with Levi projection `ρ₀`; §2.10, applied
to the Zariski closure of the image of `ρ₀`, leaves finitely many allowable parabolic and Levi pairs up
to its centralizer, which fixes `ρ₀`. By §2.11 the map `H¹(ℚ_p, P) → H¹(ℚ_p, L)` is bijective, so the
`D_cris` fibre functors of `ρ` and `ρ₀`, whose torsors have the same image in `H¹(ℚ_p, L)`, are tensor
isomorphic compatibly with `P` (LS line 3572); §5.4 applied to `ρ₀`, whose image lies in
`L(ℚ_p) ⊂ P(ℚ_p)`, gives balance; unipotent conjugacy and §5.7 compare different splittings without
changing the type.

**Checks.**

- Infinitely many auxiliary indexings of one flag give one type.
- For `ρ₀` G-irreducible over `ℚ_p` (in no proper Richardson parabolic defined over `ℚ_p`), the minimal
  Richardson parabolic of every `ρ` in the statement is `G`, so `ρ` is `G(ℚ_p)`-conjugate to `ρ₀`; one
  object, with trivial auxiliary filtration, suffices, and it is balanced because `P = G` gives `M = G`.
- A fixed `ρ₀` can have infinitely many nonisomorphic extensions; they share finitely many types.
- Purity is needed. For `G = GL₂`, `p` odd and `ρ₀ = ℚ_p ⊕ ℚ_p(−1)` (Weil weights 0 and 2), the Kummer
  extension of `ℚ_p(−1)` by `ℚ_p` attached to `2`, a `p`-adic unit (so it is crystalline at `p`), is
  nonsplit with the single Galois-stable line `ℚ_p ⊂ V`; its graded de Rham degrees are `0` on the line
  and `1` on the quotient, against the average `1/2` of `V`, so it is not balanced. The hypothesis of one
  weight `w` excludes this `ρ₀`.
- The group is `G_ℚ`. For `y² = x³ − x`, with complex multiplication by `ℤ[i]`, and `p ≡ 1 mod 4`, its
  `H¹` restricted to `G_(ℚ(i))` is the sum of two characters of Weil weight 1, and at a place above `p`,
  whose completion is `ℚ_p`, they have Hodge–Tate weights `0` and `−1`, not `−1/2`: the Hodge filtration
  is not balanced relative to the Borel of either character line, so the balance that §5.4 gives for every
  Galois-stable flag, and on which the balance of `F₀` rests, fails over `ℚ(i)`.

*Needs:* §§2.1, 2.3, 2.6, 2.10–2.11, 5.3–5.5, 5.7.

### 5.9 Root pairing for opposite flag directions

Fix positive roots `Σ⁺` and standard parabolics `P, Q` containing the positive Borel; let `Σ_P, Σ_Q` be
their full root sets and `Δ_P, Δ_Q` the simple roots of their Levis. For `w` in the Weyl group with
`w⁻¹Δ_P ⊂ Σ⁺` and `wΔ_Q ⊂ Σ⁺`, prove that `β ↦ −wβ` is a bijection from `{β ∈ Σ ∖ Σ_Q : wβ > 0}` onto
`{α ∈ Σ ∖ Σ_P : w⁻¹α > 0}` with inverse `α ↦ −w⁻¹α`, that each set has `ℓ(w)` elements, and that for
`β ∈ Σ ∖ Σ_Q`, `wβ > 0` holds exactly when `−wβ ∉ Σ_P`, and symmetrically with `P, Q, w⁻¹` (LV, Lemma 11.4
and (11.14), pp. 991–993; LS, proof of Lemma 8.12, pp. 79–80; the inverse map carries the minus sign, see
Source corrections).

A route: `Σ ∖ Σ_Q` consists of negative roots outside the Levi of `Q`. If `β` is in the first set and
`wβ` were a positive root of the Levi of `P`, then `β = w⁻¹(wβ) > 0` because `w⁻¹Δ_P ⊂ Σ⁺`, a
contradiction; so `−wβ ∉ Σ_P` and `w⁻¹(−wβ) = −β > 0`. The first set is `−` the set of inversions of
`w`, all of which lie outside the Levi of `Q` since `wΔ_Q ⊂ Σ⁺`; hence its size is `ℓ(w)`.

**Checks.**

- In `SL₂` with `P = Q = B` and `w = s`: `Σ ∖ Σ_B = {−α}`, `s(−α) = α > 0`, so both sets are `{−α}`
  and `−s(−α) = −α`; dropping the minus sign would send `−α` to `α ∈ Σ_B`, outside the target.
- In `SL₃` with `P = Q = B` and `w` a 3-cycle, both sets have two elements and `w ≠ w⁻¹`, so the forward
  map `−w` and the inverse `−w⁻¹` cannot be interchanged.
- For `w = 1` both sets are empty, matching `ℓ(1) = 0`.

*Needs:* ReductiveGroups Layer 7.

### 5.10 Semibalanced fixed-graded fibre bound

Let `G = H^c` over an algebraically closed field of characteristic zero, with `H` connected reductive of
rank `t`, and let `F₀` have uniform single-factor adjoint profile `h`, with `A` and `B` as in §2.7. For an
integer `e > 0` assume `A ≥ e/c` and `B > T(e/c) + T((h⁰ − t)/2 + e/c)`, both arguments of `T` lying in
`[0, dim H]`. Prove that for every parabolic `P` and every prescribed induced Levi filtration, the
semibalanced filtrations in the orbit `G·F₀` with that induced filtration form a locus of codimension at
least `e`. In the single connected group case (`c = 1`) the stronger hypotheses `A ≥ e` and
`B > T(e) + T(h⁰/2 + e)` give codimension strictly greater than `e` for weakly balanced filtrations, in
particular for balanced ones (LS, Lemma 8.12 and proof, pp. 79–80, LS line 3605; LV, Proposition 11.3,
pp. 990–993, whose proof uses only the vanishing (11.14) of the modular character, LV lines 3740–3749).

A route: stratify by the finitely many `P–Q` double cosets and compute the dimension of each fibre;
semibalance is a nonpositive modular sum, whose root contributions are paired by §5.9; the largest `e/c`
root weights and the central zero-weight correction cost at most the two displayed top sums, and a
stratum of codimension below `e` would violate the strict inequality.

**Checks.**

- The zero-weight correction is `(h⁰ − t)/2` in LS and `h⁰/2` in the weaker LV bound.
- The dimension conclusion is `≥ e`, while the numerical hypothesis is strict; the two are tracked
  separately.
- For `H = GL₂`, weights `(1, 0)`: `h = (h^(−1), h⁰, h¹) = (1, 2, 1)`, `t = 2`, `A = B = 1`; with `c = 1`
  and `e = 1` the right side is `T(1) + T(0 + 1) = 2`, and `B = 1` is not larger, so the hypothesis
  fails, as it must on a one-dimensional flag variety.

*Needs:* §§2.7–2.8, 5.2–5.3, 5.9.

### 5.11 Dimension of Frobenius-stable graded pairs

In the setting of §2.1, fix a semisimple `φ` in the semilinear coefficient normalizer `G`. Prove that the
pairs `(P, F_M)` with `φ ∈ P` and a prescribed conjugacy class of quotient filtered Frobenius data form
finitely many orbits of `Z_G(φ)`, so their dimension is at most `dim Z_G(φ)`; for arbitrary `φ`, replacing
`φ` by its semisimple part `φ^ss` and using §5.7 gives the bound `dim Z_G(φ^ss)`, and cyclewise §2.2
bounds the cost by `dim H` (LS, Lemma 8.15, p. 81; LV, §11.6, pp. 993–994).

**Checks.**

- Replacing `φ` by `φ^ss` can enlarge the centralizer, so the bound remains valid.
- For `φ` regular semisimple in `GL_n` the pairs with `P` a Borel containing `φ` are the `n!` Borels
  through its torus, a finite set of dimension `0 ≤ n = dim Z(φ)`.
- The bound is in terms of the dimension of the acting centralizer, not the number of its points.

*Needs:* §§2.1–2.2, 2.10, 5.5, 5.7.

### 5.12 Fixed-type codimension under balanced monodromy

In the setting of §2.1, let the coefficient system have uniform single-factor profile `h` on `H`, with
`t = rank H`, strongly c-balanced monodromy and a balanced reference graded type. For an integer `e > 0` assume
`A ≥ (e + dim H)/c` and `B > T((e + dim H)/c) + T((h⁰ − t)/2 + (e + dim H)/c)`, with arguments in
`[0, dim H]`. Prove that in the monodromy period orbit the locus admitting a φ-stable auxiliary
filtration of that graded type has codimension at least `e` (LS, Lemma 8.16, pp. 81–83; LS line 3722).

A route: balance makes the total modular weight zero, so some Frobenius cycle has nonpositive average
modular weight; choose `c` independent class representatives in it and project smoothly to their flag
product; apply §5.10 with parameter `e + dim H`, and let the graded pairs vary at cost at most `dim H` by
§5.11.

**Checks.**

- Both inequalities use the single-factor `T_H`, not a `T` for the restriction-of-scalars group.
- Letting `c → ∞` with the profile fixed, the hypotheses tend to `A > 0` and
  `B > T((h⁰ − t)/2)`, which is §8.5's starting point.
- For `c = 1` the hypothesis contains the parameter `e + dim H`, larger than LV's `e + z`, because the
  centralizer bound is the cruder `dim H`.

*Needs:* §§2.1, 2.8, 4.2, 5.5, 5.10–5.11.

### Examples

For a `2 + 2 + 2` auxiliary flag in `GL₆` and a three-dimensional `F¹` contributing `(a₀, a₁, a₂)` to the
top, middle and bottom blocks, with `Σ a_i = 3` and each `a_i ≤ 2`, balance and weak balance both
mean `(1, 1, 1)` and semibalance is `a₀ ≤ a₂`; the generic pattern `(2, 1, 0)` fails semibalance (LS,
Example 8.6, pp. 75–76). In a `4 + 4 + 4` flag with `dim F¹ = 6` the weakly balanced `(1, 4, 1)` is not
balanced. Conjugation by `diag(2, 1)` multiplies an upper root group by 2, which is why the cyclic
argument of §5.7 is restricted to `Z_U(φ^r)`.

### Dependencies

Layers 2 and 4; MordellLawrenceVenkatesh §§1.10, 1.13; DeligneWeightsAndPurity §0.1; ReductiveGroups
Layers 4–7.

## Layer 6: The coefficient non-density theorem

This layer combines global-type finiteness, balanced local types, strongly balanced monodromy and the
p-adic transfer into non-density of all integral points under the two single-factor inequalities.

### 6.1 The coefficient non-density theorem

Let `𝒳` be smooth of finite type over `ℤ[S⁻¹]` with geometrically connected generic fibre `X` of
dimension `d ≥ 1`. Let `E` be a nonzero constant étale H⁰-algebra on `𝒳` (§§0.4, 1.1), let `H` be
`GL_N`, `GSp_N` or `GO_N`, and let `V` be a pure polarized integral Hodge–Deligne system on `𝒳` with
integral Frobenius (§0.2) and Frobenius characteristic polynomials with integer coefficients outside
`S`, which is an equidimensional `E`-module of rank `N > 0` with an `H`-structure (§§1.4–1.5). Let `G`
be the semilinear coefficient normalizer of §2.1 that `E`, `H` and `N` define in each realization (over
`ℚ_p` in the étale one). Assume that the Hodge filtration is uniform with single-factor adjoint profile
`h` on `H` (§§2.7–2.8), that the differential monodromy is strongly c-balanced relative to residue
Frobenius for an integer `c ≥ 1` (§4.2), and, with `t = rank H` (the dimension of a maximal torus),

    A ≥ (d + dim H)/c   and   B > T((d + dim H)/c) + T((h⁰ − t)/2 + (d + dim H)/c),

all arguments of `T` lying in `[0, dim H]`. Prove that `𝒳(ℤ[S⁻¹])` is not Zariski dense in `X`. No
semisimplicity hypothesis is imposed on the Galois representations of the fibres (LS, Theorem 8.17,
pp. 83–84; LS line 3812).

A route: §2.9 gives finitely many global G-semisimplifications; in each class that occurs, take for `ρ₀`
the G-semisimplification of the representation of an integral point: Levi projection keeps it
crystalline at `p` (its standard representation is a sum of subquotients), keeps the Frobenius
characteristic polynomials and hence purity, and keeps the composite to `Aut_(ℚ_p)(E_et)`, which is
trivial on `G°`. For each residue disk and each such `ρ₀`, §5.8 gives finitely many balanced local graded
types; §5.12 with `e = d` bounds the codimension of each incidence locus, and §3.4 turns it into a proper
Zariski-closed subset; the integral points lie in the finite union.

**Checks.**

- A fixed semisimplification can have infinitely many nonsplit extension classes; the finite objects
  are the global semisimplifications and their local graded types, not the representations.
- With `c` fixed and `dim H` large relative to `A`, the first inequality fails; the theorem says
  nothing, consistently with the cost `dim H` of a semilinear centralizer.
- For `d = 0` the conclusion is false and the hypothesis `d ≥ 1` excludes it.

*Needs:* §§0.2, 0.4, 1.1, 1.4–1.5, 1.9, 2.1, 2.3, 2.7–2.9, 3.4, 4.2, 5.8, 5.12.

### Examples

For a nonsplit integral Galois representation with fixed semisimplification there can be infinitely
many extension classes; recording the auxiliary filtration only through its parabolic, they have
finitely many local graded types, which is what the codimension estimate consumes.

### Dependencies

Layers 0–5.

## Layer 7: Higher-dimensional Lawrence–Venkatesh non-density

This layer compares crystalline and forgetful fibre functors, places the Hodge torus in the Galois
image, chooses a uniformly bounded prime with small Frobenius centralizer and applies the self-dual
bad-filtration estimate. It proves Lawrence–Venkatesh Theorem 10.1 with its finiteness clause and the
corrected point-count bound.

### 7.1 Comparing crystalline and forgetful fibre functors

Let `K` be a finite unramified extension of `ℚ_p` and `V` a crystalline representation of `Gal(K̄/K)`
on a finite-dimensional `ℚ_p`-vector space, with its intersection and similitude tensors; on the neutral
`ℚ_p`-linear tensor category that `V` generates, `D_cris` is a fibre functor with values in `K`-vector
spaces (`K₀ = K` because `K` is unramified). Prove that the forgetful fibre functor, extended to `K`, and
`D_cris` become tensor-isomorphic over `ℚ̄_p`, after an embedding `K → ℚ̄_p`; such an isomorphism
identifies their Tannaka groups by conjugation and preserves every pairing tensor. This is existence over
an algebraic closure, not a canonical rational comparison. The Frobenius plays no part: the comparison is
of the underlying fibre functors, so its semilinearity over `K` does not matter here, unlike in §2.6 (LV,
footnote 11, printed p. 977, and LS, Lemma 5.43 and proof, pp. 58–60, both for `K = ℚ_p`).

A route: MotivesAndAlgebraicCycles §6.8, with `R = K`, makes the tensor isomorphisms a faithfully flat
torsor over `K`, finitely presented because the category has a tensor generator (§6.3 there); a nonempty
scheme of finite type over `K` has a point over `ℚ̄_p`, an algebraic closure of `K`, which transports all
intersection and multiplier tensors.

**Checks.**

- An arbitrary linear isomorphism of the two underlying spaces need not respect the forms.
- For `V = ℚ_p(1)` the generated category is `Rep(𝔾_m)`, the torsor is a `𝔾_m`-torsor over `K`, and it is
  trivial since `H¹(K, 𝔾_m) = 0`; the two fibre functors are already isomorphic over `K`.
- For a torsor without `K`-rational point (a nonsplit inner form of `PGL₂`), no `K`-rational comparison
  exists, but a `ℚ̄_p`-point does.
- For `K = ℚ_(p²)` and the trivial representation `V = ℚ_p`, the forgetful fibre extended to `K` is `K`
  and `D_cris(V) = K`, with `φ = σ` semilinear; the torsor over `K` is trivial and both fibres become
  `ℚ̄_p`. The Frobenius, which forbids this field in §2.6, does not enter the comparison.

*Needs:* §2.6; MotivesAndAlgebraicCycles §§6.3, 6.8; PadicHodgeTheory §§3.5, 5.5.

### 7.2 The Hodge torus in the Galois image

For primitive middle cohomology of a smooth projective variety over a finite unramified extension of
`ℚ_p` with good reduction, prove that the Zariski closure of the image of the local Galois representation
contains a torus conjugate over `ℚ̄_p`, inside the similitude group of the intersection pairing, to the
image of the Hodge cocharacter transported by §7.1 (LV, proof of Lemma 10.4 and footnote 11, printed
pp. 976–978).

A route: by gap:hodge-tate-image-cocharacter the Zariski closure of the image contains, over `C_p`, a
cocharacter whose weights on `V` are the Hodge–Tate weights; every maximal torus of the identity
component over `C_p` is conjugate to the base change of one defined over `ℚ̄_p`, so the closure contains
over `ℚ̄_p` a cocharacter with the same weights, whose inverse has the de Rham jumps as weights
(Conventions, Hodge–Tate signs). The intersection pairing is Galois-equivariant with values in a Tate
twist, so the closure lies in the similitude group, and §7.1 carries a Hodge cocharacter of `D_dR(V)`
in the similitude group of the de Rham pairing to a cocharacter of the similitude group of `V ⊗ ℚ̄_p`
with the same weights. In the full similitude group of a nondegenerate symmetric or alternating form
over an algebraically closed field, two cocharacters with the same weights on `V` are conjugate by an
isometry: for multiplier weight `w` the weight spaces for `k` and `w − k` are dually paired, the
weight-`w/2` space is nondegenerate, and Witt's theorem matches the two decompositions. §2.3 shows that
Levi projection preserves the conjugacy class.

**Checks.**

- In the connected group `GSO₄` of the split symmetric form pairing `e₁` with `e₄` and `e₂` with `e₃`,
  the cocharacters `t ↦ diag(t, 1, t, 1)` and `t ↦ diag(t, t, 1, 1)` both have multiplier `t` and
  weights `1, 1, 0, 0` on `V`, but their weight-one planes `⟨e₁, e₃⟩` and `⟨e₁, e₂⟩` are isotropic planes
  meeting in a line, hence in different rulings, so they are not `GSO₄`-conjugate; the isometry
  exchanging `e₂` and `e₃`, of determinant `−1`, conjugates them in `GO₄`. Comparing weights decides
  conjugacy only in the similitude group with both components (Conventions, Groups).
- For `H¹` of an elliptic curve with good ordinary reduction the local representation is an extension
  of a character of Hodge–Tate weight `−1` by an unramified character (Hodge–Tate weight `0`); the de
  Rham Hodge cocharacter is `t ↦ diag(t, 1)` in a basis whose first vector spans `F¹`, and its image,
  the torus `{diag(s, 1)}`, is `GL₂`-conjugate to `{diag(1, s)}`, a unipotent conjugate of which lies
  in the Zariski closure of the image of inertia (inertia acts by `[[1, *], [0, χ_cyc⁻¹]]` in a basis
  adapted to the unramified line). The singular matrix `diag(1, 0)` is not a cocharacter.
- For a Tate twist `ℚ_p(−1)` the de Rham jump is `+1`, the Hodge cocharacter is the identity of `𝔾_m`,
  and the Galois image `χ_cyc⁻¹(G_(ℚ_p)) = ℤ_p^×` is Zariski dense in `𝔾_m`. The image of a cocharacter
  does not see its sign, so the Hodge–Tate cocharacter `t ↦ t⁻¹` gives the same torus.

*Needs:* §§2.3, 7.1; PadicHodgeTheory §4.4 with gap:hodge-tate-image-cocharacter.

### 7.3 A bounded prime with small Frobenius centralizer

Let `𝒴` be smooth of finite type over `ℤ[S⁻¹]` with geometrically connected generic fibre `Y/ℚ`, and let
`π : 𝒵 → 𝒴` be smooth projective with geometrically connected fibres of relative dimension `r` and a
relatively ample class; let `V` be its primitive degree-`r` cohomology with the intersection pairing,
`GAut = GAut(V, ⟨ , ⟩)` its similitude group and `h` the adjoint profile of the Hodge filtration in
`GAut` (§2.7), the same at every point of `Y(ℂ)` because `Y` is geometrically connected. Prove that there
is `L` such that every integral point `y ∈ 𝒴(ℤ[S⁻¹])` admits a prime `ℓ ≤ L` outside `S` with
`dim Z_GAut((φ_crys,ℓ)^ss) ≤ h⁰`, where `φ_crys,ℓ` is the crystalline Frobenius of the fibre at `y`
reduced modulo `ℓ`, on its primitive degree-`r` crystalline cohomology. An auxiliary prime `p` outside
`S`, large enough for the Fontaine–Laffaille range, is fixed first. The bound is uniform in the integral
point and is not an effective formula for `L` (LV, Lemma 10.4, statement printed p. 975, proof
pp. 976–978).

A route: by MordellLawrenceVenkatesh §1.2 the auxiliary `p`-adic representations have finitely many
semisimplifications. In each reductive image choose a very regular open subset avoiding the finitely many
nontrivial root-weight equalities; Chebotarev supplies one prime per class. The Hodge torus of §7.2 in the
image bounds the centralizer dimension by `h⁰`. Katz–Messing equality of characteristic polynomials, with
similitude multiplier `ℓ^r` (eigenvalues pair as `λ ↔ ℓ^r/λ`), transfers the bound to crystalline
cohomology at `ℓ`.

**Checks.**

- For middle degree `r = 2` an eigenvalue `λ` pairs with `ℓ²/λ`; using `ℓ/λ` gives the wrong form-group
  centralizer.
- Equal characteristic polynomials determine the geometric centralizer dimension in the classical form
  group; no rational conjugacy is asserted.
- For a regular semisimple Frobenius in `GSp_(2g)` the centralizer is a maximal torus of dimension
  `g + 1`.

*Needs:* §7.2; MordellLawrenceVenkatesh §1.2; PadicHodgeTheory §6.1; PadicDifferentialEquationsAndRigidCohomology
§RD.7.7; DeligneWeightsAndPurity §§0.7, 0.16, 4.3; Chebotarev Layer 10.

### 7.4 Bad self-dual filtrations have large codimension

For a classical similitude space `V` of middle degree `r`, a Frobenius `φ` and prescribed filtered
Frobenius graded objects of a φ-stable self-dual auxiliary flag, put `z = dim Z_GAut(φ^ss)`, require every
nonzero graded object to have average descending de Rham degree `r/2`, and let `e > 0`. Prove that if `A ≥ z + e` and
`B > T(z + e) + T(h⁰/2 + z + e)`, with arguments in `[0, dim GAut]`, then the self-dual Hodge filtrations
admitting such a flag have codimension at least `e` in their flag variety. Self-dual middle pieces keep
their pairing tensor (LV, Proposition 10.6, printed pp. 981–982, with the conclusion in §11.6, printed
pp. 993–994).

A route: reduce to semisimple `φ`, which only enlarges the incidence locus; stratify by the finitely many
conjugacy types of self-dual flags; graded pairs vary at cost at most `z` (§5.11); the average `r/2` on
every graded block makes the filtration balanced in `GAut` and hence weakly balanced in `GAut°` (§5.3),
so the connected estimate of §5.10 for weakly balanced filtrations applies with parameter `z + e`;
project to the Hodge flag variety.

**Checks.**

- The published first inequality is `A ≥ z + e` (non-strict); the arXiv v3 text has a stricter form
  that is not needed.
- For `z + e > A` the hypothesis fails and nothing is claimed.
- A graded object with average weight different from `r/2` is excluded; §7.5 supplies the average by
  global purity.

*Needs:* §§5.3–5.5, 5.10–5.11.

### 7.5 Classical semisimplification fibres are nondense

In the setting of §7.3, let `Y` have dimension `d ≥ 1`, assume that the Zariski closure of the geometric
monodromy of `V` contains `Aut(V, ⟨ , ⟩)°`, and assume `A ≥ h⁰ + d` and
`B > T(h⁰ + d) + T(3h⁰/2 + d)`. Fix a prime `ℓ ∉ S`, a point `y₀ ∈ 𝒴(ℤ[S⁻¹])` with
`dim Z_GAut((φ_crys,ℓ)^ss) ≤ h⁰` at `y₀`, and a GAut-semisimplification `ρ₀` (§2.3) of the global ℓ-adic
representation `G_ℚ → GAut(ℚ_ℓ)` of `y₀`. Prove that the set of `y ∈ 𝒴(ℤ[S⁻¹])` congruent to `y₀`
modulo `ℓ` whose global ℓ-adic representation has a GAut-semisimplification `GAut(ℚ_ℓ)`-conjugate to
`ρ₀` is not Zariski dense in `Y`. Global semisimplification flags are self-dual after pairing dual
constituents, and every graded piece has average descending de Rham degree `r/2` by §5.4 (LV, Lemma
10.5, statement printed p. 975, proof pp. 979–981, under the monodromy hypothesis (10.1) of LV, printed
p. 968).

A route: construct paired self-dual semisimplification flags, transport their graded data through
`D_cris`, use the small centralizer and §7.4 with `e = d`, and apply §3.4 on the disk. The monodromy
hypothesis makes the connected period orbit `D_mon` of §3.1 a connected component of the variety of
self-dual filtrations with the dimension data of the Hodge filtration: `G_mon` is the Zariski closure
of monodromy (§0.6), so `G_mon°` lies between `Aut(V, ⟨ , ⟩)°` and
`GAut(V, ⟨ , ⟩)° = 𝔾_m·Aut(V, ⟨ , ⟩)°`; scalars fix every filtration; and that variety is one
`Aut(V, ⟨ , ⟩)`-orbit whose components are the `Aut(V, ⟨ , ⟩)°`-orbits. So the codimension of §7.4 is a
codimension in `D_mon`, as §3.4 requires. The inequalities give those of §7.4 with `z ≤ h⁰` and `e = d`,
since `T` is nondecreasing on `[0, A + h⁰]` and `3h⁰/2 + d ≤ A + h⁰`.

**Checks.**

- The representations of the points may be nonsplit; only their semisimplifications are fixed.
- The self-duality of the flag comes from the polarization, not from semisimplicity.
- For an irreducible semisimplification the flag is trivial and §7.4 reduces to §4.4.
- The monodromy hypothesis is needed. For the constant family `𝒵₀ × 𝔸¹ → 𝔸¹`, with `𝒵₀` smooth projective
  over `ℤ[S⁻¹]`, the geometric monodromy is trivial and `D_mon` is a point, while `A ≥ 1` puts a nonzero
  positive part in `Lie GAut`, so `Aut(V, ⟨ , ⟩)°` has positive dimension and the hypothesis fails.
  Without it the conclusion would be false: every `y ≡ y₀` modulo `ℓ` has the fibre and the
  representation of `y₀`, and `y₀ + ℓℤ[S⁻¹]` is infinite, hence Zariski dense in `𝔸¹`, whatever the
  Hodge numbers of `𝒵₀`, on which alone (with `d = 1`) the two inequalities depend; a smooth
  hypersurface of large dimension and degree (§8.9) satisfies them, and §7.3 supplies `ℓ` at `y₀`.

*Needs:* §§0.6, 2.3, 3.1, 3.4, 5.4, 7.3–7.4; PadicHodgeTheory §§3.5, 8.1.

### 7.6 Higher-dimensional integral-point non-density

Let `𝒴` be smooth of finite type over `ℤ[S⁻¹]` with smooth geometrically connected generic fibre `Y/ℚ` of
dimension `d ≥ 1`, and let `π : 𝒵 → 𝒴` be smooth projective with geometrically connected fibres of
relative dimension `r` and a relatively ample class. Let `V` be primitive degree-`r` cohomology with its
intersection pairing, and assume that the Zariski closure of geometric monodromy contains
`Aut(V, ⟨ , ⟩)°`. Compute the adjoint profile in the similitude group `GAut(V, ⟨ , ⟩)` and assume

    A ≥ h⁰ + d   and   B > T(h⁰ + d) + T(3h⁰/2 + d),

with arguments in the domain of `T`. Prove that `𝒴(ℤ[S⁻¹])` is not Zariski dense in `Y` (LV, Theorem 10.1,
printed pp. 969–970, monodromy hypothesis (10.1), printed p. 968; proofs §§10.3–10.5, printed
pp. 974–982).

A route: §7.3 gives finitely many possible small-centralizer primes; for each, §2.9 over `K = ℚ`, with
`E = E₀ = ℚ_ℓ` so that the normalizer is `GAut` (the Frobenius polynomials lie in `ℤ[t]` with roots of
weight `r`, DeligneWeightsAndPurity §§4.3–4.4), leaves finitely many `GAut(ℚ_ℓ)`-classes of
semisimplifications, and there are finitely many residue disks; §7.5 applies to each and a finite union
concludes.

**Checks.**

- For an elliptic family the geometric monodromy may be `Sp₂ = SL₂` while the similitude group is
  `GSp₂ = GL₂`; the hypothesis must not ask for the scalar direction.
- `A ≥ h⁰ + d` and `T` is nondecreasing on `[0, A + h⁰]`, so both arguments of `T` lie where `T` is
  nondecreasing (`3h⁰/2 + d ≤ A + h⁰`).
- The non-density conclusion does not need monodromy on subvarieties; §7.7 does.

*Needs:* §§2.7, 2.9, 7.3, 7.5; DeligneWeightsAndPurity §§4.3–4.4.

### 7.7 Finiteness under monodromy on every subvariety

In the setting of §7.6, assume in addition that for every positive-dimensional closed geometrically
irreducible subvariety `Z ⊂ Y` the restriction of `V` to the smooth locus of `Z` has geometric monodromy
whose Zariski closure contains `Aut(V, ⟨ , ⟩)°`. Prove that `𝒴(ℤ[S⁻¹])` is finite (LV, Theorem 10.1, final
assertion, printed p. 970).

A route: let `C` be an irreducible component of positive dimension of the Zariski closure of the integral
points. It contains a Zariski-dense set of ℚ-points, so it is geometrically irreducible (the Galois
conjugates of a geometric component through a dense set of rational points coincide). A resolution
`C̃ → C` that is an isomorphism over the smooth locus `U` (AlgebraicModuliForArithmeticGeometry §9.4),
spread out over `ℤ[S′⁻¹]` for a finite set `S′ ⊇ S` of primes (SchemeAndStackFoundations §0.9), gives a
smooth geometrically connected base; integral points of `𝒴` lying in `U` lift to integral points of the
model of `C̃` by the valuative criterion, and they are dense in `C̃`. The pulled-back family has the monodromy of `U`, since `π₁(U) → π₁(C̃)` is
surjective. The inequalities of §7.6 for `d` imply those for `dim C ≤ d`, because both arguments of `T`
stay in `[0, A + h⁰]`, where `T` is nondecreasing. §7.6 on `C̃` contradicts density; so every component is
a point.

**Checks.**

- A family with a positive-dimensional isotrivial subvariety violates the hypothesis.
- A component containing a dense set of rational points is defined over ℚ; components defined only over
  a larger number field cannot occur in the closure of rational points as dense components.
- For `Y` a curve the hypothesis on subvarieties is the hypothesis of §7.6 and the conclusion upgrades
  non-density to finiteness directly.

*Needs:* §7.6; AlgebraicModuliForArithmeticGeometry §9.4; SchemeAndStackFoundations §0.9.

### 7.8 A point-count bound for Frobenius centralizers

For a smooth hypersurface `Y` of dimension `m ≥ 2` over `𝔽_q`, let `b > 0` be the dimension of primitive
middle cohomology. Prove that for every integer `M ≥ 1` with `q^((m/2+1)·2M) < b/3`, the centralizer in
`GL_b` of the semisimplified Frobenius on `H^m_prim` has dimension at most `3b²/M`; the largest such `M`,
when one exists, gives the strongest bound. The statement is independent of §7.3 (LV, Lemma 12.1 and
proof, printed pp. 995–996, with the corrected cutoff of Source corrections).

A route: normalize the Frobenius eigenvalues to `q^(m/2)·e(θ_s)` by DeligneWeightsAndPurity §4.3; the
centralizer dimension is `Σ m_i²` over eigenvalue multiplicities. With
`g_M(t) = |Σ_(|j|≤M) e(jt)|² = Σ_(|j|≤2M) (2M + 1 − |j|) e(jt)`, the inequality
`∫|∫ g_M(t − θ) dμ(θ)|² dt ≥ dim Z·‖g_M‖²` bounds `dim Z` by weighted power sums. The point count
`#Y(𝔽_(q^j)) = Σ_(i≤m) q^(ij) + (−1)^m q^(mj/2) Σ_s e(jθ_s)` (WeilConjectures Layer WC.5,
EtaleDualityAndPerverseSheaves §4.3) and `0 ≤ #Y(𝔽_(q^j)) ≤ #ℙ^(m+1)(𝔽_(q^j))` give
`|Σ_s e(jθ_s)| ≤ q^((m/2+1)j)`. Since the kernel has frequencies up to `2M`, the bound is needed through
`j = 2M`; with `q^(m/2+1) ≥ 4` the geometric series gives the constant 3, and
`(2M + 1)²/‖g_M‖² ≤ 3/(4M)`.

**Checks.**

- `M = 0` is excluded.
- For `M = 1` the kernel has frequencies `−2, …, 2` with coefficients `1, 2, 3, 2, 1`; a cutoff at
  frequency 1 does not control the frequency-2 term.
- `‖g_1‖² = 3² + 2(1² + 2²) = 19`, and `9/19 ≤ 3/4`.

*Needs:* DeligneWeightsAndPurity §§0.10, 4.3; WeilConjectures Layer WC.5; EtaleDualityAndPerverseSheaves
§4.3.

### Examples

For middle degree `r = 2` a Frobenius eigenvalue `λ` pairs with `ℓ²/λ`; pairing with `ℓ/λ` gives the
wrong centralizer. In the point-count bound, `M = 1` already produces frequencies `−2, …, 2`, so a cutoff
at frequency 1 cannot prove the stated estimate.

### Dependencies

Layers 0 and 2–5; MotivesAndAlgebraicCycles §§6.3, 6.8; PadicHodgeTheory §§3.5, 4.4, 5.5, 6.1, 8.1;
PadicDifferentialEquationsAndRigidCohomology §RD.7.7; DeligneWeightsAndPurity §§0.7, 0.10, 0.16, 4.3–4.4;
WeilConjectures Layer WC.5; EtaleDualityAndPerverseSheaves §4.3; AlgebraicModuliForArithmeticGeometry
§9.4; SchemeAndStackFoundations §0.9; MordellLawrenceVenkatesh §1.2; Chebotarev Layer 10.

## Layer 8: Eulerian profiles and numerical criteria

This layer computes the classical adjoint profiles of twisted abelian hypersurfaces and shows that
enough independent factors satisfy the coefficient inequalities; it derives the primitive Hodge numbers
of projective hypersurfaces, their Eulerian asymptotics and the large-dimension, large-degree
Lawrence–Venkatesh inequalities. Throughout, `A(n, q)` is the Eulerian number of
ClassicalArithmeticCompletion §2.18, the number of permutations of `Fin n` with `q` descents, defined for
all `n, q ∈ ℕ`; `Suggested.lean` restates it as `eulerian`. For `n ≥ 1` it vanishes outside `0 ≤ q < n`,
while for `n = 0` the empty permutation gives `A(0, 0) = 1` and `A(0, q) = 0` for `q ≥ 1`. Every
statement of this layer has `n ≥ 2`, where the two descriptions agree.

### 8.1 Classical adjoint profiles from Eulerian multiplicities

For smooth ample hypersurfaces in an abelian variety of dimension `n ≥ 2` with normalized degree `d > 0`,
take the multiplicities `m_q = d·A(n, q)` of descending de Rham degree `q` (Hodge–Tate weight `−q`),
`0 ≤ q < n`, and `N = n!·d` of
SheafConvolutionOnAbelianVarieties §3.3. The adjoint weights of `GL_N`, `GSp_N` and `GO_N` come from
`End(V)`, `Sym²(V)` and `Λ²(V)`, with the similitude direction in degree zero. Prove that for the
geometric choices — `GL` in either parity, `GSp` for `n` even, `GO` for `n` odd — `2h⁰ < dim H + rank H`;
equivalently `(h⁰ − rank H)/2 < A` (LS, Lemma A.1, pp. 89–90, LS line 4076, with the parity restriction of
Source corrections).

A route: `h⁰ = Σ m_q²` for `GL`, `(Σ m_q² + m_mid)/2 + 1` for `GSp` and `(Σ m_q² − m_mid)/2 + 1` for `GO`,
with `m_mid = 0` when there is no central index; with `dim GSp_N = N(N+1)/2 + 1`, `dim GO_N = N(N−1)/2 + 1`
and ranks `N`, `N/2 + 1`, `N/2 + 1`, the inequality reduces to `2Σ_q A(n, q)² ≤ (n!)²` (§8.4) and, for
`GO`, `m_mid > 0`.

**Checks.**

- For `n = 2`, `d = 1`: `m = (1, 1)`, `N = 2`; `GL₂` gives `2·2 = 4 < 6` and `GSp₂` gives `4 < 6`.
- The nongeometric choice `GO₂` with weights `0, 1` has `h⁰ = 2 = dim GO₂ = rank GO₂`, so `4 < 4` fails:
  the parity restriction is necessary.
- For `n = 3`, `d = 1`, `GO₆`: `m = (1, 4, 1)`, `h⁰ = (18 − 4)/2 + 1 = 8`, `dim GO₆ + rank = 16 + 4 = 20`,
  and `16 < 20`.

*Needs:* §§2.7, 8.4; SheafConvolutionOnAbelianVarieties §§3.1, 3.3.

### 8.2 The Eulerian difference law

For `n ≥ 2` put `α_q = A(n, q)/n!`, extended by zero outside `0 ≤ q < n`, and define the **Eulerian
difference law** `β_j = Σ_q α_q α_(q−j)` for `j ∈ ℤ`: the law of the difference of two independent
descent counts (LS, Lemma A.2, p. 91; LV, §10.2, (10.7) and (10.10), printed pp. 971–972). It is the
normalized `GL` adjoint multiplicity profile of §8.1.

API:

- `β_j` is a finite sum, zero for `|j| ≥ n`.
- `β` is nonnegative and sums to one.
- `β_(−j) = β_j`, and `β_j·N²` is the multiplicity of weight `j` in `End(V)` for the profile of §8.1.

**Checks.**

- For `n = 2`: `β₀ = 1/2`, `β_(±1) = 1/4`.
- For `n = 3` with Eulerian row `(1, 4, 1)`: `β₀ = 1/2`, `β_(±1) = 2/9`, `β_(±2) = 1/36`, summing to 1.
- `β_j = 0` for `|j| ≥ n`; an infinitely supported approximation is not the definition.
- Row symmetry (ClassicalArithmeticCompletion §2.39) reflects about `(n − 1)/2`, not about `0`:
  `α_(q−j) = α_(n−1−q+j)`, so `β_j = (α ∗ α)_(n−1+j)` with `(α ∗ α)_k = Σ_q α_q α_(k−q)`. For `n = 2`,
  `j = 0` this gives `α₀α₁ + α₁α₀ = 1/4 + 1/4 = 1/2 = β₀`, whereas replacing `q − j` by `j − q` without
  the shift gives `Σ_q α_q α_(−q) = α₀² = 1/4`.

*Needs:* ClassicalArithmeticCompletion §§2.18, 2.39.

### 8.3 Second moment and log-concavity

Prove that for `n ≥ 2` the Eulerian difference law has mean zero, second moment `Σ_j j² β_j = (n + 1)/6`
and log-concave masses on its contiguous support `−(n − 1) ≤ j ≤ n − 1` (LS, Lemmas A.2–A.3, p. 91,
LS line 4245; LV, (10.9)–(10.10), printed p. 972).

A route: the descent count has variance `(n + 1)/12`, and the difference of two independent copies has
twice that; log-concavity of each row and its preservation under reflection and convolution give
log-concavity of `β`.

**Checks.**

- At `n = 2` the second moment is `2·(1/4) = 1/2 = 3/6`, not `√(1/2)`.
- At `n = 3`: `2·(2/9) + 2·4·(1/36) = 2/3 = 4/6`.
- The descent count of a random permutation of `Fin 2` is Bernoulli `1/2`, of variance `1/4 = 3/12`.

*Needs:* §8.2; ClassicalArithmeticCompletion §§2.18, 2.39 with gap:eulerian-descent-variance, and §2.56
with gap:eulerian-row-log-concavity and gap:log-concave-convolution.

### 8.4 The central Eulerian convolution mass is at most one half

Prove that for every `n ≥ 2`, `β₀ = Σ_q (A(n, q)/n!)² ≤ 1/2`; equivalently `2·Σ_(q<n) A(n, q)² ≤ (n!)²`.
This is `eulerian_central_mass_le_half` (LS, Lemmas A.4–A.6, pp. 91–92, LS lines 4255–4321, with the
corrected tail comparison and denominators of Source corrections).

A route: if `β₀ > 1/2`, symmetry gives `Σ_(j≥1) β_j < 1/4 = Σ_(j≥1) 1/(2·3^j)`; log-concavity and
`β₀ > 1/2` then force every tail `Σ_(j≥k) β_j` below `Σ_(j≥k) 1/(2·3^j)`, since a first crossing below the
reference stays below. Summation by tails, `Σ_j j²β_j = 2Σ_(k≥1)(2k − 1)Σ_(j≥k) β_j`, then gives a second
moment `< 3/2`, contradicting `(n + 1)/6 ≥ 3/2` for `n ≥ 8`. The cases `2 ≤ n ≤ 7` are exact integer
computations.

**Checks.**

- Equality holds at `n = 2` (`2·2 = 4 = 2!²`) and at `n = 3` (`2·18 = 36 = 3!²`).
- At `n = 4`: `2·(1 + 121 + 121 + 1) = 488 ≤ 576`.
- At `n = 1` the inequality `2·1 ≤ 1` fails, so `n ≥ 2` is necessary.
- At `n = 0` the empty permutation and the empty sum differ: `Σ_(q<0) A(0, q)²` is the empty sum `0`,
  so the denominator-free form reads `0 ≤ 1`, whereas `Σ_q A(0, q)² = A(0, 0)² = 1` gives `β₀ = 1 > 1/2`.
  The range `q < n` captures the whole row only for `n ≥ 1`, and the hypothesis `n ≥ 2` keeps `n = 0`
  out of the statement.
- The tail comparison is strict `<`; reversing it gives no contradiction.

*Needs:* §8.3.

### 8.5 Enough independent factors satisfy the coefficient inequalities

For the geometric Eulerian profile of §8.1 and every integer `e > 0`, prove that there is `c₀ ≥ 1` such
that every `c ≥ c₀` satisfies `A ≥ (e + dim H)/c` and
`B > T((e + dim H)/c) + T((h⁰ − rank H)/2 + (e + dim H)/c)`, with arguments in the domain; the same `c`
satisfies the semisimple inequality of §4.4. No bound uniform over all Hodge profiles is claimed (LS,
proof of Theorem 9.2, pp. 85–87, and Lemma A.1, pp. 89–90).

A route: `(h⁰ − rank H)/2 < A` gives `T((h⁰ − rank H)/2) < T(A) = B`, since `T` is strictly increasing on
`[0, A]`; continuity of `T` and `(e + dim H)/c → 0` preserve the strict gap for large `c`.

**Checks.**

- The strict inequality of §8.1 is needed before taking the limit; with equality the gap could close.
- For the `n = 2`, `d = 1`, `GL₂` profile (`h = (1, 2, 1)`, `A = B = 1`, `rank = 2`): `(h⁰ − 2)/2 = 0`,
  `T(0) = 0 < 1`, and `c ≥ 5(e + 4)` works.
- `c₀` depends on `e` and the profile.

*Needs:* §§2.7, 8.1, 8.4.

### 8.6 Primitive Hodge numbers of projective hypersurfaces

For a smooth hypersurface of degree `d ≥ 2` in `ℙⁿ_ℂ`, `n ≥ 2`, prove that the primitive middle Hodge
number `h^(p, n−1−p)_prim` is the coefficient of `t^((p+1)d−n−1)` in `(1 + t + … + t^(d−2))^(n+1)`, for
`0 ≤ p < n` (Batyrev–Cox, Theorems 10.6 and 10.13 and Remark 10.14, PDF pp. 30–34, specialized to
projective space; this justifies LV (10.6), printed pp. 970–971).

A route: Griffiths's residue description (gap:griffiths-residue-hodge-filtration on
ComplexComparisonPartII, with `m = n − 1` and `q = p`) identifies the graded piece of degree
`(p+1)d − n − 1` of the Jacobian ring `ℂ[x₀, …, x_n]/(∂F/∂x_i)` with
`gr_F^(n−1−p) H^(n−1)_prim = H^(n−1−p, p)_prim`, the residue of `AΩ/F^(p+1)` lying in `F^(n−1−p)`
(Batyrev–Cox, Theorem 10.13, PDF p. 34, BC line 1344, gives `H^(p, n−1−p)_prim` in degree
`(n − p)d − n − 1`); Hodge symmetry
`h^(p, n−1−p) = h^(n−1−p, p)`, equivalently the palindromic symmetry of `(1 + t + … + t^(d−2))^(n+1)`
about `(n + 1)(d − 2)/2`, gives the stated formula. Smoothness makes the partial derivatives a
homogeneous regular sequence of degree `d − 1` (Mathlib `RingTheory.Sequence.IsRegular`), so the Hilbert
series is `(1 − t^(d−1))^(n+1)/(1 − t)^(n+1)`. Hodge numbers are those of ComplexComparisonPartII §C5.3.

**Checks.**

- A smooth plane cubic (`n = 2`, `d = 3`): `(1 + t)³` gives `(1, 1)`.
- A quartic surface (`n = 3`, `d = 4`): `(1 + t + t²)⁴ = 1 + 4t + 10t² + 16t³ + 19t⁴ + …` gives primitive
  `(1, 19, 1)`, not the full `(1, 20, 1)`.
- A quadric (`d = 2`): `(1)^(n+1) = 1`, so only `p` with `2(p+1) = n + 1` contributes; for even `n`
  (odd-dimensional quadric) there is no primitive middle cohomology.
- For the quartic surface and `p = 0` the Jacobian degree is `d − n − 1 = 0`, and the residue of `Ω/F`
  is a holomorphic two-form, of type `(2, 0)`, not `(0, 2)`: degree `(p+1)d − n − 1` carries
  `H^(n−1−p, p)`. The degrees `0, 4, 8` give `1, 19, 1`, so the numerical formula is unaffected, but the
  residue map lands in the conjugate Hodge piece.

*Needs:* ComplexComparisonPartII §C5.3 with gap:griffiths-residue-hodge-filtration; Mathlib
`RingTheory.Sequence.IsRegular`.

### 8.7 Eulerian asymptotics of projective hypersurface cohomology

Fix `n ≥ 2`. Prove that as `d → ∞`, `h^(p, n−1−p)_prim(d) ∼ d^n·A(n, p)/n!` for `0 ≤ p < n`; that after
adjoint formation `h^a/(d^(2n)/2) → β_a` for the orthogonal or symplectic similitude group; and that the
parameter space of degree-`d` hypersurfaces has dimension `binomial(n + d, d) − 1 = O(d^n)`, so
`dim Y/h⁰ → 0`. Here `n` is the ambient dimension (LV, (10.6)–(10.8), printed pp. 970–971, with the
parameter dimension corrected in Source corrections).

A route: expand the coefficient of §8.6 by inclusion–exclusion; its leading `d^n` coefficient is the
Eulerian finite-difference formula (Worpitzky's identity, ClassicalArithmeticCompletion §2.39). Adjoint
multiplicities come from symmetric or exterior squares; diagonal terms and the scalar direction are of
lower order.

**Checks.**

- Plane quartics: `binomial(6, 4) − 1 = 14`, whereas the printed `binomial(n + d, d − 1) − 1` gives 19;
  plane cubics give 9 under both, so they do not separate the formulas.
- For `n = 2` the leading coefficients are `d²/2·(1, 1)`, and the genus of a plane curve,
  `(d − 1)(d − 2)/2 ∼ d²/2`, agrees.
- `dim Y` grows like `d^n/n!` while `h⁰` grows like `d^(2n)`.

*Needs:* §§8.2, 8.6; ClassicalArithmeticCompletion §2.39.

### 8.8 Normal-limit estimates for adjoint Eulerian weights

Prove that as `n → ∞` the centred descent count divided by `√n` converges in law to `N(0, 1/12)` and the
independent difference to `N(0, 1/6)`; that consequently `Σ_(a>0) a·β_a ≥ C√n` for some `C > 0` and all
large `n`; that `β₀ < 40/√n` for all large `n`; and that for each fixed `c > 0` the sum of the largest
`c/√n` fraction of difference weights is `o(√n)` (LV, Lemma 10.3, (10.9)–(10.12) and the proof of
(10.13), printed pp. 972–974; LV line 3004).

A route: the central limit theorem for descents gives the normal limit of the difference `D` of two
independent descent counts, and the second moment of §8.3 gives `E[(D/√n)²] = (n + 1)/(6n) ≤ 1/4` for
`n ≥ 2`, so `|D|/√n` is uniformly integrable and first absolute moments converge; log-concavity and
the variance bound give the central-mass estimate; Cauchy–Schwarz controls the upper-tail partial sums.

**Checks.**

- Convergence in law alone does not give convergence of unbounded first moments; the uniform second
  moment bound is the extra input.
- `Σ_(a>0) a·β_a = E|D|/2` for the difference `D` of two independent descent counts; the normal limit
  gives `E|D| ∼ √(n/6)·√(2/π)`, so the sum is of order `√n`, not `n`.
- `40/√n < 1/2` only for `n > 6400`, so §8.4 is not a consequence of this asymptotic bound.

*Needs:* §8.3; ClassicalArithmeticCompletion §2.18 with gap:eulerian-central-limit.

### 8.9 Large ambient dimension and degree satisfy the Lawrence–Venkatesh inequalities

Prove that there is `n₀` such that for every `n ≥ n₀` there is `D₀(n)` with
`A ≥ h⁰ + dim Y` and `B > T(h⁰ + dim Y) + T(3h⁰/2 + dim Y)` for every `d ≥ D₀(n)`, for the primitive
universal degree-`d` hypersurface profile in `ℙⁿ` in the similitude group, all arguments of `T` lying in
their domains. The limits are taken first in `d` for fixed `n`, then in `n` (LV, Proposition 10.2 and
proof, printed pp. 970–974).

A route: normalize the adjoint profiles by `d^(2n)/2` and pass to `β` at fixed `n` (§8.7); the positive
first moment has size `√n`, while each discarded top fraction of order `1/√n` has sum `o(√n)` (§8.8);
choose `n` large for a strict margin, then `d` large so that the asymptotic errors and `dim Y/h⁰` keep
it.

**Checks.**

- The threshold `D₀(n)` depends on `n`; exchanging the order of limits would need a further estimate.
- With the uncorrected parameter dimension `O(d^(n+1))` one would still have `dim Y/h⁰ → 0` for
  `n ≥ 2`, so the correction does not change the conclusion.
- Numerical evidence quoted by Lawrence–Venkatesh suggests `n₀ ≈ 60`; the theorem asserts only
  existence.

*Needs:* §§2.7, 8.7–8.8.

### Examples

For `n = 2` the Eulerian row is `(1, 1)`, its difference law `(1/4, 1/2, 1/4)` with second moment `1/2`.
For `n = 3` it is `(1, 4, 1)` with `β₀ = 1/2`. A quartic surface has primitive Hodge vector `(1, 19, 1)`
while its full middle cohomology has `(1, 20, 1)`. These pin the convolution normalization and the
primitive projector.

### Dependencies

Layer 2; ClassicalArithmeticCompletion §§2.18, 2.39, 2.56; SheafConvolutionOnAbelianVarieties §§3.1, 3.3;
ComplexComparisonPartII §C5.3 with gap:griffiths-residue-hodge-filtration; Mathlib
`RingTheory.Sequence.IsRegular`.

## Layer 9: Projective hypersurface application

This layer constructs the universal smooth degree-`d` family with its parameter space of the correct
dimension, proves large connected monodromy in every ambient dimension and degree except the cubic
surfaces, and proves non-density of integral parameters for large ambient dimension and degree.

### 9.1 Universal smooth projective hypersurfaces

For `n ≥ 2` and `d ≥ 2` let `Y_(n,d)` be the open subscheme of `ℙ(H⁰(ℙⁿ, O(d)))` over `ℤ` where the
hypersurface is smooth, the complement of the discriminant. Its coordinates are indexed by the degree-`d`
monomials in `n + 1` variables, `HypersurfaceMonomial n d`, so it has dimension `binomial(n + d, d) − 1`;
it carries the universal smooth projective degree-`d` hypersurface with relative `O(1)`. A form `F` over a
field defines a point of `Y_(n,d)` exactly when `IsSmoothHypersurface F` holds (Jacobian criterion). An
integral form whose coefficients generate the unit ideal of `ℤ[S⁻¹]` is the coordinate vector of a
`ℤ[S⁻¹]`-point exactly when `HasGoodReductionOutside S F` holds; every `ℤ[S⁻¹]`-point has such an integral
coordinate vector, unique up to a unit of `ℤ[S⁻¹]`, and an integral form satisfying the predicate has
such coefficients, since its reduction modulo every prime outside `S` is nonzero. Primitive
middle cohomology is the orthogonal complement of the ambient class, with its nondegenerate intersection
form. The parameter space keeps equations up to scalars; it is not the quotient by `PGL_(n+1)` (LV,
Proposition 10.2, printed pp. 970–971).

A route: in even hypersurface dimension the ambient middle class has self-intersection `d ≠ 0`, so its
orthogonal complement is a rational primitive summand with nondegenerate pairing
(EtaleDualityAndPerverseSheaves §4.3; DeligneWeightsAndPurity §9.12); its integral lattice is the
intersection of the rational summand with integral cohomology.

API:

- `Y_(n,d)` is the discriminant complement in the projective space of coefficients, of dimension
  `binomial(n + d, d) − 1`.
- It carries the universal smooth projective family with relative `O(1)`.
- The primitive projectors agree under the Betti, de Rham, étale and crystalline comparisons, and the
  primitive realizations form a polarized integral Hodge–Deligne system of weight `n − 1` on `Y_(n,d)[1/N]`
  for suitable `N`.
- A form with integer coefficients whose coefficients generate the unit ideal of `ℤ[S⁻¹]` has good
  reduction outside `S` exactly when it is the coordinate vector of a `ℤ[S⁻¹]`-point; a form with good
  reduction outside `S` has such coefficients, its reduction modulo `p ∉ S` is nonzero, and its generic
  fibre is smooth.

**Checks.**

- For plane cubics the parameter space has dimension 9, while the moduli of elliptic curves has
  dimension 1.
- The double line `x₀² = 0` (or any nonreduced form) lies on the discriminant and is excluded; the zero
  form fails `IsSmoothHypersurface`.
- For quartic surfaces the primitive degree-two rank is 21, the full rank 22.
- In characteristic `p | d` the Euler relation gives no information, and the Jacobian criterion still
  decides smoothness: `x₀^p + x₁^p + x₂^p` over `𝔽_p` has all partial derivatives zero and is singular.
- Agreement with the library in the plane: for `n = 2` the predicate `IsSmoothHypersurface G` of a
  homogeneous `G` is the nonsingularity hypothesis of Tau Ceti's
  `TauCeti.AlgebraicGeometry.projectivePlaneCurve.smoothOfRelativeDimension` with `K` the algebraic
  closure of `k`, which then makes `Proj k[x₀, x₁, x₂]/(G)` smooth of relative dimension one over `k`.
  For the line pair `G = x₀x₁` the point `(0, 0, 1)` is a common zero of `G = x₀x₁`, `∂G/∂x₀ = x₁`,
  `∂G/∂x₁ = x₀` and `∂G/∂x₂ = 0`, so the predicate fails, as it must at the crossing point of the two
  lines.
- For `S = {2}` the form `3(x₀² + x₁² + x₂²)` defines the same rational point as `x₀² + x₁² + x₂²`, which
  is an integral point (modulo an odd prime the partial derivatives `2x_i` vanish together only at `0`),
  but it is zero modulo 3 and fails `HasGoodReductionOutside`: its coefficients generate `3·ℤ[1/2]`, so it
  is not a coordinate vector of that point. §9.3 is unaffected, because its `G` is homogeneous and
  vanishes at a form exactly when it vanishes at every nonzero multiple.

*Needs:* SchemeAndStackFoundations §4.14; AlgebraicModuliForArithmeticGeometry §2.1;
EtaleDualityAndPerverseSheaves §4.3; DeligneWeightsAndPurity §9.12; Layer 0; Mathlib
`MvPolynomial.pderiv`, `AlgebraicClosure`.

### 9.2 Large connected monodromy for universal hypersurfaces

For the universal smooth degree-`d` hypersurfaces in `ℙⁿ_ℂ` with `n ≥ 2` and `d ≥ 2`, other than the
cubic surfaces `(n, d) = (3, 3)`, prove that the Zariski closure of the monodromy on primitive middle
cohomology `E = H^(n−1)_prim` contains the identity component of the group of the intersection form:
`Sp(E)` when the middle dimension `n − 1` is odd and `SO(E)` when it is even. For quadrics (`d = 2`) that
identity component is trivial (`E = 0` for `n` even, `rank E = 1` for `n` odd), so the statement holds
with finite monodromy. The cubic surfaces are the one exception: their monodromy is the finite Weyl group
`W(E₆)`. The similitude scalars are arithmetic and need not occur in geometric monodromy (Beauville,
Théorèmes 2 and 4, printed pp. 10–12, and §1, printed pp. 8–9, Beauville lines 84–89 and 129–136, which
leave quadrics and plane cubics to the reader; LV, §10.2, printed p. 970).

A route: for `d = 2` there is nothing to prove. For `d ≥ 3`, a Lefschetz pencil
(LefschetzPencilsAndVanishingCycles §3.4) is a line in the parameter space, so the universal monodromy
contains the pencil monodromy, and the vanishing space of the pencil is the nondegenerate primitive
cohomology (§9.1, LefschetzPencilsAndVanishingCycles §4.4). For `n − 1` odd, plane cubics included, the
Kazhdan–Margulis theorem (§5.8 there) makes the ℓ-adic monodromy open in `Sp(E)(ℚ_ℓ)`, and an open
subgroup is Zariski dense (DeligneWeightsAndPurity §2.2). For `n − 1` even, §5.10 there gives open or
finite; finite monodromy would make the intersection form, after the sign `(−1)^((n−1)/2)`, definite, but
by the Hodge–Riemann relations its sign alternates with `p` on `H^(p, n−1−p)_prim`, and §8.6 gives a
nonzero primitive Hodge number at the central `p = (n−1)/2` (Jacobian degree `(n + 1)(d − 2)/2`) and at
`p = (n−3)/2` exactly when `(n − 1)d/2 ≥ n + 1`, that is `d ≥ 2 + 4/(n − 1)`: `d ≥ 4` for `n = 3` and
`d ≥ 3` for odd `n ≥ 5`, which is every case with `d ≥ 3` except the cubic surfaces. So the monodromy is
open in `O(E)(ℚ_ℓ)`. An open subgroup of `SO(E)(ℚ_ℓ)` has Lie algebra `𝔰𝔬(E)` (ReductiveGroupsPartII
§RG2.0.2, analytic charts), so its Zariski closure, a closed subgroup of `SO(E)` of dimension
`dim SO(E)`, is the connected group `SO(E)`; the intersection of the open monodromy image with
`SO(E)(ℚ_ℓ)` is such a subgroup, so the Zariski closure of the monodromy contains `SO(E)`. The Artin
comparison (ComplexComparisonPartII §C6.6) passes between the ℓ-adic and Betti monodromy.

**Checks.**

- Cubic surfaces (`n = 3`, `d = 3`) have primitive Hodge numbers `(0, 6, 0)` (Jacobian degree
  `(n − 1)d/2 − n − 1 = −1` at `p = 0`), a definite form and finite monodromy `W(E₆)`, whose Zariski
  closure has dimension 0 while `dim SO₆ = 15`: the exception is necessary.
- Quadrics (`d = 2`): for odd `n` the primitive lattice has rank 1, `O₁ = {±1}` and `SO₁` is trivial, so
  the finite monodromy `{±1}` satisfies the statement; for even `n`, `E = 0`.
- Plane cubics (`n = 2`, `d = 3`) are included: primitive rank 2, `Sp₂ = SL₂` of dimension 3, and the
  monodromy `SL₂(ℤ)` is Zariski dense in it.
- Quartic surfaces (`n = 3`, `d = 4`) are included: primitive Hodge numbers `(1, 19, 1)`, rank 21,
  signature `(2, 19)`, and `SO₂₁` of dimension `21·20/2 = 210` is contained in the Zariski closure.
- For `n = 5`, `d = 4` the coefficients of `(1 + t + t²)⁶` at `t²`, `t⁶`, `t^10` are `21, 141, 21`, so
  `h_prim = (0, 21, 141, 21, 0)`, and the form is indefinite.
- For `dim E = 2` split, `SO(E) = 𝔾_m`, and an open subgroup of `ℚ_ℓ^×` is Zariski-dense in `𝔾_m` (its
  closure is a closed subgroup with infinitely many points of a one-dimensional irreducible group), while
  an open subgroup of `O(E)(ℚ_ℓ)` contained in `SO(E)(ℚ_ℓ)` misses the other component and is not dense
  in `O(E)`; the density statement is made for `SO(E)`, after intersecting with `SO(E)(ℚ_ℓ)`.

*Needs:* §§8.6, 9.1; LefschetzPencilsAndVanishingCycles §§2.8, 3.4, 4.4–4.5, 5.8, 5.10;
DeligneWeightsAndPurity §2.2; ReductiveGroupsPartII §RG2.0.2; ComplexComparisonPartII §C6.6.

### 9.3 Non-density of integral hypersurface parameters

Prove that there are `n₀ ≥ 4` and, for each `n ≥ n₀`, a bound `D₀(n) ≥ 4` such that for every `d ≥ D₀(n)`
and every finite set `S` of primes, `Y_(n,d)(ℤ[S⁻¹])` is contained in a proper Zariski-closed subset of
`Y_(n,d),ℚ`. In coordinates this is `integralHypersurfaces_not_zariskiDense`: the integral degree-`d` forms
in `n + 1` variables with good reduction outside `S` all satisfy one nonzero homogeneous polynomial
equation `G = 0` in their coefficients. The statement concerns non-density in the parameter space and
makes no claim about its `PGL` quotient (LV, Theorem 10.1 with Proposition 10.2, printed pp. 969–974).

A route: §9.1 gives the family and its parameter dimension, §9.2 the monodromy hypothesis, §8.9 the
numerical inequalities, and §7.6 applies after enlarging `S` by the primes where the model of §9.1 is not
smooth; non-density for the larger `S` implies it for the smaller.

**Checks.**

- The good-reduction condition is that of a fixed integral model of the parameter space; good reduction
  after an arbitrary rational change of coordinates is a different question.
- Enlarging `S` enlarges the set of forms; a single `G` for a larger `S` serves for a smaller one.
- Because `Y_(n,d),ℚ` is dense open in projective space, any nonzero homogeneous `G` cuts out a proper
  subset of it.

*Needs:* §§7.6, 8.9, 9.1–9.2.

### Examples

Plane cubics give a nine-dimensional parameter space, while elliptic moduli is one-dimensional; a
double line lies on the discriminant. The theorem concerns integral parameters of the fixed model and does
not identify coordinate changes over ℚ with coordinate changes over `ℤ[S⁻¹]`.

### Dependencies

Layers 0, 7 and 8; SchemeAndStackFoundations §4.14; AlgebraicModuliForArithmeticGeometry §2.1;
EtaleDualityAndPerverseSheaves §4.3; DeligneWeightsAndPurity §§2.2, 9.12; LefschetzPencilsAndVanishingCycles
§§2.8, 3.4, 4.4–4.5, 5.8, 5.10; ReductiveGroupsPartII §RG2.0.2; ComplexComparisonPartII §C6.6; Mathlib
`MvPolynomial.pderiv`, `AlgebraicClosure`.

## Layer 10: Hypersurface Shafarevich finiteness

This layer parametrizes smooth ample divisors of a fixed class, transfers integral points through Weil
restriction, resolves dense closures over a smooth open, applies the coefficient theorem to families that
are not translation-constant, and descends from geometric translations to `A(K)`-translations; the
abelian-surface case goes through curves.

### 10.1 Good reduction and primitive hypersurfaces

Fix a number field `K`, a finite set `S`, an abelian variety `A/K` with abelian scheme model `𝒜` over
`O_K[S⁻¹]`, and a smooth ample effective divisor `H ⊂ A`. `H` has **good reduction outside `S`** when its
schematic closure in `𝒜` is smooth over `O_K[S⁻¹]`. The **translation stabilizer** `Stab(H)` is the
scheme-theoretic stabilizer of HeightsRationalPointsAndObstructions §5.2 for `X = H`: the closed subgroup
scheme of `A` whose `T`-points, for every `K`-scheme `T`, are the `a ∈ A(T)` with `H_T + a = H_T`; `H` is
**primitive** when `Stab(H)(K̄) = {0}` (LS, Definition 9.1, p. 85, with the zero translation treated as in
Source corrections).

API:

- Good reduction is smoothness of the closure in the chosen abelian scheme model.
- `Stab(H)` is a finite subgroup scheme of `A`, reduced in characteristic zero: it lies in the kernel of
  `φ_(𝒪(H))`, which is finite because `𝒪(H)` is ample (AbelianSchemesAndArithmeticModuli §A2.4).
- `H` is primitive exactly when every geometric stabilizing translation is zero.
- Translation by a `K`-point preserves good reduction, since the point extends to a section of `𝒜`.

**Checks.**

- Translation by zero fixes every `H` and does not make `H` nonprimitive.
- The pullback of a divisor under a nontrivial étale isogeny is stabilized by the nonzero points of its
  kernel, so it is not primitive: for `A = E₁ × E₂` and `H = ([2] × id)⁻¹(H′)` with `H′` primitive,
  `H_T + a = H_T` exactly when `([2] × id)(a)` stabilizes `H′_T`, so `Stab(H) = ker([2] × id) = E₁[2] × 0`,
  of order four, as functors on all test schemes and not only on geometric points.
- The specialization agrees with the general stabilizer of HeightsRationalPointsAndObstructions §5.2 on
  its basic cases: on an elliptic curve a point `{x}` is a smooth ample divisor with `Stab({x}) = 0`, so it
  is primitive; `A` itself has stabilizer `A` but is not a divisor, and ampleness is what makes `Stab(H)`
  finite.
- For `a ∈ A(K)` properness extends `a` to `𝒜`, and `H + a` again has smooth closure.

*Needs:* HeightsRationalPointsAndObstructions §5.2; AbelianSchemesAndArithmeticModuli §§A0.1, A1.2, A1.8,
A2.4, A2.10; SchemeAndStackFoundations §4.14; `TauCeti.AlgebraicGeometry.AbelianVariety`.

### 10.2 A parameter space for smooth ample divisors

For `A/K` and a fixed ample numerical class `φ`, construct a quasi-projective `K`-scheme `𝒫_φ` of finite
type parametrizing smooth effective divisors of class `φ`, with its universal divisor in `A × 𝒫_φ`: take
the Hilbert polynomial of class `φ` with respect to a fixed auxiliary ample bundle (Riemann–Roch,
AbelianSchemesAndArithmeticModuli §A2.4), the open subscheme of smooth effective Cartier divisors and the
union of the components of numerical class `φ`. Over an enlarged `S`, divisors with good reduction give
integral points of a model of `𝒫_φ`, and translation by `A` acts algebraically and preserves `φ` (LS,
proof of Theorem 9.2, pp. 85–86).

API:

- `𝒫_φ` is of finite type and parametrizes smooth divisors of class `φ`.
- It carries a universal smooth divisor in `A × 𝒫_φ`.
- A divisor with smooth closure over the model ring gives an integral point of the model of `𝒫_φ`.
- `A` acts on `𝒫_φ` by translation.

**Checks.**

- Translates of `H` give points of the same parameter space.
- A divisor of a different intersection degree with the auxiliary polarization is excluded.
- A singular flat divisor lies in the Hilbert scheme but outside the smooth open.
- `𝒫_φ` is not claimed to be a fine quotient by translations.

*Needs:* §10.1; SchemeAndStackFoundations §§0.9, 4.14; AlgebraicModuliForArithmeticGeometry §2.1;
AbelianSchemesAndArithmeticModuli §§A2.4, A2.10.

### 10.3 Weil restriction and integral parameters

After enlarging `S` to the set of all finite places of `K` above a finite set `S′` of rational primes
that contains the primes below `S` and the primes ramified in `K`, so that `O_K[S⁻¹] = O_K ⊗ ℤ[S′⁻¹]` is
finite étale over `ℤ[S′⁻¹]`, prove that the quasi-projective parameter scheme admits a Weil restriction
`X = Res_(K/ℚ) 𝒫_φ`, a quasi-projective ℚ-scheme with an integral model over `ℤ[S′⁻¹]` whose integral
points are the `O_K[S⁻¹]`-points of the model of `𝒫_φ`; the Weil restriction of the abelian scheme is
again an abelian scheme. Enlarging `S` only enlarges the set of hypersurfaces with good reduction outside
`S` (Conventions), so finiteness for the enlarged set gives it for the original one (LS, proof of
Theorem 9.2, pp. 85–86).

A route: AbelianSchemesAndArithmeticModuli §§A6.30–A6.32 give representability for quasi-projective schemes
and abelian schemes along finite étale maps and the functor-of-points adjunction. The original family over
`K` is kept for twisted cohomology, while `X/ℚ` is the arithmetic base.

**Checks.**

- Properness of Weil restriction along a ramified integral extension is not claimed (it fails: the Weil
  restriction along `K[ε]/(ε²)` of an elliptic curve is not proper).
- For `K = ℚ` the construction is the identity.
- For `K` quadratic, `X_ℚ̄ ≅ 𝒫_φ × 𝒫_φ^σ`, with conjugation swapping the factors.
- The set that grows is `S`, not `S′`: for `K = ℚ(i)` and `S = {(2 + i)}` no `S′` works, since `5 ∈ S′`
  needs `1/5 ∈ O_K[S⁻¹]`, false as `(2 − i)` is not inverted, while for `5 ∉ S′` the element
  `1/(2 + i)`, with minimal polynomial `x² − (4/5)x + 1/5`, is not integral over `ℤ[S′⁻¹]`. Enlarging
  `S` to `{(1 + i), (2 + i), (2 − i)}` over `S′ = {2, 5}` gives `O_K[S⁻¹] = ℤ[1/10][i]`, free of rank 2
  over `ℤ[1/10]` with discriminant `−4`, a unit.

*Needs:* §10.2; AbelianSchemesAndArithmeticModuli §§A6.30–A6.32.

### 10.4 Reducing a dense arithmetic closure to a smooth base

Let a set of integral points of a finite-type scheme over `ℤ[S⁻¹]` with generic fibre of characteristic
zero be Zariski dense in an irreducible component `C` (with its reduced structure) of its closure in the
generic fibre. Prove that `C` is geometrically irreducible over ℚ, and that there is a proper birational
`C̃ → C` with `C̃` smooth and geometrically connected over ℚ, an isomorphism over a dense smooth open `U`,
spread out to a smooth model over a finite localization, such that the integral points lying in `U`
lift uniquely to integral points of the model of `C̃` and are dense there. Points outside `U` lie in finitely many
lower-dimensional closures (LS, proof of Theorem 9.2, pp. 85–86).

A route: `C` carries a Zariski-dense set of ℚ-points. Galois permutes the geometric components of `C`
transitively, and a ℚ-point on one of them lies on all its conjugates; with two or more components the
ℚ-points would lie in their common intersection, a proper Galois-stable closed subset that descends to a
proper closed subset of `C`. So `C` is geometrically irreducible, and geometrically reduced in
characteristic zero. AlgebraicModuliForArithmeticGeometry §9.4 gives the resolution preserving the
regular locus; `C̃` is integral with the function field of `C`, in which ℚ is algebraically closed, so
`C̃` is geometrically integral and in particular geometrically connected. SchemeAndStackFoundations §0.9
spreads it out; the valuative criterion of properness extends rational lifts over every prime outside the
enlarged set.

**Checks.**

- A rational point over a singular exceptional fibre need not lift rationally; restricting to `U`
  avoids this.
- If `C` is already smooth, `C̃ = C` and nothing changes.
- A dense set minus a proper closed subset of an irreducible `C` is still dense.
- Density of the rational points is what gives geometric connectedness: the curve `x² − 2y² = 0` in
  `𝔸²_ℚ` is irreducible over ℚ and its normalization `Spec ℚ(√2)[t]` is smooth and connected but has two
  geometric components (the lines `x = ±√2·y`); its only rational point is the origin, so it is not a
  component in which a set of integral points is dense, and the statement does not apply to it.

*Needs:* §10.3; AlgebraicModuliForArithmeticGeometry §9.4; SchemeAndStackFoundations §0.9.

### 10.5 Families that are not translation-constant are arithmetically nondense

For a smooth geometrically connected positive-dimensional arithmetic base `X/ℚ` from §10.4, suppose its
universal family of primitive smooth ample divisors in `A` is not constant up to geometric translation,
and that `n = dim A ≥ 4`, or `n = 3` and the normalized degree `d = φ³/6` is not an exceptional degree
`D_j`, `j ≥ 1`, of SheafConvolutionOnAbelianVarieties §5.3. Prove that its integral parameters are not
Zariski dense (LS, proof of Theorem 9.2, pp. 86–87).

A route: choose `c` by §8.5 with `e = dim X`; choose a good prime `p` and, by SheafConvolutionOnAbelianVarieties
§8.3 with the classical monodromy of §6.7 there, a torsion character of order prime to `p` with the
conjugate-uniform monodromy; build the orbit system of §1.7 with its lattice, polarization, uniform
Eulerian profile (§8.1), rational Frobenius polynomials (§1.9) and strong c-balance (§4.3), and choose
its coefficient structure by the branch of SheafConvolutionOnAbelianVarieties §4.8: when the generic
hypersurface is not a translate of its inversion, the derived monodromy is `SL_N` and the structure is
the `GL_N`-structure of §1.5, with no pairing; when it is such a translate, the inversion pairing of §1.8
gives a `GSp_N`-structure for even `n` and a `GO_N`-structure for odd `n`. Then apply §6.1.

**Checks.**

- In the nonsymmetric branch no nondegenerate invariant bilinear form exists: on the standard
  representation of `SL₆` the central element `ζI` with `ζ` a primitive cube root of unity would force
  `B = ζ²B`, so `B = 0`. In the symmetric branch with `n = 4` the pairing is alternating, its sign being
  `(−1)^(n−1) = −1`.
- A family constant up to translation is excluded: its twisted cohomology has finite monodromy.
- For `n = 3` and `d = D₁ = 8855` the classical monodromy input fails and the theorem says nothing.
- The base is positive-dimensional; a single divisor is handled by §10.6 directly.

*Needs:* §§1.5, 1.7–1.9, 4.3, 6.1, 8.1, 8.5, 10.4; SheafConvolutionOnAbelianVarieties §§4.8, 5.3, 6.7,
8.3.

### 10.6 Primitive hypersurface Shafarevich finiteness

For `A/K` with good reduction outside `S` and a fixed ample class `φ`, prove that the primitive smooth
hypersurfaces of class `φ` with good reduction outside `S` form finitely many geometric translation
classes when `n ≥ 4`, or when `n = 3` and `d = φ³/6` is not an exceptional `D_j`, `j ≥ 1` (LS, Theorem 9.2,
pp. 85–87; LS line 3881).

A route: translation orbits in `𝒫_φ` are closed since `A` is proper. Take the irreducible components of
the closure of the arithmetic set and apply §10.4; if the generic family on a component is not
translation-constant, §10.5 contradicts density; if it is, the closed translation orbit contains the whole
component, boundary included. There are finitely many components.

**Checks.**

- Closedness of the proper orbit handles boundary points without assuming that a dense open exhausts the
  component.
- A component of dimension zero is a single divisor, one translation class.
- For `n = 3`, `d = 8855` is excluded; `d = 2·8855` is allowed here (only equality with `D_j` is excluded
  for primitive divisors).

*Needs:* §§10.2, 10.4–10.5; SheafConvolutionOnAbelianVarieties §5.3.

### 10.7 Finite stabilizers and primitive isogeny quotients

Prove that every smooth ample hypersurface `H ⊂ A` is the inverse image of a primitive smooth ample divisor
`H′ ⊂ A/T`, where `T = Stab(H)` is finite and the quotient isogeny has degree `|T|`; that
`d(H) = |T|·d(H′)`; and that for a fixed numerical class only finitely many kernels `T` occur, since their
orders divide `d(H)` and all lie in `A[m]` for a common `m`. The quotient and `H′` descend to `K` (LS,
Corollary 9.3 and proof, pp. 87–88; LS line 4013).

A route: AbelianSchemesAndArithmeticModuli §A3.3 gives the quotient by a finite subgroup and §A3.6 descent
of a `T`-invariant divisor along the étale isogeny; the projection formula compares top self-intersections.

**Checks.**

- For `T = 0` the statement is the identity.
- For `A = E₁ × E₂` and `H` the pullback of a primitive divisor along `[2] × id`, `|T| = 4` and
  `d(H) = 4·d(H′)`.
- A fixed order allows finitely many subgroup schemes of the finite group `A[m]`, not finitely many
  arbitrary finite group schemes.

*Needs:* §10.1; AbelianSchemesAndArithmeticModuli §§A2.4, A3.3, A3.6.

### 10.8 From geometric translations to `A(K)`-translations

For a `K`-defined smooth ample divisor `H` with finite stabilizer `T`, prove that the `K`-defined divisors
in its geometric translation orbit are parametrized by `(A/T)(K)`, and that their `A(K)`-translation classes
inject into `(A/T)(K)/π(A(K))`, which is finite. For primitive `H`, `T = 0` and the translating point between
two `K`-defined divisors is unique and `K`-rational. Hence finitely many geometric classes give finitely many
`A(K)`-classes (LS, arithmetic descent in Theorem 9.2 and Corollary 9.3, pp. 85–87).

A route: identify the proper orbit with `A/T`; `(A/T)(K)` is finitely generated
(HeightsRationalPointsAndObstructions §1.7), and `[m]` on `A/T` factors through `π` for `m = |T|`, so the
quotient is a quotient of `(A/T)(K)/m(A/T)(K)`, finite by §1.6 there. For primitive `H`, uniqueness of the
translating point gives Galois invariance.

**Checks.**

- For nonprimitive `H` a rational orbit point need not lift to `A(K)`; the finite cokernel, not
  surjectivity, is the statement.
- For `T = 0` the map `A(K) → (A/T)(K)` is the identity and the quotient is trivial.
- For `A = E` an elliptic curve and `T = ⟨P⟩` with `P ∈ E(K)` of order 2, the quotient is the cokernel of
  the 2-isogeny on `K`-points, which is finite and can be nontrivial; for `T = E[2]`, `E/T ≅ E` through
  `[2]` and the quotient is `E(K)/2E(K)`.

*Needs:* §10.7; HeightsRationalPointsAndObstructions §§1.6–1.7.

### 10.9 Shafarevich finiteness for all smooth ample hypersurfaces

For `A/K` of dimension `n ≥ 4` and a fixed ample class `φ`, prove that the smooth hypersurfaces of class
`φ` with good reduction outside `S` form finitely many `A(K)`-translation classes; for `n = 3` the same holds
if `d = φ³/6` is not divisible by any exceptional `D_j`, `j ≥ 1` — equivalently `φ³` is not divisible by
`6D_j` (LS, Corollary 9.3 and Theorems 9.4–9.5, pp. 87–88; LS lines 4013–4035). The primitive theorem
excludes equality `d = D_j`; the all-hypersurface theorem must exclude divisibility.

A route: enlarge `S` by the primes dividing `d`, so that all possible kernels are étale and the quotient
divisors have smooth reduction; apply §10.6 on the finitely many quotients of §10.7 (an exceptional quotient
degree `D_j` would divide `d`); pull back and descend with §10.8.

**Checks.**

- Normalized `d` and unnormalized `φ³ = 6d` are kept separate; the first excluded normalized degree is
  `8855`.
- `d = 2·8855` is excluded here though allowed in §10.6, since a degree-2 isogeny quotient can have
  degree `8855`.
- For `n ≥ 4` there is no numerical exception.

*Needs:* §§10.6–10.8; SheafConvolutionOnAbelianVarieties §5.3.

### 10.10 The abelian-surface case through curves

For an abelian surface `A/K`, a fixed ample class `φ` and finite `S`, prove that the smooth hypersurfaces
(curves) of class `φ` with good reduction outside `S` form finitely many `A(K)`-translation classes (LS,
Theorem 9.6 and proof, p. 88; LS line 4041).

A route: adjunction gives genus `g = 1 + φ²/2 ≥ 2`; FaltingsFinitenessAndIsogenyTheorems §R28.5.15 gives
finitely many curves up to isomorphism. For each curve `C`, after a finite extension supplying a point
`x₀`, an embedding `f : C → A` is the translation by `f(x₀)` of `h ∘ a` for the Abel–Jacobi map
`a : C → Jac C` based at `x₀` and a unique homomorphism `h : Jac C → A` (JacobianChallenge Layer F; the
rigidity of AbelianSchemesAndArithmeticModuli §A1.2 concerns maps between abelian schemes and does not
accept the curve `C` as source). The fixed class bounds the positive definite Rosati quadratic form
`q(h) = h_*[C]·φ` (with pushforward multiplicity) on the finitely generated group `Hom(Jac C, A)`
(AbelianSchemesAndArithmeticModuli §§A6.7, A6.14), leaving finitely many homomorphisms; §10.8 descends
to `A(K)`-translations.

**Checks.**

- `q(m·h) = m²·q(h)` because the pushforward cycle carries multiplicity; the reduced image cycle would not
  scale quadratically.
- For `φ` principal (`φ² = 2`) the genus is 2 and `C` is a theta divisor.
- The classical hypersurface monodromy theorem (which needs `n > 2`) is not used.
- For a genus-two curve `C` and `f = a` the Abel–Jacobi map, the factorization gives `h = id_(Jac C)`;
  for the constant map `f = 0` it gives `h = 0`.

*Needs:* §10.8; FaltingsFinitenessAndIsogenyTheorems §R28.5.15; JacobianChallenge Layer F;
AbelianSchemesAndArithmeticModuli §§A6.7, A6.14.

### Examples

The exceptional pair `(5, 20)` gives `D₁ = binomial(25, 5)/6 = 53130/6 = 8855`. Primitive degree `2D₁` avoids
equality with `D₁` but can have an exceptional isogeny quotient, so the all-hypersurface theorem excludes
divisibility. For an abelian surface, adjunction gives genus `1 + φ²/2 ≥ 2`.

### Dependencies

Layers 1, 4, 6 and 8; AbelianSchemesAndArithmeticModuli §§A0.1, A1.2, A1.8, A2.4, A2.10, A3.3, A3.6, A6.7,
A6.14, A6.30–A6.32; SchemeAndStackFoundations §§0.9, 4.14; AlgebraicModuliForArithmeticGeometry §§2.1,
9.4; HeightsRationalPointsAndObstructions §§1.6–1.7, 5.2; FaltingsFinitenessAndIsogenyTheorems §R28.5.15;
JacobianChallenge Layer F; SheafConvolutionOnAbelianVarieties §§4.8, 5.3, 6.7, 8.3;
`TauCeti.AlgebraicGeometry.AbelianVariety`.

## Downstream consumers

The two applications consume the same period and balanced-filtration mechanism: the projective
application needs §9.2's monodromy and the large-`n`, large-`d` estimate of §8.9, while the abelian
application needs SheafConvolutionOnAbelianVarieties' arbitrarily many independent character factors and
the all-points theorem of §6.1. Any later roadmap on integral points of higher-dimensional moduli (for
instance through iterating §7.6 on the Zariski closure of integral points, or through monodromy along
subvarieties as in §7.7) consumes Layers 3–7 as stated here.

LogicAndDefinabilityInNumberTheory §7.6 states the complex period codimension consequence of §3.3
with the Ax–Schanuel theorem of Bakker and Tsimerman carried as a named hypothesis. Here §3.3 is a
target whose Ax–Schanuel input is a supplier theorem (AbelianSchemesAndArithmeticModuliPartII,
gap:period-map-ax-schanuel), and the objects that statement names are owned here: Hodge–Deligne
systems and their integral and polarized forms (§§0.1–0.2), the differential monodromy group (§0.6),
the monodromy period orbit (§3.1) and its parabolic stabilizer (§3.2).

## Worked examples

- **Top-weight sums.** For adjoint weights `2, 0, −2`: `D = 3`, `A = 1`, `B = 2`, `T(1/2) = 1`,
  `T(1) = 2 = B`, `T(2) = 2`, `T(3) = 0`.
- **Semibalance in `GL₆`.** For a `2 + 2 + 2` flag and `dim F¹ = 3`, `⟨γ_P, F_M⟩ = 4(a₀ − a₂)` with `a₀` the top
  and `a₂` the bottom contribution, each `a_i ≤ 2`: `(1, 1, 1)` is the only balanced and the only weakly
  balanced triple, `(0, 1, 2)` is semibalanced and the generic `(2, 1, 0)` is not (LS, Example 8.6,
  pp. 75–76). For a `4 + 4 + 4` flag in `GL₁₂` and `dim F¹ = 6`, `⟨γ_P, F_M⟩ = 8(a₀ − a₂)`: `(1, 4, 1)`
  is weakly balanced but not balanced (block averages `1/4, 1, 1/4` against `1/2`), and `(2, 2, 2)` is
  balanced.
- **Eulerian central mass.** Rows `(1, 1)`, `(1, 4, 1)`, `(1, 11, 11, 1)`, `(1, 26, 66, 26, 1)` give
  `β₀ = 1/2, 1/2, 244/576, 5710/14400`, all `≤ 1/2`.
- **Projective Hodge numbers.** The quartic surface has primitive `(1, 19, 1)`; the quintic threefold
  (`n = 4`, `d = 5`) has primitive `(1, 101, 101, 1)`, the coefficients of `t⁰, t⁵, t^10, t^15` in
  `(1 + t + t² + t³)⁵`.
- **Parameter dimension.** Plane quartics: `binomial(6, 4) − 1 = 14`.

## Source corrections

The following corrections to the sources are used throughout; each is fixed by an explicit instance.

- **LV, printed p. 971, parameter dimension before (10.8).** The printed dimension
  `binomial(n + d, d − 1) − 1` grows like `d^(n+1)`; the correct dimension is `binomial(n + d, d) − 1 ∼ d^n/n!`,
  the number of degree-`d` monomials in `n + 1` variables minus one. Plane quartics give 14, not 19.
- **LV, Lemma 12.1 and proof, printed pp. 995–996.** The kernel `g_N` has frequencies up to `2N`, so the
  point-count bound is needed through `j = 2N`: the cutoff is `q^((m/2+1)·2N) < b/3` (with `m` the dimension
  of the hypersurface), and the conclusion `dim Z ≤ 3b²/N` is unchanged.
- **LV, proof of Lemma 10.4, printed p. 978.** The similitude multiplier of Frobenius on primitive middle
  cohomology of degree `r` is `ℓ^r`, not `ℓ`; eigenvalues pair as `λ ↔ ℓ^r/λ`.
- **LV, Example 4 after Lemma 11.2, printed p. 988.** For an increasing flag the induced filtration on
  `gr_k = f_k/f_(k−1)` is the image of `F^j ∩ f_k`; a quotient by `f_(k+1)` cannot be the graded piece.
- **LV, end of the proof of Lemma 11.4, printed p. 993.** The forward map is `β ↦ −wβ` and the inverse is
  `α ↦ −w⁻¹α`; the minus signs are needed because the root sets consist of negative roots.
- **LS, §5.8.2 after Definition 5.40, p. 57.** A parabolic does not determine a filtration up to
  reindexing, even for reductive `G`: on `𝔾_m` the cocharacters `t` and `t⁻¹` share the parabolic `𝔾_m`
  but give the chains `0 ⊂ ℚe₊ ⊂ V` and `0 ⊂ ℚe₋ ⊂ V` on `V = ℚe₊ ⊕ ℚe₋` (LS line 2645). The criterion
  of the same passage (equal parabolics and conjugacy in them) is the one used in §2.5.
- **LS, Lemma 6.5, p. 67.** The index-class lemma needs `H` to have finite centre and simple adjoint
  quotient, so among special orthogonal groups only `SO₃` and `SO_N` with `N ≥ 5` qualify; LS line 3082
  places no condition on `N`, and its proof uses the finite centre (LS line 3095). For `H = SO₂ = 𝔾_m` the
  subgroup `{(a, b, ab)} ⊂ H³` surjects onto every pair of factors, so it has three singleton classes,
  but it has dimension 2 and does not surject onto `H³`. For `H = SO₄ = (SL₂ × SL₂)/μ₂`, writing `[x, y]`
  for the image of `(x, y)`, the image `G ⊂ H²` of `(x, y, z) ↦ ([x, y], [x, z])` from `SL₂³` surjects
  onto each factor and has dimension 9 < 12, so it forms one class, while its projection to one factor
  has the three-dimensional kernel `{(1, [±1, z]) : z ∈ SL₂}`. §4.1 assumes the simple adjoint quotient;
  its application in §4.3 has `n ≥ 3`, so `N = n!·d ≥ 6`.
- **LS, Definition 5.44, p. 60.** The associated graded of a decreasing filtration is `F^a/F^(a+1)`.
- **LS, Definition 9.1, p. 85.** Primitivity excludes nonzero stabilizing translations: translation by zero
  fixes every divisor.
- **LS, Lemma 8.10, pp. 78–79.** The balance of `F₀` relative to `f₀` is obtained from LS, Lemma 8.7,
  which assumes the purity of LS, Lemma 8.1; the statement of Lemma 8.10 omits it, and §5.8 assumes it.
  Without it the assertion fails: `ℚ_p ⊕ ℚ_p(−1)` and the nonsplit crystalline Kummer extension of
  `ℚ_p(−1)` by `ℚ_p` attached to `2` (`p` odd) give graded de Rham degrees `0` and `1` against the
  average `1/2`.
- **LS, Definition 8.4 and Lemma 8.7, pp. 75–77.** Lemma 8.7 asserts balance in the sense of Definition 8.4,
  which tests every character of the identity component of the Levi (LS lines 3384–3390 and 3400), while
  its proof shows the vanishing only for the characters of `P` over `ℚ_p` trivial on `Z(G)` (LS line 3478).
  The stronger assertion fails for the coefficient normalizer `GL₂² ⋊ C₂` and the `H¹` of `y² = x³ − x`
  tensored with `ℚ(i)`, `p ≡ 1 mod 4`: the induced degrees `(0, 1 | 1, 0)` differ from the central weight
  `(½, ½ | ½, ½)`, while every character of `M` trivial on `Z(G)` pairs to zero with them (§5.3, Checks).
  §5.3 defines balance through the characters of `M` over the base field; its consumers use the modular
  character (§§5.10, 5.12) and the self-dual block averages (§§7.4–7.5), which that balance gives.
- **LS, proof of Lemma 8.14, p. 80.** The cyclic cocycle lemma is applied on `Z_U(φ^r)`, where conjugation by
  `φ` has order dividing `r`; on all of `U` it can have infinite order (`diag(2, 1)` on an upper root group).
- **LS, proof of Lemma 5.49, pp. 61–62.** The coefficient-linear subgroup need not be connected (for even `N`,
  `GO_N` is disconnected), although the proof treats it as connected (LS line 2830); §2.9 makes no
  reduction to an identity component, since the geometric finiteness of §2.3 allows a disconnected image
  closure, and §2.11 passes to rational classes.
- **LV, proof of Lemma 2.6, printed pp. 906–907.** The transporter `{g : Ad(g)L ⊂ G}` is a finite union of
  double cosets of `G` and of the centralizer `Z_(GL_n)(L)` of the image, not of `G` and `L` (LV lines
  555–558), and the passage to `L°` (LV line 559) loses classes. For `Γ = ℤ/2`, `ρ₀(1) = diag(1, 1, −1, −1)`
  and `G = GL₂ × GL₂ ⊂ GL₄`, the orbit of `G × Z_(GL₄)(L)` through the transposition of `e₂` and `e₃` has
  dimension `16 − 4 = 12`, more than `dim(G × L) = 8`, so there are infinitely many `(G, L)`-double cosets;
  the conjugates of `ρ₀` into `G` form three `G`-classes, while the trivial group `L°` gives one. The
  correction is recorded in LS, proof of Lemma 5.49, pp. 61–62 (LS lines 2832–2837); §2.3 proves the
  geometric finiteness with the centralizer and a possibly disconnected `L`.
- **LS, proof of Lemma 5.49, p. 61, use of LV Lemma 2.3.** Faltings's lemma needs Frobenius characteristic
  polynomials in `ℤ[t]`; integral Frobenius eigenvalues only give algebraic-integer coefficients. §1.9
  supplies rationality for the orbit systems, and this roadmap uses that stronger hypothesis.
- **LS, proof of Lemma A.5, p. 91.** The tail comparison is `<`, giving the upper bound `3/2` (LS line 4303).
- **LS, proof of Lemma A.4, p. 91.** The propagated geometric bound at index `i` has denominator `3^i`
  (LS line 4280).
- **LS, paragraph after the GO computation in Lemma A.1, p. 90.** The descent count has variance
  `(n + 1)/12`, standard deviation `∼ √(n/12)`, not variance `√n/12`.
- **LS, Lemma A.1, pp. 89–90.** The strict inequality holds for the geometric parity choices (`GL` always,
  `GSp` for `n` even, `GO` for `n` odd); for `n = 2`, `d = 1` the nongeometric `GO₂` fails it.

## References

- **LS.** Brian Lawrence and Will Sawin, *The Shafarevich conjecture for hypersurfaces in abelian varieties*,
  arXiv:2004.09046v5 (2025); published in Annals of Mathematics 202 (2025). Locators use the preprint's
  pages and numbering. <https://arxiv.org/abs/2004.09046>
- **LV.** Brian Lawrence and Akshay Venkatesh, *Diophantine problems and p-adic period mappings*,
  Inventiones mathematicae 221 (2020), 893–999; locators use printed pages, cross-checked against
  arXiv:1807.02721v3. <https://arxiv.org/abs/1807.02721>
- **Beauville.** Arnaud Beauville, *Le groupe de monodromie des familles universelles d'hypersurfaces et
  d'intersections complètes*, Complex analysis and algebraic geometry, Lecture Notes in Mathematics 1194
  (1986), 8–18; author's copy, printed page locators.
- **BC.** Victor Batyrev and David Cox, *On the Hodge structure of projective hypersurfaces in toric
  varieties*, arXiv:alg-geom/9306011v1 (1993); PDF page locators.
- **Serre.** Jean-Pierre Serre, *Galois cohomology*, Springer (1997), I §5.4 and III §4.3.
