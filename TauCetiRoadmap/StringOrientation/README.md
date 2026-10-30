# Roadmap: string structures, string connections and the Witten genus

**Summary.** Build String structures on stable Spin bundles as lifts through
the homotopy fibre of the normalized universal class `λ:BSpin→K(ℤ,4)`, with
their obstruction, H³ torsor and transport laws; compare them with the String
bordism spectrum, geometric String bordism and the low stable stems; refine
them to differential String structures, bundle 2-gerbes and string connections
on a native diffeological carrier; and construct the integral Witten genus
from the twisted Dirac index. The end theorems are: existence of a String
lift iff `c*λ=0`, with lifts a torsor under `H³(X;ℤ)`, and the 8-equivalence
of λ (S1); `Ω₃^String≅Ω₃^fr≅ℤ/24` with its framing-change formula (S2); the
affine space of string connections and its `Ĥ³` torsor (S3); integrality and
modularity of the Witten genus of String manifolds (S4); McTague's theorem that
connected-F₄ Cayley-plane bundles generate the kernel of the Witten genus over
`ℤ[1/6]` (S5); and the low-weight positive-Ricci vanishing together with the
two framed counterexamples to the unrestricted refined tmf/TMF questions (S6).
A String lift is kept as data throughout; it is never identified with the
vanishing of a characteristic class.

## Scope and ownership

This roadmap owns: the class λ on stable BSpin and its finite-rank pullbacks;
the classifier BString and the finite-rank BString(n) diagram; String
structures, their torsor, transport, sums, inverses and relative lifts; the
group models String(n) for n≥5; the identification of S1's BString diagram with
the 7-connected-cover diagram that EllipticCohomology E5 Thomifies; geometric
String bordism and its low-stem and framing comparisons; integral differential
cohomology by differential characters, bundle gerbes and 2-gerbes, the basic
gerbe and Chern–Simons 2-gerbe of Spin(n), geometric String structures, string
connections and transgression, with the smooth principal bundles, connections,
good covers and submersion fibre products they are built on (S3.0); the
bridges from the manifold diffeology to `ContMDiff` and to the functional
diffeologies on mapping spaces needed for transgression (S3.5); the octonionic projective plane OP² with its
F₄/Spin(9) isotropy and characteristic classes (S1.5); the structured
Pontryagin–Thom theorem for tangential structures given by bundle diagrams, rational
characteristic-number detection and the odd-primary comparison of Spin and
oriented bordism (S2.2, S5.3); the framed comparison `Ω^fr_n≅π_nS`, the native
stable-range formulation
`π_(n+3)(Sⁿ)≅ℤ/24`, n≥5, of the supplied third stable stem, its quaternionic
Hopf generator comparison, and the stable J-homomorphism in degree 3 (S2.3); the
characteristic series and the integral Witten genus on Spin and String bordism;
Cayley-plane bundles, their family vanishing, McTague's generator criterion and
the kernel theorem away from 6; and the curvature questions of S6.

It leaves to named roadmaps:

- RepresentationTheory/LieHighestWeight Layer 8, “The compact real algebra
  suppliers” and “The formally real Albert supplier”, owns the division
  octonions and the compact real Albert algebra, including the positive norm,
  Jordan identities, positive trace form and smooth coordinate maps. S1.5 owns
  the projective-plane geometry on that carrier.
- DGFloer Layer 11 item 3 owns the compact connected Lie-group finite-cover
  decomposition and its criterion that vanishing π₃ forces a torus; S1.2 owns
  the maximal-compact retraction for general connected Lie groups and its
  application to String(n).
- EllipticCohomology E4.S owns the third stable stem computation, with its
  stable-range application in E5 to `π₁₂(S⁹)≅ℤ/24`. S2.3 transports that input
  to native spheres and compares the geometric framing and Hopf conventions.
- EllipticCohomology E5 owns the E∞ String bordism spectrum MString (the E∞ Thom
  spectrum of `bstring=τ_(≥8)ko→bo→bgl₁(S)`), its comparison with
  GeneralizedCohomology G5.3's sequential Thom spectrum of the 7-connected
  covers, the E∞ map MString→MSpin and the Ando–Hopkins–Rezk orientation
  `σ:MString→tmf` with its q-expansion. E4 owns the spectra tmf, Tmf, TMF, their
  complete coefficient computation, the lifts of Δ⁸, Δ³, Δ²⁴ and the
  localization `tmf[(Δ²⁴)⁻¹]≃TMF`; E6 owns the low-stem unit images and the
  localization criterion. S2 here does not build a second E∞ model.
- GeneralizedCohomology G5.0 owns the stable Spin classifier, its finite-rank
  maps and the Hopf normalization `stableBSpin_hopfGenerator_cTwo`; G2 owns the
  mapping-path carrier and Hurewicz lifting; G3.8 owns connective covers.
- CharacteristicClasses owns characteristic classes and Chern–Weil (C4);
  DifferentialGeometry owns forms, smooth-chain integration and Stokes;
  GeometricTopology Layer 1 owns collars and tubular neighbourhoods.
- IndexTheory I7 owns the twisted Atiyah–Singer theorem and the L- and Â-index
  formulas; SpinGeometry G6 owns Lichnerowicz's theorem; ModularForms owns
  level-one modular forms and q-expansions; BordismFormalGroups F3–F5 owns BP,
  BP⟨1⟩, cooperations and the Adams–Novikov tower.
- SchemeAndStackFoundations §4.13 owns `bertini_smoothness`; AffineMorseLefschetz
  A0 owns `complexProjectiveZeroLocus` and its Jacobian-rank submanifold test.
- Orbifolds O2 item 6 owns the manifold diffeology on Mathlib's
  `DiffeologicalSpace`: its construction from chart plots, chart independence, the
  equality of its D-topology with the manifold topology, open restrictions and
  the finite-product comparison with its topology compatibility. S3.5 builds on
  it the comparison with `ContMDiff` and the subspace, pullback and functional
  diffeologies.
- Mathlib owns `ContinuousMap.Homotopy`, the diffeology class and its plot API in
  `Mathlib/Geometry/Diffeology/Basic.lean`, `ContMDiffMap`, and the Levi-Civita
  connection, and the local-normal-form submersion `Manifold.IsSubmersion`; Tau
  Ceti owns `CovariantDerivative.ricciTensor`.

Three objects stated here are also stated by roadmaps this one does not consume:
smooth principal bundles, connections, curvature, good covers and submersion
fibre products by SmoothBundlesConnections B1.1, B3.1, B4.1, B6.0 and B1.0;
submersion fibre products by LieGroupoidsPoisson G0; and `π₃S≅ℤ/24{ν}` by
HomotopySpheres Stage 9. S3.0 owns the smooth foundations used here; S2.3
consumes the stem from EllipticCohomology E4.S and E5 and owns its geometric
comparisons. Neither layer consumes those later roadmaps.

## Conventions

- **Labels.** Layer k is cited as Sk and its item k.n as Sk.n, in this roadmap
  and by its consumers.
- **Stable default.** "Spin bundle" means stable Spin bundle unless a rank is
  written. Finite-rank String data is the pullback of the stable definition along
  G5.0's finite-rank maps.
- **The class λ.** λ is the unique class in `H⁴(BSpin;ℤ)` with `2λ=p₁`; since
  `H⁴(BSpin;ℤ)≅ℤ` is torsion-free, this leaves no sign choice. On the underlying
  real bundle of the quaternionic Hopf line, `λ=−c₂(γ_H)`, so `⟨λ,hur(g)⟩=−1` for
  G5.0's quaternionic clutching generator g, against G5.0's
  `⟨c₂(ℂγ_H),(h_S4)_*[S⁴]⟩=+1`. Reversing the orientation of S⁴ reverses the sign
  of the pairing; the class λ is the same. For a space with 2-torsion
  in H⁴, λ of a bundle is the pullback of the universal class along its specified
  classifier, never an arbitrary solution of `2x=p₁`.
- **Loops and endpoints.** `ΩK(ℤ,4)` is identified with `K(ℤ,3)` by AlgebraicTopology
  Stage 8.11b's loop comparison, loop coordinate last, unit interval increasing.
  A class α acts on a nullhomotopy `H:λc→0` by appending its loop on the right;
  the difference from `H₀` to `H₁` is `reverse(H₀)` followed by `H₁`.
- **Smooth global hypotheses.** Finite-dimensional manifold inputs to S3’s
  differential constructions and S5’s smooth bundle constructions are Hausdorff
  and second-countable. In particular their bases admit smooth
  partitions of unity and good covers. The local submersion and fibre-product
  statements in S3.0 are also stated without separation assumptions; closed
  embeddedness there requires a Hausdorff base.
- **Differential forms.** Forms are real; curvatures of circle bundles, gerbes
  and 2-gerbes have integral periods; holonomy is `exp(2πi∫)`. Waldorf's
  curvatures are real forms of the same normalization (waldorf-string-connections
  lines 697–699 and 726–730), so his 3-form H of Theorem 1.3.3 is used unchanged.
  The degree-3 transgression is `exp(2πi∫_X H)`; Waldorf's display (4.2.1)
  (waldorf-string-connections lines 1092–1097) omits the factor 2πi, which the
  degree-1 holonomy formula of the same paper (lines 1210–1215) carries.
- **Differential cohomology degrees.** `Ĥᵏ(M;ℤ)` has curvature a closed k-form
  and characteristic class in `Hᵏ(M;ℤ)`; `Ĥ²` is circle bundles with connection,
  `Ĥ³` gerbes with connection, and `h(∂c)=∫_c curv(h)` modulo ℤ.
- **Fibre integration** over a compact oriented X on a mapping space uses the
  product orientation with the parameter first and X second.
- **Curvature.** `R(X,Y)=∇_X∇_Y−∇_Y∇_X−∇_[X,Y]` and `Ric(Y,Z)=tr(X↦R(X,Y)Z)`,
  which is the convention of Tau Ceti's `CovariantDerivative.ricciTensor`.
  `Ric>0` means positive definiteness of the Ricci form of the Levi-Civita
  connection at every point.
- **Witten genus.** `Q(x,q)=(x/2)/sinh(x/2)·∏_(n≥1)(1−qⁿ)²/((1−eˣqⁿ)(1−e⁻ˣqⁿ))`,
  `G_(2k)(q)=−B_(2k)/(4k)+Σ_(n≥1)σ_(2k−1)(n)qⁿ`, and `log Q` has
  `x^(2k)`-coefficient `2G_(2k)/(2k)!`; this is EllipticCohomology E4's Bernoulli
  normalization.
- **Localization.** "Away from 6" means after inverting 6, never 2- or
  3-completion.

## Exact supplier contracts

### From Mathlib

- `ContinuousMap.Homotopy` (`Mathlib/Topology/Homotopy/Basic.lean`): homotopies
  between continuous maps, used for nullhomotopies of `λ∘c` and classifier
  homotopies.
- `DiffeologicalSpace`, `Diffeology.IsPlot`, `Diffeology.DSmooth`,
  `DiffeologicalSpace.CorePlotsOn`, `DiffeologicalSpace.ofCorePlotsOn`,
  `Diffeology.IsDTopologyCompatible`, `Diffeology.IsContDiffCompatible`
  (`Mathlib/Geometry/Diffeology/Basic.lean`): the diffeology class, plots, smooth
  maps, plot construction on open domains, and the complete lattice of
  diffeologies on a type. That file constructs no product, subspace, pullback or
  functional diffeology and no manifold diffeology; Orbifolds O2 item 6
  constructs the manifold diffeology and S3.5 the others, as instances of this
  class. `Diffeology.IsContDiffCompatible` requires a real normed vector
  space and is used only on coordinate/model spaces; general manifolds use the
  chartwise comparison of S3.5.
- `SmoothPartitionOfUnity.exists_isSubordinate`
  (`Mathlib/Geometry/Manifold/PartitionOfUnity.lean`): smooth partitions subordinate
  to open covers of closed sets, with `T2Space` and `SigmaCompactSpace` on the
  manifold. Hausdorff second-countable finite-dimensional bases satisfy these
  hypotheses.
- `ContMDiffMap`, `ContMDiff` (`Mathlib/Geometry/Manifold/ContMDiffMap.lean`):
  bundled smooth maps between manifolds.
- `CovariantDerivative.leviCivitaConnection`, `CovariantDerivative.IsLeviCivitaConnection`
  (`Mathlib/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita.lean`).
- `Manifold.IsSubmersion` (`Mathlib/Geometry/Manifold/Submersion.lean`): a map that
  is, near every point, the projection `(u,v)↦u` in suitable charts, for some global
  choice of complement. The file does not prove the equivalence with surjectivity of
  `mfderiv` in finite dimension and constructs no fibre products; S3.0 does.

### From Tau Ceti

- `CovariantDerivative.ricciTensor`
  (`TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/Ricci.lean`):
  `Ric(u,v)=trace(w↦R(w,u)v)` for the curvature tensor with
  `R(X,Y)Z=∇_X∇_Y Z−∇_Y∇_X Z−∇_[X,Y]Z`; symmetry is not asserted for an arbitrary
  connection.

### From TauCetiRoadmap suppliers

- **GeneralizedCohomology** G2 (mapping-path carrier, G2 item 5 Freudenthal for
  (k−1)-connected pointed CW spaces, G2.10 Hurewicz lifting, compactly generated
  comparison), G3 (telescope Milnor sequence, G3.8 connective
  covers), G5.0 (stable Spin classifier, finite-rank maps, stabilization
  homotopies, `stableBSpin_hopfGenerator_cTwo`), G5.3 (sequential Thom spectra),
  G5.6 (rational cohomology of Eilenberg–Mac Lane spaces).
- **AlgebraicTopology** Stage 6 (universal coefficients, fundamental classes),
  Stage 8 (8.3 Hurewicz, 8.5 Whitehead, 8.7 finite CW models of compact Lie
  groups, 8.10 representability, 8.11b loop comparison).
- **CharacteristicClasses** finite compact-Lie classifying spaces, p₁ and w₄ on
  each BSpin(n), C4 Chern–Weil and C4.3 universal connections.
- **TopologicalKTheory** stable BO/BSO comparison, T2.1 virtual bundles, exterior
  powers, and T2.3's λ-series `λ_t` on virtual classes with its product and
  inverse identities; it states no symmetric-power operation, and S4.1 defines
  `Sym_t` from `λ_t`.
- **SpinGeometry** G4.1 Spin covers, G6 Lichnerowicz.
- **RepresentationTheory/LieHighestWeight** Layer 8, “The compact real algebra
  suppliers” and “The formally real Albert supplier”: positive division-octonion
  norm and conjugation, the compact Albert carrier with its Jordan identities,
  positive trace form and 27-dimensional smooth coordinate structure.
- **DGFloer** Layer 1 item 2 (normalized long exact sequence of a homotopy fibre);
  Layer 11 item 3 (finite cover T×K→G for compact connected G, its isomorphisms
  on πⱼ for j≥2, and nonzero π₃ of nontrivial simply connected semisimple K,
  giving the torus criterion).
- **Orbifolds** O2 item 6 (manifold diffeology from chart plots on Mathlib's
  class, chart independence, equality of the D-topology with the manifold
  topology, open restrictions, common refinements and the finite-product
  comparison with its topology compatibility).
- **DifferentialGeometry** forms, smooth singular chains, Stokes, de Rham.
- **ModularForms** level-one modular forms, dimension formula, q-expansions.
- **BordismFormalGroups** F3–F5 (BP, BP⟨1⟩, cooperations, Hopf rings,
  Adams–Novikov tower).
- **SchemeAndStackFoundations** §4.13 `bertini_smoothness`.
- **AffineMorseLefschetz** A0 `complexProjectiveZeroLocus`.
- **EllipticCohomology** E4.S (independent third stable stem and generator),
  E4 (coefficients, Δ-power lifts, localization), E5
  (`π₁₂(S⁹)≅π₃S≅ℤ/24`, MString, σ, genus comparison), E6 (unit images, localization criterion).
- **GeometricTopology** Layer 1 (collars, tubular neighbourhoods of closed
  submanifolds).
- **IndexTheory** I7.

## How to read the build

S1 is pure homotopy theory on GeneralizedCohomology's classifiers: λ, BString,
String structures and their laws, with no Thom spectrum, genus or coefficient
input. S2 compares S1's classifier with EllipticCohomology's MString and with
geometric bordism and transports the supplied low stems. S3 depends only on S1 and the
differential suppliers and builds the differential refinement. S4 builds the
genus from S2 and the index theorem. S5 uses S2, S4 and S1.5's
Cayley plane for the kernel theorem away from 6. S6 uses S4 for the curvature
questions and EllipticCohomology's coefficients for the framed counterexamples.
No String genus theorem is an input to the obstruction theory.

## Layer 1: the universal obstruction and the String classifier (S1)

### 1.1 The class λ (S1.1)

Define λ as the normalized pointed map `λ:BSpin→K(ℤ,4)` on G5.0's stable Spin
classifier representing the class with `2λ=p₁`. Define the stable p₁ and w₄ on
the same telescope as the unique classes restricting to CharacteristicClasses'
p₁(γ_n) and w₄(γ_n) on each BSpin(n+3); uniqueness uses G3's telescope Milnor
sequence and the vanishing of H³ of these 3-connected stages over ℤ and 𝔽₂
(Milnor–Stasheff, §15 for p₁; §8 for w₄).

- `H⁴(BSpin;ℤ)≅ℤ`, and the stable p₁ is twice a generator.
- λ restricts, stabilizes and pulls back naturally; Whitney-sum and inverse
  formulas hold: `λ(ξ⊕η)=λ(ξ)+λ(η)` and `λ(−ξ)=−λ(ξ)`.
- For G5.0's quaternionic clutching generator g, `⟨λ,hur(g)⟩=−1`, proved on the
  rank-4 quaternionic Hopf line by `λ=−c₂(γ_H)`.
- Reduction mod 2 of λ is w₄ of the underlying real bundle, universally and by
  pullback (intended name spinLambda_modTwo_eq_wFour).
- For the rank-3 adjoint bundle of an SU(2)-bundle V, `λ(ad V)=−2c₂(V)` (intended
  name spinLambda_adjoint_eq_neg_two_cTwo), by the torus weights 0, ±2x.

**Checks.**
- On `H⁴(BSpin;ℤ)=ℤ`, λ is a generator and `p₁=2λ`; the plausible wrong model
  λ:=p₁ violates `2λ=p₁`.
- Quaternionic Hopf line over `S⁴=HP¹`: `⟨λ,hur(g)⟩=−1` while
  `⟨c₂(ℂγ_H),[S⁴]⟩=+1`; the sign-flipped model λ:=c₂ gives +1.
- Adjoint test: `c(ad V⊗ℂ)=(1+2x)(1−2x)=1−4x²`, `c₂(V)=−x²`, so
  `p₁(ad V)=4x²=−4c₂(V)` and `λ(ad V)=−2c₂(V)`; the model "λ restricted to BSpin(3)
  is −c₂" is off by the factor 2.
- Mod 2 on the Hopf line: λ=−1 is odd and w₄ of the underlying real rank-4
  bundle is its Euler class mod 2, the nonzero class.
- Negative control on a torsion base: on the Moore space `X=S³∪_2e⁴`, the
  cellular cochain complex is `ℤ→ℤ`, multiplication by 2, in degrees 3 and 4, so
  `H³(X;ℤ)=0` and `H⁴(X;ℤ)=ℤ/2`; by S1.3's dimension-≤7 classification
  `[X,BSpin]≅ℤ/2`, and the nontrivial stable Spin bundle has `λ≠0` and
  `p₁=2λ=0`, so `p₁=0` does not determine λ. The 5-dimensional Moore space
  `S⁴∪_2e⁵` tests nothing: its multiplication-by-2 cochain map sits in degrees 4
  and 5, so `H⁴=0`, `H⁵=ℤ/2`, and every stable Spin bundle on it is trivial.

*Needs:* GeneralizedCohomology G5.0 (`stableBSpin_hopfGenerator_cTwo`), G3;
CharacteristicClasses (p₁, w₄, c₂ on finite classifying spaces); AlgebraicTopology
Stage 8.10.

### 1.2 BString, BString(n) and String(n) (S1.2)

Define BString by GeneralizedCohomology G2's mapping-path carrier applied to λ
and the basepoint of K(ℤ,4), with the topology of the product of BSpin with the
compact-open path space (not a disjoint sum of endpoint fibres). Construct its
projection, the homotopy-fibre sequence and its long exact sequence (DGFloer
Layer 1 item 2), and a CW replacement with homotopy invariance for classifiers.
For every rank n define BString(n) as the pullback `BSpin(n)×_(BSpin)BString`
along G5.0's finite-rank map, with the pulled-back universal bundle `γ_n^String`,
stabilization maps that cover G5.0's stabilization strictly on the first
coordinate, and the telescope comparison with BString. The stable virtual class
is `[γ_n^String]−[εⁿ]`. For n≥5 construct a compactly generated topological group
String(n) with a continuous homomorphism to Spin(n) whose homotopy fibre is
K(ℤ,2), with classifying space BString(n), by the simplicial loop-group model:
compare `|W̄(Sing Spin(n))|≃BSpin(n)`, lift the classifier and apply the loop-group
adjunction before realization.

- BString is 7-connected, and the composite to BO induces isomorphisms on `π_i`
  for i≥8 (intended name spinLambdaMap_isEightConnected: λ is an isomorphism on
  `π_i` for i<8 and onto on `π₈`).
- For n≥5, String(n)→Spin(n) is an isomorphism on `π_i` for i≥4, String(n) is
  3-connected, and String(n) is independent up to weak equivalence over Spin(n).
- For n≥5, String(n) is not homotopy equivalent to a finite-dimensional Lie group.
  Route: a connected Lie group retracts onto a maximal compact subgroup (owned
  here); DGFloer Layer 11 item 3 supplies the finite-cover comparison and
  the compact connected criterion that `π₃=0` forces a torus; `π₁=0` then
  makes that torus trivial; then the K(ℤ,2)
  fibration gives `Spin(n)≃K(ℤ,3)` by AlgebraicTopology Stage 8.3, 8.5, 8.7 and
  8.10, contradicting `H^(n(n−1)/2)(Spin(n);ℚ)=ℚ` against GeneralizedCohomology
  G5.6's exterior algebra `H*(K(ℤ,3);ℚ)` on one degree-3 generator.
- BString(n) for n≤4 is the pullback and is not identified with a 3-connected
  cover of BSpin(n).

**Checks.**
- `π₄BString=0` and `π₈BString≅π₈BSpin≅ℤ`; the wrong model "homotopy fibre of p₁"
  has `π₃=coker(ℤ→ℤ, ×2)=ℤ/2`, so it is not 7-connected.
- n=3: `λ|BSpin(3)=−2c₂` (S1.1), so the homotopy fibre of λ over BSpin(3) has
  `π₃=ℤ/2`; the 3-connected cover of BSpin(3)=BSU(2) has `π₃=0`. The two differ,
  which is why ranks below 5 are excluded from the group model.
- n=5: `dim Spin(5)=10`, `H^10(Spin(5);ℚ)=ℚ`, while `H^10(K(ℤ,3);ℚ)=0`; this is
  the contradiction in the Lie-group argument.
- On S¹ the compact criterion gives `π₃=0` and `π₁=ℤ`, so it is a nontrivial
  torus; on SU(2) it gives `π₃=ℤ` and `π₁=0`, so simple connectivity alone does
  not imply triviality. Both vanish for the trivial compact group.
- `π₃String(n)=0→π₃Spin(n)=ℤ→π₂K(ℤ,2)=ℤ→π₂String(n)=0` is exact with the middle
  map an isomorphism.

*Needs:* S1.1; GeneralizedCohomology G2, G2.10, G5.0, G5.6; DGFloer Layer 1
item 2 and Layer 11 item 3; AlgebraicTopology Stage 6, Stage 8.3, 8.5, 8.7, 8.10.

### 1.3 String structures, existence and the torsor (S1.3)

For a stable Spin bundle ξ with specified classifier `c:X→BSpin`, define a String
structure as a lift of c to BString with the specified projection identification;
strict lifts on the mapping-path carrier are equivalent to lifts commuting up to
specified homotopy (G2.10) and to nullhomotopies of `λ∘c`
(`ContinuousMap.Homotopy`).

- For every CW complex X, a String structure exists iff `c*λ=0`, and when it
  does, homotopy classes of lifts over c form a torsor under `H³(X;ℤ)`, with
  simply transitive action and difference class under the loop conventions
  (redden-canonical-3forms Proposition 2.2, line 214). Naturality and the cocycle
  law for differences hold.
- For CW X of dimension ≤7, `λ_*:[X,BSpin]→H⁴(X;ℤ)` is a bijection (intended
  name spinLambdaClassifiesSevenDimensionalCW), with relative and dimension-≤4
  instances, by cellular lifting for the 7-connected fibre.
- For arbitrary CW X, `λ(ξ)=0` iff ξ is stably trivial on the 4-skeleton, iff on
  the 7-skeleton, using injectivity of `H⁴(X)→H⁴(X⁴)`.

**Checks.**
- `X=S³`, trivial bundle: lifts form a torsor under `H³(S³;ℤ)=ℤ`.
- `X=S⁴` with the quaternionic Hopf line: `λ=−1≠0`, so no lift; the bundle is
  trivial on the 3-skeleton, so 3-skeleton triviality does not characterize lifts.
- `X=S³∪_2e⁴`, the nontrivial stable Spin bundle (`[X,BSpin]≅H⁴(X;ℤ)=ℤ/2`):
  `p₁=0` and `λ≠0`, so no lift; the trivial bundle has a one-point torsor, since
  `H³(X;ℤ)=0`.
- `X=S¹×S²`: `H³=ℤ`; `[X,BSpin]≅H⁴(X)=0`, so every stable Spin bundle on X is
  trivial and has a ℤ-torsor of lifts.

*Needs:* S1.1, S1.2; GeneralizedCohomology G2.10; AlgebraicTopology Stage 8.10,
8.11b; Mathlib `ContinuousMap.Homotopy`.

### 1.4 Transport, sums, inverses and relative lifts (S1.4)

Construct pullback, isomorphism and diffeomorphism transport along specified
classifier homotopies: a homotopy `c₀→c₁` transports a nullhomotopy by
precomposing the reverse of its λ-image. Construct direct sum through addition
on the simplicial abelian K(ℤ,4) and a specified pointed homotopy
`λ∘⊕≃λ∘pr₁+λ∘pr₂`, unique up to homotopy because `H³(BSpin×BSpin;ℤ)=0`; the
inverse lift over `−ξ` by negating the nullhomotopy; restriction to CW subcomplexes
and open subsets of manifolds; relative lifts on CW pairs with obstructions in
`H⁴(X,A;ℤ)` and differences in `H³(X,A;ℤ)`; and the passage between tangential
and normal String structures along `TM⊕ν≃ε^N`. These are derived constructions
on S1.2’s mapping-path fibre and S1.3’s nullhomotopy torsor: reversal and
concatenation give transport, S1.1’s additive λ gives sum and inverse, and the
relative mapping-space fibre sequence of a CW pair gives the relative
obstruction and difference groups by AlgebraicTopology Stage 8.10’s relative
representability. Applying inverse lifts to the specified stable trivialization
of `TM⊕ν` gives the tangential-to-normal comparison. The loop direction in the
Conventions fixes the minus sign in gauge transport.

- Transport is functorial up to the prescribed homotopies.
- A gauge loop of the classifier acts by the negative of the λ-class of its
  mapping torus slanted against the positively oriented circle; on the trivial
  bundle this is `−Ωλ_*:[X,Spin]→H³(X;ℤ)`.
- Direct sum adds difference classes; the inverse sends α to −α; inverse,
  cancellation and stabilization laws hold with specified trivializations of
  `ξ⊕(−ξ)`.

**Checks.**
- S³ gauge test: for the rank-4 quaternionic clutching loop of G5.0's positive
  `π₄` generator, `Ωλ` has class −1, so transport shifts the torsor by +1; the
  rank-3 adjoint loop has class −2 (from `λ(ad γ_H)=−2c₂(γ_H)`) and is not the
  generator.
- Direct sum of the trivial-bundle lifts with differences α and β on `S³` has
  difference α+β; the inverse of the lift with difference α has difference −α.
- Relative pair `(D⁴,S³)` with the trivial bundle: a lift on `S³` with difference
  α∈`H³(S³;ℤ)=ℤ` from the restricted trivial lift has relative obstruction ±α in
  `H⁴(D⁴,S³;ℤ)=ℤ`, so it extends over D⁴ iff α=0.

*Needs:* S1.1–S1.3; GeneralizedCohomology G5.0; AlgebraicTopology Stage 8.

### 1.5 The Cayley plane (S1.5)

Take `J₃(𝕆)` from RepresentationTheory/LieHighestWeight Layer 8’s compact real
algebra suppliers and formally real Albert supplier: the 27-dimensional real
Jordan algebra of Hermitian matrices over the positive-norm division octonions,
with product `x∘y=½(xy+yx)`, its positive trace form and smooth coordinate maps.
Define OP² as the set of
idempotents of `J₃(𝕆)` of trace 1, and F₄ as the automorphism group of `J₃(𝕆)`.
Prove that F₄ is a compact connected Lie group of dimension 52, that it acts
transitively on OP² with isotropy Spin(9) at `diag(1,0,0)`, so that OP² is a closed
smooth 16-manifold `F₄/Spin(9)`; that `H*(OP²;ℤ)=ℤ[u]/(u³)` with `|u|=8`, by the
cell structure `S⁸∪e¹⁶` whose attaching map is the octonionic Hopf map `S¹⁵→S⁸`;
and that `p(OP²)=1+6u+39u²` (Borel–Hirzebruch I, §19, uncertified), where u is the
generator singled out by `p₂=6u` (the automorphism u↦−u of `H⁸` leaves `u²`
fixed, so the sign of u is pinned by p₂) and OP² carries the orientation with
`⟨u²,[OP²]⟩=1`. Then OP² has a unique Spin structure, since
`H¹(OP²;𝔽₂)=H²(OP²;𝔽₂)=0`, and exactly one String lift class: apply S1.3 with
`H⁴(OP²;ℤ)=0` for existence and `H³(OP²;ℤ)=0` for uniqueness. No coefficient or
genus calculation is an input.

- The F₄ action on OP² is smooth and transitive, and the stabilizer of `diag(1,0,0)`
  is a subgroup isomorphic to Spin(9) acting on the complementary 16-dimensional
  summand by the real spin representation.
- `w(OP²)=1+ū+ū²` for the reduction ū of u mod 2 (Wu's formula with `Sq⁸ū=ū²`),
  `p₁(OP²)=0`, `p₂(OP²)=6u`, `p₄(OP²)=39u²`, the Euler class is `3u²`, and the
  signature is 1.
- The quaternionic analogue HP² is the space of trace-1 idempotents of the 3×3
  quaternionic Hermitian matrices, with `p(HP²)=1+2u+7u²` for its degree-4 generator.

**Checks.**
- For a trace-one idempotent A in the compact Albert algebra,
  `trace(A²)=trace(A)=1`, so the positive trace norm bounds the idempotent locus.
  In the split octonions, `x=(0,0,e₁,0)` has `N(x)=0` despite `x≠0`; the Hermitian
  matrices with diagonal `(1,0,0)` and entries `tx,conj(tx)` in positions (1,2)
  and (2,1) satisfy `A_t²=A_t` and `trace(A_t)=1` for every t∈ℝ, but are
  unbounded. This excludes the split carrier as a model for compact OP².
- Dimension count: `dim F₄−dim Spin(9)=52−36=16=dim OP²`; the wrong isotropy
  Spin(8) (dimension 28) would give a 24-dimensional orbit.
- `H³(OP²;ℤ)=0` gives a one-point torsor, and `H⁴=0` gives existence. λ vanishes
  for the integral reason `H⁴=0`, not because `p₁=0`.
- Signature and Â: with `p₁=p₃=0`, `L₄=(381p₄−19p₂²)/14175` gives
  `(381·39−19·36)/14175=1`, and
  `Â₄=(−192p₄+512p₁p₃+208p₂²−904p₁²p₂+381p₁⁴)/464486400` gives
  `(−192·39+208·36)/464486400=0`. The plausible wrong total class `1+6u+36u²` gives
  signature `(381·36−684)/14175=13032/14175`, not an integer.
- Euler characteristic: `w₁₆=ū²≠0` agrees with `χ(OP²)=3` odd; the model `w=1` would
  force χ even.
- HP² is Spin with `p₁=2u≠0`, so `λ=u≠0` and HP² has no String structure; its
  signature `(7·7−1·4)/45=1` from `L₂=(7p₂−p₁²)/45` checks `p(HP²)`.

*Needs:* S1.3; RepresentationTheory/LieHighestWeight Layer 8 (compact real
algebra suppliers and formally real Albert supplier); CharacteristicClasses (Pontryagin and Stiefel–Whitney classes,
finite compact-Lie classifying spaces); AlgebraicTopology Stage 6 (cellular
cohomology, fundamental classes), Stage 8.7 (finite CW models of compact Lie groups).

### Examples

S³ with its ℤ-torsor of String lifts, the quaternionic Hopf line on S⁴ with
`λ=−1`, the torsion example `S³∪_2e⁴`, and OP² with one lift class.

### Dependencies

GeneralizedCohomology G2, G3, G5.0, G5.6; AlgebraicTopology Stages 6 and 8;
CharacteristicClasses; DGFloer Layer 1 item 2 and Layer 11 item 3;
RepresentationTheory/LieHighestWeight Layer 8.

## Layer 2: String bordism and the low stems (S2)

### 2.1 Comparison with EllipticCohomology's MString (S2.1)

Construct a fibrewise equivalence over BSpin between S1's BString and
`Ω^∞τ_(≥8)ko`, compatible with the finite BString(n) projections and bundles:
identify `Ω^∞τ_(≥4)ko≃BSpin` compatibly with G5.0's block sum and unit, show the
fourth Postnikov section is `Σ⁴Hℤ` with zeroth-space map S1's λ (normalized by
`2λ=p₁` and the −1 pairing), and identify the spectral fibre `τ_(≥8)ko` on zeroth
spaces with BString. Transport EllipticCohomology E5's MString, its comparison with
G5.3's sequential Thom spectrum and its E∞ map MString→MSpin along this
equivalence to S1's finite-rank diagram.

- The S1 diagram `γ_n^String` and E5's diagram of 7-connected covers
  `BO⟨8⟩(n)→BO(n)` have equivalent sequential Thom spectra, by an equivalence
  under the unit and over MSpin.
- The inverse-classifier equivalence `M(−θ_String)≃M(θ_String)` is constructed
  from S1.4's inverse lifts.

**Checks.**
- The zeroth-space map of `τ_(≥4)ko→Σ⁴Hℤ` evaluates to −1 on G5.0's generator,
  matching S1.1; the model with +1 would identify λ with c₂.
- `π₈τ_(≥8)ko=ℤ=π₈BString` and `π₄=0` on both sides.
- Rationally, `H*(BString;ℚ)=ℚ[p₂,p₃,…]`: degree 4 is zero, degree 8 is spanned by p₂.

*Needs:* S1.2, S1.4; EllipticCohomology E5; GeneralizedCohomology G3.8, G5.0, G5.3.

### 2.2 Geometric String bordism (S2.2)

For a tangential structure given by a compatible diagram of maps `θ_n:B(n)→BO(n)`
in GeneralizedCohomology G5's bundle-diagram interface, define a θ-manifold as a
compact smooth manifold with a lift of the classifier of its stable normal bundle
through the diagram, taken as data, and θ-bordism with boundaries, pairs, products
and changes of lift. Prove the Pontryagin–Thom isomorphism `Ω_n^θ≅π_nMθ` onto the
homotopy of G5.3's sequential Thom spectrum: the inverse collapses onto a tubular
neighbourhood of an embedding in a sphere (GeometricTopology Layer 1), and
surjectivity and well-definedness use Thom's transversality theorem for smooth
maps into the Thom space of a smooth vector bundle (Stong, *Notes on Cobordism
Theory*, Chapter II; Milnor–Stasheff §18 for the unoriented and oriented cases).
The isomorphism is natural in maps of diagrams and multiplicative for product
diagrams. Prove rational characteristic-number detection: π_*S⊗ℚ is ℚ in degree 0
and zero otherwise (Serre), so the rational Hurewicz map of a connective spectrum
of finite type is an isomorphism, and for an oriented diagram the composite with
the Thom isomorphism sends a bordism class to its rational characteristic numbers
(Milnor–Stasheff §18). Apply these to the BString(n)→BO(n) diagrams and construct
the ring isomorphism between geometric String bordism and `π_*MString`. Compute `H*(BString;ℚ)=ℚ[p₂,p₃,…]` by the Serre spectral sequence
with λ-normalized transgression, and derive that rational String bordism is
polynomial on one generator in each degree 4k, k≥2, with the characteristic-number
pairing and the forgetful map to rational Spin bordism.

- For every tangential structure θ, geometric θ-bordism and `π_*Mθ` agree, as
  rings when the diagram is multiplicative; the identity diagram of BO(n) gives
  unoriented bordism, BSO(n) oriented bordism and the contractible `EO(n)→BO(n)`
  framed bordism.
- Geometric and homotopical String bordism agree as rings, compatibly with
  the forgetful maps to Spin bordism.
- Rationally, an oriented θ-bordism class is zero iff all its rational
  characteristic numbers pulled back from `H*(B;ℚ)` vanish.
- `Ω_*^String⊗ℚ=ℚ[x₈,x₁₂,x₁₆,…]`.
- Integral and rational String structures differ: rational `p₁=0` does not give a
  String lift.

**Checks.**
- Rank of `Ω_n^String⊗ℚ`: 0 in degree 4, 1 in degrees 8 and 12, 2 in degree 16
  (monomials `x₁₆`, `x₈²`), against the Spin ranks 1, 2, 3, 5 in degrees 4, 8,
  12, 16.
- K3 is Spin with `p₁=−48` rationally nonzero, so it is not String; this
  separates `Ω₄^Spin⊗ℚ=ℚ` from `Ω₄^String⊗ℚ=0`.
- OP² is String (S1.5) with `p₂=6u` and `⟨u²,[OP²]⟩=1`, a nonzero degree-16
  rational class.
- Pontryagin–Thom in degree 0 for the identity diagram: `Ω₀^O=ℤ/2` (a finite set of
  points modulo pairs) and `π₀MO=ℤ/2`; the oriented diagram gives ℤ (signed count),
  so forgetting the lift is not injective in general.
- Rational detection fails integrally: the framed S¹ with the Lie framing is
  nonzero in `Ω₁^fr=ℤ/2` but has no rational characteristic numbers.

*Needs:* S1.2, S2.1; GeneralizedCohomology G5 (bundle-diagram interface), G5.3,
G5.6; GeometricTopology Layer 1; CharacteristicClasses C2 (Thom isomorphism).

### 2.3 Low stems and framings (S2.3)

The unit `S→MString` is an isomorphism on `π_i` for i≤6, because the reduced Thom
cofibre has cells in degrees ≥8. Prove `Ω_n^fr≅π_nS` as the case of S2.2 for the
contractible diagram `EO(n)→BO(n)`, whose Thom spectrum is the sphere spectrum.
Take `π₃S≅ℤ/24` and its generator ν from EllipticCohomology E4.S's independent
sphere computation, with E5's stable-range identification `π₁₂(S⁹)≅π₃S`.
Compare ν with the stable class of the Hopf construction on quaternionic
multiplication `S⁷→S⁴`. Transport the supplied stem to the native stable-range
form: Sⁿ is (n−1)-connected, so GeneralizedCohomology G2 item 5's Freudenthal
theorem makes suspension `π_(n+3)(Sⁿ)→π_(n+4)(S^(n+1))` an isomorphism when
`n+3≤2n−2`, that is for n≥5. Thus every such group is identified with the
supplied `π₁₂(S⁹)≅ℤ/24`, including `π₈(S⁵)`.
Prove that the stable J-homomorphism
`J:π₃SO→π₃S` is onto with kernel 24ℤ: the invariant `e(M)=½p₁(W,M) mod 24` of a
framed 3-manifold M bounding a Spin 4-manifold W is well defined because the
signature of a closed Spin 4-manifold is divisible by 16, so `½p₁` of a closed
Spin 4-manifold lies in 24ℤ (IndexTheory I7 with the quaternionic structure of the
4-dimensional spinors), and e takes the value ±1 on `J` of a generator. Own
`Ω₃^String≃Ω₃^fr` with this ℤ/24 normalization. For a closed
oriented 3-manifold M prove `[M,Spin]≃H³(M;ℤ)` by the 2-connectivity of stable
Spin and the oriented top-cell collapse on each component. For a change of String
structure `α∈H³(M;ℤ)`, on each connected component Mⱼ put
`a_j=⟨α|M_j,[M_j]⟩∈ℤ` and let βⱼ∈π₃Spin≃π₃SO be the unique element with
`(Ωλ)_*(β_j)=a_j`. With S1.4’s gauge formula the tangent framing changes
componentwise by −βⱼ and the inverse normal framing by βⱼ; the change of the
total framed bordism class is `Σ_j J(β_j)`. The sum is finite because M is
compact, and is zero for the empty manifold. Compare G5.0’s quaternionic
generator with ν
and export the sign conversion.

- `π_i MString≅π_i S` for i≤6, and `π₇S→π₇MString` is onto.
- `π₃S≅ℤ/24` with generator ν, and `J:π₃SO≅ℤ→π₃S` is onto with kernel 24ℤ.
- For every n≥5, `π_(n+3)(Sⁿ)≅ℤ/24` on Mathlib's `HomotopyGroup` of the unit
  sphere in `ℝ^(n+1)` (`homotopyGroup_sphere_three_stem`).
- For g with `Ωλ(g)=−1`, increasing the torsor coordinate on S³ by 1 changes the
  framed class by `−J(g)`.

**Checks.**
- `π₃MString≅ℤ/24` while `π₃MSpin=0`; MSpin is the plausible wrong target.
- `π₄=π₅=0` and `π₆=ℤ/2` on both sides of the unit.
- `M=S¹×S²`: `[M,Spin]≅H³(M;ℤ)=ℤ`; `M=S³`: ℤ, matching `π₃Spin=ℤ`.
- For `M=S³⊔S³` and `α=(1,−1)`, with `Ωλ(g)=−1`, the component classes are
  `(β₁,β₂)=(−g,g)` and the total bordism change is `−J(g)+J(g)=0`, although the
  String torsor difference is nonzero. For the empty manifold both H³ and the
  empty sum are zero.
- The e-invariant on the K3 surface minus a disc: `σ(K3)=−16` and `p₁=3σ=−48`, so
  `½p₁=−24≡0 mod 24`, consistent with K3 being closed; dividing by 48 instead of 2
  would give a ℤ/48-valued invariant and the wrong order.
- `π₃S` has order 24, not 12 or 48: its 2-primary part is ℤ/8 and its 3-primary
  part ℤ/3.
- The stable range begins at n=5: `π₇(S⁴)≅ℤ⊕ℤ/12` is not ℤ/24, while `π₈(S⁵)`
  and `π₉(S⁶)` are both ℤ/24; stating the stem on `S⁴` would be false.

*Needs:* S1.4, S2.1, S2.2; IndexTheory I7; SpinGeometry G4.1; GeneralizedCohomology
G2 item 5, G5.0, G5.6; EllipticCohomology E4.S and E5 (third stable stem).

### Examples

The ranks of rational String bordism through degree 16, the left-framed S³ as a
generator of `Ω₃^String≅ℤ/24`, and K3 as a Spin manifold that is not String.

### Dependencies

S1; EllipticCohomology E4.S, E5; GeneralizedCohomology G2 item 5, G3.8, G5, G5.0, G5.3,
G5.6; GeometricTopology Layer 1; CharacteristicClasses; IndexTheory I7;
SpinGeometry G4.1.

## Layer 3: differential String structures (S3)

### 3.0 Principal bundles, connections, good covers and submersion fibre products (S3.0)

For a Lie group G (Mathlib `LieGroup`) and a finite-dimensional Hausdorff
second-countable smooth manifold M,
define a smooth principal G-bundle `P→M` as a smooth free right action of G on P
over M with local smooth sections over an open cover, each giving a G-equivariant
diffeomorphism `U×G≅P|_U`. Define a connection as a 𝔤-valued 1-form A on P with
`R_g*A=Ad(g⁻¹)A` and `A(ξ^#)=ξ` on fundamental vector fields, its curvature
`F_A=dA+½[A∧A]`, pullback along smooth maps and gauge transformations. Connections
exist under these global hypotheses, by gluing local trivial connections with Mathlib's
`SmoothPartitionOfUnity.exists_isSubordinate`, and form an affine space over
`Ω¹(M;ad P)`. Define a good cover as an open cover all of whose nonempty finite
intersections are diffeomorphic to `ℝⁿ`; every Hausdorff second-countable manifold
has a good cover refining any given open cover, by geodesically convex balls of a
Riemannian metric (Bott–Tu, *Differential Forms in Algebraic Topology*, Theorem 5.1);
the existence of convex balls of positive radius at every point (Whitehead's
convexity theorem) is part of this target.
For a surjective `Manifold.IsSubmersion` `π:Y→M` between finite-dimensional
manifolds, without separation assumptions for the local assertions, prove that
π has a smooth local section through every point of Y (from
the local normal form), and that for k≥1 each iterated fibre product `Y^[k]` is an
embedded submanifold of `Y^k`, locally given by the projection normal form, with
smooth projections that are again surjective submersions. If M is Hausdorff,
its diagonal is closed and so is this embedded submanifold, as the inverse image
of that diagonal under the product map
(Lee, *Introduction to Smooth Manifolds*, 2nd ed., Theorem 4.26 and Theorem 6.30).

- `F_(g·A)=Ad(g⁻¹)F_A` under gauge, and `dF_A=[F_A∧A]` (Bianchi).
- On a principal bundle presented with the data CharacteristicClasses C4.1
  applies its invariant polynomials to (a smooth principal bundle, a principal
  connection and its curvature 2-form), the connection and curvature defined here
  agree with the ones C4.1 feeds to Chern–Weil, so that S3.1's "one half of the
  `p₁` Chern–Weil form" is a statement about a single carrier.
- For k≥2 the face maps `Y^[k]→Y^[k−1]` omitting one factor and the diagonal degeneracies
  are smooth, the face maps are surjective submersions, and together they satisfy
  the simplicial identities.

**Checks.**
- Trivial bundle `M×G`: connections correspond to `Ω¹(M;𝔤)` by pulling back along
  the unit section; the model "connections are closed forms" excludes the
  non-flat `A=x dy` on `ℝ²×U(1)`, whose curvature `dx∧dy` is nonzero.
- For abelian G the bracket term vanishes and `F_A=dA` descends to a closed 2-form
  on M. For G=SU(2) on `ℝ²×SU(2)`, the constant form `A=τ₁dx+τ₂dy` with
  `[τ₁,τ₂]=2τ₃` has `dA=0` but `F_A=[τ₁,τ₂]dx∧dy=2τ₃dx∧dy≠0`, so `F=dA` is the wrong
  formula in the non-abelian case.
- `S¹` with two arcs is a good cover only if each intersection is connected; the
  standard two-arc cover has `U∩V` with two components, so it is not good, while
  three arcs give a good cover.
- For the projection `ℝ²→ℝ`, the self fibre product is
  `{((x,u),(x,v)):x,u,v∈ℝ}`, a closed 3-manifold, with dimension `2·2−1=3`.
  For the chart cover `ℝ⊔ℝ→M` of the line with doubled origin, a cross-component
  of the self fibre product is `{(t,t):t≠0}`: it has dimension 1 but omits its
  limit `(0,0)`, so it is not closed. The base fails precisely the Hausdorff
  hypothesis of the closedness statement.
- The non-submersion `x↦x²` from ℝ onto `[0,∞)⊂ℝ` fails the local-section property
  at 0, and its self fibre product `{(x,y):x²=y²}` is not a manifold at the origin.
- Carrier comparison on the trivial bundle `M×G` with the connection pulled back
  from `A∈Ω¹(M;𝔤)`: both carriers assign the curvature `dA+½[A∧A]`; on the SU(2)
  example above this is `2τ₃dx∧dy`, and a carrier whose bracket term were `[A∧A]`
  would give `4τ₃dx∧dy`, so the comparison is a theorem, not a convention.

*Needs:* Mathlib `LieGroup`, `SmoothPartitionOfUnity.exists_isSubordinate`,
`Manifold.IsSubmersion`; DifferentialGeometry (forms, exterior derivative);
RiemannianGeometry (geodesics and exponential maps); CharacteristicClasses C4.1
(the carrier comparison).

### 3.1 Differential characters and the refinement of λ (S3.1)

For k≥1 define `Ĥᵏ(M;ℤ)` as differential characters on smooth (k−1)-cycles,
with curvature and characteristic class pinned by `h(∂c)=∫_c curv(h)` mod ℤ;
put `Ĥ⁰(M;ℤ)=H⁰(M;ℤ)` and set the groups in negative degrees to zero.
Cheeger–Simons degree k is degree k+1 here
(cheeger-simons, definition on p. 52, line 100). Write Ωʲ_ℤ for closed real
j-forms with integral periods. Prove, for k≥1, the natural exact sequences
`0→H^(k−1)(M;ℝ/ℤ)→Ĥᵏ(M;ℤ)→Ωᵏ_ℤ(M)→0` and
`0→Ω^(k−1)(M)/Ω^(k−1)_ℤ(M)→Ĥᵏ(M;ℤ)→Hᵏ(M;ℤ)→0`
(Cheeger–Simons Theorem 1.1, p. 52, cheeger-simons line 114).
Construct pullback by precomposition on smooth cycles and the natural product
`Ĥʳ×Ĥˢ→Ĥ^(r+s)`, associative and graded commutative, with curvature the wedge
product and characteristic class the cup product (Cheeger–Simons Theorem 1.11,
pp. 56–57, cheeger-simons line 254).

For k≥1, a smooth homotopy `F:M×[0,1]→N` and `h∈Ĥᵏ(N;ℤ)`, prove
`F_1*h−F_0*h=a(K F*curv(h))`, where `a(η)(z)=∫_zη mod ℤ` and
`Kω=∫_0^1 i_(∂t)ω dt`, with the interval increasing. Derive this by evaluating
on the smooth prism of each cycle and applying the defining boundary identity
and Stokes; equivalently use the homotopy-formula proof of Bunke Proposition
3.28, p. 41 (bunke-differential-cohomology line 1585). The contraction convention
for K fixes its sign even though the product is written with M first.

For k≥1 construct the good-cover Čech–Deligne comparison using the real complex
`ℤ→Ω⁰→…→Ω^(k−1)` in degrees 0 through k, evaluating its degree-k cocycles on
smooth (k−1)-cycles. Derive the comparison and independence of good cover from
the Poincaré lemma and the partition-of-unity contraction on S3.0’s good covers;
the exact sequences above and the five lemma prove that evaluation is an
isomorphism. This is the real-coefficient version of Bunke’s Lemma 3.5,
pp. 33–34, equation (23), p. 38, and Corollary 3.131, p. 68
(bunke-differential-cohomology lines 1264, 1442, 2619): the source uses complex
forms and ℂ/ℤ, while the same contraction and de Rham argument here use real
forms and ℝ/ℤ throughout.

Define the degree-4 refinement λ̂ for a Spin connection from the universal
compatible pair (one half of the p₁ invariant polynomial, λ), whose real classes
agree by S1.1 and CharacteristicClasses C4. Apply Cheeger–Simons Theorem 2.2,
p. 58 (cheeger-simons line 341), using CharacteristicClasses C4.3’s universal
connections; uniqueness is among natural assignments for this universal pair.

- λ̂ has characteristic class λ and curvature one half of the p₁ Chern–Weil form.
- Connection change and transgression follow from the displayed homotopy
  formula applied to an interpolating connection; pullback and stabilization
  follow from the universal natural-character construction.

**Checks.**
- `Ĥ⁰(pt)=ℤ`, `Ĥ¹(pt)=ℝ/ℤ`, `Ĥᵏ(pt)=0` for k≥2; a degree-shifted convention
  would put ℝ/ℤ in degree 0.
- A circle bundle with connection on S² has curvature with integral `c₁`; for the
  Hopf bundle, `∫_(S²)curv=±1`, and holonomy around the boundary of a disc D is
  `exp(2πi∫_D curv)`.
- For k=1 on a point, the curvature sequence has kernel ℝ/ℤ and target 0;
  the characteristic-class sequence gives the same group as ℝ/ℤ. For k=2,
  both sequences give 0. Thus the two index conventions agree after the shift.
- On ℝ, take the degree-1 character `h(x)=x mod ℤ` and the homotopy of a point
  `F(t)=t/2`: the endpoint difference and `a(KF*dx)` both equal `1/2 mod ℤ`.
  Reversing F gives `−1/2 mod ℤ`; taking `F(t)=t/3` distinguishes the signs,
  with endpoint difference `1/3` rather than `−1/3`.
- On S³, `Ĥ³(S³)` surjects onto the closed 3-forms with integral periods, with
  kernel `H²(S³;ℝ/ℤ)=0`.

*Needs:* DifferentialGeometry (smooth chains, Stokes, de Rham); CharacteristicClasses
C4, C4.3; S3.0; S1.1; AlgebraicTopology Stage 6 (cochains and cup products).

### 3.2 Bundle gerbes and 2-gerbes (S3.2)

Construct smooth U(1) bundle gerbes on surjective submersions Y→M, their
1-isomorphisms on common refinements and 2-isomorphisms, and bundle 2-gerbes with
products, duals, associators, pentagons, trivializations and their 2-groupoids.
Build each fibre product `Y^[k]` by S3.0's submersion fibre products, with the face and degeneracy maps smooth and simplicial. Prove the exact
alternating pullback complex `δ=Σ_(i=1)^k(−1)^(i−1)omit_i*` on forms, gerbe descent,
independence of covers, and the classifications of gerbes and 2-gerbes with
connection by `Ĥ³` and `Ĥ⁴` (cjmsw-bundle-gerbes Proposition 4.8, line 913).

- For k≥1, `dim Y^[k]=k·dim Y−(k−1)·dim M`.
- Pullback in integral cohomology along a surjective submersion is not assumed
  injective.

**Checks.**
- `Y=M` (identity cover): `Y^[k]=M`, and a gerbe is a circle bundle on M with a
  trivialized self-product; dimension formula gives dim M.
- k=2: `dim Y^[2]=2dim Y−dim M`, the fibre-product dimension.
- Two arcs `Y=U⊔V` covering `M=S¹`: `0→Ω⁰(S¹)→Ω⁰(Y)→Ω⁰(Y^[2])` is exact, and on
  `Y^[2]` the differential is `δ=pr₂*−pr₁*`; a pair of functions agreeing on both
  components of `U∩V` glues.

*Needs:* S3.0; DifferentialGeometry; S3.1.

### 3.3 The basic gerbe and the Chern–Simons 2-gerbe (S3.3)

For Spin(n), n≥5, construct the basic gerbe representing the generator
`η_λ∈H³(Spin(n);ℤ)` whose universal transgression is λ, with its multiplicative
structure and invariant connection; the curvature is the closed 3-form
`⅙⟨θ∧[θ∧θ]⟩` for the inner product normalized so that it represents the
generator (waldorf-string-connections lines 726–730; meinrenken-basic-gerbe §5.2,
line 524, where the same 3-form is written `¹⁄₁₂ θ·[θ,θ]` for his basic inner
product, and §5.4, line 627, for general simply connected G). Prove `H³(Spin(n);ℤ)≃H⁴(BSpin(n);ℤ)` by transgression,
multiplicativity iff transgressive (cjmsw-bundle-gerbes Theorem 5.8, line 1109),
and build the Chern–Simons 2-gerbe of a Spin bundle with its connection
(waldorf-string-connections Lemma 3.1.2, line 759). Stabilize ranks below 5.

- The Chern–Simons 2-gerbe has characteristic class λ and curvature `½p₁(A)`.
- Its trivializations correspond to S1 String structures, equivariantly for
  `H³(X;ℤ)`, compatibly with pullback and change of classifier; each trivialization
  gives Redden's string class restricting to the fibre generator
  (redden-canonical-3forms Proposition 2.3, line 237).

**Checks.**
- At rank 3, a gerbe representing the generator of `H³(SU(2);ℤ)` has half the
  stable λ level, since `λ|BSpin(3)=−2c₂`; it is not the restriction of this
  construction.
- With the normalized form, `∫_(S³)⅙⟨θ∧[θ∧θ]⟩=±1` on the quaternionic
  `Sp(1)⊂Spin(4)⊂Spin(n)` and `±2` on the adjoint `Spin(3)⊂Spin(n)`, whose map on
  `π₃` is multiplication by 2.
- The curvature 4-form of the 2-gerbe integrates to `λ=−1` on the quaternionic
  Hopf line over S⁴.

*Needs:* S1.1, S1.3, S3.1, S3.2; CharacteristicClasses C4.

### 3.4 Geometric String structures and string connections (S3.4)

Define a geometric String structure as a trivialization of the Chern–Simons
2-gerbe with compatible connection.

- Every S1 String structure admits a compatible connection
  (waldorf-string-connections Theorem 1.3.4, line 428).
- On a fixed trivialization T with covers `π:Y→M` and `ω:W→Y`, compatible
  connections form an affine space over `V_T=(Ω²(M)⊕Ω¹(Y)⊕Ω¹(W))/U` with
  `U={(dχ,π*χ+ν,ω*ν):χ∈Ω¹(M),ν∈Ω¹(Y)}` (waldorf-string-connections lines 876–882,
  Proposition 3.3.4, line 885).
- Isomorphism classes of geometric trivializations form a torsor under `Ĥ³(M;ℤ)`
  when λ vanishes, and forgetting connections recovers S1's `H³` torsor.
- There is a unique `H∈Ω³(M)` with `π*H=K_∇+TP(A)` on the Spin frame bundle, with
  `dH=curv(λ̂)` and `H_(T·κ)=H_T+curv(κ)` (waldorf-string-connections
  Theorem 1.3.3, line 404). Geometric String structures are distinct from the
  vanishing of λ̂.

**Checks.**
- `M=Y=W=pt`: `V_T=0`, so a compatible connection is unique.
- `M=S³`, trivial Spin bundle and flat connection: `dH=0`, and acting by
  κ∈`Ĥ³(S³)` with characteristic class n∈`H³(S³;ℤ)=ℤ` changes `∫_(S³)H` by
  `∫curv(κ)=n`, recovering the ℤ-torsor of S1.3.
- On the quaternionic Hopf line over the closed S⁴, `∫_(S⁴)½p₁(A)=−1` but
  `∫_(S⁴)dH=0` for every global 3-form H by Stokes. Thus there is no H with
  `dH=½p₁(A)` and no geometric String structure, in agreement with S1.3.
- On the trivial Spin bundle over S⁴ with flat connection and the trivial
  geometric String structure, `H=0` and both `∫dH` and `∫½p₁(A)` are 0.

*Needs:* S3.1–S3.3; S1.3.

### 3.5 Diffeological manifold and mapping-space bridges (S3.5)

Take the manifold diffeology of Orbifolds O2 item 6 on Mathlib's
`DiffeologicalSpace`, with its chart independence, the equality of its D-topology
with the manifold topology, its open restrictions and its finite-product
comparison. Prove that on open Euclidean domains its plots are exactly the
`ContMDiffOn` maps and that `DSmooth f ↔ ContMDiff I J ∞ f` for
finite-dimensional boundaryless source manifolds, and identify the bundled smooth
maps with `ContMDiffMap`. Construct subspace, pullback and functional diffeologies
as instances of Mathlib's class, with universal properties; a family
`p:U→C^∞(X,M)` is a plot exactly when `(u,x)↦p(u)(x)` is smooth. Prove smooth
evaluation, composition, currying and uncurrying, and, for the functional
diffeology, compatibility of the D-topology of `C^∞(X,M)×X` with the product
topology when X is locally compact, the manifold factors being Orbifolds'
finite-product comparison. On general topological carriers carry
`Diffeology.IsDTopologyCompatible` whenever the topology must equal the
D-topology. Use the chartwise `DSmooth`/`ContMDiff` comparison on manifolds and
`Diffeology.IsContDiffCompatible` only on real normed coordinate/model spaces.
The functional-diffeology universal properties require no vector-space
structure on `C^∞(X,M)`. Construct plotwise forms, exterior
derivative, wedge and pullback, and fibre integration over a compact oriented X
with the parameter-first orientation, with Stokes. The lean-catdg development is
a comparison for these constructions; no second class of diffeological spaces is
introduced.

- On ℝⁿ the manifold diffeology is Mathlib's normed-space diffeology.
- Evaluation `C^∞(X,M)×X→M` is smooth.

**Checks.**
- `x↦|x|` on ℝ is not a plot; `x↦x³` is a plot whose inverse is not.
- The rotation family `u↦(θ↦θ+u)` on S¹ is a plot of `C^∞(S¹,S¹)`.
- Evaluation identifies `C^∞(pt,S¹)` with S¹ as a diffeological space; its
  fundamental group is ℤ, whereas a real normed vector space contracts by
  `(t,v)↦(1−t)v` and has π₁=0. A general mapping space therefore cannot carry
  the normed-space compatibility class. On ℝ, that class gives exactly the
  native `ContDiff ℝ ∞` plot test.
- Fibre integration over S¹ sends `du∧dθ` to `2π du` and `dθ∧du` to `−2π du`; the
  X-first orientation would give the opposite signs.

*Needs:* Orbifolds O2 item 6; Mathlib `DiffeologicalSpace`, `Diffeology.IsPlot`,
`Diffeology.DSmooth`, `DiffeologicalSpace.CorePlotsOn`,
`DiffeologicalSpace.ofCorePlotsOn`, `Diffeology.IsDTopologyCompatible`,
`Diffeology.IsContDiffCompatible`, `ContMDiffMap`; DifferentialGeometry.

### 3.6 Transgression (S3.6)

Construct transgression over closed oriented manifolds of dimension 0–3: evaluation
in dimension 0, loop gerbes in dimension 1, circle bundles of surface
trivializations in dimension 2, and holonomy `exp(2πi∫_X H)` in dimension 3, on
S3.5's mapping spaces. Prove loopability in the principal connected Spin case and
carry it as a hypothesis for general covers. Construct the map from geometric
trivializations to families of sections of the transgressed Chern–Simons data.

- The map is injective by evaluation at a point (waldorf-string-connections
  Lemma 4.3.2, line 1258).
- Under the explicit hypothesis that the transgressed theory and its sections are
  determined by their value at a point, it is surjective
  (waldorf-string-connections Lemma 4.3.3, line 1289). No unconditional comparison
  with a theory on bordisms with corners is claimed.

**Checks.**
- `X=S³` with `∫H=1`: holonomy `exp(2πi)=1`; the uncorrected formula `exp(∫H)`
  gives e, which is not in U(1).
- Dimension 0 evaluation at a point recovers the trivialization itself.
- Changing T by κ with `∫_(S³)curv(κ)=1` leaves the holonomy unchanged.

*Needs:* S3.4, S3.5.

### Examples

The basic gerbe on SU(2)⊂Spin(5), geometric String structures on S³ and their
holonomy, and the unique connection over a point.

### Dependencies

S1; DifferentialGeometry; RiemannianGeometry; CharacteristicClasses C4, C4.1;
Orbifolds O2 item 6; Mathlib's submersion and diffeology files.

## Layer 4: characteristic series and the integral Witten genus (S4)

### 4.1 The series Θ_q and Q (S4.1)

Define the symmetric-power series of a virtual class V as
`Sym_t(V)=λ_(−t)(V)⁻¹`, the inverse of TopologicalKTheory T2.3's λ-series
evaluated at −t, a unit power series with constant term 1 by T2.3's inverse
identity; it is multiplicative on sums, and on `V−rank V` it equals
`λ_(−t)(V)⁻¹·(1−t)^(rank V)`. Construct
`Θ_q(V)=⊗_(n≥1)Sym_(qⁿ)(V_ℂ−rank V)` in completed K-theory, with
coefficientwise finiteness and product and naturality laws, and the scalar series Q
of the Conventions with its expansions, logarithm and comparison with the Chern
character of `Θ_q`.

- `log Q` has `x^(2k)`-coefficient `2G_(2k)/(2k)!`.
- `ch Θ_q(L⊕L̄−2)` on a complex line with `c₁=x` is the q-part of Q.

**Checks.**
- q⁰ and k=1: `log((x/2)/sinh(x/2))=−x²/24+…`, and `2G₂/2!` at q⁰ is
  `2·(−1/24)/2=−1/24`.
- q¹: `Θ_q(V)=1+q(V_ℂ−rank V)+O(q²)`.
- On a line bundle L, `λ_(−t)(L)=1−tL` and `Sym_t(L)=(1−tL)⁻¹=1+tL+t²L²+…`, the
  symmetric powers of a line; on a trivial line `Sym_t(ε−1)=(1−t)⁻¹(1−t)=1`, so
  trivial summands contribute nothing to `Θ_q`. The model `Sym_t:=λ_t⁻¹` gives
  `(1+tL)⁻¹=1−tL+…`, with the wrong sign in degree 1.
- k=2 at q⁰: `G₄=1/240`, and `log((x/2)/sinh(x/2))` has `x⁴`-coefficient
  `1/2880=2·(1/240)/24`.

*Needs:* TopologicalKTheory T2.1 (virtual bundles), T2.3 (λ-series on virtual
classes with product and inverse identities); CharacteristicClasses.

### 4.2 The integral genus and modularity (S4.2)

For a closed Spin manifold of dimension 4k, the coefficient of qⁿ of the Witten
genus is the index of the Dirac operator twisted by the n-th coefficient of `Θ_q`,
by IndexTheory I7. Construct the ring map from Spin bordism to `ℤ[[q]]` with
constant term Â. For Spin manifolds with rational `p₁=0` (in particular String
manifolds) prove modularity of weight 2k with integral q-expansion, using
ModularForms' q-expansion comparison. Prove independence of connections and of
the String lift.

- `φ_W(M)=Â(M)+q·Â(M;T_ℂ−dim M)+O(q²)`.
- `φ_W(M)` is a level-one modular form of weight 2k with q-expansion in `ℤ[[q]]`.
- `φ_W(OP²)=0`.

**Checks.**
- OP² (S1.5): `Â(OP²)=0`, so the weight-8 form `φ_W(OP²)` is a
  multiple of `E₄²` with constant term 0, hence 0.
- Dimension 4: weight-2 level-one forms are zero, so `φ_W=0`, consistent with
  `Â=−p₁/24=0`.
- Signature check on OP²: `L₄=(381p₄−19p₂²)/14175` with `p₂=6u`, `p₄=39u²` gives
  `(381·39−19·36)/14175=14175/14175=1`, the signature.

*Needs:* S4.1, S2.2; IndexTheory I7; ModularForms; S1.5.

### Examples

The OP² values `Â=0`, `L=1`, `φ_W=0`.

### Dependencies

S2; TopologicalKTheory T2.1, T2.3; CharacteristicClasses; IndexTheory I7;
ModularForms.

## Layer 5: Cayley-plane bundles and the kernel away from 6 (S5)

### 5.1 Cayley-plane bundles (S5.1)

For a smooth principal F₄-bundle P→B, construct the associated OP² bundle
`E=P×_(F₄)OP²→B` from S1.5’s action by gluing `U×OP²` with the transition
functions of S3.0. The vertical tangent bundle is `P×_(F₄)T(OP²)→E`;
using `E≅P/Spin(9)`, identify it with `P×_(Spin(9))ℝ¹⁶` for S1.5’s isotropy
representation. Lift that representation to Spin(16) through the spin cover
using simple connectivity of Spin(9), and thereby construct its vertical Spin
structure. If B has a chosen Spin structure, the stable splitting
`TE≅T_vert E⊕π*TB` gives a total-space Spin structure with
`λ(TE)=λ(T_vert E)+π*λ(TB)`; S1.3 supplies the obstruction and torsor for its
String lifts. The total-space String lift is part of the cycle data.
These are derived constructions from local associated-bundle gluing, the
isotropy representation and S1.4’s sum/transport laws, not a claim that a
String fibre alone gives a String total space.

- Pullback glues the pulled-back transition functions and preserves the vertical
  Spin structure. For a base map f:B′→B with a specified stable Spin
  identification `TB′≃f*TB`, the induced stable identification of total tangent
  bundles transports a total-space String lift by S1.4; an arbitrary base
  change need not preserve such a lift.
- Products with a closed String manifold carry the sum lift. A bordism of
  principal bundles with a chosen total-space String lift induces its boundary
  lifts by restriction as in S1.4.
- For a closed Lie subgroup H⊂F₄ and a smooth reduction to a principal H-bundle,
  the associated bundle via the restricted H-action agrees with E, including
  its vertical Spin data.

**Checks.**
- `dim F₄−dim Spin(9)=52−36=16=dim OP²`.
- `χ(F₄/Spin(9))=|W(F₄)|/|W(B₄)|=1152/384=3=χ(OP²)`.
- The product bundle `OP²×HP²→HP²` has String fibre and String vertical bundle,
  but its total space is not String because `λ(HP²)=u≠0` (`p₁(HP²)=2u`); the
  total-space lift is therefore part of the cycle data. This product is the
  pullback of `OP²→pt` along `HP²→pt`, so arbitrary base change cannot transport
  the String structure of the original total space.

*Needs:* S1.5; S1.3–S1.4; S2.2 (bordism); S3.0 (principal bundles and
connections for the tangent splitting); SpinGeometry G4.1 (spin covers).

### 5.2 Family vanishing and the homogeneous pushforward (S5.2)

Build the ordinary-cohomology pushforward for `G/H` with G compact connected and H
connected of maximal rank: the vertical tangent weights are the roots of G
complementary to H, and the pushforward is the Weyl-coset alternating sum
(mctague-cayley-plane line 739 citing Borel–Hirzebruch Theorem 10.7; line 775,
Theorem 5 citing Borel–Hirzebruch Theorem 20.3), proved polynomial in the localized
root ring, over `ℤ[1/6]` for F₄. Prove that the Witten genus of the total space
of every connected-F₄ OP² bundle with a String structure vanishes, via the
theta-function identity and the Jacobi triple product (mctague-cayley-plane
line 104).

- The vanishing is universal on the classifying space and pulls back to every
  closed String total space; it does not use a positive-Ricci hypothesis or an S³
  action on the total space.

**Checks.**
- F₄ has 24 positive roots and B₄ has 16, leaving 8 complementary positive roots,
  half the real dimension 16.
- Three Weyl cosets, matching `χ(OP²)=3`.
- The fibre itself: `φ_W(OP²)=0` (S4.2).

*Needs:* S4.2, S5.1; S1.5; CharacteristicClasses.

### 5.3 String bordism at primes above 3 (S5.3)

Using BordismFormalGroups F3–F5, construct the Hovey–Ravenel H-space
splitting for every odd prime p and positive degree d divisible by 4,
`BO⟨d⟩_(p)≃∏_(i=0)^((p−3)/2) BP⟨1⟩_(d+4i)`, where the subscript on BP⟨1⟩
denotes its Ω-spectrum space. Under this splitting the connective-cover map
`BO⟨d+4⟩_(p)→BO⟨d⟩_(p)` is the identity on the common factors of degrees
`d+4i`, `0<i<(p−1)/2`, and multiplication by v₁ on the remaining factor,
`[v₁]:BP⟨1⟩_(d+2(p−1))→BP⟨1⟩_d`
(Hovey–Ravenel, April 1994 preprint, Corollary 1.5(2), p. 8,
hovey-ravenel line 292). For p>3 construct Hovey’s ring presentation of
`π_*MString_(p)` with its map to `π_*MSpin_(p)` (Hovey Theorem 2.4;
mctague-cayley-plane line 446). Prove the absence of p-torsion and the forgetful
injection for p>3,
and that Pontryagin numbers detect `π_*MString[1/6]` (mctague-cayley-plane
line 370), using S2.2's rational detection and the odd-primary comparison of Spin
and oriented bordism: the fibre of `BSpin→BSO` is `K(ℤ/2,1)`, whose reduced
homology with `ℤ[1/2]` coefficients vanishes, so `BSpin→BSO` and, by the Thom
isomorphism, `MSpin→MSO` are isomorphisms on homology with `ℤ[1/2]` coefficients
and hence equivalences after inverting 2.

**Checks.**
- At p=3,d=8 the splitting has the single factor `BP⟨1⟩₈`; the map from d=12
  is `[v₁]:BP⟨1⟩₁₂→BP⟨1⟩₈`, with no identity factors. At p=5,d=8 the factors
  are `BP⟨1⟩₈×BP⟨1⟩₁₂`; the map from d=12 is the identity on the degree-12
  factor and `[v₁]:BP⟨1⟩₁₆→BP⟨1⟩₈` on the other. The splitting at 3 makes
  no assertion of torsion-freeness of String bordism at 3.
- `π_*MString_(p)` for p≥5 is a sum of suspensions of BP, so it is torsion-free.
- Rational ranks agree with S2.2's polynomial count.
- The ring is not polynomial: it is a quotient of a polynomial ring by an
  infinite regular sequence (Hovey, abstract).
- The odd-primary comparison fails at 2: `π₁MSpin=ℤ/2` while `π₁MSO=0`, so
  `MSpin→MSO` is not an equivalence before inverting 2.

*Needs:* BordismFormalGroups F3–F5; S2.2; CharacteristicClasses C2 (Thom
isomorphism); AlgebraicTopology Stage 8.5 (Whitehead).

### 5.4 McTague's generator criterion and the geometric families (S5.4)

Prove: a set S generates `π_*MString[1/6]` if (1) for each n>1 it contains M⁴ⁿ with
`ord_p(s_n[M⁴ⁿ])=1` for every p>3 with `2n=pⁱ−1` or `2n=pⁱ+pʲ` (0≤i≤j) and 0 for
all other p>3, and (2) for each p>3 and 0<i<j it contains N of dimension
`2(pⁱ+pʲ)` with `s_((pⁱ+pʲ)/2)[N]=0` and `s_((pⁱ+1)/2,(pʲ−1)/2)[N]≢0 mod p²`
(mctague-cayley-plane Theorem 4, line 324). Construct the total spaces over
products of smooth complete intersections in complex projective space of degrees 2
and 3: smoothness of a general complete intersection follows from
SchemeAndStackFoundations §4.13 `bertini_smoothness`, applied inductively to the
very ample systems `O(d)`, and the Jacobian-rank comparison owned here turns the
smooth complete intersection into AffineMorseLefschetz A0's
`complexProjectiveZeroLocus` submanifold. Use the tangent sequence
`0→TV→i*TCP→⊕O(d_j)→0`, the vertical contribution `4n_f²(x₁²+x₂²)`, and λ=0 from
the integral class on the torsion-free degree-4 cohomology. Choose degrees by
`n=3a+8b`, solvable for every n≥14 (mctague-cayley-plane Lemma 8, line 1030).
Prove the gcd valuations by Kummer and Lucas and the prime-square congruences
(mctague-cayley-plane Lemma 12, line 1131; Proposition 11, line 1114).

**Checks.**
- n=13 has no solution of `3a+8b=13` (b=0: 13/3; b=1: 5/3), while 14=3·2+8,
  15=3·5, 16=8·2; 13 is the Frobenius number `3·8−3−8`.
- n=2 (dimension 8): `2n=4=5¹−1`, so condition (1) asks `ord_5(s₂)=1` and
  `ord_p(s₂)=0` for p≥7.
- n=3 (dimension 12): `6=7−1=5⁰+5¹`, so condition (1) asks `ord_5=ord_7=1`.

*Needs:* S5.3; SchemeAndStackFoundations §4.13 `bertini_smoothness`;
AffineMorseLefschetz A0 `complexProjectiveZeroLocus`; CharacteristicClasses; S1.3.

### 5.5 The kernel theorem and the integral questions (S5.5)

Prove that connected-F₄ OP²-bundle classes generate exactly the kernel of the
Witten genus on `π_*MString[1/6]`, and its rational specialization
(mctague-cayley-plane Theorem 1, line 58). For
EllipticCohomology E5's σ, define I_OP as the ideal generated by connected-F₄ OP²
bundles with all total-space String structures and state the integral inclusion
`I_OP⊆ker σ_*` and the equality `ker(σ_*:Ω_*^String→π_*tmf)=I_OP` as propositions;
this roadmap proves neither, and an equality of ideals does not make tmf a
ring-spectrum quotient of MString (mctague-tmf-quotient Theorem 1, line 124;
Corollary 2, line 146).

**Checks.**
- Rationally the target is `ℚ[c₄,c₆]` and the kernel contains `[OP²]` in degree 16.
- In degrees 8 and 12 the kernel away from 6 is zero, since OP² bundles have
  dimension at least 16.
- Integrally the kernel contains the generator of `Ω₃^String≅ℤ/24` (zero genus in
  dimension 3), which the OP²-bundle ideal, concentrated in degrees ≥16, misses;
  so 6 must be inverted.

*Needs:* S5.2–S5.4; S4.2; EllipticCohomology E5.

### Examples

OP² itself, the degree-8 and degree-12 generators with their Witten genera, and the
complete-intersection families for n≥14.

### Dependencies

S1–S4; BordismFormalGroups F3–F5;
SchemeAndStackFoundations §4.13; AffineMorseLefschetz A0; EllipticCohomology E5.

## Layer 6: curvature questions and refined classes (S6)

### 6.1 Positive Ricci curvature and Stolz's conjecture (S6.1)

Define `Ric>0` for a closed Riemannian manifold as positive definiteness at every
point of Tau Ceti's `CovariantDerivative.ricciTensor` of Mathlib's
`CovariantDerivative.leviCivitaConnection`. State Stolz's conjecture: a closed
String manifold of positive dimension admitting a metric with `Ric>0` has vanishing
Witten genus (Stolz 1996, Math. Ann. 304, §1; uncertified). No converse is
asserted. A positively oriented point has genus 1 and vacuous Ricci condition; it
is outside the positive-dimensional statement.

**Checks.**
- For n≥2 and r>0, the round sphere `Sⁿ` of radius r has
  `Ric=(n−1)r⁻²g>0`; with the stable framing and String lift induced from the
  bounding disc, its genus vanishes. At n=2,r=1 a unit tangent vector has
  `Ric(v,v)=1`; at n=1,r=1 the round circle has `Ric(v,v)=0`, so it is a
  negative control for positive Ricci curvature.
- With the opposite curvature sign convention, the round sphere would have
  negative Ricci form; Tau Ceti's constant-curvature calculation fixes the sign.
- The point: genus 1, so the dimension hypothesis is necessary.

*Needs:* Tau Ceti `CovariantDerivative.ricciTensor`; Mathlib
`CovariantDerivative.leviCivitaConnection`; S4.2.

### 6.2 Low-weight vanishing (S6.2)

Using SpinGeometry G6's Lichnerowicz theorem and IndexTheory I7's Â-index, `Ric>0`
gives `Â=0`. With S4.2's modularity and the dimension of level-one modular forms,
prove Witten-genus vanishing for String manifolds with `Ric>0` in dimensions 4, 8,
12, 16, 20 and 28, where the modular-form space has dimension at most one and the
constant term is injective.

**Checks.**
- `dim M_k=0,1,1,1,1,1` for k=2,4,6,8,10,14, and `dim M_12=2` (`E₄³`, Δ), so
  dimension 24 is excluded.
- Weight 14: `M_14=ℂE₄²E₆`, constant term 1.
- Dimension 32: `dim M_16=2`, excluded.

*Needs:* S4.2, S6.1; SpinGeometry G6; IndexTheory I7; ModularForms.

### 6.3 Framed counterexamples to the refined questions (S6.3)

For a compact Lie group G with bi-invariant metric `g=−B`, compute on left-invariant
fields `∇_X Y=½[X,Y]`, `R(X,Y)Z=−¼[[X,Y],Z]` and `Ric=−¼B=¼g`. For SU(3) and
SU(2)≅S³ with left-invariant framings and the induced stable String lifts `s_L`,
use S2.3's tangent-to-normal convention and EllipticCohomology E6's unit images:
the left-framed S³ maps to a generator of `π₃tmf≅ℤ/24` and the left-framed SU(3)
to the nonzero element u₈ of order 2 in `π₈tmf≅ℤ⊕ℤ/2` (hopkins-icm2002 lines
396–405). Write d₂, d₃ and D for EllipticCohomology E4's lifts of Δ⁸ in
`π_192tmf_(2)`, Δ³ in `π_72tmf_(3)` and Δ²⁴ in `π_576tmf`, chosen with `D_(2)=d₂³`
and `D_(3)=d₃⁸`. From E4's complete coefficient computation prove that
multiplication by d₂ on `π_*tmf_(2)` and by d₃ on `π_*tmf_(3)` is injective
(bmq-hurewicz lines 128–129; belmont-shimomura Theorem 6.1, line 653), so every
`d₂ʲu₈` is nonzero of order 2, every `d₂ʲσ[S³,s_L]_(2)` has order 8 and every
`d₃ʲσ[S³,s_L]_(3)` has order 3. With E6's localization criterion
(`x↦0` in TMF iff `Dʲx=0` for some j) the periodic images have orders 2 and 24.

- The unrestricted questions "does `Ric>0` force `σ[M,s]=0` in `π_n tmf`", and in
  `π_n TMF`, for every String lift s, have negative answers: SU(3) and S³.
- The primary Witten genera of SU(3) and S³ vanish; zero genus does not kill the
  refined classes.

**Checks.**
- SU(2) with `g=−B`: `Ric=g/4` and the sectional curvature is 1/8, so it is the
  round S³ of radius `2√2` (`Ric=2r⁻²g`).
- `R(X,Y)Z=¼[X,[Y,Z]]−¼[Y,[X,Z]]−½[[X,Y],Z]=−¼[[X,Y],Z]` by Jacobi; with the
  opposite convention `Ric=−g/4`.
- Orders: `24=8·3`, `192·3=576=72·8`.

*Needs:* S2.3, S6.1; EllipticCohomology E4, E5, E6; Tau Ceti
`CovariantDerivative.ricciTensor`.

### Examples

SU(2), SU(3) with bi-invariant metrics, and the low-dimensional vanishing list.

### Dependencies

S2, S4; SpinGeometry G6; IndexTheory I7; ModularForms; EllipticCohomology E4–E6.

## Downstream consumers

FourManifolds consumes S1's BString lifts, the H³ torsor, the dimension-≤7
classification of S1.3 and the adjoint formula of S1.1 (intended name
spinLambda_adjoint_eq_neg_two_cTwo).

## References

- Milnor–Stasheff, *Characteristic Classes*, Annals of Mathematics Studies 76,
  1974, §8 and §15, for w₄ and p₁; §18 for the Pontryagin–Thom construction, Thom
  transversality, Serre's rational stable stems and rational detection by
  characteristic numbers.
- Stong, *Notes on Cobordism Theory*, Princeton, 1968, Chapter II, for bordism of
  manifolds with structure on the stable normal bundle (uncertified).
- Bott–Tu, *Differential Forms in Algebraic Topology*, GTM 82, 1982, Theorem 5.1,
  for good covers (uncertified).
- Lee, *Introduction to Smooth Manifolds*, 2nd ed., GTM 218, 2013, Theorems 4.26
  and 6.30, for local sections of submersions and transverse preimages
  (uncertified).
- Toda, *Composition Methods in Homotopy Groups of Spheres*, Annals of Mathematics
  Studies 49, 1962, Chapters V and XIII, for the 2- and 3-primary parts of `π₃S`
  (uncertified).
- Waldorf, [*String Connections and Chern-Simons Theory*](https://arxiv.org/abs/0906.0117)
  (waldorf-string-connections), Theorems 1.3.3–1.3.4, Lemma 3.1.2,
  Proposition 3.3.4, Lemmas 4.3.2–4.3.3.
- Redden, [*String structures and canonical 3-forms*](https://arxiv.org/abs/0912.2086)
  (redden-canonical-3forms), Propositions 2.2–2.3.
- Carey–Johnson–Murray–Stevenson–Wang, [*Bundle gerbes for Chern-Simons and
  Wess-Zumino-Witten theories*](https://arxiv.org/abs/math/0410013)
  (cjmsw-bundle-gerbes), Proposition 4.8, Theorem 5.8.
- Meinrenken, [*The basic gerbe over a compact simple Lie group*](https://arxiv.org/abs/math/0209194)
  (meinrenken-basic-gerbe), §5.2 and §5.4.
- Cheeger–Simons, [*Differential characters and geometric invariants*](https://math.mit.edu/juvitop/pastseminars/notes_2019_Fall/cheeger-simons.pdf),
  Lecture Notes in Mathematics 1167, 1985 (cheeger-simons), Theorems 1.1,
  1.11 and 2.2, pp. 52, 56–57 and 58. Their degree k is degree k+1 here.
- Bunke, [*Differential cohomology*](https://arxiv.org/abs/1208.3961v6), 2013
  (bunke-differential-cohomology), Lemma 3.5, equation (23), Proposition 3.28
  and Corollary 3.131, pp. 33–34, 38, 41 and 68; the real-form construction
  used here is specified in S3.1.
- McTague, [*The Cayley plane and String bordism*](https://arxiv.org/abs/1111.4520)
  (mctague-cayley-plane), Theorems 1 and 4, Lemma 8, Proposition 11, Lemma 12.
- McTague, [*tmf Is Not a Ring Spectrum Quotient of String Bordism*](https://arxiv.org/abs/1312.2440)
  (mctague-tmf-quotient), Theorem 1, Corollary 2.
- Hovey, [*The homotopy of MString and MU⟨6⟩ at large primes*](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Hovey-bpbp1.pdf),
  Algebr. Geom. Topol. 8 (2008), Theorem 2.4; Hovey–Ravenel, [*The 7-connected
  cobordism ring at p=3*](https://www.sas.rochester.edu/mth/sites/doug-ravenel/mypapers/mo8.pdf),
  April 1994 author preprint (hovey-ravenel), Corollary 1.5(2), p. 8.
- Borel–Hirzebruch, *Characteristic classes and homogeneous spaces I–II*,
  Theorems 10.7 and 20.3, and §19 of part I for the Pontryagin classes of OP²
  (uncertified).
- Stolz, *A conjecture concerning positive Ricci curvature and the Witten genus*,
  Math. Ann. 304 (1996), §1 (uncertified).
- Hopkins, [*Algebraic topology and modular forms*](https://arxiv.org/abs/math/0212397)
  (hopkins-icm2002), §4.3, Proposition 4.6.
- Behrens–Mahowald–Quigley, [*The 2-primary Hurewicz image of tmf*](https://arxiv.org/abs/2011.08956)
  (bmq-hurewicz), Introduction.
- Belmont–Shimomura, [*Beta families arising from a v₂⁹ self map on S/(3,v₁⁸)*](https://arxiv.org/abs/2109.01059)
  (belmont-shimomura), Theorem 6.1.
- Mathlib, `Mathlib/Geometry/Diffeology/Basic.lean` at the pinned revision; and
  peabrainiac's Apache-2.0
  [lean-catdg manifold and functional-map development](https://github.com/peabrainiac/lean-catdg/tree/1ee4a2614b033dd1b4aded95759eb31eb9b0fbf4/CatDG/Diffeology),
  a comparison for S3.5; any adaptation keeps its licence and attribution.
