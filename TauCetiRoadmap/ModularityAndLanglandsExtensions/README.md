# Roadmap: modularity and Langlands extensions

**Summary.** This roadmap extends modularity through Artin representations, potential automorphy, symmetric powers, Sato–Tate and classical packets. It builds the realization and normalization comparisons needed for these results and states the Langlands frontier conjectures with their local and trace hypotheses.

## Scope and ownership

Own the endpoint implications, normalization comparisons and additional prerequisites below; import the general theories at exactly the supplier scopes.

TauCetiRoadmap.RepresentationTheory.ClassicalGroups Layers0–1 owns standard/tensor/symmetric/exterior representations;CompactGroups Layers5–6/`SU₂` owns Peter–Weyl,characters,Haar,`SU₂` irreducibles/Weyl integration. Own arithmetic Frobenius classes/equidistribution here. The finite-field image predicate specializes Mathlib projective groups.

ClassicalSerreModularity/EllipticCurveModularity own rational modularity;GL2AutomorphicRepresentationsAndTransfer rank-two LLC,soluble Artin/base change;PotentialModularityAndCompatibleSystems systems/operations/L-functions;AutomorphicGaloisRepresentationsPartII Galois/WD/HT realization;AutomorphicFormsOnReductiveGroups infinity,weights,purity/real cohomological packets;EndoscopicTransferAndUnitaryTraceComparison local factors,cyclic base change/weak induction;AutomorphicLFunctionsAndLocalFactors standard/Rankin–Selberg theorems and Langlands–Shahidi definitions. Own stronger induction,analytic/trace comparisons here;separate weak/all-place,isobaric/cuspidal.

Layer4 owns symmetric-power propagation,level raising,tensor lifting/auxiliary curves;Layer2 Dwork projectors,coefficient-prime ordinarity and ordinary-prime density/progression arguments. EllipticCurveModularityImaginaryQuadratic §§0.3, 5.1 and 5.3 owns the typed elliptic seed, general non-CM large-prime theorem and geometric prime switch; §§2.18 and 2.29 here give specialization and normalization comparisons on its outputs. Own polarized-lifting, theta, singular-support and Whittaker extensions over lower inputs. AutomorphicGaloisRepresentationsPartII AG2.6 owns the shared relative curves, bundle/Hecke categories, parameter stack and geometric spectral action; §§5.7–5.9 compare and extend those same objects. PadicHodgeTheory§3.6 owns labelled ordinary flags,crystalline characters,consecutive-weight/maximal-monodromy criteria/finite-extension descent;CrystallineCohomology§§CR.6.1–3 log boundary/Hyodo–Kato/one-parameter comparisons;here add `H₀`-equivariant Dwork specialization. Extend PotentialModularityAndCompatibleSystems§8.6’s rank-two ordinary lifting/finiteness to higher polarized rank.

PadicFunctionalAnalysis/CompactOperators own Banach modules,orthonormalizability/complete continuity;LocallyAnalyticDistributions locally convex limits,strictness,completed tensors,compact duality/distribution-character spaces;RigidAnalyticGeometry quasi-Stein sheaves. §4.3 adds relative compactness,Fréchet–Stein/coadmissibility,contracting Jacquet/automorphic comparisons.

## Conventions

RA = regular algebraic; RAC = regular algebraic cuspidal; RACP = regular algebraic cuspidal polarized; HT = Hodge–Tate; LGC = local–global compatibility. RAESDC/RAECSDC/RACSDC retain their usual essentially self-dual/conjugate-self-dual/cuspidal meanings.

Fix field closures/embeddings for restriction/base change,coefficient field M and embeddings `M→M_λ→ℚ̄_ℓ`. Residual means stable-lattice semisimple reduction;specify the subgroup in every irreducibility condition. Cuspidal ranks are positive;rank0 occurs only in system/linear-algebra checks.

Use geometric Frobenius and local reciprocity sending a uniformizer to geometric Frobenius. In BLGGT's HT convention `HT(ε_ℓ)={−1}`. For a rank-n automorphic representation use `recᵀ(π_v)=rec(π_v⊗|det|_v^{(1−n)/2})`. A representation of weight a has HT numbers `a_{ιτ,i}+n−i`. If `a_{τ,i}+a_{τc,n+1−i}=w_alg`, its motivic purity weight is `w_mot=w_alg+n−1`. The polarization sign uses `w_alg` in `(−1)^{n+w_alg}`; Frobenius magnitudes and gamma factors use `w_mot`. Below each use of w follows the local definition in its statement. The rank-one trivial representation has Frobenius 1 and HT number 0; its cyclotomic twist has geometric Frobenius `q_v⁻¹` and HT number `−1`. Arithmetic Frobenius evaluates the same representation at the inverse group element.

For an elliptic curve write `V_{E,ℓ}=T_ℓ(E)⊗ℚ_ℓ` and `H_{E,ℓ}=H¹_et(E_{F̄},ℚ_ℓ)=V_{E,ℓ}∨`. Then `det V_{E,ℓ}=ε_ℓ`, while `det H_{E,ℓ}=ε_ℓ⁻¹` and `HT(H_{E,ℓ})={0,1}`. The finite geometric Frobenius on H has polynomial `X²−a_vX+q_v`. `Sym^m H` has rank `m+1`, HT numbers `{0,…,m}` and determinant `ε_ℓ^{−m(m+1)/2}`. References using a Tate-module symbol are translated by this duality dictionary, never by changing Frobenius alone.

Pure weight w means roots of modulus `q_v^{w/2}`. For monic degree-n `Q_v`,use `P_v(T)=TⁿQ_v(T⁻¹):X−1↦1−T`,`X²−aX+q↦1−aT+qT²`. At `T=½` the first pair gives `−½`,`+½`. Inverse evaluation requires `T≠0`;prime norms exceed1.

Set `Γ_ℝ(s)=π^{−s/2}Γ(s/2)`,`Γ_ℂ(s)=2(2π)^{−s}Γ(s)`. Pure weak compatibility gives good-place partial products;full factors require coherent strict WD/real signs. A paired real Hodge type `h<w/2` gives `Γ_ℂ(s−h)`;middle `h=w/2` gives `Γ_ℝ(s−h)` if `c=(−1)^h`,otherwise `Γ_ℝ(s−h+1)`. For regular odd rank n,the corrected determinant conversion is

```text
d± = (n ± (−1)^(w/2+(n−1)/2) det(R)(c))/2.
```

Each exchanged Hodge pair has determinant−1,hence the rank correction. On `Sym²H¹(E)`,c exchanges `e²/ē²` and fixes `eē`:trace1,`det−1`,middle `h=1` gives `Γ_ℝ(s)`,full factor `Γ_ℝ(s)Γ_ℂ(s)`. Trivial/sign real characters give `Γ_ℝ(s)/Γ_ℝ(s+1)`.

Elliptic completion includes `N_m^{s/2}=exp((s/2)log N_m)`,`N_m>0`,entire/nonvanishing. Unitary variable is `s−m/2`;weight2 has motivic centre1/unitary centre½. Omitting `N_m` preserves entireness,changes the functional equation.

Use `⊞` for local/global isobaric classification,`⊠` for Arthur summands. `ν_b` has `SL₂`-dimension b:`ν₁` orthogonal,`ν₂` symplectic. In additive `ℤ/2` component signs,odd blocks contribute their coordinate,even blocks0;take determinant-one kernel **before** central quotient. Packet induction is normalized,Whittaker data specified.

<a id="endpoint-status-register"></a>
Every assertion below is of one of three kinds. A known result is a theorem. A conditional result is an implication whose unproved inputs are explicit premises: TWFL with the trace formula and intertwining inputs of Layer 3, Calegari–Geraghty's Conjecture B (§§2.7–2.8, 2.31, 2.37, 4.28), the explicit arithmetic hypotheses `CNExceptionalCurveData(F)` (§§2.30, 2.52) and the regular-weight Serre statement (§3.11). A conjecture (§§0.4, 3.10, 5.2, 5.3, 5.6, 5.10) is stated as a proposition-valued definition, never as a theorem, axiom or typeclass instance. Proving the premises of a conditional result gives an unconditional theorem with the same conclusion; recording a conjecture proves nothing. In particular Langlands functoriality and reciprocity are statements to define, not theorem-producing instances.

**Checks.**

- For the trivial rank-one Frobenius polynomial, reversing `X−1` gives `1−X`; at `X=1/2` the values are `−1/2` and `1/2`. The empty matrix and the zero matrix of size two both have Euler denominator 1.
- `Sym²H¹(E)` has Hodge list `[0,1,2]` and determinant `ε⁻³`. Its conjugation matrix exchanges the first and third basis vectors and fixes the second, giving trace 1 and determinant `−1`.
- For residue cardinality `q=9` the scale `q^(3/2)` is 27. Replacing q by the coefficient prime `p=5` gives `5√5`, whose square is 125 rather than 729.
- At `z=−1` the angular character `z/|z|` has value `−1`, while `z/z̄` has value 1. These functions cannot be interchanged in the weight-two real parameter.
- Rank `n=1` means `Sym⁰` and rank `n=3` means `Sym²`. The distinct pair `(1,−1)` has symmetric-square list `(1,−1,1)`, so distinct roots alone do not imply all higher regularity conditions.
- In the `GSp₄` boundary chamber, `λ=(1,0;2)` obeys `λ₁−3≡c` mod 2 and has minimal `Sp₄` K-type `(2,2)`; `λ=(1,0;1)` fails parity.

## Exact supplier contracts

### From Mathlib and Tau Ceti

Import `Polynomial.reverse`, `Polynomial.eval₂_reverse_mul_pow` at the natural degree with invertible evaluation argument. For commutative rings,`Matrix.charpolyRev = det(1 − X • M.map C)`; `Matrix.reverse_charpoly` gives reversal,`Matrix.eval_charpolyRev` constant1,including singular/empty matrices (`0₂:charpoly=X²,charpolyRev=1`). Import `Matrix.trace`, `Matrix.ProjGenLinGroup`, `Matrix.ProjGenLinGroup.mk`, `Matrix.ProjGenLinGroup.map`,injective `Matrix.ProjectiveSpecialLinearGroup.toPGL`,surjective scalar quotient. Scalar extension induces a map on central quotients. Sign kernels use `AddSubgroup`, `AddMonoidHom.ker`, finite sums and `ZMod 2`. These give no topology/Galois/closure structure. `H_E` is always the cohomological dual of that same imported Tate action/determinant.

Import `WeierstrassCurve.tateModuleGaloisRepresentation`, `WeierstrassCurve.continuous_tateModuleGaloisRepresentation_apply`, `TauCeti.det_tateModuleGaloisRepresentation` (separably closed/characteristic hypotheses) via cohomological duality. `HeckeRing.GL2.Newform.satakeParameters`, `satakeParameters_eq_pair_iff`, `satakeAngle`, `satakeParameters_eq_exp_satakeAngle` in `TauCeti.NumberTheory.ModularForms.Newforms.Satake` give rational classical comparisons;the last assumes prime p,trivial local nebentypus/Ramanujan bound. It proves neither that bound nor CM Sato–Tate. §3.1 uses `TauCeti.HeisenbergGroup` from `TauCeti.GroupTheory.SpecificGroups.Heisenberg` and `TauCeti.hermiteFunction`, `TauCeti.hermiteFunction_oscillator` from `TauCeti.Analysis.SpecialFunctions.Hermite.Function.Oscillator`. SR.6 owns integral finite-wild cocycles/`ℓ`-adic extension/excursions; AutomorphicGaloisRepresentationsPartII AG2.6 supplies their parameter stack and geometric spectral action; §§5.8–5.9 add singular support and the Whittaker adjunction. LocalGaloisGroups/ProfiniteArithmetic own foundations.

### From the nonarchimedean analytic roadmaps

Import PadicFunctionalAnalysis §§1.4,2.2–2.6 (finite Banach modules, potentially orthonormalizable modules, (Pr), countable-type splitting, bounded coefficient maps) and CompactOperators §§0.1,0.4–0.5,1.7 (finite-image approximation, compactoid comparison over fields, completed scalar extension), retaining Noetherian/lifting/scalar-ring hypotheses. Complete continuity over an algebra uses finite rank over that algebra, not over its coefficient field.

For finite `K/ℚ_p`, LocallyAnalyticDistributions §§0.0–0.3 supplies locally convex limits,Hausdorff quotients,strictness,completed tensors/compact strong duality;§3.3 Mellin/character spaces. RigidAnalyticGeometry§7.3 gives quasi-Stein sheaves/sections. §4.3 separately proves dagger-stage/finite-slope coadmissibility/Jacquet comparisons.

### Actual objects and comparison laws

These contracts govern the **same** actual objects in each definition/law,with fixed coefficient embeddings/localizations.


<a id="contract-c-galois"></a>
#### C-GALOIS: from AutomorphicGaloisRepresentationsPartII AG2.2–AG2.7

Continuous absolute-Galois representations over finite coefficient fields/closures carry coefficient extension,field restriction,lattices,semisimple reduction/WD. On these objects `π↦r_{π,ι}` respects isomorphism,twists,duals/permitted base change,with `recᵀ/HT`,polarization/conjugation signs. Frobenius inversion changes the evaluated element;HT reversal requires duality.

<a id="contract-c-automorphic"></a>
#### C-AUTOMORPHIC: from AutomorphicFormsOnReductiveGroups, Layers 2–3 and 6

Local irreducible admissible/global automorphic isomorphism classes retain field/group/rank,cuspidality,isobaric multiplicities,weights,components,centre,twists/duals. Isobaric sums give direct-sum parameters;rec respects twists/duals;all-place comparisons use these components and the stated real/complex Langlands/Weil scope.

<a id="contract-c-system"></a>
#### C-SYSTEM: from PotentialModularityAndCompatibleSystems, Layer 1

Fix field,coefficients,rank,bad set,continuous semisimple `r_λ`,monic `Q_v`,labelled HT. Away from bad/coefficient places,`r_λ` is unramified with embedded `Q_v`;purity constrains every complex embedding. Actual operations determine `r_λ`,`Q_v`,rank,weight/pairings;decompositions hold at **every** `λ`. Strict compatibility supplies ramified WD/real signs,conductor/`Γ/ε`;Euler factors reverse `Q_v`. Dwork good-place comparison gives only global ss:match embeddings/prove semisimplicity before transferring maximal local N.

<a id="contract-c-artin"></a>
#### C-ARTIN: from AdelicAlgebraicGroups §2.4, convergence-factors; AnalyticNumberTheoryPartI §§2.18, 2.31

AdelicAlgebraicGroups §2.4 uses arithmetic Frobenius:invert the element/equivalently use contragredient local factors here. For the same finite-image complex representation,use inertia-invariant determinants and AL/class-field real signs. Strong Artin matches everywhere;weak matching gives partial products. Twists/sums commute;entireness excludes trivial rank1.

<a id="contract-c-local-deformation"></a>
#### C-LOCAL-DEFORMATION: local components and lifting extensions

LocalGaloisDeformationRings owns fixed-residual framed generic fibres and Hodge/type loci. “Connects” means same geometric irreducible component of that locus, rather than equal reduction. Import ACC+ Fontaine–Laffaille/ordinary lifting from PotentialAutomorphyInfrastructure §§5.22–5.23. Construct [§2.5], [§2.6], [§2.8](#general-number-field-lifting) separately. GL2ModularityLifting §5.7 supplies Hilbert potentially Barsotti–Tate lifting with its refined ordinary quotient condition.

<a id="contract-c-moduli"></a>
#### C-MODULI: from PotentialModularityAndCompatibleSystems, §§2.8–2.10 and 2.23

Moret–Bailly takes a smooth geometrically connected number-field scheme and local opens, returning a point in those opens under specified field/completion embeddings, with the stated Galois/disjointness/local properties. Descend full-level modular curves by the actual E[q] cocycle and Weil-pairing multiplier `ε̄`; their points are symplectic isomorphisms of the specified torsion modules.

<a id="contract-c-arthur"></a>
#### C-ARTHUR: actual packets and EndoscopicTransferAndUnitaryTraceComparison §§11.2–11.4

Layer 3’s actual admissible L/Arthur maps determine centralizers, component quotients, local packet multisets (repetitions retained), Whittaker/inner-twist pairings, global restricted products and natural-number multiplicities. Impose determinant one before the orthogonal central quotient. Character/multiplicity identities use these packets. Assume TWFL with the specified stabilization/transfer/test normalizations. Distinguish KMSW’s generic pure-inner theorem from its two nongeneric local inputs, and Mœglin–Renard’s two separately quantified membership branches.

<a id="contract-c-coherent-geometry"></a>
#### C-COHERENT-GEOMETRY: from AutomorphicFormsOnReductiveGroups, Layers 5–6

Frontier predicates use actual coherent eigensystems/`GSp₄` representations,and actual abelian varieties with number-field actions/`H¹` eigenspaces. Hodge lists imply no de Rham/crystalline property. Bianchi comparison uses Fourier/Hecke data/Harder parabolic cohomology.

<a id="contract-c-equidistribution"></a>
#### C-EQUIDISTRIBUTION: from TauCetiRoadmap.RepresentationTheory.CompactGroups, Layer 6

Import characters, Haar probability, `SU₂` powers and class-function completeness from CompactGroups. Normalize semisimple Frobenius classes of the same pure realization, ordered by actual field norms with bounded multiplicity. The criterion needs their Euler products’ continuation/boundary nonvanishing for every nontrivial irreducible character.

<a id="contract-c-categorical"></a>
#### C-CATEGORICAL: the geometric categories

AutomorphicGaloisRepresentationsPartII AG2.6 supplies `relativePeriodChart`, `relativeFarguesFontaineCurve`, `relativeDegreeOneDivisor`, `BunG`, `newtonStratum`, `DLisBunG`, `HeckeModification`, `HeckeFunctor`, `parameterStack`, `geometricSpectralAction`, `excursionOperator` and `semisimpleParameter`. Use its general-local-field, reductive-group carriers, integral Satake normalization and coefficient restrictions. §§5.7–5.9 retain comparison statements on these objects and own the singular-support extension and canonical Whittaker adjunction used in FS I.10.2. The categorical equivalence remains conjectural. Tori retain condensed homology and the character gerbe.

### Required exports from neighbouring theories

Each export retains its field, local, residual and coefficient hypotheses.

#### From ArithmeticDirichletSeries (Completed), Layers 9–10

The Wiener–Ikehara/Tauberian prime number theorem for Euler products continuing to a neighbourhood of `Re s ≥ 1` with no zeros or poles except at `s = 1: Σ_{N(x)≤n}` `χ(x) = c·n/log` `n + o(n/log n)` with `−c` the order at 1 (Kedlaya Thm. 24.2).

#### From ArithmeticLocallySymmetricSpaces, Layer ALS.3

Use its Bianchi quotient, coefficient local systems, Hecke correspondences and cuspidal/parabolic cohomology. The [§4.26] below constructs the missing Fourier-to-parabolic-cohomology identification; Hecke chain correspondences alone do not imply it.

#### From AutomorphicFormsOnReductiveGroups, §§5.5, 5.7 and 6.3–6.5

Use Clozel's purity lemma at its algebraic cuspidal scope, rationality and `Aut(ℂ)`-conjugation for RAC `GLₙ`, and the chamber, full-group and coherent-cohomology constructions for discrete series and their nondegenerate limits. The integral cohomological exponents differ from raw Weil exponents by `(1−n)/2`; the conversion is retained in [§4.18]. The full Adams–Johnson construction is a separate local target.

#### From AutomorphicGaloisRepresentations, §§3.10–3.14 and 4.3–4.7

Use its cohomological Hilbert/quaternionic realizations with their field, weight, determinant and local–global conditions. Parallel weight one and finite-image Artin comparison are the [§1.8] here; weight at least two does not provide them. One-dimensional realizations use global class field theory.

#### From AutomorphicGaloisRepresentationsPartII, Layer AG2.0

RACP pairs `(π,χ)` over CM/totally real fields, dominant weights `a∈(ℤⁿ)^{Hom(F,ℂ),+}_w` and prime/potentially-prime-to-`ℓ` levels. Use [Polarization] for `πᶜ≅π∨⊗(χ∘N∘det)`, place-independent `χ_v(−1)` and, over imaginary CM, `χ_v(−1)=(−1)^{n+w_alg}`.

#### From AutomorphicGaloisRepresentationsPartII, AG2.2–AG2.7

BLGGT v4 2.1.1 gives semisimple `r_{ℓ,ι}(π)` with totally odd multiplier `ε_ℓ^{1−n}r_{ℓ,ι}(χ)`, `HT_τ={a_{ιτ,i}+n−i}`, pure weight `w_alg+n−1` and `recᵀ` LGC away from `ℓ` (Caraiani), also at `ℓ` with Iwahori vectors; retain Geraghty’s ordinary comparisons (6)–(7). Also import all-finite-place LGC for RAESDC/RAECSDC used by NT 2026 §1.2/Lemma 2.1, and ACC+ §7.1’s CM RAC systems (HLTT, Scholze, Varma). [C-GALOIS] fixes the actual realization.

#### From AutomorphicGaloisRepresentationsPartII, Layer AG2.6 (shared Fargues–Scholze foundations)

Use **Relative Fargues–Fontaine curves and degree-one divisors** (`relativePeriodChart`, `relativeFarguesFontaineCurve`, `relativeDegreeOneDivisor`), **Bundle strata, lisse categories and the geometric Hecke action** (`BunG`, `newtonStratum`, `DLisBunG`, `HeckeModification`, `HeckeFunctor`) and **The parameter stack and geometric spectral action** (`parameterStack`, `geometricSpectralAction`, `excursionOperator`, `semisimpleParameter`). These targets include the integral Satake, perfect-generation and universal-action comparisons. §§5.7–5.9 use these objects over arbitrary nonarchimedean local fields, with their finite-leg coherence, coefficient naturality and integral prime restrictions; singular support and the Whittaker adjunction are owned here.

#### From AutomorphicGaloisRepresentationsPartII, Layer AG2.3

Import the Chenevier–Harris definite-unitary eigenvariety at AG2.3's stated scope: even rank, even totally real degree, a single varying p-place, the specified tame Bernstein component and spherical level at nonsplit places. The all-p-place completed-forms/Jacquet eigenvariety `E_n` of Newton–Thorne I §2 is the separate [§4.3] here.

#### From AutomorphicGaloisRepresentationsPartII, Layer AG2.5

Varma's LGC (semisimplified, with the monodromy bound) for RAC `π` over CM fields, used for temperedness at ramified places in BCGNT Thm. 7.1.1. In Qian’s Steinberg argument compare at the auxiliary prime `λ′≠l` where the fibre is semisimple; preserve the maximal Jordan-block conclusion. Transport at `λ` alone identifies its global semisimplification.

#### From AutomorphicLFunctionsAndLocalFactors, Layer AL.2

Godement–Jacquet: cuspidal `GL_n`, `n≥2`, has entire `L^S`, standard functional equation and finite-order twists (Brauer induction in BLGGT 5.4.3). AL.3, Whittaker realizations and parameter estimates, supplies Jacquet–Shalika’s unitary cuspidal Satake bound for BCGNT 6.1.`3/ACC+` 7.1.13 purity.

#### From AutomorphicLFunctionsAndLocalFactors, Layer AL.3

For unitary cuspidal `π` on `GL_n` and `π′` on `GL_{n′}`, `L^S(π×π′∨,s)` is meromorphic, holomorphic/nonzero at 1 except for a simple pole when `n=n′`,`π≅π′`. Norm twists shift that pole (Jacquet–Shalika/Shahidi 1981). Also import cuspidal/isobaric strong multiplicity one and cuspidal `GL_n` boundary nonvanishing on `Re s=1`. These supply irreducibility, type, lift uniqueness and Sato–Tate.

#### From AutomorphicLFunctionsAndLocalFactors, Layer AL.4

Use its unramified L-group factors and convergence domain. Analytic continuation, functional equations, poles and boundary nonvanishing require the separate [§3.3] below. They are not consequences of the factor definition.

#### From EndoscopicTransferAndUnitaryTraceComparison, Layer 4

Import ordinary smooth matching and the twisted ordinary fundamental lemma from §§4.7 and 4.10. The additional weighted transfer and stabilization enter through [§3.2]; retain TWFL and its non-split weighted and non-standard weighted inputs as hypotheses; the additional weighted constructions and their conditional proofs are specified there.

Use the [C-ARTHUR contract](#contract-c-arthur) above.

#### From EndoscopicTransferAndUnitaryTraceComparison, Layer 6

Import the restricted simple unitary comparison and the elliptic stabilization of §6.18 with their test-function hypotheses. The full twisted weighted stabilization of Mœglin–Waldspurger is the extra [§3.2], not an export of that simple comparison.

#### From EndoscopicTransferAndUnitaryTraceComparison, §11.1

Import general-type `GSp₄` transfer, the rank-four twisted-square pole alternative, all-place parameter matching and packet multiplicity one, retaining `GSp4ClassificationInputs`, unitary cuspidal `Π` and unitary multiplier `χ`. Sections 3.9 and 3.26 supply six-type bookkeeping, nongeneral-type extensions and normalization adapters. The local Arthur and weighted-stabilization targets here discharge the relevant classification premises; they do not replace the supplier's input record.

#### From ArithmeticGaloisRepresentations, §7.10

Import `ResidualImage.IsEnormousCharZero`, its eigenprojection and trace-detection API and its absolute-irreducibility theorem. Section 4.1 adapts the compact Galois image to this predicate and constructs the polarized adjoint and arithmetic Selmer comparison.

#### From EllipticCurveModularityImaginaryQuadratic, §§0.3, 5.1 and 5.3

Import §0.3 `switch_five`, `switch_three`, `auxiliary_local_types` and `modular_elliptic_all_coefficients`, retaining the fixed symplectic pairing, arbitrary finite Galois avoidance field, every place above the prescribed reduction partition, decomposed genericity and the non-CM witness from the retained Tate places. Only `switch_three` requires `ζ₅∉F`. Import §5.1 `nonCM_elliptic_large_residual_primes` over any number field, with geometric non-CM and its finite exceptional set, and §5.3 `cm_modularity` with `ζ₅∉F` and the chosen mod-3 or mod-5 representation decomposed generic and absolutely irreducible on the cyclotomic subgroup. Sections 2.18 and 2.29 retain the rational-curve full-image corollary and the cohomological normalization adapter; their ordinary-prime and height-density arguments belong here. CrystallineLocalGlobalCompatibilityCM retains the CN integral local–global and prepared lifting machinery.

#### From PotentialAutomorphyInfrastructure, §§2.12 and 2.26

Import `rank_two_large_residual_image` and `corrected_rank_two_large_image`, with their prime-field `SL₂(𝔽_l)` containment on the normal-closure subgroup and density-one quantifier over every coefficient place. Sections 2.22 and 4.16 apply these exports to the specified systems; they do not reconstruct the image theorem.

#### From SmoothRepresentationsOfLocalGroups SR.0, SR.0d, SR.2 and SR.5.2

Use [SmoothRepresentationsOfLocalGroups at the ReductiveGroupsPartII supplier head](../SmoothRepresentationsOfLocalGroups/README.md): SR.0 supplies smooth representations and compact-open invariants, SR.0d their derived category, SR.2 normalized induction/Jacquet functors, and SR.5.2's **Classical parameters and the generic convention** supplies characteristic-zero finite-place `GL_n` LLC. Its `rec` sends parameters to representations; write `rec_K` here for its inverse, transporting arithmetic reciprocity to the geometric convention. Retain twists, duals, central characters and pair factors. SR.6.1's **Crossed cocycles and gauge action**, **Finite-wild Weil discretization**, **One integral finite-wild cocycle scheme** and **ℓ-adic cocycle extension and changes of discretization**, SR.6.2 and SR.6.3 supply precisely the cocycle, invariant and excursion inputs of §§5.8–5.9.

[IntegralHeckeAndGaloisDeterminants at the same supplier head](../IntegralHeckeAndGaloisDeterminants/README.md) supplies §1.6's **Local lifts compatible with global quotient reconstruction**: a surjection `B→A`, B local, A henselian local, a selected two-block GMA corner, equality of full determinant laws with residually absolutely irreducible global representation, and specified local/generic-fibre identifications. In the arithmetic application B is finite flat over O; A may have torsion. Continuity of the selected local corner is an additional arithmetic premise. Sections 2.1–2.2 supply derived Hecke images/ghost nilpotence, §4.2 compatible quotient determinants, and §5.2 `Nilpotence.inverse_limit` supplies detection with one uniform exponent and separated coefficient quotients; §5.3 reconstructs over henselian local nilpotent quotients. These contracts preserve the actual coefficient and comparison maps.

#### From EndoscopicTransferAndUnitaryTraceComparison, §§6.24, 6.26–6.27

Import strong cyclic base change and descent from §6.24, and weak cyclic automorphic induction with its orbit criterion from §6.26. The [induction comparison](#automorphic-induction-register) specifies the additional all-place requirement. Labesse's unitary base change is consumed with its stated local conditions in the Steinberg-at-q and unitary-descent arguments.

#### From GL2AutomorphicRepresentationsAndTransfer, Layer R16.3

The local Langlands correspondence for `GL₂` (parameters of principal series, Steinberg and supercuspidal representations), as used by Gelbart–Jacquet's lift and by Gan–Takeda.

#### From GL2AutomorphicRepresentationsAndTransfer, Layer R17.5

Automorphic induction of Hecke characters of quadratic fields to `GL₂` and the soluble (dihedral, tetrahedral, octahedral) Artin modularity for weight one, with the Kim–Shahidi inputs for the icosahedral case as they are stated there; used for Newton–Thorne II Thm. A.1.

#### From GL2ModularityLifting, §5.7

Kisin’s totally real, odd-p potentially Barsotti–Tate theorem: geometric rank two, cyclotomic-times-finite determinant, strong residual modularity, cyclotomic absolute irreducibility, residue `𝔽_p` at non-potentially-ordinary p-places and the `p=5` projective-`PGL₂` exception. A split ordinary reduction needs quotient-character matching or Kisin’s indecomposable/trivial arrangement. See [§5.7 contract](../GL2ModularityLifting/README.md), Kisin (3.5.4)–(3.5.5), pp.72–73; [§1.4] handles local choices/soluble descent. Residual modularity alone is insufficient.

#### From LocalGaloisDeformationRings §F.2.5 (universal deformation ring)

Under `Φ_p` and Schur residual representation (here absolutely irreducible), the strict-equivalence deformation functor is pro-represented by a complete local Noetherian ring. Finite-image tangent-space vanishing in CG Lemma4.14 is a separate class-field argument, not part of this representability theorem.

#### Theta and descent interfaces

MetaplecticAutomorphicForms Layers 0–3 supplies oscillator representations and isometry-pair Howe duality; [§3.1] fixes their normalization and additional real/similitude comparisons; [§5.5](#local-descent-mp2n) owns the metaplectic descent and its globalization. The real compact-theta and similitude extensions are recorded with their separate source boundaries. Their local-field scope and real and similitude comparisons retain the hypotheses of §3.1.

#### From PadicFamilies, Layer 2 and §§2a.10–2a.14

Coleman–Mazur E (`GL₂/ℚ`, tame N, prime p) with weight/slope maps and classical `(f,α)`; abstract finite-slope machine §§2a.10–2a.14, [PadicFamilies](../PadicFamilies/README.md). AG2.3 ([AutomorphicGaloisRepresentationsPartII](../AutomorphicGaloisRepresentationsPartII/README.md)) gives Chenevier–Harris: even rank/degree, one varying p-place, spherical nonsplit places. [§4.3] constructs NT’s all-p-place Jacquet instance.

#### From PotentialAutomorphyInfrastructure, Layer 3

ACC+ Thm. 5.5.1 (LGC at p for ordinary parts over CM fields, decomposed generic residual representation) and the ordinarity comparison of ACC+ Cor. 5.5.2.

#### From PotentialAutomorphyInfrastructure, Layers 2–5

Soluble CM base change/descent, residual-image/disjointness preservation, ordinary LGC and ACC+ 6.1.1–6.1.2 (§§5.22–5.23), with every image/scalar/weight/level/prime condition: Fontaine–Laffaille requires `p>n²` and p unramified; ordinary lifting requires `p>n` and regular ordinary local conditions. [§2.5] is distinct; Layer 2 owns the additional polarized ordinary/PD comparisons and Dwork construction.

#### From TauCetiRoadmap.Chebotarev, Layer 10

Chebotarev density in Dirichlet density form, to compare Galois representations through traces of Frobenius and to choose auxiliary primes of density one.

#### From TauCetiRoadmap.ClassFieldTheory, Layer 11

Finite archimedean reciprocity: `ℝ×→Gal(ℂ/ℝ)`, kernel `ℝ_{>0}`; `ℂ×→1` (ACC+ finite-order convention). Weil abelianization `W_ℝ^ab≅ℝ×`, `W_ℂ=ℂ×` separately supplies all archimedean LLC characters/`Γ`-factors through AL.

#### From TauCetiRoadmap.ClassFieldTheory, Layer 7

Use `geometricArtinMap`, the arithmetic `artinMap` precomposed with inversion, so uniformizers map to geometric Frobenius (BCGP Def. 2.3.1).

#### From TauCetiRoadmap.ModularCurves, Layer 10

The compactified modular curve X(q) and its cusps, for the twisted modular curve `X_E(q)`.

#### From TauCetiRoadmap.ModularCurves, Layer 5

The fine moduli scheme Y(q) of elliptic curves with full level-q structure `(q ≥ 3)` over `ℤ`[1/q], twisted by E[q] to give `Y_E(q)`.

#### From ReductiveGroups Layers 6–8 and ReductiveGroupsPartII RG2.5

Connected reductive groups over local and global fields, quasi-split forms and their (Langlands) dual groups and L-groups, for the definitions of L-parameters and the statements of functoriality.

#### From PotentialModularityAndCompatibleSystems, Layer 1 (system L-functions)

Use §1.15’s completed L-functions with strictness, purity, regularity and real-sign hypotheses. Conventions and §4.17 translate its archimedean factors to middle-Hodge-line signs.

#### From EllipticCurveModularity, Layer R29.6

Modularity of every elliptic curve over `ℚ` with full local-factor comparison, to apply NT non-CM symmetric powers in the Sato–Tate criterion.

PMCS §1.22 supplies BLGGT’s extremely regular decomposition. [§2.42] extends it to pure regular polarized systems with one common extension for a finite family; reducible sums remain isobaric.

#### Comparisons constructed in this roadmap

The [§1.1] precedes the [§4.3]. The [§3.20] precedes the real-packet comparison, and the [§5.9] precedes the categorical conjecture. The [§3.11](#regular-weight-serre-implies-abelian-surface-modularity) consumes the full classification hypotheses; it is not an additional export from a neighbouring theory.

### Conventions and imported comparisons

<a id="blggt-normalization-register"></a>
#### Polarization and the automorphic realization

Import AG2.0/AG2.2 polarized RAC pairs `(π,χ)`:for CM F,`πᶜ≅π∨⊗(χ∘N_{F/F⁺}∘det)`,`χ:(F⁺)×\𝔸_{F⁺}×→ℂ×`,archimedean sign place-independent. For `a_{τ,i}+a_{τc,n+1−i}=w`,use `χ_v(−1)=(−1)^{n+w}`,infinitesimal `Ξ_a∨`,`HT={a_{ιτ,i}+n−i}`,totally odd multiplier `ε^{1−n}r(χ)`,`recᵀ` WD at `v∤ℓ` (also `v|ℓ` with Iwahori hypothesis). Changing `ι` uses Clozel `σπ` on finite part/permuted infinity weights,AG2.2/Chebotarev;it need not preserve `π`. BLGGT§2.1 pp.32–34.

For imaginary CM F, `n = 2` and pure weight `w = 0`, `χ_v(−1) = +1` and `ε_l^{−1}r_{l,ı}(χ)` is `−1` at complex conjugation. Repeat with `w = 1: χ_v(−1) = −1`, while `r_{l,ı}(χ)(c_v) = (−1)^wχ_v(−1) = +1`, so the multiplier is again `−1`. At weight 0, `HT_τ = {n − 1, …, 0}`; at pure weight w the signs must use `n+w` rather than n alone.

([BLGGT], §2.1, p. 32; §2.1, Thm. 2.1.1, pp. 33–34; [Clozel], Thm. 3.13, p. 112, proof pp. 112–129.)

*Needs:* AutomorphicGaloisRepresentationsPartII, Layer AG2.0; AutomorphicGaloisRepresentationsPartII, Layer AG2.2.

<a id="blggt-version-register"></a>
#### BLGGT edition concordance

The BLGGT citations use arXiv v4 (9 December 2013), the version preceding Ann. of Math. 179 (2014), 501–609. The compatible-system comparison also uses arXiv v1 (2010). Correspondence: v1 §2.2 (minimal lifting, Thm. 2.2.1) = v4 §2.3 (Thm. 2.3.1); v1 §2.3 (ordinary lifting, Thm. 2.3.1) = v4 §2.4 (Thm. 2.4.1, now also for totally real F); v4 §2.2 (Lemmas 2.2.1–2.2.4 on automorphy) is new; v1 §5.2 (Lemma 5.2.1, Prop. 5.2.2) = v4 §5.3 (Lemma 5.3.1, Prop. 5.3.2); v1 Lemma 5.2.3 = v4 Lemma 5.4.5; v1 §5.3 (Thm. 5.3.1, Cors. 5.3.2–5.3.3, Prop. 5.3.4) = v4 §5.4 (Thm. 5.4.1 with Cor. 5.4.2, Cor. 5.4.3, Cor. 5.4.4, Prop. 5.4.6); v1 §5.4 (Thms. 5.4.1–5.4.3) = v4 §5.5 (Thms. 5.5.1–5.5.3); v4 §5.2 (rational compatible systems) is new. v4 renames RAECSDC/RAESDC to "polarized" and "essentially conjugate self-dual" to "polarized", and states the lifting theorems for polarized `(r, µ)` with the "potentially diagonalizably automorphic" hypothesis.

([BLGGT], title page and table of contents, p. 1.)

*Needs:* [Polarization].

<a id="arthur-dependency-gate"></a>
#### The twisted weighted fundamental lemma

Assume TWFL=Mœglin–Waldspurger II.4.4,with non-split weighted Lie-algebra/non-standard weighted reductions;unweighted FL is insufficient. Arthur3.2.1’s `GL_N/SO_{2n}` twisted stabilization/[A24] comes from MW;AGIKMS gives [A25]–[A27] intertwining. AGIKMS v3§0.4 p.15 retains the weighted assumptions. All ensuing classifications/consequences are implications from TWFL and these inputs.

([BCGP], §1.4.1 'The work of Arthur', p. 14; [BCGP, modularity], §1.6 'The work of Arthur', pp. 7–8; [AGIKMS], Abstract, p. 1; [Arthur], §3.2, Hypothesis 3.2.1, p. 137; Preface p. xvi (2011 manuscript).)

*Needs:* [C-ARTHUR].

<a id="nt26-normalisation-bridge"></a>
#### Frobenius inversion and cohomological duality

NT§1.2/BLGGT share geometric Frobenius,`HT(ε)=−1`,`recᵀ=rec(π|det|^{(1−n)/2})`. Arithmetic evaluation inverts the matrix without changing r or HT. Only a separately proved cohomological `r∨`-isomorphism negates HT;import AG2’s dictionary.

([NT Hilbert], §1.2 Notation, p. 8 (geometric-Frobenius `Art_K`, `rec^T`, `r_{π,ι}`, HT convention); `Frob_v` convention p. 7.)

*Needs:* [Polarization]; AutomorphicGaloisRepresentationsPartII, Layer AG2.0.

<a id="weight-one-separation-register"></a>
#### Field and weight boundaries

ClassicalSerreModularity, Layer R27.6, supplies rational weight-one descent and odd Artin modularity; GL2AutomorphicRepresentationsAndTransfer, Layer R17.5, supplies the soluble cases. Its R17.4 supplies rank-two base change. EllipticCurveModularity supplies elliptic modularity over `ℚ` and its Galois comparison. The retained results extend to totally real weight one, irregular compatible systems, non-solvable residual representations, and the stated imaginary-quadratic modularity criterion. Over an arbitrary number field the elliptic conclusion is potential modularity, with Calegari–Geraghty’s Conjecture B kept as a hypothesis where required.

([KW09], §10.1, paragraph after Thm. 10.1, p. 20 (author copy results.pdf).)

*Needs:* [ClassicalSerreModularity §R27.6, rational odd Artin modularity](../ClassicalSerreModularity/README.md); [§1.9]; [§2.52](#imaginary-quadratic-elliptic-modularity); [§1.3](#irregular-systems-weight-one); [§1.4].

<a id="trace-formula-inputs-register"></a>
#### Trace formula and intertwining inputs

Import AutomorphicSpectralTheory AS.6 invariant trace formula,ET§§4.7/4.10 ordinary transfer/twisted FL,5.2 GL Rankin–Selberg normalization,6.18 elliptic stabilization. §3.2 adds MW weighted stabilization/co-tempered intertwining,conditional on TWFL. Each classification retains any additional inner-form/archimedean input;quasi-split nonarchimedean results do not supply it.

*Needs:* AutomorphicSpectralTheory AS.6; EndoscopicTransferAndUnitaryTraceComparison §§4.7, 4.10, 5.2, 6.18; [TWFL]; [§3.2].

<a id="symplectic-branch-status"></a>
#### The classification input for the symplectic branch

Gee–Taïbi `GSp₄` uses Arthur `Sp₄/SO₅`,restriction/similitude. Descent,reducibility,packet switching/abelian-surface implications retain TWFL/trace inputs;unitary classifications alone are insufficient.

([BCGP], §1.4.1, p. 14.)

*Needs:* [Trace inputs]; [TWFL].

<a id="automorphic-induction-register"></a>
#### Automorphic induction and its cuspidality criterion

Import ET§6.26 weak cyclic induction ([EndoscopicTransferAndUnitaryTraceComparison](../EndoscopicTransferAndUnitaryTraceComparison/README.md)):AC III6.1/6.2 p.215 gives almost-everywhere matching;prime-degree invariant inputs give twist sums of descents,noninvariant cuspidal inputs cuspidal induction (6.3–4 pp.217–218). General cyclic6.5 pp.218–219 uses full orbit size[L:F],not noninvariance under one generator.

The strengthening constructed here is `automorphicInduction_allPlace`. For a cyclic extension L/F of degree d and a unitary cuspidal `σ` on `GL_m(𝔸_L)`, its unique isobaric induction satisfies, at **every** place v,

`rec(AI_L/F(σ)_v) = ⊕_{w|v} Ind_{W′_{L_w}}^{W′_{F_v}} rec(σ_w)`.

Use WD including N at finite places,Weil groups at infinity. Extend additively to unitary isobaric sums/by common norm twist to essentially unitary cuspidals. This is ordinary LLC;translate to Galois via C-GALOIS’s rank-dependent Tate twists.

[Henniart, global induction],Thms.3/5 pp.5,7,§3.7/Remark p.16 proves all-place comparison. Route:unique global isobaric object by base change/`κ`-self-twist (§2.6 pp.11–12);Thm.6 characterizes **generic unitary** local induction by both conditions;globalization with second cuspidal place gives transitivity (§§3.1–2 pp.13–14),square-integrable constituents/real exponents give image/fibres (§§3.4–5 p.15),globalization identifies local induction (§3.6 p.16),and3.7 treats infinity. Own these additions to the weak supplier.

For `ψ_w=ψ_v∘Tr_{L_w/F_v}`,`L_ind=∏_{w|v}L(s,recσ_w)`,`ε_ind=∏_{w|v}λ(L_w/F_v,ψ_v)^mε(s,recσ_w,ψ_w)`. Here `λ` is the induced/trivial-line epsilon ratio. Retain ramified `λ` and real `Γ_ℝ/Γ_ℂ`. Quadratic Hecke induction is imported from ET§13.`3/GL₂` monomial theory.

**Checks.**

- In degree one induction is the identity.
- In prime degree an invariant cuspidal input gives d constituents, rather than a cuspidal rank-md object.
- In degree four a representation with stabilizer of order two has orbit two and is not cuspidal after induction.
- Almost-everywhere Euler matching by itself does not specify a ramified WD monodromy operator.

([AC89](#ref-arthur-clozel-1989), III §6, pp.214–219; [Henniart, global induction], §§1.12,2.6–2.7,3, pp.6,11–16.)

*Needs:* EndoscopicTransferAndUnitaryTraceComparison §§6.24, 6.26 and 13.3; AutomorphicLFunctionsAndLocalFactors, strong multiplicity one and local functional equations; GL2AutomorphicRepresentationsAndTransfer R17.4–R17.5.

## How to read the build

The layer numbers organize the targets; the following dependencies fix the construction order. Construct §1.10's all-place predicate before §4.15, then deduce §1.10's Galois equivalence and prove §4.12. Prove §2.39 before §2.38. Construct only §3.13's parameter/component-group definitions before §3.15, then deduce §3.13's packet bijections. Prove §3.17 before §3.4's transfer characterization. Prove §5.1's forward generic transfer, then §5.4's descent, then §5.1's image/converse characterization. Other targets follow their stated prerequisites. `Suggested.lean` gives suggested forms over existing carriers; this README specifies every target and its prerequisites.


Supplier abbreviations in the build (their contracts and hypotheses remain as above): AG2 = AutomorphicGaloisRepresentationsPartII; AG = AutomorphicGaloisRepresentations; AF = AutomorphicFormsOnReductiveGroups; AL = AutomorphicLFunctionsAndLocalFactors; PMCS = PotentialModularityAndCompatibleSystems; PAI = PotentialAutomorphyInfrastructure; ET = EndoscopicTransferAndUnitaryTraceComparison; GL2T = GL2AutomorphicRepresentationsAndTransfer; GL2ML = GL2ModularityLifting; CSM = ClassicalSerreModularity; SWLO = SerreWeightAndLevelOptimisation; LGD = LocalGaloisDeformationRings; GGD = GlobalGaloisDeformations; ALS = ArithmeticLocallySymmetricSpaces; HMV = HilbertModularVarietiesAndShimuraCurves; SR = SmoothRepresentationsOfLocalGroups; PH = PadicHodgeTheory; CR = CrystallineCohomology; LAD = LocallyAnalyticDistributions; RAG = RigidAnalyticGeometry; IG = InverseGaloisAndArithmeticFundamentalGroups. Local links use the target’s section number.

## Layer 0: realization comparisons and the singular-weight Hodge prediction

<a id="compatible-system-automorphic-l-function-comparison"></a>
### 0.1 L-functions of the compatible system of an automorphic representation

For RAC `π` of rank n with system `R_π`, unramified LGC gives `L^S(R_π,s)=L^S(π,s+(1−n)/2)`, initially on a right half-plane and then on common meromorphic continuations. At infinity ACC+ 7.1.1 additionally needs purity, density-one generic irreducibility and its field setting; Hodge lists alone do not fix real signs. Full `Λ`-comparison also needs all ramified factors/coherent `ε`. Under these hypotheses transfer the shifted automorphic continuation/functional equation.

API: `TauCeti.LanglandsRegister.completedL_automorphic`.

Proof route: match reciprocal local polynomials with shift `(1−n)/2`; apply ACC+ 7.1.1 with its stated archimedean hypotheses, the ramified/epsilon comparisons and AL.2.

For `n = 2` and `π` attached to an elliptic curve `E/ℚ`: `L(R_π, s) = L(E, s)` and `Λ(E, s) = N^{s/2}Γ_ℂ(s)L(E, s)` satisfies `Λ(E, s) = ±Λ(E, 2 − s)`.

([ACC+], §7.1, paragraph after the proof of Lemma 7.1.10 (before Thm. 7.1.11), p. 200 (Annals p. 1095).)

*Needs:* [PMCS §1.15, system L-functions](../PotentialModularityAndCompatibleSystems/README.md); [Polarization]; AG2.2; AL.2.

<a id="nt26-automorphy-predicate"></a>
### 0.2 Automorphic Galois representations in Newton–Thorne's sense

For totally real/CM F and prime p, a continuous `ρ:G_F→GL_n(Q̄_p)` is NT-automorphic iff `ρ≅r_{π,ι}` for RAESDC/RAECSDC `π` and `ι:Q̄_p≅ℂ`, using [Frobenius/duality](#nt26-normalisation-bridge). Thus `ρ` is essentially (conjugate) self-dual; general irreducibility remains conjectural. NT note that broader definitions are possible.

- `TauCeti.LanglandsRegister.IsAutomorphicNT`: the predicate above, requiring cuspidal `π`; isobaric sums fail.
- `TauCeti.LanglandsRegister.IsAutomorphicNT.of_iso`: isomorphism invariance.
- `TauCeti.LanglandsRegister.IsAutomorphicNT.twist`: closed under twists by realized algebraic Hecke characters.
- `TauCeti.LanglandsRegister.IsAutomorphicNT.iff_blggt`: for irreducible polarized `(ρ,µ)` with the actual compatible automorphic Hecke/multiplier character, equivalence with BLGGT automorphy. Irreducibility does not choose an unspecified multiplier.
- `TauCeti.LanglandsRegister.IsAutomorphicNT.irreducible`: conjectural only; use proved rank-two or applicable density/regularity irreducibility theorems.

Proof route: the cited NT definition; compare BLGGT polarized pairs with the fixed Hecke character and its realized multiplier, using strong multiplicity one and Chebotarev.

**Checks.**

- `H¹_et(E_{ℚ̄},ℚ̄_p)=V_p(E)∨` is automorphic via the weight-two form; use the explicit duality and `HT(ε_p)=−1`.
- Rank one: `ρ=r_ι(χ)` for an algebraic Hecke character, by class field theory.
- `1⊕ε_p⁻¹` is isobaric, not cuspidal, hence fails this predicate.
- Weight-one newforms fail RAity, hence this predicate.

The predicate depends only on `ρ` up to isomorphism and is independent of `ι` when `π` is cohomological (`r_ι(π)` for another `ι′` is `r_{ι′}(π′)` for a Galois conjugate `π′`).

([NT Hilbert], §2 ('Some comforting lemmas'), opening paragraph immediately before Lemma 2.1, p. 9.)

*Needs:* AG2.0 (polarized automorphic representation); AG2.2.

<a id="singular-weight-hodge-list"></a>
### 0.3 The four predicted Hodge numbers

For `k∈ℕ`,`r∈ℤ`, `singularWeightHodgeList(k,r)=[0,r−2,r+k−1,k+2r−3]`, retaining repetitions. Nodup iff `r≠2`,`k+r≠1`,`k+2r≠3`; `k+1>0` excludes the remaining pair equality. This numerical list does not assert Hodge realization.

- `TauCeti.LanglandsRegister.singularWeightHodgeList`: The stated list, with four positions even when values coincide.
- `TauCeti.LanglandsRegister.singularWeightHodgeList_length`: Its length equals four.
- `TauCeti.LanglandsRegister.singularWeightHodgeList_nodup_iff`: No repeated entries iff the three exclusions hold, for `k≥0`.
- `TauCeti.LanglandsRegister.singularWeightHodgeList_r_two`: `H(k,2)=[0,0,k+1,k+1]`.

Proof: compare the six pairwise differences; `k+1>0` leaves precisely the three displayed exclusions.

**Checks.**

- `H(2,1)=[0,−1,2,1]`, with no repetition.
- H(3,2) repeats entries.
- `H(0,2)=[0,0,1,1]`.
- `H(0,1)=[0,−1,0,−1]` repeats entries through `k+r=1`, even though `r≠2`.

([Pilloni], Remark 5.3.2, pp. 25–26, author manuscript.)

*Needs:* Mathlib finite lists, integers, polynomials and finite-dimensional linear algebra in the stated scope.

<a id="expected-crystallinity-newton-above-hodge"></a>
### 0.4 Expected de Rham and crystalline properties of `GSp₄` Galois representations in singular weight (Pilloni Remark 5.3.2)

ExpectedSingularWeightHodge: for every Hecke eigencharacter `Θ:H^N→ℂ` occurring in coherent `H^i(S^tor_{K,Σ},Ω^{(k,r)})` or its cuspidal version on the Siegel threefold, `k≥0`,`r∈ℤ`, let E be the number field generated by `Θ(H^N)`. For every finite place λ of E, with residue characteristic p, the semisimple `ρ_{Θ,λ}:G_ℚ→GL₄(E_λ)` of Pilloni Thm. 5.3.1 is expected to be de Rham at p with §0.3’s HT list `(HT(ε)=−1)`, and crystalline if `(N,p)=1`. At good p its Hecke Newton polygon lies above that Hodge polygon with equal endpoints. This is conjectural; in cohomological weight (the three §0.3 exclusions), Pilloni cites V. Lafforgue for the good-p Newton inequality alone.

- `TauCeti.LanglandsRegister.ExpectedSingularWeightHodge`: The proposition stated.
- `TauCeti.LanglandsRegister.ExpectedSingularWeightHodge.hodgeTate`: The expected HT weights are `(0, r − 2, r + k − 1, k + 2r − 3)`.
- `TauCeti.LanglandsRegister.ExpectedSingularWeightHodge.cohomological`: For `k ≥ 0` in cohomological weight the HT weights are pairwise distinct.

Define this proposition; no general realization theorem is asserted.

**Checks.**

- `k=2`,`r=1` gives distinct weights `(0,−1,2,1)`, satisfying all three cohomological inequalities.
- `r=2` gives `(0,0,k+1,k+1)`, hence is not cohomological.
- `k=0`,`r=2` gives (0,0,1,1), the abelian-surface `H¹` list.
- The zero cohomology vector and a sum of eigenvectors with different Hecke characters select no single Θ; the expectation quantifies over occurring eigencharacters.

Pilloni Thm. 5.3.1 constructs `ρ_{Θ,λ}`; the expectation concerns its p-adic Hodge theory.

([Pilloni], §5.3, Remark 5.3.2, p. 25 (author version); §5.3, Remark 5.3.2, p. 26 (author version).)

*Needs:* PH §§3.3–3.6 and 5.3–5.4 (`D_cris` of Tate twists and unramified characters).

### Examples

For `k=2`,`r=1` the four predicted numbers are `[0,−1,2,1]`, while `k=0`,`r=2` gives `[0,0,1,1]`. The numerical list alone cannot establish a crystalline realization. For the trivial rank-one Frobenius, reversing `X−1` gives `1−T`; the good-prime Euler denominator is therefore `1−q^{−s}`.

### Dependencies

Use the exact supplier contracts and the prerequisites cited in this layer’s targets.

## Layer 1: weight one, low-rank lifts and residual image conditions

<a id="accessible-regular-refinement"></a>
### 1.1 Accessible and n-regular refinements

For definite unitary `G_d/F⁺` and automorphic `π`, identify split p-factors with `GL_d(F_ṽ)`. A refinement `χ_v:T_d(F_ṽ)→Q̄_p×` is accessible iff it occurs in `ι⁻¹r_{N_d}(π_v)`, equivalently `π_v↪i_{B_d}^{GL_d}ιχ_v`. For `d=2` and a separate rank `n≥2`, n-regular means `(χ_{v,1}/χ_{v,2})^i≠1` for `1≤i<n`, all `v∈S_p`. For `GL₂/ℚ`, accessibility at l is equivalent to nonzero Jacquet module, hence to not supercuspidal.

- `TauCeti.SymmetricPower.IsAccessibleRefinement`: `χ_v` a subquotient of the normalised Jacquet module at each `v ∈ S_p`.
- `TauCeti.SymmetricPower.IsNRegular`: For a rank-two refinement and `n≥2`, `(χ_{v,1}/χ_{v,2})^i ≠ 1` for all `1≤i≤n−1` and all `v∈S_p`.
- `TauCeti.SymmetricPower.isAccessible_iff_not_supercuspidal`: An accessible refinement exists iff `π_l` is not supercuspidal.
- `TauCeti.SymmetricPower.isNRegular_mono`: n-regular ⇒ m-regular for `m ≤ n`.

Construction: normalized Jacquet modules and Frobenius reciprocity; symmetric powering sends `(χ₁,χ₂)` to `(χ₁^{n−1},χ₁^{n−2}χ₂,…,χ₂^{n−1})`.

**Checks.**

- For an irreducible unramified principal series, `α≠β` gives refinements `(α,β)`,`(β,α)`; `α=β` identifies them. The n-regular test is `(α/β)^i≠1` for `1≤i<n`.
- A Steinberg twist has exactly one accessible refinement.
- A supercuspidal has none (NT I Thm. B’s excluded case).
- `α/β=−1` is 2-regular but not 3-regular.

([NT I], §2, p. 34, and Def. 2.23, p. 40.)

*Needs:* SR, normalized induction and Jacquet modules.

<a id="strong-artin-conjecture"></a>
### 1.2 Langlands' conjecture for Artin representations (the strong Artin conjecture)

For a number field K, positive rank n and continuous irreducible finite-image `ρ:G_K→GL_n(ℂ)` in the classical arithmetic Artin convention of [C-ARTIN], strong Artin means a unitary cuspidal `π` with `rec(π_v)≅(ρ|W_{K_v})∨` at **every** place, matching full `L/ε`. With geometric reciprocity this dual gives the classical arithmetic Artin factors of ρ. Godement–Jacquet gives entireness for nontrivial `ρ`.

Define weak Artin automorphy by existence of a unitary cuspidal π whose unramified Satake characteristic polynomials agree with those of `ρ∨(Φ_v)` outside one finite set containing both ramification sets, with geometric Frobenius `Φ_v` and fixed common complex coefficients. Equality includes every coefficient. In rank two this is precisely `AgreesAwayFromFinite (unitaryEigensystem π) (ofGaloisRep (ρ∨))`, using AutomorphicFormsOnReductiveGroups §5.8's [shared eigensystems](../AutomorphicFormsOnReductiveGroups/README.md#anemic-eigensystems) and GL2AutomorphicRepresentationsAndTransfer R16.4.4's [geometric-Frobenius adapter and unitary normalization](../GL2AutomorphicRepresentationsAndTransfer/README.md#r16-4-strong-multiplicity-one). Thus both `t_v` and `s_v` agree, where `X²−t_v X+q_v s_v` is the polynomial. These are the supplied carriers and comparison relation; a polynomial character without automorphic occurrence is insufficient.

Strong multiplicity one makes the weak automorphic witness unique. For rank two, if that same witness also has archimedean parameters `(ρ|W_{K_v})∨`, apply GL2AutomorphicRepresentationsAndTransfer R17.5.5's [all-place upgrade](../GL2AutomorphicRepresentationsAndTransfer/README.md#r17-5-artin-all-place-upgrade) to obtain strong Artin. Weak matching itself includes no infinity or bad-place assertion. The separation of cofinite Hecke agreement from all-place matching follows the API pattern of the Imperial College London FLT project.

- `TauCeti.WeightOne.IsWeaklyAutomorphicArtin`: For continuous irreducible finite-image ρ of positive rank, existence of the unitary cuspidal witness with the cofinite polynomial agreement above; in rank two use the shared `AgreesAwayFromFinite` relation in both coordinates.
- `TauCeti.WeightOne.IsWeaklyAutomorphicArtin.of_iso`: Invariant under isomorphism of ρ.
- `TauCeti.WeightOne.IsWeaklyAutomorphicArtin.twist`: Weak automorphy of ρ implies weak automorphy of `ρ⊗χ` for a continuous finite-order character χ, with witness twisted by the Hecke character corresponding to `χ∨` under geometric reciprocity.
- `TauCeti.WeightOne.IsWeaklyAutomorphicArtin.unique`: Any two unitary cuspidal witnesses for the same ρ are isomorphic.
- `TauCeti.WeightOne.IsAutomorphicArtin`: `ρ` has a unitary cuspidal `π` matching `(ρ|W_{K_v})∨` at every place (strong Artin).
- `TauCeti.WeightOne.IsAutomorphicArtin.to_weak`: All-place matching implies weak automorphy for the same ρ and witness.
- `TauCeti.WeightOne.IsAutomorphicArtin.of_weak_rankTwo`: For continuous irreducible finite-image rank-two ρ, a weak witness π whose archimedean parameters match `ρ∨` satisfies the all-place matching required by `IsAutomorphicArtin ρ`.
- `TauCeti.WeightOne.IsAutomorphicArtin.lFunction_entire`: IsAutomorphicArtin `ρ` and `ρ` non-trivial ⇒ `L(ρ, s)` extends to an entire function.
- `TauCeti.WeightOne.IsAutomorphicArtin.of_iso`: Invariant under isomorphism of `ρ`.
- `TauCeti.WeightOne.IsAutomorphicArtin.twist`: IsAutomorphicArtin `ρ` ⇒ IsAutomorphicArtin `(ρ ⊗ χ)` for a finite-order character `χ`.
- `TauCeti.WeightOne.IsAutomorphicArtin.dim_one`: Every one-dimensional `ρ` is automorphic (class field theory).
- `TauCeti.WeightOne.IsAutomorphicArtin.unique`: The cuspidal `π` is unique (strong multiplicity one).

Proof route: the supplied eigensystem isomorphism and twist laws give the weak API; strong multiplicity one gives uniqueness. The rank-two upgrade uses R17.5.5 with its separate infinity comparison. Full local matching and Godement–Jacquet give entireness.

**Checks.**

- A finite-order Hecke character matches its finite-image Galois character via Artin reciprocity.
- For imaginary quadratic `L/ℚ` and `χ≠χ^c`, `Ind_{G_L}^{G_ℚ}χ` matches the weight-one theta series `AI(χ)`.
- `1⊕1` is reducible; its isobaric match `1⊞1` has `L=ζ²` with a pole.
- A weight-one newform’s Deligne–Serre representation (AG §2.10) matches `π_f` through its dual under geometric reciprocity.
- At a good place, pairs `(1,−1)` and `(2,−2)` have equal trace zero but determinants `−1` and `−4`; their shared eigensystems differ in `s_v`. Trace agreement alone is not the weak predicate.
- If ρ has arithmetic Frobenius eigenvalues `(ζ₃,ζ₃)`, its geometric eigenvalues are `(ζ₃⁻¹,ζ₃⁻¹)`; `ofGaloisRep (ρ∨)` restores `(ζ₃,ζ₃)`, giving `(t_v,s_v)=(2ζ₃,q_v⁻¹ζ₃²)`.
- Cofinite matching without an infinity comparison does not meet R17.5.5's hypotheses: the archimedean factors cannot be cancelled in its functional-equation argument.

The proved rank-two cases are [CSM §R27.6](../ClassicalSerreModularity/README.md) over `ℚ` and [§1.9] over totally real fields.

([KW09], §10.2, pp. 20–21 (author copy results.pdf); GL2AutomorphicRepresentationsAndTransfer R16.4.4 and R17.5.5, with the latter’s local recognition input from Bushnell–Henniart, §27.1–8, pp.170–176.)

*Needs:* AutomorphicFormsOnReductiveGroups §5.8/anemic-eigensystems; GL2AutomorphicRepresentationsAndTransfer R16.4.4/r16-4-strong-multiplicity-one and R17.5.5/r17-5-artin-all-place-upgrade; AL.2 (global Godement–Jacquet theory); AL.3 (strong multiplicity one); AL.3 (Rankin–Selberg boundary nonvanishing); AdelicAlgebraicGroups §2.4, convergence-factors; AnalyticNumberTheoryPartI §§2.18, 2.31; Chebotarev, Layer 10.

<a id="irregular-systems-weight-one"></a>
### 1.3 Irregular odd compatible systems arise from weight-one newforms (Khare–Wintenberger, Theorem 10.1(ii))

An E-rational rank-two compatible system on `G_ℚ`, continuous, semisimple and finitely ramified at every coefficient embedding, WD-compatible away from `ℓ` and crystalline at `ℓ`≫0 with HT list (a,b), if irreducible, odd and irregular `(a=b)`, comes up to twist from a weight-one newform. After twisting to (0,0), every realization has finite image.

API: `TauCeti.WeightOne.weightOne_of_irregular`.

Proof route: Sen–Fontaine, residual irreducibility/strong Serre/weight lowering and CSM R27.6’s weight-one descent. Take `N′=N` `(N≥5)`, else 5N; omit primes dividing 2N′ or coherent `H¹` torsion. Eigenvalue lifting/finite eigensystems give infinitely many congruences; denominator clearing and Chebotarev give equality. Level divides N′; no omitted-prime lifting or bad-Hecke equality is claimed.

The converse: newforms of weight one give irregular irreducible odd compatible systems (Deligne–Serre).

([KW09], Thm. 10.1(ii), §10.1, p. 20 (author copy results.pdf); Proof of Thm. 10.1(ii), p. 20 (author copy results.pdf); §5, p. 8 (author copy results.pdf).)

*Needs:* CSM R27.6 (weight-one descent from infinitely many primes); CSM R27.6 (unramified residual representations arise in weight one); CSM R27.6 (full classical Serre theorem); PMCS §13.1 (residual members); PH §§3.3–3.6 and 5.3–5.4 (`D_cris` of Tate twists and unramified characters); SWLO §3.4 (weight-one forms unramified at p); AG §2.10 (weight-one Artin representation).

<a id="non-solvable-residual-modularity"></a>
### 1.4 Modularity of non-solvable mod 5 representations of totally real fields with cyclotomic determinant

For totally real E unramified at 5, totally odd `ϱ̄:G_E→GL₂(F₅)`, `det=ε̄⁻¹` and nonsolvable projective image, `ϱ̄` is modular (BCGP 10.1.3). Before Pilloni–Stroh 2.1.3, twist det to `ε̄` and pass solubly to projective `PSL₂(F₅)`; direct `PGL₂` application fails. Separately Snowden 7.2.1 gives finitely many weight-two lifts of a fixed lifting problem iff every specified local problem has a solution.

Lifting hypotheses: Snowden (A1) cyclotomic absolute irreducibility; (A2) `[E(ζ₅):E]=4` in the projective-`PGL₂(F₅)` case; odd reduction; finite `Σ` containing 5/ramification; finite-order `ψ` lifting `det ϱ̄/ε̄`; definite/inertial types; and weight-two local determinant-`ψε` lifts at every `v∈Σ`. The residual modularity assertion uses the preceding hypotheses.

API: `TauCeti.WeightOne.mod5_nonsolvable_modular`.

Proof route: the elliptic moduli/Moret–Bailly construction, solvable descent and Pilloni–Stroh 2.1.3; Snowden 7.2.1 gives lifts with the specified local solutions, and GL2ML gives their modularity.

([BCGP], Proof of Prop. 10.1.3, p. 266; [Pilloni–Stroh], §2.1, Lemmas 2.1.1–2.1.2 and Prop. 2.1.3, pp. 9–10; [Snowden](#ref-snowden-2009), §7.2, Thm. 7.2.1 and definition of a lifting problem, pp. 20–21; §3.1, (A1)–(A2), p. 6.)

*Needs:* PMCS §§2.8–2.10 and 2.23; AG §§3.10–3.14 and 4.3–4.7; GL2ML §5.7.

<a id="buzzard-taylor-hypotheses"></a>
### 1.5 Finitely many points with finite image make R[1/p] reduced (Calegari–Geraghty Lemma 4.14 and the Buzzard–Taylor remark)

For number field F, finite char-p k, finite S excluding p, and absolutely irreducible continuous `ρ̄:G_{F,S}→GL₂(k)` with universal ring R: if R has finitely many `Q̄_p`-points, all finite-image, then R[1/p] is reduced. Over `ℚ` with modular `ρ̄`, Buzzard–Taylor/Buzzard companion forms and overconvergent continuation often establish these hypotheses, linking CG to classical weight one.

API: `TauCeti.WeightOne.reduced_of_finitePoints`.

Proof route: CG 4.14 proves étaleness at the finitely many finite-image points. Buzzard–Taylor/Buzzard can supply the hypotheses for modular residual representations over `ℚ`; the cited remark asserts this only “often”.

([Calegari–Geraghty](#ref-cg-2018), Lemma 4.14, §4.2, p. 52 = Invent. pp. 366–367; proof pp. 52–53 = Invent. pp. 367–368; §4.2, remark after the proof of Lemma 4.14, p. 53 = Invent. p. 368.)

*Needs:* AG §2.10 (weight-one Artin representation); LGD §F.2.5 (universal deformation ring under `Φ_p` and the Schur hypothesis).

<a id="functorial-lift"></a>
### 1.6 Functorial lift of a `GL_n` representation along an algebraic representation `R : GL_n → GL_N`

For cuspidal `π` on `GL_n(𝔸_F)`, F a number field, and algebraic `R:GL_n→GL_N`, a lift is an isobaric `R(π)` with `rec(R(π)_v)=R∘rec(π_v)` at every place (finite LLC and archimedean Langlands). Isobaric strong multiplicity one gives uniqueness. Weak lifting matches almost everywhere; CKPSS classical-group lifting matches infinity and almost all unramified finite places.

- `TauCeti.Functoriality.IsFunctorialLift`: the all-place predicate above.
- `TauCeti.Functoriality.IsWeakLift`: almost-everywhere unramified Satake matching.
- `TauCeti.Functoriality.IsFunctorialLift.unique`: uniqueness up to isomorphism.
- `TauCeti.Functoriality.IsFunctorialLift.toWeak`: strong implies weak.
- `TauCeti.Functoriality.IsFunctorialLift.comp`: compose along `R′∘R` if the intermediate lift belongs to R′’s input domain; require cuspidality for that domain, or its explicit isobaric extension.
- `TauCeti.Functoriality.IsFunctorialLift.id`: identity lift.
- `TauCeti.Functoriality.IsFunctorialLift.lFunction`: `L(s,R(π))=L(s,π,R)`.

Construction: finite and archimedean LLC; uniqueness by isobaric strong multiplicity one (AL.3).

**Checks.**

- `R=det` on `GL₂` gives the central Hecke character `ω_π`.
- On `GL₁`, `R:x↦x^k` sends `χ` to `χ^k`.
- For `π=AI_{K/F}(θ)`, `Sym²π=AI(θ²)⊞θ|_{𝔸_F×}` is noncuspidal; `Ad(π)=AI(θ/θ^σ)⊞η_{K/F}`.
- `R=std` gives `π`, with equality of rec at every place.

`Sym^{n−1}` recovers [§1.10]; `std⊗std′` gives Ramakrishnan’s transfer.

([NT I], Introduction, 'Context', p. 1.)

*Needs:* SR §SR.5.2; [AutomorphicLFunctionsAndLocalFactors, Representation prerequisites: archimedean GL_n parameters](../AutomorphicLFunctionsAndLocalFactors/README.md); AL.3 (strong multiplicity one); AL.3 (Rankin–Selberg boundary nonvanishing).

<a id="projective-image-sandwich"></a>
### 1.7 The finite-field projective image condition

For group G, finite field `k↪^ι K` and `ρ:G→GL₂(K)`, `ProjectiveImageSandwich(p,a,n,ι,ρ)` means p prime,`a≥1`,`n≥1`,`#k=p^a>max(5,2n−1)`, and one `c∈PGL₂(K)` with `PSL₂(k)≤c(range Pρ)c⁻¹≤PGL₂(k)`, both embedded by `ι`. `K=F̄_p` recovers NT II 2.1’s image hypothesis; neither `p>n` nor automorphy is asserted.

- `TauCeti.SymmetricPower.ProjectiveImageSandwich`: The explicit conjunction and two subgroup inclusions.
- `TauCeti.SymmetricPower.ProjectiveImageSandwich.bound`: The hypothesis gives `p^a`>max(5,`2n−1`).
- `TauCeti.SymmetricPower.ProjectiveImageSandwich.mono`: For `1≤m≤n` the same data satisfy the rank-m bound.
- `TauCeti.SymmetricPower.ProjectiveImageSandwich.conjugation`: Conjugating the actual `GL₂` representation preserves the condition.

Construction: central quotient, one conjugation, and the two subgroup images under the same field embedding; rank monotonicity follows from the strict bound.

**Checks.**

- The identity of `GL₂(𝔽₇)` satisfies the condition for `p=7`,`a=1`,`n=3`.
- For `𝔽₅` and `a=1` the strict bound always fails.
- `a=0` is impossible.
- `p=2`,`a=3`,`n=4` passes the size test `8>7` with `p≤n`; no representation is inferred from size alone.

([NT II], Thm. 2.1, pp. 5–6.)

*Needs:* `Matrix.ProjGenLinGroup`; `Matrix.ProjGenLinGroup.mk`; `Matrix.ProjGenLinGroup.map`; `Matrix.ProjectiveSpecialLinearGroup.toPGL`.

<a id="hilbert-weight-one-realization"></a>
### 1.8 Hilbert finite-slope gluing and weight-one realization

For totally real F, any prime p and integral k, let X be Pilloni–Stroh §8’s union of Hilbert varieties over polarization-ideal classes at fixed tame level. Classical forms are `H⁰(X,ω^k)`, p-adic forms sections on the ordinary tube, overconvergent forms sections on strict neighborhoods. Finite slope means killed by `P(U_p)`, `P(0)≠0`. For canonical-subgroup quotient pullback `φ` on these sections:
`H classical ↔ φ(H) overconvergent and finite slope`.
Allow arbitrary p-ramification and `p=2`.

Modularity application (Pilloni–Stroh 0.4, pp.2–3): p odd; `ρ:G_F→GL₂(ℤ̄_p)` continuous geometric/totally odd, `HT=(0,0)`; cyclotomic residual irreducibility; ordinarily modular reduction; and `[F(ζ₅):F]=4` if `p=5`/projective `PGL₂(𝔽₅)`. Obtain a normalized cuspidal parallel-weight-one form with `ρ`’s good traces/determinant. Thm. 0.3 removes auxiliary-prime hypotheses for finite-image complex `ρ` by residual arguments/soluble descent (§1.9).

**API.**

- `HilbertClassicalSections / HilbertOverconvergentSections`: sections of the same bundle; restriction respects Hecke/q-expansion.
- `finiteSlopeSubspace / canonicalFrobeniusPullback`: the compact U-operators, nonzero-constant polynomials and canonical-quotient pullback above.
- `companion_generalized_eigenspace`: rank one over the product Hecke-polynomial algebra, retaining repeated roots.
- `classical_iff_frobenius_finiteSlope / weightOne_gluing_realization`: comparisons of these same sections/eigensystems. In 7.2.4 the `U_v`-module is free rank one over `E[X_v:v|p]/(P_v(X_v))`; 7.2.6 constructs `φ(H)=G` even at double roots. Analytic extension gives classicality with that eigensystem.

**Checks.**

- For `a≠0`, E[X]/`((X−a)²)` has dimension two and nonzero nilpotent `X−a`; distinct eigencharacters lose it.
- `P=X` fails `P(0)≠0`; `P=X−1` passes.
- Ordinary slope zero is only a finite-slope special case.
- Gluing includes `p=2`; the modularity-lifting application requires odd p.
- Zero is classical; a normalized cusp output instead has first Fourier coefficient one.

([Pilloni–Stroh], Thm. 7.2.4 and Prop. 7.2.6, pp.33–35; Thm. 8.2 and Cor. 8.4, pp.35–37; analytic-extension proof §§10.3–10.6, pp.65–74.)

`hilbertWeightOneArtinRep(f)`: any normalized cuspidal parallel-weight-one Hilbert eigenform with finite-order centre gives an irreducible finite-image totally odd representation, characterized by good Hecke polynomials. No residual ordinarity or odd field degree is needed; coefficient conjugation conjugates the representation.

Proof route: RT2.8 Hasse lifts (weight divisible by `ℓ−1`,q-expansion1 `modℓ`),eigenvalue lifting and **AutomorphicGaloisRepresentations §3.10, the unrestricted regular Hilbert constructor** replace RT3.4(a). Infinitely many degree-one coefficient primes permit RT3.3/3.5/3.6’s uniform image bound/complex lift;cuspidal entireness/boundary nonvanishing gives irreducibility,determinant gives oddness. Globalized ramified character tests,functional equations/`GL₂` converse give all-place matching;real parameter`1⊕sgn` up to finite centre.

**Forward checks.** For `F=ℚ` recover Deligne–Serre. For even-degree F and a form with no finite discrete-series component the construction still applies through the unrestricted regular constructor. The parallel-weight-two representation has infinite cyclotomic determinant and does not satisfy the finite-image conclusion. Conjugating the coefficients conjugates every good characteristic polynomial, rather than leaving an arbitrary chosen embedding fixed.

([Rogawski–Tunnell, On Artin L-functions associated to Hilbert modular forms of weight one](https://gdz.sub.uni-goettingen.de/id/PPN356556735_0074), Invent. Math. 74 (1983), Prop. 2.8 p.25; Thm. 3.1 pp.28–29; Prop. 3.3 pp.29–30, Lemma 3.5 p.31 and Prop. 3.6 with the proof of Thm. 3.1(a) p.32. The replacement of Prop. 3.4(a) is the deduction just described.)

*Needs:* HMV, Hilbert varieties, automorphic line bundles and q-expansion; PadicFamilies, overconvergent sections and compact operators; HodgeTateAndCanonicalSubgroups Layer 3, canonical subgroup; GL2ML, ordinary patching; AG §3.10, unrestricted regular Hilbert realization, and §3.14, its determinant/oddness; CSM R27.6, Deligne–Serre eigenvalue lifting; ArithmeticGaloisRepresentations, finite-image coefficient descent and Chebotarev; AL, comparison of twisted local factors.

<a id="totally-real-odd-artin"></a>
### 1.9 The odd Artin conjecture over totally real fields (Pilloni–Stroh), as used for `A₅` images

For totally real E, every continuous irreducible finite-image totally odd `ϱ:G_E→GL₂(ℂ)`, `det ϱ(c)=−1` at all real places, comes from a parallel-weight-one Hilbert eigenform (Pilloni–Stroh 0.3), hence satisfies strong Artin. BCGP apply this to Tate’s finite-image odd lift of `ϱ̄₃:G_E→GL₂(F₉)` with projective `A₅` image.

API: `TauCeti.WeightOne.oddArtin_totallyReal`.

Proof route: Pilloni–Stroh companion forms, finite-slope gluing and modularity lifting; Tate finite-image projective lifting preserves oddness.

([BCGP], Proof of Prop. 10.1.3, §10.1, p. 266; [Pilloni–Stroh], Thm. 0.3, §0, printed p. 2.)

*Needs:* [§1.2]; [§1.8]; GL2T R17.5.

<a id="symmetric-power-lift-over-number-fields"></a>
### 1.10 Symmetric power lifts `Sym^{n−1}π` over a number field

For number field F, cuspidal `GL₂` `π` and `n≥1`, `Sym^{n−1}π` exists iff some `GL_n` automorphic `Π` satisfies `rec(Π_v)=Sym^{n−1}rec(π_v)` at every v (§1.6). For totally real F and non-CM RA `π` (Hilbert weights`≥2`, constant parity), §4.15 identifies this with a RAC `Π` satisfying `Sym^{n−1}r_l(π)≅r_l(Π)` for every l. Specialize to `F=ℚ` for the rational definition.

- `TauCeti.SymmetricPower.SymPowerExists`: the all-place existence predicate.
- `TauCeti.SymmetricPower.SymPowerExists.one`: `n=1` gives the trivial character.
- `TauCeti.SymmetricPower.SymPowerExists.two`: `n=2` gives `π`.
- `TauCeti.SymmetricPower.SymPowerExists.iff_galois`: RAESDC non-CM `π` over totally real F: existence iff `Sym^{n−1}r_{π,ι}` is automorphic for one/every `ι`.
- `TauCeti.SymmetricPower.SymPowerExists.baseChange`: commutes with soluble L/F when `BC(π)` stays cuspidal; otherwise use the explicit isobaric-domain extension and constituent operations.

Use [§1.6] and the Galois automorphy predicate [§0.2].

**Checks.**

- `n=3` gives [GJ78](#ref-gelbart-jacquet-1978)’s `Sym²`, cuspidal iff `π` is not dihedral.
- Dihedral `Sym²` exists but is noncuspidal.
- `n=1` gives the trivial `GL₁` character even at bad places; `n=2` retains `π` and all its bad parameters.
- If `π=AI_{L/F}(θ)`, then `BC_Lπ=θ⊞θ^c` is noncuspidal and outside the cuspidal-domain base-change law. Non-induced `π` has cuspidal `BC_Lπ`.

([CT17], §1 Introduction, manuscript p. 2.)

<a id="ramakrishnan-tensor-product"></a>
### 1.11 Ramakrishnan: the automorphic tensor product `GL₂ × GL₂ → GL₄`

For cuspidal `GL₂` `π`,`π′` over F, Ramakrishnan M gives isobaric `GL₄` `π⊠π′` with Rankin–Selberg `L/ε` at every finite place and L at infinity. If neither is dihedral, cuspidality iff `π′` is no Hecke twist of `π`. If `π′=AI_{K/F}μ`, K/F quadratic with involution `θ`, cuspidality iff `BC_Kπ` is cuspidal and `BC_Kπ≄BC_Kπ⊗(μ∘θ)μ⁻¹`; this includes the one-dihedral case.

API: `TauCeti.Functoriality.ramakrishnan`. For the full WD parameters used in §4.13, apply Kim 2003, Props. 5.1.3–5.1.5, pp.159–161: solvable local globalization, ramified twists, `GL₄` local converse with ranks 1–2, then two omitted good places and isobaric strong multiplicity one.

Proof route: Rankin–Selberg twists by `GL₁/GL₂` and the `GL₄` converse theorem.

Used in Newton–Thorne II, Appendix A, for icosahedral weight-one forms.

([NT II], Appendix A, proof of Thm. A.1, p. 28; [Ramakrishnan](#ref-ramakrishnan-2000), §3, Thm. M, p. 54 (Ann. of Math. 152; arXiv:math/0007203v1).)

*Needs:* [§1.6]; AL.3 (strong multiplicity one); AL.3 (Rankin–Selberg boundary nonvanishing).

<a id="sp-statement"></a>
### 1.12 The statement `SP_n` (Newton–Thorne, Conjecture B)

For `n≥1`, `SP_n` asserts that every non-CM RAC `π` on `GL₂` over every totally real F has a RAESDC `Sym^{n−1}` lift on `GL_n`, in the equivalent local/Galois senses of [§4.15]. Such rank-two inputs are already RAESDC. [§4.30] proves `SP_n` for all n.

- `TauCeti.SymmetricPower.SP`: The proposition `SP_n`.
- `TauCeti.SymmetricPower.SP.one`: SP 1 holds.
- `TauCeti.SymmetricPower.SP.two`: SP 2 holds.
- `TauCeti.SymmetricPower.SP.of_le_five`: SP n for `n ≤ 5` (low-rank transfers).
- `TauCeti.SymmetricPower.SP.all`: SP n for all n (Newton–Thorne Thm. 6.4).

Define the proposition.

**Checks.**

- SP `1: Sym⁰π` is the trivial character, cuspidal on `GL₁`.
- SP 3 is Gelbart–Jacquet's theorem for non-CM `π`.
- `SP_n` says nothing about CM `π`, whose symmetric powers `(n ≥ 3)` are not cuspidal.

`SP₁` and `SP₂` are immediate; [§1.15] supplies `SP₃`–`SP₅`.

([NT Hilbert], Conjecture B, §1 (Introduction), p. 3; restated after Thm. 3.2, p. 13.)

*Needs:* [§1.10]; [§0.2].

<a id="kim-shahidi-sym3"></a>
### 1.13 Kim–Shahidi: functorial products `GL₂ × GL₃ → GL₆` and the symmetric cube

For number field F and cuspidal `GL₂` `π`, `GL₃` `σ`, obtain `GL₆` `π⊠σ` and `GL₄` `Sym³π`. The cube is cuspidal except for dihedral/tetrahedral `π` (tetrahedral: `Adπ≅Adπ⊗χ` for cubic `χ`).

API: `TauCeti.Functoriality.kimShahidi`.

Proof route: Kim–Shahidi’s `D₅−2/E₆−1/E₇−1` triple-product factors (Introduction pp.839–840), `GL₆` converse (§3 Thm. 3.8), and all-place tensor comparison (§5 Thm. 5.1). For non-dihedral `π` extract `Sym³π` from `π⊠Sym²π=Sym³π⊞(π⊗ω_π)` using §6; handle dihedral `π` by induction. The cube’s cusp exceptions are dihedral/tetrahedral; no residue-characteristic 2/3 exclusion occurs here.

For `π` attached to a non-CM elliptic curve over `ℚ`, `Sym³π` is cuspidal of symplectic type with multiplier `ω_π³`.

([NT I], Introduction, 'Context', p. 1; [KS02], Introduction, Thm. A, p. 838 `(= Thm. 5.1)` (Ann. of Math. 155; arXiv:math/0409607v1); Introduction, Thm. B, PDF pp.2–3 (printed pp.838–839).)

*Needs:* [GL2AutomorphicRepresentationsAndTransfer §R17.4.13](../GL2AutomorphicRepresentationsAndTransfer/README.md); [§1.6]; AL.4.

<a id="kim-sym4"></a>
### 1.14 Kim: the exterior square `GL₄ → GL₆` and the symmetric fourth power `GL₂ → GL₅` (with Henniart)

For number field F: cuspidal `GL₄` `Π` has all-place `GL₆ ∧²Π` (Kim 2003; Henniart 2009 completes wild 2/3 compatibility). Cuspidal `GL₂` `π` has all-place `GL₅` `Sym⁴π`, cuspidal except for dihedral/tetrahedral/octahedral `π` (Kim–Shahidi).

API: `TauCeti.Functoriality.kim_exteriorSquare`.

**Construction and analytic input.** In unitary normalization, `Spin(2n)`,`4≤n≤7`, has derived Levi `SL_{n−3}×SL₄` and adjoint factors `r₁=Std_{n−3}⊗∧²Std₄`,`r₂=∧²Std_{n−3}⊗det Std₄`. Normalize by both; Whittaker coefficients, multiplicativity and Langlands classification define `L/ε/γ`. Infinity retains `Γ_ℝ`,`Γ_ℂ`,`λ(ℂ/ℝ,ψ)` ([Shahidi 1985](#ref-shahidi-real) 3.1/3.13, pp.990–1003).

Proof route: holomorphic nonzero normalized operators `(Re s≥1/2)`, smaller D-Levi factorization at equal exponents, `χ_v²⁴` ramified, `r₂` nonvanishing `(Re s≥1)`, and `GL₆` converse with `GL_m` tests,`1≤m≤4` (Kim 3.1/3.4/3.5, pp.149–151).

**Weak lift and unitarization.** Multiplicativity/converse handles nonsupercuspidal places; Rankin–Selberg density, weak Ramanujan and twisted exterior integrals kill all isobaric exponents (Kim 4.1.3–4.1.6, pp.153–155).

General `Π`: descend lexicographically by local solvable-base-change complexity/largest first cyclic prime, prescribing only maximal places. Infinitely many degree-p global extensions split a chosen good v with fresh ramification; discard finite self-twists, compare composita and descend (Kim §4.2 pp.156–158; Appendix 1 pp.171–175). No common inert prime is needed.

**Strong local comparison, including residue characteristics 2 and 3.** Globalization, ramified twists and functional equations isolate `γ`; `GL₆` converse uses ranks 1–4 and two-good-place patching (Kim 5.2.1/5.2.3–4, pp.162–164; 5.3.1 p.165). This includes infinity, with wild 2/3 completed next.

Wild auxiliary input: an `A₄`-extension and `C₃`-invariant normal-basis character distinguish `V₄` conjugates/pair products; pro-2 `H¹(C₃,−)=0` extends it. The six `∧²` characters form one orbit; CM globalization/induction gives a cuspidal auxiliary lift ([Henniart 2009](#ref-henniart-2009) §§2.2–2.6, pp.38–40).

Henniart §§3.1–3.4 pp.41–43: CM-globalize with the auxiliary component and `a₁`>⋯>`a₄`,`a₁+a₄>a₂+a₃`, giving distinct pair sums. Chebotarev gives `r₆≅∧²r₄⊗ν` in the fixed dual/Tate convention; full LGC retains N. Remove the designated unramified twist by its square; Kim/Shahidi supplies infinity.

**Symmetric fourth and cuspidality.** `A₃=Sym³π⊗ω_π⁻¹` has `∧²A₃=(Sym⁴π⊗ω_π⁻¹)⊕ω_π`; extract/cancel the character (Kim 7.3.1 p.168). Dihedral cases use induction; tetrahedral: `Sym⁴π⊗ω_π⁻¹=Sym²π⊞ω_πη⊞ω_πη²`,`η³=1` (§7.1 p.167). The `GL₂` pole, generic `GSp₄` descent and `Sp₈` intertwiner detect the remaining octahedral quadratic self-twist ([Kim–Shahidi 2002](#ref-kim-shahidi-cuspidality) 3.3.6–8, pp.183–186).

**API.** `exteriorSquareCandidate / exteriorSquareCandidate_local / exteriorSquareCandidate_twist`: LLC restricted tensor product, local parameter and `χ²` twist. `spinAdjointFactors / normalizedSpinIntertwiner`: the displayed factors/operators, multiplicativity and holomorphic nonzero region. `auxiliaryExteriorSquareCuspidal`: quartic auxiliary with irreducible `∧²`; `exteriorSquare_local_allPlaces`: final equality. `symmetricFourth / symmetricFourth_local / symmetricFourth_cuspidal_iff`: `GL₅` summand, parameters and three cusp exceptions. Import LLC/isobaric operations and their uniqueness.

**Checks.**

- For `(a,b,c,d)`, `∧²` has roots `ab,ac,ad,bc,bd,cd` and determinant `(abcd)³`, even for scalars. Henniart’s printed exponent 2 fails this test.
- `∧²(V⊗χ)=∧²V⊗χ²` and `∧²(U⊕V)=∧²U⊕(U⊗V)⊕∧²V`. Special WD blocks retain nonzero induced N; Weil semisimplification loses it.
- For `m=1`, `r₂=0`; for `m=2`, `r₂=det` `Std₂⊗det` `Std₄`. Equal largest exponents require factorization at `Re(s)=1/2`; unramified `χ²⁴` fails the entireness premise.
- The auxiliary `A₄` construction needs six distinct characters in one orbit; equal `V₄`-conjugates fail. Pair sums for (3,2,1,0) are `[5,4,3,3,2,1]` and collide; those for (8,4,1,0) are `[12,9,8,5,4,1]` and do not. Include the conjugate CM place in the polarization.
- `∧²(Sym³V⊗det(V)⁻¹)` splits as `5+1`; the tetrahedral `GL₅` case as `3+1+1`. For `V=χ⊕χ` both sides have eigenvalue `χ²` with multiplicities `6=5+1`. Dihedral `Sym⁴` has a middle character; non-solvable-polyhedral `Sym⁴` is cuspidal.
- Over `ℝ` retain `Γ_ℂ` and `λ(ℂ/ℝ,ψ)`; over `ℂ` use character factors. Good finite-place tests alone prove neither comparison.

For `π` attached to a non-CM elliptic curve over `ℚ`, `Sym⁴π` is cuspidal on `GL₅`.

([BCGP], Proof of Thm. 9.3.1, §9.3, p. 258; [GT19], §1.1, p. 2; [Kim03], §1, Thm. A, p. 139 `(= Thm. 5.3.1)` (J. Amer. Math. Soc. 16); Introduction, Thm. B, PDF p.2 (printed p.140).)

*Needs:* [§1.13]; AL.4.

<a id="low-rank-symmetric-powers"></a>
### 1.15 Symmetric powers of `GL₂` of rank at most five (`SP_n` for `n ≤ 5`)

For non-CM RAC `GL₂` `π` over totally real F and `1≤n≤5`, `Sym^{n−1}π` exists and is RAESDC: `SP_n`’s induction base.

API: `TauCeti.Functoriality.sp_le_five`.

Proof route: `π` and Gelbart–Jacquet for `n≤3`; Kim–Shahidi/Kim for `n=4,5`. Non-CM RA inputs have open Galois image (Ribet), excluding polyhedral exceptions. The duality `Sym^{n−1}π≅(Sym^{n−1}π)^∨⊗ω_π^{n−1}` and distinct symmetric-power Hodge weights give RAESDC.

([NT Hilbert], Proof of Thm. 6.4, §6, p. 50; §1, p. 3.)

*Needs:* [GL2AutomorphicRepresentationsAndTransfer §R17.4.13](../GL2AutomorphicRepresentationsAndTransfer/README.md); [§1.13]; [§1.14]; [§1.12].

### Examples

For the identity representation of `GL₂(𝔽₇)`, the projective image is `PGL₂(𝔽₇)`, containing `PSL₂(𝔽₇)`. At rank `n=3` the strict bound is 7>max(5,5), so the sandwich holds. For `𝔽₅`, equality with the lower threshold excludes the hypothesis. A dihedral automorphic representation has a noncuspidal symmetric-square lift; this is an isobaric transfer, not an instance of the cuspidal SP predicate.

### Dependencies

Use the exact supplier contracts and the prerequisites cited in this layer’s targets.

## Layer 2: controlled potential automorphy and compatible systems

<a id="potential-diagonalizability"></a>
### 2.1 Potential diagonalizability and its criteria

For integral potentially crystalline `ρ:G_K→GL_n(O)`, diagonalizable means connected to crystalline characters’ direct sum on its fixed-residual/labelled-Hodge crystalline space; potentially diagonalizable (PD) means so over finite K′/K. Retain the residual model/common crystallinity field. Import LGD §6.8’s connects operations, never identifying distinct Hodge types or whole components.

**API.**

- `IsDiagonalizable / IsPotentiallyDiagonalizable`: those component predicates on the actual lift/residual model/Hodge type.
- `potentiallyDiagonalizable_restrict / _extendCoefficients / _connects`: transport component witnesses under permitted restriction, coefficient extension and connects.
- `potentiallyDiagonalizable_sum / _tensor / _dual / _twist`: transport residual models/Hodge lists/component comparisons through these operations.
- `potentiallyDiagonalizable_flag / _fontaineLaffaille`: PD for potentially crystalline full character flags; also for crystalline `ρ` over unramified `K/ℚ_ℓ` with every `HT_τ⊂[a_τ,a_τ+ℓ−2]`, allowing repeated weights. Route: lift residual character flags in the exact Fontaine–Laffaille category and compare crystalline components.

**Checks.**

- A crystalline character is diagonalizable.
- Two trivial characters remain diagonalizable despite repeated weights.
- Over an unramified 5-adic field, {0,3} meets the interval criterion; {0,4} does not follow from it.
- A noncrystalline Tate-curve extension is semistable ordinary but fails potential crystallinity.

([BLGGT], §1.4 pp.26–29, Lemmas 1.4.1–1.4.3; the last criterion is Lemma 1.4.3 p.29.)

*Needs:* LGD §6.8, connects and component operations; PH, potentially crystalline representations; FiniteFlatGroupsAndIntegralPadicHodgeTheory, Fontaine–Laffaille category and exact fully faithful Galois functor.

<a id="polarized-lifting-extensions"></a>
### 2.2 Polarized component-preserving and ordinary lifting

Import rank-two ordinary lifting/finiteness from PMCS §8.6; own the component-preserving and higher-rank ordinary extensions as **separate** statements on actual polarized representations. Residual automorphy means existence of a seed for the same residual pair.

1. BLGGT 2.3.1: imaginary CM F, odd `ℓ`,`ζ_ℓ∉F`; algebraic polarized `(r,µ)`,rank `n≥1`; r̄ irreducible/cyclotomically adequate; a RACP residual-pair seed `π` potentially prime to `ℓ`; r connects to `r_ι(π)` at **every** finite place with equal `ℓ`-adic Hodge lists. Then r is automorphic potentially prime to `ℓ`; if `π` is prime to `ℓ` and r crystalline, so is its automorphy.
2. BLGGT 2.4.1: CM/totally real F, odd `ℓ`,`ζ_ℓ∉F`; same polarization/irreducibility/adequacy; ordinary r at `ℓ` and ordinarily automorphic residual pair. Then r is ordinarily automorphic, prime/potentially prime to `ℓ` when crystalline/potentially crystalline.

API: `polarized_component_lifting / polarized_ordinary_lifting`. Route: minimal/ordinary deformation problems, arithmetic finiteness/support and adequacy (BLGGT 2.3.2/2.4.2), soluble descent. Ordinary finiteness precedes Dwork/prescribed lifts; ACC+ non-self-dual lifting is separate.

**Checks.**

- Equal residual reductions do not imply (1)’s component conditions.
- An ordinary noncrystalline lift gains (2), without a crystalline level guarantee.
- Both assertions exclude `ℓ=2`.
- Adequacy is tested on the specified cyclotomic restriction.

([BLGGT], Thms. 2.3.1–2.3.2 pp.38–39, 2.4.1–2.4.2 pp.39–40.)

*Needs:* PMCS §8.6, rank-two ordinary lifting and finiteness; LGD, potentially crystalline and ordinary component rings; GGD, polarized deformation problems; DeformationAndDerivedPatchingAlgebra Layers 7–9, patched support and finiteness; PAI Layer 2, soluble descent; PAI Layer 5, the imported patching and soluble descent inputs.

<a id="integral-cm-degree-shifting"></a>
### 2.3 Integral P-ordinary control and degree shifting

Use CrystallineLocalGlobalCompatibilityCM §§1.1–1.8 and 2.3–2.4 to identify the **actual arithmetic** P-ordinary complexes for Siegel P⊂quasi-split `U(n,n)/F⁺`, Levi `Res_{F/F⁺}GL_n`, with CN good opens/parahorics P(b,c), integral dominant lattices, unnormalized Satake and rescaled `Ũ_n`. Ordinary inverts `Ũ_n`; Q-ordinary inverts every selected partial-block operator. For torsion exponent m use that supplier’s smooth completed boundary tower and `POrd=ord RΓ(U₀,−)` with `Δ⁺` transfers. The adapters identify its compact-Levi recovery and weight independence with these complexes, and transport §§5.7–5.8’s Hecke-split boundary summand, including the integral derived-invariant and transfer maps.

**API.**

- `CMOrdinaryComplex / CMOrdinaryBoundary`: adapters to the supplier’s finite/completed complexes, compatible with levels/coefficient reduction.
- `ordinaryProjector / compactLeviRecovery`: comparisons with its Siegel localization and derived compact-Levi recovery.
- `SiegelBoundarySummand`: comparison with its Hecke-split summand, retaining the Satake/dual twist.

Degree shifting: transport CrystallineLocalGlobalCompatibilityCM §§6.6–6.13’s maps, adding p-places to carry `GL_n` boundary classes into unitary middle degree with uniform nilpotent Hecke kernel. Below ⌊`dim X_K/2`⌋ use duality/untwisted Satake and `r̄(−n)`; above use `w₀^P`-twisted Satake and r̄. Generic unitary systems are cuspidal/Q-ordinary; AG2.6 gives crystalline blocks. Separate `r̄_m` from `r̄_m^{∨,c}(1−2n)` residually; the supplier’s §7.4 and integral reconstruction/Carayol descent give finite-flat local lifts modulo bounded nilpotence in every degree/exponent, without global characteristic-zero lifting of all torsion classes.

**Checks.**

- `Ũ_n=1` gives the full complex; `Ũ_n=0` gives zero; diag(1,0) on `𝔽₃²` in degree zero gives the first coordinate.
- With a second partial operator zero, POrd can be nonzero while `QOrd=0`.
- The lower block is `r̄(−n)`; omitting its inverse twist shifts every weight.
- Degree-zero control does not prove all-degree control.
- An injection from integral to rational middle-degree cohomology and a surjection onto boundary middle degree do not force other degrees to vanish: a complex with free cohomology in degrees d and d+1 and zero boundary has both maps.

([Caraiani–Newton], §§1.2–1.3 pp.13–19; Prop. 2.2.8, p.28; Prop. 2.2.17, p.32; Prop. 2.3.11, pp.38–39; Cor. 4.1.9 pp.56–57; Props. 4.2.2 and 4.2.8, pp.58–65; Prop. 4.2.13 and its separating-character proof, pp.67–71.)

*Needs:* CrystallineLocalGlobalCompatibilityCM §§1.1–1.8, 2.3–2.4, 5.7–5.8, 6.6–6.13 and 7.4; IntegralHeckeAndGaloisDeterminants §1.6, compatible local compression with its full determinant-law and corner hypotheses; AG2 §AG2.6. IgusaVarietiesAndTorsionConcentration IG.7.15 supplies middle-degree torsion-freeness and boundary surjectivity under its field, good-level and ambient decomposed-generic hypotheses; no all-degree concentration is used.

<a id="integral-cm-local-global"></a>
### 2.4 Crystalline and semistable-ordinary integral Hecke representations

For imaginary CM F containing an imaginary quadratic subfield split at p, fix a finite c-stable set `T⊃{v|p}` of finite places. For `v∉T` of residue characteristic `ℓ` require either `T∩{w|ℓ}=∅` and `ℓ` unramified in F, or `ℓ` split in an imaginary quadratic subfield of F. Take good K hyperspecial outside T, dominant `λ`, distinct p-places `v̄,v̄′` of `F⁺` with `Σ_{ū≠v̄,v̄′}[F⁺_{ū}:ℚ_p]≥[F⁺:ℚ]/2`. Choose `Q_{v̄}⊂P_{v̄}`, `K_{v̄}=Q_{v̄}∩GL_n(F⊗F⁺_{v̄})`, and non-Eisenstein decomposed-generic `𝔪` in `H*(X_K,V_λ)`’s support with all `X_{Q_{v̄}}` rescaled operators invertible. The **derived integral** Hecke algebra modulo J, `J^N=0`,`N=N(n,[F⁺:ℚ])`, carries continuous `r_𝔪` with good polynomials. Local maps factor through: `Q=P`, crystalline at both conjugate places; `Q=B_{2n}`, semistable ordinary at both; `Q=(n,1,…,1)`, ordinary at selected/crystalline at conjugate place. `Weights={λ_{τ,n},…,λ_{τ,1}+n−1}`. If `p∤n`, fixing an O-valued crystalline determinant `ψ` of these summed weights gives fixed-determinant factorization.

API: `CMHeckeRepresentation.local_type / CMHeckeRepresentation.fixedDet`, adapters to `CrystallineCM.integral_local_global_deformation_factorization` and `CrystallineCM.fixed_determinant_factorization`. Transport CrystallineLocalGlobalCompatibilityCM §§7.4–7.6’s representations and coefficient maps to the conventions here. The local lifting ring’s scheme-theoretic characterization applies over finite, possibly nonreduced coefficient algebras, rather than only field-valued points.

**Checks.**

- There is no lower bound on p, nor a Fontaine–Laffaille interval in this theorem.
- A ramified p-adic local field is permitted.
- Two distinguished p-adic places alone fail the degree inequality, since the left side is zero.
- Killing the nilpotent ideal is part of the conclusion; asserting `J=0` is stronger.
- Fixed determinant needs `p∤n` even though the unfixed assertion does not.

([Caraiani–Newton], Thm. 4.2.15 and proof pp.71–72; Cor. 4.2.16 p.72; lifting-ring characterizations §3.3.)

*Needs:* [§2.3](#integral-cm-degree-shifting); CrystallineLocalGlobalCompatibilityCM §§7.4–7.6; LGD, crystalline and semistable-ordinary lifting rings over finite coefficient algebras; IntegralHeckeAndGaloisDeterminants §§2.1–2.2, 4.2 and 5.2–5.3, derived Hecke comparison, compatible inverse limits and uniform nilpotence.

<a id="component-connects-lifting"></a>
### 2.5 Weight-zero lifting on a specified crystalline component

For CM/totally real F, `p>n`, continuous finitely ramified `ρ:G_F→GL_n(ℚ̄_p)`, assume crystalline labelled `HT={0,…,n−1}` at p; absolutely irreducible decomposed-generic `ρ̄`; adequate `ρ̄(G_{F(ζ_p)})` after sufficient coefficient extension; scalar `ρ̄(σ)` for some `σ∉G_{F(ζ_p)}`. A weight-zero RAC seed `π` with `r̄_ι(π)≅ρ̄` must be unramified at p and connect to `ρ` on each weight-zero crystalline ring. Then `ρ≅r_ι(Π)` for weight-zero RAC `Π`, unramified at p and wherever both `ρ`,`π` are unramified. F may ramify at p.

API: `TauCeti.PotentialAutomorphy.weightZero_of_connects`. Proof route: BCGNT §3.2 component-restricted arithmetic patching and CN §4.3 crystalline weight-zero comparison; disjoint soluble CM extension supplies enough p-adic places and preserves all three residual conditions, then soluble descent. Import LGD connects operations and abstract patching, while owning these arithmetic comparisons.

**Checks.**

- For `n=2` the labelled weights are {0,1}; a pair {0,2} is outside the theorem.
- Two lifts of the same residual representation lying on different crystalline components do not meet the seed hypothesis.
- A ramified p-adic base field is permitted; replacing `p>n` by `p≥n` is not.
- At a place where only `ρ` is unramified the stated level guarantee does not follow.

([BCGNT], Thm. 3.2.1 and Remark 3.2.2, pp.35–36; Thm. 3.2.5 and proof pp.37–41; [Caraiani–Newton], Thm. 4.3.1, p.73.)

*Needs:* LGD §6.8; PAI Layers 2 and 5; DeformationAndDerivedPatchingAlgebra Layers 7–9, patched complexes and codimension concentration; ALS, localized cohomology complexes; AG2, crystalline weight-zero LGC.

<a id="potentially-semistable-cm-lifting"></a>
### 2.6 Rank-two potentially semistable lifting over a CM field

For imaginary CM F, odd p and continuous finitely ramified `ρ:G_F→GL₂(ℚ̄_p)`, assume `det=ε_p⁻¹`, potentially semistable `HT={0,1}` at p, decomposed-generic `ρ̄` and cyclotomically irreducible `ρ̄`. If `p=5` and its cyclotomic projective image is `PSL₂(𝔽₅)`, the projective `G_F` fixed field must exclude `ζ₅`. Assume additionally `[F(ζ_p):F]≠3` or `im(ρ̄)^proj≇A₄`. Take a weight-zero cuspidal `PGL₂` seed `π` with matching reduction: at potentially crystalline `ρ`-places, `r_ι(π)` is potentially ordinary iff `ρ` is, and `N(rec π_v)=0`; elsewhere `π` is `ι`-ordinary and `r_ι(π)` not potentially crystalline. Then `ρ≅r_ι(Π)` for weight-zero cuspidal `PGL₂` `Π`.

API: `TauCeti.PotentialAutomorphy.potentiallySemistableCM`, the normalization adapter to `CrystallineCM.potentially_barsotti_tate_lifting_qualified` in CrystallineLocalGlobalCompatibilityCM §9.12. Transport its fixed determinant, labelled weights, seed components and qualified auxiliary-prime argument. No polarization, enormous image or scalar-outside-cyclotomic hypothesis is added.

**Checks.**

- A potentially ordinary crystalline lift cannot use a nonordinary crystalline seed.
- A noncrystalline semistable lift requires a noncrystalline ordinary seed, excluding an unramified seed. Residual `SL₂(𝔽₃)` at `p=3` is allowed under the stated hypotheses; adding adequacy excludes valid cases.
- At `p=5` test the exceptional projective kernel on `G_F`, not only its cyclotomic subgroup.
- Over `𝔽₇`, the group generated by `[[0,1],[6,0]]`, `[[2,3],[3,5]]` and `[[4,2],[0,1]]` has order 24, projective image `A₄` and determinant order three. Off the determinant kernel it satisfies `(tr g)²=(1+det g)²`, but its quaternion kernel is absolutely irreducible: the first two generators square to `−1` and anticommute. This case is excluded by the additional hypothesis; at p=3,5 the cyclotomic degree cannot be three.

([Caraiani–Newton], Thm. 5.2 and Remarks 5.2.1–5.2.3, pp.73–74; §§5.3–5.6 pp.74–86.)

*Needs:* CrystallineLocalGlobalCompatibilityCM §9.12, `CrystallineCM.potentially_barsotti_tate_lifting_qualified`; [§2.4](#integral-cm-local-global); AG2, normalization of the same realization.

<a id="cg-conjecture-b"></a>
### 2.7 The complete Calegari–Geraghty Hecke-cohomology hypothesis

Define `CGConjectureB` for the `GL_n` locally symmetric spaces, coefficient ring O, levels `Y₁(Q)`, auxiliary characters `ψ` and Taylor–Wiles deformation problems of Calegari–Geraghty §9.1. For each Hecke maximal ideal it specifies a continuous semisimple residual Galois representation with unramified characteristic polynomial

```text
X^n + Σ_{i=1}^n (−1)^i N(v)^{i(i−1)/2} T_{v,i} X^{n−i}.
```

At each non-Eisenstein ideal require a completed-Hecke-algebra lift with these polynomials. With §8.5’s residual/Taylor–Wiles data retain **all five further requirements**: (1) Fontaine–Laffaille weights `{0,…,n−1}` at p; (2) prescribed type at `x∈Q`; (3) inertia polynomial `∏_i(X−ψ_{v,i}∘Art_v⁻¹)` at `v∈R`; (4) localized cohomology modulo every uniformizer power supported in [q₀,q₀+l₀], localized Borel–Serre boundary zero in every degree; (5) `∏_{x∈Q}lim_k` `Q_x(V_x)^{k!}` identifies base-level cohomology with the `Y₀(Q)` eigensummand. Here `(X−α_x)Q_x(X)` is the residual Frobenius polynomial; the auxiliary ideal imposes `V_x−α_x`. This is a conjectural input proposition.

**API.**

- `cgResidualRealization / cgCompletedHeckeRealization`: residual/completed-Hecke realizations on the same complexes.
- `cgLocalConditions / cgAmplitude / cgBoundaryVanishing`: the local/vanishing clauses and uniform bounds above.
- `cgTaylorWilesComparison / cgCharacterDeformation`: level/character-deformed maps with global deformation map surjective onto that Hecke algebra, retaining the actual local problems/operators.

**Checks.**

- For `n=2` the polynomial is `X²−T_{v,1}X+N(v)T_{v,2}`; the norm factor is essential.
- Residual Galois existence alone misses amplitude/boundary requirements.
- The non-Eisenstein lift clause does not cover an Eisenstein ideal.
- Empty Taylor–Wiles Q gives identity projector, retaining all vanishing requirements.

([Calegari–Geraghty](#ref-cg-2018), Conjecture B, §9.1, pp.86–87; Remark 9.5 p.87.)

*Needs:* ALS, Borel–Serre boundary and integral Hecke complexes; GGD, local deformation problems and their global representability; LGD, Fontaine–Laffaille loci. This target defines the conjectural hypothesis only.

<a id="general-number-field-lifting"></a>
### 2.8 Conditional weight-zero lifting over an arbitrary number field

Assume [§2.7]. In **native Calegari–Geraghty convention**, `HT(ε)=+1`: any number field F; `p>n` unramified in F; finite p-adic O; continuous finitely ramified `r:G_F→GL_n(O)`. Require crystalline `HT={0,…,n−1}` at p; cyclotomic absolute irreducibility of r̄; `F(ζ_p)`⊄`F(ad⁰r̄)`; CHT 2.5.1 bigness; `tr r(c)∈{−1,0,1}` at real places; unipotent inertia at ramified x, with `N(x)≡1` mod p if r̄ is unramified there; `det r=ε^{n(n−1)/2}`. Finally require either (a) trivial-infinitesimal-character cuspidal `π₀` unramified at p, matching r̄ and the same unipotent/norm condition, or (b) r̄ Serre modular of minimal N(r̄), with no extra ramification in r. Obtain RAC `π` of trivial infinitesimal character with Thm. 5.16’s full L-equality.

State `TauCeti.PotentialAutomorphy.cg_generalField` with the conjecture as premise. In this roadmap’s convention apply to the dual: `det=ε^{−n(n−1)/2}`, `HT={0,…,n−1}`, carrying the dual local-factor dictionary. Branch (b)’s mod-p class need not lift.

Proof route: CG §§7–8 integral minimal/character-deformed Taylor–Wiles complexes; all five Conjecture B clauses supply local maps, amplitude, boundary removal and level comparison; Thm. 9.19 proves support/faithfulness and hence 5.16. These arithmetic verifications are owned here.

**Checks.**

- F may have both real and complex places.
- At `n=2` the native determinant is `ε` and the dual determinant `ε⁻¹`.
- A prime where r is ramified and r̄ is unramified must have norm 1 modulo p; the opposite congruence is wrong.
- Dropping boundary vanishing from Conjecture B leaves the patching application unproved.
- Without the conjecture the conclusion remains conditional.

([Calegari–Geraghty](#ref-cg-2018), Thm. 5.16, pp.64–65; Thm. 9.19 and proof pp.94–96; §10 pp.96–98.)

*Needs:* DeformationAndDerivedPatchingAlgebra Layers 7–9, perfect complexes and codimension concentration; LGD, integral unipotent and Fontaine–Laffaille loci; GGD; ALS, integral Hecke complexes.

<a id="dwork-eigenrealizations"></a>
### 2.9 Dwork eigenrealizations and their common Frobenius data

Fix `N>1`,`M=ℚ(ζ_N)`↪coefficients, and smooth `T₀=ℙ¹∖(µ_N∪{∞})`, `ΣX_i^N=Nt∏X_i`. For `H₀=ker(µ_N^N→µ_N)/µ_N`, tuples `Σa_i=0` mod N define characters `χ`; constant shifts give the same `χ`. For `λ∤N`, `DworkEigenrealization(N,χ,λ,t)` is the coefficient-extended middle-cohomology `χ`-summand, projector `|H₀|⁻¹Σ_hχ(h)⁻¹h`, with integral lattice where `|H₀|` is invertible. Qian §3’s chosen `χ` has rank n/consecutive labelled weights, retaining its explicit twist.

**API.**

- `fibre / symmetryAction / eigenprojector`: actual middle cohomology/action/projector; idempotence and orthogonality for distinct `χ`.
- `eigenlattice / rank / hodgeMultiset`: integral projector and Qian-character rank/weights.
- `baseChange / goodFrobeniusPolynomial`: field-base-change comparison and common polynomials constructed from symmetry-twisted Frobenius traces under matched coefficient embeddings; no cohomology semisimplicity is asserted.

**Checks.**

- Diagonal `ζ` multiplies `χ` by `ζ^{Σa_i}=1`; without `Σa_i=0` it need not descend.
- Adding b to every `a_i` multiplies `χ` by `(∏ξ_i)^b=1`, independently checking the product-one quotient.
- The trivial projector averages onto invariants; distinct character projectors compose to zero. The identity on all cohomology fails.
- At residue characteristic dividing N this integral projector is unavailable. Require a smooth `T₀` point and the chosen eigensummand.

([Qian], §3, Lemmas 3.1–3.10, pp.9–21; [Qian, ordinarity], §1, pp.1–2; [Qian's thesis], Lemma 3.0.11, pp.53–55.)

*Needs:* EtaleCohomologyFoundations §§F.2.1–F.2.2, F.4 and F.10, proper smooth base change and trace formula; PH, proper smooth de Rham comparison; representation-theoretic finite-group projectors over coefficients in which `|H₀|` is invertible.

<a id="dwork-semistable-log-comparison"></a>
### 2.10 Equivariant semistable models and the log-monodromy comparison

For finite `K/ℚ_p` containing `ζ_N`,`p∤2N`, and `s∈T₀(K)`,`v(s)<0`, construct an `H₀`-equivariant proper semistable model after a finite totally ramified K′/K. Return extension/ramification index; charts are products of coordinates equal to a uniformizer. Semistability over K is not asserted.

Restrict CR.6.3’s all-degree one-parameter log comparison to Qian 1.5’s W(k)[T] lift and `χ`-projector, proving `H₀`-equivariance. Identify CR.6.1’s N with analytic log boundary/Gauss–Manin residue/topological monodromy; Tsuji compares `D_st(V_λ,s)`,`λ|p`, at every maximal-unramified embedding. Coefficient conjugation conjugates `χ`.

**API.**

- `equivariantSemistableModel`: extension/index/model/extended `H₀`-action.
- `dwork_hyodoKato_eigenprojector`: character comparison commuting with coefficient extension.
- `dwork_logGAGA_boundary / dwork_topologicalMonodromy_comparison`: boundary/residue/logarithm comparison with ramification scaling, first in all degrees then middle `χ`-degree; import the general log triangle/Hyodo–Kato map.

**Checks.**

- `T↦T^e` rescales log-monodromy by e; nonzero e in characteristic zero preserves nilpotence index, unlike reduction mod p.
- `N₂=[[0,1],[0,0]]` has `N₂²=0≠N₂`; `2N₂` has the same index over `ℚ`. `N=0` loses the rank-two argument.
- Degree zero has trivial monodromy and is included in the comparison; the ordinary criterion separately requires its Hodge list and positive rank.
- Changing `λ` requires good-place transport and strict compatibility for ramified N; it is not this p-adic comparison.

([Qian, ordinarity], Thms. 1.4, 1.6 and 1.8, pp.3–4; Prop. 1.5, p.3; §§2–3; proof of Thm. 1.1 and Lemma 4.3, pp.20–23.)

*Needs:* [§2.9]; CR §§CR.6.1–CR.6.3, monodromy, Hyodo–Kato and proper one-parameter logarithmic comparison; PH, semistable comparison; logarithmic differentials and algebraic/analytic de Rham comparison on the stated proper log-smooth lift.

<a id="coefficient-prime-dwork-ordinarity"></a>
### 2.11 Coefficient-prime ordinary Dwork fibres

For the same K,N,`χ` and `n>0`, assume Qian’s consecutive labelled lists and a crystalline twist making them `{0,…,n−1}`; infinity monodromy on **every** coefficient-conjugate `χ`-summand has minimal polynomial `(X−1)^n`. For finite `K₀/K` and negative-valuation `s∈T₀(K₀)`, the actual `λ|p` fibre is de Rham, potentially semistable and regular ordinary: a full character flag with one strict weight order at all embeddings and Qian 1.2’s finite factors. Its i-th inertia exponent is `−(λ_{τ,n−i+1}+i−1)`, HT number `λ_{τ,n−i+1}+i−1`.

Route: PH §3.6’s consecutive-weight/maximal-N criterion at **every** `D_st` embedding, crystalline-character dual/twist dictionary and finite-extension descent; apply `H₀`-equivariant log comparison and descend the unique extreme-weight flag. Translate PH’s convention. Maximal N alone fails; construct the flag before global semisimplification.

API: `dwork_coefficientPrime_ordinary`, returning the imported `RegularOrdinary` flag, characters and labelled weights on the actual fibre.

**Checks.**

- A weight-zero line has `N=0` and index one; specified crystalline twists treat other weights. Rank zero is excluded.
- Weights {0,1} with one size-two N-block meet the criterion; two trivial characters do not, although separately ordinary. This is sufficient, not necessary.
- Over `ℚ₅`, `φ=diag(5,25)`, `N(e₂)=e₁`,`N(e₁)=0`, `Fil¹=Fil²=Fil³=⟨e₁+e₂⟩` gives `Nφ=5φN` and `t_N=t_H=3`. The only proper stable line has `t_H=0<t_N=1`. This weakly admissible `{0,3}` object has maximal N and no Galois-stable line: consecutive weights are essential.
- At `λ|p` and `v_p(s)<0` use `D_st` at p; auxiliary `λ′≠p` WD cannot replace it.
- Test every coefficient-conjugate `χ`: one complex embedding does not supply every labelled N-block.

([Qian, ordinarity], Thm. 1.1, p.2; Lemmas 4.1–4.2, pp.19–20; proof pp.20–23. The local criterion is [BLGHT](#ref-blght-2011) Lemma 2.2(2), published pp.44–45, including its weight-zero premise. Qian v1 Lemma 4.2 prints a broader assertion; only the BLGHT scope and its explicit character twists are used here. Qian, potential automorphy, Def. 1.2, pp.1–2.)

*Needs:* [§2.10]; PH §3.6, labelled ordinary flags, crystalline characters, consecutive-list criterion and finite-extension descent; its exact de Rham/semistable realizations.

<a id="ordinary-subquotient-semisimplification"></a>
### 2.12 Ordinary subquotients, global semisimplification and residual lattices

Regular ordinary `G_K`-representations with fixed strict ordering retain ordinary flags on stable subobjects/quotients, with the ordered weight subsets. De Rham/potentially semistable properties pass to these subquotients; exact sequences add Hodge multisets. For globally V locally regular ordinary, its global composition factors’ induced flags merge in the original order, making `V^ss` regular ordinary with exactly V’s labelled multiset, without assuming V semisimple.

Proof route: intersect/quotient the flag. For a stable lattice use intersections and saturated quotients; graded reductions have the lattice’s semisimple reduction, independently of lattice after residue extension. No equality of nonsplit residual extensions is asserted.

**API.**

- `ordinary_subrepresentation / ordinary_quotient`: intersection/image flags and ordered character subsets.
- `ordinary_globalSemisimplification / hodgeMultiset_exact`: merged flags and exact multisets.
- `saturated_graded_lattice / residual_semisimplification_preserved`: graded integral lattices with lattice-independent semisimple residual comparison.

**Checks.**

- A {0,1} flag gives singleton weights on a line/quotient and {0,1} on their sum; repeated zero loses regularity.
- For `0→ℚ_p(1)→V→ℚ_p→0` of a Tate curve, N has index two, but on the local semisimplification `N=0`. Extension data are not preserved.
- Zero has empty flag/Hodge list; the full quotient keeps the original list. No rank-one character belongs to zero.
- Stable lattices may have different nonsplit reductions; only their residual semisimplifications agree.

([Qian], Def. 1.2 and the semisimple transport in §4, pp.1–2,24–26; [Qian, ordinarity], Lemma 4.1, pp.19–20. The flag/subquotient and lattice statements are the exact linear-algebra deductions needed to pass from these geometric fibres to that transport.)

*Needs:* [§2.11]; PH, exactness of de Rham and potentially semistable representations; finite-length representation theory and Brauer–Nesbitt.

<a id="moret-bailly-galois-control"></a>
### 2.13 Moret–Bailly with prescribed local Galois extensions (Proposition 3.1.1)

For finite Galois extensions `K/K₀` and `K^avoid/K`, finite S⊂places(`K₀`), equivariant finite Galois completions `L′_v/K_v` `(L′_{σv}=σL′_v)`, smooth geometrically connected T/K and nonempty `Gal(L′_v/K_v)`-invariant opens `Ω_v⊂T(L′_v)`, obtain finite Galois L/K and `P∈T(L)`, with `L/K₀` Galois, L disjoint from `K^avoid/K`, and `L_w≅L′_v`,`P∈Ω_v` for `w|v∈S_K`.

API: `TauCeti.PotentialAutomorphy.exists_point_galois_control`.

Proof route: enlarge S to force disjointness from every simple avoidance subextension; prescribed-completion soluble extension (CHT 4.1.2), Moret–Bailly 1.3 and normal closure over `K₀`.

**Checks.**

- Trivial avoidance imposes no disjointness restriction.
- A prescribed nontrivial quadratic completion at 2 forces the global extension to be nontrivial.
- `K=K₀=ℚ`, `K^avoid=ℚ̄`, `T=𝔸¹` and a nontrivial prescribed quadratic completion would force both `L=ℚ` and `L₂≠ℚ₂`; this infinite avoidance field is outside the hypotheses.

([BLGGT], §3.1, Prop. 3.1.1, p. 41.)

*Needs:* PMCS §§2.8–2.10 and 2.23 (Moret-Bailly's theorem).

<a id="polarized-dwork-potential-automorphy"></a>
### 2.14 Simultaneous residual symplectic potential automorphy

For finite Galois totally real `F/F₀`, finite I, positive even `n_i`, odd `ℓ_i` and continuous open-kernel `r̄_i:G_F→GSp_{n_i}(𝔽̄_{ℓ_i})` of multiplier `ε̄^{1−n_i}`, and finite Galois `F^av/F`, obtain one totally real F′/F,Galois over `F₀`, disjoint from `F^av`, and weight-zero `ι_i`-ordinary RACP pairs realizing `(r̄_i|G_{F′},ε̄^{1−n_i})`. No residual irreducibility is needed.

API: `residual_symplectic_potential_automorphy`. Route: paired Dwork `V_{n_i}((N−1−n_i)/2)/ℚ(ζ_N)⁺`, connected paired-trivialization covers and local loci; cyclic-CM auxiliary `ℓ′` seed with separated weights/ordinary/adequate/Steinberg data; Moret–Bailly and earlier ordinary BLGGT 2.4.1. Do not use later PD/prescribed-lift results.

**API.**

- `pairedDworkSheaf / pairedTrivializationScheme`: sheaf/form/multiplier and their isomorphism scheme.
- `pairedTrivialization_forget / _baseChange`: parameter map and field/coefficient functoriality.
- `pairedDwork_connected / _localPoints`: connectedness and nonempty real/finite loci.
- `pairedDwork_specialize`: residual identifications/ordinary seeds over one extension. The unitary `χ`-family has a separate projector and need not be symplectic.

**Checks.**

- At `n_i=2` the multiplier is `ε̄⁻¹` and the ordinary Hodge list is {0,1}.
- Odd `n_i` is excluded from an alternating nondegenerate pairing.
- The empty family imposes only the field-extension constraints.
- A scalar-only residual image is allowed; adequacy is required of the constructed auxiliary seed, rather than imposed on every input `r̄_i`.

([BLGGT], Thm. 3.1.2 and proof pp.41–44, using BLGHT Lemmas 5.1 and 5.3 and Thm. 6.3 as identified there; the equivariant coefficient-prime comparison is [§2.11].)

*Needs:* [§2.13]; [§2.9]; PMCS, rank-one systems and cyclic character induction; ET §6.26, weak automorphic induction, and [its all-place comparison](#automorphic-induction-register); the ordinary part of [§2.2].

<a id="prescribed-polarized-ordinary-lifts"></a>
### 2.15 Ordinary polarized lifts with prescribed local components

For imaginary CM F, odd `ℓ`,`ζ_ℓ∉F`, a finite set S of finite places of `F⁺`, all split in F, containing `ℓ`/ramification and selected `ṽ|v`, fix odd crystalline `µ:G_{F⁺}→ℚ̄_ℓ×` unramified outside S with `HT={w}`; distinct n-element `H_τ`,`H_{τc}={w−h}`. Let `r̄:G_{F⁺}→𝒢_n(𝔽̄_ℓ)` have multiplier `µ̄`, component preimage `G_F`, ramification in S and cyclotomically irreducible `GL_n` restriction. Require `ℓ≥2(d+1)`, `d`=maximal constituent dimension on the Sylow-pro-`ℓ`-generated subgroup of `G_{F⁺}`. Given ordinary crystalline lifts of `H_τ` at `ℓ` and lifts `ρ_v` away from `ℓ`, obtain global r with multiplier `µ`, chosen ordinary crystalline weights, connecting to each `ρ_v` and unramified outside S.

API: `prescribed_polarized_ordinary_lift`. Proof route: symplectic induction, residual Dwork potential automorphy, BLGGT 2.4.2 ordinary finiteness and the Khare–Wintenberger dimension argument; this precedes diagonalizable lifting.

**Checks.**

- A prescribed ordinary local ring with no point does not yield a global lift.
- The relation `H_{τc}=w−H_τ` is needed for the multiplier; {0,1} paired with {0,1} uses `w=1`.
- Specifying a non-`ℓ` component permits different points on that component, not an arbitrary exact equality to `ρ_v`.
- Infinitely many split conjugate pairs of primes carrying prescribed ramified order-five characters for a rank-one lift over `ℚ(i)` are excluded by finiteness of S; a finite base change cannot eliminate all those ramified places.

([BLGGT], Prop. 3.2.1 and proof pp.45–48; §1.5 gives `𝒢_n` and the polarized deformation problem.)

*Needs:* [§2.14]; GGD, symplectic induction and dimension inequality; LGD, ordinary component rings; DeformationAndDerivedPatchingAlgebra Layers 7–9; the ordinary finiteness assertion in BLGGT 2.4.2 of [§2.2].

<a id="polarized-pd-lifting"></a>
### 2.16 Potentially diagonalizable polarized lifting

Thm. 4.2.1: F imaginary CM, `ℓ` odd, `(r,µ)` RA irreducible polarized, r potentially diagonalizable at `ℓ`, `r̄|G_{F(ζ_ℓ)}` irreducible, `ζ_ℓ∉F` and `ℓ≥2(d+1)`, where d is the largest irreducible constituent dimension on the closed subgroup generated by the Sylow pro-`ℓ` subgroups. If the residual pair is ordinarily or potentially diagonalizably automorphic, then r is potentially diagonalizably automorphic, potentially prime to `ℓ`.

API: `polarized_pd_lifting`. Proof route: BLGGT 4.1.1 tensor comparison using two prescribed ordinary lifts with separated tensor Hodge lists, component-preserving lifting and soluble descent; its ordinary inputs precede this theorem.

**Checks.**

- `ℓ=2` is excluded.
- The integer d is the maximal constituent dimension on the specified Sylow-generated subgroup; a smaller chosen constituent gives no valid bound.
- A crystalline character is potentially diagonalizable, but a noncrystalline Tate-curve extension fails this premise.
- Equal residual representations without the stated automorphic seed do not imply this theorem.

([BLGGT], Prop. 4.1.1 pp.48–53 and Thm. 4.2.1 pp.53–55.)

*Needs:* [§2.1]; [§2.15]; [§2.2]; PAI Layer 2, soluble descent.

<a id="potential-ordinary-automorphy"></a>
### 2.17 Potential ordinary automorphy of polarized mod l representations (Proposition 3.3.1)

For finite Galois imaginary CM `F/F₀`, finite I, fix odd `l_i`,`ζ_{l_i}∉F`; totally odd de Rham `µ_i` `(HT={w_i})`; irreducible polarized `r̄_i:G_F→GL_{n_i}(F̄_{l_i})` with cyclotomic irreducibility,`l_i≥2(d_i+1)`; distinct `n_i`-element `H_{i,τ}`,`H_{i,τc}={w_i−h}`; a finite c-stable set S of finite places of F containing all `l_i`-places and ramification; `v∤l_i` lifts `ρ_{i,v}`,`ρ^c_{i,cv}≅µ_iρ∨_{i,v}`; and a finite Galois avoidance extension `F^avoid/F`. Obtain finite CM F′/F,Galois over `F₀`, disjoint from `F^avoid`, and RACP `π_i` realizing `r̄_i`, with multiplier `r_{l_i,ι_i}(χ_i)ε^{1−n_i}=µ_i`, ordinary/unramified above `l_i` and unramified outside S, labelled weights `H_{i,τ|F}`, and connecting to `ρ_{i,v}|G_{F′_u}` at `u|v∈S`,`u∤l_i`.

Here `n_i≥1` and `d_i` is the maximal constituent dimension on the Sylow-pro-`l_i`-generated subgroup; fix each `ι_i`.

API: `TauCeti.PotentialAutomorphy.potential_ordinary_automorphy`.

Proof route: symplectic induction and [§2.14], prescribed ordinary lifts [§2.15], then [§2.2].

**Checks.**

- The empty family retains only the finite-extension and avoidance conditions.
- Conjugate local lifts must satisfy the multiplier identity; independent arbitrary prescriptions at a conjugate pair fail it.
- Infinitely many split pairs with ramified order-five rank-one prescriptions over `ℚ(i)` fail the finite-S hypothesis, even when their conjugates are inverse characters.

([BLGGT], §3.3, Prop. 3.3.1, pp. 47–48.)

*Needs:* AG2.0 (polarized Galois representation).

<a id="auxiliary-elliptic-primes"></a>
### 2.18 Ordinary auxiliary primes with full residual elliptic image

For non-CM `E/ℚ`, number field L and `A≥1`, sufficiently large `ℓ` have `r̄_{E,ℓ}(G_L)=GL₂(𝔽_ℓ)`, including determinant `(L∩ℚ(ζ_ℓ)=ℚ)`. Good ordinary primes have density one. Thus infinitely many `ℓ≡1` mod A satisfy both and any finite exclusions.

The full-image assertion is a corollary of EllipticCurveModularityImaginaryQuadratic §5.1 `nonCM_elliptic_large_residual_primes`, applied to the base change E/L, which remains geometrically non-CM. Outside its finite exceptional set the image contains `SL₂(𝔽_ℓ)`. For ℓ unramified in L, total ramification of `ℚ(ζ_ℓ)/ℚ` at ℓ gives `L∩ℚ(ζ_ℓ)=ℚ`, so the cyclotomic determinant is surjective and the image is all `GL₂(𝔽_ℓ)`. The cohomological dual has the same full image, with determinant `ε̄_ℓ⁻¹`.

For ordinary-prime density, Serre 1981 §8.2 Thm. 20/Cor. 2, pp.188–190, gives density-zero `a_ℓ=0`; for good `ℓ>3` Hasse makes supersingularity equivalent to this condition. Delete that set and finitely many primes from the positive-density progression.

**Checks.**

- A CM curve is excluded: inert primes can be supersingular with positive density and its residual image lies in a Cartan normalizer.
- For `ℓ=7` and `u=2`, `det(uI₂)=4≠1`; full image over L supplies a scalar outside `G_{L(ζ_ℓ)}`.
- A congruence progression of positive density survives deletion of a density-zero set, whereas two arbitrary infinite prime sets need not intersect.
- At `ℓ=7` over `L=ℚ(ζ₇)`, the cyclotomic determinant is trivial, so `SL₂` containment alone cannot give full `GL₂` image. The finite ramified-prime exclusion depends on L.

([Serre 1972](#ref-serre-1972), §4.2 Thm. 2 and proof, pp.294–299; §4.4 Thm. 3 and Cor. 1, pp.299–300; [Serre 1981](#ref-serre-1981), §8.2, pp.188–190; [Qian], §4, proof of Prop. 4.1, pp.20–21.)

*Needs:* EllipticCurveModularityImaginaryQuadratic §5.1 `nonCM_elliptic_large_residual_primes`; elliptic Tate representations and determinant `ε`; GlobalNumberFields Layer 10, cyclotomic ramification; Chebotarev, density and finite exclusions, Layers 13–14, coprime rational progressions. The determinant comparison and ordinary-density/progression combination are targets here.

<a id="qian-auxiliary-prime"></a>
### 2.19 Choice of the auxiliary elliptic curve, N, `F^avoid` and an ordinary auxiliary prime l′ (Qian §4, Proposition 4.1)

Qian 1.1 data: F,`F^av`,`n≥2`,l,continuous semisimple `r̄:G_F→GL_n(F_{l^s})`; non-CM `E₀/ℚ`; `n=l^a m`,`l∤m`; k′ generated by m-th roots of `F_{l^s}`. Choose odd `N>100n+100` prime to ln,ramification of `F^av`/residual fixed field and `E₀`’s bad primes, with `F_{l²}k′⊂F_l(ζ_N)`. For `n=2` require even residue degree d and `F_{l²}k′` inside the real cyclotomic residue field. Whenever `F_l(ζ_N)=F_{l^d}`,d even, require `N∤l^{d/2}+1`. For `F^avoid` the `ℚ`-normal closure of `F^av` `F̄^{ker r̄}(ζ_l)`, `ℚ(ζ_N)` is disjoint from `F^avoid`. Some `l′≡1` mod Nn,`l′>2ln+5` is unramified in `F^avoid`,good ordinary for `E₀`,with `E₀[l′](G_{F̃})=GL₂(F_{l′})` (`F̃`=normal closure F), and scalar image for some `σ∈G_F\G_{F(ζ_l′)}`.

Here k′ is a finite field, distinct from number fields F′; the elliptic realization uses cohomological `H¹`.

API: `TauCeti.PotentialAutomorphy.qian_auxiliaryPrime`.

Proof route: Qian 2.3 for N; disjoint ramification makes the cyclotomic intersection trivial. Apply [§2.18](#auxiliary-elliptic-primes) in `ℓ′≡1` mod Nn, then choose `u²≠1` and `σ` mapping to `uI₂` over F̃, with nontrivial cyclotomic determinant.

([Qian], Prop. 4.1 (first list), §4, p. 21, and first paragraph of its proof, p. 22; §4 opening (choice of E, N, `F^avoid`), p. 21.)

*Needs:* Chebotarev, Layer 10.

<a id="steinberg-ordinarity-lemma"></a>
### 2.20 Steinberg component and ordinarity of the automorphic Dwork realisation (Qian Lemma 4.3)

At v|l of a Dwork point,`v(t)<0`, assume `V_{λ,t}^ss≅r_{l,ι}(π)` for RAC `π`, and semisimple auxiliary `V_{λ′,t}` (in the construction its residual twist is an absolutely irreducible elliptic symmetric power), with embeddings matched. Auxiliary monodromy is one size-n block; Varma forces `π_v` an unramified Steinberg twist. `HT={M(a_τ),…,M(a_τ)+n−1}` gives constant automorphic weight `+λ_τ=M(a_τ)`, central slope `+nλ_τ`,partial slopes `+jλ_τ`, hence Geraghty `ι`-ordinarity. Galois ordinarity/potential semistability of `V_{λ,t}^ss` require the separate geometric/subquotient argument; original `V_{λ,t}` semisimplicity is not claimed.

Require `λ′` of odd residue characteristic different from l and prime to N.

API: `TauCeti.PotentialAutomorphy.steinbergOrdinary`.

Proof route: corrected `λ′` monodromy and semisimplicity, then Varma’s maximal-block bound and LLC; `det r·ε_l^{n(n−1)/2}` gives central slope `+nλ_τ` and partial slopes `+jλ_τ`, so Geraghty applies.

([Qian's thesis], Lemma 4.0.3 and its proof, Ch. 4, pp. 64–65 (thesis, PDF pp. 71–72); published Lemma 4.3, Invent. p. 1273; [Qian], Lemma 3.10(4) and its proof, pp. 20–21.)

*Needs:* PAI Layer 2, soluble automorphy comparisons; AG2.2; AG2.5.

<a id="galois-ordinarity-from-automorphic"></a>
### 2.21 Galois ordinarity from automorphic ordinarity (ACC+ Corollary 5.5.2; Qian Remark 4.4)

For imaginary CM F, RAC `GL_n` `π` of weight `ιλ`,`ι:Q̄_p≅ℂ`, ordinary at every v|p and irreducible decomposed-generic `r̄_ι(π)`, its Galois realization is ordinary of weight `λ` at p, with diagonal characters fixed by weights/`U_p` eigenvalues. Qian 4.4 applies this only to Thm. 1.4’s irreducible branch, not arbitrary semisimple residual input in 1.1.

API: `TauCeti.PotentialAutomorphy.ordinary_of_iotaOrdinary`.

Proof route: ACC+ 5.5.2 from 5.5.1 after soluble CM base change disjoint from the residual fixed field; preserve residual irreducibility/decomposed genericity.

Converse to Geraghty’s AG2.2 comparison at its totally real/polarized scope.

([ACC+], ACC+ Cor. 5.5.2 from Thm. 5.5.1; Qian Remark 4.4, published p. 1274 (arXiv v1 final paragraph of §4); [Qian's thesis], Remark 4.0.4, Ch. 4, p. 65 (thesis, PDF p. 72); ≈ published Remark 4.4, Invent. p. 1274.)

*Needs:* PAI Layer 3; PAI Layer 2, soluble automorphy comparisons.

<a id="acc-auxiliary-primes"></a>
### 2.22 The auxiliary primes `l₁`, `l₂` for symmetric powers over CM fields (ACC+ Assumption 7.2.6)

ACC+ 7.1.11 data: Galois CM `F/F₀`,`F₀^avoid`,`𝓛₀`,strongly irreducible rank-two very weak systems `R_i`,`HT={0,1}`,`S_i∩𝓛₀=∅`,`m_i>0`. Choose non-CM `E/ℚ` good above `𝓛₀` and distinct `l₁`,`l₂`,`λ_i|l₂` satisfying: (1) `l₂` splits in `M_i`; (2) `E[l₁](G_F)⊃SL₂(F_{l₁})`,`r̄_{i,λ_i}(G_F)⊃SL₂(F_{l₂})`; (3) `l₁`,`l₂` unramified in F; (4) E good there; (5) neither under `S_i`; (6) both `>2m_i+3`; (6′) both `>(m_i+1)²`; (7) `r_{i,λ_i}` crystalline `HT={0,1}` above `l₂`. Density one for the latter conditions meets (1)’s positive density.

API: `TauCeti.PotentialAutomorphy.acc_auxiliaryPrimes`.

Proof route: Chebotarev and PAI §2.12 `rank_two_large_residual_image` (ACC+ 7.1.3), retaining containment on the normal-closure subgroup before restricting the conclusion to `G_F`.

([ACC+], §7.2.5, proof of Thm. 7.1.11, Assumption 7.2.6, p. 208 (Annals p. 1103).)

*Needs:* Chebotarev, Layer 10; PAI §2.12, `rank_two_large_residual_image`; PMCS §§1.7–1.8 (operations on systems).

<a id="twisted-modular-curve"></a>
### 2.23 The twisted modular curve `X_E(q)`

For number field K, elliptic E/K and prime `q≥3`, `X_E(q)` compactifies the fine moduli `Y_E(q)` of elliptic A with Weil-pairing-preserving A[q]≅E[q]. It is the geometrically connected E[q]-twist of X(q), genus zero for `q≤5`. CG’s auxiliary curve is obtained by applying BLGHT11 6.2 to such twists.

- `TauCeti.PotentialAutomorphy.TwistedModularCurve`: `X_E(q)/K`.
- `TauCeti.PotentialAutomorphy.TwistedModularCurve.moduli`: noncuspidal L-points classify symplectic `(A/L,φ)` up to isomorphism, `q≥3`.
- `TauCeti.PotentialAutomorphy.TwistedModularCurve.geometricallyConnected`: geometric connectedness.
- `TauCeti.PotentialAutomorphy.TwistedModularCurve.baseChange`: `X_E(q)_L=X_{E_L}(q)`.
- `TauCeti.PotentialAutomorphy.TwistedModularCurve.point_E`: `(E,id)∈X_E(q)(K)`.

Construction: descend full symplectic level-q by E[q] and its Weil pairing, then compactify via ModularCurves. The basis cocycle is `GL₂` with cyclotomic determinant, not `SL₂` unless `µ_q⊂K`. The fixed-pairing geometric fibre is connected; (E,id) is rational.

**Checks.**

- `q=3` gives genus zero and the K-point (E,id), hence `X_E(3)≅ℙ¹_K`.
- Trivial E[q] action with `µ_q⊂K` gives `X_E(q)≅X(q)_K`.
- Full level is not cyclic level: at `q=7`, X(7) has genus 3 and `X₀(7)` genus 0. At `q=3`,5 both curves are `ℙ¹_K`, but their moduli problems differ.

([Calegari–Geraghty](#ref-cg-2018), §10, general case, p. 97 = Invent. p. 429.)

*Needs:* PMCS §§2.8–2.10 and 2.23; ModularCurves, Layer 5; ModularCurves, Layer 10.

<a id="p-r-switch"></a>
### 2.24 The p–r switch for symmetric powers over CM fields (BCGNT Proposition 6.2.3)

BCGNT Prop. 6.2.3 is a sufficient-condition theorem: with the auxiliary systems and all conditions (1)–(17) below, `Sym^{n−1}R` is weakly automorphic of level prime to `X₀`. It does not assert an iff between residual automorphy at p and r of a single CM-tensored system.

F imaginary CM, `m≥2`, `n≥1`, `X₀` a finite set of finite places; `R=(M,S,{Q_v},{r_λ},{H_τ})` very weakly compatible of rank 2. (1) `H_τ={0,m}`. (2) `det r_λ=ε^{−m}`. (3) R strongly irreducible. (4) `X₀∩S=∅`. (5) `F/ℚ` Galois containing an imaginary quadratic `F₀`. Fix `M↪ℂ`. (6) `E/ℚ` cyclic totally real of degree m, disjoint from F; `L=EF` and `Ψ:𝔸_L^×→M^×`. Choose `τ₀:F₀↪ℂ` and `τ₁`,…,`τ_m:EF₀↪ℂ` extending `τ₀`, with `Ψ(α)=∏_{i=1}^m` `τ_i(N_{L/EF₀}α)^{m−i}cτ_i(N_{L/EF₀}α)^{i−1}` on `L^×`. `R_CM=Ind_{G_L}^{G_F}Ψ` has `H_CM`,`τ={0,…,m−1}` and `det r_CM`,`λ=ε^{−m(m−1)/2}`. Its bad set is the places ramified in L or above ramification of `Ψ`. (7) Distinct primes p,r not dividing places of S and chosen coefficient places above them. (8) A weakly compatible rank-m `R_aux`, pure of weight `m−1`, bad set avoiding `X₀∪{v|pr}`, `det=ε^{−m(m−1)/2}`, `HT={0,…,m−1}`. (9) A weakly compatible rank-nm `S_UA`, pure of weight `nm−1`, bad set avoiding `X₀∪{v|pr}`, `det=ε^{−nm(nm−1)/2}`, `HT={0,…,nm−1}`, weakly automorphic of level prime to `X₀∪{v|pr}`. Put `S_aux=Sym^{n−1}R⊗R_aux` and `S_CM=Sym^{n−1}R⊗R_CM`. (10) `L/F` and `Ψ` unramified above `X₀∪{v|pr}`. (11) `p>2nm+1` and `[F(ζ_p):F]=p−1`. (12) `r>2nm+1`, r splits completely in `EF₀`, `[L(ζ_r):L]=r−1`. (13) Up to conjugacy `SL₂(F_p)≤r̄_p(G_F)≤GL₂(F_p)`, likewise at r. For `m>2`, `r̄_aux`,p has image `GU_m(F_{p²})` and multiplier `ε^{1−m}`; for `m=2` its image is `GL₂(F_p)`. `r̄_CM`,r restricted to `G_{F(ζ_r)}` is irreducible. For `m=2` the projective extensions cut out by `r̄_p` and `r̄_aux`,p over `F(ζ_p)` are disjoint. (14) `s̄_UA`,`p≅s̄_aux`,p and `r̄_aux`,`r≅r̄_CM`,r. (15) The p-adic places split as `Σ_ord⊔Σ_ss`; each `F_v` contains `ℚ_{p²}`, `r̄_p|G_{F_v}` and `ρ̄_{2,m,0}|G_{F_v}` are trivial. On `Σ_ord`, `r_p` is crystalline ordinary; on `Σ_ss`, `r_p` connects to `ρ_{2,m,0}`. (16) On `Σ_ord`, `r̄_aux`,p is trivial and `r_aux`,p,`s_UA`,p crystalline ordinary. On `Σ_ss`, `r̄_aux`,p is trivial, `r_aux`,p,`s_UA`,p crystalline, and they connect to `ρ_{m,1,0}`,`ρ_{nm,1,0}` respectively. (17) At every `v|r`, `r̄_aux`,`r≅r̄_CM`,r is trivial and `r_aux`,r is crystalline ordinary. The connects relation and `ρ_{a,b,c}` are BCGNT Defs. 5.1.1 and the local deformation component relation, not unnamed propositions.

API: `TauCeti.PotentialAutomorphy.prSwitch`.

Proof route: [§2.5] at p (seed `S_UA`, (13),(15)–(16)), then at r ((14),(17), ordinary connectedness); BCGNT §5.1 supplies the tensor-connects identities. The order-m self-twist gives cyclic induction; compare an irreducible member, undo `Ψ` and descend by ACC+ 6.5.13/PAI Layer 2.

([BCGNT], Prop. 6.2.3 and proof, §6.2, pp. 61–63 (published pp. 54–57) PDF p.62.)

*Needs:* [all-place cyclic automorphic induction and descent](#automorphic-induction-register); ET §§6.24, 6.26–6.29 (the exact lifting targets of Layer 2); AL.3 (strong multiplicity one); AL.3 (Rankin–Selberg boundary nonvanishing).

<a id="pd-lifts-with-local-conditions"></a>
### 2.25 Lifts with potentially diagonalizable local conditions (Theorem 4.3.1)

For `n≥1`,odd l,imaginary CM F,`ζ_l∉F`, split finite S⊂places(`F⁺`) containing l and selected ṽ|v, fix continuous algebraic `µ:G_{F⁺}→Q̄_l×` unramified outside S,`µ(c_v)=−1`. Let `r̄:G_{F⁺}→G_n(F̄_l)` be continuous/unramified outside S,`νr̄=µ̄`,`r̄⁻¹(G_n⁰)=G_F`. Choose lifts `ρ_v` of `r̄̆|G_{F_ṽ}`. Require cyclotomic irreducibility of r̄̆,`l≥2(d+1)` (maximal constituent dimension on the Sylow-pro-l-generated closed subgroup), and PD `ρ_v` with n distinct labelled weights at l. Obtain `r:G_{F⁺}→G_n(O_{Q̄_l})`,`νr=µ`,unramified outside S,connecting to every `ρ_v`. BLGGT 4.3.1 requires no residual automorphy.

Use `G_n=(GL_n×GL₁)⋊{1,j}` of BLGGT §1.1.

API: `TauCeti.PotentialAutomorphy.exists_pd_lift`.

Proof route: the prescribed-component deformation ring has dimension `≥1`; [§2.17] and [§2.16] make it finite over O after extension, hence give characteristic-zero points.

Ordinary crystalline choices recover [§2.15].

([BLGGT], §4.3, Thm. 4.3.1, p. 55.)

*Needs:* LGD §6.8, connects; [§2.1]; GGD G7 (polarized representability).

<a id="potential-automorphy-theorem"></a>
### 2.26 Potential automorphy of potentially diagonalizable polarized representations (Theorem 4.5.1)

For finite Galois imaginary CM `F/F₀`, finite I, `n_i`,`d_i≥1`, odd `l_i≥2(d_i+1)`,`ζ_{l_i}∉F`, fixed `ι_i` and totally odd RA polarized `(r_i,µ_i)` of rank `n_i`, let `d_i` be the maximal residual constituent dimension on the Sylow-pro-`l_i`-generated subgroup. Assume PD at `l_i` and cyclotomic residual irreducibility. For finite Galois `F^avoid/F` obtain finite CM F′/F,Galois over `F₀`,disjoint from `F^avoid`,and RACP `(π_i,χ_i)` unramified above `l_i` realizing `(r_i,µ_i)|F′`,multiplier `r_{l_i,ι_i}(χ_i)ε^{1−n_i}`.

API: `TauCeti.PotentialAutomorphy.potential_automorphy`.

Proof route: [§2.17] with avoidance enlarged by residual kernels and cyclotomic fields, then [§2.16]; disjointness preserves residual irreducibility.

Fontaine–Laffaille check: `ℓ_i` unramified in `F⁺` and labelled intervals `[a_τ,a_τ+ℓ_i−2]` give potential diagonalizability by [§2.1]. The output is over F′; descent to F additionally needs soluble F′/F and PAI Layer 2.

([BLGGT], §4.5, Thm. 4.5.1 and proof, pp. 59–60.)

*Needs:* AG2.0 (polarized Galois representation); PAI Layer 2, soluble automorphy comparisons.

<a id="acc-symplectic-potential-automorphy"></a>
### 2.27 Potential ordinary automorphy of symplectic residual representations with prescribed disjointness (ACC+ Proposition 7.2.3)

For finite Galois totally real `F/F₀`, finite `𝓘`, even `n_i`,odd `l_i`,`ι_i:Q̄_{l_i}≅ℂ` and open-kernel `r̄_i:G_F→GSp_{n_i}(F̄_{l_i})`,multiplier `ε̄^{1−n_i}`,unramified above finite `𝓛` (unramified in F,excluding `l_i`), fix finite Galois `F^avoid/F`. Obtain finite Galois `F^suffices/F₀` and `F₁^avoid/ℚ: F⊂F^suffices`; `F^suffices` disjoint from `F^avoid` `F₁^avoid/F` and unramified above `𝓛`; `F₁^avoid` disjoint from `F^avoid/ℚ`. For every finite totally real `F′/F^suffices` disjoint from `F₁^avoid`, all `r̄_i|G_{F′}` are weight-zero ordinarily automorphic,level prime to `𝓛`. This adds `F₁^avoid` to §2.14.

API: `TauCeti.PotentialAutomorphy.acc_symplectic`.

Proof route: the Dwork/Moret–Bailly construction [§2.14], keeping the auxiliary residual fixed field as `F₁^avoid`.

([ACC+], §7.2.1, Prop. 7.2.3 and its parenthetical proof, pp. 204–205 (Annals pp. 1099–1100).)

*Needs:* [§2.13].

<a id="potential-automorphy-with-steinberg-place"></a>
### 2.28 Residual potential automorphy with a Steinberg place (Fakhruddin–Khare–Patrikis, proof of Proposition 9.1)

For totally real F,`p≫_n0`,`ρ̄:Γ_F→GSp_{2n}(k)`,similitude `κ̄^{1−2n}`,cyclotomically absolutely GSp-irreducible (GL-reducibility allowed), and `v₀` with `ρ̄|Γ_{F_{v₀}}=1`,`N(v₀)≡1` mod p, obtain Galois totally real F′/F disjoint from `F(ρ̄,ζ_p)` and RA self-dual cuspidal `GL_{2n}` `Π_{F′}` matching `ρ̄`,Steinberg up to unramified twist at every `w|v₀`. Use BLGGT 3.1.2 with extra Moret–Bailly `v(t(P))<0` conditions.

Retain the hypotheses of FKP Prop. 9.`1: [F(ζ_p):F]>a_{GSp_{2n}}` of FKP19 Lemma A.6, `ρ̄` is not induced from a proper subgroup as a `GL_{2n}`-representation, and at every v|p there is an ordinary `GSp_{2n}`-lift with similitude `κ^{1−2n}`. Every `GL_{2n}` constituent of `ρ̄` is self-dual with this multiplier and remains irreducible on `Γ_{F(ζ_p)}`. The Steinberg local component is `π_w` for each `w|v₀`.

API: `TauCeti.PotentialAutomorphy.withSteinbergPlace`.

Proof route: [§2.14] and [§2.13] with `v(t)<0` at `v₀` give maximal monodromy and Steinberg.

Finite-set variant: impose `v(t)<0` at finite T away from p; Chebotarev gives `v₀`,`v₁` of distinct residue characteristics. Include both in FKP E’s local S and approximate formally smooth Steinberg lifts; pp.41–42 preserves both in one lift/extension. This follows from the construction beyond 9.1’s one-place statement.

For coefficient characteristic equal to that of `v₀` use `v₁` for off-coefficient monodromy; distinct residue characteristics are essential.

([FKP22], Thm. E, pp. 5–6, and §9, Prop. 9.1 and proof, pp. 41–43 (finite local prescriptions and the residual automorphy argument on p. 42).)

*Needs:* [C-LOCAL-DEFORMATION].

<a id="cm-three-five-switch"></a>
### 2.29 Residual modularity with prescribed p-adic elliptic types

For imaginary CM F, `p=3` or 5, continuous decomposed-generic `r̄:G_F→GL₂(𝔽_p)` with `det=ε̄_p` (`ζ₅∉F` if `p=3`), partition all p-places as `T_st`, `T_ord`, `T_ss`. The comparison **`CMResidual.modular_curve_with_types`** consumes EllipticCurveModularityImaginaryQuadratic §0.3 `switch_five` or `switch_three`, respectively: for any finite avoidance extension it gives a linearly disjoint soluble CM L/F and a non-CM modular elliptic A/L with symplectic `A[p]≅r̄|G_L`, split multiplicative/good ordinary/good supersingular reduction at every place above the corresponding part, and retained decomposed genericity. Apply the supplied construction to the Galois closure of the avoidance field. The symplectic identification uses the owner's fixed-pairing twist and its Weil-pairing convention.

This comparison transports the same A and its modular realization to the conventions here: `H¹(A)=V_A∨` has residual representation `r̄∨` and determinant `ε̄_p⁻¹`; for an inverse-cyclotomic input apply the construction to its dual. Use the owner's `modular_elliptic_all_coefficients` and `auxiliary_local_types` for the same weight-zero cuspidal π, with `r_{π,ι}≅H¹(A)`, ordinary at the multiplicative places and unramified at both good-reduction types. At the coefficient prime the good-reduction representations are crystalline with `N=0`; the supersingular branch remains nonordinary. ([AKT](#ref-akt), Lemma 9.7 pp.75–76 and Props. 9.12–9.13 pp.79–80; [Caraiani–Newton], Props. 6.1.5–6.1.6 and Lemma 6.1.7 pp.88–90.)

The elliptic residual criterion is consumed from EllipticCurveModularityImaginaryQuadratic §5.3 `cm_modularity`: when `ζ₅∉F`, an elliptic E/F is modular if E[3] or E[5] is decomposed generic and absolutely irreducible on the corresponding cyclotomic subgroup. Duality preserves both residual properties and gives the cohomological realization for non-CM E; CM E retains the character branch. Over imaginary quadratic F, cyclotomic absolute irreducibility implies genericity (CN 6.2.2 Goursat/Chebotarev). For CM Galois `F/ℚ`, `ζ₅∉F`, mod-5 image containing `SL₂(𝔽₅)` has density one among integral Weierstrass equations in CN's height ordering: IG §IG.2.5 quantitative HIT (ArithmeticStatisticsPartI, Exact supplier contracts) plus CN's conjugate-constituent argument gives 6.1.2. This height-density argument is a target here and concerns equations, not a measure on isomorphism classes.

**Checks.**

- At a supersingular p-place the seed must be nonordinary, so an all-ordinary auxiliary curve does not serve.
- Prescribing supersingular reduction at every p-place retains the owner's Tate places above 2 and 3 for `p=5`, and above 5 for `p=3`; these force the auxiliary curve to be non-CM.
- The determinant of A[p] is `ε̄_p`, while that of its cohomological dual is `ε̄_p⁻¹`.
- Include the residual fixed field in the avoidance datum to preserve the residual image by disjointness; a field killing the residual representation would destroy irreducibility.
- For `p=3` the `ζ₅` exclusion remains.
- Equality of j-invariants identifies quadratic twists, not necessarily the curves themselves.

([AKT](#ref-akt), Lemma 9.7 pp.75–76 and Props. 9.12–9.13 pp.79–80; [Caraiani–Newton], Thm. 6.1 and Cors. 6.1.1–6.1.3 pp.87–88, Lemmas 6.1.4–6.1.7 pp.88–90 and Lemma 6.2.2 pp.90–91.)

*Needs:* EllipticCurveModularityImaginaryQuadratic §0.3 `switch_five`, `switch_three`, `modular_elliptic_all_coefficients`, `auxiliary_local_types`, fixed-pairing point and base-change contract, and §5.3 `cm_modularity`; IG §IG.2.5, quantitative Hilbert irreducibility; ArithmeticStatisticsPartI §0.1, relative density in the specified height ordering; Chebotarev.

<a id="exceptional-modular-curves"></a>
### 2.30 Exceptional modular-curve data and conditional modularity

For `p=3,5`, write `b_p,s_p,ns_p` for the Borel, split normalizer and nonsplit normalizer in `GL₂(𝔽_p)`, and `ns3°` for the Cartan. The explicit hypothesis `CNExceptionalCurveData(F)` consists of the normalization identifications, j-maps, divisor and group equalities, residue conditions and exceptional elliptic comparisons below for `X(b3,b5),X(s3,b5),X(ns3°,b5),X(b3,ns5),X(ns3°,ns5),X(s3,ns5)`. Individual modularity is conditional on these facts; the density-one theorem of §2.29 has its independent hypotheses.

**Models and API.** Assume `exceptionalCurveModel / exceptionalCurveJMap`: isomorphisms from the smooth projective normalizations to the displayed models, inverse function-field maps and commutativity with the modular j-functions. Component and cusp data include the points at poles of affine coordinates. The j-functions are
`j_b3(t)=(t+27)(t+3)³/t`, `j_b5(t)=(t²+250t+3125)³/t⁵`, `j_ns3(t)=t³`, `j_ns5(t)=125t(2t+1)³(2t²+7t+8)³/(t²+t−1)⁵` and `j_s3(t)=27(t+1)³(t−3)³/t³`. The double cover `X(ns3°)→X(ns3)` has equation `z²=−3(t²+12t+144)`. The first two fibre products have models `y²=x(x+16)(x+25)` and `y²=x(x+1)(x+16)` respectively. The remaining four models and involutions are hypotheses:

| Curve | Smooth projective model (affine chart `z=1`) | Involution / quotient |
| --- | --- | --- |
| `X(ns3°,b5)` | `y²=−3(x⁴+2x³−x²+10x+25)` | `w₅:x↦5/x` on the quotient coordinate |
| `X(b3,ns5)` | `y²=9x⁶−6x⁵−35x⁴+40x²+12x−8` | `w₃` is the hyperelliptic involution |
| `X(ns3°,ns5)=C₁` | `9x⁴+19x²y²+y⁴+9x³+19x²y+22xy²+2y³+10x²+22xy+13y²+7x+12y+11=0` | `(x,y)↦(x,−y−1)` |
| `X(s3,ns5)=C₂` | `−x⁴+2x³y+x²y²+8x³+2x²y−2xy²−y³−3x²−3xy+3y²+2x−3y+1=0` | `(x,y)↦((3x+y+2)/(4x−2y+1),(8x+y−8)/(4x−2y+1))` |

Assume both quartic quotients are `D:y²−y=x³+1`, with `D(ℚ)≅ℤ`, and that the rational involution on `C₂` extends to the projective curve. The genus-one quartic uses weighted projective space `ℙ(1,2,1)`. Its quotient j-function is `(x⁶+250x³+3125)³/x¹⁵`, with `3125=5⁵`; the branch divisor and cusp field specify the twist `−3` of the double cover.

The hypothesis `exceptionalDivisorData(C)` supplies exact divisors, Riemann–Roch bases, principal-divisor witnesses, rank/torsion bounds, finite-index inclusions, good reductions and the following finite residue data. EffectiveDiophantineMethods §§3.21–3.22, 4.20–4.22, 5.24 and 5.27–5.28 supplies the general Mordell–Weil and relative Chabauty implications used to deduce `exceptionalCurve_point_classification` from these hypotheses.

- **Genus one (CN Proposition 7.2.2).** Assume `Jac(C)(ℚ)≅(ℤ/2)²` for `v²=u³+3u²−720u−8100` and `C(ℚ₃)=∅`. Over `a²=−3`, assume the classes of `∞±=(1:±a:0),(0:5a:1),(−2:−a:1),(−5/2:5a/4:1)` relative to `∞−` give the three nonzero Jacobian classes, and their Brauer obstructions leave exactly `ℤ/2` rational degree-zero divisor classes modulo rational principals. Assume the Riemann–Roch spaces after adding `∞++∞−` have bases 1 and CN (7.2.1)–(7.2.3)'s functions. For `α=α₀+aα₁`, their rationality equations are `α₀²+3α₁²+6α₁+c=0`, with `c=−33,15,12`; the last two have no `ℚ₃`-points, and the first quadratic has constant coefficient five times its leading coefficient. These hypotheses imply that a quadratic point P has `x(P)∈ℚ` or `x(P)x(P^σ)=5`, including projective poles; the second case gives the degree-five `ℚ`-curve isogeny (7.2.5).
- **Genus two (CN Proposition 7.3.3).** Assume rank zero, `#J(𝔽₇)=40`, `#J(𝔽₁₃)=180`, the exhibited torsion and `J(ℚ)=ℤ/2⊕ℤ/10`. The effective representatives of all 19 nonzero reduced Mumford classes translated by infinity's rational degree-two divisor are a finite input: nine rational-x, two at infinity, six real quadratic, and two with `x=(−5+√−11)/6,y=±(17−√−11)/6`. Zero gives the hyperelliptic pencil. Retain real, imaginary and cusp conditions. For a rational-x quadratic P, `w₃` equals conjugation, giving a degree-three geometric `ℚ`-curve, possibly with nonrational j (7.3.4, p.98).
- **Plane quartic rank and saturation (CN Proposition 7.4.4).** Assume the Chen isogenies, rank one and a generator of `D(ℚ)` with pullback `G_i`. Reductions at 7,11,13 give torsion bounds 4/20; `C₁`'s 2-primary reduction at 13 is `(2,2)`; `C₂` has independent order-10/order-2 torsion. Assume the norm/pullback inclusions `4J₁(ℚ)⊂⟨2G₁⟩` and `10J₂(ℚ)⊂⟨5G₂,J₂`[2]`⟩`, with `G₂` in the second subgroup. Analytic rank alone does not supply these hypotheses.
- **Plane quartic residue hypotheses (CN Proposition 7.4.5).** For `C₁`, assume `I=4`, subgroup `⟨2G₁⟩`, reduction prime 43, reduced subgroup order 7 and seven scaled degree-two Abel–Jacobi preimage classes. Eight supplied pullbacks cover them, each with nonzero relative differential; EffectiveDiophantineMethods §4.22 then puts every divisor in the pullback of `D(ℚ)`. For `C₂`, assume `I=10`, subgroup `⟨5G₂,J₂`[2]`⟩`, primes 11,43, sixteen nonpullback candidates (eight rational sums/eight quadratic divisors), the local uniqueness/pullback hypotheses and empty simultaneous cosets for every reduction preimage (§5.24). Six quadratic candidates are real; two over `a²=−55` have representatives `((1+a)/28,(27−a)/56)`, `((3−a)/4,(3+3a)/4)` and conjugates, with `j=−32768`. The resulting imaginary quadratic points give `ℚ`-curves or rational j.

`exceptional_at_sqrtMinus11_modular` is conditional on the following explicit facts. Over `K=ℚ(a)`, `a²−a+3=0`, the remaining genus-two twist class has coefficients `[a,0,1+a,−24−6a,56+13a]` and `j=(11155375a+3126750)/32`. Its `X(b3,ns5)`-point gives nonsplit-normalizer containment. Assume `#E(𝔽₃₇)=42` at `a≡14` and `#E(𝔽₈₉)=75` at `a≡37`, yielding mod-5 order 24 and a nonscalar split involution (trace 0, determinant 4, eigenvalues `±1`). The image is then the full order-48 normalizer, whose order-12 determinant-one subgroup is absolutely irreducible; §2.29 gives modularity and transports it to quadratic twists.

`exceptional_at_i_modular` is conditional on the curve `E₀:y²+i xy+y=x³+x²+(6+i)x+10−15i` over `K=ℚ(i)`, conductor `(63i−9)`, norm 4050 and `j=(−47709+15363i)/256`, and an actual rational-Hecke-field cuspidal weight-two Bianchi form of that level with the supplied exact cuspidal-cohomology Hecke data (CN §7.1, identifier 2.0.4.1-4050.1-c). Attach AG2's realization. Require common finite coefficients `A/ℚ₂` with residue `𝔽₂`, stable lattices and common determinant `ε₂`/trivial finite centre for `T₂(E₀)` and the dual cohomological realization, evaluated at arithmetic Frobenius. Rational eigenvalues alone do not give coefficient descent; DGP Remark 5, p.6 gives the sufficient two-root-field residue-degree-one/containment condition.

Assume DGP's finite comparison hypotheses for this pair: the specified residual branch of the 2-division polynomial, ray-class generators/evaluations, finite prime set and exact trace/point equalities. The ray moduli have support at 2,3,5 and the conjugate level, with exponents `2e(𝔭|2)+1` at 2, `⌊3e(𝔭|3)/2⌋+1` at 3 and 1 elsewhere. For residual `S₃`, the comparison set detects every `S₃×C₂/S₄` obstruction extension over the torsion field (§2.1); for trivial/`C₂`, assume even-trace recognition and the noncubic Livné condition (§2.2); for `C₃`, assume the cubic-field identification and even-trace comparison there with descent (§2.3). Include equality of the remaining bad local factors. DGP §5 gives the Galois comparison; the specified isogeny, conjugation and twist identifications cover the eight extra `X₀(15)(ℚ(i))` points.

`exceptionalCurve_modular`: assume the first two genus-one curves are isogenous with rational torsion `ℤ/2⊕ℤ/4`, CN 7.1.2's eight extra imaginary-quadratic points on `X₀(15)` all lie over `ℚ(i)`, and the split-normalizer curve's torsion grows only over real `ℚ(√5)`. Finite `X₀(15)(F)` consists of torsion, so the supplied lists exhaust it. Rational j uses twists of base-changed rational modular curves; degree-3/5 `ℚ`-curves use the modularity supplier; CM points use Hecke characters. The residual alternatives and these hypotheses give `CNExceptionalCurveData.point_classification` and the conditional individual modularity endpoint.

**Checks.**

- The isogenous genus-one models `x(x+16)(x+25)` and `x(x+1)(x+16)` have different torsion-growth lists.
- Replacing 3125 by 55 changes j. Replacing rational divisor classes by `J(ℚ)` loses the Brauer obstruction. The first conic has `(α₀,α₁)=(3,2)`; the other two fail at 3.
- Zero in the genus-two Jacobian gives a pencil; all nineteen nonzero classes are needed for the finite list.
- At `√−11`, order 24 alone permits a Cartan; the nonscalar split involution forces the full normalizer. A scalar involution fails.
- For `C₁`, eight divisors cover seven classes because distinct pullbacks can reduce equally. The Chabauty implication requires the relative differential hypotheses.
- `C₂`'s `√−55` points are nonrational with rational j. Every candidate and multiplier inclusion is a hypothesis.
- A rational-x quadratic genus-two point gives a degree-three `ℚ`-curve, possibly with nonrational j.
- DGP needs common cyclotomic determinant, residue-`𝔽₂` models and lattices, the spanning/noncubic conditions and bad-factor comparison. Residual agreement alone does not give the 2-adic comparison.

([Caraiani–Newton], Thm. 7.1.1 and Cor. 7.1.2 pp.92–94; Prop. 7.1.3 p.94; Props. 7.2.2–7.2.4 and Cor. 7.2.5 pp.95–97; Prop. 7.3.3 pp.97–98; Props. 7.4.1, 7.4.4–7.4.5 and Cor. 7.4.6 pp.98–102. [Dieulefait–Guerberoff–Pacetti](https://arxiv.org/pdf/0804.2302v2), §§2.1–2.3 pp.2–5, Galois realization Thm. 3.1 p.6, finite comparison §4 pp.6–8, soundness §5 pp.8–16. [Box](https://arxiv.org/pdf/1906.05206v3), Thms. 2.1, 2.4 and 2.6, pp.4–7, Prop. 3.1 pp.8–9; general implications supplied by EffectiveDiophantineMethods.)

*Needs:* ModularCurvesPartII, Cartan/normalizer moduli and j-maps; EffectiveDiophantineMethods §§3.21–3.22, 4.20–4.22, 5.24, 5.27–5.28; ArithmeticGaloisRepresentations Layer 5, finite-image recognition; ClassFieldTheory Layers 7 and 11, ray-class characters; ALS.3 and ALS.5b, cohomological Hecke data; AG2.4–AG2.7, imaginary-quadratic realization; GL2T R17.4, soluble base change; EllipticCurveModularityPartIIGL2TypeAbelianVarieties GT.6, quadratic-q-curves-modular. All explicit models, group orders, ranks, residue tables and comparison equalities above are hypotheses of the conditional endpoint.

<a id="cg18-odd-symmetric-powers"></a>
### 2.31 Conditional potential modularity of odd symmetric powers of elliptic curves (Calegari–Geraghty §10)

Assume Conjecture B. For non-CM elliptic A/K, `r=Sym^{2n−1}ρ_{A,p}` is potentially modular. Special case: p totally split in K,`p+1` divisible by `N₂>2n+1` prime to conductor,surjective residual image,good reduction at p,and `ρ̄_A|G_{ℚ_p}≅Ind` `ω₂`. BLGHT II 6.2’s Dwork point links r̄ to an induction; CG 5.16 twice gives modularity. Generally choose A′[q]≅A[q] on [§2.23](#twisted-modular-curve) satisfying that special case.

The auxiliary construction retains the local/coefficient conditions of BLGHT II Prop. 6.2.

API: `TauCeti.PotentialAutomorphy.cg18_oddSymPowers`.

Proof route: [§2.9], [§2.11], Moret–Bailly and CG 5.16 twice; Moret–Bailly on `X_A(q)` reduces the general case to the special case.

([Calegari–Geraghty](#ref-cg-2018), §10, proof of Thm. 1.1, 'extra hypothesis' bullet, p. 97 = Invent. p. 428; §10, general case, pp. 97–98 = Invent. p. 429.)

*Needs:* [§2.13] (the exact lifting targets of Layer 2).

<a id="change-of-weight-and-level"></a>
### 2.32 Change of weight and level (Theorem 4.4.1)

For imaginary CM F,`l>2(n+1)`,`ζ_l∉F`,l-places split over `F⁺`,split finite `S⊃l`,algebraic `µ`,and polarized `r̄:G_F→GL_n(F̄_l)` unramified outside S,cyclotomically irreducible and ordinarily/PD automorphic,choose lifts `ρ_v` at `v∈S`,PD with n distinct labelled weights at l. Obtain RACP `(π,χ)`,matching r̄,multiplier `r_{l,ι}(χ)ε^{1−n}=µ`,level potentially prime to l,unramified outside S,and connecting to each `ρ_v`.

API: `TauCeti.PotentialAutomorphy.change_of_weight_and_level`.

Proof route: [§2.25], [§2.16], then [Polarization].

Check: every locally admitted potentially diagonalizable weight/type is attained automorphically.

([BLGGT], §4.4, Thm. 4.4.1, pp. 58–59.)

*Needs:* [C-LOCAL-DEFORMATION].

<a id="potential-automorphy-totally-real"></a>
### 2.33 Potential automorphy over totally real fields (Corollary 4.5.2)

For totally real `F⁺`,`l≥2(n+1)`,totally odd RA polarized rank-n `(r,µ)`,PD at l and cyclotomically irreducible reduction,obtain Galois totally real `F^{+,′}/F⁺` over which `(r,µ)` is automorphic,level prime to l.

API: `TauCeti.PotentialAutomorphy.potential_automorphy_totallyReal`.

Proof route: choose CM `F/F⁺` split above l and disjoint from the adjoint residual/cyclotomic field; apply [§2.26], then PAI Layer 2 descent.

At `n=2` recover potential modularity over `ℚ` with the stated PD local conditions.

([BLGGT], §4.5, Cor. 4.5.2, p. 60.)

*Needs:* PAI Layer 2, soluble automorphy comparisons.

<a id="potential-automorphy-mod-l"></a>
### 2.34 Potential automorphy of mod l representations with prescribed local lifts (Corollary 4.5.3)

In BLGGT 4.5.1’s setting,replace `r_i` by irreducible polarized `r̄_i:G_F→GL_{n_i}(F̄_{l_i})`,totally odd de Rham `µ_i`,cyclotomic irreducibility; fix c-stable finite `S⊃l_i`/ramification and lifts `ρ_{i,v}`,`ρ^c_{i,cv}≅µ_iρ∨_{i,v}`,PD with distinct weights at `l_i`. Obtain F′ with 4.5.1’s Galois/disjointness properties and RACP `(π_i,χ_i)` matching `r̄_i`,multiplier `µ_i`,level potentially prime to `l_i`,unramified outside S,and connecting to every restricted `ρ_{i,v}`.

API: `TauCeti.PotentialAutomorphy.potential_automorphy_residual`.

Proof route: make S split as in [§2.17], then [§2.25] and [§2.26].

Unlike 3.3.1, any admitted potentially diagonalizable local types are allowed.

([BLGGT], §4.5, Cor. 4.5.3, pp. 60–61.)

*Needs:* [C-LOCAL-DEFORMATION].

<a id="compatible-systems-potentially-automorphic"></a>
### 2.35 Potential automorphy of compatible systems (Theorem 5.4.1, Corollary 5.4.2)

For finite Galois CM (respectively totally real) `F/F₀`,finite Galois `F^avoid/F` and finite family of regular irreducible totally odd polarized weak systems `(ℛ_i,ℳ_i)`,obtain one finite CM (respectively totally real) F′/F,Galois over `F₀`,disjoint from `F^avoid`,making all pairs automorphic. Corollary5.4.2 is the single-system specialization.

API: `TauCeti.PotentialAutomorphy.potential_automorphy_compatibleSystem`.

Proof route: PMCS §1.21 residual irreducibility/density and BLGGT A.1.7/A.2.1, avoiding the fields of 5.3.1; one common large unramified coefficient prime satisfies all dimension/Fontaine–Laffaille bounds. Apply [§2.26]; the totally real case uses soluble CM descent.

Checks: finite intersections preserve density one; fixed Hodge ranges fit [a,a+l−2] for sufficiently large l.

([BLGGT], §5.4, Thm. 5.4.1, Cor. 5.4.2 and proof, p. 74.)

*Needs:* [§2.1] (pd criteria); PAI Layer 2, soluble automorphy comparisons; PMCS §1.21 (density-one residual irreducibility); PMCS §1.17, `monodromy_component_field`, including `componentKernelIndependent` and constituent coefficient descent; PMCS §1.1 (weakly compatible systems of rank n); PMCS §1.6 (compatible system predicates).

<a id="constituents-potentially-automorphic"></a>
### 2.36 Constituents of polarized systems are potentially automorphic (Proposition 5.4.6)

For CM F and pure extremely regular totally odd polarized weak system `(ℛ,ℳ)`,write `r_λ=⊕_αr_{λ,α}` irreducibly. For rational l in a Dirichlet-density-one set and `λ|l`,one finite CM Galois F′/F makes every `(r_{λ,α},µ_λ)|F′` irreducible/automorphic.

API: `TauCeti.PotentialAutomorphy.constituents_potentially_automorphic`.

Proof route: PMCS §1.22’s polarized-constituent lemma (BLGGT 5.4.5; v1 5.2.3), density-one residual irreducibility and the Fontaine–Laffaille criterion [§2.1], then [§2.26] with all constituent residual kernels in the avoidance field.

Residual-kernel avoidance preserves constituent irreducibility over F′.

([BLGGT], §5.4, Lemma 5.4.5 and Prop. 5.4.6, pp. 76–77.)

*Needs:* [§2.1] (pd criteria); PMCS §1.22 (essentially self-dual constituents); PMCS §1.21 (density-one residual irreducibility).

<a id="cg18-conditional-potential-modularity"></a>
### 2.37 Conditional potential modularity of elliptic curves over arbitrary number fields (Calegari–Geraghty, Theorem 1.1(1))

Assuming complete [§2.7] (local/amplitude/boundary/level clauses),every elliptic E over any number field F is potentially modular. This proves an implication,not the conjectural premise.

API: `TauCeti.PotentialAutomorphy.cg18_potentialModularity`.

Proof route: [§2.31], CG 5.16 and the Harris–Shepherd-Barron–Taylor tensor-product reduction.

This gives potential modularity; descent to F is an additional assertion.

([Calegari–Geraghty](#ref-cg-2018), Thm. 1.1(1), §1, p. 3 = Invent. p. 300; proof §10, pp. 96–98 = Invent. pp. 428–429.)

*Needs:* [C-LOCAL-DEFORMATION] (the exact lifting targets of Layer 2).

<a id="potential-weak-automorphy-symmetric-powers"></a>
### 2.38 Potential weak automorphy of symmetric powers of rank-two systems over CM fields (BCGNT Theorem 6.2.4)

For imaginary CM F,strongly irreducible rank-two very weak R,`HT={0,m}`,`m≥2`,`det r_λ=ε^{−m}`,and `v₀∉S`,each `n≥1` admits finite CM `F_n/F`,Galois over `ℚ`,making `Sym^{n−1}R` weakly automorphic,level prime to `v₀`. Auxiliary input: semistable `A/ℚ`,good ordinary at `q>2nm+1`,surjective mod-q image,and ACC+ automorphy of `Sym^{nm−1}A` over CM `F₆`.

API: `TauCeti.PotentialAutomorphy.weakAutomorphy_symPower`.

Proof route: [§2.24](#p-r-switch), the CM-induced system and ACC+ 7.1.11/[§2.39] elliptic seed; Moret–Bailly supplies auxiliary data.

([BCGNT], Thm. 6.2.4 and proof (incl. the elliptic curve `A/ℚ` and the automorphy of `Sym^{nm−1}ρ_{A,q}|G_{F₆}`), §6.2, pp. 64–68 (published pp. 57–61).)

*Needs:* [§2.27]; [§2.39]; PMCS §§2.8–2.10 and 2.23.

<a id="acc-elliptic-symmetric-powers"></a>
### 2.39 Potential automorphy of the symmetric powers of a non-CM elliptic curve over `ℚ` (ACC+, Corollary 7.2.4)

For finite `𝓜⊂ℤ_{>0}`,non-CM `E/ℚ`,finite good primes `𝓛` and finite `F^avoid/ℚ`,obtain finite Galois `F₂^avoid/ℚ` disjoint from `F^avoid` and totally real Galois `F^suffices/ℚ` unramified above `𝓛`/disjoint from `F^avoid` `F₂^avoid`. Every finite totally real `F′/F^suffices` disjoint from `F₂^avoid` admits,for all `m∈𝓜`,weight-zero RAC polarizable `GL_{m+1}` `π`,unramified above `𝓛`,with `Sym^mH_{E,ℓ}|G_{F′}≅r_{l,ι}(π)` for all l,`ι`. No all-characteristic ordinarity is claimed.

API: `TauCeti.SymmetricPower.acc_ellipticSymPowers`.

Proof route: [§2.27] on elliptic symmetric powers twisted by induced CM characters to be symplectic, then the residual Dwork lift.

([ACC+], §7.2.1, Cor. 7.2.4, pp. 205–206 (Annals pp. 1100–1101); proof pp. 206–208 (Annals pp. 1101–1103).)

*Needs:* [§2.2].

<a id="compatible-system-l-function-continuation"></a>
### 2.40 Meromorphic continuation, functional equation and purity for compatible systems (Corollary 5.4.3)

For the regular irreducible totally odd polarized weakly compatible system of [§2.35], BLGGT 5.4.2: (1) each `L^S(ιℛ,s)`, `ι:M↪ℂ`, converges uniformly absolutely on right-half-plane compacta and continues meromorphically; (2) `ℛ` is strictly pure and `Λ(ιℛ,s)=ε(ιℛ,s)Λ(ιℛ∨,1−s)`; (3) for totally real F, odd n and `v|∞`, `tr r_λ(c_v)=±1` independently of `λ`.

API: `TauCeti.PotentialAutomorphy.lFunction_meromorphic`.

Proof route: potential automorphy, pure local–global comparison and Brauer induction give strict purity and the product of automorphic L-functions/functional equations (HSBT10 4.2); rank-one trivial factors retain poles. For (3) use Taylor 2012’s Calegari observation.

`Γ/ε` are PMCS §1.15’s coherent factors, beyond weak good-prime compatibility. An elliptic system over a totally real field recovers its functional equation.

([BLGGT], §5.4, Cor. 5.4.3 and proof, pp. 74–75.)

*Needs:* PMCS §1.15 (system L-functions); PMCS §1.16 (Galois Grothendieck ring); AG2.2; AL.2; `Matrix.trace`.

<a id="part-of-compatible-system"></a>
### 2.41 A potentially diagonalizable polarized representation lies in a compatible system (Theorem 5.5.1)

For CM F,`l≥2(n+1)`,`ζ_l∉F`,totally odd RA polarized rank-n `(r,µ)`,PD above l with cyclotomically irreducible reduction,r belongs to a strictly pure compatible system over F.

API: `TauCeti.PotentialAutomorphy.exists_compatibleSystem`.

Route: §2.26 with component/kernel avoidance,soluble descent,5.3.1 component independence and Brauer induction in PMCS §1.16’s Grothendieck ring. The virtual criterion `(A,A)=1`,`dim A≥0` makes constituents genuine irreducibles; pure WD/independent traces (2.1.1,1.3.6) give strict compatibility.

Check: use the exact virtual-character criterion `(A,A)=1` and `dim A≥0`.

([BLGGT], §5.5, Thm. 5.5.1 and proof, pp. 79–81.)

*Needs:* [§2.26], CM potential automorphy; §2.33 for the totally real specialization; PAI Layer 2, soluble automorphy comparisons; PMCS §1.16 (Galois Grothendieck ring); PMCS §1.17, `monodromy_component_field`, including `componentKernelIndependent` and constituent coefficient descent; AG2.2.

<a id="patrikis-taylor-potential-automorphy"></a>
### 2.42 Simultaneous potential automorphy of pure regular polarized systems

For finite Galois CM `F/F₀`,finite Galois `F^avoid/F` and finitely many pure regular totally odd polarized weak systems `(R_i,M_i)`,after coefficient extension decompose `R_i`≅`⊕_jR_{i,j}`. Use **one** finite CM F′/F,Galois over `F₀`,disjoint from `F^avoid`,makes every polarized `R_{i,j}` RACP-automorphic; `R_i` is isobaric. Neither irreducibility nor extreme regularity is needed. In PT,CM includes totally real: Thm. A gives totally real Galois automorphy extensions for pure regular odd essentially self-dual systems,symplectic with odd or orthogonal with even multiplier. Multipliers are compatible rank-one systems.

API: `TauCeti.PotentialAutomorphy.patrikisTaylor`. Route: CM full coefficient fields;1.6 polarizes pure constituents at conjugation-invariant primes. Positive-density Chebotarev meets density-one residual irreducibility/large FL bounds; apply §2.26 simultaneously avoiding all kernels/cyclotomy,then §2.41 and semisimple Frobenius reconstruction. This removes PMCS’s extreme-regularity restriction.

**Checks.**

- A reducible pure regular system may have several cuspidal constituents; its direct sum is not declared cuspidal.
- Regularity alone, without purity, does not provide the conjugation-invariant-prime polarization lemma.
- Two systems use the same returned F′, not two unrelated extensions.
- The avoidance field is over F and disjointness is over F; Galoisness is over `F₀`.
- Extreme regularity is not reintroduced in the proof.

([Patrikis–Taylor], Lemma 1.6, p.9; Thm. 2.1 and proof pp.12–13; Thm. A p.2. [Fresán–Sabbah–Yu](#ref-fsy-2022) Thm. 5.38 is an application, not the primary proof.)

*Needs:* PMCS §§1.7–1.8, compatible-system operations, and §1.21, residual irreducibility; Chebotarev, Layer 10.

<a id="irreducibility-density-one"></a>
### 2.43 Irreducibility of `r_{l,ı}(π)` for density-one l (Theorem 5.5.2)

For CM F and extremely regular RAC polarizable `GL_n` `π`,`r_{l,ι}(π)` is irreducible for all l in a Dirichlet-density-one set and every `ι:Q̄_l≅ℂ`.

API: `TauCeti.PotentialAutomorphy.irreducible_density_one`.

Proof route: [§2.36] and Brauer induction make the self-Rankin–Selberg pole order `−j` for j constituents; AL.3 makes it `−1`, hence `j=1`.

The pole at the fixed point `s=1` requires equality of unitary cuspidal representations, not merely a nontrivial norm twist.

([BLGGT], §5.5, Thm. 5.5.2 and proof, pp. 81–82.)

*Needs:* AL.3; PMCS §1.16 (Galois Grothendieck ring).

<a id="elliptic-symmetric-power-seed"></a>
### 2.44 An automorphic symmetric-power seed for the auxiliary elliptic curve (Qian Proposition 4.1; ACC+ Corollary 7.2.4)

In §2.19,obtain finite Galois `F₂^avoid/ℚ` and totally real Galois `F^suff/ℚ` unramified above N,with `F₂^avoid∩F^avoid=ℚ`,`F^suff∩F^avoid` `F₂^avoid=ℚ`,`ℚ̄^{ker r̄_{E,l′}}⊂F₂^avoid`,and both avoidance fields unramified above N. For every finite totally real `F′/F^suff` disjoint from `F₂^avoid`,`Sym^{n−1}H_{E,ℓ′}|G_{F′}` is automorphic.

API: `TauCeti.PotentialAutomorphy.ellipticSeed`.

Proof route: [§2.39]; Qian verifies the extra ramification/disjointness data.

([Qian], Prop. 4.1 (second list and final assertion), §4, p. 21; proof p. 22.)

*Needs:* [§2.27].

<a id="multiple-product-l-functions"></a>
### 2.45 Tensor products of non-CM modular forms (Corollary 5.4.4)

For finite `K⊂ℤ_{>0}` with all `2^{#K}` subset sums distinct and non-CM weight-`(k+1)` newforms `f_k`,obtain totally real Galois `F/ℚ` and RAC polarizable `GL_{2^{#K}}` `Π` with `rec(Π_v|det|^{(1−2^{#K})/2})=(⊗_krec(π_{k,v|ℚ}|det|^{−1/2}))|W_{F_v}` almost everywhere. Hence `L(×_kπ_k,s)` is meromorphic on `ℂ`.

API: `TauCeti.PotentialAutomorphy.multipleProduct_meromorphic`.

Proof route: Goursat and distinct Hodge weights exclude diagonal identifications in the projective image, giving `SL₂^K` and irreducible tensor representation; apply [§2.35].

Check: {1,2,4} has all eight subset sums 0,…,7 distinct; {1,2,3} fails since `1+2=3`.

([BLGGT], §5.4, Cor. 5.4.4 and proof, pp. 75–76.)

*Needs:* [§2.40]; PMCS §§1.7–1.8 (linear algebra operations on systems).

<a id="decomposition-into-irreducible-systems"></a>
### 2.46 Splitting a polarized system into irreducible systems (Theorem 5.5.3)

Every pure extremely regular totally odd polarizable weak system over CM F decomposes `ℛ=⊕_iℛ_i` into irreducible strictly pure totally odd polarizable compatible systems.

API: `TauCeti.PotentialAutomorphy.eq_sum_irreducible_systems`.

Proof route: choose one sufficiently large unramified Fontaine–Laffaille prime in the residual-irreducibility/[§2.36] density-one sets; extend its constituents by [§2.41], use [§2.43], and compare Frobenius polynomials.

Check `s=1`: the decomposition is itself, with strict purity added.

([BLGGT], §5.5, Thm. 5.5.3 and proof, p. 82.)

*Needs:* PMCS §1.21 (density-one residual irreducibility).

<a id="dwork-fibre-automorphy-transport"></a>
### 2.47 Automorphy of the Dwork fibre at l′ and its transport to l (Qian §4)

At the chosen Dwork point `t∈F′` with its fixed projector,auxiliary lifting gives `V_{λ′,t}≅r_{l′,ι′}(π)` after the Teichmüller twist. Good polynomials lie in `ℚ(ζ_N)`,or its real subfield for `n=2`. Match `ι`,`ι′` there,conjugating `π` if needed; then `V_{λ,t}^ss≅r_{l,ι}(π)`. For Theorem1.1’s semisimple residual input this proves neither original-fibre semisimplicity nor ramified N compatibility. Absolute irreducibility of `χ̄₁⊗r̄|G_{F′}`,as in 1.4,makes `V_{λ,t}` irreducible and removes ss.

API: `TauCeti.PotentialAutomorphy.dworkTransport`.

Route: `ACC+6`.1.2 at l′ with ordinary regular/enormous/decomposed-generic/scalar hypotheses; symmetry traces and matched embeddings give Chebotarev/Brauer–Nesbitt transport. Saturated graded lattices preserve residual ss. §§2.11–2.12 supply coefficient-prime ordinarity separately from Steinberg slopes; irreducible reduction removes ss.

([Qian], §4, proof of Thm. 1.1, p. 24; [ACC+], §6.1, Thm. 6.1.2, hypothesis (5), p. 134 (Annals p. 1031); the theorem begins on arXiv p. 133; Lemma 3.10(4) and its proof, pp. 20–21; geometric explanation in §1, p. 4; [Qian's thesis], Remark 3.0.13, printed p. 55 (PDF p. 62).)

*Needs:* [§2.44]; [§2.2]; Chebotarev, Layer 10; PAI 5, §5.23 (ordinary automorphy lifting).

<a id="compatible-system-from-potential-automorphy"></a>
### 2.48 A potentially automorphic geometric `GSp_{2n}`-lift lies in a strictly pure compatible system (FKP, after BLGGT 5.5.1)

For totally real F,`n≥1`,geometric Zariski-dense `ρ:Γ_F→GSp_{2n}(O′)`,similitude `κ^{1−2n}`,retain FKP9.1’s `v₀` with regular nilpotent WD N (unramified Steinberg twist). If `ρ|G_{F′}≅r_ι(Π_{F′})` for RAESDC `Π` and Galois totally real F′/F,`ρ` extends to a strictly pure system over F at every `ℓ`,`ι′:ℂ≅Q̄_ℓ`. For density at **every** coefficient prime,use §2.28’s two-place variant: `v₀`,`v₁` away from original p,distinct residue characteristics,regular N at both. Compatible symplectic pairings and `ℓ`-independent formal character then force dense image for each member.

API: `TauCeti.PotentialAutomorphy.compatibleSystem_of_potentiallyAutomorphic`.

Proof route: [§2.41], Brauer induction and soluble descent. For each `ℓ` choose `q_j≠ℓ`: strict WD compatibility transports regular nilpotent monodromy. FKP’s regular-unipotent/symplectic argument leaves principal `GL₂` or `GSp_{2n}`; independent formal character excludes principal `GL₂` for `n>1` `(GSp₂=GL₂)`.

**Checks.**

- For `ℓ=q₀` use `v₁`; for `ℓ=q₁` use `v₀`; for `ℓ` outside `{q₀,q₁}` either place works.
- If `q₀=q₁`, the selection fails at that prime, explaining the distinct-characteristic requirement.
- The one-place construction alone still needs a separate comparison at its own residue characteristic.

GSp-valued refinement of [§2.41].

([FKP22], §9, proof of Prop. 9.1, pp. 42–43.)

*Needs:* [§2.28], including its simultaneous finite-place variant; PAI Layer 2, soluble automorphy comparisons.

<a id="patrikis-taylor-l-function-consequences"></a>
### 2.49 Strict purity and functional equations for pure regular polarized systems

For CM F,pure regular totally odd polarized weak `(R,µ)`,each `L^S(ιR,s)` converges uniformly absolutely on right-half-plane compacta and continues meromorphically. R is strictly pure,including coherent bad-place WD,and

```text
Λ(ιR,s)=ε(ιR,s) Λ(ιR∨,1−s).
```

This is the dual form of the functional equation; for an actual geometric self-duality `R∨≅R(w)`, it becomes the motivic reflection `s↦1+w−s`. It does not assert entireness for a system with trivial constituents. State `TauCeti.PotentialAutomorphy.patrikisTaylor_analytic` over every CM F, not only `ℚ`.

Proof route: [§2.42], Brauer induction/soluble descent for the single extension, and pure local–global comparison with retained real signs. PMCS §1.15 supplies general L-function operations; the local extension removes extreme regularity.

**Checks.**

- For the trivial line the function has its zeta pole.
- For `H¹` of an elliptic curve the geometric self-duality has `w=1` and the motivic center is 1.
- A weak good-prime system alone does not specify the ramified factors used in the completed equation.
- A regular but non-extremely-regular pure polarized system is within the theorem.

([Patrikis–Taylor], Cor. 2.2 and proof p.13; strict purity defined after Lemma 1.6, pp.9–10; Cor. 2.3 p.13.)

*Needs:* PMCS §§1.6, 1.15, strict systems and L-functions; AL, standard functional equations; PAI Layer 2, soluble base change.

<a id="qian-residual-potential-automorphy"></a>
### 2.50 Residual potential ordinary automorphy over CM fields (odd-prime case of Qian, Theorem 1.1)

For CM F,finite `F^av/F`,`n≥2`,odd prime l and continuous semisimple `r̄:G_F→GL_n(F_{l^s})`,some finite CM Galois F′/F disjoint from `F^av` makes r̄ ordinarily automorphic: a RAC `π` gives a lift `r≅r_{l,ι}(π)`,potentially semistable/ordinary with regular HT at all v|l. No polarization/oddness/image hypothesis is imposed.

API: `TauCeti.PotentialAutomorphy.qian_residual`.

Route: §§2.19,2.44,Dwork/Moret–Bailly and `ACC+6`.1.2 at l′; §2.47 transports global ss only. Negative valuation at l and §§2.10–2.12 give geometric potential semistability/regular flags and passage to ss (thesis3.0.13); saturated reduction recovers r̄. `ACC+5`.5.2 applies only in 1.4’s irreducible branch.

**Checks.**

- Reducible semisimple residual input is permitted; no adequacy premise is imposed.
- `l=2` is outside this target: the coefficient-prime Dwork sheaf and comparison in §§2.10–2.11 require `l∤2N`.
- A lift retains regular labelled Hodge numbers after global semisimplification by §2.12; auxiliary-prime WD alone does not establish ordinarity at l.

([Qian], Thm. 1.1, §1, p. 1, restricted here to odd l; proof §4, pp. 21–24; Lemma 3.10(4) and its proof, pp. 20–21; geometric explanation in §1, p. 4; [Qian's thesis], Remark 3.0.13, printed p. 55 (PDF p. 62).)

*Needs:* [§2.47](#dwork-fibre-automorphy-transport); [§2.20](#steinberg-ordinarity-lemma); PMCS §§2.8–2.10 and 2.23; [§2.2].

<a id="qian-ordinary-potential-automorphy"></a>
### 2.51 Potential automorphy of ordinary l-adic representations over CM fields (Qian, Theorem 1.4)

For CM F,finite `F^av/F`,`n≥2`,prime `l>n`,`ι:Q̄_l≅ℂ` and continuous finitely ramified `r:G_F→GL_n(Q̄_l)`,assume potentially semistable/ordinary regular HT at l; absolutely irreducible decomposed-generic r̄ with enormous cyclotomic image; scalar `r̄(σ)` for some `σ∉G_{F(ζ_l)}`. Some finite CM Galois F′/F disjoint from `F^av` makes r ordinarily automorphic.

The bound `l>n` is ACC+ 6.1.2(4), omitted from Qian v1’s Thm. 1.4 statement but required by its proof.

API: `TauCeti.PotentialAutomorphy.qian_ordinary`.

Proof route: [§2.50](#qian-residual-potential-automorphy) with avoidance enlarged by the residual kernel and `ζ_l`, then ACC+ 6.1.2 (PAI §5.23).

([Qian], Thm. 1.4, §1, p. 2; proof: last paragraph of §4, p. 26; [ACC+], Thm. 6.1.2, hypothesis (4), p. 134.)

*Needs:* [C-LOCAL-DEFORMATION] (the exact lifting targets of Layer 2); PAI 5, §5.23 (ordinary automorphy lifting).

<a id="imaginary-quadratic-elliptic-modularity"></a>
### 2.52 Modularity of elliptic curves over imaginary quadratic fields with `X₀(15)(F)` finite (Caraiani–Newton)

Assume §2.30’s data. If F is imaginary quadratic with finite `X₀(15)(F)`,e.g. `ℚ(√−d)`,`d=1`,2,3,5,every E/F is modular: parallel-weight-two cuspidal `GL₂` `π` with `L(E,s)=L(π,s−1/2)`,or `ψ⊞ψ^c` with the two Hecke factors when CM embeds in F. Separately,for CM Galois `F/ℚ`,`ζ₅∉F`,100% of height-ordered Weierstrass equations define modular elliptic curves.

Only the individual implication uses CNExceptionalCurveData(F); the density-one branch has no exceptional-curve hypothesis.

API: `TauCeti.WeightOne.ellipticCurve_modular_imagQuadratic`.

Proof route: [§2.6], the soluble residual seed [§2.29], and [§2.30] for the exceptional individual cases; [§2.29] also supplies the height-density argument.

([Caraiani–Newton], §1, Thm. 1.1 (Cor. 7.1.2), p. 2; §1, Thm. 1.2 (Cor. 6.1.2), p. 3.)

*Needs:* [C-LOCAL-DEFORMATION] (the exact lifting targets of Layer 2); PMCS §§2.8–2.10 and 2.23.

### Examples

For a finite collection of polarized systems the extension in simultaneous potential automorphy must be common to all members and disjoint from the one prescribed avoidance field. Separate extensions with no disjointness control cannot be substituted. In the elliptic seed `H_{E,ℓ}` has determinant `ε_ℓ⁻¹`; `Sym²` H has determinant `ε_ℓ⁻³` and Hodge numbers {0,1,2}. Qian’s determinant twists and the Dwork realization must be compared in this same convention.

### Dependencies

Use the exact supplier contracts and the prerequisites cited in this layer’s targets.

## Layer 3: classical-group packets and symplectic descent

<a id="theta-and-metaplectic-descent"></a>
### 3.1 Oscillator representations and local Howe duality

For nonarchimedean F, char `F≠2`, `E=F` or quadratic, W nondegenerate `(−ε)`-Hermitian and V nondegenerate `ε`-Hermitian, use MetaplecticAutomorphicForms Layers 0–3’s symplectic tensor space, Heisenberg/Stone–von Neumann representation for nontrivial `ψ`, metaplectic cover and dual-pair Weil representation with splitting characters. Odd orthogonal dimension retains the symplectic double cover/genuineness. For irreducible admissible `π`,big `Θ` is the maximal `π`-isotypic quotient `ω_ψ`↠`π⊠Θ_ψ(π)`; small `θ` its maximal semisimple quotient.

Howe duality: `θ_ψ(π)=0` or irreducible; `dim Hom(θ_ψ(π),θ_ψ(π′))≤δ_{π,π′}`,including residue characteristic2. Split quadratic-algebra GL uses Minguez; quaternionic pairs retain Gan–Takeda1.3’s Hermitian/unitary restrictions. No universal nonvanishing/big-lift irreducibility.

**API.**

- The supplied `oscillatorRepresentation / metaplecticCover` retain the Stone–von Neumann module and genuine cover action. Compare their polarized dimension-two group with `TauCeti.HeisenbergGroup` by the Check’s coordinate change.
- The supplied `WeilRepresentation / bigThetaLift / smallThetaLift` use the dual-pair restriction and the two quotients above.
- MetaplecticAutomorphicForms §3.7 supplies the qualified Howe duality just stated.
- `genuine_centralSign / globalThetaKernel`: central sign/rationally split kernel in stated convergence regimes.
- `realFockModel / pluriharmonicType / gaussianIntertwiner`: harmonic multiplicity/O(k) extension/highest-type comparison; `realCompactTheta_decomposition`: Hilbert decomposition below.
- `similitudeWeilAction / similitudeOscillator / theta_restrict_isometries`: `R₀`-action,compact induction,restriction/centre; `realPositiveSimilitudeExtension / realFullSimilitudeInduction`: positive subgroup/index-two induction.

Real `O(k)×Mp₂ₙ`,k,`n≥1`: construct `L²(Mₙ,ₖ)`,polynomial Fock module and KV-normalized `H=⋂ᵢⱼker(Σᵥ∂²/∂xᵢᵥ∂xⱼᵥ)`. For irreducible `O(k)`-type `τ`,`H(τ)` is harmonic multiplicity and `t(τ)` the inverse-left `GLₙ` module; nonzero `H(τ)` is irreducible,`τ↦t(τ)` injective,retaining determinant extension. Gaussian transform gives highest type `t(τ)⊗det^{−k/2}` and `L²=⊕̂_ττ⊠Lₖ(τ)`,pair multiplicity1,Mp multiplicity `dimτ`. Trivial `τ` dually has lowest type `(k/2,…,k/2)`; odd k retains the cover. Route: KV II.4.2,4.4–5;5.3–12;6.6–12;7.2 pp.27–28; general real uniqueness by Howe2.1 §§2–5 pp.537–550 joint harmonics/commutants.

Similitudes,`k=dimV` even,`dimW=2n`: `GSp⁺={g:λ_W(g)∈λ_V(GO(V))}`,`R=GO(V)×GSp⁺`,`R₀={λ_Vλ_W=1}`,`g₁=g diag(λ_W(g)⁻¹Iₙ,Iₙ)`. Set `ω(h,g)φ=|λ_V(h)|^{−kn/4}ω(1,g₁)(φ∘h⁻¹)`,`Ω=c-Ind_R₀^Rω`. Scalars `(t,t⁻¹)` act by `χ_V(t)^n`; lift centre=`χ_V^nω_π`. `R/R₀` may be infinite. Restriction sums isometry `Θ` over `π`’s constituents; Howe/multiplicity-free restriction gives nonzero small-lift uniqueness even at residue2 (Roberts3.3–5 pp.303–304; GT§2 pp.1847–1849). Odd k needs another cover.

Global lifts retain each theorem’s rational splitting/convergence/cuspidality. Definite real orthogonal multipliers are positive; extend Schwartz/Fock by change of variables/positive square root. Full GSp induces from its index-two positive subgroup; negative multipliers exchange holomorphic signs. Retain induction/centre at real consumers.

**Checks.**

- Cover kernel acts by−1;big `Θ` can have a radical while small `θ` is irreducible.
- Equal nonzero small lifts identify inputs;two zero lifts do not.
- Residue characteristic2 is included;field characteristic2 excluded.
- General quaternionic skew-Hermitian pairs are excluded.
- `n=k=1` even/odd Hermites give `O₁` types1/sgn,lowest `Mp₂` weights`½`,3/2;retain the cover.
- Generator=`½(−d²/dx²+x²)`,up to `ψ` sign. `TauCeti.hermiteFunction_oscillator` gives`2m+1`,hence weight `m+½`:even/odd m give lowest`½`,`3/2`. Integral weights violate genuineness.
- Polarized `F²`,char `F≠2:z=t+xy/2` converts symmetric cocycle⟨w,w′⟩/2 to `TauCeti.HeisenbergGroup F` law `z+z′+xy′`;commutator `xy′−x′y`,doubled without`½`.
- Trivial `O_k` type gives Gaussian(k/2,…,k/2);`SO_k` loses determinant type,which first occurs `n≥k` via a k-minor.
- `R₀` requires inverse multipliers;equal ones fail symplecticity. `(t,t⁻¹)` acts by `χ_V(t)^n`.
- Positive-definite real V has GO multiplier `ℝ₊`,`[GSp:GSp⁺]=2`;negative multipliers swap holomorphic signs.

([Gan–Takeda](#ref-howe-duality), §1 Thm. 1.2, pp.1–3; construction conventions §2 and proof §§3–5, pp.4–18; [Gan–Ichino], §2.2, published pp.974–975. [Kashiwara–Vergne](#ref-kashiwara-vergne), Chapter II §§1–7, pp.9–28; [Howe](#ref-howe-real), Thms. 1/1A/2.1 and §§2–5, pp.535–550; [Roberts](#ref-roberts-similitudes), §§2–4, pp.295–310; [Gan–Takeda, GSp₄], §2, pp.1846–1849.)

*Needs:* SR, smooth admissible representations and Jacquet functors; ReductiveGroups and OrthogonalSpinGroups, actual isometry groups; Fourier/Haar theory and harmonic analysis from AutomorphicSpectralTheory. MetaplecticAutomorphicForms §§0.1–0.18, 1.1–1.4, 2.1–2.7 and 3.1–3.7 supply the oscillator and isometry-pair objects; this section specifies their normalization and the real and similitude comparisons used below.

<a id="weighted-trace-classification-inputs"></a>
### 3.2 Weighted stabilization and local intertwining comparisons

`TraceClassificationInputs`: invariant trace formula,smooth matching,TWFL (MW II.4.4),Arthur3.2.1’s twisted weighted stabilization for `GL_N⋊θ`/even SO,and appropriate normalized LIR. Import ordinary AS.6/ET§§4.7,4.10,5.2,6.18; own weighted distributions/transfer/stabilization. TWFL remains a premise,not a consequence of ordinary matching or this construction.

Fix `(G̃,ω)`,measures,transfer factors,Levis,archimedean K-finiteness. Define `J_M̃^G̃` by (G,M)-weights,I by proper-Levi subtraction,`I^E` by stable transfer with i(M̃,M′),retaining global Weyl quotients. Target `I=I^E` for every proper Levi and geometric/discrete spectral stabilization,with distinct constant-term/weighted-transfer operations.

Construct cuspidal error `ε_M̃^G̃(f)` from `I−I^E` via local Paley–Wiener off exceptional elements; transfer equals transferred constant term times `ε(M′,δ)`,whose global elliptic sum is zero. Route: two-place globalization,endoscopic separation,proper-Levi induction/convergent multipliers (MW X§§3.4,5.9,7.1–7.7).

Prove `ε=0` by imaginary/real scalar comparison,global zero sums/base change and split-torus `(1−θ)µ` coboundaries (MW§§3.5–3.9). `θ`/induction/meromorphic continuation near unitarity gives weighted characters; nonrelevant data give zero (§§4.5–4.8).

Prove `I_disc(ω,f)=Σ_{G′}i(G̃,G′)SI_disc^{G′}(f^{G′})`,refined at `V⊃V_ram`,infinitesimal `ν`,spherical `c^V`,in the Grothendieck group over relevant unramified data/preimages `(ν′,c′^V)`. Route: MW X§8.1 pp.106–108,§§8.5–8.6 pp.112–113; two-place approximation/class-field globalization and §9 hypercohomology `T_sc→(1−θ)T`,norm compactness/product formula extend twisting characters.

AGIKMS1.10.5: quasi-split odd SO,Sp,even orthogonal (outer conventions retained),U over nonarchimedean char-zero F. Assume1.10.4: endoscopic identities/LIR for tempered G-parameters and all strictly smaller standard dimensions. Co-tempered `ψ` gives a multiplicity-free packet/two character identities. For co-tempered Levi `ψ_M=ψ_t⊕`⋯`⊕ψ_1⊕ψ_0` with irreducible conjugate-self-dual GL summands,and each irreducible induced `π`,
`⟨ũ,π̃_M⟩R_P(w_u,π̃_M,ψ_M)|_π=⟨s_u,π⟩_ψ id`.
Retain ũ/Whittaker/endoscopic normalization. 1.10.2/1.10.7 give Arthur’s distribution identity;1.8.1/1.9.1 compare Whittaker/twisted-GL operators. No general inner-form extension.

Normalize meromorphic intertwiners by adjoint Artin `L/ε: Sym²` for odd SO,`∧²` for Sp/even SO,signed Asai for U,including unitary `λ`/trace `ψ`. Route: multiplicativity/global functional equations/`ψ`-variation (AGIKMS1.8.1,A.4); twisted-GL standard-module composites descend to the multiplicity-one Langlands quotient (§§3.3–3.5,1.9.1). Descend regular composites before specializing a singular auxiliary operator.

Co-tempered packets swap tempered `SL₂` factors and apply the signed induction/Jacquet Aubert complex:
`⟨ŝ,π̂⟩_φ̂=(−1)^{r(φ)−r(φ⁺)−r(φ⁻)}⟨s,π⟩_φ`,`φ=φ⁺⊕φ⁻`,r counting paired conjugate-dual norm-diagonal blocks (§4.1 pp.80–81). Route: endoscopic Aubert compatibility/highest derivatives/gap-free supercuspidals (5.1.2,§§5.2–5.4).

LIR route: maximal parabolics,opposite signs,multiplicity-one non-tempered Jacquet quotient (§§6.4–6.5),Artin telescoping (§7.3). Keep intertwining `γ_A(s,ρ)=ε(s,ρ)L(1+s,ρ)/L(s,ρ)`,even-SO outer comparison,and1.10.4. Removing even repeated blocks can leave co-tempered scope: use4.5.3,smaller7.6.1,and all three cases §§7.4–7.6.

**API.**

- `NormalizedSelfIntertwiner / parameterNormalizerLift`: induced module/lift/Whittaker/transfer choices.
- `endoscopicCharacterIdentity / coTemperedPacket`: packet/two identities under1.10.4.
- `coTempered_localIntertwining`: scalar equality on each irreducible summand.
- `weightedStabilizationInputs`: the global formulas’ weighted/matching/stabilization premises.
- `weightedOrbitalIntegral / invariantWeightedDistribution / endoscopicWeightedDistribution`: J,I,`I^E` with descent/product splitting.
- `weightedErrorMap / weightedErrorScalar / globalizeEllipticDatum`: error/scalar/two-place construction; `weightedError_zero / weightedSpectralTransfer / refinedDiscreteStabilization`: vanishing,weighted characters,`(ν,c^V)`-refinement.
- `AubertComplex / aubertPairingSign`: signed complex/pairing; `standardModuleIntertwiner_descent / highlyNonTemperedSummand`: quotient/Jacquet constructions.

**Checks.**

- Identity Weyl element gives normalized operator/character1.
- Multiplying unnormalized intertwiners by−1 changes scalars.
- Aubert co-tempered construction alone gives no unitarity(1.10.6).
- General inner/archimedean forms are outside this AGIKMS theorem.
- Unweighted matching does not imply weighted transfer.
- `M̃=G̃` gives weight1/ordinary orbital integral;torus needs no proper-Levi subtraction,positive rank needs it/Weyl coefficients.
- Error has zero proper constant terms,zero unramified-FL scalar,zero prescribed elliptic global sum;ordinary matching gives none.
- Stabilization fixes infinity/unramified Hecke characters and relevance;dropping either refinement fails.
- Aubert swaps `GL₂` Steinberg/one-dimensional dual and parameter `SL₂` factors;odd blocks among m of that Weil type change pairing by−`(−1)^m`,even blocks+1.
- Standard modules compare through multiplicity-one quotients/Jacquet constituents;a regular composite does not permit evaluating auxiliary poles.
- Nontrivial unramified Artin characters cancel with inverses;trivial ones retain pole order;even repeated blocks need smaller non-co-tempered packets. Initial almost-supercuspidal signs do not cover these.

([AGIKMS], Thms. 1.8.1 p.27 and 1.9.1 p.28; Lemma 1.10.2, Hypothesis 1.10.4 and Thm. 1.10.5, pp.31–33; operator comparisons §§2–3, pp.33–78; sign Cor. 4.4.5, p.91, and Cor. 4.5.3, p.97; packet and LIR proofs §§5–7, pp.97–137; Appendix A.2/A.4, pp.139–145. [MW X](#ref-mw-spectral), local error and vanishing §§3.2–3.9, pp.12–37, weighted characters §§4.5–4.8, pp.61–66, spectral reduction §5.9 p.81, restricted stabilization and globalization §§7.1–7.7 pp.89–105, final stabilization §§8.1,8.5–8.6 pp.106–108,112–113; [Arthur], Hypothesis 3.2.1 p.137.)

*Needs:* AutomorphicSpectralTheory AS.6; ET §§4.7,4.10,5.2,6.18 and its actual tempered packet/transfer exports; SR, normalized induction and Jacquet modules; [TWFL], as a hypothesis. The additional inner-form/archimedean comparisons needed by a particular classification must accompany that classification; this local theorem supplies neither by itself.

<a id="langlands-shahidi-analytic-inputs"></a>
### 3.3 Twisted square factors on the unitary boundary

Throughout §§3.3–3.4, 3.9 and 3.14, S is a finite set of places containing every archimedean place and every ramified place of all representations and characters involved. Every partial-factor API carries this finite admissible-set hypothesis; independence quantifies only over such sets.

For number field F,`m≥1`,unitary cuspidal `GL_m` `π`,unitary Hecke `χ` and finite admissible S,continue `L^S(s,π,Sym²⊗χ)`,`L^S(s,π,∧²⊗χ)` meromorphically,matching AL§4’s unramified factors. Shahidi1.1 gives no zeros on `Re s=1`,allowing poles (order`≤0`),for arbitrary m,`χ`,even quadratic `χ` without a Hecke square root.

For `m=2n` and `π≅π∨⊗χ⁻¹`, factor `L^S(s,π×π⊗χ)` into these two square factors. Their nonpositive orders sum to `−1`, hence exactly one has a simple pole at 1 and the other is holomorphic/nonzero there. For `m=4` this is BCGP 8.3.2 p.247.

Route: Belt5.2/6.2’s exterior integral/local nonzero choices (2.2),entire in odd rank/1 in rank one; divide Rankin–Selberg for symmetric continuation and identify on the initial half-plane. Shahidi gives boundary nonvanishing; division alone gives no holomorphy at denominator zeros.

**API.**

- `twistedSquareContinuation / twistedSquare_boundary_nonzero`: continuation/nonvanishing of those factors,allowing prescribed poles.
- `localCoefficient_changeCharacter`: additive-character transport.
- `square_rankinSelberg_factorization / square_poleOrder_atOne`: tensor factorization/additive-order pole dichotomy.

**Checks.**

- The empty exterior square of a rank-one character has factor 1.
- For a `GL₂` parameter diag(`α`,`β`), the exterior factor is `(1−αβχ(ϖ)q⁻ˢ)⁻¹`, while the symmetric factor has the three roots `α²`,`αβ`,`β²`.
- A simple pole at `s=1` satisfies boundary nonvanishing and fails holomorphy.
- Nonpositive integral orders summing to `−1` must be `(−1,0)` or `(0,−1)`; orders `(−2,1)` would require a zero and fail boundary nonvanishing.
- A nonsquare quadratic `χ` must not be silently rewritten as a twist `π⊗χ₀`.
- Taking S to be all places makes both products 1, so it is excluded even for a unitary elliptic cuspidal representation with trivial centre.

([Shahidi 1997](#ref-shahidi-1997), Thm. 1.1 p.312, even-rank proof §2 pp.313–317, odd-rank reduction §3 pp.317–320 and the completed functional equation Thm. 4.1 p.321; [Belt](#ref-belt-square), Thm. 2.2 p.5, proofs pp.30–32 and 36–37; Thm. 5.2 and proof pp.41–42, Thm. 6.2 p.45; [BCGP], proof of Prop. 8.3.2 p.247.)

*Needs:* AL.4, unramified L-group factors, and AL.3, Rankin–Selberg continuation/poles; SR, normalized induction and meromorphic intertwiners; AutomorphicSpectralTheory, Eisenstein-series functional equations. The integral continuation comparison is owned here; AL.4 supplies its unramified Euler factors.

<a id="self-dual-cuspidal-type"></a>
### 3.4 Symplectic and orthogonal type of a self-dual cuspidal representation

For unitary self-dual cuspidal `π` on `GL_N(𝔸_F)`, with finite admissible S as in §3.3, define symplectic/orthogonal type by a pole at 1 of `L^S(π,∧²)/L^S(π,Sym²)`. Exactly one occurs. Symplectic type forces even N and `ω_π=1`. Arthur 1.5.3 identifies the generic twisted-endoscopic source: split `SO_{N+1}` for symplectic type, `Sp_{N−1}` for odd orthogonal N, and quasi-split `SO_N` attached to `ω_π` for even orthogonal N.

The type is independent of the finite admissible S: the finitely many changed local factors are holomorphic and nonzero at 1.

- `TauCeti.Arthur.IsSymplecticType`: `∧²` pole at1.
- `TauCeti.Arthur.IsOrthogonalType`: `Sym²` pole at1.
- `TauCeti.Arthur.selfDual_type_dichotomy`: exactly one for unitary self-dual cuspidals.
- `TauCeti.Arthur.IsSymplecticType.even`: N even.
- `TauCeti.Arthur.IsSymplecticType.centralCharacter_eq_one`: `ω_π=1`.
- `TauCeti.Arthur.IsSymplecticType.independent_of_S`: pole independent of admissible S.
- `TauCeti.Arthur.selfDualType_iff_transfer`: symplectic iff simple generic split-`SO_{N+1}` transfer (Arthur1.5.3).

Proof route: self-Rankin–Selberg’s simple pole, the square factorization and boundary nonvanishing; Arthur 1.5.3 identifies the source group.

**Checks.**

- `N=1: χ²=1` gives orthogonal type, `L(χ²)=ζ_F^S` with a pole; `∧²χ=0`.
- `N=2`: cuspidal `ω_π=1` gives symplectic type since `∧²π=ω_π`.
- The unitary elliptic `π_E` on `GL₂/ℚ` is symplectic, with or without CM.
- For this `π_E`, omitting all places makes both square products 1 and loses the pole; that infinite S is outside the definition.
- Order-three `χ` is not self-dual; `L(χ²)` and `L(∧²χ)=1` have no pole.

Quadratic `GL₁` characters are orthogonal; trivial-central-character cuspidal `GL₂` is symplectic; non-self-dual inputs have no type.

([Arthur], §1.5, Thm. 1.5.3 and the paragraph before it, pp. 47–48 (2011 manuscript).)

*Needs:* For the pole dichotomy, [§3.3] and AL.3–AL.4. For `selfDualType_iff_transfer`, additionally [§3.17] and its trace hypotheses.

<a id="gan-takeda-llc-gsp4"></a>
### 3.5 The local Langlands correspondence for `GSp₄` (Gan–Takeda)

For nonarchimedean char-zero K,`rec_GT` maps Irr `GSp₄(K)` surjectively/finite-to-one to `GSp₄(ℂ)`-conjugate `WD_K` parameters: (i) essentially discrete iff no proper Levi; (ii) fibre indexed by `Â_φ`,`A_φ=π₀(Z(Imφ)/Z_GSp₄)=1` or `C₂`,with exactly one generic member (trivial character) in the latter; (iii) similitude=`ω_π`; (iv) `rec_GT(π⊗χ∘ν)=φ_π⊗χ`; (v) for generic or non-supercuspidal `π`,all `GL_r` twists match Shahidi `γ/L/ε`; (vi) nongeneric supercuspidals match Plancherel measures; (vii) a generic member exists iff `L(s,adφ)` is holomorphic at1; (viii) (i),(iii),(v),(vi),`r≤2`,determine `rec_GT` uniquely. BCGP uses `rec(χ)`,`rec(ω_π)` in (iii)–(iv); Roberts–Schmidt principal-series parameters agree (GT2011b13.1).

Transport complex coefficients to `Q̄_p` through the fixed `ι` as in [§3.7].

API: `TauCeti.Arthur.recGT`.

Proof route: theta for `GO₄/GO₆` and `GL₂/GL₄`/inner-form LLC, `γ`-factors, then Roberts–Schmidt’s principal-series comparison (Gan–Takeda 2011b 13.1).

BCGP 2.4.6 check: `χ₁×χ₂⋊σ` is irreducible iff `χ₁`,`χ₂`,`χ₁χ₂^{±1}≠|·|^{±1}`; each constituent has `rec_GT(π)^{ss}=σ⊗(χ₁χ₂⊕χ₁⊕χ₂⊕1)`, characters via `Art_K⁻¹`.

([BCGP], §2.3, p. 18; Proof of Prop. 2.4.22, §2.4.21, p. 25; [Gan–Takeda, GSp₄], Main Thm., parts (i)–(vii), pp. 1842–1843; discussion following it, p. 1843.)

*Needs:* SR §SR.5.2; GL2T R16.3; [§3.1].

<a id="orthogonal-sign-kernel"></a>
### 3.6 The determinant constraint on sign vectors

For finite I,`d_i∈ℕ`,define ker(`Σ_i`(`d_i` mod2)`s_i`)⊂`(ℤ/2)^I`. Via `s_i↦(−1)^{s_i}`,this is `∏sign_i^{d_i}=1`,the orthogonal determinant-one constraint **before** central quotient. A singleton odd block gives zero; all-even dimensions give the full sign group.

- `TauCeti.Arthur.orthogonalSignKernel`: The actual additive subgroup cut out by the weighted mod-two sum.
- `TauCeti.Arthur.orthogonalSignKernel_mem_iff`: Membership is exactly the weighted sum being zero.
- `TauCeti.Arthur.orthogonalSignKernel_even`: If every `d_i` is even the subgroup is the full function group.
- `TauCeti.Arthur.orthogonalSignKernel_one_odd`: For I a singleton and d odd the subgroup is zero.

Construction: kernel of the weighted additive sum; reduce dimensions mod 2 for the comparisons.

**Checks.**

- For one dimension-three summand the kernel is zero.
- The empty index set has the full (already trivial) sign group.
- For two odd-dimensional summands membership is `s₀=s₁`.
- For dimensions (1,2), membership is exactly `s₀=0`; the even block’s sign remains free.

([Arthur], §1.4, (1.4.8)–(1.4.9), p. 35, 2011 manuscript.)

*Needs:* Mathlib finite lists, integers, polynomials and finite-dimensional linear algebra in the stated scope.

<a id="gsp4-galois-l-packet"></a>
### 3.7 The L-packet `L(ρ)` of a `GSp₄`-valued local Galois representation, and `n(π)`

Fix `ι:ℂ≅Q̄_p` for each p,transporting positive-real square roots. For finite `K/ℚ_l`,`p≠l`,and continuous `ρ:G_K→GSp₄(Q̄_p)`,`L(ρ)` consists of irreducible smooth `π` with `rec_{GT,p}(π⊗|ν|^{−3/2})≅WD(ρ)^{F-ss}`,using §3.5 transported by `ι`. Define `n(r,N)=rankN` and `n(π)` via `rec/rec_GT` for `GL_n/GSp₄`. BCGP uses `ι`-independence only for unramified packets and Iwahori monodromy ranks.

- `TauCeti.LanglandsRegister.GSp4.lPacketOf`: `L(ρ)` above.
- `TauCeti.LanglandsRegister.GSp4.mem_lPacketOf`: the displayed `rec_GT` criterion.
- `TauCeti.LanglandsRegister.GSp4.lPacketOf_twist`: `L(ρ⊗χ)=L(ρ)⊗(χ∘Art∘ν)`.
- `TauCeti.LanglandsRegister.GSp4.lPacketOf_nonempty`: cardinality1 or2.
- `TauCeti.LanglandsRegister.monodromyRank`: rankN via `rec/rec_GT`.

Construction: coefficient-transport `rec_GT`; Satake parameters give unramified independence, Roberts–Schmidt tables give Iwahori monodromy-rank independence.

**Checks.**

- Unramified `ρ` with roots `q^{3/2}α_i` gives Satake parameters `α_i`; q is the residue cardinality.
- Unramified `π` has `n(π)=0`.
- `GSp₄` Steinberg has `n(π)=3` and regular nilpotent N.
- A tempered `A_φ=ℤ/2` packet has two members, exactly one generic.

Unramified check: `χ₁×χ₂⋊σ` matches `ρ` with Satake parameters scaled by `q^{3/2}`; `q=9` gives 27 even when coefficient prime `p=5`.

([BCGP], Def. 2.3.1, §2.3 PDF p.19; Remark 2.3.2, §2.3, p. 19; §2.3, after Remark 2.3.3, p. 19.)

*Needs:* ClassFieldTheory, Layer 7; GL2T R16.3

<a id="global-arthur-parameter"></a>
### 3.8 Discrete global Arthur parameters of a quasi-split classical group

Discrete global `ψ=⊞_iµ_i⊠ν_{b_i}`: unitary self-dual cuspidal `GL_{m_i}` `µ_i`; `ν_b=SL₂` irrep of dimension b; `Σm_ib_i=N`; distinct pairs; parity matching `Ĝ` (symplectic `Ĝ`: symplectic `µ`/odd b or orthogonal `µ`/even b; orthogonal `Ĝ`: reverse); `∏ω_{µ_i}^{b_i}=η_G`. Denote `Ψ₂(G)`,or `Ψ̃₂` modulo outer automorphism for even SO; generic means all `b_i=1`. `S_ψ` is the sign group,restricted by `∏s_i^{m_ib_i}=1` for special-orthogonal `Ĝ`,then quotiented by `Z(Ĝ)^Γ`. Arthur (1.5.6)–(1.5.7) defines `ε_ψ` from the adjoint decomposition’s symplectic constituents with root number−1. Localize via GL LLC to `ψ_v:L_{F_v}×SL₂→{}^LG`.

F a number field, `𝔸_F` its adèles; G a quasi-split symplectic or special orthogonal group over F (`Sp_{2n}`, split `SO_{2n+1}`, or quasi-split `SO_{2n}` attached to a quadratic character `η_G`), whose dual group Ĝ has a standard representation of dimension N (`N = 2n + 1`, 2n, 2n respectively).

- `TauCeti.Arthur.GlobalParameter`: the finite multiset/conditions above.
- `TauCeti.Arthur.GlobalParameter.IsGeneric`: all `b_i=1`.
- `TauCeti.Arthur.GlobalParameter.componentGroup`: determinant kernel then central quotient.
- `TauCeti.Arthur.GlobalParameter.signCharacter`: `ε_ψ:S_ψ→{±1}`.
- `TauCeti.Arthur.GlobalParameter.localize`: `⊕rec(µ_{i,v})⊗ν_{b_i}`.
- `TauCeti.Arthur.GlobalParameter.toIsobaric`: `⊞_iSpeh(µ_i,b_i)` on `GL_N`.
- `TauCeti.Arthur.GlobalParameter.ofSelfDualCuspidal`: simple generic parameter from unitary self-dual cuspidal `µ` of Ĝ’s type,`ω_µ=η_G`.
- `TauCeti.Arthur.GlobalParameter.signCharacter_generic_trivial_of_rootNumbers`: `ε_ψ=1` when its symplectic `ε(1/2,µ_i×µ_j)=1`; in particular for generic `ψ`.

Proof route: tensor-product parity and the centralizer compute the sign group. In `Ad∘ψ=⊕_α λ_α⊗µ_α⊗ν_α` retain multiplicities; (1.5.7) gives `ε_ψ(s)=∏ det λ_α(s)` over symplectic `µ_α` with `ε(1/2,µ_α)=−1`. `SL₂` multiplicities preclude an unweighted pair product. Generic `ψ` has trivial `ε_ψ`.

**Checks.**

- For `SO₃≅PGL₂`, dual `Sp₂`, `ψ=1⊠ν₂` is discrete with `S_ψ=1`; packet identification is a separate theorem.
- For `SO₃`, cuspidal unitary `GL₂` `μ` gives `μ⊠ν₁` iff `ω_μ=1`, using self-duality/exterior-square comparison.
- `SO₁` has only the empty parameter.
- Repeated `μ⊠ν₁` is not discrete: multiplicity freeness is required.
- Two quadratic lines `χ⊠ν₁⊞χ′⊠ν₁` have orthogonal parity, so fail the dual-`Sp₂` condition.
- For dual `SO₃`, one dimension-three orthogonal `b=1` block has determinant-one kernel `{+1}`; the unrestricted formula wrongly gives `ℤ/2`.

For `SO₃≅PGL₂`, `1⊠ν₂` is discrete with trivial-representation packet; generic parameters are cuspidal `GL₂` with trivial central character.

([Arthur], §1.4, (1.4.3)–(1.4.9), pp. 30–35; §1.5, (1.5.6)–(1.5.7), pp. 46–47 (2011 manuscript); [Mok15], §2.3, p. 15.)

*Needs:* [§3.4]; AL.3 (strong multiplicity one); AL.3 (Rankin–Selberg boundary nonvanishing); SR §SR.5.2.

<a id="gsp4-discrete-spectrum-types"></a>
### 3.9 Discrete automorphic representations of `GSp₄`: symplectic type, general type and transfer

Discrete `π` means occurrence in fixed-centre `L²_disc(GSp₄)`; all cuspidals qualify. For unitary cuspidal `GL₄` `Π`, unitary `χ` and finite admissible S as in §3.3, symplectic multiplier `χ` means that `L^S(s,Π,∧²⊗χ⁻¹)` has a pole at1; this is independent of the finite admissible S and implies `Π≅Π∨⊗χ`. Import ET §11.1's general-type transfer, rank-four pole alternative and all-place parameter comparison under `GSp4ClassificationInputs`. A general-type `π` has that cuspidal transfer `Π`,multiplier `ω_π`,with `std∘parameter(π_v)=rec(Π_v)` everywhere (GT finite,LLC infinite). This section constructs the six-family bookkeeping and normalization adapters: (a)–(f) are general,Yoshida,Soudry,Saito–Kurokawa,Howe–Piatetski-Shapiro,characters. Their `S_ψ` are 1,`C₂`,1,`C₂`,`C₂`,1; `ε_ψ` can be nontrivial only in SK with `ε(1/2,π⊗η⁻¹)=−1` (GT6.1.4).

Here F is totally real, `GSp₄` split, `ν` its similitude and `ω_π` the fixed central character.

- `TauCeti.Arthur.GSp4.IsDiscrete`: fixed-centre `L²_disc` occurrence.
- `TauCeti.Arthur.GSp4.IsSymplecticTypeWith`: the twisted `∧²` pole above.
- `TauCeti.Arthur.GSp4.IsGeneralType`: cuspidal symplectic transfer of multiplier `ω_π`.
- `TauCeti.Arthur.GSp4.transfer`: adapter to ET §11.1's unique general-type transfer with `GSp4ClassificationInputs`; transport its local parameters through the fixed GT/`recᵀ` normalizations. Track norm twists when using a nonunitary algebraic normalization.
- `TauCeti.Arthur.GSp4.IsSymplecticTypeWith.selfDual`: `Π≅Π∨⊗χ`.
- `TauCeti.Arthur.GSp4.ArthurType`: six families.
- `TauCeti.Arthur.GSp4.isGeneralType_iff_typeA`: general iff (a).

Transfer shapes: (a) cuspidal `χ_π`-self-dual; (b) distinct `GL₂` cuspidals `µ₁⊞µ₂` with `ω_{µ_i}=χ_π`; (c) `µ|·|^{1/2}⊞µ|·|^{−1/2}`, `µ` cuspidal `χ_π`-orthogonal: `µ∨⊗χ_π≅µ`, `L^S(s,Sym²µ⊗χ_π⁻¹)` has a pole at 1, and `ω_µ/χ_π` is nontrivial quadratic; equivalently `µ=AI_{E/F}(η)`, `η≠η^c`, `η|_{𝔸_F×}=χ_π`; (d) `λ|·|^{1/2}⊞λ|·|^{−1/2}⊞µ`, `ω_µ=λ²=χ_π`; (e),(f) sums of Hecke characters. At infinity use archimedean LLC.

**Checks.**

- A Yoshida transfer `μ₁⊞μ₂` of distinct weight-two newforms with equal centre is discrete, not general type.
- `χ∘ν` is discrete type (f), with transfer `χ|·|^{3/2}⊞χ|·|^{1/2}⊞χ|·|^{−1/2}⊞χ|·|^{−3/2}`.
- For non-dihedral/non-tetrahedral `π`, `Sym³π` is cuspidal symplectic with multiplier `ω_π³` ([§1.13]).
- Twisting a Soudry datum by η changes the multiplier to `χ_π η²`; the GL₂ constituent need not remain ordinarily self-dual when `η²≠1`.
- For `GSp₂=GL₂`, every cuspidal `Π` is symplectic with multiplier `ω_Π` since `∧²Π=ω_Π`.
- For a unitary elliptic cuspidal input, S equal to all places removes the exterior-square zeta pole; every pole/type API excludes this infinite S.

Non-endoscopic genus-two Siegel forms of weight `(k,j)≥(3,0)` give general type; Yoshida lifts give (b).

([BCGP], §2.9, p. 38; §2.9, definition of general type, p. 38; [GT19], Remark 6.1.4, p. 35.)

*Needs:* ET §11.1 with `GSp4ClassificationInputs`, unitary cuspidal Π and unitary multiplier; [§3.4]; [§3.5]; [AutomorphicLFunctionsAndLocalFactors, Representation prerequisites: archimedean GL_n parameters](../AutomorphicLFunctionsAndLocalFactors/README.md).

<a id="weight-22-abelian-variety-conjecture"></a>
### 3.10 Conjecture: weight (2,2) Siegel eigenforms come from abelian varieties with real multiplication (conjectural endpoint)

WeightTwoTwoConjecture: every stable general-type cuspidal genus-two weight-(2,2) Siegel eigenform/`ℚ` with trivial finite similitude/central nebentypus in the fixed cohomological normalization has totally real E,degree n,and abelian `M/ℚ`,dim2n,`E↪End_ℚ(M)⊗ℚ` and a polarization whose Rosati involution fixes E, whose `E_λ`-eigenspace Galois realizations equal the form’s. CG§5.4 offers this heuristic to exclude minimal lifts of type `U₃`,`σ=(2,2)`; no proof uses it.

The stable/general-type restriction excludes CAP/endoscopy with rank-one constituents; this precise comparison is a frontier specification of the source’s heuristic.

- `TauCeti.LanglandsRegister.WeightTwoTwoConjecture`: The proposition stated.
- `TauCeti.LanglandsRegister.WeightTwoTwoConjecture.dim`: Under the conjecture, `dim M = 2`[E : ℚ].
- `TauCeti.LanglandsRegister.WeightTwoTwoConjecture.semistable_unipotent`: Under the conjecture, inertia at a semistable prime acts with `(σ − 1)² = 0` (Grothendieck), so type `U₃` cannot occur.

Define the proposition.

**Checks.**

- The abelian variety has dimension 2[E:ℚ] and four-dimensional `E_λ` eigenspaces, not total Tate rank two.
- A cubic Dirichlet twist `χ∘ν` retains infinity weight and general type, but changes the rank-four determinant to `χε⁻²`; it fails the trivial finite nebentypus condition. A polarized real-multiplication H¹ eigenspace has determinant `ε⁻²`.
- `n=1` predicts abelian surfaces for rational-eigenvalue weight-(2,2) forms.
- A size-three unipotent block with `(σ−1)²≠0` after finite extension violates square-zero semistable abelian inertia.

Paramodular forms attached to abelian surfaces give known examples; potential modularity proceeds in the reverse direction.

([Calegari–Geraghty](#ref-cg-2020), §5.4 'Torsion classes', publ. p. 831; quoted from arXiv v1 §5.4 p. 24 PDF p.31.)

*Needs:* [§3.7].

<a id="regular-weight-serre-implies-abelian-surface-modularity"></a>
### 3.11 A regular-weight Serre conjecture for `GSp₄` implies modularity of abelian surfaces over `ℚ` (BCGP 2025, Lemma 10.4.1)

Assume: for every p and absolutely irreducible `ρ̄:G_ℚ→GSp₄(F̄_p)`,multiplier `ε̄⁻¹`,with `(ρ̄|G_{ℚ_p})^ss` a character sum,there is ordinary cuspidal `GSp₄` `π` of regular weight,level prime to p,centre `|·|²`,and reduction `ρ̄`. Then every abelian surface/`ℚ` is modular. The premise is conjectural;10.4.2 permits weaker,e.g. sufficiently-large-p,versions.

Also retain the classification hypotheses [Trace inputs].

For the classification-dependent conclusion assume TWFL and the [Trace inputs].

API: `TauCeti.LanglandsRegister.abelianSurface_modular_of_serre`.

Proof route: choose an absolutely irreducible ordinary-type residual prime, apply the premise, and move regular weight to parallel weight two by BCGP Hida theory/modularity lifting.

The rank-two analogue is [CSM R27.6](../ClassicalSerreModularity/README.md).

([BCGP, modularity], Lemma 10.4.1, §10.4, p. 222; Remark 10.4.2, p. 222.)

*Needs:* [§3.7]; [TWFL].

<a id="mok-unitary-classification"></a>
### 3.12 Endoscopic classification for quasi-split unitary groups (Mok)

For quadratic number fields `E/F` and quasi-split `U(N)`,discrete `ψ=⊞µ_i⊠ν_{b_i}` uses distinct unitary conjugate-self-dual cuspidal `GL_{m_i}` pairs,total dimension N,and summand sign `(−1)^{N−1}` under `ξ_{χ₊}`. At every place packets/pairings satisfy endoscopic identities; tempered packets give LLC. Globally `L²_disc=⊕_{ψ∈Ψ₂(G,ξ_{χ₊})}⊕_{π∈Π_ψ(ε_ψ)}π`,with packet **multisets** retaining repeats. Mok2.5.3 gives multiplicity one for generic `ψ` only.

Fix a Whittaker datum; retain Arthur/Mok’s external classification hypotheses.

Assume TWFL together with the [Trace inputs] in the group and parameter scope of this assertion.

API: `TauCeti.Arthur.mok_multiplicity_formula`.

Proof route: stabilized twisted `Res_{E/F}GL_N` comparison with `U(N₁)×U(N₂)`. Mok 2.5.2 uses packet multisets; 2.5.3 gives multiplicity one only for generic parameters.

At `N=1` recover conjugate-orthogonal `µ` with `µ|𝔸_F×=1` and Hilbert 90/Pontryagin duality on U(1).

([Mok15], §2.5, Thm. 2.5.2 and Remark 2.5.3, pp. 34–35.)

*Needs:* [§3.8]; [TWFL]; AutomorphicSpectralTheory, Layer AS.6 (invariant trace formula).

<a id="extended-langlands-parameter"></a>
### 3.13 Extended Langlands parameters `(ϱ, χ_ϱ)` of a p-adic classical group

For nonarchimedean char-zero F and quasi-split classical G° (Sp,SO,U),parameters are admissible `ϱ:W_F×SL₂→{}^LG`° up to Ĝ°-conjugacy. `S_ϱ=π₀`(Cent(`ϱ`)/`Z(Ĝ°)^Γ_F`) is elementary abelian2. Extended parameters are `(ϱ,χ_ϱ)`,`χ_ϱ∈Ŝ_ϱ`. After §3.15, Whittaker-normalized Arthur/Mok gives Irr(G°)≃Lang(G°),with fibre `Π_ϱ`; even SO retains outer orbits.

- `TauCeti.Arthur.ExtendedParameter`: A pair `(ϱ, χ_ϱ)` with `χ_ϱ` a character of `S_ϱ`.
- `TauCeti.Arthur.ExtendedParameter.parameter`: The underlying Langlands parameter `ϱ`.
- `TauCeti.Arthur.ExtendedParameter.character`: The character `χ_ϱ` of `S_ϱ`.
- `TauCeti.Arthur.componentGroup_elementaryAbelianTwo`: `S_ϱ` is an elementary abelian 2-group.
- `TauCeti.Arthur.lPacket_equiv_characters`: For G° quasi-split, LL restricts to a bijection `Π_ϱ ≃ Ŝ_ϱ`.
- `TauCeti.Arthur.ExtendedParameter.generic_iff`: For tempered `ϱ`, the generic member of `Π_ϱ` (for the fixed Whittaker datum) is the one with `χ_ϱ = 1`.

Construction: every positive-multiplicity good-parity summand contributes `O(m_i)`, even when `m_i` is even. Odd multiplicity instead controls the central element. First apply the SO determinant relation and central quotient to define the component group and enhancements. After §3.15 constructs tempered packets, use them and Langlands classification to prove the packet bijections and generic-member theorem, retaining the outer/enhancement conventions.

**Checks.**

- For `G°=SL₂`, odd p, Klein-four image in `SO₃` gives `S_ϱ=(ℤ/2)²` and packet size four.
- For split `SO₂≅GL₁`, `S_ϱ=1`; modulo the even-orthogonal outer action, `Lang(G°)=Hom(F×,ℂ×)/(χ∼χ⁻¹)`.
- For `SL₂`, dihedral `Ind_{W_E}^{W_F}θ` with `θ/θ^c` nonquadratic gives `S_ϱ=ℤ/2` and packet size two, unlike `GL₂`.
- For unramified tempered `Sp_{2n}` parameter with distinct standard characters, `S_ϱ=1` and the packet is unramified.

For `Sp₂=SL₂`, a Klein-four image in `SO₃` has `S_ϱ≅(ℤ/2)²` and four supercuspidals (Labesse–Langlands).

([KSS21](#ref-kss-2021), §1.20, p. 8; p. 604 in the version of record.)

*Needs:* For parameter/component definitions, [§3.8], SR §SR.5.2, ReductiveGroups Layers 6–8 and ReductiveGroupsPartII RG2.5. The packet bijections and generic-member assertion additionally need [§3.15] and §3.12 for unitary groups.

<a id="shahidi-exterior-square"></a>
### 3.14 Twisted exterior-square L-functions at `s = 1` (Shahidi)

For unitary cuspidal `GL_{2n}` `Π` (including `GL₄`), unitary `ω` and finite admissible S as in §3.3, `L^S(s,Π,∧²⊗ω)` at1 has either a simple pole or finite nonzero limit; pole iff symplectic multiplier `ω⁻¹`. If cyclic prime-degree `BC_{F′/F}Π` stays cuspidal,at most one quotient-character factor `L^S(s,Π,∧²⊗ωψ)` has a pole at1; all others have nonzero limits. S also contains the ramification of the extension and all quotient characters. No assertion excludes poles elsewhere on `Re s=1`.

Belt 5.2 supplies even-rank meromorphic continuation and at-most-simple poles, retaining norm-character shifts; Shahidi 1.1 supplies nonvanishing. Two pole-producing quotient twists would force a self-twist contradicting cuspidality of `BC(Π)`.

API: `TauCeti.Arthur.exteriorSquare_nonvanishing`.

Proof route: [§3.3], Rankin–Selberg factorization/self-duality and unramified cyclic factorization; [§3.9] gives the pole criterion.

This is the descent input of BCGP 8.3.2, p.247.

**Checks.**

- In rank two with `ω_Π=1` and `ω=1`, the exterior factor is the partial zeta function and has a simple pole.
- For that same Π, S equal to all places would give factor 1 and invalidate the pole criterion; the finite hypothesis excludes it.
- A quotient-character twist is tested with the same finite S containing its ramification; changing S by finitely many admissible places preserves the pole order.

([BCGP], Proof of Lemma 8.3.2, §8.3, p. 247.)

*Needs:* AL.4.

<a id="local-arthur-packets"></a>
### 3.15 Local Arthur packets and the local Langlands correspondence for quasi-split classical groups (Arthur, Theorem 1.5.1)

For char-zero local F,quasi-split `Sp_{2n}`,`SO_{2n+1}`,`SO_{2n}`,fixed Whittaker datum and Arthur `ψ:L_F×SL₂→{}^LG` bounded on `L_F`,construct finite unitary packet multiset `Π̃_ψ` (even-SO outer orbits) and pairings with `S_ψ: (a)` `Σ_π`⟨`s_ψ`,`π`⟩`f_G(π)` is stable and transfers the twisted `GL_N` character; (b) for every factoring endoscopic (G′,s),`f′(ψ′)=Σ_π`⟨`s_ψx`,`π`⟩`f_G(π)`; (c) if `ψ=φ` has trivial Arthur `SL₂`,`Π̃_φ` is tempered,a set with injective pairing (bijective for p-adic F),and these packets partition the tempered dual.

Retain Arthur’s external hypotheses, including the announced [A24]–[A27] inputs.

Assume TWFL together with the [Trace inputs] in the group and parameter scope of this assertion.

API: `TauCeti.Arthur.localPacket`.

Proof route: Arthur Chapters 2–7, twisted transfer/induction using exactly [Trace inputs].

Identities (a),(b): Arthur 2.2.1 §2.2 pp.65–66; packet/tempered claims: 1.5.1. A tempered `S_φ=1` packet is singleton; `SL₂`-type sizes are 1,2,4.

([Arthur], §1.5, Thm. 1.5.1 and the paragraph before it, pp. 41–43 (2011 manuscript; Thm. 1.5.1 on p. 42); §1.5, after Thm. 1.5.1, pp. 42–43 (2011 manuscript); [Mok15], §2.5, Thm. 2.5.1 PDF p.32.)

*Needs:* [§3.13], only its parameter/component-group definitions; [TWFL]; SR §SR.5.2.

<a id="kmsw-inner-forms"></a>
### 3.16 Endoscopic classification for inner forms of unitary groups (Kaletha–Mínguez–Shin–White)

For extended pure inner twist `Ξ` of `U_{E/F}(N)`,KMSW1.6.1 gives bounded-tempered packets with `Ξ`-pairing/refined identities: bijection to `Irr(S_φ^♮,χ_Ξ)` nonarchimedean; over `ℝ` only the union over specified pure inner forms is bijective. For global **pure** inner twist/generic discrete `ψ`,the `ψ`-spectrum sums `Π_ψ(G,Ξ,ε_ψ)`. Nongeneric/general-inner Thm.*1.7.1 additionally assumes at every place Chapter5’s local classification (3.6.3) and LIR (Thm.*2.6.2).

Fix E/F, quasi-split Whittaker datum and `Ξ` with `χ_Ξ`. Retain Mok/Arthur’s external hypothesis; nongeneric/general-inner scope additionally retains both named local inputs at every localization.

Assume TWFL together with the [Trace inputs] in the group and parameter scope of this assertion.

API: `TauCeti.Arthur.kmsw_multiplicity_formula`.

Proof route: KMSW’s trace comparison and extended-pure-inner-twist theory, using Mok. The printed proved global scope is generic/pure-inner; the stated non-tempered extension remains conditional.

The quasi-split specialization is [§3.12].

([KMSW14], §1.6.1, Thm.* 1.6.1 and the sentence before it, p. 80; Thm.* 1.6.1(5), pp. 80–81; Thm.* 1.7.1 and discussion, p. 89; Chapter 5 and Thm. 5.0.5, pp. 205–206.)

*Needs:* [TWFL].

<a id="arthur-multiplicity-formula"></a>
### 3.17 Arthur's multiplicity formula for quasi-split classical groups (Theorem 1.5.2)

For §3.8’s G,
`L²_disc=⊕_{ψ∈Ψ̃₂(G)}⊕_{π∈Π̃_ψ(ε_ψ)}m_ψπ`.
Here `Π̃_ψ=⊗′_vΠ̃_{ψ_v}`,unramified/trivially paired almost everywhere; `ψ_v∈Ψ̃⁺_unit` may be unbounded,using Arthur(1.5.1)–(1.5.2)’s bounded-case extension. `Π̃_ψ(ε_ψ)` imposes `∏_v⟨·,π_v⟩|S_ψ=ε_ψ`. Multiplicity `m_ψ=2` exactly for even N,`Ĝ=SO_N`,all `m_ib_i` even; otherwise1. Every discrete `π` has `ψ`/isobaric `GL_N` transfer; generic `ψ` corresponds to transfers that are sums of distinct self-dual cuspidals.

The group, discriminant character and standard dimension are precisely those of [§3.8].

Assume TWFL together with the [Trace inputs] in the group and parameter scope of this assertion.

API: `TauCeti.Arthur.multiplicity_formula`.

Proof route: Arthur 2.2.1 §2.2 pp.65–66 and Chapters 3–8; [§3.15] supplies the same local pairings. Global normalized intertwiners and Rankin–Selberg root numbers compute `ε_ψ`.

`SO₃≅PGL₂: 1⊠ν₂` gives the trivial representation and generic parameters give cusp forms; no multiplicity-one claim for restricted `SL₂` packets follows.

([Arthur], §1.5, Thm. 1.5.2 and (1.5.3)–(1.5.7), pp. 45–48 (2011 manuscript).)

*Needs:* [TWFL]; AutomorphicSpectralTheory, Layer AS.6 (invariant trace formula).

<a id="vogan-packets-so-v"></a>
### 3.18 Vogan packets for odd special orthogonal groups of all quadratic spaces

For char-zero local F,`φ:L_F→Sp_{2n}(ℂ)`,and `(2n+1)`-dimensional quadratic V of trivial discriminant,possibly empty `Π_φ(SO(V))` partition Irr SO(V). Across V the packet is indexed by `Ŝ_φ`,`S_φ=π₀Cent_{Sp_{2n}}φ`; `σ_η` on V requires `η(z_φ)=ε(V)`,normalized Hasse–Witt,also sufficient nonarchimedean/complex. Members are square-integrable iff `φ` is multiplicity-free/good-parity,and tempered iff `φ` is tempered.

The split case uses Arthur; the nonsplit case uses Mœglin–Renard’s inner-form classification inputs (Ishimoto proves the generic scope).

For the classification-dependent conclusion assume TWFL and the [Trace inputs].

API: `TauCeti.Arthur.voganPacket_so`.

Proof route: [§3.15] for the split form, inner-form local intertwining/endoscopic identities for the nonsplit form; Gan–Ichino (5.3) records the combined statement.

At `n=1` the discrete packet across forms is the `PGL₂` discrete series and its Jacquet–Langlands transfer to `D×/F×`, indexed by `Ŝ_φ≅ℤ/2`.

([Gan–Ichino], §5.2, (5.3), p. 17; published p. 987; §1.2, p. 4; published p. 969.)

*Needs:* [§3.13]; [TWFL].

<a id="xu-gsp2n-packets"></a>
### 3.19 Xu's packets for general-rank symplectic similitude groups

For char-zero local F,`n≥1`,`G=Sp_{2n}`,`G̃=GSp_{2n}`,bounded `φ` and extension `ζ̃` to `Z_G̃(F)` of `Π_φ`’s centre,let `C(φ,ζ̃)` be tempered G̃-irreducibles with this centre/restriction constituents in `Π_φ`. Put `X=Hom(G̃(F)/Z_G̃(F)G(F),ℂ×)`; dual boundary `α:S_φ→X` has `S_{φ̃}=kerα`. Use component groups reduced by invariant dual centre (Xu§2.2),not unreduced centralizers.

Choose refined `Π_{φ̃}⊂C`,unique up to X-twist,with disjoint `C=⨆_{ω∈X/α(S_φ)}Π_{φ̃}⊗ω`. Restriction identifies `Π_{φ̃}` with `Π_φ/G̃(F)`; constituent Arthur characters restrict to its `S_{φ̃}`-pairing,injective (bijective p-adic,not on one real form). Packet character sum is stable. For endoscopic `(G′,φ′)→(φ,s)`,`ω=α(s)`,stable transfer equals the weighted `(id,ω)`-twisted packet character,intertwiners normalized on `Z_G̃(F)G(F)` by Xu(4.3); `ω=1` gives (4.4). Each member’s X-self-twists equal `α(S_φ)`.

`φ̃` labels a refinement up to twist,not a canonical dual lift. Real packets agree with Langlands; normalized Levi induction/positive exponents extends to `Φ⁺_unit`,including generic-global localizations without Ramanujan. Xu’s common-similitude products of Sp/quasi-split even SO have the same construction,retaining `Σ₀`-outer orbits and stabilizer `α(S_φ^{Σ₀})` for even SO.

Assume TWFL and the [Trace inputs] for these groups and their endoscopic and Levi groups.

**API and construction.**

- `xuCoarsePacket / xuTwistGroup / xuBoundary`: C,X,`α`; `boundary_kernel`, `restriction_orbits`, `selfTwist_iff_boundary`; `ζ̃` remains input.
- `xuPacket`: chosen refinement; `xuPacket_twist_decomposition`, `xuPacket_restrict`, `xuPacket_pairing`: the displayed comparisons,retaining that choice.
- `xuPacket_stable / xuPacket_twisted_transfer`: distribution identities with matching tests,normalized intertwiners/compatible Haar measures.
- `xuPacket_parabolic / xuPacket_real / xuPacket_projective`: `Φ⁺_unit`,real LLC,PGSp descent for `ζ̃=1`.

Route: Xu§§2.1–2.2 pp.4–14,4.1/2/4 pp.26–27 Clifford/boundary theory;6.2 pp.59–60 Levi induction;6.18–23 pp.70–75 globalization preserving the local component group,with trivial lifted global component group and strong multiplicity one at the chosen place;quadratic exceptions,`Z_G̃G`-normalization/product restriction. Stable characters:6.4 pp.60–61. Own these constructions.

**Checks.**

- `GSp₂=GL₂` has singleton refined packets but possibly nontrivial self-twists: their cardinalities differ.
- An unramified member has trivial pairing; changing its centre leaves `C(φ,ζ̃)`.
- `α(S_φ)` fixes every member; characters outside it give disjoint refinements. Keep the quotient.
- Real packets on one form give injection, not the p-adic bijection; even-SO outer orbits need further data to select members.
- `ζ̃=1` gives `PGSp_{2n}`. For `n=3` this recovers [Gan–Savin] §7(a)–(e) pp.22–23’s `PGSp₆/Sp₆` packets and quadratic ambiguity. `Spin₇` lifts remain noncanonical; the `G₂` specialization has extra data.

At `n=2` compare [§3.5] with the twist ambiguity. Source: [Xu, local](#ref-xu-local), 4.4/4.6/4.7 pp.26–27; proof §§6.1–6.4 pp.59–75, arXiv v4.

*Needs:* [§3.15]; [§3.13]; [TWFL].

<a id="adams-johnson-construction"></a>
### 3.20 Adams–Johnson induction and parameter data

For connected real reductive G,compact Cartan T,maximal compact K,Cartan involution and `θ`-stable `q=l+u`,let L centralize a compact torus. Datum: actual unitary character `ξ` of L,`λ=dξ`,chosen positive Levi roots,`ρ_q=ρ(l)+ρ(u)`,and `Re⟨α,λ+ρ_q⟩≥0` for `α∈u`. Construct `A(q,ξ)=R_q^S(ξ)`,`S=dim_ℂ(u∩k)=½dim(k/(l∩k))`,with Harish–Chandra module/unitary globalization. In this weak good range, induction is zero or irreducible unitary; strict good range gives nonzero irreducibility. The full AJ parameter datum has its separate nonvanishing hypotheses. Retain `ξ` and inner-form transport; its differential alone is insufficient.

AJ parameter data additionally contain admissible `{}^LL→{}^LG` and `ψ`-factorization with central `ℂ×` image,principal `SL₂`,and `ψ∘j` corresponding to the specified quasi-split L* character. AJ§2.5 transports it to admissible real Levis; choose q satisfying the range. Packet: resulting nonzero `A(q,ξ)` up to actual isomorphism,with finite indexing map and no assumed injective component pairing. AMR adds regular-integral/classical-group hypotheses separately. Noncompact Cartan uses AJ§10’s `M=Z_G(A)` reduction/normalized induction.

**API.**

- `AJInductionDatum / AJParameterDatum`: q,`ξ`,range,embedding,all transported by conjugation.
- `zuckermanModule / weakGoodRange_zero_or_unitary_irreducible / goodRange_nonzero`: degree-S induction, the zero-or-irreducible-unitary alternative, and strict-good-range nonvanishing, with infinitesimal `λ+ρ_q` whenever nonzero.
- `ajPacket / ajPacket_membership / ajPacket_innerForm`: double-coset indexing/inner transport,without injective component-pairing assumption.

Import AF §5.4’s derived cohomological-induction complex and AF §§6.1–6.5’s Harish–Chandra/root/chamber/cohomological foundations; own the weak-good-range extension and its comparison with AJ parameter data.

**Checks.**

- Compact `G: q=g`,`u=0`,`S=0`, so induction returns `ξ`.
- A failed range inequality on proper `θ`-stable q does not imply irreducibility.
- For compact `SU₂`, L=T and q a Borel, the integral unitary character `λ=−ρ` gives zero shifted root pairing and zero induction: the singular `O(−1)` case on `ℙ¹` has no cohomology. Thus weak good range alone gives no nonvanishing.
- Characters on disconnected L with equal differential remain distinct.
- Packet size may exceed component-group size; indexing gives no general injectivity.
- `ψ∘j` and `ψ` retain different `SL₂` data.

([Vogan, *Unitarizability of certain series of representations*](https://www.math.utah.edu/~ptrapa/math-library/vogan/vogan-unitarizability-annals-1984.pdf), Thms. 1.2–1.3, p.142, for weak-good-range induction and strict-range nonvanishing; [Adams–Johnson], (2.1)–(2.2) p.277, Lemma 2.5 and character transport pp.278–280, Defs. 2.9/2.11 and Lemma 2.10 p.281, §3 pp.285–287, and §10 Thm. 10.3/Prop. 10.4 pp.305–308, for the AJ data and packet construction.)

*Needs:* AF §5.4, the derived induction complex, and §§6.1–6.5, Harish–Chandra modules and real cohomology; EnhancedDerivedSheaves E0/E5, derived functors; the weak-good-range and AJ comparisons specified here; [actual local parameter objects](#contract-c-arthur).

<a id="adams-johnson-packets"></a>
### 3.21 Archimedean Arthur packets of cohomological parameters are Adams–Johnson packets

For quasi-split real Sp,SO,U and full AJ87 parameter `ψ`,AMR1.1 identifies Whittaker-normalized stable AJ twisted transfer with the twisted `GL_N` character of `Stdψ`. Hence Arthur’s packet equals the AJ multiset `A_q(λ)`,with CT’s multiplicity-one consequence. Use §3.20’s full definition: AMR§8.1’s regular-integral,centralizer-Levi,unitary-character/principal-`SL₂` consequences alone are insufficient.

Global applications retain the external classification hypotheses; non-quasi-split nongeneric KMSW applications retain both of its actual local inputs.

**Checks.**

- `L=T` gives discrete series; `L=G` has `u=0` and one Weyl double coset, giving its character.
- Regular integral infinitesimal character does not repair a failed root inequality.
- Without compact Cartan use §10, not its compact-Cartan formula.

Assume TWFL together with the [Trace inputs] in the group and parameter scope of this assertion.

API: `TauCeti.Arthur.adamsJohnson_eq_arthurPacket`.

Proof route: AMR 1.1 at the full AJ87 scope, tempered spectral transfer and standard-module resolutions; compare the actual [§3.20] induction multisets.

Chenevier–Taïbi (5.2.1): for `Sp_{2g}`, `ρ_k` with `k_g>g` belongs iff `d_{i₀}=1`, with their specified packet character.

([CT20], §5.2.1, p. 303 (published); [Ichino–Prasanna](#ref-ichino-prasanna-2023), §11.2, p. 70; published p. 81; [AMR](#ref-amr-2018), Thm. 1.1, §1, printed p. 3; [Adams–Johnson], (2.1)–(2.2), p. 277, (2.5), pp. 279–280, Def. 2.9, Lemma 2.10 and Def. 2.11, pp. 280–281; §3, pp. 285–286; §10, Thm. 10.3 and Prop. 10.4, pp. 305–308.)

*Needs:* [§3.15]; [§3.12]; [§3.20] (discrete series); [TWFL].

<a id="moeglin-renard-packets"></a>
### 3.22 Arthur packets of `Sp_{2g}(ℝ)` containing scalar unitary highest weight modules (Mœglin–Renard)

For `Sp_{2g}(ℝ)`,`ψ=ψ_u⊕⊕_jδ_{t_j}⊠R[a_j]`,`ψ_u=⊕_iχ_i⊠R[a′_i]`,`χ_i=1/sgn`,`a′_i` odd,one or three unipotent summands,`t_j>0`,`t_j+a_j` odd,set `a(ψ_u)=max a′_i`. For `0≤k≤g` require infinitesimal character `{k−1,…,k−g,−(k−1),…,−(k−g),0}`. Then `π_g(k)∈Π_ψ` iff either (i) `dimψ_u=1`,`2k>g+1`,and closed intervals `[(t_i−a_i+1)/2,(t_i+a_i−1)/2]` are disjoint; or (ii) `ψ=(sgn^{(2g+1−a(ψ_u))/2}⊠R[a(ψ_u)])⊕ψ′`,`ψ′` for compact `O(0,2g+1−a(ψ_u))`,whose packet has finite-dimensional `E_{ψ′}` with Howe lift `π_g(k)`. Occurrence has multiplicity1. For `k≥1`,the theta branch has `a(ψ_u)=2(g−k)+1` or `+3`,the latter requiring`2k≥g+2`. Packet character18.3 is separate.

MR uses highest K-type `(−k,…,−k)`; positive-lowest holomorphic forms use contragredients,transporting parameter/packet. The decomposition/infinitesimal-character hypotheses above are mandatory; global applications retain classification premises.

Assume TWFL together with the [Trace inputs] in the group and parameter scope of this assertion.

API: `TauCeti.Arthur.moeglinRenard_packet`.

Proof route: Mœglin–Renard 7.1–7.2 with the full displayed parameter conditions, AF §§6.3–6.5’s modules, and [§3.1]’s real compact-theta/Fock comparison.

**Checks.**

- `g=1`,`k=0: ψ=1⊠R`[3] contains trivial `π₁(0)` via O(0,0); the first branch fails `2k>g+1`.
- `g=2`,`k=2: ψ=1⊕δ₁⊠R`[2] has infinitesimal character `{1,0,0,0,−1}`, `dim ψ_u=1`,`4>3` and interval `[0,1]`; `π₂(2)` occurs once. Here `dim δ₁=2`.
- The same `ψ` matches `π₂(1)`’s infinitesimal character but not its packet: `2≤3` and `a(ψ_u)=1` differs from 3,5. Infinitesimal character alone fails.

Application: Chenevier–Taïbi’s small-weight level-one Siegel counts.

([CT20], §5.2.2, pp. 303–305 (published); §5.2.2, case (H), p. 305 (published); [Mœglin–Renard](#ref-moeglin-renard-2018), Thms. 7.1–7.2, §7, p. 19; notation and contragredient convention §1, pp. 1–6.)

*Needs:* [§3.15]; AF §§2.1–2.7 and 6.1–6.5 (discrete series); [TWFL].

<a id="amf-nonsplit-so-v"></a>
### 3.23 Arthur's multiplicity formula for non-split odd orthogonal groups, generic parameters (Gan–Ichino's hypothesis (6.1))

For number field F and `dimV=2n+1`,`discV=1`,the near-equivalence decomposition `L²_disc(SO(V))=⊕_ΦL²_Φ` ranges over **all** elliptic A-parameters. For **generic** `Φ` only,GI(6.1) gives `L²_Φ=⊕_ηm_ηΣ_η` through Vogan packets,`m_η=1` iff `Δ*η=1`,else0. Split uses Arthur;nonsplit uses the stated generic inner-form classification.

For nonsplit SO(V), retain Gan–Ichino (6.1)/§3.1 and the generic inner-form classification (Ishimoto).

Assume TWFL together with the [Trace inputs] in the group and parameter scope of this assertion.

API: `TauCeti.Arthur.multiplicity_formula_so_nonsplit`.

Proof route: [§3.17] in the split case; inner-form trace comparison and [§3.18] in the nonsplit case.

Gan–Ichino’s `Mp_{2n}` Thm. 1.4 retains this hypothesis.

([Gan–Ichino], §6.2, (6.1), p. 22; published p. 993; §3.1, p. 10; published p. 977.)

*Needs:* [§3.16](#kmsw-inner-forms); [TWFL].

<a id="packet-member-irreducibility"></a>
### 3.24 Irreducibility of the induced representations building almost tempered packets (Gan–Ichino, Lemmas 5.1 and 5.5)

Over char-zero local F: (5.1) for almost-tempered symplectic `φ=ϕ⊕ϕ∨⊕φ₀`,`V=H^k⊕V₀`,`k=dimϕ`,`Q⊂SO(V)` with Levi `GL_k×SO(V₀)`,and `τ=LLC(ϕ)`,`Ind_Q(τ⊗σ₀)` is irreducible for every `σ₀∈Π_{φ₀}`. (5.5) for `dimφ=2n`,`2n<r−1`,`φ′=φ⊕S_{2r−2n}`,`φ′₀=φ₀⊕S_{2r−2n}`,`Q′⊂SO_{2r+1}` with Levi `GL_k×SO_{2r−2k+1}`,`Ind_{Q′}(τ⊗σ′₀)` is irreducible for **every** irreducible subrepresentation of **every** A-packet member for `φ′₀`.

Almost tempered means inducing exponents in `(−1/2,1/2)` after removing the tempered part. Both decompositions are canonical bad/good decompositions: `φ₀` is the symplectic-summand part and `ϕ` selects the nonsymplectic dual pairs; arbitrary symplectic subparameters are not allowed.

For the classification-dependent conclusion assume TWFL and the [Trace inputs].

API: `TauCeti.Arthur.induced_irreducible_of_almostTempered`.

Proof route for 5.1: p-adic Mœglin–Waldspurger §2.14/Gross–Prasad–Rallis, real Speh–Vogan `[83]`, complex almost-tempered irreducibility. For 5.5: p-adic Mœglin, complex Mœglin–Renard; over `ℝ` the canonical decomposition separates half-integral infinitesimal supports and Gan–Ichino’s `[22]` Kazhdan–Lusztig input applies.

These give irreducible almost-tempered packet members (Gan–Ichino 5.4).

([Gan–Ichino], §5.2, Lemma 5.1 and proof, p. 18; published p. 987; §5.4, Lemma 5.5 and proof, p. 20; published p. 990.)

*Needs:* [§3.18]; [§3.15].

<a id="generic-packets-standard-modules"></a>
### 3.25 Members of generic L-packets of classical groups are irreducible standard modules (Jiang–Zhang, Proposition B.1)

For char-zero local F,classical G quasi-split or pure inner,and generic `φ` (its quasi-split packet has a Whittaker-generic member),every `Π_φ(G)` member is an irreducible standard module: the full tempered-data induction giving its Langlands quotient is irreducible.

For the classification-dependent conclusion assume TWFL and the [Trace inputs].

API: `TauCeti.Arthur.genericPacket_standardModule`.

Proof route: Jiang–Zhang Appendix B assembles Mœglin–Waldspurger, Gross–Prasad–Rallis/Gan–Ichino, Heiermann and archimedean Adams–Barbasch–Vogan.

The `GL_n` model is the generic standard-module theorem of Zelevinsky.

([JZ20], Appendix B, Prop. B.1 and proof, p. 85; published p. 818.)

*Needs:* [§3.15]; [§3.18]; [TWFL].

<a id="gsp4-arthur-classification"></a>
### 3.26 Arthur's classification of the discrete spectrum of `GSp₄` (Arthur 2004; Gee–Taïbi)

For totally real F,every discrete `GSp₄` `π` transfers to `GL₄` in one of §3.9’s six types and satisfies Arthur’s multiplicity formula. Transfer matches `rec_GT` at every finite place. Import the general-type transfer and packet/multiplicity theorem from ET §11.1, retaining `GSp4ClassificationInputs` and its unitary/cuspidal hypotheses: for general-type `ψ=π̃⊠1`, `S_ψ=1`, every restricted product of local members,unramified almost everywhere,is automorphic with multiplicity1, and the archimedean Arthur packet is the parameter’s L-packet. The targets here are the nongeneral-type extensions, six-type assembly and normalization adapters beyond that export.

Use BCGP §2.9’s totally real scope and fixed central character; broader number-field scope needs a separate Gee–Taïbi export.

Retain ET's `GSp4ClassificationInputs`. The extensions also assume TWFL together with the [Trace inputs] in the group and parameter scope of this assertion; §3.2 and the local Arthur targets discharge only their corresponding premises.

API: `TauCeti.Arthur.GSp4.classification`: assemble the six types with ET §11.1's general-type branch and the stated classification premises.

Proof route for the extensions: Gee–Taïbi restriction to `Sp₄` and `SO₅≅PGSp₄` with the similitude character and `rec_GT` comparison. The general-type branch uses ET §11.1's multiplicity theorem, with no independent reconstruction here.

CG 7.11 and Pilloni 15.2.4.1 use (ii),(iii) to exchange holomorphic/generic limits at infinity.

**Checks.**

- A general-type parameter has trivial component group and inherits every-member multiplicity one from ET §11.1 with its input record.
- A Yoshida parameter has component group `C₂` and needs the nongeneral-type assembly; the general-type export alone does not supply it.
- In the algebraic rank-four normalization, twisting by `|det|^{−3/2}` changes geometric Frobenius eigenvalues by `q^{3/2}`; the all-place adapter retains this factor.

([Calegari–Geraghty](#ref-cg-2020), Proof of Thm. 7.11, §7.2, publ. p. 854; arXiv v1 p. 40; [Calegari–Geraghty](#ref-cg-2020), Proof of Thm. 7.11, publ. p. 855 (copy p. 55); [BCGP], §2.9 'Arthur's classification', first paragraph PDF p.38; [GT19], Proposition 6.1.7, Remark 6.1.8 and Theorem 7.4.1, published pp.507–508 and 512–514.)

*Needs:* ET §11.1 and `GSp4ClassificationInputs`; [§3.17]; [§3.5]; [The classification input for the symplectic branch](#symplectic-branch-status); [TWFL].

<a id="xu-multiplicity-formula"></a>
### 3.27 Xu's multiplicity formula for generic global parameters of `GSp_{2n}`

For number field F,`n≥1`,`G=Sp_{2n}`,`G̃=GSp_{2n}`,generic discrete global `φ` (trivial Arthur `SL₂`),fix central extension `ζ̃` on `Z_G̃(𝔸_F)`. Set `Y=Hom(G̃(𝔸_F)/(G̃(F)Z_G̃(𝔸_F)G(𝔸_F)),ℂ×)`,global `α:S_φ→Y`,`S_{φ̃}=kerα`. A restricted-product packet `Π_{φ̃}`,unique up to Y-twist,contains a discrete automorphic member,and
`L²_disc,φ(G̃(F)\G̃(𝔸_F),ζ̃)=⊕_{ω∈Y/α(S_φ)}⊕_{π̃∈Π_{φ̃}⊗ω,⟨·,π̃⟩=1}π̃`.
Pairing on `S_{φ̃}` is the localized product. Each twist-indexed summand has coefficient one for GSp. The multiplicity of an actual isomorphism class counts all indexing pairs that produce it; multiplicity one additionally requires triviality of the corresponding global self-twist quotient. Common-similitude/even-SO uses Xu4.1’s `m_φ/Σ₀` conventions.

Use `Φ⁺_unit` local packets (§3.19),allowing non-tempered localizations. Global genericity means neither local temperedness nor every member Whittaker-generic; nontrivial Arthur `SL₂` is excluded. `ζ̃=1` gives PGSp.

Assume TWFL together with the [Trace inputs] in the group and parameter scope of this assertion.

API: `TauCeti.Arthur.xu_multiplicity_formula`.

**API.** `xuGlobalBoundary`,its localizations,`xuGlobalPacket` with spherical basepoints,`xuGlobalPairing` as finite local product,`xu_multiplicity_formula` with the displayed quotient/character condition. Expose Y-twist invariance,`globalPairing_local_product`,`xu_multiplicity_trivial_kernel`,`xu_projective_descent`. Retain G̃(F)-triviality: X is larger than Y.

Route: Arthur restriction and local twisted identities,Xu’s **weak**4.7 comparison,stable-character independence,GL-type recursion `a_m=½Σ_{k=1}^{m−1}a_ka_{m−k}` with twice-multiplicity ratios,and general-block component fibres/`½` versus`¼` factors (§6 pp.19–21;§7 pp.21–24).

Compatible lifts (§8 pp.25–34): Weil1-cochains split orthogonal/GL-pair central2-cocycles with GL character corrections. Factorization changes are well-defined modulo `Hom(Γ_{L/F},µ₂)⊂α(S_φ)` (8.4). Spherical/Levi/endoscopic comparison and component-preserving globalization give compatibility/chain independence (8.7–8.8).

Multiplicity route: symplectic/even-SO induction,stable completion (negative pairing coefficient2C),twisted independence; boundary`2φ₁` reduces decomposition complexity,retaining d in both comparisons. Appendix A detects full self-twist stabilizers,including characters nontrivial on G (§9 pp.34–39;Appendix pp.40–43).

Global endoscopic packet transfer up to Y-twist additionally requires one input factor without GL-type orthogonal simple summands (1.2/4.5),automatic for `GSp₄/GSp₆` but retained at general rank; this is separate from multiplicities. API: `xuCompatibleLift / xuLift_factorizationChange / xuLift_chainIndependent` construct the corrected Weil cochain,its character modulo `α(S_φ)`,and chain-independent packet.
**Checks.**

- `S_{φ̃}=1` makes the condition empty and every selected packet member occurs; `S_φ=1` suffices.
- Nontrivial global pairing excludes occurrence; triviality at one place does not imply trivial global product.
- Complementary-series localizations of generic global parameters are allowed; nontrivial global Arthur `SL₂` is excluded.
- For `n=3`,`S_φ=1` recover [Gan–Savin] §12.8 pp.39–40: every member of `Σ`’s packet is automorphic; this alone does not prove each cuspidal.

- Cochain changes in `α(S_φ)` preserve twist cosets;outside characters need not. Chain changes preserve the coset including GL-pair correction.
- Every Y-character is1 on G̃(F);violating X-characters are excluded.
- If two distinct twist-indexing pairs yield isomorphic representations, their two coefficient-one summands contribute multiplicity two; an index coefficient is not the multiplicity of the isomorphism class.
- Two GL-type orthogonal blocks use unordered partitions/multiplicity ratios;ordered partitions double the contribution.

Source: [Xu, global](#ref-xu-global), Thm. 1.1, pp.1–2, Thm. 4.1, pp.12–13; proof inputs Thm. 4.7, pp.14–15, §§6–9, pp.19–39 and Appendix A, pp.40–43 (arXiv v2). The corrected comparison proof is essential; the thesis announcement is not a substitute.

*Needs:* [§3.19](#xu-gsp2n-packets); [§3.17]; [TWFL].

<a id="non-general-type-reducible"></a>
### 3.28 Discrete representations of `GSp₄` not of general type have reducible Galois representations (BCGP Lemma 2.9.1)

For totally real F,discrete `GSp₄` `π` with each infinite infinitesimal character that of `φ_{(2;k_v−1,l_v−2)}`,`k_v≡l_v` mod2,`k_v≥l_v≥2`,non-general type implies a reducible compatible system `ρ_{π,p}:G_F→GSp₄(Q̄_p)`,matching `rec_{GT,p}(π_v⊗|ν|^{−3/2})` after ss almost everywhere. Pilloni§5.1.7 gives the rational discrete-series case: types(b)–(f) sum `GL₁/RA` `GL₂` realizations. General-type irreducibility is expected only (BCGP2.9.2).

Fix the split `GSp₄` central character and the displayed archimedean condition.

For the classification-dependent conclusion assume TWFL and the [Trace inputs].

API: `TauCeti.Arthur.GSp4.reducible_of_not_generalType`.

Proof route: [§3.26] types (b)–(f), then sum the algebraic `GL₁`/Hilbert `GL₂` Galois realizations, retaining the rank-dependent normalization twists, `|·|^{±1/2}` and (b)’s common `ω_π`.

**Checks.**

- Yoshida: `ρ_{π,p}≅(r_{µ₁,p}⊕r_{µ₂,p})⊗ε_p⁻¹`, where each rank-two realization uses `recᵀ`. The rank-four twist is `|·|⁻³ᐟ²`, versus `|·|⁻¹ᐟ²` in rank two, so at geometric Frobenius the extra factor is `q_v`.
- The common alternating multiplier is `ε_p⁻³ r_p(ω_π)`, obtained from each `det r_{µ_i,p}=ε_p⁻¹ r_p(ω_π)` by the square of the Tate twist.
- If `r_{µ_i,p}` has labelled weights `{h_{i,1},h_{i,2}}`, the direct-sum list is `{h_{1,1}+1,h_{1,2}+1,h_{2,1}+1,h_{2,2}+1}`. The twist preserves reducibility but changes every weight.

([BCGP], Lemma 2.9.1, §2.9, p. 38; [Pilloni], §5.1.7, paragraph after Remark 5.1.7.1, p. 23 (author version 17 June 2019).)

*Needs:* [§3.7]; AG §§3.10–3.14 and 4.3–4.7.

<a id="gsp4-archimedean-limit-packets"></a>
### 3.29 The archimedean L-packet of a limit of discrete series of `GSp₄(ℝ)`

For `λ=(p,0;c)∈X`*`(T)+(2,1;0)`, `p>0`, construct the full-`GSp₄(ℝ)` packet `{π(λ)^h,π(λ)^g}`, containing the holomorphic limit and one generic member, by normalized Klingen induction/real LLC. Pilloni/CG cite BHR 5.3.7; use Muić/Schmidt’s primary calculations here.

Remove the positive norm twist. `GL₂(ℝ)` `D_p` has lowest `SL₂`-weight `p+1`,positive centre1. Muić8.1(i) pp.371–372/5.2 gives `Sp₄` holomorphic/generic limits,minimal types(`p+1`,2)/`(p+1,0)`. Negative multipliers pair them with antiholomorphic partners; index-two induction gives **two** full-`GSp₄` summands `1⋊D_p=π^h⊕π^g` (Schmidt(2.23)p.2394). Both have `R_p⊕R_p`,`R_p=Ind_{ℂ×}^{W_ℝ}(z/|z|)^p`,`det=sgn^{p+1}`,`j(e₁)=e₂`,`j(e₂)=(−1)^pe₁`. Tensor the symmetric multiplicity form with `R_p`’s alternating similitude form; centralizer `GO₂`/scalars has component `C₂`. Schmidt(3.11)–(3.14)pp.2398–2399 identifies the singular parameter; tempered LLC gives exactly these summands. Restore the norm twist for c.

CG labels the pair `{π(λ,C₀),π(λ,C₁)}`, `λ=(a−1,0;4−a)`. The integral-triple condition is `λ₁−3≡c` mod 2 (Pilloni §5.1.1 p.20). For (1,0;2) the minimal `Sp₄` type is (2,2); `λ₁=0` is excluded and (1,0;1) fails parity. The general-type global Arthur-packet identification additionally uses the classification hypotheses below.

For the classification-dependent conclusion assume TWFL and the [Trace inputs].

**API.**

- `GSp4.limitPacket / klingenLimitDecomposition`: two full-`GSp₄` summands with central twist.
- `limitPacket_restrictSp / limitPacket_minimalKType`: two `Sp₄` constituents/minimal types above.
- `limitPacket_parameter / limitPacket_componentGroup`: `R_p⊕R_p`,alternating form,`C₂`.
- `limitPacket_generic / limitPacket_holomorphic`: distinguish members; `limitPacket_arthur_generalType`: conditional global Arthur comparison.

**Checks.**

- `p=1` gives holomorphic/generic minimal types (2,2)/(2,0).
- `Sp₄` restriction has four limits; full `GSp₄` has two, with negative multiplier exchanging holomorphic signs.
- The other wall `(p,−p)`,`p>0` has singleton parameter `1⊕R₂ₚ⊕sgn` (Schmidt (2.24),(3.15)); the two-member result is for (p,0).
- Exclude `p=0` and parity-failing (1,0;1); retain (1,0;2).

([Muić](#ref-muic-2009), §8 and Lemma 8.1, pp.371–372, with Cor. 5.2, pp.362–363; [Schmidt], §§2.3,2.5,3.3, pp.2390–2391,2393–2394,2398–2400; [Pilloni], §15.2.4, author p.109; [Calegari–Geraghty](#ref-cg-2020), Thm. 7.11 and proof point (2), published pp.854–855.)

*Needs:* [§3.26]; [AutomorphicLFunctionsAndLocalFactors, Representation prerequisites: archimedean GL_n parameters](../AutomorphicLFunctionsAndLocalFactors/README.md); AF §§2.1–2.7 and 6.1–6.5 (discrete series).

<a id="unitary-descent-of-gl4-transfer"></a>
### 3.30 The symplectic pairing through unitary descent

For `µ=(a,b)`, `a≥b≥2`, and a non-Eisenstein maximal ideal m of CG's `T^an_µ(Q)`, construct CG6.9's semisimple residual representation and its symplectic pairing when it is absolutely irreducible. Lift the same mod-p eigensystem to a regular-weight cuspidal eigenform f using CG Lemma 6.4 and Proposition 6.8. The characteristic-zero pairing comparison is for these regular-weight lifts. It requires an actual algebraic twist to conjugate self-duality,CM restriction preserving absolute irreducibility,exact unitary descent,and Bellaïche–Chenevier pairing transport through twist/restriction with specified coefficients/polarization. Essential self-duality alone is insufficient; these weight-lifting and polarization-sign comparisons are targets here.

Take imaginary quadratic K with `r_f|G_K` absolutely irreducible; retain the transfer/unitary classification hypotheses. For the transfer Π and its similitude character `χ_f`, choose an algebraic Hecke twist θ of K with `θθ^c=(χ_f∘N_{K/ℚ})⁻¹`, after the specified algebraic normalization. Construct the conjugate-self-duality isomorphism of `Σ=BC_K(Π)⊗θ`; its Galois realization includes the rank-four `recᵀ` twist. The character identity, coefficient field, embeddings and polarization comparison are part of the datum.

For the classification-dependent conclusion assume TWFL and the [Trace inputs].

API: `TauCeti.Arthur.GSp4.symplectic_of_unitaryDescent`.

Proof route: multiplication by the Hasse-invariant power of CG Lemma 6.4, with `t=rs(p−1)` sufficiently large, preserves the residual Hecke eigensystem in weight `(a+t,b+t)`. Cohomology vanishing and eigenvalue lifting give a characteristic-zero eigenform; Proposition 6.8 constructs its realization. Use ET §11.1's general-type transfer with `GSp4ClassificationInputs` and construct unitary descent of Σ over K/ℚ using §3.12's unitary classification. Match its base change and regular-weight Galois realization over one coefficient extension. Apply Bellaïche–Chenevier Theorem 1.2 to this realization. Compare its conjugate-polarization sign through θ and restriction with the rank-four multiplier’s value `−1` at complex conjugation to obtain an alternating form over ℚ. Normalize on a stable lattice and reduce; residual absolute irreducibility makes the reduced pairing nondegenerate. The weight lift, imaginary-quadratic descent and sign/normalization comparisons are owned here.

**Checks.**

- K/ℚ has totally real degree one and may ramify at finite places, so the even-degree division-algebra theorem of ET §6.27 and the everywhere-finitely-unramified converse of §6.29 do not apply.
- Omitting θ changes the conjugate-duality multiplier by `θθ^c`; a parameter identity without this character comparison cannot transport the pairing.
- Absolute irreducibility after restriction identifies the pairing line; residual absolute irreducibility makes reduction of the normalized lattice pairing nondegenerate.
- Starting in weight `(2,2)`, a positive sufficiently large t gives regular `(2+t,2+t)` with the same mod-p Hecke character. The multiplier's extra `ε_p^{−2t}` reduces to 1 because `p−1` divides t; an arbitrary weight shift need not preserve this datum.

Thus an absolutely irreducible residual realization is symplectic.

([Calegari–Geraghty](#ref-cg-2020), Lemma 6.4 and its Hecke-equivariant injection, arXiv v1 pp.27–28; Proposition 6.8, pp.29–30; Lemma 6.9 and proof, p.30, publ. p.840. [Bellaïche–Chenevier, The sign of Galois representations attached to automorphic forms for unitary groups](https://arxiv.org/pdf/0804.2860v1), Theorem 1.2, p.2, and the sign comparison on p.3.)

*Needs:* [§3.26]; [§3.12]; ET §§6.24 and 11.1 with `GSp4ClassificationInputs`; AG2.2; CSM R27.6, eigenvalue lifting. The imaginary-quadratic unitary descent and pairing transport have the field scope specified in this target.

<a id="limit-discrete-series-packet-types"></a>
### 3.31 Global packets with a holomorphic limit of discrete series at infinity are of general, Yoshida or Saito–Kurokawa type

For discrete `GSp₄/ℚ` `π=π_f⊗π(λ)^h`,`λ=(λ₁,0;c)∈X`*`(T)+(2,1;0)`,`λ₁>0`,its Arthur type is general,Yoshida or Saito–Kurokawa (Schmidt2018§§1.1–1.2/2017 infinity). If `π_f` is congruent to a non-Eisenstein ideal with irreducible residual Galois representation,it is general type; `π_f⊗π(λ)^h` is then automorphic iff `π_f⊗π(λ)^g` is,both multiplicity1 (Pilloni15.2.4.1).

The finite part is unramified outside Np and congruent to Pilloni §15.2’s fixed non-Eisenstein eigensystem.

For the classification-dependent conclusion assume TWFL and the [Trace inputs].

API: `TauCeti.Arthur.GSp4.generalType_of_limitDiscreteSeries`.

Proof route: Schmidt’s six-type archimedean tables and [§3.28](#non-general-type-reducible) eliminate Yoshida/Saito–Kurokawa under residual irreducibility; [§3.29] and [§3.26] exchange the remaining pair with multiplicity one. Trivial Arthur `SL₂` does not assert local Ramanujan.

CG 7.11 uses the same reducibility argument in weight (a,2).

([Pilloni], §15.2.4, Prop. 15.2.4.1 and proof, p. 109 (author version); [Schmidt], §2.3, pp. 2390–2391 (author PDF pp. 10–11); [Schmidt18](#ref-schmidt-2018), §§1.1–1.2, pp. 3088–3092.)

*Needs:* [C-ARTHUR].

<a id="gsp4-gl4-archimedean-transfer"></a>
### 3.32 Infinitesimal character of the transfer of `π_∞` from `GSp₄(ℝ)` to `GL₄(ℝ)` (Calegari–Geraghty Theorem 5.6)

For dominant `µ=(a,b;c)`,`w=−(a+b+2c)`,and discrete `π` of `GSp₄/ℚ` contributing to `H^i(X,W_µ)_(2)`: (1) infinitesimal `π_∞=χ_{(a−1,b−2;w)}`; (2) its spin `GL₄` transfer has `χ_τ`,`τ=((a+b−3+w)/2,(a−b+1+w)/2,(−a+b−1+w)/2,(−a−b+3+w)/2)`; (3) tempered `π_∞` is `π((a−1,b−2;w),C_i)`,a (limit of) discrete series for some chamber.

Use AF §6.3’s balanced coefficient/Harish–Chandra convention; compare CG §5.3 by negating its printed central coordinate.

For the classification-dependent conclusion assume TWFL and the [Trace inputs].

API: `TauCeti.Arthur.GSp4.transfer_infinitesimalCharacter`.

Proof route: `(𝔭,K)`-cohomology gives (1); the spin weights `(±λ₁±λ₂+λ₀)/2` with `λ=(a−1,b−2;w)` give (2) (Sorensen §2.1.2); integral tempered classification gives (3).

For `c=−3`, `w=6−a−b`, giving CG Remark 5.12’s `τ=(0,−(b−2),−(a−1),−(a+b−3))+(3/2)(1,1,1,1)`; CG’s printed weight `a+b−6` is `−w` here.

**Checks.**

- For `µ=(3,3;0)`, the coefficient has central weight 6 and `λ=(2,1;−6)` has weight −6, so the coherent tensor is balanced.
- Its spin exponents are `(-3/2,-5/2,-7/2,-9/2)`, with sum `2w=−12`.
- For `c=−3`, the first exponent is `3/2` and the remaining three differ from it by `−(b−2),−(a−1),−(a+b−3)`, as in the displayed comparison.

([Calegari–Geraghty](#ref-cg-2020), Thm. 5.6(2), §5.3, publ. p. 829; quoted from arXiv v1 p. 22 PDF p.29; [Calegari–Geraghty](#ref-cg-2020), Proof of Thm. 5.6, publ. p. 829 (copy p. 29).)

*Needs:* [AutomorphicLFunctionsAndLocalFactors, Representation prerequisites: archimedean GL_n parameters](../AutomorphicLFunctionsAndLocalFactors/README.md); [§3.29]; AF §§2.1–2.7 and 6.1–6.5 (discrete series).

### Examples

For `G=SO₃` the dual is `Sp₂`. The block `1⊠ν₂` has the required symplectic parity and trivial component group. Two one-dimensional quadratic blocks with `b=1` have orthogonal parity and are excluded. For dual `SO₃` a single odd-dimensional block has determinant-one sign kernel {0}; imposing only the central quotient would leave a spurious `ℤ/2`. With two odd blocks, the kernel is the diagonal {(0,0),(1,1)}. With no blocks it is the trivial full group.

### Dependencies

Use the exact supplier contracts and the prerequisites cited in this layer’s targets.

## Layer 4: symmetric powers, purity and equidistribution

<a id="enormous-adjoint-selmer"></a>
### 4.1 Characteristic-zero enormous image and adjoint Selmer vanishing

Import ArithmeticGaloisRepresentations §7.10: for finite p-adic E with integers O, positive rank n and compact `H⊂GL_n(O)`, use `ResidualImage.IsEnormousCharZero`, its `IsEigenProjection`/trace-detection API and its absolute-irreducibility theorem. The condition detects every simple submodule of full `End_E(E^n)` using a split regular element and an eigenprojection. Allow the source coefficient enlargement; no residual cohomology vanishing is part of this characteristic-zero predicate. For a continuous Galois representation with a fixed stable lattice, identify its actual compact image with this supplier's subgroup.

For CM F,RAC unitary-type `π` and enormous `r_{π,ι}(G_{F(ζ_{p^∞})})`,one has `H¹_f(F⁺,ad r_{π,ι})=0`. Here ad is full End,extended to `G_{F⁺}` by `cX=−X*` through the perfect symmetric polarization; Bloch–Kato conditions are crystalline at p,unramified away. Thm. B gives non-CM Hilbert-form/elliptic-curve vanishing over totally real fields at **every** p,without large residual image.

**API.**

- `enormousImage_comparison`: the Galois image satisfies the imported `ResidualImage.IsEnormousCharZero` exactly when its simple-End-module eigenprojectors satisfy the supplier's trace condition, with the same lattice and coefficient field; absolute irreducibility is imported from §7.10.
- `polarizedAdjoint`: full End with the displayed negative-transpose involution.
- `adjointSelmer_eq_zero`: vanishing under these automorphic/enormous hypotheses. Route: bounded-torsion trace/pseudodeformation comparison,integral Hecke comparison,characteristic-zero pre-patching. Import general patching and §7.10’s enormous-image theory; own the image adapter, polarized adjoint and arithmetic Selmer comparison.

**Checks.**

- In rank one the sole spectral projector is 1 and detects the scalar module.
- A scalar subgroup in rank two has no regular element and fails the definition.
- On scalars `X=aI`, c acts as `−aI`, so the full adjoint is not `ad⁰` with a trivially acted-on extra line.
- At `p=2` the coefficient field still has characteristic zero and `−1≠1`; trivial residual image does not contradict the theorem.

([NT Selmer](#ref-nt-selmer), Thms. A–B, p.2; Def. 2.23 and Lemma 2.25, pp.20–21; Thm. 4.28 p.39 and applications §5, pp.39–43.)

*Needs:* ArithmeticGaloisRepresentations §7.10, characteristic-zero enormity, eigenprojections and absolute irreducibility; GGD, polarized deformations and pseudocharacters; DeformationAndDerivedPatchingAlgebra Layers 7–9, patching modules; ArithmeticGaloisDuality R02.5 and D8, Bloch–Kato Selmer conditions.

<a id="residually-reducible-ordinary-lifting"></a>
### 4.2 Ordinary lifting with several residual constituents

Let F be imaginary CM, `n≥2`, `ℓ>3` with `ℓ∤n`, and `ρ:G_F→GL_n(ℚ̄_ℓ)` continuous semisimple, finitely ramified, ordinary of dominant weight `λ`, with `ρ^c≅ρ∨ε^{1−n}`. Require all of the following:

- `ρ̄^{ss}=⊕_{i=1}^d ρ̄_i`, where the constituents are distinct absolutely irreducible and **each** satisfies `ρ̄_i^c≅ρ̄_i∨ε̄^{1−n}`.
- At a place `v₀∤ℓ`, `ρ|_{G_{F_v₀}}^{ss}=⊕_{i=1}^n ψ ε^{n−i}` for an unramified `ψ`.
- There is an `ι`-ordinary RACSDC seed `π` with `r̄_{π,ι}^{ss}≅ρ̄^{ss}` and `π_v₀` an unramified Steinberg twist.
- `F(ζ_ℓ)⊄F^{ker ad(ρ̄^{ss})}`, `F⊄F⁺(ζ_ℓ)`; the `ρ̄_i` remain absolutely irreducible and distinct over `F(ζ_ℓ)`; `ρ̄^{ss}` is primitive and its image has no quotient of order `ℓ`.

Then `ρ` comes from ordinary RACSDC `Π`. Own the reducible-lifting route: `µ₂^d`-action on the Schur ring,invariant pseudodeformation subring,étaleness on the irreducible locus,`v₀`’s reducible-locus dimension bound,and connectedness of the finite ordinary ring. The local shape concerns `ρ`,not just `ρ̄`.

**Checks.**

- Polarization of the whole residual direct sum need not polarize each constituent; a pair exchanged by duality fails the stated input.
- Matching the seed's residual representation without its Steinberg `v₀` component is insufficient.
- The theorem allows `d>2` but excludes `n=1` and `ℓ|n`.
- Finite ramification and ordinary local flags concern `ρ`, not an arbitrary representation with the same residual trace.

([ANT](#ref-ant), Thm. 1.1, pp.1–2; §3.3 pp.11–13; Thm. 5.1 pp.15–17; Thm. 6.1 pp.17–19.)

*Needs:* [§2.2]; GGD, Schur/pseudodeformation rings; DeformationAndDerivedPatchingAlgebra Layers 7–9, ordinary Hecke comparison; ET, definite-unitary transfer.

<a id="symmetric-power-method-prerequisites"></a>
### 4.3 Definite-unitary eigenvarieties and the trianguline comparison

For NT I§2.18’s definite unitary group,tame `U^p` and residual conjugate-self-dual pseudocharacter `τ`,complete algebraic forms over **all** p-levels,take locally analytic vectors/normalized torus Jacquet module,and coherent strong dual M on the product torus-character space. The relative tame-Hecke spectrum `E_n` has weight map,pseudocharacter and closed realization in `X_ps×T_n`. For highest algebraic `κ` and smooth normalized accessible `χ`,`ν=κχι⁻¹δ_B^{−1/2}`,`j_n(ν)=ν(1,ε⁻¹∘Art,…,ε^{1−n}∘Art)`. Twist the raw Jacquet-spectrum character map by `δ_B⁻¹` to obtain `ν` (NT I(2.18.1)pp.35–37). Interpolate `χ↦(χ₁^{n−1},χ₁^{n−2}χ₂,…,χ₂^{n−1})` with the symmetric-power pseudocharacter map.

For finite `K/ℚ_p` and E containing its embeddings,fix a trianguline E-representation `ρ` and saturated flag/parameters. Saturated ordered trianguline deformations over Artin E-algebras/residue E,with `δ_i/δ_j` not a nonnegative embedding monomial for `i<j`. This injects into `ρ`-deformations,is relatively representable,and is a quotient of `R_ρ` for absolutely irreducible `ρ` (or `End(W)=E` for B-pairs). Route: rank-one `H⁰`/Artin fibre products,[Nakamura](#ref-nakamura)2.35/37/38 pp.493–495. De Rham strictly increasing weights give fixed-weight tangent⊂`H¹_g(adρ)`: [Hellmann–Schraen](#ref-hellmann-schraen)2.6 p.10;NT I2.7 pp.26–27. Impose finite-torsion invariants first (also `p=2`),then HT;reverse weight signs for Hellmann–Schraen’s `HT(ε)=+1`.

For connected reductive G over a finite extension of `ℚ_p`,`P=MN`,construct Emerton’s `J_P(V)=(V^{N₀})_fs` on essentially admissible locally analytic representations,using contracting `Z_M⁺`/continuous monoid maps from analytic character functions. It is `N₀`-independent,left exact,essentially admissible; admissible smooth V gives `V_N`,and for finite-dimensional algebraic `W_alg`/admissible smooth X over `End_G(W_alg)`,`J_P(X⊗W_alg)=X_N⊗W_alg^N`. A Borel gives a coherent torus-character dual;retain NT’s modulus. [Emerton](#ref-emerton-jacquet) Defs3.2.1/3.4.5,Prop3.2.4,Thm4.2.32(via26/28),Props4.3.4–6 pp.24–25,34–35,57,63–64.

Analytic prerequisite: cofinally refine compact-type weak Fréchet–Stein dagger stages to Noetherian Banach stages. With flat Noetherian transitions,finite compatible stage modules recover coadmissible modules/coherent sheaves independently of refinement;retain completeness/hereditary conditions. [Emerton, analytic vectors](#ref-emerton-vectors),Def1.1.16/Thm1.1.17 pp.14–15,Defs1.2.6–11 pp.21–28.

On arbitrary Banach A-modules define compactness through orthonormalizable covers,independently of cover;prove composition,completed base change,quotient descent,and annular finite generation after operator inversion. Norm-limit compactness alone requires orthonormalizability. Compact-type modules use A-generated compact-type factorizations. Equicontinuous powers give power boundedness/Tate-algebra strict-quotient action. Emerton Defs2.2.3/2.3.3,Lemmas2.2.4/2.3.4,Props2.1.6–10/2.2.5–6/2.3.5 pp.13–21.

Jacquet route: contracting central z/Iwahori `H_n` (4.1.6 pp.43–45); `A_n=O(Ẑ_G,n)^†⊗̂D(M_n°,M₀)`,distribution base change/**Hausdorff** `N₀`-coinvariants `U_n` with `(V^{N₀})′≅lim` `U_n` (4.2.6 pp.49–50); compact opposite-unipotent transitions/finite presentation give `A_n`-compactness (4.2.22/**Corollary**4.2.26 pp.53–55). Finite-coset z-averaging (4.2.11/19/21 pp.51–53) factors one level (4.2.28 pp.55–57). Invert z,apply stage base change/annular finite generation (3.2.24 pp.29–31),identify centre `O(Ẑ_M)⊗̂D(M₀)` (4.2.32 p.57). Algebraic coinvariant exactness alone is insufficient.

For rank-d `(φ,Γ_K)`-modules on reduced rigid L-space X with irreducible connected components with ordered `δ_i` and dense strict-trianguline locus satisfying [KPX](#ref-kpx)6.3.2’s admissible-affinoid-cover density,construct proper birational `X′→X` and stable flag,graded pieces embedding into `R(δ_i)⊗`line bundles. Cokernels are locally t-power killed on a closed exceptional locus off the dense set;first piece isomorphic,flag strict off that locus. For smooth curves `X′=X`. Route: KPX6.3.9–10 pp.68–72,flattening `H⁰`/induction,with Herr finiteness/derived base change/Euler characteristic/Tate duality4.4.3/5 pp.42–43. NT I2.16 pp.33–34 supplies ordinary rigid density on a shrunk rank-one `H⁰` base-change locus;2.15 pp.32–34 descends the closed trianguline tangent quotient.

**API.**

- `coadmissible_stageBaseChange / coadmissible_characterSheaf`: refinement independence/coherent comparison under the stated flatness/completeness.
- `analyticIwahoriSystem / jacquetTransition_compact / jacquetTransition_contracts`: distribution modules and both coadmissibility hypotheses.
- `AnalyticFiniteSlope / analyticJacquet / analyticJacquet_coherent`: right adjoint,Jacquet functor,coherent strong dual/compact-open independence.
- `TriangulineDeformation / triangulineDeformation_quotient / fixedWeightTrianguline_to_H1g`: Artin subfunctor,quotient with End hypothesis,noncritical tangent comparison.
- `FamilyTriangulation / exceptionalLocus / gradedCharacterLine`: birational flag,line twists/t-torsion error.
- `CompletedUnitaryForms / analyticJacquetSheaf`: all-p-level completion/Jacquet/coherent dual.
- `UnitaryEigenvariety / weightMap / HeckePseudocharacter`: relative Hecke spectrum/maps.
- `classicalRefinedPoint / closedRealization`: normalized accessible points in `X_ps×T_n`.
- `symPowerCharacterMap / symPowerPseudocharacterMap`: monomial/pseudocharacter compatibility.
- `triangulineTangent_injective`: closed-realization tangent→trianguline problem;Selmer/noncritical hypotheses give weight injectivity. Use PadicFamilies’ abstract machine/AG2.3’s restricted instance;own the additional general Emerton/Jacquet comparison.

Tangent route: for NT I 2.10’s polarized datum, assume regular noncritical triangulations, de Rham representations, generic WD at all `v∈S` and `H¹_f=0`. The weight differential on `H¹_tri` is injective with dimension `≤dim W` because its kernel maps to Bloch–Kato Selmer. Apply NT I 2.24/2.27 for finite-slope/ordinary propagation, classical density and closed realization.

**Checks.**

- Character map:`n=1` gives(1),`n=2` the pair,`n=3` `(α²,αβ,β²)`.
- `α=1`,`β=−1` makes first/last `n=3` characters equal:3-regularity fails.
- Critical refinements fail strict weights even for de Rham representations.
- Equal parameters have excluded ratio1;rank1 has one flag and the full deformation functor.
- On `GL₂` diag(9,1),`δ_B=1/9:δ_B^{−1/2}=3` but raw-spectrum `δ_B⁻¹=9`.
- Nonzero adjoint Selmer defeats the tangent-kernel vanishing argument.
- One-p-place variation does not give the all-p-place family.
- For a torus,`P=G`,`N=1`,`J_P(V)=V`;proper-Borel Jacquet of smooth supercuspidal `GL₂` is0.
- Smooth comparison uses coinvariants;invariant averaging alone omits finite slope.
- Identity is compact in finite dimension,not on infinite-dimensional Banach spaces;arbitrary monoid actions need not give coherence.
- A nonclosed image requires closure in the Hausdorff quotient used by transition factorization.
- Noncontracting z fails4.2.28 despite unrelated compact transitions.
- Rank1 family gives one character line;higher rank retains the exceptional locus despite dense classical flags.

([NT I], Prop. 2.11, p.30; construction §2.18.1, pp.36–39; Thms. 2.24, 2.27, pp.40–44; §2.22 and Thm. 2.33, pp.47–51.)

*Needs:* PadicFunctionalAnalysis §§1.4,2.2–2.6;CompactOperators §§0.1,0.4–0.5,1.7;LAD §§0.0,0.2–0.3,3.3;RigidAnalyticGeometry §7.3;PadicFamilies §§2a.10–2a.14;SR’s stated smooth/locally analytic scope;LGD local deformations;GGD pseudocharacters;[§1.1];[§4.1](#enormous-adjoint-selmer). Own the general finite-slope/Jacquet,family-triangulation,relative compactness/distribution/coadmissibility (Emerton§§2,4.1–4.2),Robba/Herr (KPX§§2–5),and Nakamura/Hellmann–Schraen deformation/`H¹_g` constructions (NT I2.6–7) beyond these imports.

<a id="unitary-level-raising-method"></a>
### 4.4 Unitary level raising and its odd-rank local types

Let E/F be CM and everywhere unramified, `n≥1`, `ℓ` a prime and `ι` fixed. Let `w₀∤ℓ` split over F; all `ℓ`-adic places of F split in E. Let `π₁`,`π₂` be cuspidal conjugate-self-dual on `GL_n(𝔸_E)`, with `π=π₁⊞π₂` RA, ramification only at split places, and `π_{i,w₀}=St_n(ξ_i)` with `ξ_i` unramified and `ι⁻¹(ξ₁(ϖ)/ξ₂(ϖ))≡q_{w₀}^n mod m`. Require `r̄_{π,ι}` not a character twist of `1⊕ε̄⁻¹⊕⋯⊕ε̄^{1−2n}`. For a totally real quadratic F′/F split at `w₀`, put `E′=EF′` and require the same exclusion after restriction to E′. Then a RACSDC `Π` on `GL_{2n}(𝔸_E′)` exists with the same **residual** representation, the same infinity infinitesimal character, a Steinberg twist at one `w′₀|w₀` and ramification only at split places. Ordinary input gives ordinary output.

Route: definite `GL₂(D)` inner form,strong-approximation degeneracy injectivity,quadratic-extension positivity,and exact Jacquet–Langlands/endoscopic multiplicities. Separately,for odd `n=2k+1≥3`,CM `F/F⁺` everywhere unramified,[F⁺:ℚ] even,`p/ι`,choose split S containing p,unitary group compact at infinity/quasi-split finite and NT I§1’s Hecke normalization. Take cuspidal conjugate-self-dual `π₂`,`π_{n−2}` with RA ordinary sum `π`;disjoint nonempty `T₁`,`T₂`,`T₃` outside S of odd residue cardinality;`π` unramified outside `S∪T`. Require:

- At `v∈T₁`, v is inert, `q_v` modulo p has order 6 and the residue characteristic exceeds n. Write `π₂,v=St₂(χ_v)` and `π_{n−2,v}=⊞_{i=0}^{2k−2}χ_{v,i}`, where `χ_v` and `χ_{v,0}` are unramified and every `χ_{v,i}` for `i>0` restricts on units to the quadratic character `ω_v`. The conjugate-self-dual sign forces `χ_v` to be the nontrivial unramified quadratic character and `χ_{v,0}=1`.
- At `v∈T₂`, v splits, `q_v` modulo p has order 2, `π₂`,v contains the finite `GL₂` type `λ(Θ_v)` for an order-p regular torus character, and `π_{n−2,v}` contains `ω_v∘det`.
- At `v∈T₃`, v splits, `q_v` modulo p has order `n−2`, `π_{n−2,v}` contains the finite `GL_{n−2}` type `λ(Θ_v)` of an order-p regular torus character, and `π₂`,v contains `ω_v∘det`.

Type construction: on `T₁` use the order-p character `θ` of `ker(N:k₆×→k₃×)`, the `U₃` type `−R(θ)`, and the `GL₃` character `z↦θ(z/z^c)`, `c=q³`; inflate to the parahoric with the quadratic factors. On `T₂/T₃` use `(−1)^{d−1}R_{k_d×}(Θ)`, `d=2/n−2`, with the complementary `ω∘det`; construct integral lattices and their reductions.

Odd-rank output: over every totally real quadratic `L⁺/F⁺` split at `S∪T`, obtain ordinary RACSDC `Π` on `GL_n(𝔸_L)`, unramified outside `S∪T`, with the same residual representation and the `T₁` `GL₃`, `T₂/T₃` d-block types. Route: NT I Lemmas 4.5/4.6 and exact ordinary type congruences; `T₁` excludes the partition [n−2,2], leaving [n] (Thm. 4.1 pp.59–66, with 1.8/1.17 and 1.16/1.18–22 pp.16–20). For `n=3` the `T₃` `GL₁` type is an order-p character, `q≡1` mod p, sign `+1` and trivial Weyl group; use local class field theory, not Prop. 1.18’s higher-rank calculation.

Clozel–Thorne II input: `ℓ≥5`, `K/ℚ` Galois, and `SP_{ℓ−1}(K(ζ_ℓ))` (Conjecture 6.1). Thm. 6.2 gives `Sym^ℓ` automorphy for weight-zero ordinary RAESDC `π` on `GL₂` with residual image containing `SL₂(𝔽_{ℓ^a})`, `a>1`, and a Steinberg v with `q_v` primitive mod `ℓ` and ramified residual representation. Thm. 6.3 transfers `Sym^ℓ` automorphy to congruent `π′` at an auxiliary `p>2(ℓ+2)`, retaining its extra local hypotheses. Route (§6 pp.345–349): a dihedral type of order `t>ℓ²`, finiteness at fixed level/weight, Chebotarev and mod-p raising, then lowering forces residual ramification; potentially diagonalizable lifting transfers automorphy. Thm. 6.2 uses §5’s ordinary reducible seed with adequate constituents and cyclotomic avoidance, then soluble descent. Mod-`ℓ` raising alone does not suffice.

**Checks.**

- Output matches residual representations,not the characteristic-zero isobaric sum.
- `n=1` gives `ξ₁/ξ₂≡q`,the rank-two level-raising congruence.
- The excluded character twist could yield one-dimensional discrete output,defeating cuspidality.
- Check that exclusion again after base change.
- `n=3:T₃` is `GL₁` order-p,no ramified `T₁` quadratic complement;`n=7` split blocks2,5 require distinct `T₂/T₃` support constraints.
- `p=2`,3 cannot supply order6 modulo p at `T₁`.
- `Sign(−1)^{d−1}` is `−` for `d=2`,`+` for `d=5` `(n=7)`.
- CT excludes `a=1`;without residual ramification at v the `ℓ`-unipotent element is lost.

([Anastassiades–Thorne](#ref-at), Thm. 5.1 and proof, pp.19–20; the group-side Thm. 4.1, pp.14–18; [NT I], §4 pp.59–66; [Clozel–Thorne II](#ref-ct-2015), §6 pp.345–349.)

*Needs:* ET, unitary transfer/multiplicity and Jacquet–Langlands at the stated inner forms; SR, normalized induction; [§3.2]; [§4.2](#residually-reducible-ordinary-lifting).

<a id="eigenvariety-propagation"></a>
### 4.5 Automorphy of `Sym^{n−1}` is constant on eigencurve components (NT I Theorem 2.33)

For `n≥2` and refined eigencurve `E₀`(tame N,p) points `(π₀,χ₀)`,`(π′₀,χ′₀)`,assume either: `χ₀` numerically noncritical/n-regular,`χ′₀` n-regular,both local Galois Zariski closures contain `SL₂`,and `Sym^{n−1}r_{π₀,ι}` automorphic; or `χ₀` ordinary,both `π` non-CM,and the same source automorphy. If `z₀`,`z′₀` lie on one irreducible `E_{0,ℂ_p}` component,`Sym^{n−1}r_{π′₀,ι}` is automorphic.

Use the Tate-normalized `GL₂` realization and `GL_n` eigenvariety of [§4.3]; `n≥2`.

The ordinary branch uses the ordinary refinement on its Hida family; it has no numerical noncriticality hypothesis.

([NT I], §2, Thm. 2.33, pp. 50–51.)

<a id="buzzard-kilford-eigencurve"></a>
### 4.6 The tame-level-one 2-adic eigencurve near the boundary (Buzzard–Kilford)

For `p = 2` and `N = 1`, `E₀` lies over the component `W₀⁺` `(χ(−1) = 1)` of weight space, and `w = χ_u(5) − 1` identifies `W₀⁺` with `{|w| < 1}`. Over the annulus `W₀(b) = {|8| < |w| < 1}`, `E₀(b) = κ^{−1}(W₀(b))` is a disjoint union `⊔_{i≥1}X_i` of admissible opens with `κ|_{X_i}` an isomorphism onto `W₀(b)`, and on `X_i` the slope is `i·v₂(w)`.

Every component meets this boundary annulus (NT I Cor. 3.9).

([NT I], §3, Thm. 3.2, pp. 53–54.)

*Needs:* [§4.3].

<a id="level-one-ping-pong"></a>
### 4.7 Symmetric powers for one level-one form give them for all (NT I Theorem 3.1 = Theorem D)

Fix `n ≥ 2`. If `π₀` is an everywhere unramified cuspidal `π` of weight `k ≥ 2` with `Sym^{n−1}r_{π₀,ι}` automorphic for some (equivalently any) p and `ι`, then `Sym^{n−1}r_{π,ι}` is automorphic for every everywhere unramified cuspidal `π` of weight `≥ 2`.

On `X_i` and its companion `X_i′`, the crystalline root identity gives `i+i′=(k−1)/v₂(w)`.

([NT I], §3, Thm. 3.1, p. 53; Introduction pp. 3–4.)

*Needs:* [§4.3].

<a id="steinberg-level-raising"></a>
### 4.8 Level raising to Steinberg for symmetric powers of theta series (NT I Theorems 4.1, 6.1, 7.1)

Let `K=ℚ(i)`,`σ₀` the unique weight5 `Γ₁(4)` cuspidal newform,AI of the unramified K-character of infinity type(4,0). For `n≥3`,`p≡1` mod48n!,`ι:Q̄_p≅ℂ`,`q≠p`,finite K-places `X₀` prime to2pq,and de Rham `ω:G_K→Q̄_p×` with `ωω^c=ε³`/unramified at `X₀`,there is soluble CM F/K split at `X₀` and ordinary RACSDC `Π` on `GL_n(𝔸_F)` with `r̄_Π≅ω̄^{n−1}⊗Sym^{n−1}r̄_{σ₀}|G_F`,equal labelled HT to `ω^{n−1}⊗Sym^{n−1}r_{σ₀}|G_F`,and unramified Steinberg twist at some v|q. NT I7.1 uses7.4 for odd n,Anastassiades–Thorne for even n. Only residual matching is asserted.

For `n=3` one may take the prime `p=577≡1` mod 288.

([NT I], §7, Thm. 7.1 and the fixed seed, pp. 82–83; §4 Thm. 4.1, pp. 59–60; §6 Thm. 6.1, pp. 75–76.)

*Needs:* [§4.3].

<a id="one-level-one-symmetric-power"></a>
### 4.9 One level-one form with automorphic `Sym^{n−1}` (NT I Theorem 7.6 = Theorem E)

For every `n ≥ 3` there is a cuspidal, everywhere unramified `π` of `GL₂(𝔸_ℚ)` of weight `k ≥ 2` such that `Sym^{n−1}r_{π,ι}` is automorphic for every `ι`.

Proof route: the CM congruence construction and level-one propagation; retain the stated residual-image conditions.

([NT I], §7, Thm. 7.6, p. 90; Introduction p. 4.)

*Needs:* [§4.3].

<a id="n-regular-congruences"></a>
### 4.10 Congruences to n-regular forms (NT I Proposition 8.3)

Let `π` be non-CM of weight `k ≥ 2` with `π_l` non-supercuspidal for every l. Then there are a prime p > max(`2(n + 1)`, `(n − 1)k`), `ι`, and `π′` of weight k with `r̄_{π,ι}(G_ℚ) ⊇ a` conjugate of `SL₂(F_p)`, `π_p` and `π′_p` unramified, `r̄_{π,ι} ≅ r̄_{π′,ι}`, and `π′_l` non-supercuspidal with all accessible refinements n-regular wherever `π′_l` is ramified.

The displayed bound on p puts every `Sym^{n−1}` residual lift in the required Fontaine–Laffaille range.

([NT I], §8, Prop. 8.3, pp. 92–93.)

*Needs:* [§4.3].

<a id="symmetric-power-automorphy-lifting"></a>
### 4.11 Automorphy lifting for symmetric powers (NT II Theorem 2.1)

For totally real F,any p,`n≥1`,weight-two RA cuspidal non-CM `GL₂` `π`,`π′` nonordinary at every v|p,assume `r̄_π≅r̄_π′` (fixed `ι`),equal Steinberg-twist status at every finite `v∤p`,and conjugate `PSL₂(𝔽_{p^a})≤P` `r̄_π(G_F)≤PGL₂(𝔽_{p^a})`,`p^a`>max(5,`2n−1`). Then automorphic `Sym^{n−1}r_π′` implies automorphic `Sym^{n−1}r_π` (NT II2.1). This allows `p=2` without `p>n` or residual symmetric-power irreducibility.

The `p≤n` cases use Newton–Thorne’s functoriality lifting; vanishing of the symmetric-power residual dual Selmer group is not assumed.

([NT II], §2, Thm. 2.1 and proof, pp. 5–6.)

*Needs:* [§1.7](#projective-image-sandwich); [§4.3].

<a id="level-one-symmetric-powers"></a>
### 4.12 Symmetric power functoriality in level one (NT I Theorem 7.7 = Theorem A)

For every `n ≥ 2` and every RAC automorphic representation `π` of `GL₂(𝔸_ℚ)` of level 1, `Sym^{n−1}π` exists as a RAC automorphic representation of `GL_n(𝔸_ℚ)`.

API: `TauCeti.SymmetricPower.symPower_levelOne`.

Proof route: [§4.9] supplies a seed, [§4.7] propagates it, and [§4.15] removes the chosen prime.

For `Δ` this gives entire L-functions of every positive symmetric power.

([NT I], Introduction, Thm. A, p. 2; §7, Thm. 7.7, p. 91.)

*Needs:* [§4.9]; [§4.7]; [§1.10], its all-place predicate; [§4.15].

<a id="cm-and-weight-one-symmetric-powers"></a>
### 4.13 Symmetric powers of CM and weight-one forms (NT II Theorem A.1)

Let `π` be cuspidal on `GL₂(𝔸_ℚ)` with `π_∞` a holomorphic limit of discrete series, or `π` the automorphic induction of a Hecke character of a quadratic field. Then `Sym^nπ` exists for every `n ≥ 1` (usually not cuspidal).

API: `TauCeti.SymmetricPower.symPower_CM_weightOne`.

CM: decompose powers of a quadratic induction into induced characters. Solvable weight one: pass to the finite central product of the binary tetrahedral/octahedral group with scalar roots of unity. Their irreducible dimensions are 1,1,1,2,2,2,3 and 1,1,2,2,2,3,3,4 respectively (square sums 24/48); dimensions 3/4 are `Sym²/Sym³` twists. Solve scalar descent through the abelianized central quotient, without choosing a square root of det. Class field theory, rank-two solvable Artin and the low-rank lifts realize every constituent; this does not invoke general solvable Artin.

Icosahedral construction: if the projective image is `A₅`, `H=(B×µ_{2m})`/⟨`(−1,−1)`⟩, `B=SL₂(𝔽₅)`,`m≥1`, and H/B is detected by det. Its nine B-types are 1,`τ`,`τ′`,`Sym²τ`,`Sym²τ′`,`Sym³τ`,`τ⊗τ′`,`Sym⁴τ`,`τ⊗Sym²τ′`, of dimensions 1,2,2,3,3,4,4,5,6. Their character table on the nine classes has squared-dimension sum 120; the two four-dimensional types have opposite central sign and the six-dimensional type has sign `−1` (correct Wang’`s +6` entry at `−I`).

A cyclotomic coefficient automorphism `σ` exchanges `τ`,`τ′` and acts on scalar roots by `ζ↦ζ^a`, a odd and invertible mod 2m; coefficient conjugation makes `ρ^σ` automorphic. The displayed types have scalar exponents `b=0`,1,a,2,2a,3,`1+a`,4,`1+2a`. For a constituent of `Sym^nρ`, `n−b` is even; solve `2k≡n−b` mod 2m and twist by `det^k`. In particular `Sym⁵ρ=ρ⊗Sym²ρ^σ⊗det^{2−a}`.

Proof route: decompose using the nine-class character table and the central congruence solver; realize ranks `≤5` by Gelbart–Jacquet/Kim–Shahidi/Kim, the other rank four by `GL₂×GL₂` and rank six by `GL₂×GL₃`, then apply the class-field twists. Brauer/Hecke nonvanishing and the Rankin–Selberg pole criterion make each irreducible finite-image constituent cuspidal (Wang 3.1/Thm. D pp.12–14); the full power is generally isobaric.

**API.** `icosahedralCentralProduct / centralProductIrrep / icosahedralIrrepBasis` construct H's quotient description, its parity-compatible irreducibles and the character basis; `symPower_centralDecomposition` computes the multiplicities and determinant twists; `symPower_CM_weightOne` assembles their isobaric automorphic lifts.

**Checks.**

- Quadratic CM induction has noncuspidal `Sym²`:induced square-character plus middle character.
- Nine B-dimensions square-sum120;the two dimension4 signs differ,dimension6 has sign−. The printed `+6` fails.
- `m=1` fixes scalar parity;`m=2` odd exponents have no even-type-compatible square root;raising n by2 raises the determinant twist by1.
- `Sym⁰ρ=1`,`Sym⁵ρ` is the displayed twisted dimension6 tensor;`Sym⁶τ=Sym²τ′⊕(τ⊗τ′)`,dimensions3+4.
- Every `Sym^n` constituent has scalar `ζ^n`;dimension-weighted multiplicities sum `n+1`;characters sum correctly on all nine B-classes for **every** n.

([NT II], Appendix A, Thm. A.1 and proof, p.28; [Wang](#ref-wang-icosahedral), §1 Prop. 1.1 and Cors. 1.2–1.3, pp.5–8, and Prop. 3.1/Thm. D and their proofs, pp.12–14. The reduction is credited there to Kim's non-normal quintic induction paper; no proof of the quintic induction itself is required here.)

*Needs:* [§1.10]; [§1.11](#ramakrishnan-tensor-product); [§1.13]; [§1.14]; ClassFieldTheory; GL2T R17.5.

<a id="l-function-equidistribution-criterion"></a>
### 4.14 Equidistribution from L-functions (Kedlaya Theorem 24.2 and the Weyl criterion)

For compact K,class space X,`x_i∈X` with integer norms `N_i≥2`,assume scalar `∏(1−N_i^{−s})⁻¹` converges absolutely on `Re s>1`,continues near `Re s≥1` without zeros/poles except a simple pole1. Assume each irreducible `ρ` has `L(s,ρ)=∏det(1−ρ(x_i)N_i^{−s})⁻¹` absolutely convergent there,continuing likewise without zeros/poles on `Re s≥1` except possibly1. Then `#{i:N_i≤n}∼n/log n` and `Σ_{N_i≤n}χ(x_i)=c(χ)n/log n+o(n/log n)`,`c=−ord₁L`. If norm multiplicities are bounded,the nondecreasing-norm sequence is Haar-equidistributed iff `c(χ)=0` for every nontrivial irreducible `χ`. Arbitrary reorderings are excluded.

API: `TauCeti.SymmetricPower.equidistributed_of_lFunctions`.

Proof route: logarithmic derivatives and Wiener–Ikehara give the character asymptotics (Kedlaya 24.2); Peter–Weyl density and character orthogonality give the Weyl criterion. Import the Tauberian theorem from ArithmeticDirichletSeries Layers 9–10, as contracted by AnalyticNumberTheoryPartI.

**Checks.**

- For the trivial character, the simple pole has `c(1)=1` and recovers the counting asymptotic n/log n, rather than zero.
- For `K=C₂`, the nontrivial character takes values `+1` and `−1`. Its `c(χ)=0` forces each class to have asymptotic proportion 1/2, recovering the Chebotarev instance of Kedlaya §22.5.
- If at most M terms share a norm, cutting a norm-ordered sequence partway through a tie changes a character sum by at most `M·dim` `ρ`. After division by the number of terms this tends to zero. An arbitrary reordering has no such bound, so the norm-order hypothesis is essential for this deduction.

([Kedlaya], §§24.1–24.3, Thm. 24.1, Thm. 24.2 and Conjecture 24.3, printed pp. 133–134.)

*Needs:* ArithmeticDirichletSeries (Completed) Layers 9–10; RepresentationTheory.CompactGroups, Layer 5; RepresentationTheory.CompactGroups, Layer 6; `Matrix.trace`.

<a id="one-prime-criterion"></a>
### 4.15 One prime suffices for symmetric power functoriality (Newton–Thorne, Lemma 2.1)

For totally real F,non-CM RAESDC `GL₂` `π` (no nontrivial Hecke self-twist),`n≥1`,equivalent are: cuspidal `Π` on `GL_n` with `rec(Π_v)=Sym^{n−1}rec(π_v)` at **every** place;automorphy of `Sym^{n−1}r_{π,ι}` for every prime/`ι`;and automorphy for one prime/`ι` ([§0.2]).

API: `TauCeti.SymmetricPower.onePrime`.

Proof route: NT Lemma 2.1/Clozel 3.13, coefficient conjugation and compatible Frobenius traces with Chebotarev. Changing `ι` may change `π` to `σπ`; its infinity type is `σ`-conjugated.

([NT Hilbert], Lemma 2.1, §2, p. 9; proof pp. 9–10; [Clozel], Thm. 3.13, p. 112, proof pp. 112–129.)

*Needs:* [§1.10], only the all-place predicate and low-rank identities; AG2.2; Chebotarev, Layer 10. This theorem supplies the Galois equivalence in §1.10.

<a id="large-residual-image-density-one"></a>
### 4.16 Large residual image for a density-one set of primes (Clozel–Thorne, Lemma 7.5)

Let E be an imaginary CM field and `π` a RACSDC automorphic representation of `GL₂(𝔸_E)` with `Sym²π` cuspidal. Then there is a set L of rational primes of Dirichlet density one such that for all `l ∈ L` and `ι : Q̄_l ≅ ℂ`, `r̄_ι(π)` is irreducible with image containing a conjugate of `SL₂(F_l)`.

API: `TauCeti.SymmetricPower.largeImage`.

This is an automorphic-system adapter to PAI §2.12 `rank_two_large_residual_image` (equivalently §2.26 `corrected_rank_two_large_image`), rather than a separate image theorem. Attach the rank-two compatible system; cuspidality of `Sym²π` excludes quadratic induction, and its distinct Hodge numbers exclude Artin up to twist. The supplier gives containment on `G_{Ẽ}`, where Ẽ is the normal closure of E; its inclusion in `G_E` gives the stated conclusion, for every coefficient place over each l.

**Checks.**

- For quadratic induction, `Sym²` contains a character and is not cuspidal; this branch fails the hypothesis.
- An Artin representation up to a character twist has equal labelled Hodge numbers and fails regularity.
- Containment of a conjugate of `SL₂(𝔽_l)` on `G_{Ẽ}` implies containment on `G_E`; it does not assert `SL₂` over the full coefficient residue field.

([CT17], §7, Lemma 7.5 and proof, manuscript p. 48.)

*Needs:* PAI §§2.12 and 2.26, rank-two density-one large image; AG2.2, the automorphic compatible system and its labelled Hodge numbers.

<a id="completed-symmetric-power-l-function"></a>
### 4.17 The completed symmetric power L-function `Λ(Sym^n E, s)`

For `E/ℚ` elliptic,`n≥0`,define `Λ(Sym^nE,s)=N_n^{s/2}γ_n(s)∏_pL_p(Sym^nE,s)`,using `Sym^n` WD factors at **all** primes,`N_n` its conductor,`γ_n` its Hodge archimedean factor (`Γ_ℂ(s−j)` products,plus `Γ_ℝ` for even n),as in Dummigan–Martin–Watkins(2009), with `N₀=1` and `γ₀=Γ_ℝ`. Positive-degree hypotheses are retained in entireness assertions. Removing the nonvanishing entire conductor factor preserves entireness but changes the functional equation.

- `TauCeti.SymmetricPower.completedL`: `Λ` above.
- `TauCeti.SymmetricPower.completedL_eq`: the displayed conductor/`γ`/Euler identity.
- `TauCeti.SymmetricPower.completedL_entire_iff`: entireness iff `N_n^{−s/2}Λ` entire.
- `TauCeti.SymmetricPower.completedL_eq_automorphic`: if `Sym^nπ_E` exists,`Λ(Sym^nE,s)=N_n^{s/2}Λ_AL(Sym^nπ_E,s−n/2)`, where `Λ_AL` is AL’s unbalanced all-place completion in unitary normalization.

Proof route: finite WD factors/conductors by Dummigan–Martin–Watkins §§2–3; the real factor by Martin–Watkins §4.2 and PMCS §1.15. The `n=2` middle-line sign gives `Γ_ℝ(s)Γ_ℂ(s)`.

**Checks.**

- `n = 1: Λ(Sym¹E, s) = N^{s/2}·2(2π)^{−s}Γ(s)·L(E, s)`.
- `n = 0: Λ(Sym⁰E, s) = π^{−s/2}Γ(s/2)ζ(s)`, not entire.
- For `n=2`, `γ₂(s)=Γ_ℝ(s)Γ_ℂ(s)`. Complex conjugation exchanges e and ē on `H¹`; it fixes the symmetric vector eē on the (1,1) line, so the middle sign is `+1`. Relative to `(−1)¹` this selects `Γ_ℝ(s−1+1)=Γ_ℝ(s)`. The exchanged (2,0),(0,2) pair supplies `Γ_ℂ(s)`.
- For n=1 and conductor 11, at s=2 the ratio to the shifted unbalanced automorphic completion is 11.
- Omitting a ramified Euler factor changes the completed function. For the modified expression no functional equation with the specified conductor and epsilon factor is guaranteed; agreement away from bad primes does not identify `Λ`.

For `n=1: Λ=N^{1/2·s}Γ_ℂ(s)L(E,s)`.

([NT II], §1 Introduction, Cor. B, p. 2 (Publ. IHÉS 134, p. 118); [DMW09](#ref-dmw-2009), §§2–3, PDF pp.4–7 (printed pp.1314–1317); [Martin–Watkins](#ref-martin-watkins-2006), §4.2, PDF p.7.)

*Needs:* [PMCS §1.15, system L-functions](../PotentialModularityAndCompatibleSystems/README.md); [§1.10].

<a id="parallel-weight-and-clozel-purity"></a>
### 4.18 Parallel weight and the imaginary-quadratic consequence of purity

For number field F,RA `GL₂` `π` with dominant `λ_τ=(λ_{τ,1},λ_{τ,2})`,parallel weight means `λ_{τ,1}−λ_{τ,2}` constant,equivalently an RA twist of weight`(m−1,0)_τ`,`m≥1`;parallel weight `k≥2` means a twist`(k−2,0)_τ`. For CM F,cuspidal RA `π` satisfies Clozel purity `λ_{τ,1}+λ_{τc,2}=w` constant;imaginary quadratic F then gives parallel weight (BCGNT§1.6).

- `TauCeti.SymmetricPower.IsParallelWeight`: weight-function coordinate differences constant;Lean permits any embedding-index type,AF Layers 5–6 attaches `π`.
- `TauCeti.SymmetricPower.parallelWeight`: `k=λ_{τ,1}−λ_{τ,2}+2`,`≥2` for dominant `λ`,embedding-independent when parallel.
- `TauCeti.SymmetricPower.IsParallelWeight.twist`: adding `a_τ` to both coordinates preserves/reflexively characterizes parallelity.
- Import AF §5.5’s purity identity.
- `TauCeti.SymmetricPower.isParallelWeight_of_imagQuadratic`: for weights indexed by an involution c with every embedding equal to τ or cτ, the identities `λ_{τ,1}+λ_{cτ,2}=w` force parallel weight. Apply AF §5.5 to obtain these identities for imaginary-quadratic cuspidal RA representations.
- `TauCeti.SymmetricPower.parallelWeight_independent`: equal computed k at `τ`,`σ`.

Proof route: Clozel Lemme 4.9 pp.144–145 (also p.112 before 3.13; AF §5.5). Subtract the two CM cross-sum identities: weight differences agree within each conjugate pair, hence globally for imaginary quadratic F. The motivic weight is `w+1`; finite-place purity requires [§4.19].

**Checks.**

- Singleton embedding index makes every weight parallel.
- Two weights(0,0) give `k=2`;elliptic comparison needs the actual attached weight.
- Weights(0,0),(2,0),Hilbert weights2,4,are not parallel.
- Conjugate weights(2,0),(3,1) have cross-sums3,differences2,`k=4`,without coordinate equality.
- Two conjugate pairs(0,0),(0,0) and(1,`−1`),`(1,−1)` have cross-sum0 but differences0,2:CM purity alone does not imply parallelity in higher degree.

([BCGNT], Def. 1.6.1 (Parallel Weight) and the following paragraph, §1.6 Notation, p. 13 (= Def. 1.5.1, §1.5, published p. 11: arXiv numbering and pagination differ); [Clozel], Lemme 4.9 and proof, pp. 144–145.)

*Needs:* AF Layers 5–6; AG2.0 (RA of weight `λ`).

<a id="purity-from-symmetric-powers"></a>
### 4.19 Purity from potential weak automorphy of symmetric powers (BCGNT Lemma 6.1.3)

Let R be a very weakly compatible system of rank 2 of `G_F` with `H_τ = {0, m}` for all `τ`, and `v₀ ∉ S` a finite place. If for infinitely many `n ≥ 1` there is a finite Galois `F_n/F` such that `Sym^{n−1}R|_{F_n}` is weakly automorphic of level prime to the places above `v₀`, then the roots `α₁`, `α₂` of `Q_{v₀}(X)` satisfy `|ια_i|² = q_{v₀}^m` for every `ι`.

API: `TauCeti.SymmetricPower.purity_of_symPowers`.

Proof route: Jacquet–Shalika on the unitary cuspidal constituents gives `|α|^{n−1}≤q^{(n−1)m/2+1/2}` for unbounded n; taking roots and using det gives `|α|²=q^m`.

([BCGNT], Lemma 6.1.3 and proof (Jacquet–Shalika bound [JS81, Cor. 2.5]), §6.1, p. 58 (published p. 52).)

*Needs:* AL.3, Whittaker realizations and parameter estimates; PMCS §§1.7–1.8 (operations on systems).

<a id="non-supercuspidal-symmetric-powers"></a>
### 4.20 Symmetric powers when no local component is supercuspidal (NT I Theorem 8.1 = Theorem B, Corollary C)

Let `π` be a non-CM RAC `π` of `GL₂(𝔸_ℚ)` such that `π_l` has nonzero Jacquet module for every prime l. Then for every `n ≥ 3`, `Sym^{n−1}r_{π,ι}` is automorphic, so `Sym^{n−1}π` exists. In particular (Cor. C) for a semistable elliptic curve `E/ℚ` and each `n≥1` the completed `Λ(Sym^nE, s)` is entire.

API: `TauCeti.SymmetricPower.symPower_of_not_supercuspidal`.

Proof route: NT I 8.2, induction on ramified primes using [§4.5](#eigenvariety-propagation) and [§4.12](#level-one-symmetric-powers); [§4.10](#n-regular-congruences) and [§2.16] transfer to general `π`. For semistable E, modularity and squarefree `Γ₀(N)` give only unramified/Steinberg components; Godement–Jacquet supplies entireness.

([NT I], §8, Thm. 8.1, p. 91; Introduction, Thm. B and Cor. C, p. 2.)

*Needs:* [§1.10]; AL.2.

<a id="bcgnt-potential-automorphy-det-cyclotomic"></a>
### 4.21 Purity and potential automorphy of symmetric powers when `det r_λ = ε^{−m}` (BCGNT Theorem 6.2.1)

For CM F,strongly irreducible rank-two very weakly compatible R with `HT_τ={0,m}`,`m≥1`,`det r_λ=ε^{−m}`,R is pure weight m and each `n≥1` admits finite CM `F_n/F`,Galois over `ℚ`,with automorphic `Sym^{n−1}R|G_{F_n}`. Automorphic means BCGNT6.1.2(2): unramified matching at **all** finite places outside S;bad-place matching is separate. At `m=1` use `ACC+7`.1.12 (Remark6.2.2).

API: `TauCeti.SymmetricPower.bcgnt_detCyclotomic`.

Proof route: BCGNT 6.2.4 gives arbitrarily high weakly automorphic powers unramified at a chosen good place; 6.1.3 gives purity; 6.1.4 with Chebotarev and Varma 1 matches all `v∉S` through irreducibility of pure unramified principal series. Bad-place WD matching remains separate.

([BCGNT], Thm. 6.2.1 and proof, Remark 6.2.2, §6.2, pp. 59–60 (published p. 53); ACC+ inputs also in the proof of Thm. 7.1.1, arXiv p. 69 (published p. 61).)

*Needs:* [§2.38](#potential-weak-automorphy-symmetric-powers) (the exact lifting targets of Layer 2); PMCS §1.21 (density-one residual irreducibility); [§4.19]; AG2.5.

<a id="clozel-thorne-reductions"></a>
### 4.22 Reductions for symmetric powers: Clozel–Thorne's Theorem 7.1, Lemma 7.4, Proposition 7.6 and Newton–Thorne's Proposition 6.1

Let F be totally real, `π` a non-CM RAESDC representation of `GL₂(𝔸_F)`, `p≥5` prime and `0<r<p`. Newton–Thorne Prop. 6.1 produces a soluble totally real E/F, `ι:ℚ̄_p≅ℂ` and RAESDC `π′` on `GL₂(𝔸_E)` with all eight conditions: (1) `Sym^{p+r−1}r_{π,ι}` is automorphic exactly when `Sym^{p+r−1}r_{π′,ι}` is; (2) `π′` has weight 0 and at each v|p is an unramified twist of Steinberg, hence `ι`-ordinary; (3) `det r_{π′,ι}=ε⁻¹`; (4) at some `v₀`, `q_{v₀}≡−1` mod p and `π′` is tamely dihedral of order p; (5) at some `v₁`, `q_{v₁}≡1` mod p and `π′` is an unramified twist of Steinberg; (6) `π′_v` is potentially unramified for `v∤pv₁`; (7) there are primes `t₁`,`t₂>p^{a₀(p)}` and places `w₁`,`w₂` of residue characteristics `p₁`,`p₂>3`, unramified in E, such that `π′_{wᵢ}` is tamely dihedral of order tᵢ and `p₁`,`p₂`,`t₁`,`t₂` are pairwise distinct; (8) let H/E be the ray class field of modulus (8) times all real places, and let S exclude `w₁`,`w₂` and include the primes where `π′` is ramified, where `E/ℚ` is ramified, or whose characteristic is 2 or 3. Then `w₁` splits in `H·E(S)`, and `w₂` splits in `H·E(S∪{w₁})`. Here E(S) is the maximal abelian exponent-two extension unramified outside S, as in §5, p. 38; `a₀(p)≥3` is a threshold with the adequacy property of Lemma 2.3, p. 11. None of these local conditions is replaced by potential diagonalizability.

For fixed `d≥1`,CT7.1 assumes degree-d symmetric-power automorphy for every non-CM RAESDC `GL₂/F` and concludes cuspidal `GL_{d+1}` lifts for every non-CM cusp `π` essentially square-integrable at infinity,matching at **finite** places,with analytic continuation/functional equation.

Full all-place reduction: [Thorne 2024]§8,8.1/8.3 gives `SP_n⇒SP′_n` for non-CM cuspidal `GL₂` essentially discrete at infinity,including mixed parity,completing CT7.1’s finite-place proof. Route:8.2 CM twist,infinitely many quadratic CM descents (Arthur–Clozel III4.2),principal-`SL₂` cuspidality. At infinity restriction to `ℂ×` determines even n;for `n=2m+1` recover the sign from `ω_Π=ω_π^{m(2m+1)}`.

CT7.4: for such `π` and quadratic CM `E/F` with cuspidal `π_E`,choose continuous `χ` with `π_Eχ` RACSDC;unitary infinity`(z/|z|)^{m_τ}`,`p_v+m_τ` odd,`χχᶜ=ω_π⁻¹∘N`. `χ` need not be algebraic. CT7.6 transfers the degree-d RAESDC/F hypothesis to every non-induced RACSDC `GL₂/E`. Route: `ℓ>2(d+2)`,split in E,unramified in field/representation,residual `SL₂(𝔽_ℓ)`,HT span`≤ℓ−2`;finite `φ` makes `r̄(Π)φ` conjugation-invariant with odd `G_F` extension;PD lifting/soluble descent. At discrete-series infinity non-CM is equivalent to cuspidal `Sym²`.

API: `TauCeti.SymmetricPower.clozelThorne_reductions`.

Proof route: ET §§6.24–6.29/PAI Layer 2’s soluble comparisons, [§2.16], [§2.32](#change-of-weight-and-level), [§2.43] and Moret–Bailly for the prescribed `v₀`,`v₁` conditions.

([NT Hilbert],6.1 pp.45–49 and6.5 p.50;[CT17],7.1 p.46,7.4 pp.47–48,7.6 p.49;[Thorne 2024],8.1/8.2/8.3 pp.47–50.)

*Needs:* ET §§6.24, 6.26–6.29; PAI Layer 2, soluble automorphy comparisons; [§2.2]; [§4.15].

<a id="tensor-functoriality-lifting"></a>
### 4.23 Tensor-product functoriality lifting over totally real fields

Let F be totally real, `r≥1`, p any prime, and `π`,`π′` on `GL₂` and `σ` on `GL_r` be RAESDC. Assume `π`,`π′` have weight zero and are non-CM; `r̄_π≅r̄_π′`; `r̄_π(G_F)` contains a conjugate of `SL₂(𝔽_{p^a})` with `p^a>5`. At every v|p require the same ordinary status and the same potentially crystalline status for both, and if `p=2` require both potentially crystalline. At `v∤p` require Steinberg-twist status to agree. Require a perfect subgroup H of `(r̄_π⊗r̄_σ)^{ss}(G_F)` containing an element with 2r distinct eigenvalues; labelled `HT(r_σ)={0,2,…,2r−2}`; automorphy and strong irreducibility of `r_π⊗r_σ`; irreducibility of `r_π′⊗r_σ`. Then the latter tensor product is automorphic.

Proof route: NT Hilbert 4.1 pp.25–26, simultaneous rank-two/rank-2r patching and the tensor map of deformation rings; for `p=2` use the modified Khare–Wintenberger argument pp.35–36. The perfect-subgroup condition persists under soluble base change and is stronger than a size bound.

NT Hilbert5.9 pp.44–`45: p≥5`,`0<r<p`,`M>p^{a₀(p)}`,`SP_{r−1}`,`SP_r`,`SP_{r+1}`,and **all** [§4.22](1)–(8),with `t₁`,`t₂>M`/same ray-class conditions,give residual `SL₂(𝔽_{p^a})`,`p^a>M`,and ordinary RAESDC automorphy of `ϕ_p r_π⊗Sym^{r−1}r_π` on `GL_{2r}`. `ϕ_p` is coefficient arithmetic-Frobenius lift. Route:5.5 under all-primes large image,5.9 supplies it via two good-dihedral places. This is the tensor induction input,not arbitrary tensor functoriality.

**Checks.**

- At `r=1`, `HT(r_σ)={0}` and the tensor rank is two.
- At `r=2`, the tensor-weight multiset `{0,1}+{0,2}` is `[0,1,2,3]`, so the resulting weight is zero; replacing `σ`-weights by {0,1} gives `[0,1,1,2]` with repetitions.
- At `p=2` the field-size bound can hold over `𝔽₈`, but the extra potentially crystalline condition remains.
- A subgroup with nontrivial abelianization is not automatically perfect.
- The coefficient twist `ϕ_p` is not evaluation of a Galois representation at a Frobenius element.

([NT Hilbert], Thm. 4.1 and proof, pp.25–36; Thm. 5.5 pp.40–41; Thm. 5.9 pp.44–45.)

*Needs:* [§4.11]; DeformationAndDerivedPatchingAlgebra Layers 7–9, patching supports; LGD, tensor morphisms and components; GL2ML, local weight-zero lifting; the ray-class constructions of [§4.22].

<a id="acc-purity-rank-two"></a>
### 4.24 Purity and analytic continuation for rank-two systems of weight zero over CM fields (ACC+, Corollary 7.1.13)

ACC+ Cor. 7.1.13: for a CM field F and an irreducible rank-2 very weakly compatible system R with `H_τ={0,1}`, R is pure of weight 1. For every `m≥0` the partial symmetric-power L-function has meromorphic continuation and the completed function with the stated degree`≤m+1` bad factors satisfies a functional equation. If R is strongly irreducible and `m>0`, then `L^S(ι Sym^m R,s)` is holomorphic and nonzero for `Re s≥1+m/2`. The `m=0` function has the Dedekind-zeta pole at `s=1`; it is not covered by nonvanishing/holomorphy. The non-CM elliptic-curve specialization supplies Sato–Tate with its compact-group criterion.

API: `TauCeti.SymmetricPower.acc_purity`.

Proof route: ACC+ 7.1.11/7.1.12 and [§2.22](#acc-auxiliary-primes) give potential automorphy of every power; [§4.19] gives purity.

([ACC+], §7.1, Cor. 7.1.13, p. 201 (Annals p. 1096); §7.1, proof of Cor. 7.1.13, p. 202 (Annals p. 1097).)

*Needs:* [§2.39]; [PMCS §1.15, system L-functions](../PotentialModularityAndCompatibleSystems/README.md).

<a id="serre-equidistribution-criterion"></a>
### 4.25 Serre's equidistribution criterion through L-functions of representations of `ST(π)`

Let F be a number field, S a finite set of finite places of F, ST a compact group and `([π_v])_{v∉S}` conjugacy classes, ordered by nondecreasing norm, with every place retained. For an irreducible representation `ρ` of ST put `L^S(π, ρ, s) = ∏_{v ∉ S}` `det(1 − q_v^{−s}ρ([π_v]))^{−1}`, absolutely convergent for `Re s > 1`. If for every non-trivial irreducible `ρ`, `L^S(π, ρ, s)` has meromorphic continuation to `ℂ`, holomorphic and non-vanishing on `Re s = 1`, then the `[π_v]` are equidistributed for the Haar probability measure of ST (Serre, Ch. I, Appendix). This is the general form of [§4.14].

API: `TauCeti.SymmetricPower.serre_criterion`.

Proof route: [§4.14], Wiener–Ikehara from ArithmeticDirichletSeries Layers 9–10 (AnalyticNumberTheoryPartI’s contract), and uniform approximation by irreducible characters from CompactGroups Layers 5–6.

**Checks.**

- For ST trivial, the counting input is the prime ideal theorem for F with finitely many Euler factors removed.
- For `ST=C₂`, the nontrivial character tests the difference between the two class counts.
- Taking S to be every finite place would make all Euler products 1 and leave no sequence; the finite-S hypothesis excludes this case.

([BCGNT], Proof of Thm. 7.2.3, §7.2, p. 70 (published p. 62).)

*Needs:* ArithmeticDirichletSeries (Completed) Layers 9–10; RepresentationTheory.CompactGroups, Layer 5; RepresentationTheory.CompactGroups, Layer 6.

<a id="bianchi-eichler-shimura"></a>
### 4.26 Bianchi Fourier and parabolic-cohomology comparison

For imaginary quadratic F,nonzero n,`k≥2`,`Y₁(n)` with all `h_F` ideal-class components,and `V=Sym^{k−2}ℂ²⊗conj(Sym^{k−2}ℂ²)` with the form’s central twist,construct a Hecke-equivariant isomorphism from weight-k Bianchi cusp forms to cuspidal/parabolic `H¹(Y₁(n),V)`. In **both** eigensystem directions,normalized `c(O_F,f)=1` gives `T_𝔭` eigenvalue `c(𝔭,f)` for unramified `𝔭`.

`H¹_par` is the boundary-restriction kernel, equivalently the compact-support image. A single `Γ₁(n)` component has diag(`ϖ`,1) only for principal primes `(ϖ)`; arbitrary-ideal operators must move among all ideal-class components. Unequal coefficient weights (k,l) give zero cuspidal parabolic cohomology.

**API.**

- `bianchiCuspToParabolic / bianchiParabolicEquiv`: differential-form map/inverse on full adelic parabolic `H¹`.
- `hecke_equivariant / fourierCoeff_eq_heckeEigenvalue`: Hecke/Fourier–Whittaker comparison.
- `singleComponent_principalHecke / classGroup_componentHecke`: principal action/ideal-class movement,using ALS local systems,Borel–Serre boundary,Hecke chains.

**Checks.**

- `k=2` gives trivial coefficients.
- Nonprincipal primes can change ideal-class component;no scalar action on the principal component alone.
- Dropping the boundary kernel adds Eisenstein cohomology and breaks cuspidal comparison.
- `N𝔭=9`,`k=2` gives `|c(𝔭)|≤6`,not2√3.

Route: Harder3.1 pp.59–61,de Rham/relative Lie cochains,cuspidal injection(3.1.4);3.2.4–5 pp.62–65 residual degrees0,3 with(iii) killing top,so none in degree1 even `k=2`;3.6.2.2 p.74 archimedean degrees1,2 and3.6.1 unequal-weight vanishing. Finite-level invariants give harmonic inverse;`GL₂(𝔸_f)`-equivariance/BCGNT§1.3 normalization give Hecke comparison.

([Harder](#ref-harder-1987), §§3.1–3.2, pp.59–65, and §3.6, pp.73–74, especially (3.6.1) and (3.6.2.2); [BCGNT], §1.3 pp.9–11.)

*Needs:* ALS §5b.6 and its cohomology/Hecke/boundary layers; AF, relative Lie algebra cohomology; GL2T, archimedean Whittaker models. The Fourier/harmonic-form comparison is owned here, rather than imported from Hecke-chain construction alone.

<a id="bianchi-modular-forms"></a>
### 4.27 Bianchi modular forms, their Fourier coefficients and parabolic cohomology

For imaginary quadratic F,a weight-`k≥2`,level-`𝔫` cuspidal Bianchi eigenform is a vector-valued `GL₂(𝔸_F)` function generating RAC `π` of parallel weight k,infinitesimal character `(Sym^{k−2}⊗conj Sym^{k−2})∨`,with `f((t z;0 1))=|t|_FΣ_{α∈F×}c(αtδ_F,f)W(αt_∞)e_F(αz)`,`c(I)=0` unless `I⊂O_F`,`c(O_F)=1`. [§4.26] compares its eigensystems with parabolic cohomology over **all** ideal classes/coefficient `Sym^{k−2}ℂ²⊗conj Sym^{k−2}ℂ²`;single `Γ₁(𝔫)` gives only principal-prime comparison.

- `TauCeti.SymmetricPower.BianchiEigenform`: the weight/level form above.
- `TauCeti.SymmetricPower.BianchiEigenform.coeff`: c(I,f).
- `TauCeti.SymmetricPower.BianchiEigenform.coeff_one`: `c(O_F)=1`.
- `TauCeti.SymmetricPower.BianchiEigenform.coeff_eq_eigenvalue`: `c(𝔭)=T_𝔭` eigenvalue for `𝔭∤𝔫`.
- `TauCeti.SymmetricPower.BianchiEigenform.toAutRep`: generated cuspidal `π`,parallel weight k.

Proof route: the Whittaker Fourier expansion (Hida/Williams), [§4.18] and [§4.26] over ALS’s cohomology/Hecke chains. Fourier support satisfies `c(I,f)=0` for `I⊄O_F`. The domain `ℍ³` is not Hermitian; the Fourier expansion uses the Bessel-type Whittaker function W rather than holomorphic exponentials.

**Checks.**

- A modular non-CM elliptic curve over F of conductor `𝔫` gives a weight-2 Bianchi eigenform normalized by `c(O_F,f)=1`, with `c(𝔭,f)=N(𝔭)+1−#E(F_𝔭)` at good primes.
- Doubling this nonzero form gives `c(O_F,2f)=2`, so it fails normalization and is not a `BianchiEigenform`.
- A normalized Hecke eigenfunction with nonzero Borel–Serre boundary contribution is Eisenstein and fails cuspidality, as detected by §4.26's boundary kernel.

([BCGNT], §1.3 Bianchi Modular Forms, pp. 9–11 (published pp. 8–10).)

*Needs:* ALS ALS.3.

<a id="cg18-conditional-sato-tate"></a>
### 4.28 Conditional Sato–Tate for elliptic curves over arbitrary number fields (Calegari–Geraghty, Theorem 1.1(2))

Assume Calegari–Geraghty's Conjecture B. Let F be any number field and E/F a non-CM elliptic curve. Then the Sato–Tate conjecture holds for E. Status: conditional on Conjecture B.

API: `TauCeti.SymmetricPower.cg18_satoTate`.

Proof route: [§2.31], the tensor trick and [§2.37](#cg18-conditional-potential-modularity), followed by Brauer induction and [§4.14]; retain Conjecture B.

([Calegari–Geraghty](#ref-cg-2018), Thm. 1.1(2), §1, p. 3 = Invent. p. 300; reduction in §10, p. 97 = Invent. p. 428.)

<a id="non-cm-symmetric-powers"></a>
### 4.29 Symmetric power functoriality for all non-CM modular forms (NT II Theorem A, Corollary B)

Let `π` be a RA, cuspidal, non-CM automorphic representation of `GL₂(𝔸_ℚ)`. Then for every `n ≥ 1`, `Sym^nπ` exists as a RAC automorphic representation of `GL_{n+1}(𝔸_ℚ)`. In particular (Cor. B), for every elliptic curve `E/ℚ` without CM and `n ≥ 2`, `Λ(Sym^nE, s)` is entire.

The `n=1` lift is `π` itself; Cor. B is stated for `n≥2`.

API: `TauCeti.SymmetricPower.symPower_nonCM`.

Proof route: induction on the number of supercuspidal primes, based on [§4.20]; NT II 3.1/3.7–11 constructs seasoned congruences with one fewer such prime and [§4.11] transfers automorphy. Modularity and Godement–Jacquet give Cor. B.

CM and weight-one forms use [§4.13](#cm-and-weight-one-symmetric-powers).

([NT II], Introduction, Thm. A and Cor. B, pp. 1–2; §3, Thm. 3.1, p. 20.)

*Needs:* [§1.10]; AL.2.

<a id="all-regular-symmetric-powers"></a>
### 4.30 Symmetric power functoriality for all non-CM regular algebraic `GL₂` representations over totally real fields (Newton–Thorne, Theorem 6.4)

`SP_n` holds for all `n ≥ 2`: for every totally real F and every non-CM cuspidal RA `π` of `GL₂(𝔸_F)`, `Sym^{n−1}π` exists as a RAESDC automorphic representation of `GL_n(𝔸_F)`, in each of the senses of [§4.15].

API: `TauCeti.SymmetricPower.sp_all`.

Proof route: [§1.15] starts the induction; Bertrand writes `n=p+r` with `p≥5` and `0<r<p`. Apply [§4.22], [§4.4] and [§4.23](#tensor-functoriality-lifting) using `SP_p`,`SP_r`,`SP_{p−r}`.

([NT Hilbert], Thm. 6.4 and its proof, §6, p. 50.)

*Needs:* [§1.12]

<a id="sym6-sym8"></a>
### 4.31 Sixth and eighth symmetric powers over totally real fields (Clozel–Thorne, Theorem 6.1)

For totally real F,RAESDC `GL₂` `π` not induced from quadratic CM,`Sym⁶π` is cuspidal `GL₇` if `F∩ℚ(ζ₅)=ℚ`;`Sym⁸π` is cuspidal `GL₉` if `F∩ℚ(ζ₇)=ℚ`. Theorem6.1 reduces to6.2’s Steinberg-at-q level raising via CT II§6;[§4.4] owns its congruence/local-type construction.

API: `TauCeti.SymmetricPower.sym6_sym8`.

Proof route: Clozel–Thorne II §6’s reduction to 6.2, [§4.4]’s smaller-rank premise/residual-ramification argument, and BLGGT potential automorphy.

[§4.30] removes these disjointness assumptions.

([CT17], §6, Thm. 6.1 `(= Thm. 1.1)`, manuscript p. 44 (Thm. 1.1 on p. 2).)

*Needs:* [§1.10]; [§2.26]; [§4.22].

<a id="nt21-semistable-l-functions"></a>
### 4.32 Analytic continuation of symmetric power L-functions of semistable elliptic curves (Newton–Thorne I, Corollary C)

Let `E/ℚ` be a semistable elliptic curve. Then for every `n ≥ 2` the completed symmetric power L-function `Λ(Sym^n E, s)` ([§4.17](#completed-symmetric-power-l-function)) admits an analytic continuation to `ℂ`.

Semistable `E/ℚ` is non-CM.

API: `TauCeti.SymmetricPower.semistable_entire`.

Proof route: [§4.20], Godement–Jacquet and Layer 0’s completed-factor comparison.

([NT I], Introduction, Cor. C, p. 2 (Publ. IHÉS 134, p. 2).)

*Needs:* AL.2 (global Godement–Jacquet theory).

<a id="bcgnt-symmetric-powers-purity"></a>
### 4.33 Purity and potential automorphy of symmetric powers of rank-two systems over CM fields (BCGNT Theorem 7.2.1 = Theorem C)

Let F be a CM field and R a strongly irreducible very weakly compatible system of rank 2 of `G_F` with `H_τ = {0, m}`, `m ≥ 1`. Then R is pure of weight m and for each `n ≥ 1` there is a finite CM F′/F, Galois over `ℚ`, with `Sym^{n−1}R|_{G_{F′}}` automorphic. If R is irreducible but not strongly irreducible, R is pure of weight m and each `Sym^{n−1}R` is a direct sum of automorphic compatible systems of dimension `≤ 2`.

API: `TauCeti.SymmetricPower.bcgnt_theoremC`.

Proof route: BCGNT 7.1.1’s rank-one determinant normalization, finite-order square after quadratic CM extension and twisting, then [§4.21]. For the induced branch use ACC+ 7.1.2 and rank-one purity: powers split into induced rank-two systems and an even-degree rank-one term; distinct HT weights exclude Artin up to twist.

([BCGNT], Thm. 7.2.1 and proof, §7.2, p. 69 (published pp. 61–62); Thm. C, §1, arXiv p. 4 (published p. 4).)

*Needs:* ET §§6.24, 6.26–6.29.

<a id="sato-tate-elliptic-curves"></a>
### 4.34 The Sato–Tate theorem for elliptic curves over `ℚ`

Let `E/ℚ` be an elliptic curve without complex multiplication, and for good p let `α_p` be the root of `X² − a_pX + p` with nonnegative imaginary part and `θ_p = arg(α_p/√p) ∈ [0, π]`. Then `(θ_p)` is equidistributed for `(2/π)sin²θ` `dθ`, the push-forward of Haar measure on SU(2).

API: `TauCeti.SymmetricPower.satoTate_elliptic`.

Proof route: `SU₂` irreducibles are `Sym^n` and the Weyl measure is `(2/π)sin²θ` `dθ` (Kedlaya §24.5). For `n≥1`, [§4.29](#non-cm-symmetric-powers) and AL.3 make `L(Sym^nE,s+n/2)` entire and nonzero on `Re s≥1`; apply [§4.14].

∫`₀^πsin²θ` `dθ=π/2`. Potential automorphy with Brauer nonvanishing already suffices; full entireness is stronger than needed.

([Kedlaya], §§24.4–24.5, Conjecture 24.4 and Thms. 24.5–24.6, printed pp. 134–135.)

*Needs:* AL.3; [§2.40]; EllipticCurveModularity, Layer R29.6.

<a id="hilbert-symmetric-powers"></a>
### 4.35 Symmetric power functoriality for Hilbert modular forms (Newton–Thorne, Theorem A = Theorem 6.5(1))

For totally real F,non-CM cuspidal `GL₂` `π` essentially square-integrable at every infinite place (weights `k_v≥2`,including mixed parity),every `n≥2` admits cuspidal `GL_n` `Π_n` with `rec(Π_{n,v})=Sym^{n−1}rec(π_v)` at **every** place.

API: `TauCeti.SymmetricPower.hilbert`.

Proof route: same parity uses [§4.30] after a twist; mixed parity uses Thorne 2024 Thm. 8.1/Prop. 8.3 as specified in [§4.22], including infinity.

([NT Hilbert], Thm. A, §1, p. 1 = Thm. 6.5(1) and proof, §6, p. 50; [Thorne 2024], Thm. 8.1 and proof, pp. 48–50.)

*Needs:* AG §§3.10–3.14 and 4.3–4.7.

<a id="cm-field-symmetric-powers"></a>
### 4.36 Symmetric powers of conjugate self-dual `GL₂` representations over CM fields (Newton–Thorne, Theorem 6.5(2))

Let E be a CM field and `π` a RAECSDC automorphic representation of `GL₂(𝔸_E)` not automorphically induced from a quadratic extension. Then for every `n ≥ 2` `Sym^{n−1}π` exists: there is a cuspidal `Π_n` of `GL_n(𝔸_E)` with `rec(Π_{n,w}) ≅ Sym^{n−1} ∘ rec(π_w)` for every place w.

API: `TauCeti.SymmetricPower.cmField`.

Proof route: Clozel–Thorne 7.6/[§4.22], auxiliary character and odd extension, [§4.30], then base change.

General Bianchi forms instead use [§4.42](#bianchi-sato-tate)’s potential route.

([NT Hilbert], Thm. 6.5(2) and its proof, §6, p. 50.)

*Needs:* ET §§6.24, 6.26–6.29.

<a id="symmetric-powers-up-to-eight"></a>
### 4.37 Symmetric powers up to eight and holomorphy of `L(s, Sym^n π)` (Clozel–Thorne, Corollary 7.2)

Let F be totally real, `π` cuspidal on `GL₂(𝔸_F)` with `π_∞` essentially square-integrable, not induced from a quadratic CM extension. Then there is a cuspidal `Π` on `GL_{r+1}(𝔸_F)` with `Sym^r rec(π_v) ≅ rec(Π_v)` for all finite v in each case: (1) any F, `1 ≤ r ≤ 4`; (2) `F ∩ ℚ(ζ₅) = ℚ`, `r ∈ {5, 6}`; (3) `F ∩ ℚ(ζ₃₅) = ℚ`, `r = 7`; (4) `F ∩ ℚ(ζ₇) = ℚ`, `r = 8`. Consequently (Cor. 1.3) `L(s, Sym^n π)` is entire with the expected functional equation for `1 ≤ n ≤ 8` under the corresponding disjointness.

API: `TauCeti.SymmetricPower.upToEight`.

Proof route: [§1.15], [§4.31](#sym6-sym8), the reduction completed by Thorne 2024 §8, and Godement–Jacquet.

[§4.35](#hilbert-symmetric-powers) removes the disjointness hypotheses.

**Checks.**

- Degree one gives the original cuspidal standard L-function.
- Degree zero gives `ζ_F(s)` with its pole at 1, including for π attached to Δ; the entireness conclusion excludes it.
- For `F=ℚ`, all the displayed disjointness conditions hold, including the degree-eight case.

([CT17], §7, Cor. 7.2, manuscript pp. 46–47 (Cors. 1.2, 1.3 on p. 2).)

*Needs:* AL.2 (global Godement–Jacquet theory).

<a id="bianchi-ramanujan"></a>
### 4.38 The Ramanujan conjecture in parallel weight over imaginary CM fields (BCGNT Theorem A = Theorem 7.1.1)

For CM F,RAC parallel-weight `GL₂` `π`,every finite `π_v` is essentially tempered. After algebraic twist to weight(`k−2`,0),`k≥2`,unramified `rec^T` eigenvalues have modulus `N(v)^((k−1)/2)`. Untwisted,set `w=λ_{τ,1}+λ_{τc,2}`;`q_v^{−w/2}rec(π_v)(Frob_v)` has unit-modulus eigenvalues. Parallel weight fixes coordinate differences,not the untwisted sum.

API: `TauCeti.SymmetricPower.bianchi_ramanujan`.

Proof route: Clozel’s cross-sums and parallel differences give an algebraic weight-normalizing twist; quadratic CM base change and a finite twist normalize det to `ε^{1−k}`. Distinct HT weights exclude Artin up to twist; rank-one purity handles induction, [§4.21] the strongly irreducible branch. For ramified places use BCGNT 7.1.1’s soluble base change and ACC+ 7.1.15/LGC, not good-place purity alone.

([BCGNT], Thm. 7.1.1 and proof, §7.1, pp. 68–69 (published p. 61); Thm. A, §1, arXiv p. 3 (published p. 3).)

*Needs:* [§4.33]; [§4.18]; AG2.2; AG2.5.

<a id="sato-tate-group"></a>
### 4.39 The Sato–Tate group `ST(π)` of a non-CM regular algebraic `GL₂` representation over a CM field

For CM F,non-CM cuspidal RA `GL₂` `π` of weight `λ` with `λ_{τ,1}+λ_{τc,2}=w`,`ω_π=|·|^{−w}ψ`,unitary type-`A₀` `ψ`,define `ST(π)={g∈U₂(ℝ):det(g)^a=1}` if `ψ` has finite order a,and `U₂(ℝ)` otherwise. This is compact in `GL₂(ℂ)`;for unramified essentially tempered `π_v`,the class of `q_v^{−w/2}rec(π_v)(Frob_v)` meets it in a unique ST-conjugacy class `[π_v]` (7.2.2).

- `TauCeti.SymmetricPower.SatoTateGroup`: the subgroup of `Matrix.unitaryGroup (Fin 2) ℂ` cut out by `det(g)^a=1`, for `a∈ℕ`. Use the order of ψ when finite and `a=0` when infinite; its image in `GL₂(ℂ)` is `ST(π)`.
- `TauCeti.SymmetricPower.SatoTateGroup.isCompact`: this determinant kernel is compact for every a, including zero.
- `TauCeti.SymmetricPower.SatoTateGroup.ofFiniteOrder`: for `a>0`, membership is exactly `det(g)^a=1` inside `U₂`.
- `TauCeti.SymmetricPower.SatoTateGroup.orderOne`: membership at `a=1` is membership in `SU₂`.
- `TauCeti.SymmetricPower.SatoTateGroup.orderZero`: the kernel at `a=0` is the full unitary group.
- `TauCeti.SymmetricPower.satoTateClass`: `[π_v] ∈ ST(π)`/conjugacy for `π_v` unramified and essentially tempered.
- `TauCeti.SymmetricPower.satoTateClass_unique`: for every a, two elements of the determinant kernel are conjugate in `GL₂(ℂ)` iff conjugate in that kernel. In particular `[π_v]` is unique (Lemma 7.2.2).

Proof route: the determinant condition is closed in `U₂`, hence compact. Essential temperedness gives unit-modulus normalized eigenvalues with product `ψ(ϖ_v)`; `GL₂`-conjugate unitary elements are `SU₂`-conjugate. Parallel-weight temperedness is supplied by [§4.38]; arbitrary-weight local class construction retains it as a hypothesis.

**Checks.**

- A non-CM elliptic curve has `ψ=1`,`ST=SU₂=U₂(ℝ)₁`.
- For order two, `diag(−1,1)` belongs to ST and is outside `SU₂`.
- For order three, `diag(−1,1)` is excluded, while `diag(ζ₃,1)` belongs for a primitive cubic root `ζ₃`.
- For infinite-order ψ, `diag(z,1)` belongs for every `|z|=1`, since ST is `U₂`.

For non-CM elliptic curves `ψ=1` and `ST=SU₂`.

([BCGNT], Def. of `ST(π)` and Lemma 7.2.2 with proof, §7.2, pp. 69–70 (published p. 62).)

*Needs:* [C-EQUIDISTRIBUTION].

<a id="bianchi-fourier-ramanujan"></a>
### 4.40 The Ramanujan bound for Fourier coefficients of Bianchi eigenforms (BCGNT Theorem E)

Let F be imaginary quadratic, f a cuspidal Bianchi eigenform of level `𝔫` and weight k normalised by `c(O_F, f) = 1`, and `𝔭` a prime ideal not dividing `𝔫`. Then `|c(𝔭, f)| ≤ 2N(𝔭)^{(k−1)/2}`.

API: `TauCeti.SymmetricPower.bianchi_coeff_bound`.

Proof route: the Fourier coefficient is `α+β`; [§4.38] gives `|α|=|β|=N(𝔭)^{(k−1)/2}`.

([BCGNT], Thm. E, §1.3, p. 10 (published p. 8).)

*Needs:* [§4.27].

<a id="bianchi-mass-equidistribution"></a>
### 4.41 Mass equidistribution for level-one Bianchi eigenforms of growing weight (BCGNT Theorem G)

Let F be imaginary quadratic of class number one and `Γ = SL₂(O_F)`. For any sequence of level-one Bianchi eigenforms f of weight tending to `∞`, the normalised measures `μ_f` on `Γ\ℍ³` (Marshall) converge weakly to the normalised hyperbolic volume.

F imaginary quadratic of class number one; level one.

API: `TauCeti.SymmetricPower.bianchi_massEquidistribution`.

Proof route: Marshall Cor. 3 with the Ramanujan bound supplied by [§4.38].

([BCGNT], Thm. G and proof, §1.3, p. 11 (published p. 10).)

*Needs:* [§4.27].

<a id="bianchi-sato-tate"></a>
### 4.42 The Sato–Tate conjecture in parallel weight over imaginary CM fields (BCGNT Theorem B = Theorem 7.2.3)

Let F be an imaginary CM field and `π` a cuspidal RA representation of `GL₂(𝔸_F)` of parallel weight, not CM, with `ω_π = |·|^{−w}ψ`. Let `S_π` be the set of finite places where `π` is ramified. Then the classes `[π_v] ∈ ST(π)`, `v ∉ S_π`, are equidistributed for the Haar probability measure of `ST(π)`.

API: `TauCeti.SymmetricPower.bianchi_satoTate`.

Proof route: each nontrivial ST irreducible is a `Sym^{n−1}⊗det^k` twist. [§4.33], Brauer induction and AL.3’s boundary nonvanishing give [§4.25](#serre-equidistribution-criterion).

([BCGNT], Thm. 7.2.3, §7.2, p. 70 (published p. 62); Thm. B, §1, arXiv p. 3 (published p. 3).)

*Needs:* [§4.39](#sato-tate-group); AL.3 (strong multiplicity one); AL.3 (Rankin–Selberg boundary nonvanishing).

<a id="bianchi-parabolic-cohomology-ramanujan"></a>
### 4.43 The Ramanujan bound for Hecke eigenvalues on parabolic cohomology of Bianchi groups (BCGNT Theorem F)

Let F be imaginary quadratic, `𝔫 ≠ 0`, `k ≥ 2`, and `H_par ⊂ H¹(Γ₁(𝔫), Sym^{k−2}ℂ² ⊗ overline(Sym^{k−2}ℂ²))` (or the sum over the components when `h_F > 1`). For a principal prime `𝔭 ∤ 𝔫` and an eigenvalue `a_𝔭` of `T_𝔭` on `H_par`, `|a_𝔭| ≤ 2N(𝔭)^{(k−1)/2}`.

API: `TauCeti.SymmetricPower.bianchi_cohomology_bound`.

Proof route: [§4.26]’s reverse eigensystem comparison and [§4.40](#bianchi-fourier-ramanujan).

([BCGNT], Thm. F, §1.3, p. 11 (published p. 9).)

*Needs:* [§4.27].

### Examples

For a non-CM elliptic curve, the degree-two motivic symmetric power has real factor `Γ_ℝ(s)Γ_ℂ(s)`, and the automorphic `GL₃` function uses `s−1`. Degree zero instead gives the completed zeta function and has poles. At SU(2) the standard conjugacy class diag(`e^{iθ}`,`e^{−iθ}`) has trace 2cos `θ`; Haar pushes forward to `(2/π)sin²θ` `dθ` on `[0,π]`. Integrating 1 gives one, and the nontrivial SU(2) characters have mean zero. Determinant characters of `ST(π)` must also be tested when the determinant has nontrivial finite order.

### Dependencies

Use the exact supplier contracts and the prerequisites cited in this layer’s targets.

## Layer 5: generic transfers and Langlands conjectures

<a id="ckpss-generic-transfer"></a>
### 5.1 Generic transfer from split classical groups to `GL_N` and its image (Cogdell–Kim–Piatetski-Shapiro–Shahidi; Ginzburg–Rallis–Soudry)

For number field k,split `G_n=SO_{2n+1}`,`SO_{2n}(n≥2)`,`Sp_{2n}`,`N=2n`,2n,`2n+1`,every globally generic cuspidal `π` lifts to `GL_N`,matching archimedean/all but finitely many unramified finite places. Image/converse: `Π=⊞Π_i` with distinct unitary self-dual cuspidal `Π_i`;odd SO requires exterior-square poles at1,symplectic type;Sp/even SO requires symmetric-square poles,orthogonal type,and **total** trivial central character,not each constituent (CKPSS7.1–2/GRS).

API: `TauCeti.Functoriality.ckpss`.

Proof route: first prove forward generic transfer using Langlands–Shahidi factors and the `GL_N` converse theorem. After [§5.4](#grs-descent), deduce the image/converse characterization.

BCG Remark 2.5’s `Sp₁₀₄` application needs a separate local unramifiedness input for level one.

([CKPSS04], Thm. 1.1, §1, p. 169 (Publ. Math. IHÉS 99); Thm. 7.1, §7.1, p. 195 (Publ. Math. IHÉS 99); [BCG25](#ref-bcg-2025), Remark 2.5, §2, p. 8; journal p. 515; Thm. 7.2, PDF p.34 (printed p.196).)

*Needs:* For forward transfer, [§1.6], [§3.4]’s pole/type theory and AL.4. The image/converse characterization additionally needs [§5.4](#grs-descent).

<a id="functoriality-conjecture"></a>
### 5.2 Langlands' principle of functoriality (frontier statement)

For a number field F, use Galois-form L-groups `{}^LG=Ĝ⋊Γ_F`. For connected reductive G′,G with G quasi-split,and L-homomorphism `ρ:{}^LG′→{}^LG` compatible with Galois projections,Functoriality(G′,G,`ρ`) asserts: every automorphic `π′` admits automorphic `π` with `c_v(π)=ρ(c_v(π′))` outside finitely many places,both unramified. The strong refinement uses the separately supplied local Weil groups and requires all-place LLC compatibility. This is a conjectural **hypothesis**;known cases are Layers1,4,5.

- `TauCeti.Functoriality.Functoriality`: this proposition.
- `TauCeti.Functoriality.Functoriality.comp`: weak functoriality composes L-maps/lifts.
- `TauCeti.Functoriality.Functoriality.id`: identity lift.
- `TauCeti.Functoriality.Functoriality.of_gelbartJacquet`: cuspidal `GL₂` `Sym²`;noncuspidal isobaric inputs separately use character/direct-sum transfer and isobaric assembly.
- `TauCeti.Functoriality.Functoriality.sym`: unrestricted cuspidal `GL₂` symmetric powers remain frontier;Layer4 supplies its stated RA,Hilbert discrete-series,monomial/weight-one cases.

Def. of a conjectural proposition; known triples do not prove other instances.

**Checks.**

- `G′=1`,`G=GL₁`,`ρ(w)=(1,w)` gives trivial Hecke character;`ρ(w)=(r(w),w)` for finite-order r gives its class-field Hecke character.
- `GL_n→GL₁` by det lifts `π` to `ω_π`.
- For `G′=1`,`{}^LG′=Γ_F`; a finite-image Artin representation r factors through a finite quotient Gal(E/F). Weak functoriality gives almost-everywhere Artin matching;all-place matching is separate.
- `GL₁` map(z,w)↦(z,1) fails projection compatibility;a dual-group-only map is insufficient.

([The principle of functoriality], §4, Conjecture (Langlands [L1]), pp. 44–45 (Bull. AMS 40 (2003)).)

*Needs:* [§1.6]; ReductiveGroups Layers 6–8; ReductiveGroupsPartII RG2.5.

<a id="local-langlands-conjecture-general"></a>
### 5.3 The local Langlands conjecture for a general reductive group (frontier statement)

For quasi-split G/local `F_v`,`LLC(G,F_v)` asserts a finite-to-one surjection `π↦φ_π` from irreducible admissible smooth representations (nonarchimedean) or `(𝔤,K)`-modules (archimedean) to Ĝ-conjugacy classes of L-parameters `L_{F_v}→{}^LG`,`L_{F_v}=W_{F_v}` archimedean,`W_{F_v}×SU₂` nonarchimedean. Require centre,twist,parabolic-induction/local-factor compatibility where supplied,and `GL_n` bijectivity. Known: archimedean (Langlands),`GL_n` (Harris–Taylor/Henniart/Scholze),quasi-split classical ([§3.15],conditionally),`GSp₄` ([§3.5]).

Frontier statement; status conjectural except in the listed cases. Known `GL_n` finite-place exports are for characteristic-zero local fields in SR §SR.5.2. General residual/archimedean fields need their own stated source scope; the `GSp₄` factor characterization distinguishes generic and nongeneric supercuspidal representations.

- `TauCeti.Functoriality.LocalLanglands`: this proposition.
- `TauCeti.Functoriality.LocalLanglands.gl`: SR §SR.5.2’s char-zero nonarchimedean `GL_n` export;other field scopes need separate sources.
- `TauCeti.Functoriality.LocalLanglands.archimedean`: Langlands’ real LLC.
- `TauCeti.Functoriality.LocalLanglands.gsp4`: Gan–Takeda over char-zero nonarchimedean fields,with exact generic/nongeneric/Plancherel characterization.

Def. of the conjectural proposition, with the displayed known cases.

**Checks.**

- `G = GL₁: LLC` is local class field theory `(Hom(F_v^×, ℂ^×) ≅ Hom(W_{F_v}, ℂ^×))`.
- For `G = SL₂` the map is not injective: L-packets of size 2 and 4 occur ([§3.13]).
- For `GL₂` and an irreducible unramified principal series `χ₁ × χ₂`, `φ = χ₁ ⊕ χ₂` through `Art^{−1}`, with `N=0`.
- If `χ₁/χ₂=|·|^{±1}`, normalized induction is reducible. At `(χ₁,χ₂)=(|·|^{1/2},|·|^{−1/2})`, its spherical and Steinberg constituents have the same Weil semisimplification but monodromy ranks 0 and 1; test them separately, as in ET §10.33.

A semisimple parameter assignment alone does not prove this assertion.

([The principle of functoriality], §5, p. 47 (Bull. AMS 40 (2003)).)

*Needs:* ReductiveGroups Layers 6–8; ReductiveGroupsPartII RG2.5; SR §SR.5.2.

<a id="grs-descent"></a>
### 5.4 Automorphic descent of Ginzburg–Rallis–Soudry (with Jiang–Soudry's irreducibility)

For number field F,generic split `SO_{2n+1}` parameter `φ=⊞τ_i`,with distinct unitary self-dual symplectic cuspidal `GL_{n_i}` `τ_i`,`Σn_i=2n`,Fourier–Jacobi/Bessel descent of residual Eisenstein `E_τ` with parameter`⊞(τ_i,2)` gives nonzero globally generic cuspidal `π₀`,lifting to`⊞τ_i`. It is irreducible (Jiang–Soudry),the generic `Π̃_φ` member. Other quasi-split classical descents give nonzero cuspidal generic representations,with structure subject to local Bessel uniqueness over Vogan packets.

API: `TauCeti.Functoriality.grsDescent`.

Proof route: unfold the GRS residual Fourier–Jacobi coefficients for nonvanishing/cuspidality; Jiang–Soudry’s local converse theorem gives odd-orthogonal irreducibility. For other groups retain Jiang–Zhang’s stated Bessel-model uniqueness and separate irreducibility scope.

([JZ20], §1.1, p. 6; published p. 744; §7.2, p. 75; published p. 809.)

*Needs:* [§3.8]; [§5.1], only forward generic transfer; AutomorphicSpectralTheory, Layer AS.6 (invariant trace formula).

<a id="local-descent-mp2n"></a>
### 5.5 Local descent to `Mp_{2n}` and globalisation of square-integrable representations of `GL_{2n}` (Gan–Ichino Appendix A)

For char-zero nonarchimedean `F_v`,`n≥1`,nontrivial `ψ_v`,let `Irr_msqr(GL_{2n})` consist of normalized inductions `τ₁×`⋯×`τ_k` of distinct square-integrable `GL_{2n_i}` blocks,`Σn_i=n`,each with exterior-square pole0. Fourier–Jacobi descent `D_ψ` via normalized intertwiner `at½`/oscillator integral bijects this set with genuine `ψ`-generic square-integrable `Mp_{2n}`. `D_{ψ⁻¹}(τ)` has `τ`’s Rankin–Selberg `γ` against every generic `GL_m`,`m≥1`. ILM Appendix B proves the real case. Gan–Ichino A.1: for number field F,nonempty finite nonarchimedean S,nonarchimedean `v₀∉S`,and **single** square-integrable symplectic `τ_v` at `S∪{v₀}`,`τ_v₀` supercuspidal,there is cuspidal `GL_{2n}` T matching there,principal series at other finite places,with exterior-square pole1 and `L(½,T)≠0`.

In Prop. A.2 the local genuine `ψ_v`-generic representations are square-integrable, `π_{v₀}` is supercuspidal and, when `n=1`, `π_{v₀}` is not the odd Weil representation for `ψ_{v₀}`. The conclusion globalizes these `π_v` and is principal series at every other finite place. Supercuspidality of the theta lift is used in the deduction of A.1; it is not a replacement for the stated A.2 hypotheses.

**API.**

- `MetaplecticSquareIntegrableInput`: distinct inducing blocks,poles,`ψ`.
- `fourierJacobiDescent`, `descent_nonzero`, `descent_bijective`: genuine generic square-integrable output/bijection.
- `gammaFactor_descent`: every generic `GL_m` comparison with the inverse-character convention.
- `globalize_genericMetaplectic`, `globalize_symplecticGL`: prescribed places,auxiliary supercuspidal,central value.

**Checks.**

- One symplectic square-integrable block is allowed;an orthogonal block without exterior-square pole fails.
- Two distinct symplectic blocks descend square-integrably despite nonsquare-integrable GL induction;repeated blocks fail `Irr_msqr`.
- Rank1 auxiliary globalization excludes the odd Weil representation (A.2).
- `D_{ψ⁻¹}` uses `ψ` on both `γ` sides;changing only descent loses the convention.
- The real local theorem does not supply a nonarchimedean auxiliary place or remove global hypotheses.

Proof route: ILM 3.1’s local bijection, Gan–Ichino A.2’s generic metaplectic globalization, theta lift to `SO_{2n+1}`, then [§5.1]. ILM 4.6 compares theta and descent; its 4.3 is a Bessel/genericity statement, not all-place transfer.

([Ichino–Lapid–Mao](#ref-ilm), Thm. 3.1 pp.10–11, Prop. 4.6 and its proof pp.20–21, Appendix B pp.28–32; [Gan–Ichino], Appendix A, proof of Prop. A.1, pp. 29–30; published pp. 1001–1002; Appendix A, proof of Prop. A.1, p. 30; published p. 1002.)

*Needs:* [§3.1].

<a id="global-langlands-reciprocity-conjecture"></a>
### 5.6 Global Langlands reciprocity for `GL_n` (frontier statement)

Reciprocity(F,n) asserts: every continuous irreducible finite-image `r:G_F→GL_n(ℂ)` in [§1.2]’s arithmetic Artin convention has a cuspidal `GL_n` automorphic `π` with `rec(π_v)≅(r|W_{F_v})∨` at **every** place. Weak almost-everywhere matching is separate;uniqueness alone does not give bad factors. Strong reciprocity gives full Artin entireness for nontrivial r;trivial rank1 gives the zeta pole. Regular geometric `ℓ`-adic reciprocity is a separate frontier. Known here:rank1 class field theory,odd rank2/`ℚ` Langlands–Tunnell/Khare–Wintenberger,totally odd rank2/totally real Pilloni–Stroh.

- `TauCeti.Functoriality.Reciprocity`: this strong proposition.
- `TauCeti.Functoriality.Reciprocity.one`: class field theory.
- `TauCeti.Functoriality.Reciprocity.of_functoriality`: refined all-place functoriality **with cuspidal lift** implies strong reciprocity;weak matching is separate.
- `TauCeti.Functoriality.Reciprocity.implies_artin`: nontrivial irreducible r gives entireness by Godement–Jacquet;trivial r gives Dedekind zeta.

Def. of the frontier proposition; Layer 1 supplies the stated finite-image known cases. Regular-geometric BLGGT/NT realizations use the separate refinement and its full local-comparison hypotheses.

**Checks.**

- `n = 1`: Reciprocity(F, 1) is Artin reciprocity.
- For `K/ℚ` quadratic and a finite-order character `χ` of `G_K` with `χ≠χ^c`, the irreducible `Ind_{G_K}^{G_ℚ}χ` corresponds to the cuspidal automorphic induction of the associated Hecke character.
- For reducible `r = χ₁ ⊕ χ₂` the matching `π` is the isobaric `χ₁ ⊞ χ₂`, not cuspidal: irreducibility is needed.

([The principle of functoriality], §4, Conjecture (Langlands [L1]) for `G′ = {1}`, p. 45 (Bull. AMS 40 (2003)).)

*Needs:* [§5.2]; [§1.2].

<a id="fs-bundles-and-lisse-category"></a>
### 5.7 Bundles on the relative curve and their lisse categories

**Relative curves.** For every nonarchimedean local field E with residue field `𝔽_q` of characteristic p, uniformizer π and every `S∈Perf_{𝔽_q}`, use AutomorphicGaloisRepresentationsPartII AG2.6, **Relative Fargues–Fontaine curves and degree-one divisors**. Here `relativePeriodChart / relativeFarguesFontaineCurve / relativeDegreeOneDivisor` are comparison statements identifying the charts, curve `X_{E,S}` and marked divisors used in the categorical targets with that supplier's objects. The identifications respect change of pseudouniformizer, gluing, pullback in S and finite local-field extension with its residue-field map and Frobenius powers. They carry the untilt correspondence, `Div¹_E=Spd(E)/φ^ℤ` and degree-one modification interface to the supplied ones.

For affinoid `S=Spa(R,R⁺)`, the comparisons retain ramified Witt coefficients `W_{O_E}(R⁺)` in mixed characteristic and `R⁺[[π]]` in equal characteristic, the two deleted zero loci and the q-power Frobenius quotient. At `E=ℚ_p` and field-valued S they agree with the supplier's fixed-field comparison to FarguesFontaineDiamonds. No adic morphism `X_{E,S}→S` is assumed.

**Checks.**

- For `E=ℚ_p` and field-valued S, recover the fixed-field curve and its diamond comparison.
- For `E=𝔽_q((π))`, the integral coefficient lift is `R⁺[[π]]`; mixed-characteristic Witt coefficients would give the wrong characteristic.
- For ramified `E/ℚ_p`, the coefficients are ramified Witt vectors over `O_E`, retaining π; ordinary Witt vectors alone do not encode that ramification.
- Gluing a disconnected S retains both open-and-closed pieces; a construction only on perfectoid fields does not supply this relative object.
- A characteristic-p perfectoid base without an `𝔽_q`-structure is outside `Perf_{𝔽_q}`. An untilt over E gives a degree-one Cartier divisor, whereas its double has degree two.

([Fargues–Scholze], §II.1, Propositions II.1.1–II.1.3 pp.47–49, Definition II.1.15 and Propositions II.1.16–II.1.18 pp.54–56, Definition II.1.19 p.56.)

For such E and any connected reductive `G/E`, use AutomorphicGaloisRepresentationsPartII AG2.6, **Bundle strata, lisse categories and the geometric Hecke action**. Its `BunG`, `newtonStratum`, `DLisBunG`, `HeckeModification` and `HeckeFunctor` supply the torsor stack, all Newton strata, stable lisse-solid category and finite-leg Hecke action. Use its stratum restriction/extension functors, compact generators and finite-Newton-support criterion, integral Satake equivalence, normalized ULA kernels, both Hecke adjoints and coherent fusion/coalescence/Weil actions. Retain `ℓ≠p`, the chosen `√q` and coefficients over `ℤ_ℓ[√q]`, and the supplier's integral pinning restrictions. The neutral category is SR.0d's derived smooth `G(E)`-category; the other strata remain present.

The targets below identify the geometric inputs to the singular-support and Whittaker constructions with these supplied objects. On the same relative curves, transport torsors and modifications by the preceding identifications; the induced category equivalences intertwine restriction, extension, Satake kernels and Hecke transforms, with their coefficient and finite-leg coherence.

**API.**

- `BunG / newtonStratum / trivialStratum`: identify the torsor stack and Newton inclusions with the supplied stack and strata, including `[*/G(E)]`.
- `DLisBunG / compactObjects`: identify the lisse category, restriction/extension and compact subcategory with the supplied ones.
- `HeckeModification / satakeSheaf / HeckeFunctor`: identify the modification correspondence, Satake sheaf and transform with the supplied ones.
- `SatakeFlatULA / satakeFusion / collisionRestriction_fullyFaithful`: transport the supplier's coefficient-flat ULA subcategory, fusion and collision full faithfulness.
- `satakeFibre / boundedPeterWeyl / satakeTannakaGroup / pinnedDualComparison`: identify the supplied fibre, its adjoints and integral tensor reconstruction, preserving the pinning, Tate twists and prime2 restriction.
- `relativeULADual / normalizedSatakeKernel / heckeTransform_preservesDLis`: compare the supplied ULA duals and normalized kernels; identify their solid `♮` and torsion-étale `!` transforms on ULA kernels and their lisse restrictions.
- `HeckeFunctor_coalescence / _fusion / _weilAction`: intertwine the supplied coherent leg/composition/Weil identities and neutral smooth comparison, retaining compact preservation.

**Checks.**

- `GL₁` degree strata are `ℤ`;the neutral automorphism group is `E×`.
- Standard rank-one modification changes degree;degree-zero-only Hecke action fails.
- Zero is compact and exact Hecke transforms preserve it.
- Transposing two legs gives coherent commutation,beyond `K₀` equality.
- `PGL₂` minuscule `ℙ¹` has fibre `Λ⊕Λ(−1)`;omitting the twist breaks Weil pinning.
- Infinitely many nonzero Newton restrictions preclude compactness even when each is compact.

- Tensor-unit fusion fixes kernels;three-leg fusion is associative;exchanging odd components gives the parity sign.
- Point-support Peter–Weyl adjoint is `Λ`;`ℙ¹`’s two finite-free cohomology groups survive `modℓ`;fibre commutes with coefficient reduction. Rational fibres alone do not suffice.
- Trivial ULA kernel is self-dual;standard kernel dual is normalized contragredient;evaluation/coevaluation composites are identities,testing both Hecke adjoints.

([Fargues–Scholze], Def. III.1.2 and Prop. III.1.3 pp.88–89, Thm. III.2.4 pp.91–92 and Thm. IV.1.19 pp.112–113; Def. VI.9.1 and Prop. VI.9.4 pp.226–230, Props. VI.10.1–VI.10.3 pp.230–234, Thm. VI.11.1 and proof pp.235–239; Prop. VII.3.1 pp.257–258, Def. VII.6.1 pp.268–269, Props. VII.7.1–VII.7.4 pp.271–274; Prop. IX.2.1, Thm. IX.2.2 and Cors. IX.2.3–IX.2.4 pp.321–324.)

*Needs:* AutomorphicGaloisRepresentationsPartII AG2.6, **Relative Fargues–Fontaine curves and degree-one divisors** and **Bundle strata, lisse categories and the geometric Hecke action**, with the target names above; EnhancedDerivedSheaves E0 and E5, equivalences of stable categories and their Ind-completions; SR.0d, the neutral derived smooth comparison.

<a id="fs-parameter-stack"></a>
### 5.8 The Weil cocycle stack and its coherent support

Fix finite-quotient Q pinned `W_E`-action on `Ĝ`, `ℓ≠p` and FS VIII coefficients Λ. Use AutomorphicGaloisRepresentationsPartII AG2.6, **The parameter stack and geometric spectral action**, for `parameterStack=Z¹(W_E,Ĝ)_Λ/Ĝ`, its universal torsor, finite-wild open-and-closed levels and perfect categories. Its cocycle carrier and continuity are those of SR.6.1–2, including coefficient base change and the continuous extension. Write `Par_G` for this same quotient. The target `parameterStack` here identifies the stack used for coherent support with that supplied quotient, including stabilizers; the perfect-generation comparisons below use the supplier's integral generation theorem.

On this same stack, construct the cotangent/obstruction and singular-support theory: compare each level's LCI structure over `ℤ_ℓ` with the supplied flat cocycle scheme; form quasicompact-support `Perf_qc`, bounded coherent categories and nilpotent singular support defining `D_coh,Nilp^{b,qc}`. Identify `Perf_qc` with the quasicompact-support subcategory of the supplied perfect category. Nilpotent support is automatic in characteristic-zero coefficients/banal `ℓ`, but retained at integral bad primes.

At `φ`,tangent/cotangent are `RΓ(W_E,ĝ_φ)[1]/RΓ(W_E,ĝ*_φ(1))[1]`. Sing uses `H¹` of dual cotangent;Hochschild self-Ext support on syntomic charts over regular noetherian bases must be coherent,smooth-descending,and zero-section iff perfect. Nilpotence:coadjoint orbit closure contains0;`ĝ≅ĝ*` needs a hypothesis. Integral route:`B=R`/(regular `f₁`,…,`f_c`),R smooth regular noetherian;commuting degree2 CI operators make `Ext*_B(M,N)` finite over `B[u₁,…,u_c]` when `Ext*_R(M,N)` is totally finite ([Gulliksen](#ref-gulliksen-1974)3.1(ii)pp.174–175,3.2/proof pp.175–180). Localize/truncate/compare Hochschild-cotangent actions. [Arinkin–Gaitsgory](#ref-arinkin-gaitsgory) Appendix D Thm. D pp.135–136(v3) alone covers char-zero fields. [Jorgensen](#ref-jorgensen)1.2 p.2 gives `pd_B(M)<n` iff `Ext^i_B(M,M)=0` for `n≤i≤n+c`,`n≥1`. FS VIII.2.9 reduces complexes modulo perfect cones to modules;CI Gorenstein duality transfers eventual self-Ext vanishing,not arbitrary Gorenstein duality.

LCI proof route: use the imported finite-wild relation `σ⁻¹τσ=τ^q`, continuous Weil `cd=2` and Euler characteristic zero. Fix prime-to-`ℓ` inertial type, pass to its reductive centralizer and stratify the tame unipotent part; orbit plus centralizer dimension is dim Ĝ. The expected-dimension bound gives LCI and agrees with imported flatness/fibre dimension; unobstructedness is not assumed.

For `ℓ∤|π₁(Ĝ)_tor|`, use the supplier's integral perfect-generation comparison. Identify its good-filtration and prime-to-`ℓ` central-cover models with the models on the syntomic charts used for singular support. Compare the twisted-power, relation-fibre and finite-wild-level generators inside the same `Ind Perf(BĜ)`, retaining derived relation fibres and coefficient reduction. Dual root data identify this prime restriction with `ℓ∤|π₀Z(G)|`. The good-filtration and animated presentations use the supplied generators/relations description.

**API.**

- `GoodFiltration / goodFiltration_cohomologyCriterion / goodFiltration_tensor / goodFiltration_centralizerRestriction`: identify the filtration models with those in the supplier’s generation comparison, transporting acyclicity, tensor products and centralizer restriction under the supplier's solvable finite prime-to-`ℓ` action hypotheses.
- `identitySection_perfGenerated / twistedPower_perfGenerated / relationFibre_perfGenerated / wildLevel_perfGenerated`: compare the supplied prime-restricted tame/wild generators with the chart models, including derived relation fibres.
- `weilCocycleScheme / parameterStack / levelOpenClosed`: identify the supplied cocycle scheme, quotient and finite-wild levels, including `Λ`-base change and continuity; `level_lci`: the LCI chart structure on those same levels used for cotangent and support theory.
- `universalParameterTorsor`: identify the supplied `Ĝ⋊Q`-torsor and its `W_E`-equivariance on these charts, retaining stabilizers.
- `perfectQC / coherentBoundedQC / nilpotentSingularSupport`: categories/support,level restriction/extension bounds.
- `parameter_invariantBaseChange / parameter_perfGeneration`: transport the supplier’s FS I.8.2 comparison to the chart categories, with its prime restriction; coarse semisimple classes cannot replace the torsor/categories.

**Checks.**

- Unramified rank1 cocycles are Frobenius values;quotient retains Ĝ stabilizers.
- Noncompact level unions need not have quasicompact-support structure sheaves.
- `GL₂` WD data with equal semisimple Weil part but `N=0`/rank1 remain distinct.
- Non-nilpotent singular support fails the integral predicate despite quasicompact support.
- `B=k`[[x,y]]/(xy),`M=(x)` has infinite pd despite vanishing odd positive self-Ext (Jorgensen1.6 pp.3–4);finite projectives have zero positive Ext/zero-section support.

- Trivial module/∇`(λ)` admit good filtrations,tensor-stable;`SL₂`/char2 `Sym²` has stable span(`x²`,`y²`),hence need not be semisimple.
- `PGL_ℓ` has `π₁`-torsion order`ℓ` and fails the integral generation hypothesis;torus torsion is0;inverting`ℓ` recovers the rational case.
- Free groups on0/1 generators give BĜ/Ĝ-conjugation quotient;relations require derived fibres with continuous `H¹/H²` tangent/obstruction spaces.
- Cyclic order `p≠ℓ` averaging uses `p⁻¹`,fixes invariants/commutes with reduction;order`ℓ` in char`ℓ` lacks that contraction.

([Fargues–Scholze], Thms. VIII.1.3 and VIII.5.1 with proofs, pp.278–281 and 293–315; Prop. VIII.2.1–Cor. VIII.2.3 pp.281–282, Defs. VIII.2.6/VIII.2.8 and Thms. VIII.2.7/VIII.2.9 pp.283–284, Prop. VIII.2.11 pp.284–285; §I.10 pp.37–38 for the conjectural support convention.)

*Needs:* AutomorphicGaloisRepresentationsPartII AG2.6, **The parameter stack and geometric spectral action**, `parameterStack` and its torsor/perfect-generation comparisons; SR §§SR.6.1–SR.6.2, the common cocycle carrier; SchemeAndStackFoundations, quotient-stack charts; EnhancedDerivedSheaves E5, stable categories and Ind-completion; ReductiveGroupsPartII RG2.5, dual root data; ClassFieldTheory Layer 9, Weil groups. The LCI/cotangent comparison, complete-intersection operators, finite generation, perfectness criterion and smooth descent specified here supply singular support on the supplied parameter stack.

<a id="categorical-llc-construction"></a>
### 5.9 The spectral action and canonical Whittaker adjunction

For `Λ=O_L`, `L/ℚ_ℓ(√q)` finite, `ℓ≠p` and `ℓ∤|π₀Z(G)|`, use AutomorphicGaloisRepresentationsPartII AG2.6, **The parameter stack and geometric spectral action**. It supplies the equivalence between compactly supported `Perf(Par_G)`-actions on a small idempotent-complete `Λ`-linear stable C and finite-I-functorial, coalescence-compatible exact `Rep_Λ(Q^I)`-linear monoidal functors
`Rep_Λ((Ĝ⋊Q)^I) → End_Λ(C)^{B W_E^I}`.
Use its universal torsor and integral generators/relations comparison on §5.8's identified stack. Compact support retains an X-dependent finite wild level for each `X∈C`. Over characteristic-zero coefficient fields, only `ℓ≠p` is required.

The comparisons `spectralActionEquiv` and `compactlySupportedAction` identify these descriptions with the supplied universal equivalence, preserving the finite-leg coherences and per-object level bounds. Its rational and integral animated presentations are transported by the §5.8 comparisons. Use the supplied `geometricSpectralAction` on `D_lis(Bun_G,Λ)`, its `excursionOperator` and `semisimpleParameter`. Intertwine them with §5.7's category equivalence and §5.8's stack equivalence, retaining coefficient/restriction naturality and the common SR.6.3 excursion algebra.

For quasi-split G and chosen generic character `ψ`, extend coefficients to an algebraic `L′/L` containing every value of ψ, and put `Λ′=O_{L′}[1/d]`, `d=|π₀Z(G)|`. On the supplied stack and lisse category, base change the spectral action to Λ′ and construct `W_ψ` as extension by zero of c-`Ind_{U(E)}^{G(E)}ψ` from `Bun_G¹`. Construct `Φ(M)=Act_M(W_ψ)` on `Ind Perf_qc` over Λ′ and its presentability right adjoint R over the same coefficients. These Whittaker targets extend the supplied action; the coherent equivalence is the **next conjectural target**.

**API.**

- `animatedParameterCategory / freeGroupParameterModule / animatedToContinuousPerf`: identify the animated, free-group and continuous perfect-complex models with those in the supplier's universal-action comparison, respecting the derived relation fibres of §5.8.
- `spectralActionEquiv / compactlySupportedAction`: identify the universal coalescent Weil-system/action equivalence and its per-object level bounds with the supplied ones.
- `geometricSpectralAction / excursionOperator / semisimpleParameter`: intertwine the supplied Hecke action, operators and parameters with the category/stack comparisons of §§5.7–5.8. Semisimple parameters of Schur-irreducibles over algebraically closed coefficient fields retain the supplier's scope without the integral prime restriction.
- `whittakerSheaf / whittakerActionFunctor / whittakerRightAdjoint`: construct the compact-induction extension and canonical adjunction from the supplied action over Λ′, with unit, counit and Perf-linearity. This specified adjunction fixes the conjecture's functors.

**Checks.**

- Tensor unit acts identically.
- After colimit extension,`O_spectral` acts on `W_ψ` as `W_ψ`;no global quasicompact support is asserted.
- Each X may have its own finite wild level without a uniform level.
- `ℓ|d` requires inverting d for the integral statement.
- Adjunction alone gives neither full faithfulness nor essential-image identification.
- For `GL₂/ℚ_p`, a nontrivial smooth character of `U≅ℚ_p` requires roots of unity of unbounded p-power order; no finite ℓ-adic L contains all its values. The Whittaker construction therefore uses L′.

- Free generators0/1/n give Rep(Ĝ)/O(Ĝ)-modules/`O(Ĝ^n)`-modules with diagonal conjugation;dropping that action changes the categories.
- Swapping generators swaps factors;coalescence matches universal monoidal multiplication;group relations match §5.8’s derived fibres.
- At integral bad primes,nonsplit representation extensions remain extensions;semisimplifying violates the universal property.

([Fargues–Scholze], Thm. I.10.1 pp.37–38 and the construction preceding Conjecture I.10.2 p.38; Thms. X.0.1–X.0.2 pp.339–340, Props. X.1.1–X.1.3 pp.341–344 and Props. X.3.1–X.3.4 pp.348–350. The geometric carriers and universal action are supplied by AutomorphicGaloisRepresentationsPartII AG2.6; §§5.7–5.8 identify them and add coherent support.)

*Needs:* AutomorphicGaloisRepresentationsPartII AG2.6, **The parameter stack and geometric spectral action**, `geometricSpectralAction`, `excursionOperator`, `semisimpleParameter` and the universal-action comparison; [§5.7]; [§5.8](#fs-parameter-stack); SR §SR.6.3, the common excursion algebra; EnhancedDerivedSheaves E5:presentability and E5:abstract, coefficient extension, Ind-completion and adjoints.

<a id="categorical-local-langlands-conjecture"></a>
### 5.10 The categorical local Langlands conjecture of Fargues–Scholze (frontier statement)

FS I.10.2: for nonarchimedean E,residue p/cardinality q,`ℓ≠p`,quasi-split G,Borel B,generic `ψ:U(E)→O_L×`,algebraic `L/ℚ_ℓ` with `√q∈O_L`,put `d=|π₀Z(G)|`,`Λ=O_L`[1/d]. Extend the spectral action on neutral-stratum `W_ψ=c`-`Ind_{U(E)}^{G(E)}ψ` by colimits to `Φ:Ind` `Perf^{qc}(Par_G)→D_lis(Bun_G,Λ)`. Its **canonical** right adjoint is conjecturally fully faithful on compacts,inducing `Perf(Par_G)`-linear `D_lis^ω≃D_coh`,`Nilp^{b,qc}(Par_G)`:bounded coherent,quasicompact support,nilpotent singular support. This stable-`∞`-categorical adjunction is stronger than semisimple parameters. For any torus,Zou6.4.1 proves it over `ℤ_ℓ`,`ℓ≠p`;6.4.5 gives t-exactness,6.4.7 scalar extension,and no `√q` is needed.

- `TauCeti.Functoriality.CategoricalLLC`: the canonical compact/coherent equivalence with stated coefficient/support conditions.
- `TauCeti.Functoriality.CategoricalLLC.implies_semisimple`: compatibility with FS parametrization.
- `TauCeti.Functoriality.CategoricalLLC.torus`: Zou6.4.1/5,6.4.7’s canonical `ℤ_ℓ` torus equivalence,t-exact/scalar-compatible,no `√q`.

Def. of FS I.10.2 using [§5.7]’s constructions and the imported enhanced/diamond foundations.

**Checks.**

- `GL₁` fixed-degree compact complexes correspond to perfect complexes on character-gerbe weight pieces;parameter/Bernstein actions match local class field theory.
- `GL₂` `r=|·|^{1/2}⊕|·|^{−1/2}`,`N=0`/rank1 gives equal semisimple Weil parts but distinct monodromy;the support interface must distinguish them.
- After Ind-completion/component restriction,`Φ(O)=W_ψ`;neither global sheaf is required to have quasicompact support.

No LLC(G,E) or general functoriality instance is inferred.

([Fargues–Scholze], §I.10, Conjecture I.10.2, p. 38; [Zou](#ref-zou-2024), Thms. 6.4.1, 6.4.5 and Remark 6.4.7, pp. 25–27.)

*Needs:* [§5.3](#local-langlands-conjecture-general); [§5.9].

<a id="symmetric-power-functoriality-implies-ramanujan"></a>
### 5.11 Symmetric power functoriality implies the Ramanujan bound (Langlands' argument)

For unitary cuspidal `GL₂/𝔸_F` `π`,assume compatible unitary cuspidal or unitary-constituent isobaric realizations of `Symⁿπ` and `Symⁿπ∨` for all `n≥1` (unbounded positive n suffice),possibly over finite extensions of F. Then `π_v` is tempered wherever unramified: Rankin–Selberg/Jacquet–Shalika gives `|α_v|^n<q_v^{1/2}` for every n,so `|α_v|=1` using the dual/determinant. Arbitrary nonunitary isobaric realizations do not suffice.

API: `TauCeti.Functoriality.ramanujan_of_symPower`.

Proof route: Jacquet–Shalika on unitary constituents and local symmetric-power matching give `|α_v|^n<q_v^{1/2}`. At w|v of residue degree f, cancel f in `|α_v|^{fn}<q_v^{f/2}`; let n grow, then use the dual/determinant for equality. Raw absolute values are not invariant under base change.

([ACC+], §1, paragraph after Thm. 1.0.2, p. 3.)

*Needs:* [§5.2]; [§1.10]; AL.3, Whittaker realizations and parameter estimates; [EndoscopicTransferAndUnitaryTraceComparison §6.24, cyclic base change](../EndoscopicTransferAndUnitaryTraceComparison/README.md).

### Examples

The identity L-homomorphism fixes each Satake conjugacy class, and composition of two all-place lifts composes their local parameters. For a character of `GL₁` the local parameter is one-dimensional; for `SL₂` packet fibers can have several members, so a bijection is not the general local Langlands predicate. Cyclic induction from a Galois-invariant character is noncuspidal and cannot supply the generic cuspidal conclusion of descent.

### Dependencies

Use the exact supplier contracts and the prerequisites cited in this layer’s targets.

## Downstream consumers

Siegel modularity and abelian-surface modularity consume the classical packet, descent, weight-change and symplectic-pairing comparisons. Automorphic L-function applications consume the common-extension potential-automorphy and all-place symmetric-power results. Rank-two CM arithmetic consumes the purity and Sato–Tate conclusions. Each consumer keeps the field, irreducibility, local-condition and trace formula hypotheses of the theorem it uses.


## References

Unless marked journal/published or otherwise, locators use the linked edition below. Repeated edition labels are omitted; alternate page correspondences remain explicit.

<a id="ref-howe-duality"></a>
- Wee Teck Gan and Shuichiro Takeda, *A proof of the Howe duality conjecture*, arXiv:1407.1995v3, Theorem 1.2, pp.1–3. [Primary text](https://arxiv.org/abs/1407.1995v3).

<a id="ref-ilm"></a>
- Atsushi Ichino, Erez Lapid and Zhengyu Mao, *On the formal degrees of square-integrable representations of odd special orthogonal and metaplectic groups*, arXiv:1404.2909v2, Theorem 3.1 and Proposition 4.6. [Primary text](https://arxiv.org/abs/1404.2909v2).

<a id="ref-shahidi-1997"></a>
- Freydoon Shahidi, *On non-vanishing of twisted symmetric and exterior square L-functions for GL(n)*, Pacific J. Math., Special Issue (1997), pp.311–322. [Primary PDF](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p17-s.pdf).

<a id="ref-qian-ordinarity"></a>
- Lie Qian, *Ordinarity of local Galois representations arising from Dwork motives*, arXiv:2103.00106v1 (2021), Theorems 1.1, 1.4, 1.6, 1.8 and §4. [Primary text](https://arxiv.org/abs/2103.00106v1).

<a id="ref-akt"></a>
- Patrick Allen, Chandrashekhar Khare and Jack Thorne, *Modularity of `GL₂` over imaginary CM fields*, arXiv:1910.12986v2, §9. [Primary text](https://arxiv.org/abs/1910.12986v2).

<a id="ref-ant"></a>
- Patrick Allen, James Newton and Jack Thorne, *Automorphy lifting for residually reducible l-adic Galois representations, II*, arXiv:1912.11269v2, Theorems 1.1 and 6.1. [Primary text](https://arxiv.org/abs/1912.11269v2).

<a id="ref-nt-selmer"></a>
- James Newton and Jack Thorne, *Adjoint Selmer groups of automorphic Galois representations of unitary type*, arXiv:1912.11265v3, Theorems A–B and Definition 2.23. [Primary text](https://arxiv.org/abs/1912.11265v3).

<a id="ref-at"></a>
- Christos Anastassiades and Jack Thorne, *Raising the level of automorphic representations of `GL₂ₙ` of unitary type*, arXiv:1912.11267v2, Theorem 5.1, pp.19–20. [Primary text](https://arxiv.org/abs/1912.11267v2).

<a id="ref-serre-1981"></a>
- Jean-Pierre Serre, *Quelques applications du théorème de densité de Chebotarev*, Publ. Math. IHÉS 54 (1981), §8.2, Theorem 20 and Corollary 2, pp.188–190. [Primary text](https://www.numdam.org/item/PMIHES_1981__54__123_0/).

<a id="ref-blggt-2014-v4"></a>
- Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor. [Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4). (9 December 2013), 93 pages; published in Ann. of Math. (2) 179 (2014), 501–609. Printed page = PDF page.

<a id="ref-newton-thorne-I"></a>
- James Newton and Jack A. Thorne. [Symmetric power functoriality for holomorphic modular forms](https://arxiv.org/pdf/1912.11261v3). (27 September 2021), 101 pages; published in Publ. Math. IHÉS 134 (2021), 1–116. Printed page = PDF page.

<a id="ref-newton-thorne-II"></a>
- James Newton and Jack A. Thorne. [Symmetric power functoriality for holomorphic modular forms, II](https://arxiv.org/pdf/2009.07180v2). (27 September 2021), 30 pages; published in Publ. Math. IHÉS 134 (2021), 117–152.

<a id="ref-kedlaya-ant-2025"></a>
- Kiran S. Kedlaya. [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf). Author PreTeXt PDF, last modified 21 December 2025, 154 PDF pages.

<a id="ref-acc-2023"></a>
- P. B. Allen, F. Calegari, A. Caraiani, T. Gee, D. Helm, B. V. Le Hung, J. Newton, P. Scholze, R. Taylor, J. A. Thorne. [Potential automorphy over CM fields](https://arxiv.org/pdf/1812.09999v2). (16 Jun 2022; accepted version) / Ann. of Math. 197 (2023), no. 3, 897–1113

<a id="ref-agikms-2024"></a>
- Hiraku Atobe, Wee Teck Gan, Atsushi Ichino, Tasho Kaletha, Alberto Mínguez, Sug Woo Shin. [Local intertwining relations and co-tempered A-packets of classical groups](https://arxiv.org/pdf/2410.13504v3). (24 Jul 2026; v1 17 Oct 2024)

<a id="ref-arthur-2003"></a>
- James Arthur. [The principle of functoriality](https://www.claymath.org/library/cw/arthur/pdf/57.pdf). Bull. Amer. Math. Soc. (N.S.) 40 (2003), no. 1, 39–53 (electronically published 10 October 2002) Author archive at Clay; printed pages 39–53, 15 PDF pages.

<a id="ref-arthur-2013"></a>
- James Arthur. [The Endoscopic Classification of Representations: Orthogonal and Symplectic Groups](http://web.archive.org/web/20120511125150id_/http://claymath.org/cw/arthur/pdf/Book.pdf). Book manuscript (pdfTeX, dated 30 May 2011, 535 pp.) formerly posted at claymath.org/cw/arthur/pdf/Book.pdf; published as AMS Colloquium Publications 61 (2013). Wayback Machine snapshot of 11 May 2012.

<a id="ref-arthur-clozel-1989"></a>
- James Arthur and Laurent Clozel. [Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf). Annals of Mathematics Studies 120 (1989). Author archive at Clay; Chapter III, §6, pp. 214–219, supplies cyclic automorphic induction and its cuspidality criterion.

<a id="ref-bcg-2025"></a>
- George Boxer, Frank Calegari, Toby Gee. [Cuspidal cohomology classes for GL_n(Z)](https://arxiv.org/pdf/2309.15944v3). (12 Sep 2024); published J. Amer. Math. Soc. 38 (2025)

<a id="ref-bcgnt-2025"></a>
- George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne. [The Ramanujan and Sato–Tate conjectures for Bianchi modular forms](https://arxiv.org/pdf/2309.15880v3). [math.NT] (27 Mar 2025); published as Forum Math. Pi (2025), doi:10.1017/fmp.2024.29

<a id="ref-bcgp-2021"></a>
- George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni. [Abelian surfaces over totally real fields are potentially modular](https://arxiv.org/pdf/1812.09269v3). (28 Nov 2021, final version, 292 pp.) / Publ. Math. IHÉS 134 (2021), 153–501

<a id="ref-bcgp-2025"></a>
- George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni. [Modularity theorems for abelian surfaces](https://arxiv.org/pdf/2502.20645v1). (28 Feb 2025; only version)

<a id="ref-caraiani-newton-2023"></a>
- A. Caraiani, J. Newton. [On the modularity of elliptic curves over imaginary quadratic fields](https://arxiv.org/pdf/2301.10509v3). (27 March 2025)

<a id="ref-cg-2018"></a>
- Frank Calegari, David Geraghty. [Modularity lifting beyond the Taylor–Wiles method](https://arxiv.org/pdf/1207.4224v2). (16 Jul 2017) / published Invent. Math. 211 (2018) 297–433

<a id="ref-cg-2020"></a>
- Frank Calegari, David Geraghty. [Minimal modularity lifting for nonregular symplectic representations (with an appendix by F. Calegari, D. Geraghty and M. Harris)](http://www.math.uchicago.edu/~fcale/papers/Siegel.pdf). Duke Math. J. 169 (2020), no. 5, 801–896 (Duke typeset advance-publication copy, 96 pp., paginated 1–96) and arXiv:1907.08691v1 .

<a id="ref-chenevier-taibi-2020"></a>
- Gaëtan Chenevier, Olivier Taïbi. [Discrete series multiplicities for classical groups over Z and level 1 algebraic cusp forms](https://pmihes.centre-mersenne.org/item/10.1007/s10240-020-00115-z.pdf). Publ. Math. IHÉS 131 (2020), 261–323 (open access, published version); arXiv:1907.08783v1

<a id="ref-ckpss-2004"></a>
- J. W. Cogdell, H. H. Kim, I. I. Piatetski-Shapiro, F. Shahidi. [Functoriality for the classical groups](https://www.numdam.org/item/PMIHES_2004__99__163_0.pdf). Publ. Math. IHÉS 99 (2004) 163–233 (Numdam scan with text layer)

<a id="ref-ct-2017"></a>
- L. Clozel, J. A. Thorne. [Level-raising and symmetric power functoriality, III](https://www.repository.cam.ac.uk/bitstreams/dc59bf8c-174b-4034-9f2f-070974d101af/download). Accepted manuscript dated December 10, 2015 (Apollo, Cambridge repository) / Duke Math. J. 166 (2017), no. 2, 325–402; not on arXiv

<a id="ref-fargues-scholze-2021"></a>
- Laurent Fargues, Peter Scholze. [Geometrization of the local Langlands correspondence](https://arxiv.org/pdf/2102.13459v4). (27 Nov 2024)

<a id="ref-fkp-2022"></a>
- N. Fakhruddin, C. Khare, S. Patrikis. [Lifting and automorphy of reducible mod p Galois representations over global fields](https://arxiv.org/pdf/2008.12593v5). (15 Oct 2021; final version) / Invent. Math. 228 (2022), 415–492

<a id="ref-fsy-2022"></a>
- J. Fresán, C. Sabbah, J.-D. Yu. [Hodge theory of Kloosterman connections](https://arxiv.org/pdf/1810.06454v5). (13 Jun 2022) / Duke Math. J. 171 (2022)

<a id="ref-gan-ichino-2018"></a>
- Wee Teck Gan, Atsushi Ichino. [The Shimura–Waldspurger correspondence for Mp_2n](https://arxiv.org/pdf/1705.10106v3). (3 August 2018); Ann. of Math. (2) 188 (2018), no. 3, 965–1016

<a id="ref-gan-savin-2023-g2"></a>
- Wee Teck Gan, Gordan Savin. [The local Langlands conjecture for G_2](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/2479D805B0F248C91A33671F3A03752E/S2050508623000276a.pdf/the-local-langlands-conjecture-for-dollarg2dollar.pdf). Forum Math. Pi 11 (2023), e28 (open access, CC BY 4.0); arXiv:2209.07346v2 (17 Dec 2022)

<a id="ref-gee-taibi-2019"></a>
- Toby Gee, Olivier Taïbi. [Arthur's multiplicity formula for GSp4 and restriction to Sp4](https://arxiv.org/pdf/1807.03988v1). (11 Jul 2018; the only arXiv version) / J. Éc. polytech. Math. 6 (2019), 469–535 (journal pagination)

<a id="ref-gelbart-jacquet-1978"></a>
- Stephen Gelbart, Hervé Jacquet. [A relation between automorphic representations of GL(2) and GL(3)](https://www.numdam.org/item/ASENS_1978_4_11_4_471_0.pdf). Ann. Sci. École Norm. Sup. (4) 11 (1978), no. 4, 471–542 (Numdam scan)

<a id="ref-ichino-prasanna-2023"></a>
- Atsushi Ichino, Kartik Prasanna. [Hodge classes and the Jacquet–Langlands correspondence](https://arxiv.org/pdf/1806.10563v2). (10 July 2023, revised after referee reports); Forum Math. Pi 11 (2023), e22

<a id="ref-jiang-zhang-2020"></a>
- Dihua Jiang, Lei Zhang. [Arthur parameters and cuspidal automorphic modules of classical groups](https://arxiv.org/pdf/1508.03205v4). (19 November 2019); Ann. of Math. (2) 191 (2020), no. 3, 739–827

<a id="ref-kim-2003"></a>
- Henry H. Kim (Appendix 1 by D. Ramakrishnan; Appendix 2 by H. Kim and P. Sarnak). [Functoriality for the exterior square of GL4 and the symmetric fourth of GL2](https://www.ams.org/journals/jams/2003-16-01/S0894-0347-02-00410-1/S0894-0347-02-00410-1.pdf). J. Amer. Math. Soc. 16 (2003), no. 1, 139–183 (publisher PDF; an [archived publisher copy](https://web.archive.org/web/20150105224455id_/http://www.ams.org/journals/jams/2003-16-01/S0894-0347-02-00410-1/S0894-0347-02-00410-1.pdf) is also available)

<a id="ref-kim-shahidi-2002"></a>
- Henry H. Kim, Freydoon Shahidi. [Functorial products for GL2 × GL3 and the symmetric cube for GL2](https://arxiv.org/pdf/math/0409607v1). Ann. of Math. 155 (2002) 837–893; arXiv:math/0409607v1 (30 Sep 2004) = the published text with journal pagination

<a id="ref-kmsw-2014"></a>
- Tasho Kaletha, Alberto Minguez, Sug Woo Shin, Paul-James White. [Endoscopic Classification of Representations: Inner Forms of Unitary Groups](https://arxiv.org/pdf/1409.3731v3). (3 December 2014); not published in a journal

<a id="ref-kss-2021"></a>
- Robert Kurinczuk, Daniel Skodlerack, Shaun Stevens. [Endo-parameters for p-adic classical groups](https://arxiv.org/pdf/1611.02667v3). (31 August 2020); Invent. Math. 223 (2021), no. 2, 597–723

<a id="ref-kw-2009-I"></a>
- Chandrashekhar Khare, Jean-Pierre Wintenberger. [Serre's modularity conjecture (I)](https://www.math.ucla.edu/~shekhar/papers/results.pdf). author copy results.pdf (23 pp., PDF created 31 May 2009); published Invent. Math. 178 (2009) 485–504

<a id="ref-mok-2015"></a>
- Chung Pang Mok. [Endoscopic classification of representations of quasi-split unitary groups](https://arxiv.org/pdf/1206.0882v5). (22 June 2013); published Mem. Amer. Math. Soc. 235 (2015), no. 1108

<a id="ref-nt-2026"></a>
- James Newton and Jack A. Thorne. [Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/pdf/2212.03595v2). (19 Feb 2025); published Ann. of Math. 203 (2026)

<a id="ref-pilloni-2020"></a>
- Vincent Pilloni. [Higher coherent cohomology and p-adic modular forms of singular weights](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf). Author manuscript dated 17 June 2019, 113 pp.; Duke Math. J. 169 (2020), no. 9, 1647–1807, doi:10.1215/00127094-2019-0075. Locators use the author manuscript.

<a id="ref-qian-2023"></a>
- Lie Qian. [Potential automorphy for GL_n](https://arxiv.org/pdf/2104.09761v1). (20 April 2021); Invent. Math. 231 (2023), 1239–1275, doi:10.1007/s00222-022-01161-6. Locators use arXiv v1.

<a id="ref-qian-thesis-2023"></a>
- Lie Qian. [Potential automorphy for general linear groups (PhD dissertation, Stanford University)](https://stacks.stanford.edu/file/druid:yn815wp7042/Thesis%20Final%20Version-augmented.pdf). Stanford PhD thesis, June 2023, 78 pp. Numbering X.0.Y: Theorem 1.0.10 corresponds to published Theorem 1.1; Theorem 1.0.13 to Theorem 1.4; Lemma 3.0.11 to arXiv v1 Lemma 3.10(1)–(3); Lemma 3.0.12 and Remark 3.0.13 to published Lemma 3.12 and Remark 3.13; Proposition 4.0.1 to Proposition 4.1.

<a id="ref-ramakrishnan-2000"></a>
- Dinakar Ramakrishnan. [Modularity of the Rankin–Selberg L-series, and multiplicity one for SL(2)](https://arxiv.org/pdf/math/0007203v1). Ann. of Math. 152 (2000) 45–111; arXiv:math/0007203v1 (1 Jul 2000) with the Annals pagination

<a id="ref-dmw-2009"></a>
- Neil Dummigan, Phil Martin and Mark Watkins. [Euler Factors and Local Root Numbers for Symmetric Powers of Elliptic Curves](https://archive.intlpress.com/site/pub/files/_fulltext/journals/pamq/2009/0005/0004/PAMQ-2009-0005-0004-a005.pdf). Pure Appl. Math. Q. 5 (2009), 1311–1341; public journal PDF, 31 pages.

<a id="ref-martin-watkins-2006"></a>
- Phil Martin and Mark Watkins. [Symmetric powers of elliptic curve L-functions](https://magma.maths.usyd.edu.au/~watkins/papers/antsVII.pdf). Public author PDF, 15 pages; ANTS VII (2006).

<a id="ref-pilloni-stroh-2016"></a>
- Vincent Pilloni and Benoît Stroh. [Surconvergence, ramification et modularité](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/Artinfinal.pdf). Author final manuscript, published Astérisque 382 (2016), pp. 195–266; manuscript pagination used

<a id="ref-snowden-2009"></a>
- Andrew Snowden. [On two dimensional weight two odd representations of totally real fields](https://arxiv.org/pdf/0905.4266v1). arXiv:0905.4266, edition dated May 26, 2009

<a id="ref-moeglin-renard-2018"></a>
- Colette Mœglin and David Renard. [Sur les paquets d’Arthur de Sp(2n,R) contenant des modules unitaires de plus haut poids, scalaires](https://arxiv.org/pdf/1802.04611v4)., 30 January 2019

<a id="ref-amr-2018"></a>
- Nicolas Arancibia, Colette Mœglin and David Renard. [Paquets d’Arthur des groupes classiques et unitaires](https://arxiv.org/pdf/1507.01432v2)., 31 January 2017; manuscript underlying the 2018 publication

<a id="ref-gan-takeda-2011"></a>
- Wee Teck Gan and Shuichiro Takeda. [The local Langlands conjecture for GSp(4)](https://annals.math.princeton.edu/wp-content/uploads/annals-v173-n3-p12-p.pdf). Annals of Mathematics 173 (2011), 1841–1882, journal PDF

<a id="ref-patrikis-taylor-2015"></a>
- Stefan Patrikis and Richard Taylor. [Automorphy and irreducibility of some l-adic representations](https://virtualmath1.stanford.edu/~rltaylor/irred.pdf). Public author manuscript, Compositio Mathematica 151 (2015), pp. 207–229; manuscript pagination used

<a id="ref-zou-2024"></a>
- Konrad Zou. [The categorical form of Fargues’ conjecture for tori](https://arxiv.org/pdf/2202.13238v2)., 6 August 2024

<a id="ref-schmidt-2017"></a>
- Ralf Schmidt. [Archimedean aspects of Siegel modular forms of degree 2](https://math.ou.edu/~rschmidt/papers/hodge.pdf). Rocky Mountain J. Math. 47 (2017), no. 7, 2381–2422; §2.3, pp. 2390–2391 (author PDF pp. 10–11); §§2.5, 3.3, pp. 2393–2394, 2398–2400.

<a id="ref-schmidt-2018"></a>
- Ralf Schmidt. [Packet structure and paramodular forms](https://sites.math.unt.edu/~schmidt/papers/packets_paramodular.pdf). Trans. Amer. Math. Soc. 370 (2018), 3085–3112; §§1.1–1.2, pp. 3088–3092.

<a id="ref-clozel-1990"></a>
- Laurent Clozel. [Motifs et formes automorphes : applications du principe de fonctorialité](https://www.jmilne.org/math/Books/AA1988a.pdf). In L. Clozel and J. S. Milne (eds.), Automorphic Forms, Shimura Varieties, and L-functions, vol. I, Perspectives in Mathematics 10, Academic Press (1990), pp. 77–159. Editor's public scan; printed page p is PDF page `p+11`. Theorem 3.13, p. 112, proof pp. 112–129; Lemme 4.9 and proof, pp. 144–145.

<a id="ref-adams-johnson-1987"></a>
- Jeffrey Adams and Joseph F. Johnson. [Endoscopic groups and packets of non-tempered representations](https://www.numdam.org/item/CM_1987__64_3_271_0.pdf). Compositio Mathematica 64 (1987), no. 3, pp. 271–309; §§2–3, pp. 277–286, and §10, pp. 305–308.

<a id="ref-blght-2011"></a>
- T. Barnet-Lamb, D. Geraghty, M. Harris, R. Taylor. [A family of Calabi–Yau varieties and potential automorphy II](https://ems.press/content/serial-article-files/41128). Publ. RIMS 47 (2011), 29–98; Lemma 2.2 pp.44–45.

<a id="ref-serre-1972"></a>
- Jean-Pierre Serre. [Propriétés galoisiennes des points d'ordre fini des courbes elliptiques](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5874918517843398173_Serre_proprie_te_s_galoisiennes_des_courbes_elliptiques.pdf). Invent. Math. 15 (1972), 259–331; §4.2 Theorem 2, pp.294–299, and §4.4, pp.299–300. Author institution's public scan.

<a id="ref-harder-1987"></a>
- Günter Harder. [Eisenstein cohomology of arithmetic groups. The case GL₂](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0089/LOG_0009.pdf). Invent. Math. 89 (1987), 37–118; §§3.1–3.2, pp.59–65, and §3.6, pp.73–74. Göttingen Digitisation Centre's article scan.

<a id="ref-ct-2015"></a>
- L. Clozel and J. A. Thorne, *Level raising and symmetric power functoriality, II*, Annals of Mathematics 181 (2015), pp.303–359. [Journal PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v181-n1-p05-p.pdf).

<a id="ref-gulliksen-1974"></a>
- T. H. Gulliksen, *A change of ring theorem with applications to Poincaré series and intersection multiplicity*, Mathematica Scandinavica 34 (1974), pp.167–183. [Journal PDF](https://journals.msp.org/mscand/article/download/2128/2127), Theorem 3.1 and Lemma 3.2, pp.174–180.

<a id="ref-arinkin-gaitsgory"></a>
- D. Arinkin and D. Gaitsgory, *Singular support of coherent sheaves, and the geometric Langlands conjecture*. [arXiv:1201.6343v3](https://arxiv.org/abs/1201.6343v3), Appendix D, Theorem D, pp.135–136; characteristic-zero coefficients.

<a id="ref-emerton-jacquet"></a>
- M. Emerton, *Jacquet modules of locally analytic representations of p-adic reductive groups I. Construction and first properties*, Annales scientifiques de l’École normale supérieure 39 (2006), pp.775–839. [Author draft, 17 December 2007](https://www.math.uchicago.edu/~emerton/pdffiles/jacquet.pdf); draft numbering is used in §4.3.

<a id="ref-emerton-vectors"></a>
- M. Emerton, *Locally analytic vectors in representations of locally p-adic analytic groups*, Memoirs AMS 248 (2017), no.1175. [Author manuscript](https://www.math.uchicago.edu/~emerton/pdffiles/analytic.pdf), §§1.1–1.2, pp.14–15 and 21–28; weak Fréchet–Stein and coadmissible systems.

<a id="ref-kpx"></a>
- K. S. Kedlaya, J. Pottharst and L. Xiao, *Cohomology of arithmetic families of `(φ,Γ)`-modules*, JAMS 27 (2014), pp.1043–1115. [arXiv:1203.5718v3](https://arxiv.org/abs/1203.5718v3), Theorems 4.4.3–4.4.5 and 6.3.9, Corollary 6.3.10.

<a id="ref-nakamura"></a>
- Kentaro Nakamura, *Deformations of trianguline B-pairs and Zariski density of two dimensional crystalline representations*, J. Math. Sci. Univ. Tokyo 20 (2013), 461–568. [Journal repository](https://repository.dl.itc.u-tokyo.ac.jp/record/39992/files/jms200401.pdf), Lemma 2.35, Proposition 2.37 and Corollary 2.38, pp.493–495.

<a id="ref-hellmann-schraen"></a>
- Eugen Hellmann and Benjamin Schraen, *Density of potentially crystalline representations of fixed weight*, Compos. Math. 152 (2016), 1609–1647. [Author manuscript](https://math.univ-lyon1.fr/homes-www/schraen/potBTdensevf.pdf), Proposition 2.6 and proof, p.10; sign convention p.4.

<a id="ref-jorgensen"></a>
- David A. Jorgensen, *Finite projective dimension and the vanishing of `Ext_R(M,M)`*, Comm. Algebra 36 (2008), 4461–4471. [University preprint 2007-05](https://cdn.prod.web.uta.edu/-/media/project/website/science/mathematics/documents/preprint/2007/rep2007_05.pdf), Theorem 1.1 and Corollary 1.2 with proofs, p.2, and Remark 1.6, pp.3–4.

<a id="ref-belt-square"></a>
- Dustin Belt, *On the holomorphy of exterior-square L-functions*, [arXiv:1108.2200v7](https://arxiv.org/abs/1108.2200v7), Theorems 2.2, 5.2 and 6.2, pp.5,41–42,45. Only the partial Euler-product continuation is used here; this does not assert the completed-factor comparison.

<a id="ref-mw-spectral"></a>
- Colette Mœglin and Jean-Loup Waldspurger, *Stabilisation de la formule des traces tordue X: stabilisation spectrale*, [arXiv:1412.2981v1](https://arxiv.org/abs/1412.2981v1), §2 pp.7–8; local error and vanishing §§3.2–3.9 pp.12–37; weighted characters §§4.5–4.8 pp.61–66; §5.9 p.81; restricted stabilization and globalization §§7.1–7.7 pp.89–105 and §9 pp.115–120; final stabilization §§8.1,8.5–8.6 pp.106–108,112–113.

<a id="ref-henniart-induction"></a>
- Guy Henniart. [Induction automorphe globale pour les corps de nombres](https://www.numdam.org/article/BSMF_2012__140_1_1_0.pdf). Bulletin de la Société Mathématique de France 140 (2012), no.1, pp.1–17. Theorems 3–6, pp.5–7; proofs §§2.6–3.7, pp.11–16, including the archimedean Remark on p.16.

<a id="ref-xu-local"></a>
- Bin Xu. [On L-packets for quasi-split general symplectic and even orthogonal groups](https://arxiv.org/pdf/1503.04897v4)., 28 February 2017. Proposition 4.4, Theorem 4.6 and Remark 4.7, pp.26–27; §§6.1–6.4.

<a id="ref-xu-global"></a>
- Bin Xu. [L-packets of quasisplit GSp(2n) and GO(2n)](https://arxiv.org/pdf/2103.15300v2)., 6 September 2021. Theorems 1.1–1.2 and 4.1–4.7; §§6–9.

<a id="ref-kashiwara-vergne"></a>
- Masaki Kashiwara and Michèle Vergne. [On the Segal–Shale–Weil representations and harmonic polynomials](https://www.cmls.polytechnique.fr/perso/vergne/publications2/Remplacer/78onthesegalshaleweil.pdf). Inventiones mathematicae 44 (1978), pp.1–47. Chapter II §§1–7, pp.9–28.

<a id="ref-howe-real"></a>
- Roger Howe. [Transcending classical invariant theory](https://www.math.utah.edu/~ptrapa/math-library/howe/howe-transcending-JAMS.pdf). Journal of the American Mathematical Society 2 (1989), pp.535–552. Theorems 1, 1A and 2.1; §§2–5, pp.537–550.

<a id="ref-roberts-similitudes"></a>
- Brooks Roberts. [The theta correspondence for similitudes](https://www.brooksroberts.org/A1996a.pdf). Israel Journal of Mathematics 94 (1996), pp.285–317. Propositions 3.3–3.5, pp.303–304; Lemma 4.2 and Theorem 4.4, pp.306–310.

<a id="ref-muic-2009"></a>
- Goran Muić. [Intertwining operators and composition series of generalized and degenerate principal series for Sp(4,ℝ)](https://web.math.pmf.unizg.hr/glasnik/44.2/44(2)-08.pdf). Glasnik matematički 44(64) (2009), pp.349–399. Corollary 5.2 and Lemma 8.1.

<a id="ref-henniart-2009"></a>
- Guy Henniart. [Sur la fonctorialité, pour GL(4), donnée par le carré extérieur](https://www.mathnet.ru/php/archive.phtml?jrnid=mmj&option_lang=eng&paperid=335&wshow=paper). Moscow Mathematical Journal 9 (2009), no.1, pp.33–45; [archived publisher PDF](https://web.archive.org/web/20150922001048id_/http://www.ams.org/distribution/mmj/vol9-1-2009/henniart.pdf). Theorem 1.1, p.34; §§2–3, pp.37–43.

<a id="ref-kim-shahidi-cuspidality"></a>
- Henry H. Kim and Freydoon Shahidi. [Cuspidality of symmetric powers with applications](https://www.math.purdue.edu/~fshahidi/articles/Kim%20%26%20Shahidi%20%5B2002%2C%2021pp%5D---Cuspidality%20of%20symmetric%20powers%20with%20applications.pdf). Duke Mathematical Journal 112 (2002), pp.177–197; §§3.1–3.3, pp.180–186.

<a id="ref-shahidi-real"></a>
- Freydoon Shahidi. [Local coefficients as Artin factors for real groups](https://www.math.purdue.edu/~fshahidi/articles/Shahidi%20%5B1985%2C%2035pp%5D---Local%20coefficients%20as%20Artin%20factors%20for%20real%20groups.pdf). Duke Mathematical Journal 52 (1985), pp.973–1007; Theorems 3.1/3.13, pp.990–1003.

<a id="ref-thorne-2024"></a>
- Jack A. Thorne. [A p-adic approach to the existence of level-raising congruences](https://arxiv.org/pdf/2212.03591v2).; Proc. Lond. Math. Soc. (3) 128 (2024), no. 2, e12584. §8, Theorem 8.1, Lemma 8.2 and Proposition 8.3 with proofs, pp. 47–50.

<a id="ref-wang-icosahedral"></a>
- Song Wang. [On the symmetric powers of cusp forms on GL(2) of icosahedral type](https://arxiv.org/pdf/math/0301074v3)., 31 January 2003, 18 pp.; Proposition 1.1 and Corollaries 1.2–1.3, pp.5–8, Proposition 3.1 and Theorem D, pp.12–14.

[§2.5]: #component-connects-lifting
[§2.6]: #potentially-semistable-cm-lifting
[§5.9]: #categorical-llc-construction
[§4.26]: #bianchi-eichler-shimura
[§4.18]: #parallel-weight-and-clozel-purity
[§1.8]: #hilbert-weight-one-realization
[§4.3]: #symmetric-power-method-prerequisites
[§3.3]: #langlands-shahidi-analytic-inputs
[§3.2]: #weighted-trace-classification-inputs
[§1.4]: #non-solvable-residual-modularity
[§3.1]: #theta-and-metaplectic-descent
[§2.42]: #patrikis-taylor-potential-automorphy
[§1.1]: #accessible-regular-refinement
[§3.20]: #adams-johnson-construction
[BLGGT]: #ref-blggt-2014-v4
[Clozel]: #ref-clozel-1990
[C-GALOIS]: #contract-c-galois
[Polarization]: #blggt-normalization-register
[C-AUTOMORPHIC]: #contract-c-automorphic
[BCGP]: #ref-bcgp-2021
[BCGP, modularity]: #ref-bcgp-2025
[AGIKMS]: #ref-agikms-2024
[Arthur]: #ref-arthur-2013
[C-ARTHUR]: #contract-c-arthur
[NT Hilbert]: #ref-nt-2026
[KW09]: #ref-kw-2009-I
[§1.9]: #totally-real-odd-artin
[C-ARTIN]: #contract-c-artin
[TWFL]: #arthur-dependency-gate
[Trace inputs]: #trace-formula-inputs-register
[Henniart, global induction]: #ref-henniart-induction
[ACC+]: #ref-acc-2023
[Pilloni]: #ref-pilloni-2020
[C-COHERENT-GEOMETRY]: #contract-c-coherent-geometry
[NT I]: #ref-newton-thorne-I
[Pilloni–Stroh]: #ref-pilloni-stroh-2016
[§1.10]: #symmetric-power-lift-over-number-fields
[NT II]: #ref-newton-thorne-II
[§1.2]: #strong-artin-conjecture
[§1.6]: #functorial-lift
[§4.15]: #one-prime-criterion
[§0.2]: #nt26-automorphy-predicate
[CT17]: #ref-ct-2017
[§4.30]: #all-regular-symmetric-powers
[§1.15]: #low-rank-symmetric-powers
[KS02]: #ref-kim-shahidi-2002
[GT19]: #ref-gee-taibi-2019
[Kim03]: #ref-kim-2003
[§1.14]: #kim-sym4
[§1.12]: #sp-statement
[Caraiani–Newton]: #ref-caraiani-newton-2023
[BCGNT]: #ref-bcgnt-2025
[§2.7]: #cg-conjecture-b
[Qian]: #ref-qian-2023
[Qian, ordinarity]: #ref-qian-ordinarity
[Qian's thesis]: #ref-qian-thesis-2023
[§2.9]: #dwork-eigenrealizations
[§2.10]: #dwork-semistable-log-comparison
[§2.11]: #coefficient-prime-dwork-ordinarity
[C-MODULI]: #contract-c-moduli
[§2.13]: #moret-bailly-galois-control
[§2.2]: #polarized-lifting-extensions
[§2.14]: #polarized-dwork-potential-automorphy
[§2.1]: #potential-diagonalizability
[§2.15]: #prescribed-polarized-ordinary-lifts
[C-LOCAL-DEFORMATION]: #contract-c-local-deformation
[§2.17]: #potential-ordinary-automorphy
[§2.16]: #polarized-pd-lifting
[FKP22]: #ref-fkp-2022
[§2.29]: #cm-three-five-switch
[§2.25]: #pd-lifts-with-local-conditions
[§2.26]: #potential-automorphy-theorem
[§2.31]: #cg18-odd-symmetric-powers
[§2.39]: #acc-elliptic-symmetric-powers
[§2.27]: #acc-symplectic-potential-automorphy
[§2.35]: #compatible-systems-potentially-automorphic
[§2.41]: #part-of-compatible-system
[Patrikis–Taylor]: #ref-patrikis-taylor-2015
[§2.36]: #constituents-potentially-automorphic
[§2.19]: #qian-auxiliary-prime
[§2.40]: #compatible-system-l-function-continuation
[§2.43]: #irreducibility-density-one
[§2.12]: #ordinary-subquotient-semisimplification
[§2.44]: #elliptic-symmetric-power-seed
[§2.28]: #potential-automorphy-with-steinberg-place
[§2.30]: #exceptional-modular-curves
[Gan–Ichino]: #ref-gan-ichino-2018
[Gan–Takeda, GSp₄]: #ref-gan-takeda-2011
[§3.7]: #gsp4-galois-l-packet
[§3.5]: #gan-takeda-llc-gsp4
[Mok15]: #ref-mok-2015
[§3.4]: #self-dual-cuspidal-type
[§3.8]: #global-arthur-parameter
[§3.9]: #gsp4-discrete-spectrum-types
[§3.13]: #extended-langlands-parameter
[§3.12]: #mok-unitary-classification
[KMSW14]: #ref-kmsw-2014
[§3.15]: #local-arthur-packets
[Adams–Johnson]: #ref-adams-johnson-1987
[CT20]: #ref-chenevier-taibi-2020
[§3.17]: #arthur-multiplicity-formula
[§3.18]: #vogan-packets-so-v
[JZ20]: #ref-jiang-zhang-2020
[§3.26]: #gsp4-arthur-classification
[Schmidt]: #ref-schmidt-2017
[§3.29]: #gsp4-archimedean-limit-packets
[Kedlaya]: #ref-kedlaya-ant-2025
[C-EQUIDISTRIBUTION]: #contract-c-equidistribution
[§4.19]: #purity-from-symmetric-powers
[Thorne 2024]: #ref-thorne-2024
[§4.22]: #clozel-thorne-reductions
[§4.11]: #symmetric-power-automorphy-lifting
[§4.14]: #l-function-equidistribution-criterion
[§4.20]: #non-supercuspidal-symmetric-powers
[§4.4]: #unitary-level-raising-method
[§4.21]: #bcgnt-potential-automorphy-det-cyclotomic
[§4.33]: #bcgnt-symmetric-powers-purity
[§4.38]: #bianchi-ramanujan
[§4.27]: #bianchi-modular-forms
[CKPSS04]: #ref-ckpss-2004
[The principle of functoriality]: #ref-arthur-2003
[§5.1]: #ckpss-generic-transfer
[§5.2]: #functoriality-conjecture
[Fargues–Scholze]: #ref-fargues-scholze-2021
[§5.7]: #fs-bundles-and-lisse-category

[§1.13]: #kim-shahidi-sym3
[Gan–Savin]: #ref-gan-savin-2023-g2
[§4.9]: #one-level-one-symmetric-power
[§4.7]: #level-one-ping-pong
