# Roadmap: completed cohomology and p-adic local–global compatibility over ℚ

**Summary.** Build the arithmetic comparison maps and multiplicity theory of completed modular and quaternionic cohomology, starting with completed-tower and local-representation APIs. The local p-adic representation theory, Scholze’s geometric functor and definite unitary forms are included with their construction APIs. The end results are Emerton’s Banach and refined local–global compatibility, its mod-p and homology forms, the definite quaternionic and Pan comparisons, and the patched-module support theorems used in modularity lifting. The final layer distinguishes consequences assuming residual modularity from consequences using Serre’s theorem.

## Scope and ownership

The work here concerns arithmetic specialisations and comparison theorems. Existing completed-tower carriers, abstract patching and local deformation representability retain their suppliers’ definitions; relative Robba rings, Galois realization, character modules and triangulation data retain PhiGammaModulesAndIwasawaCohomology as their owner; smooth local Langlands families and determinant laws retain SmoothRepresentationsOfLocalGroups and IntegralHeckeAndGaloisDeterminants as their owners. Layer 0 constructs the local p-adic representation theory, Scholze functor and definite unitary input needed for the comparisons. An arithmetic comparison below adds the named geometric tower, coefficient system, Hecke operators or integral normalisation; it does not introduce a replacement generic carrier.

`Suggested.lean` contains no headline theorem signatures: the pinned libraries lack the arithmetic completed towers, local Langlands functors and Galois deformation rings needed to state them. Its module docstring identifies these missing objects by target. The named interfaces below specify the library to be built; the mathematical statements and their hypotheses are given in their respective sections.

| Mathematics | Owner |
|---|---|
| Generic completed towers, coefficient limits, duality, admissibility, descent, supports, the CompletedCohomologyPartII Layer 8 modular/Hilbert/quaternionic realisation, the derived Hecke inverse limit and its residual localisation; compatible-sections construction for specified cohomological image diagrams | CompletedCohomologyPartII Layers 0–8 |
| Finite-level modular curves, cohomology with coefficients, boundary, Hecke correspondences, bad fibres | ModularCurvesPartII §§10.3–10.4, 11.5, 14.1–14.15, 15.6–15.10, 17.2, 17.4–17.7 |
| Finite-level quaternionic forms and Shimura-curve cohomology, Jacquet–Langlands at finite level | HilbertModularVarietiesAndShimuraCurves R18.3–R18.4, GL2AutomorphicRepresentationsAndTransfer R17.3 |
| Galois representations of eigenforms and finite-level Hecke determinants | AutomorphicGaloisRepresentations §§1.1–1.5, 3.1, 3.7, 4.3–4.7, 6.6, 6.8–6.10; IntegralHeckeAndGaloisDeterminants IHG.0–IHG.4 for determinant laws, reconstruction and interpolation |
| Global and local deformation rings, Taylor–Wiles primes, abstract patching and support | GlobalGaloisDeformations R04.5 and G7; LocalGaloisDeformationRings Layer F, §§1.1, 3.1–3.9; DeformationAndDerivedPatchingAlgebra Layers 3, 5, 6 and 8 |
| Affinoid relative Robba rings, `(φ,Γ)`-module category, Galois realization, character modules and saturated triangulation data | PhiGammaModulesAndIwasawaCohomology §§1.1–1.2, 7.1, 7.5 |
| Definite unitary groups and their algebraic modular forms (for the CEGGPS globalisation) | §0.7 |
| `GL₂(ℚ_p)` blocks, projective envelopes, block centres and the Montréal functor | LocalGaloisDeformationRings §§3.7.1–3.7.2, 3.8 |
| The mod-p correspondence on the imported Montréal functor | §0.2 |
| `B(V)`, Colmez’s all-prime correspondence and Berger–Breuil completion | §0.3 |
| Kisin’s deformation comparison, universal-deformation/envelope identifications, product blocks and their small-prime extensions | §0.4 |
| Admissible categories, ordinary parts, Jacquet modules and the local Serre-weight Hecke comparison | §§0.1, 0.5 |
| Local Langlands in families away from p (co-Whittaker families W and their smooth duals Π) | SmoothRepresentationsOfLocalGroups §§SR.5.1–SR.5.3 |
| Scholze’s sheaf and functor Sⁱ | §0.6 |
| The lifting theorems and their own dependency audit | GL2ModularityLifting §8.7, §§9.1–9.3, 10.1–10.6 and §12.4 (consumers) |

The common local contracts in §§0.2–0.4 also occur in PadicLocalLanglandsForGL2Qp: the finite-length mod-p correspondence is its §§3.3 and 5.7; Colmez’s Banach construction, the all-prime correspondence and Berger–Breuil are its §§3.7–3.8 and 4.3; Kisin’s deformation comparison and the universal-deformation/envelope comparison are its §§5.7–5.8. The construction contracts assigned here are the finite-length correspondence of §0.2, the Banach and completion theorems of §0.3 and the deformation/envelope comparisons and product-block extensions of §0.4. Their underlying `GL2Block`, `MontrealFunctor` and `WDTypeRing` constructions retain LocalGaloisDeformationRings §§3.7.1–3.8 as owner, with the same universal properties, coefficient ranges and central-character qualifications. The coefficient, duality and determinant adapters act on those imported objects. Arithmetic multiplicities and global comparison maps belong to Layers 4–6. The local contracts carry the supercuspidal-comparison and arithmetic-patching hypotheses stated in PadicLocalLanglandsForGL2Qp Layers 4 and 6 wherever those branches are used; they do not presuppose the global result of §6.3.

This roadmap owns Pan’s pro-modular primes (§3.8) and his Theorem 4.1.7 and Corollary 4.1.8 for the nice-prime predicate `PanNicePrime` of GL2ModularityLifting §10.1 (§5.7), and the global proof of the potentially crystalline, non-crystabelline case of Emerton’s Theorem 3.3.22 (§6.3). The local comparison foundations are built in Layer 0; their global applications retain the separate residual modularity hypotheses of Layer 6.


Mathlib already supplies continuous maps, intertwining maps, tensor products, ideal kernels and zero loci. In particular, algebraic multiplicities use `Representation.IntertwiningMap`; their continuous variant uses `ContIntertwiningMap`. The notation `V(Ann_R M)` uses `PrimeSpectrum.zeroLocus` and `Module.annihilator` directly, while `Module.support` is reserved for localisation support; the two need an explicit finiteness argument before identification. Generic completion/reduction maps, topological algebra closure and Mahler approximation are imported. Only their arithmetic comparison maps are targets here.

The ProfiniteArithmetic and LocalGaloisGroups roadmaps supply profinite arithmetic and local absolute Galois structure. They do not supply completed automorphic towers, coadmissible cancellation or the Pan Iwasawa-dimension comparison. OperatorTheory does not replace the integral complete-local-coefficient representation categories used here. SmoothRepresentationsOfLocalGroups §§SR.5.1–SR.5.3 supplies co-Whittaker families, the rank-one derivative and arbitrary-coefficient endomorphisms over algebraically closed residue fields and for one `GL₂(ℚ_ℓ)`; their descent to finite residue fields, the product over `Σ₀` and the integral smooth-dual comparison below are targets here.

## Conventions

- E is a finite extension of `ℚ_p` with ring of integers O, uniformiser ϖ and residue field k; `G = GL₂(ℚ_p)`; for a finite set `Σ₀` of primes not containing p, `Σ = Σ₀ ∪ {p}`, `G_{Σ₀} = ∏_{ℓ∈Σ₀} GL₂(ℚ_ℓ)` and `K₀^Σ = ∏_{ℓ∉Σ} GL₂(ℤ_ℓ)`.
- Completed cohomology at tame level `K^p` is the ϖ-adic completion of the p-level colimit of étale cohomology of the modular curves `Y(K_pK^p)`; the colimit over tame levels is taken afterwards, with the locally convex (O-linear) inductive-limit topology. Ordinary, compactly supported and interior cohomology are kept distinct; localisation at a residual Hecke ideal is taken on the completed object through CompletedCohomologyPartII's residual projectors.
- The G- and `GL₂(𝔸_f)`-actions follow Emerton (lg §2): the actions of Carayol's papers twisted by `g ↦ (g^{-1})^t`. Hecke operators `T_ℓ` and `S_ℓ` are the double cosets of `diag(ℓ, 1)` and `diag(ℓ, ℓ)`; in the modular-curve convention Frobenius elements are geometric, and a Galois representation attached to a Hecke eigensystem has characteristic polynomial `X² − T_ℓX + ℓS_ℓ` at `Frob_ℓ`.
- `V_f` denotes the cohomological Galois factor of an eigenform, with geometric Frobenius polynomial `X² − a_ℓ(f)X + χ(ℓ)ℓ^{k−1}`. Its dual is the usual arithmetic-Frobenius representation with the same polynomial. Pan’s quaternionic determinant `ψε^{-1}` and Tung’s `ψ_Tε` are kept in their own conventions; identifying their characters and reciprocal Hecke operators is the normalisation comparison specified below.
- B denotes the p-adic local Langlands correspondence for `GL₂(ℚ_p)` in Kisin's deformation-theoretic formulation; `π_ℓ(V)` for `ℓ ≠ p` is Emerton's modified local Langlands representation (the generic one in the Tate normalisation).
- A residual representation ρ̄ is p-distinguished if `ρ̄|G_{ℚ_p}` is not, after semisimplification, the sum of two copies of one character; Assumption 3.3.1 excludes `ρ̄|G_{ℚ_p} ≅ χ ⊗ (1 ∗; 0 ε̄)`.
- Every theorem keeps its source's hypotheses, including small primes: Emerton's main results need ρ̄ absolutely irreducible and the exclusions above, his mod p theorem needs `p > 2`, Tung treats all odd p and `p = 2` separately, and Pan assumes p odd and excludes a block at `p = 3`.


For a left action on X, translation on functions is `(g·f)(x)=f(g⁻¹x)`. Thus `(g·f)(gx)=f(x)` and `(gh)·f=g·(h·f)`. The definite arithmetic right action is turned into this left action by inversion. With `f(zx)=ψ(z)f(x)`, inverse translation acts centrally by `ψ(z)⁻¹`; this distinction is retained when matching Pan’s right translation. A weight W is paired with W* with its contragredient action, never W with itself unless a duality is specified. For example, on a scalar weight t, the dual scalar is `t⁻¹`, and evaluation of a functional at a weight vector has scalar `t⁻¹t=1`.

Coefficient completion always uses ϖ, not p. If O is ramified of ramification index e, p is a unit times `ϖ^e`: O/p and O/ϖ coincide only when `e=1`. All rational comparisons invert p (equivalently ϖ), whereas reduction statements specify their exact exponent. Integral results are not asserted for arbitrary equal-characteristic complete DVRs.

## Exact supplier contracts

### From Mathlib and Tau Ceti

Use Mathlib at `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The declarations below fix the vocabulary; their existence alone does not supply arithmetic descent or local–global compatibility.

- `mathlib:AdicCompletion` (Mathlib/RingTheory/AdicCompletion/Basic.lean): The I-adic completion of a module as compatible sequences in the quotients `M/I^nM`.
- `mathlib:CompactSpace` (Mathlib/Topology/Defs/Filter.lean): Compactness of a topological space; this class does not assert Hausdorffness, total disconnectedness or profiniteness of a raw arithmetic quotient.
- `mathlib:ContinuousLinearMap` (Mathlib/Topology/Algebra/Module/ContinuousLinearMap/Basic.lean): Continuous semilinear maps between topological modules, used for the continuous multiplicity Hom spaces.
- `mathlib:ContinuousMap` (Mathlib/Topology/ContinuousMap/Defs.lean): Continuous maps C(X, Y); the carrier of `C(X(U^p), M)` for the definite quaternionic tower.
- `mathlib:CuspForm` (Mathlib/NumberTheory/ModularForms/Basic.lean): Cusp forms of weight k for a subgroup Γ, the classical objects compared with completed cohomology.
- `mathlib:Field.absoluteGaloisGroup` (Mathlib/FieldTheory/AbsoluteGaloisGroup.lean): The absolute Galois group of a field as a topological group (`G_ℚ`, `G_{ℚ_p}`).
- `mathlib:IsDedekindDomain.FiniteAdeleRing` (Mathlib/RingTheory/DedekindDomain/FiniteAdeleRing.lean): The finite adele ring of a Dedekind domain’s fraction field, as a restricted product of completions.
- `mathlib:IsLocalRing` (Mathlib/RingTheory/LocalRing/Defs.lean): Local rings (the local factors of completed Hecke algebras).
- `mathlib:IsNilpotent` (Mathlib/Algebra/GroupWithZero/Basic.lean): Nilpotent elements; used for nilpotent kernels of pseudo-deformation-to-Hecke maps.
- `mathlib:IsNoetherianRing` (Mathlib/RingTheory/Noetherian/Defs.lean): Noetherian rings (`T_{ρ̄,Σ}`, A).
- `mathlib:IsReduced` (Mathlib/Algebra/GroupWithZero/Basic.lean): Reduced rings (completed Hecke algebras are reduced).
- `mathlib:LocallyConstant` (Mathlib/Topology/LocallyConstant/Basic.lean): Locally constant functions; smooth quaternionic forms at finite level.
- `mathlib:Matrix.GeneralLinearGroup` (Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean): `GL_n(R)` as the units of `n × n` matrices.
- `mathlib:ModularForm` (Mathlib/NumberTheory/ModularForms/Basic.lean): Modular forms of weight k for a subgroup Γ.
- `mathlib:Module.Finite` (Mathlib/RingTheory/Finiteness/Defs.lean): Finitely generated modules.
- `mathlib:Module.Flat` (Mathlib/RingTheory/Flat/Basic.lean): Flat modules (O-flatness of Hecke algebras and multiplicity modules).
- `mathlib:Module.Free` (Mathlib/LinearAlgebra/FreeModule/Basic.lean): Free modules (type-specialised modules at small level).
- `mathlib:Module.Projective` (Mathlib/Algebra/Module/Projective.lean): Projective modules (injectivity/projectivity of localised completed (co)homology).
- `mathlib:Module.annihilator` (Mathlib/RingTheory/Ideal/Maps.lean): The annihilator ideal of a module, defining support of patched modules.
- `mathlib:Module.support` (Mathlib/RingTheory/Support.lean): The support of a module in Spec R, via localisations.
- `mathlib:MvPowerSeries` (Mathlib/RingTheory/MvPowerSeries/Basic.lean): Multivariable formal power series, the patching rings `R_∞` and `S_∞`.
- `mathlib:PrimeSpectrum.zeroLocus` (Mathlib/RingTheory/Spectrum/Prime/Basic.lean): Zero loci `V(s)` in Spec R (pro-modular primes, supports).
- `mathlib:QuaternionAlgebra` (Mathlib/Algebra/Quaternion.lean): Quaternion algebras over a commutative ring with parameters a, b, c.
- `mathlib:RingCat.sectionsSubring` (Mathlib/Algebra/Category/Ring/Limits.lean): Compatible sections of a functor to rings as a subring of the product; the inverse-limit Hecke algebra.
- `mathlib:RingHom.ker` (Mathlib/RingTheory/Ideal/Maps.lean): Kernel ideal of a ring homomorphism.
- `mathlib:Subalgebra.topologicalClosure` (Mathlib/Topology/Algebra/Algebra.lean): Topological closure of a subalgebra (weak closure of the Hecke image).
- `mathlib:TensorProduct` (Mathlib/LinearAlgebra/TensorProduct/Defs.lean): Tensor products of modules.
- `mathlib:ringKrullDim` (Mathlib/RingTheory/KrullDimension/Basic.lean): Krull dimension of a commutative ring (dimension bounds for Hecke algebras).
- `mathlib:PadicInt.dense_span_mahler` (Mathlib/NumberTheory/Padics/MahlerBasis.lean): For prime p and a complete ultrametric normed coefficient algebra R with bounded `ℤ_p` scalar action, the R-linear span of Mahler polynomial functions is dense in `C(ℤ_p,R)`. Apply with a finite extension E of `ℚ_p`; the finite-product/clopen-subset approximation in Layer 2 is a routine extension.
- `mathlib:AdicCompletion.eval_surjective` (Mathlib/RingTheory/AdicCompletion/Basic.lean): Surjectivity of each completion evaluation map, for every module.
- `mathlib:AdicCompletion.pow_smul_top_eq_ker_eval` (Mathlib/RingTheory/AdicCompletion/Completeness.lean): For a finitely generated ideal I, the kernel of the nth evaluation is `I^n` times the completion; together with evaluation surjectivity this gives the coefficient-quotient comparison.


`Representation.IntertwiningMap` (Mathlib/RepresentationTheory/Intertwining.lean) is the algebraic equivariant Hom carrier. `ContIntertwiningMap` (Mathlib/RepresentationTheory/Continuous/Basic.lean) supplies the continuous equivariant Hom when the representation carriers are present. The full-support implication for a reduced ring is `PrimeSpectrum.zeroLocus_eq_univ_iff`, combined with the reduced nilradical criterion; it is not a second support construction. For the continuous Galois actions, use the topological absolute Galois groups with the normalisations of LocalGaloisGroups and ClassFieldTheory.

The prime-contraction characterisation for a surjection is supplied by
`range_comap_of_surjective` (Mathlib/RingTheory/Spectrum/Prime/RingHom.lean):
`Set.range (PrimeSpectrum.comap φ) = PrimeSpectrum.zeroLocus (RingHom.ker φ)`.
Use it directly for the arithmetic Hecke quotient in §3.8. It requires surjectivity;
`ℤ → ℚ` has zero kernel but does not hit the prime `(2)` on spectra.
For finite modules, the identification of localization support with the annihilator zero locus
is `Module.support_eq_zeroLocus` (Mathlib/RingTheory/Support.lean), with its `Module.Finite`
hypothesis. The Iwasawa-finite scalar-annihilator comparison of §5.3 does not assume this
scalar finiteness and remains a target.

### From completed arithmetic towers

CompletedCohomologyPartII Layers 0–2 supply coefficient towers, fixed-exponent smooth colimits and coefficient-limit completions; CompletedCohomologyPartII Layer 3 supplies continuous duals, mixed tensor carriers and orthonormalisable/profree modules; CompletedCohomologyPartII Layer 5 supplies admissibility after the finite-cell and compact p-adic analytic hypotheses are verified; its Layers 6–7 supply coefficient comparison and completed Borel–Moore duality. CompletedCohomologyPartII Layer 8 supplies arithmetic modular/Shimura realisation, transported actions, central quotients and residual Hecke localisation. Its default Hecke algebra uses finite derived images. Passing to the images on all cohomology degrees preserves residual labels through a nilpotent kernel; passing further to degree one or to a faithful action requires the arithmetic comparison of §3.1. No ring isomorphism follows from equality of residual labels. ArithmeticLocallySymmetricSpaces ALS.6 supplies tame and p-power tower geometry. The comparison maps below use these carriers literally. The local and geometric foundations of Layer 0 are targets of this roadmap.

PhiGammaModulesAndIwasawaCohomology §§1.1–1.2 supplies `relativeAnnulus`, `relativeRobba`, `RelativePhiGammaModule` and `relativeDrig` over affinoid coefficients, with their topologies, Frobenius and Gamma actions, tensor and dual comparisons and completed coefficient change. Its §§7.1 and 7.5 supply `characterModule` and `Triangulation`, including coefficient line bundles and pullback where saturation is preserved. LocalGaloisDeformationRings §0.4 identifies its finite-local-coefficient realization with these carriers; §1.23 supplies the corresponding deformation functors and tangent comparisons. Section 5.2a uses these same objects to construct the representable regular triangulation space, framed trianguline variety and patched Jacquet comparisons.

The following are exact extensions of supplier interfaces and are targets of this roadmap. The cited roadmap supplies its stated base interface; the additional arithmetic comparison or range extension is proved here before its indicated use, with the stated prime and residual restrictions. No stronger supplier theorem is presumed.

### Arithmetic extensions of supplier contracts


- **Away-from-p smooth families.** Import SmoothRepresentationsOfLocalGroups §§SR.5.1–SR.5.3’s co-Whittaker family W, free rank-one top derivative and arbitrary-coefficient endomorphism theorem (Helm, Whittaker models and the integral Bernstein center, §§3, 6; Helm–Moss, Corollary 7.7), and form its smooth O-dual Π. These suppliers work over coefficients with algebraically closed residue field and, for the endomorphism theorem, over one `GL₂(ℚ_ℓ)`; the descent to the finite residue field of `T_{ρ̄,Σ}` and the product over `Σ₀` are the targets `awayFamily_descent` and `awayFamily_product` of §4.1. Also require the exact `p > 2` mod-ϖ m-torsion comparison for Π in EM11 Theorem 6.1.2, pp. 66–67, including its integral lattice and cohomological local-Langlands normalisation; prove it for the integral lattice, without commuting a smooth dual with arbitrary reduction. The `p = 2` weaker statement is retained separately. Import minimal supercuspidal types from §0.3’s Henniart types. Needed by: §4.1, §4.4, §4.7, §5.2, §6.3.

  **Checks.** For Σ₀ empty W=T and Π is its continuous O-dual; arbitrary coefficient tensoring is tested on W with M=T/I; mod-ϖ dual comparison retains p>2.

- **ModularCurvesPartII §§17.4–17.7 arithmetic extension.** At a prime `ℓ ≠ p` where the level has Iwahori `(Γ_0(ℓ))` structure and the curve has the semistable model of ModularCurvesPartII §11.5: (i) the Hecke algebra generated by `T_q`, `S_q` for q prime to the level acts on the component group Φ of the Néron model of the Jacobian through an Eisenstein quotient, so `Φ_m = 0` for a non-Eisenstein m (Ribet, Irreducible Galois representations arising from component groups of Jacobians (1995), Corollary p. 140, under the neatness of the level away from ℓ); (ii) geometric Frobenius acts on `(O ⊗_{ℤ_p} T[pʳ])_m` by `ℓ^{-1}U_ℓ`, where T is the torus in the special fibre (Ribet 1990, Proposition 3.8; EM11 (6.2.11), p. 74). On `X*(T)` retain untwisted Frobenius; the comparison is `T_p(T)=Hom(X*(T),ℤ_p(1))`, with both dual and Tate twist. The component-group and toric Frobenius assertions are required in addition to §§17.4–17.7’s character/monodromy sequences and §17.2’s good-reduction Eichler–Shimura relation. Needed by: §4.2.

  **Checks.** For split multiplicative J₀(11), Frobenius on X*(T) is 1; on T[pʳ] it is 11⁻¹; the inverse cyclotomic twist changes the latter to U₁₁ on new cohomology.

- **CompletedCohomologyPartII §8.5 extension.** Extend §8.5 (definite unitary degree zero), stated for LLHLM §5.3’s definite outer form of `GL_3`, to the definite unitary groups G̃ of rank n over a totally real `F̃^+` used by CEGGPS §2.3 (Clozel–Harris–Taylor/Thorne type, quasi-split at finite places, compact at infinity): the completed degree-zero object `lim_s colim_{U_p} S_{ξ,τ}(U_pU^p, O/ϖ^s)` with its tame Hecke and `GL_n(F̃^+_p)`-actions is the CompletedCohomologyPartII Layer 2 completed object of the finite discrete tower, with the same stabiliser caveat. Needed by: §5.1.

  **Checks.** Rank one gives forms on the unitary torus; small trivial-stabilizer classes contribute one coefficient copy each; with stabilizers use invariants before coefficient limits.

- **ModularCurvesPartII §§15.6–15.10 arithmetic extension.** Extend the enhanced-Ihara kernel bound to the precise non-Eisenstein mod-p tower assertion used by EM11 Theorem 5.7.7(3) and p. 89: no finite-dimensional `GL_2(ℚ_ℓ)-subobjects` for each `ℓ ∈ Σ_0`, with the required Serre-weight coefficient functor. Prove the good-weight mod-p Hecke-socle multiplicity-one and Whittaker-derivative statement of Theorem 5.7.7(2), including its classical `U_ℓ = 0` input. No injectivity assertion is inferred from the ordinary congruence-kernel estimate alone. Needed by: §2.4, §4.4, §4.6.

  **Checks.** A good boundary weight requires the determinant-weight exclusion; zero coefficient modules give zero derivatives; finite-dimensional away-from-p subobjects are excluded only after non-Eisenstein localization.

- **Small-weight local description.** For an eigenform f of weight k with `2 ≤ k ≤ p+1`, nebentypus χ and level prime to p, with residual representation ρ̄_f and `T_p`-eigenvalue `a_p` modulo ϖ: in Edixhoven’s normalisation of ρ̄_f, if `a_p ≢ 0` then `ρ̄_f|G_{ℚ_p}` is reducible, an extension of the unramified character with Frobenius value `a_p` by `ω^{k−1}` times the unramified character with Frobenius value `χ(p)/a_p` (Deligne); if `a_p ≡ 0` then `ρ̄_f|G_{ℚ_p}` is irreducible with `ρ̄_f|I_p ≅ ω_2^{k−1} ⊕ ω_2^{p(k−1)}` (Fontaine). Prove both, transport them to the cohomological convention of §3.2 by the dual and Frobenius dictionary of the Conventions, and deduce in the convention of EM11 §3.5 that the Serre weight `(Sym^{k−2}k²)^∨` lies in `W(ρ̄_p)` and that `T ↦ a_p mod ϖ` occurs in `m((Sym^{k−2}k²)^∨, ρ̄_p)`, as used in the proof of EM11 Theorem 5.7.7(1), p. 65 (Edixhoven, The weight in Serre’s conjectures on modular forms, Invent. Math. 109 (1992), Theorems 2.5 and 2.6, author DVI pp. 5–6, with the proof of Theorem 2.6 in §6, pp. 16–22; Theorem 2.5 is proved in Gross, A tameness criterion, Duke Math. J. 61 (1990)). AlgebraicModularFormsAndSerreWeights R15.3–R15.4 supply the Hasse, theta and supersingular-periodicity operators and the numerical local recipe used in the proof; their minimal-weight statement does not control `T_p` and is not a substitute. Needed by: §2.4.

  **Checks.** Weights 2 and p+1 retain their endpoint hypotheses; the `T_p` eigenvalue is retained with the local weight, since `a_p ≢ 0` and `a_p ≡ 0` give reducible and irreducible local representations in the same weight; numerical minimal weight alone does not determine the Hecke module.

- **CompletedCohomologyPartII §§3.13–3.16 extension.** Extend the existing orthonormalizable/profree and mixed-tensor targets to EM11 Appendix C’s cofinitely generated and coadmissible smooth modules, saturation and closure, the maximal cotorsion-free submodule, Proposition C.36 and the evaluation criteria C.45–C.52, pp. 103–116. Tensor cancellation C.51 requires nonzero orthonormalizable V. C.52 also requires the composite to be injective with saturated image (with both hypotheses essential). Apply with `V = ρ^m ⊗ θ ≠ 0`. Include the coadmissible smooth dual comparison used by NAK Lemma B.16. Do not treat the existing mixed-tensor carrier as this entire theory. Needed by: §4.3, §4.4, §4.7.

  **Checks.** Tensoring with zero cannot detect an isomorphism; a nonsaturated injection cannot satisfy C.52; Σ₀ empty gives the coadmissible dual T′ of T.

- **LocalGaloisDeformationRings §1.1 extension.** Supply irreducibility and reducedness of the unrestricted framed two-dimensional deformation ring for `G_{ℚ_p}` at every odd p, including the exceptional nonsmooth cases in Tung-P3 Proposition 3.9, p. 12 (Paškūnas, The image of Colmez’s Montreal functor, Corollary B.5; Böckle, Deformation rings for some mod 3 Galois representations, Theorems 4.2, 5.2). The existing local-lifting-ring node supplies representability only; the Fontaine–Laffaille or weight-two constrained ring is a different ring. Retain the auxiliary irreducible-factor choices needed to pass from local to patched full support. Needed by: §5.3, §5.4.

  **Checks.** Formally smooth unrestricted rings are a sufficient case; exceptional nonsmooth odd-p rings retain irreducibility/reducedness separately; a constrained crystalline quotient is not the unrestricted ring.

- **Pan block dimension comparison.** Import Iwasawa rings, uniform filtered rings, Auslander regularity and canonical dimension from CompletedCohomologyPartII §§5.1 and 5.5. In §1.6’s split-p definite setting with p odd and the block restrictions of §4.11, put `Λ=k[[Kₙ/Zₙ]]` for the uniform central quotient and use §4.10’s projective block generator P_B, endomorphism ring E_B and central pseudo-deformation ring `R_p^{ps}`. Construct `panBlockDimension`: for N a finitely generated right E_B/(ϖ)-module with its induced compact topology, `dim_{R_Λ}(N ⊗̂_{E_B} P_B) ≤ dim_{R_p^{ps}/(ϖ)}N + [F:ℚ]`, with R_Λ the central coefficient/Iwasawa tensor ring of Pan §3.6; prove the central non-zero-divisor, block tensor and special-fibre comparisons of Lemmas 3.6.9–3.6.11, Proposition 3.6.12 and Lemma 3.6.14, pp. 35–37. Pan Lemma 3.6.4, p. 34, identifies Λ as uniform of dimension `3[F:ℚ]` with polynomial associated graded ring; with these comparisons Pan Theorem 3.6.1 gives characteristic-zero components of dimension `≥1+2[F:ℚ]`. Finite commutative support lemmas of DeformationAndDerivedPatchingAlgebra do not give this comparison. The arithmetic application is §4.11(6). Needed by: §3.7, §4.11, §5.7.

  **Checks.** For the regular k[[ℤ_p^d]] module canonical dimension is d, the full analytic dimension; its trivial module k, a one-dimensional smooth character, has dimension zero; a central non-zero-divisor lowers the nonzero module dimension by one under the stated finiteness hypotheses, with the zero-module convention inherited from the supplier; the block tensor inequality retains the exceptional character blocks.

- **OrdinaryAutomorphicFormsAndModularityLifting §2.2 dyadic extension.** The odd-p quaternionic nearly ordinary Hecke theorem does not supply a dyadic theorem. Supply the `p = 2` ordinary component/lift theorem of Tung-2 Theorem 7.3.1, p. 37, with Propositions 7.1.6, 7.2.1 and Corollaries 7.2.2–7.2.3: residual non-solvable automorphic representation, the indicated ordinary seed at P, matching determinants, special conditions at Σ and fixed potentially semistable components at the remaining places. Include the finite solvable base change used to attain even degree and appropriate dyadic local degrees. The ordinary seed and component conditions must not be dropped. Needed by: §5.6.

  **Checks.** At p=2 retain the ordinary seed; determinants match at every place; a nonordinary component requires the separate nonordinary argument.

- **General definite arithmetic adapter.** Extend HilbertModularVarietiesAndShimuraCurves R18.3’s even-degree, centre-quotiented finite class sets, coefficient forms and parallel-weight statements to the definite quaternionic finite double-coset spaces, coefficient forms and small stabiliser-mod-centre decomposition of Pan §§3.1–3.2, pp. 17–20: every totally real F with p split completely, D definite and split above p with arbitrary finite ramification away from p, compatible central character and nonparallel locally algebraic weights. Retain the closure of rational central units in the central-quotient comparison of CompletedCohomologyPartII Layer 8; never infer discreteness of those units in the finite adeles. This does not assert that the raw infinite-level quotient is a profinite manifold over a general F. Needed by: §1.6, §1.7, §2.7, §2.8.

  **Checks.** F=ℚ permits discrete raw stabilizers; higher-degree rational units require their closure in the central quotient; nonsmall class summands retain stabilizer invariants; nonparallel weights retain each real embedding; ramified finite places retain their actual compact subgroups.

- **Dyadic cusp boundary.** Extend ModularCurvesPartII §14.9’s Eisenstein Hecke action on cusp cohomology to residue characteristic 2, with the exact cusp and coefficient-system Eisenstein calculation of EM11 §5.3, pp. 49–54, and the coefficient systems used for injectivity. Localisation at an absolutely irreducible residual ideal kills that boundary, giving the `p=2` part of §1.4. The present at-least-3 node is not sufficient for the all-p non-Eisenstein injectivity and finite-level comparison targets. Needed by: §1.4.

  **Checks.** At a residual Eisenstein ideal cusps can survive; at an absolutely irreducible ideal they vanish also in characteristic two, and nonsplit boundary extensions are killed by exact localization; the coefficient calculation retains the local system rather than replacing it by constants.


### Further comparison inputs

1. **Scholze’s functor.** Use §0.6’s equivariant sheaf, Sⁱ and admissible finiteness. The arithmetic comparison is §4.12, CDN Propositions 4.11–4.12, p. 51, with exchanged quaternion invariants.

   **Checks.** The zero representation has zero sheaf; height one has no positive cohomology; height two retains the degree-two term unless the sharper hypotheses apply.

2. **Shimura H⁰ coefficient extension.** Import HilbertModularVarietiesAndShimuraCurves §R18.4.8, `residualEisensteinVanishing`, for constants over k at an absolutely irreducible residual ideal, with its effective-level, all-component and matched Hecke/Frobenius hypotheses. Prove `shimuraH0_nonEisenstein` for O/ϖⁿ using the coefficient filtration and exact localization, then for E/O and the torsion tower by filtered colimits. Compare this extension with CompletedCohomologyPartII Layer 8’s Shimura adapter and SCH, proof of Proposition 7.7, p. 29, on the CDN §4.1.4 carrier. The Hochschild–Serre edge map in §1.5 then has zero Hⁱ(K,H⁰) error terms.

   **Checks.** Residual Eisenstein ideals can retain H⁰; for n=1 recover the imported vanishing; induction from n to n+1 uses the exact coefficient sequence without averaging over a p-group.

3. **Ordinary Eisenstein seed.** OrdinaryAutomorphicFormsAndModularityLifting §2.4 must supply the ordinary Hilbert Eisenstein maximal ideal with Pan Proposition 5.6.1, p. 86, in particular the positive ϖ-adic valuation of the specified p-adic L-value `L_p(F,−1,χ̃ω)`. This is the seed needed in §3.8, not a consequence of merely writing the Eisenstein ideal generators.

   **Checks.** A unit trace discrepancy generates the unit ideal; an empty prime index still leaves (ϖ); the positive L-value valuation is an additional arithmetic hypothesis.

4. **Small-weight and good-weight inputs.** For §§2.3–2.4, combine the small-weight local description above with §0.5’s `localSerreWeights` and compact-Hecke module and §§15.6–15.10’s coefficient/tower Ihara and good-weight multiplicity-one statements specified above. The local Hecke module is `k[T,Z,Z⁻¹]`; the global Whittaker derivative and absence of finite-dimensional away-from-p subobjects must use the same coefficient convention (EM11 Theorem 5.7.7, pp. 63–66). The evaluation argument in §4.4 also requires absence of one-dimensional G-subobjects (EM11 pp. 88–89).

   **Checks.** A missing predicted weight is consistent with the upper bound; an overlapping determinant weight is not good; non-scalarity is retained for away-from-p genericity.

5. **Auxiliary CM weight occurrence.** For §6.3, obtain occurrence of every chosen predicted Serre weight W of the auxiliary CM-induced residual representation, not merely a theorem computing its minimal weight (EM11 Remark 5.7.4, p. 63, and §7.4, p. 97). Obtain the CM Hecke character from GL2AutomorphicRepresentationsAndTransfer R17.5’s prescribed local induction, including its S-unit character-extension theorem. Require infinity type `z⁻¹`, the chosen inert-p residual Galois character, and a regular inert-ℓ component for §6.4 (DLB Lemma 5.6, pp. 26–27).

   **Checks.** Each chosen weight must occur globally; inertia alone does not specify an infinite type; a nonregular inert-ℓ component does not give the required supercuspidal type.

6. **Globalisation hypotheses.** The definite-unitary construction uses the automorphic adequate globalisation of Emerton–Gee Proposition A.2/Corollary A.7, as invoked by CEGGPS §2.1 and Lemma 2.2, pp. 15–17: p ∤ 2n and a potentially crystalline, potentially diagonalisable regular lift are required. Lemma 2.2 establishes the lift condition after scalar extension for `n=2` or semisimple residual representations; it is not unconditional in general n. The multiplicity-one construction also chooses residual image `GL_n(k′)` with `#k′>3n` and the indicated finite solvable base change (CEGGPS p. 17). The dyadic construction uses the precise potential-realisation and residual-modularity theorems of Calegari Proposition 3.2, Snowden Proposition 8.2.1 and its supporting propositions, Khare–Wintenberger II Theorem 6.1 (pp. 53–56)/Lemma 3.5 (p. 22) and Paškūnas Lemma 3.29, as invoked by Tung-2 Lemmas 4.3.3–4.3.4, p. 21. KW II’s dyadic potential-modularity construction retains its non-solvable-image hypothesis. The reducible-locus component theorem requires the potentially automorphic residual seed in BLGG Theorem A.4.1 (Tung-P3 Proposition 4.4, p. 14). These are the hypotheses of §6.5’s independence comparison, without replacing any by Serre’s full theorem.

   **Checks.** Rank two admits the stated potentially diagonalizable lift after coefficient extension; general rank retains that lift as a hypothesis; the dyadic potential-modularity input retains nonsolvable residual image.

7. **Deformation density.** Supply Böckle Corollary 3.8 for reducible local restriction, and its irreducible-local extension using Diamond–Flach–Guo Theorem 3.6, p. 723, and Corollary 2.3, p. 698 (DFG), for twists of Fontaine–Laffaille weight k with `2≤k≤p`. DFG’s modularity theorem retains ramified crystalline short lifts, residual modularity and absolute irreducibility on the quadratic subfield of `ℚ(μ_p)`. Its Corollary 2.3 requires `p>2` and a rank-two Fontaine–Laffaille object with one-dimensional `Fil¹`. The endpoint `k=p` is used through Emerton’s extension argument on EM11 p. 96, not by silently discarding the original theorem’s hypotheses. The weight-two finite-flat argument alone does not cover this range. These are the deformation-theoretic inputs to §6.2. The exact `R=T` formulation is Nakamura Theorem 2.1, pp. 17–18, whose proof cites Böckle Corollary 3.8 and EM11 §7.3, pp. 95–96. No density-to-injectivity step may omit reducedness.

   **Checks.** The endpoint k=p uses the stated extension; finite-flat weight two does not cover all k; reducedness is retained when dense points force a kernel to vanish.

8. **Normalisation bridges.** Prove the Pan/Tung Galois-dual, determinant and reciprocal-Hecke dictionary of §3.2(c) before transferring either statement to the other convention. Before exporting §6.3’s precise locally algebraic formula, prove `globalAlgebraicNormalization`, comparing EM11 Theorem 3.3.22, p. 28, with §7.4, pp. 97–98: `det^(b+1)` and `det^b` are different algebraic characters. This bridge specifies the necessary cohomological/dual identification; no equality of those characters is assumed.

   **Checks.** det^b and det^(b+1) differ on diag(2,1); geometric-to-arithmetic Frobenius reciprocates eigenvalues on the same V; dualizing V is a separate operation.

## How to read the build

Layer 0 builds the local representation, geometric functor and definite unitary foundations. Layer 1 specialises the completed-tower interfaces to arithmetic objects and proves their degree, support and injectivity comparisons. Layer 2 identifies classical and mod-p coefficient pieces. Layer 3 matches Hecke and Galois actions. Layer 4 constructs arithmetic multiplicity modules and proves the various local–global comparison maps. Layer 5 applies those comparisons to patched modules and distinguishes each support conclusion. Layer 6 gives the global consequences with their hypotheses and dependence on residual modularity explicit. Within a layer, the prerequisites below determine the order; a cited input is used only in the range of its exact supplier contract.

## Layer 0: local comparison foundations

These are construction and theorem targets on the imported smooth, coefficient and geometric carriers. Their definitions carry functoriality and comparison APIs before their arithmetic use. None presupposes the global comparison or support theorems of Layers 4–6.

### 0.1 Admissible categories, ordinary parts and Jacquet modules

For `G = GL_2(ℚ_p)`: (i) the categories of admissible G-representations on orthonormalizable modules over a complete local noetherian O-algebra A (Emerton lg §3.1, Definition 3.1.1), with the facts used for completed tensor products: Emerton lg Proposition 3.1.3 (a continuous equivariant map between admissible continuous representations has closed image), Lemmas 3.1.6, 3.1.16 (ϖ-adic separatedness of `Π ⊗̂_A M` for `M^*` finitely generated) and 3.1.17 (𝔭-parts of `Π ⊗̂_A` M), and Lemma B.6; (ii) Emerton’s ordinary-parts functor `Ord_B` on admissible representations with its adjunction `Hom_G(Ind_{B̄}^G U, V) ≅ Hom_T(U, Ord_B V)`, where B̄ is opposite to B and induction is unnormalised (Emerton, Ordinary parts I, Theorem 4.4.6), and its compatibility with completed cohomology as used in lg Proposition 6.2.2 and Corollary 5.6.13; (iii) Emerton’s locally analytic Jacquet functor `J_B` with left exactness, as used in lg §7.2. Needed by: §4.5, §6.1.

Define the admissible integral category by separated complete coefficient modules with continuous action and admissible smooth reductions, and its unitary Banach category by inversion of ϖ with the stable lattice retained. The API includes continuous equivariant Hom, kernels, closed images, coefficient reduction, completed tensor and duality; the generic coefficient carriers are CompletedCohomologyPartII §§3.13–3.16. Define `Ord_B` by Emerton’s locally finite right adjoint to induction from B̄, and the locally analytic Jacquet functor on locally analytic vectors, with functoriality, left exactness and compatibility with their torus actions. The hypotheses of the closed-image and completed-Hom statements are those of EM11 Propositions 3.1.3, 3.1.12 and Lemmas 3.1.16–3.1.17, not arbitrary topological modules.

**Checks.**

- The zero representation is admissible, and its coefficient reductions, ordinary parts and Jacquet module are zero.
- A finite-dimensional continuous unitary representation with a stable lattice recovers that lattice after choosing its unit ball; a nonunitary character has no such stable unit ball.
- An infinite direct sum of trivial residual representations is not admissible: its compact-open invariants have infinite dimension.
- For a generic smooth mod-p torus character χ with `χ ≠ χ^w`, where `χ^w(t)=χ(wtw⁻¹)` and w exchanges the two diagonal entries, `Ord_B(Ind_B^G χ) ≅ χ^w`. The identity of `Ind_{B̄}^G χ` gives the unit from χ; the same-Borel formula would instead identify a Hom containing an identity with `Hom_T(χ,χ^w)=0`.
- Ordinary parts of the zero module vanish, and the functor is additive on finite direct sums.
- Supersingular irreducible mod-p representations have zero ordinary parts, so replacing ordinary parts by restriction to the torus fails.
- The Jacquet functor of the zero representation is zero, and its torus action is the action induced from the chosen Borel.
- On a locally algebraic principal series in the regular range, the resulting torus characters agree with the chosen Borel and modulus normalization in EM11 §7.2.
- Left exactness gives an injection on Jacquet modules of a subrepresentation; no assertion of right exactness is made for a nonsplit extension.

### 0.2 Mod-p local Langlands and the Montréal functor

Colmez’s Montréal functor MF (and Paškūnas’s normalisation V̌) on admissible finite-length G-representations, exact and compatible with central characters; for ρ̄: `G_{ℚ_p} → GL_2(k)` not a twist of (1 ∗; 0 ε̄), Colmez’s π̄ with `MF(π̄) ≅ ρ̄`, central character `det(ρ̄)`ε̄, no finite-dimensional subobject or quotient (Emerton lg Theorem 3.3.2); the explicit mod p correspondence for irreducible ρ̄ (supersingular π̄ attached to `Ind ω_2^{r+1}`, used in DLB Lemme 5.6 and in the socle description of Serre weights). Needed by: §4.1, §4.6, §5.3, §5.4, §5.6, §6.4.

Import `MontrealFunctor` on the fixed-central-character finite-length category, with its compact and residually finite-length Banach extensions and the block/Galois dictionary `GL2Block.residualGalois`, from LocalGaloisDeformationRings §3.7.2. Construct here its adapter to the cohomological normalisation and, on top of it, the full mod-p correspondence for two-dimensional local Galois representations, with twists, central characters, subquotients and the supersingular classification as API (EM11 §§3.2–3.4). Maintain the distinction between Colmez’s covariant convention and the compact-dual convention V̌. Write V_Col for the covariant Galois functor of PadicLocalLanglandsForGL2Qp §3.2: `V_Col(π) ≅ MF(π)(ε)`. For the compact dual M of a smooth representation with central character ψ, M has central character `ψ⁻¹` and `V̌(M) = V_Col(M^∨)^∨(ψε)`. These are the normalisation comparisons of Nakamura Lemma B.23, p. 100, on the imported functor, including after its specified inverse-limit extensions.

**Checks.**

- The zero representation has zero Montréal image, and a short exact sequence gives the corresponding exact sequence with the stated variance.
- An irreducible induction of a niveau-two character gives the supersingular representation with the predicted Serre socle, not a principal series.
- Twisting by a character on the Galois side gives the determinant twist on the group side with central character `det(ρ̄)`ε̄.
- For π̄ in the excluded cyclotomic-extension range, the no-finite-dimensional-subquotient assertion is not applied.
- A scalar residual restriction and a split sum of distinct characters remain distinct cases; the correspondence does not make their endomorphism algebras equal.

### 0.3 Banach local Langlands, algebraic vectors and compact types

(i) Topological irreducibility of `B(V)` for absolutely irreducible V (Emerton lg Proposition 3.3.24; Colmez Theorem 0.17(ii)); (ii) Colmez’s non-vanishing of locally algebraic vectors for de Rham V with distinct Hodge–Tate weights (Theorem VI.6.18) and the description `B(V)_{l.alg} ≅ Sym^{a−b−1} ⊗ det^{b+1} ⊗ π_p(V)` in the crystabelline and semistable cases (Theorem VI.6.50) and its dependence only on `π_p(V)` and the weights (Theorem VI.6.42); (iii) Berger–Breuil (Sur quelques représentations potentiellement cristallines de GL₂(ℚ_p), Définition 4.2.4, Théorème 4.3.1, p. 38, and Corollaires 5.3.1–5.3.3, p. 52): for crystalline, absolutely irreducible and non-exceptional V, so that `π_p(V)` is an unramified principal series and the crystalline Frobenius eigenvalues are distinct, `B(V)` is the universal unitary completion of its correctly normalised locally algebraic factor, giving the extension property for maps from that factor for unitary Banach Π; (iv) Colmez’s locally algebraic vectors for potentially semistable V in the form used by Tung (Corollary 4.3). The potentially crystalline, non-crystabelline case of Emerton lg Theorem 3.3.22 is the global argument of §6.3. Use §0.3’s locally algebraic vectors, Berger–Breuil completion and Henniart types in their precise local ranges. Keep the a,b convention, including the normalisation bridge below. Crystalline applications at p=2 and at exceptional double-root parameters use `crystallineNonspecialCompletion` below. Needed by: §4.5, §4.4, §4.9, §4.11, §5.4, §6.1, §6.3.

Construct `B(V)` on the domain of EM11 Definition 3.3.15: V has a stable O-lattice whose reduction satisfies Assumption 3.3.1 and whose deformation lies in `Def^{crys}`. Retain admissibility, unitarity, functoriality on that domain, twists that remain in it, central character `det(V)ε` in the cohomological convention, duality and Montréal recovery. For absolutely irreducible V at every p, construct Colmez’s functor from Théorème 0.17 and Remarque 0.18 of Représentations de GL₂(ℚ_p) et (φ,Γ)-modules and its all-prime extension/recovery from Colmez–Dospinescu–Paškūnas, The p-adic local Langlands correspondence for GL₂(ℚ_p), Theorem 1.1, with the dual convention explicitly transported to this one. The reducible and small-prime applications of the deformation construction retain the lattice/`Def^{crys}` hypotheses; DLB §5.1’s family retains absolute residual local irreducibility. Define locally algebraic vectors as the sum of images of equivariant maps from finite-dimensional algebraic representations tensored with smooth representations; prove their naturality and their compatibility with finite-dimensional algebraic twists. Import Henniart’s supercuspidal type, multiplicity one and occurrence criterion from GL2AutomorphicRepresentationsAndTransfer §R16.2.9 (`r16-2-henniart-unicity`), over characteristic-zero algebraically closed coefficients and for all local fields including dyadic ones. Construct only `henniartType_scalarExtension`, the scalar-extension/descent and convention adapter over a sufficiently large finite E containing a field of definition for the type and its inertial class; compare the Hom multiplicity after faithfully flat extension. Prove `banachReducibleStructure` on the domain of Definition 3.3.15 for an ordered extension `0→χ₁→V→χ₂→0`, with central character `χ₁χ₂ε` and Montréal recovery of that extension: EM11 Proposition 3.4.2 gives the principal-series extension when `χ₁χ₂⁻¹≠ε`, with splitting exactly when V splits; Proposition 3.4.5 gives the three-step filtration when `χ₁χ₂⁻¹=ε`. Carry the stable-lattice and residual exclusions in both statements, including at small primes. These are separate structure targets; the global extension of the locally algebraic formula is §6.3 (EM11 §§3.3–3.4; DLB §5.1).

Construct `crystallineNonspecialCompletion` for every prime p: for a trianguline parameter `s = (δ₁, δ₂, ℒ) ∈ S_irr ∩ S_*^cris` which is nonspecial in CDP §3.3.4, identify `Π(s)` with the universal unitary completion of `B^alg(δ₁,δ₂)`. In particular, every continuous E-linear G-map from this locally algebraic factor to a unitary E-Banach representation extends uniquely to `Π(s)`. Transport the Galois and central-character convention through §0.2 and the algebraic weight through the stated Hodge–Tate convention. For §4.9’s crystalline absolutely irreducible ρ with distinct weights `a < b` and spherical irreducible smooth factor `σ_p`, this factor is `σ_p ⊗ Sym^{b−a−1}E² ⊗ det^a`. Nonspecial does not exclude the exceptional double-root crystalline parameter. Source: Colmez–Dospinescu–Paškūnas (CDP), Theorem 3.23(a), §3.3.4, pp. 24–26, including the exceptional-case proof at p=2.

**Checks.**

- With distinct crystalline Frobenius eigenvalues and the nonspecial spherical factor, `crystallineNonspecialCompletion` agrees with the Berger–Breuil completion and its extension property.
- An exceptional double-root crystalline parameter is covered by CDP Theorem 3.23(a), also at p=2; it is outside the cited non-exceptional Berger–Breuil corollaries.
- For a special parameter `δ₁ = x^{κ(s)−1}εδ₂`, the input to CDP Theorem 3.23(c) is the extension `E_ℒ`; the nonspecial locally algebraic completion statement does not apply.
- The lattice condition of Definition 3.3.15 is required for the deformation construction; absolute irreducibility permits the separately sourced Colmez construction, including at p=2.
- For reducible V retain its extension class: a split sum and a nonsplit extension have the same semisimplification but are different recovery targets.
- After extending E to an algebraic closure, the Henniart type Hom multiplicity remains one; a different inertial class has zero multiplicity.

- For absolutely irreducible V, `B(V)` is topologically irreducible; a direct sum of two characters must not be forced into that case.
- For a de Rham V with distinct weights the locally algebraic subspace is nonzero, whereas coincident weights do not satisfy this criterion.
- A scalar character twist changes the determinant and central character as prescribed, including the cyclotomic factor.
- The zero representation has no nonzero locally algebraic vectors; a finite-dimensional algebraic representation tensored with a smooth one is entirely locally algebraic.
- A character of infinite analytic weight is not made algebraic by declaring its vectors smooth.
- For a crystalline, irreducible, non-exceptional V with unramified smooth factor, Berger–Breuil recovers `B(V)` as the universal unitary completion; the exceptional double-root case uses `crystallineNonspecialCompletion`, rather than Corollaires 5.3.1–5.3.3. The potentially crystalline non-crystabelline case retains the separate argument of §6.3.
- A supercuspidal representation contains its minimal type; a representation with a different inertial class does not.
- Unramified twisting preserves the inertial type while changing the Frobenius parameter; the type alone does not determine that parameter.
- The trivial smooth type tests the unramified class and is not a substitute for a ramified supercuspidal type.

### 0.4 Deformations, blocks and projective envelopes

(i) Kisin’s theorem (Emerton lg Theorem 3.3.13): `Def^*(π̄) → Def(ρ̄)` fully faithful, restricting to an equivalence `Def^{crys}(π̄) ≅ Def^{crys}(ρ̄)` (and `Def^{crys} = Def` under Assumption 3.3.1, Emerton Remark 3.3.14); (ii) the universal deformation `π_p` of `π̄_p` over `R_p` when `End(ρ̄_p) = k`, and for absolutely irreducible `ρ̄_p` the orthonormalizable admissible family `Π^{univ}` with `Π^{univ} ⊗ k(𝔭) ≅ Π(𝔭)` (DLB §13); (iii) Paškūnas’s blocks of the category of compact `O[[GL_2(ℤ_p)]]`-modules with G-action and central character, the projective envelope `P_B` of the sum of the block simples, with `E_B = End(P_B)` finite over the image of the central pseudo-deformation map (Pan Theorems 3.4.5–3.4.6, Corollary 3.4.12); no general integral centre isomorphism is assumed, the finite generation of `Hom(P_B, M)` over `E_B` for admissible duals (Paškūnas, Image of Colmez’s functor, Proposition 4.17), Theorem 1.10 of that paper (irreducible subquotients of a specialisation at an absolutely irreducible point are isomorphic), and the projective envelope P̃ of the dual of the socle of `π̄_p` with `R_p ≅ End(P̃)` and `π_p^* ≅ P̃` (Nakamura Proposition B.26); (iv) the 2-adic versions used by Tung. Use Kisin’s deformation comparison for (i) and Nakamura’s projective-envelope identification under `p ≥ 5` and its two residual exclusions. Use the finite central map at small p, with its stated p-torsion qualifications; Pan Corollary 3.4.12 only supplies a finite central map for a product block, not an integral centre isomorphism. Match these precise ranges, including dyadic comparison, in every use. Specifically extend the dual-envelope and removal-of-envelope statements from the `p ≥ 5` range to Nakamura’s `p = 3` hypotheses before using them there. Needed by: §4.1, §4.4, §4.7, §4.8, §4.9, §4.10, §4.11, §5.4, §5.6.

Import `GL2Block`, its projective envelopes `P_B`, `E_B = End(P_B)`, the centre `Z_B` and the reconstruction theorem from LocalGaloisDeformationRings §3.7.1, and the block-centre map `ι_B` with its `p = 2, 3` qualifications (`WDTypeRing.blockIdentification`) from its §3.8. Construct here the deformation functors of π̄ on local Artinian O-algebras with residue k and their continuous complete-local extensions, Kisin’s comparison, Paškūnas’s product blocks for `∏_{v|p} GL₂(ℚ_p)` with their finite central map, and the DLB/Nakamura envelope identifications and endomorphism actions specified above. Their API includes tangent and coefficient-change maps, twists, central-character restriction, continuous duality, envelope lifting and uniqueness, and specialisation at primes. The universal deformation requires scalar residual endomorphisms; the orthonormalizable universal family in DLB §13 retains absolute local irreducibility. Product blocks retain their finite central map; no general integral centre isomorphism is asserted. Tung-2 §6 uses the `p = 2` blocks of LocalGaloisDeformationRings §3.7.1; the extension of Nakamura’s envelope statements to his `p = 3` range is constructed here.

**Checks.**

- Over k the deformation functors recover the chosen residual representation, and over `k[ε]/(ε²)` their tangent maps agree under Kisin’s fully faithful comparison.
- A split sum of distinct characters has non-scalar endomorphisms, so the scalar-endomorphism representability argument does not apply to it.
- The zero coefficient module gives a zero base-changed family; a residue-field fibre of the universal family recovers π̄.
- The envelope maps onto its prescribed simple socle dual, and every projective lift to that quotient factors through the envelope.
- For a direct product of blocks the simple objects and projectors separate block factors; a simple in another block receives no nonzero block projection.
- A finite central map need not be an isomorphism; nilpotent or p-torsion kernel and image qualifications remain part of the centre comparison.
- At `p = 3` the excluded block containing a character through determinant is not covered by Pan’s block compatibility.
- Specialising an absolutely irreducible point gives only the irreducible subquotient prescribed by Paškūnas’s theorem, with its stated determinant.

### 0.5 The local Serre-weight Hecke module

Supply the local Serre-weight Hecke module and its identification with `Hom_K(V,π̄)` in EM11 §3.5, Definitions 3.5.2–3.5.4 and Lemma 3.5.5, pp. 31–32. `H(V) ≅ k[T,Z,Z^{-1}]`; the explicit geometric-Frobenius action for reducible `ρ̄_p` and `T = 0` for absolutely irreducible `ρ̄_p` must use the same cohomological weight convention as R15. The Montréal and supersingular definitions of §0.2 alone do not state this Hecke-module comparison. Needed by: §2.4, §4.4.

Define `localSerreWeights(ρ̄_p) = W(ρ̄_p)` on the carrier of isomorphism classes of irreducible k-representations of GL₂(𝔽_p), inflated to K. Its representatives are `(Sym^r k²)^dual ⊗ det^s` with `0≤r≤p−1`, `0≤s≤p−2`. Use the cohomological inertia/extension recipe in EM11 §3.5, pp. 31–32: the two niveau-two weights in the absolutely irreducible case, and the reducible extension criterion, including the peu-ramifiée condition for determinant weights. Retain the chosen coefficient field over which the required characters are defined, with scalar-extension descent. Under Assumption 3.3.1 prove `localSerreWeights_socle`: membership is equivalent to nonzero `Hom_K(V,π̄)`, with the Hecke-module identification of Lemma 3.5.5. For every irreducible Serre weight V, define its compact-induction Hecke action and the resulting module on `Hom_K(V, π̄)`. Require evaluation, character twists, the T and invertible Z actions and the comparison with the predicted Galois weights as API, with the geometric-Frobenius convention of §3.2 (EM11 Definitions 3.5.2–3.5.4 and Lemma 3.5.5).

**Checks.**

- For determinant weights the reducible recipe retains the peu-ramifiée condition; discarding the extension class gives an incorrect weight set.
- An integer giving a minimal classical weight does not encode the two distinct Serre-weight representations of an absolutely irreducible local representation.

- An absolutely irreducible local residual representation has `T = 0` on the indicated socle module.
- Twisting V and π̄ together changes the Z eigencharacter by the prescribed central character; Z remains invertible.
- A weight not occurring in the K-socle has zero Hom module. Giving every weight a rank-one module fails this test.

### 0.6 Scholze’s equivariant sheaf and cohomology functor

For a finite extension `F/ℚ_p` and every `n ≥ 1`, import the Lubin–Tate deformation spaces, full Drinfeld-level tower, period maps, perfectoid infinite level and commuting actions from EndoscopicTransferAndUnitaryTraceComparison §§12.3, 12.5–12.8. Retain every integer quasi-isogeny height component. Write D/F for the division algebra of invariant 1/n, `F̆` for the completed maximal unramified extension and `M_LT,0 = M_LT,GLₙ(O_F)`.

**Gross–Hopkins period-torsor comparison.** Prove that `π_GH: M_LT,K → ℙⁿ⁻¹_{F̆}` is a surjective étale covering with geometric fibres `GLₙ(F)/K`, for every compact open K. At level zero it admits local sections in the adic topology. Identify `M_LT,∞ → ℙⁿ⁻¹_{F̆}` as the full `GLₙ(F)`-torsor, factoring through the `GLₙ(O_F)`-torsor over `M_LT,0`. Prove the corresponding equivariant étale descent comparison, compatible with pullback, level transitions, the commuting Dˣ-action and Weil descent; the projective space carries the split Brauer–Severi action of Dˣ. These comparisons connect the imported tower to the sheaf construction below (SCH §3, pp. 10–11 and 13; Scholze–Weinstein, Moduli of p-divisible groups, Proposition 6.1.3 and Lemma 6.1.4, pp. 55–56).

**Checks.**

- Over a level-zero section on an affinoid in projective space, descent of the sheaf attached to π depends only on `π|GLₙ(O_F)`; this is the local comparison used in SCH Lemma 3.7.
- The fibre over a geometric period point has a simply transitive `GLₙ(F)`-action. Over a fixed level-zero point the group is `GLₙ(O_F)` instead; these torsors have different bases.
- At height one the full period fibre still has its `Fˣ`-action. Fixing one quasi-isogeny height component removes uniformizer translates and cannot supply that full torsor.

Construct the equivariant étale site using PerfectoidTowers P9.4 for pro-étale tower descent, AdicEtaleGeometry A1.6 and A4.2a for étale sites and finite torsor descent, and DiamondEtaleCohomology C0–C1 for torsion sheaf cohomology. Apply the period-torsor comparison above on these carriers, with the action conventions of SCH §2.

**Equivariant sheaf and cohomology.** For a smooth admissible mod-p representation π of `GLₙ(F)`, define `F_π` on the equivariant étale site of `ℙⁿ⁻¹/Dˣ` by continuous equivariant maps from the pullback of the full period torsor. Define `Sⁱ(π) = Hⁱ_ét(ℙⁿ⁻¹_C,F_π)` with its commuting continuous Dˣ and `G_F` actions. Prove exactness and the stalk description of the sheaf functor, naturality, coefficient change, the long exact sequence for Sⁱ, independence of the complete algebraically closed C, admissibility and vanishing above degree `2(n−1)`, retaining the source’s hypotheses for sharper vanishing. These are targets in every rank (SCH Proposition 3.1, Theorem 3.2 and Proposition 4.6; CDN §3.1, Théorème 3.1, pp. 40–41).

**Checks.**

- At height one the finite-level deformation spaces have dimension zero; replacing the dimension n−1 by n fails this test.
- After inverting the residue characteristic, forgetting one Drinfeld level is a finite étale covering with its actual congruence-level group action; the integral special fibre is not declared étale by the same argument.
- The infinite-level points retain a full Tate-module trivialization. Changing it by a nonidentity element gives a different point in the GLₙ(F)-torsor fibre of the period map.
- The period map has target ℙⁿ⁻¹ and its geometric fibres are torsors for GLₙ(F), with the commuting Dˣ action; quotienting that fibre recovers a point, while replacing the fibre by its stabilizer does not.
- For a trivial acting group the equivariant étale site and sheaves recover the ordinary étale site and sheaves. A nontrivial group linearization is additional data, not merely its invariant sections.
- An equivariant covering remains a covering after pullback, and descent preserves the specified linearization.
- `F_0` is the zero sheaf and `Sⁱ(0) = 0` in every degree.
- Every geometric stalk of `F_π` recovers π; replacing the equivariant sheaf by the constant invariant subspace fails for a nontrivial π.
- An exact sequence of smooth representations gives an exact sequence of sheaves, whereas `S¹` participates in a long exact sequence and is not declared exact.
- For `n = 1` the base is a point and the degree bound is zero; positive cohomological degrees vanish.
- For `n = 2` the degree bound is 2, and no unconditional vanishing of `S²` is deduced from that bound alone.
- The Dˣ and `G_F` actions commute, and changing C gives the comparison with those same actions.

**Admissible torsion coefficients.** Extend the sheaf and Sⁱ to admissible smooth O-torsion `GLₙ(F)`-modules V, where every vector is killed by a power of ϖ and `V^H[ϖʲ]` has finite length for every compact open H and j. Construct `F_V ≅ colim_j F_{V[ϖʲ]}` and the equivariant comparison `Sⁱ(V) ≅ colim_j Sⁱ(V[ϖʲ])`. Prove admissibility, independence of C and the degree bound in this category; use coherence of the compact Dˣ-quotient étale sites before passing to their colimit. This includes the `L/O`-valued module of §4.12 without a uniform torsion exponent (SCH Definition 4.1, Remark 4.2, Theorem 4.4 and its proof, pp. 18–19; Proposition 4.6, p. 20).

**Checks.**

- For `V=V[ϖʲ]` the comparison recovers the bounded-torsion construction.
- For `V=L/O` with trivial group action, `V[ϖʲ]=ϖ^(−j)O/O` has finite length for every j, but no fixed j recovers V.
- The sheaf and cohomology comparisons preserve both Dˣ and `G_F` actions, and give zero for `V=0` in every degree.

### 0.7 Definite unitary forms for global patching

Let F̃/F̃⁺ be a CM extension and `n ≥ 1`. With the local invariants and parity conditions of CEGGPS §2.3, construct the rank-n unitary outer form G̃ that is compact at infinity and quasi-split at finite places, together with the chosen split local identifications. At every sufficiently small compact open U and compatible coefficient representation of weight ξ and type τ, define algebraic forms `S_{ξ,τ}(U,A)` as functions on the finite double-coset space satisfying the stated coefficient equivariance. Construct the tame Hecke algebra as the image of its double-coset operators on this actual module. The API includes level restriction and trace, stabilizer invariants at nonsmall levels, coefficient change with its exactness hypotheses, commuting local actions, adjoint operators and the good-place Hecke polynomial. Their completed degree-zero object is the extension of CompletedCohomologyPartII §8.5 specified in the supplier contracts. No fixed rank or one chosen global field replaces this construction (CEGGPS §§2.3–2.6).

**Checks.**

- At a split finite place the chosen unitary group identification gives GLₙ(F̃⁺_v), including its determinant, rather than the norm-one subgroup SLₙ.
- At infinity the real unitary group is compact and its determinant lies in the norm-one torus; the split real group GLₙ(ℝ) fails this test.
- In rank one the group is the norm-one torus. At inert finite places its points satisfy the norm-one equation, so replacing it globally by a split multiplicative group fails.
- At a small level, scalar-valued forms are functions on the finite class set, with one free copy of A per class; with stabilizers the corresponding invariant submodule replaces A.
- A coefficient character incompatible with a central stabilizer gives a zero summand; ignoring coefficient equivariance gives an incorrect rank.
- At rank one the double-coset description is the character theory of the unitary torus, with the prescribed central character.
- Zero coefficients give zero forms; a trivial coefficient representation recovers ordinary scalar functions.
- Restriction to a normal smaller level followed by trace multiplies by the level index; in residue characteristic dividing that index one cannot divide by it.
- A double coset represented by the identity acts as the identity; products act by the actual double-coset convolution multiplicities.
- On the zero module the image Hecke algebra is the zero ring, so nonzero localisation still needs the residual automorphic seed.
- At an unramified split place, the operator labelled by the scalar uniformizer contributes the determinant coefficient of the rank-n Hecke polynomial with the chosen normalization.
- Changing the chosen split place identification transports both coefficient and Hecke actions; it does not change the underlying arithmetic double-coset module.

### Examples

For a split residual sum of distinct characters, its diagonal endomorphism algebra has dimension two, so it fails the scalar-endomorphism condition of the universal-family construction. In the `n = 1` Scholze construction the projective base is a point and positive cohomology vanishes. At a small definite unitary level, a class with trivial stabilizer contributes exactly one copy of the coefficient module, while a nontrivial stabilizer contributes its invariants.

### Dependencies

CompletedCohomologyPartII Layer 3 supplies the coefficient and duality carriers. SmoothRepresentationsOfLocalGroups SR.0–SR.2 supplies smooth representations, induction and compact Hecke actions. LocalGaloisDeformationRings Layer F and §1.1 supply local Galois deformation rings, and its §§3.7.1–3.7.2 and 3.8 the `GL₂(ℚ_p)` blocks, centres and Montréal functor. PerfectoidTowers P9, AdicEtaleGeometry A1.6 and A4.2a and DiamondEtaleCohomology C0–C1 supply the geometric descent and sheaf-cohomology carriers for §0.6. ReductiveGroupsPartII RG2.0a and AdelicAlgebraicGroups Layer 1 supply the group and adelic quotient foundations for §0.7; its definite unitary construction and coefficient forms are the targets stated here.

## Layer 1: towers and completed cohomology


This layer fixes the carriers. For the modular curves it takes CompletedCohomologyPartII's coefficient-limit object of the modular tower, through CompletedCohomologyPartII Layer 8's realisation of the actual canonical-model tower, and records Emerton's normalisations: the p-level colimit is taken at each finite coefficient level before completing, and the tame colimit afterwards. It then proves what is special to `GL₂`: the explicit degree-zero object, the vanishing of completed `H²` with compact supports, surjectivity of forgetting supports, and the non-Eisenstein results of Emerton §5.3 — after localising at an absolutely irreducible residual representation the boundary disappears, finite-level cohomology is recovered as invariants, and the mod `ϖ^s` cohomology is an injective smooth `K_p`-module, so that the localised completed cohomology is `C(K_p, O)^r` for pro-p `K_p`.

The same layer constructs the two quaternionic carriers the later layers need: the completed cohomology of Shimura curves for a quaternion algebra over a totally real field ramified at one place above p (used with Scholze's functor), and the completed module of a definite quaternion algebra split above p — continuous functions on the raw quotient over `ℚ`, and the finite-level coefficient-limit module with Pan’s central quotient over general totally real F — which is the zero-dimensional case of all the constructions and the setting of Dospinescu–Le Bras, Pan and Tung.
For the Shimura-curve finite-level invariant comparison, smallness alone is insufficient: the Hochschild–Serre edge map also needs the localised `H⁰` vanishing recorded below. Discrete stabilisers and raw p-adic manifold assertions are restricted to the `ℚ` case.

### 1.1 Completed cohomology of the modular tower


Let `E/ℚ_p` be finite with integers O, uniformizer ϖ and residue field k, and let `G = GL_2(ℚ_p)`. For a compact open `K_f ⊂ GL_2(𝔸_f)` let `Y(K_f)` be the modular curve `GL_2(ℚ)∖((ℂ∖ℝ) × GL_2(𝔸_f)/K_f)` with its canonical model over `ℚ`. For `A ∈ {O, O/ϖ^s, E}` and a tame level `K^p ⊂ GL_2(𝔸_f^p)` put `H^1(K^p)_A = colim_{K_p} H^1_ét(Y(K_pK^p)_{ℚ̄}, A)`, the colimit over compact open `K_p ⊂ G`, and likewise `H^1_c(K^p)_A` with compact supports and `H^0(K^p)_A`. The completed cohomology at tame level `K^p` is the ϖ-adic completion `Ĥ^1(K^p)_O = lim_s H^1(K^p)_O/ϖ^s`, and `Ĥ^1(K^p)_E = E ⊗_O Ĥ^1(K^p)_O`, an E-Banach space with unit ball `Ĥ^1(K^p)_O`; the same recipe gives `Ĥ^1_c(K^p)` and `Ĥ^0(K^p)`. Taking the locally convex (O-linear) inductive limit over tame levels gives `Ĥ^1_A = colim_{K^p} Ĥ^1(K^p)_A` for `A = O`, E. For a finite set `Σ_0` of primes not containing p, `Σ = Σ_0 ∪ {p}` and an open `K_{Σ_0} ⊂ G_{Σ_0} = ∏_{ℓ∈Σ_0} GL_2(ℚ_ℓ)`, put `Ĥ^1(K_{Σ_0})_A = Ĥ^1(K_{Σ_0}K_0^Σ)_A` with `K_0^Σ = ∏_{ℓ∉Σ} GL_2(ℤ_ℓ)`, and `Ĥ^1_{A,Σ} = colim_{K_{Σ_0}} Ĥ^1(K_{Σ_0})_A`. These carry commuting continuous actions of `G_ℚ`, of G, of the tame group (`GL_2(𝔸_f^p)`, resp. `G_{Σ_0}`) and of the Hecke operators `T_ℓ`, `S_ℓ` for `ℓ ∉ Σ(K^p)`. The carrier is the CompletedCohomologyPartII coefficient-limit object `H̃^1(K^p, O)` of the modular tower transported along CompletedCohomologyPartII Layer 8's modular realisation; no second completed-cohomology carrier is defined. The object of Emerton’s Conjecture 1.1.1 is the multiplicity space `Hom_{E[G_ℚ]}(V, Ĥ^1_E)` of a two-dimensional E-representation V of `G_ℚ`, with its `GL_2(𝔸_f)`-action.

`E/ℚ_p` finite, O its integers, ϖ a uniformizer, `k =` O/ϖ. Group actions follow Emerton lg §2: the G- and `GL_2(𝔸_f)`-actions are those of Carayol twisted by `g ↦ (g^{-1})^t` (lg p. 45, footnote 11); this convention is fixed for the whole roadmap. `Ĥ^1_E` is a colimit of Banach spaces with the locally convex inductive-limit topology; it is not itself ϖ-adically complete, and the tame colimit is taken after completion.

Use the following named interfaces:

- `TauCeti.ModularCompletedCohomology.atTameLevel` (constructor): `Ĥ^1(K^p)_O` as the CompletedCohomologyPartII Layer 2 coefficient limit of the modular tower at tame level `K^p`, with its Banach rationalisation `Ĥ^1(K^p)_E`.
- `TauCeti.ModularCompletedCohomology.reductionEquiv` (characterisation): For each `s ≥ 1`, `Ĥ^1(K^p)_O/ϖ^s ≅ colim_{K_p} H^1(Y(K_pK^p), O/ϖ^s)`, `G_ℚ × G ×` Hecke-equivariantly.
- `TauCeti.ModularCompletedCohomology.tameColimit` (constructor): `Ĥ^1_A = colim_{K^p} Ĥ^1(K^p)_A` with the O-linear inductive-limit topology, for `A = O`, E.
- `TauCeti.ModularCompletedCohomology.atSigma` (constructor): `Ĥ^1(K_{Σ_0})_A` and `Ĥ^1_{A,Σ} = colim_{K_{Σ_0}} Ĥ^1(K_{Σ_0})_A` with the action of `G_ℚ × G × G_{Σ_0}`.
- `TauCeti.ModularCompletedCohomology.compactSupport` (constructor): The compactly supported variant `Ĥ^1_c` and the forget-supports map `Ĥ^1_c → Ĥ^1`.
- `TauCeti.ModularCompletedCohomology.galoisAction` (instance): The continuous `G_ℚ`-action, unramified outside `Σ(K^p)` at tame level `K^p`, commuting with G and the Hecke operators.
- `TauCeti.ModularCompletedCohomology.heckeOperator` (data): `T_ℓ` and `S_ℓ` for `ℓ ∉ Σ(K^p)`, acting continuously and commuting with `G_ℚ × G`.
- `TauCeti.ModularCompletedCohomology.tameRestriction_isClosedEmbedding` (functoriality): For `K^{p′} ⊂ K^p` the pullback on `Ĥ^1(−)_E` is a closed G-equivariant embedding, compatible with the Hecke operators at primes unramified in both.
- `TauCeti.ModularCompletedCohomology.multiplicitySpace` (constructor): For a continuous representation V of `G_ℚ` on a finite-dimensional E-space, `Hom_{E[G_ℚ]}(V, Ĥ^1_E)` with its induced `GL_2(𝔸_f)`-action; algebraic multiplicities use Mathlib’s `Representation.IntertwiningMap`, and continuous multiplicities use `ContIntertwiningMap`.
- `TauCeti.ModularCompletedCohomology.multiplicityEvaluation` (constructor): The evaluation map `V ⊗ Hom_{E[G_ℚ]}(V, Ĥ^1_E) → Ĥ^1_E`, `v ⊗ f ↦ f(v)`, equivariant for the residual actions.
- `TauCeti.ModularCompletedCohomology.multiplicityEvaluation_injective` (relation): For V finite-dimensional, irreducible and with only scalar equivariant endomorphisms, the evaluation map is injective.
- `TauCeti.ModularCompletedCohomology.equivCC` (compatibility): The canonical identification with CompletedCohomologyPartII §2.1 (coefficient limit completion) for the modular tower of CompletedCohomologyPartII Layer 8.

**Checks.**

- `TauCeti.ModularCompletedCohomology.degreeZero_computation` (computation): `Ĥ^0_E` is isomorphic to the space of functions on `ℚ_{>0}∖𝔸_f^× that` are continuous in the p-adic variable and smooth away from p, with `G_ℚ` acting through class field theory and `GL_2(𝔸_f)` through det (EM-PAMQ (60)); a wrong definition that completes before taking `π_0` of the tower fails this.
- `TauCeti.ModularCompletedCohomology.invariants_compatibility` (compatibility): The `K^p`-invariants of `Ĥ^1_E` equal `Ĥ^1(K^p)_E` as G-representations, with `T_ℓ` matching the double coset of `diag(ℓ, 1)` (EM-PAMQ Lemma 7.2.8).
- `TauCeti.ModularCompletedCohomology.reduction_mod_varpi` (characterisation): `Ĥ^1(K^p)_O/ϖ` is the smooth G-representation `colim_{K_p} H^1(Y(K_pK^p), k)`; a definition that completes the rational colimit without the integral lattice fails this.
- `TauCeti.ModularCompletedCohomology.no_one_dimensional_subrep` (non-example): `Ĥ^1_E` contains no one-dimensional G-subrepresentation (EM11 Lemma 5.1.3); the space of smooth vectors `H^1(K^p)_E` alone would not be a Banach space, and completing `H^1` of a single curve gives no G-action.

EM11, Conjecture 1.1.1 and Theorem 1.2.1: The multiplicity space `Hom_{E[G_ℚ]}(V, Ĥ^1_E)` is the target of the local–global maps. EM11, §5.3, Definition 5.3.2: Localising at a residual maximal ideal gives the ρ̄-part `Ĥ^1_{O,ρ̄,Σ}`, a direct summand. NAK, §2.3: Its Pontryagin–Schikhof dual is completed Borel–Moore homology, the source of the zeta morphisms. PAN-I: Pan identifies `H̃^1(K^p, ℤ_p)` with perfectoid cohomology; locally analytic applications use this carrier with its admissible actions. GL2ModularityLifting §8.7 (through Layer 6): Odd-prime lifting through local–global compatibility uses this carrier.

A proof proceeds as follows.

1. Identify the finite-level étale cohomology groups with the CompletedCohomologyPartII Layers 0–1 modular tower through CompletedCohomologyPartII §8.4 (arithmetic tower realisation) (modular family, with ModularCurvesPartII §§14.4–14.4a supplying the finite étale/Betti comparison); the p-level colimit at fixed s is CompletedCohomologyPartII Layer 1's fixed-exponent object and the s-limit is CompletedCohomologyPartII Layer 2's coefficient-limit completion.
2. Emerton’s isomorphism (5.1.1), `H^1(K^p)_O/ϖ^s ≅ H^1(K^p)_{O/ϖ^s}`, is torsion-freeness of `H^1(K^p)_O` plus vanishing of the ϖ-torsion of the degree-two groups in the colimit (EM-PAMQ Lemma 7.2.1); it identifies `Ĥ^1(K^p)_O` with `lim_s colim_{K_p} H^1(Y(K_pK^p), O/ϖ^s)`, which is CompletedCohomologyPartII Layer 2's object (EM-PAMQ Corollary 7.2.4).
3. Transport the `G_ℚ-` and Hecke actions with CompletedCohomologyPartII §8.7 (transported arithmetic actions); the G-action is CompletedCohomologyPartII Layer 1's smooth action through conjugated levels, extended by continuity.
4. Form the tame colimit with CompletedCohomologyPartII §1.5 (tame level variation); the transition maps are closed embeddings (EM06 Proposition 2.2.13), so the O-linear inductive-limit topology of lg p. 45, footnote 10, is Hausdorff.

**Checks.**

- `Ĥ^1(K^p)_O/ϖ ≅ colim_{K_p} H^1(Y(K_pK^p), k)`, `G_ℚ ×` G-equivariantly (EM11 (5.1.2) with `s =` 1).
- For `K^{p′} ⊂ K^p` the pullback `Ĥ^1(K^p)_E → Ĥ^1(K^{p′})_E` is a closed G-equivariant embedding, and the `K^p`-invariants of `Ĥ^1_E` are `Ĥ^1(K^p)_E` (the theorem §1.2).

*Needs:* CompletedCohomologyPartII §8.4 (arithmetic tower realisation); CompletedCohomologyPartII §8.7 (transported arithmetic actions); CompletedCohomologyPartII §2.1 (coefficient limit completion); CompletedCohomologyPartII §1.5 (tame level variation); CompletedCohomologyPartII §2.10 (rational unitary banach tower); ModularCurvesPartII §14.4–14.4a (integral comparison); `mathlib:AdicCompletion`; `mathlib:Field.absoluteGaloisGroup`; `mathlib:Matrix.GeneralLinearGroup`; `mathlib:AdicCompletion.eval_surjective`; `mathlib:AdicCompletion.pow_smul_top_eq_ker_eval.`

EM11, §5.1, pp. 44–45: Defines `H^1(K^p)_A` as the p-level colimit of étale cohomology of the modular curves, `Ĥ^1(K^p)_O` as its ϖ-adic completion with the reduction isomorphisms (5.1.1)–(5.1.2), the Banach space `Ĥ^1(K^p)_E`, the tame colimit `Ĥ^1_A` with its inductive-limit topology, the fixed-away-from-Σ variants `Ĥ^1(K_{Σ_0})` and `Ĥ^1_{A,Σ}`, and the compactly supported and degree-zero analogues.

EM11, Conjecture 1.1.1 and Remark 1.1.2, p. 2: The local–global conjecture is a statement about the multiplicity space of V in `Ĥ^1_E`; Remark 1.1.2 records the case (`V|G_{ℚ_p} a` twist of an extension of the cyclotomic character by the trivial character) in which it is expected to fail as stated.

EM-PAMQ, §7.2, Lemma 7.2.1, Definition 7.2.2, Lemma 7.2.3, Corollary 7.2.4, pp. 62–63: Torsion-freeness and separatedness of `H^1_*(K^p)_O`, the Banach completion `Ĥ^1_*(K^p)_E`, and its identification with `lim_s colim_{K_p}` of the mod `ϖ^s` cohomology, for ordinary and compact supports.

NAK, §2.1.1, pp. 14–16: Nakamura recalls the same objects `Ĥ^i(K^p)`, `Ĥ^1(K_{Σ_0})` and `Ĥ^1_Σ` with the inductive-limit topology, which his zeta morphisms consume.

CE, §1.1, pp. 2–4: For a fixed tower the survey defines Ĥ as the p-adic completion of the direct limit and H̃ as `lim_s colim_r H(X_r, ℤ/p^s)`; for the modular tower in degree one these agree at each tame level by (5.1.1) of EM11.

### 1.2 Admissibility, tame-level control and the arithmetic actions


For every tame level `K^p`: (a) `Ĥ^1(K^p)_E` with the G-action is an admissible unitary E-Banach representation of `G = GL_2(ℚ_p)`, and `Ĥ^1(K^p)_O` is ϖ-adically admissible: `Ĥ^1(K^p)_O/ϖ` is an admissible smooth k-representation of G; the same holds for compact supports. (b) The natural map `Ĥ^1(K^p)_E → (Ĥ^1_E)^{K^p}` is a G-equivariant isomorphism, under which `T_ℓ` (resp. `S_ℓ`) corresponds to the double coset `K^p diag(ℓ,1) K^p` (resp. `K^p diag(ℓ,ℓ) K^p`) for `ℓ ≠ p` unramified in `K^p`. (c) For `K^{p′} ⊂ K^p` the pullback `Ĥ^1(K^p)_E → Ĥ^1(K^{p′})_E` is a closed embedding, equivariant for G and for the Hecke operators at primes unramified in both levels. (d) The `G_ℚ`-action on `Ĥ^1(K^p)_O` is continuous, unramified outside `Σ(K^p) = {p} ∪ {ℓ : K^p ramified at ℓ}`, and commutes with G and the Hecke operators; on `Ĥ^1_E` the `G_ℚ`-action commutes with `GL_2(𝔸_f)`.

Tame levels are compact open subgroups of `GL_2(𝔸_f^p)`; (b) is stated for the E-Banach spaces; the integral analogue needs neatness or the localisation of §1.4. Admissibility is in the sense of Schneider–Teitelbaum: the Schikhof dual of a G-stable unit ball is finitely generated over O[[H]] for one, hence every, compact open `H ⊂ G`.

A proof proceeds as follows.

1. Each modular curve `Y(K_f)` is homotopic to a finite one-dimensional simplicial complex; this verifies the finite-cell hypothesis of CompletedCohomologyPartII §5.4 (banach admissibility), and the local group is the compact p-adic analytic `GL_2(ℤ_p)`, so CompletedCohomologyPartII Layer 5 gives (a) (EM06 Theorem 2.2.11, EM-PAMQ Lemma 7.2.5).
2. (b) is the averaging argument over `K^{p′} ⊂ K^p` normal, made integral by the transfer of CompletedCohomologyPartII Layer 1 and passing to completions; it is EM06 Theorem 2.2.16(ii); the Hecke statement is EM-PAMQ Lemma 7.2.8 (which cites a proposition of the published version of EM06 whose number differs from that of the specified 2006 author draft).
3. (c) is EM06 Proposition 2.2.13: the pullback is split, after inverting p, by the normalised trace, so its image is closed.
4. (d) is the transport of §1.1’s `G_ℚ`-action; unramifiedness outside `Σ(K^p)` follows from good reduction of `Y(K_pK^p)` at `ℓ ∉ Σ(K^p)` for `K_p` fixed and is preserved by the colimit and completion (EM-PAMQ 7.2.9).

**Checks.**

- The proof of (a) applies CompletedCohomologyPartII Layer 5 only after the finite-cell and compact p-adic analytic hypotheses are verified for the modular tower.
- Concrete instance: for `K^p = K_1(N)^p` and a weight-two newform f of level N prime to p, the f-isotypic part of `H^1(Y_1(N), E)` embeds in `(Ĥ^1_E)^{K^p}` by (b).

*Needs:* §1.1; CompletedCohomologyPartII §5.4 (banach admissibility); CompletedCohomologyPartII §5.1 (finite generation over the iwasawa algebra and the canonical topology); CompletedCohomologyPartII §1.5 (tame level variation); CompletedCohomologyPartII §8.7 (transported arithmetic actions); ModularCurvesPartII §14.4–14.4a (integral comparison).

EM06, Theorem 2.2.11, p. 31; Proposition 2.2.13, p. 32; Theorem 2.2.16, p. 33: Admissibility of the completed cohomology of arithmetic quotients as Banach G-representations, closedness of the tame-level pullbacks, and recovery of a fixed tame level as invariants.

EM-PAMQ, Lemma 7.2.5, (55), Lemma 7.2.8 and 7.2.9, pp. 63–64: The modular-curve statements: admissible unitary Banach representation, closed tame-level embeddings, invariants and Hecke double cosets, and the `G_ℚ`-action commuting with G and Hecke.

EM11, §5.1, p. 44 (admissibility cited to [36]): Emerton records that the G-action makes `Ĥ^1(K^p)_O` ϖ-adically admissible in the sense of his Definition 3.1.1.

### 1.3 Degree zero, vanishing in degree two and compact supports


For the modular tower: (a) `Ĥ^0_E ≅ C(ℚ_{>0}∖𝔸_f^×, E)`, the space of functions continuous in the p-adic variable and locally constant away from p, with `G_ℚ` acting through `G_ℚ^{ab} ≅ ℚ_{>0}∖𝔸_f^×` (class field theory) and `GL_2(𝔸_f)` through det; at tame level `K^p`, `Ĥ^0(K^p)` restricted to a small compact open `H ⊂ Z(ℚ_p)` is a direct sum of copies of `C(ℤ_p^×, E)`. (b) `Ĥ^2_c = 0`, and `Ĥ^n = Ĥ^n_c = 0` for `n ≥ 3`; the p-adically completed `H^2` (without supports) vanishes as well, because each `Y(K_f)` is a non-compact curve. (c) The forget-supports maps `Ĥ^1_c(K^p)_O → Ĥ^1(K^p)_O` and `Ĥ^1_{c,E} → Ĥ^1_E` are surjective. (d) Cup product defines continuous pairings `Ĥ^0_E ⊗ Ĥ^1_{*,E} → Ĥ^1_{*,E}` for `* ∈ {∅, c}`, and cupping with the class of a continuous character ψ of `ℚ_{>0}∖𝔸_f^×` twists `T_ℓ` to `ψ(ℓ)T_ℓ` and `S_ℓ` to `ψ(ℓ)^2 S_ℓ`.

The degree-zero description uses the determinant `π_0(Y(K_f)) ≅ ℚ_{>0}∖𝔸_f^×/det K_f`; continuity is in the p-adic variable only. (b) and (c) are statements about the completed objects; finite-level `H^2_c` is nonzero.

A proof proceeds as follows.

1. (a): `H^0` of each `Y(K_f)` is the space of functions on `π_0(Y(K_f)) = ℚ_{>0}∖𝔸_f^×/det K_f`; the colimit over `K_p` and ϖ-adic completion give continuous functions in the p-adic direction (EM-PAMQ (60)); the restriction to a small `H ⊂ Z(ℚ_p)` follows since H acts through det on the components (EM06 proof of Proposition 4.3.1).
2. (b): for `K_p` fixed choose `K_p′ ⊂ K_p` with [`K_p ∩ SL_2(ℚ_p)` : `K_p′ ∩ SL_2(ℚ_p)`] divisible by `p^r`; the pullback on `H^2_c` multiplies by a multiple of `p^r` on each component, so `colim_{K_p} H^2_c` is p-divisible and its p-adic completion vanishes (EM06 Proposition 4.3.6). Non-compact curves have no `H^2` and no cohomology above degree 2.
3. (c): compare `H^1_c` with parabolic cohomology `H^1(X(K_f))` of the compactified curves and show that the cokernel of `H^1_c → H^1`, the boundary cohomology, becomes p-divisible in the colimit for the same index reason (EM06 Proposition 4.3.9; EM-PAMQ 7.2.10); the boundary sequence is CompletedCohomologyPartII §7.2 (boundary long exact sequences and the borel serre tower) applied to the modular tower.
4. (d): CompletedCohomologyPartII cup products on the tower, with the twisting formula of EM-PAMQ Lemma 7.3.19.

**Checks.**

- `Ĥ^2_c = 0` although `H^2_c(Y(K_f), O) ≅ O^{π_0(Y(K_f))}` is nonzero at every finite level.
- For a Galois character ψ, write `u_ℓ = ψ(Frob_ℓ)` using geometric Frobenius. Twisting a two-dimensional eigensystem gives `(a_ℓ,s_ℓ) ↦ (u_ℓa_ℓ,u_ℓ²s_ℓ)`. In particular `ψ=ε` gives `(ℓ⁻¹a_ℓ,ℓ⁻²s_ℓ)`, while `ψ=ε⁻¹` gives `(ℓa_ℓ,ℓ²s_ℓ)`. EM-PAMQ uses arithmetic `Frob_ℓ` and writes `Frob_ℓ⁻¹` in Definition 7.3.2, p. 65; its unit-idelic ψ(ℓ) in Lemma 7.3.19 must be interpreted through this reciprocity convention. The positive powers belong to the inverse cyclotomic twist in the convention here.

*Needs:* §1.1; CompletedCohomologyPartII §7.2 (boundary long exact sequences and the borel serre tower); CompletedCohomologyPartII §7.1 (derived completed support triangle); ModularCurvesPartII §14.3 (boundary exact sequence); `mathlib:ContinuousMap`; `mathlib:LocallyConstant.`

EM06, Proposition 4.3.1 and its proof, p. 52; Proposition 4.3.6, p. 53; Proposition 4.3.9, p. 54: `Ĥ^0` restricted to a small central subgroup is a sum of `C(ℤ_p^×, E)`; `Ĥ^2_c` vanishes by the p-divisibility of the colimit of `H^2_c`; `Ĥ^1_c → Ĥ^1` is surjective.

EM-PAMQ, 7.2.10 and 7.2.11, (56)–(60), pp. 64–65; Lemma 7.3.19, p. 69: Surjectivity of forgetting supports, the explicit description of `Ĥ^0_E`, the cup product with `Ĥ^0`, and the twist of Hecke operators by cupping with a character.

NAK, Proof of Lemma 2.4, p. 22: Nakamura uses the vanishing of `Ĥ^2_c` to identify completed Borel–Moore homology with the dual of `Ĥ^1_c`.

### 1.4 Non-Eisenstein localisation: boundary, injectivity and freeness


Let ρ̄: `G_ℚ → GL_2(k)` be continuous and absolutely irreducible, unramified outside `Σ = Σ_0 ∪ {p}`, and let m be a residual maximal ideal of the completed Hecke algebra of the modular tower (CompletedCohomologyPartII §8.10 (completed hecke algebra) at tame level `K_{Σ_0}K_0^Σ`) with `T_ℓ` ≡ `tr ρ̄(Frob_ℓ)`, `ℓS_ℓ` ≡ `det ρ̄(Frob_ℓ)` for `ℓ ∉ Σ`. Write `M_m` for the closed summand cut out by the residual projector of CompletedCohomologyPartII Layer 8. Then: (a) `Ĥ^1_c(K_{Σ_0})_{O,m} → Ĥ^1(K_{Σ_0})_{O,m}` is an isomorphism, and replacing the open curves by their compactifications does not change the m-parts. (b) If `K_p` is compact open and `K_f = K_pK_{Σ_0}K_0^Σ` is neat, then `H^1(K_f)_{O,m} → (Ĥ^1(K_{Σ_0})_{O,m})^{K_p}` and `H^1(K_f)_{O/ϖ^s,m} → (H^1_{O/ϖ^s,m,Σ})^{K_pK_{Σ_0}}` are isomorphisms; for non-neat `K_f` the same holds unless ρ̄ is induced from a character of `G_{ℚ(√−1)}` or `G_{ℚ(√−3)}`. (c) For `K_f` neat and each s, `H^1(K_{Σ_0})_{O/ϖ^s,m}` is an injective smooth `K_p`-representation over `O/ϖ^s`; equivalently `Hom_{K_p}(−, H^1(K_{Σ_0})_{O/ϖ^s,m})` is exact. (d) If moreover `K_p` is pro-p, there is `r ≥ 0` with `Ĥ^1(K_{Σ_0})_{O,m} ≅ C(K_p, O)^r` as ϖ-adically admissible `K_p`-representations; dually its Schikhof dual is free of rank r over `O[[K_p]]`.

ρ̄ is absolutely irreducible; this is what makes `H^0` terms vanish after localisation and makes the boundary Eisenstein-free (an absolutely irreducible ρ̄ has a non-Eisenstein eigensystem by Chebotarev and Brauer–Nesbitt, which is the eigenvalue form of non-Eisenstein used by ModularCurvesPartII §14.9). ModularCurvesPartII §14.9 (boundary non eisenstein) is stated in weight two and residue characteristic at least 3; for `p = 2` the Eisenstein property of the Hecke action on the cusp boundary (Hecke operators act on `H^0` of the cusps through `T_ℓ ↦ 1 + ℓ` up to characters) is the same computation and is the dyadic cusp-boundary supplier contract above. Neatness of `K_f` (no fixed points of `GL_2(ℚ)` on `(ℂ∖ℝ) × GL_2(𝔸_f)/K_f`) is required in (b)–(d); Carayol’s lemma replaces it in (b) for ρ̄ not induced from `ℚ(√−1)` or `ℚ(√−3)`. The localisation is CompletedCohomologyPartII Layer 8's residual summand; its identification with Emerton’s `T(K_{Σ_0})_ρ̄ ⊗ (−)` is made in §3.1 and is not used here. At `p = 2` use the dyadic cusp-boundary contract above; its characteristic-2 assertion is essential.

A proof proceeds as follows.

1. (a): the Hecke action on the boundary cohomology of the modular curves is Eisenstein (ModularCurvesPartII §14.9 (boundary non eisenstein)), so the boundary terms of the CompletedCohomologyPartII Layer 7 support triangle vanish after applying the residual projector, which commutes with the triangle by CompletedCohomologyPartII §8.14 (localisation limit support dual compatibility).
2. (b): for normal `K_p′ ⊂ K_p` and `K_{Σ_0}′ ⊂ K_{Σ_0}` the Hochschild–Serre sequence for the free action of `K_f/K_f′` on `Y(K_f′)` has its `H^1(K_f/K_f′, H^0)` term killed by localising at m, giving `H^1(K_f)_{O/ϖ^s,m} ≅ (H^1(K_f′)_{O/ϖ^s,m})^{K_f}`; pass to the limits (EM11 Lemma 5.3.8 and (5.3.9)). The non-neat case is Carayol’s lemma (EM11 Remark 5.3.10).
3. (c): for a finitely generated smooth `K_p`-module `M`, `Hom_{K_p}(M, H^1(K_{Σ_0})_{O/ϖ^s})` is identified, after localising at m, with `H^1` of the local system `M^∨` on `Y(K_f)` (EM11 (5.3.16)–(5.3.17)); a short exact sequence of such M gives a long exact sequence of cohomology whose `H^0` terms vanish at m, so the Hom functor is exact on the right (EM11 Proposition 5.3.15; the method of Remark 5.3.18).
4. (d): `(O/ϖ^s)[[K_p]]` is local for `K_p` pro-p, so an injective admissible smooth `K_p`-module is `C(K_p, O/ϖ^s)^r` with r independent of s; pass to the limit in s (EM11 Corollary 5.3.19).

**Checks.**

- For ρ̄ the reduction of the Galois representation of the weight-two newform of level 11 at `p = 3` (absolutely irreducible: its Frobenius-2 polynomial modulo 3 is `X²−X+2`, irreducible over `F₃`, while oddness rules out a conjugate-character splitting over `F₉`), (a) gives `Ĥ^1_{c,m} = Ĥ^1_m` at tame level `K_0(11)^p`.
- Non-example: for an Eisenstein maximal ideal (ρ̄ `= 1 ⊕` ε̄) the boundary contributes and (a) fails; the hypothesis cannot be dropped.

*Needs:* §1.3; §1.2; CompletedCohomologyPartII §8.10 (completed hecke algebra); CompletedCohomologyPartII §8.13 (completed residual localisation); CompletedCohomologyPartII §8.14 (localisation limit support dual compatibility); CompletedCohomologyPartII §6.1 (hochschild serre descent to finite level); ModularCurvesPartII §14.9 (boundary non eisenstein); ModularCurvesPartII §14.10 (localized freeness); `mathlib:Module.Projective`; `mathlib:IsLocalRing.`

EM11, Definition 5.3.7, Lemma 5.3.8 with (5.3.9), Remark 5.3.10, pp. 50–51: Neat levels; recovery of finite-level ρ̄-localised cohomology as `K_p-` and `K_{Σ_0}`-invariants of the completed objects; Carayol’s replacement of neatness.

EM11, Proposition 5.3.15 with (5.3.16)–(5.3.17), Remark 5.3.18, Corollary 5.3.19, pp. 52–54: Exactness of `H^1` after localising at a non-Eisenstein ideal, expressed as injectivity of the localised mod `ϖ^s` cohomology as a smooth `K_p`-representation, and the resulting isomorphism with `C(K_p, O)^r` for pro-p `K_p`.

NAK, §2.1.4, p. 19: For absolutely irreducible ρ̄ the compactly supported and ordinary completed cohomology agree after localisation `(Ĥ^1_{c,ρ̄,Σ} ≅ Ĥ^1_{ρ̄,Σ})`.

### 1.5 Completed cohomology of quaternionic Shimura curves


Let `E_0` be a totally real field in which p splits completely, 𝔭 | p a place (so `E_{0,𝔭} = ℚ_p`) and `∞_0` a real place. Let D be a quaternion algebra split at `∞_0` and at the finite places above p other than 𝔭, and ramified at the other real places and at 𝔭. Let `D_0` be the definite algebra obtained by exchanging the invariants at 𝔭 and `∞_0`. Fix tame level `U^p ⊂ (D ⊗ 𝔸_f^p)ˣ`, and put `U^p_𝔭 = ∏_{v|p,v≠𝔭} GL₂(O_{E_{0,v}})` using the chosen local splittings. Let V range over all compact open subgroups of `U^p_𝔭 × O_{D_𝔭}ˣ`, with transition maps given by level pullback. Define `Ĥ¹(U^p,O/ϖⁿ) = colim_V H¹_ét(Sh_{VU^p,Ē_0},O/ϖⁿ)`. This all-p-level colimit carries the full action of `(D ⊗ ℚ_p)ˣ` by tower correspondences, including both `D_𝔭ˣ` and the other p-adic factors, as well as the commuting Galois, Hecke and adelic-centre actions (CDN §4.1.4, pp. 50–51, footnote 28).

For a continuous central character ψ of `𝔸_{E_0,f}ˣ/E_0ˣ` and a continuous representation λ of `U^p_𝔭` on a finite free O-module, with compatible central character, first form `Ĥ¹_ψ`, then `Ĥ¹_{ψ,λ}(U^p,O/ϖⁿ) = Hom_{O[U^p_𝔭]}(λ/ϖⁿ,Ĥ¹_ψ(U^p,O/ϖⁿ))`. After localisation at a residual maximal ideal m of `T_S^{univ}=O[T_v,S_v]_{v∉S}`, define `Ĥ¹_{ψ,λ,m} = colim_n Ĥ¹_{ψ,λ}(U^p,O/ϖⁿ)_m` and `Ĥ¹_{ψ,λ}(U^p,O)_m = lim_n Ĥ¹_{ψ,λ}(U^p,O/ϖⁿ)_m`, with the p-adic topology on the latter. The λ-typical objects retain commuting `G_{E_0,S}`, `T_S^{univ}` and `D_𝔭ˣ` actions. Use the CompletedCohomologyPartII Layer 8 quaternionic adapter with every p-level varying before taking the λ-typical part.

The distinguished action is by the division group `D_𝔭ˣ`; it does not give a `GL₂(ℚ_p)`-action on this Shimura-curve object. The CDN special case has `D_0` unramified at every finite place and `[E_0:ℚ]` even. Over ℚ such a tower is possible when `D_0` has suitable finite ramification. The torsion coefficient colimit uses `O/ϖⁿ → O/ϖⁿ⁺¹`, `a ↦ ϖa`.

Use the following named interfaces:

- `TauCeti.ShimuraCurveCompleted.torsion` (constructor): `Ĥ¹(U^p,O/ϖⁿ) = colim_V H¹_ét(Sh_{VU^p,Ē_0},O/ϖⁿ)`, with V varying at every place above p and with its commuting Galois, Hecke, full `(D ⊗ ℚ_p)ˣ` and adelic-centre actions.
- `TauCeti.ShimuraCurveCompleted.isotypic` (constructor): The ψ-isotypic and λ-typical parts `Ĥ¹_{ψ,λ}(U^p,O/ϖⁿ) = Hom_{O[U^p_𝔭]}(λ/ϖⁿ,Ĥ¹_ψ(U^p,O/ϖⁿ))`, formed after the all-p-level colimit.
- `TauCeti.ShimuraCurveCompleted.localized` (constructor): `Ĥ^1_{ψ,λ,m} = colim_n Ĥ^1_{ψ,λ}(U^p, O/ϖ^n)_m` and its integral version `lim_n`.
- `TauCeti.ShimuraCurveCompleted.dualEquiv` (equivalence): `(Ĥ^1_{ψ,λ,m})^∨ ≅ Hom^cont_O(Ĥ^1_{ψ,λ}(U^p, O)_m, O)` as compact `T_S^{univ}[G_{ℚ_p} × D_𝔭^×]`-modules.
- `TauCeti.ShimuraCurveCompleted.invariants` (characterisation): For sufficiently small `VU^p`, apply the CompletedCohomologyPartII Layer 6 Hochschild–Serre spectral sequence. If `H^0` of the torsion tower localised at m is zero, the edge map `H^1_ét(Sh_{VU^p,Ē_0},O/ϖ^n)_m → (Ĥ^1(U^p,O/ϖ^n)_m)^V` is an isomorphism. Without that vanishing, its kernel and cokernel are controlled by `H^1_cts(V,Ĥ^0_m)` and `H^2_cts(V,Ĥ^0_m)`.
- `TauCeti.ShimuraCurveCompleted.equivCC` (compatibility): Identification with the CompletedCohomologyPartII Layer 2 completed cohomology of the quaternionic Shimura-curve tower of CompletedCohomologyPartII Layer 8.

**Checks.**

- `TauCeti.ShimuraCurveCompleted.invariants_finite_level` (compatibility): Under the stated `H^0_m = 0` hypothesis, the Hochschild–Serre edge map is an isomorphism. A definition asserting finite-level descent from smallness alone fails to account for `H^1_cts(V,Ĥ^0)` and `H^2_cts(V,Ĥ^0)`.
- At two distinct places above p, a nontrivial λ-type of `U^p_𝔭` is detected on the all-p-level carrier. Freezing that level with constant coefficients supplies only its invariants, not an action recovering general λ-types.
- `TauCeti.ShimuraCurveCompleted.trivial_lambda` (degenerate): For λ the trivial one-dimensional representation, `Ĥ^1_{ψ,λ}` is the space of vectors of `Ĥ^1_ψ` invariant under the level at the places above p other than 𝔭.
- `TauCeti.ShimuraCurveCompleted.not_GL2_admissible` (non-example): `Ĥ^1_{ψ,λ,m}` is `a D_𝔭^×`-module, not `a GL_2(ℚ_p)`-module: a definition that takes the colimit over `GL_2(ℚ_p)-levels` would describe the modular-curve object of §1.1 instead.

CDN, Proposition 4.11: Its m-part is identified with Scholze’s functor applied to the definite quaternionic module `S_{ψ,λ,m}`. CDN, Proposition 4.12: It factors as `ρ_m ⊗ N` with `ρ_m` the Hecke-valued Galois representation. §4.12: The comparison theorem is stated on this carrier.

A proof proceeds as follows.

1. Take the canonical-model tower and finite étale–Betti comparison from CompletedCohomologyPartII §8.3 (hilbert finite local system input) and §8.4 (arithmetic tower realisation) (Hilbert/quaternionic family, quaternion algebras split at exactly one real place).
2. Retain the central-quotient comparison of CompletedCohomologyPartII §8.1 (arithmetic shimura central quotient) when passing from the arithmetic quotient to `Sh_{VU^p}`.
3. At each finite n take the colimit over all p-levels, then the ψ-isotypic and `U^p_𝔭`-equivariant λ-typical parts; localisation at m uses the finite-level Hecke images (HilbertModularVarietiesAndShimuraCurves R18.4 (finite cohomology)) and CompletedCohomologyPartII Layer 8's residual projectors, which commute with `colim_n` and `lim_n` by §8.14 (localisation limit support dual compatibility).
4. The Pontryagin dual `(Ĥ^1_{ψ,λ,m})^∨` is identified with the Schikhof dual of `Ĥ^1_{ψ,λ}(U^p, O)_m` (CDN after Proposition 4.11).
5. Finite-level descent takes V-invariants on the all-p-level carrier before the λ-typical operation, and uses CompletedCohomologyPartII Layer 6 with `H^0_m = 0`, using the Shimura `H⁰` supplier contract above. No unconditional invariants identity is used.

**Checks.**

- If `D_0` is unramified at every finite place, its definiteness forces `[E_0:ℚ]` even. If `D_0` is allowed finite ramification, this argument does not exclude `E_0 = ℚ`.
- The torsion object is smooth for `D_𝔭^×`. At an open V, its V-invariants identify with finite-level `H^1` after localisation only when the `H^0` terms in Hochschild–Serre vanish; smallness alone does not imply this.

*Needs:* CompletedCohomologyPartII §8.3 (hilbert finite local system input); CompletedCohomologyPartII §8.4 (arithmetic tower realisation); CompletedCohomologyPartII §8.1 (arithmetic shimura central quotient); CompletedCohomologyPartII §8.14 (localisation limit support dual compatibility); CompletedCohomologyPartII §3.1 (continuous dual conventions); HilbertModularVarietiesAndShimuraCurves R18.4 (finite cohomology); HilbertModularVarietiesAndShimuraCurves §R18.4.8 (residualEisensteinVanishing); shimuraH0_nonEisenstein (coefficient extension contract); CompletedCohomologyPartII §6.1 (hochschild serre descent to finite level).

CDN, §4.1.2, pp. 47–48; §4.1.4, pp. 50–51: The quaternionic data `D_0` (definite, split at all finite places) and D (invariants exchanged at 𝔭 and `∞_0`), the Shimura curves `Sh_{VU^p}`, and the completed cohomology `Ĥ^1_{ψ,λ,m}` with its integral version and duality.

CDN, Proposition 4.5, p. 47: The globalisation setting: `E_0` totally real of even degree in which p splits completely, with a cuspidal automorphic π whose residual representation restricts to a given r̄ at every place above p.

### 1.6 Completed module of a definite quaternion algebra


Let F be a totally real field in which p splits completely and D a quaternion algebra over F ramified at every infinite place and unramified at every place above p, with fixed isomorphisms `D ⊗_F F_v ≅ M_2(F_v)` at the places where D is unramified; put `K_p = ∏_{v|p} GL_2(O_{F_v}) ⊂ D_p^× = ∏_{v|p} GL_2(F_v)`. For a tame level `U^p ⊂` (D `⊗_F 𝔸_F^{∞,p})^× let X_raw(U^p) = D^×∖(D ⊗_F 𝔸_F^∞)^×/U^p` with its quotient topology, `X(U^pU_p) = D^×∖(D ⊗_F 𝔸_F^∞)^×/U^pU_p` (a finite set), and `X̂(U^p) = lim_{U_p} X(U^pU_p)`, a profinite space. For general F no Hausdorff or manifold assertion is made about `X_raw(U^p)`: global units can accumulate in the finite adeles. In the continuous-function notation below `X(U^p)` means the actual adelic quotient `X_raw(U^p)`; the completed degree-zero carrier is defined by its torsion finite-level colimit and coefficient limit. For `F = ℚ`, DLB Lemme 4.4 identifies `X_raw(U^p)` with `X̂(U^p)`. For a topological O-module M the space `C(X(U^p), M)` of continuous functions carries the right-translation action of `D_p^×` and of the centre `(𝔸_F^∞)^×`; for a continuous character ψ: `(𝔸_F^∞)^×/F^×_{≫0} → O^× trivial` on `U^p ∩ (𝔸_F^∞)^×`, `S_ψ(U^p, M) ⊂ C(X(U^p), M)` is the submodule of ψ-equivariant functions `f(gz) =` ψ(z)`f(g)`. For integral duality and faithful integral Hecke action require ψ trivial on `F^×` and the finite-level character/stabilizer hypotheses ensuring that `S_ψ(U^p,E/O)` is O-divisible: sufficiently small effective levels, ψ-compatible central intersections, and surjective coefficient maps on the resulting finite stabilizer invariants (Pan Corollary 3.1.3 and Remark 3.2.3). For arbitrary ψ retain the torsion definition; incompatibility can leave nonzero bounded torsion even when all integral functions vanish. For Hausdorff M with continuous scalar action the equivariant submodule is closed, by the evaluation equalizers; arbitrary topological M gives only a submodule. Put `S_ψ(U^p, A) = colim_{U_p} S_ψ(U^pU_p, A)` for a discrete torsion O-module A (locally constant functions), the completed cohomology `S_ψ(U^p) = Hom_O(E/O, S_ψ(U^p, E/O)) ≅ lim_n S_ψ(U^p, O/ϖ^n)` with the p-adic topology, `S_ψ(U^p)_E = E ⊗_O S_ψ(U^p)`, and the completed homology `M_ψ(U^p) = S_ψ(U^p, E/O)^∨` (Pontryagin dual, compact-open topology); then `S_ψ(U^p) ≅ Hom^cont_O(M_ψ(U^p), O)`. For `F = ℚ` and no central character fixed, `C^0(X) = C(X(K^p), L)` is Dospinescu–Le Bras’s space of p-adic automorphic forms on `B̄^*`.

D is definite (ramified at all infinite places) and split at every place above p; p splits completely in F so that each `F_v = ℚ_p`. The quaternionic tower is degree-zero: its cohomology is functions on finite sets; nonzero higher stabiliser cohomology at non-neat levels is not claimed to vanish. Pan’s §3.7 variant with a smooth character ξ of `U^p` (functions with `f(guz) = ψ(z)ξ(u^p)f(g)`) is the same construction applied to the kernel of ξ, followed by the ξ-isotypic part.

Use the following named interfaces:

- `TauCeti.DefiniteQuaternionCompleted.space` (constructor): The raw adelic quotient `X_raw(U^p)` with its quotient topology and right `D_p^×`-action, its finite level quotients `X(U^pU_p)`, and the separate profinite inverse limit `X̂(U^p)`. For `F = ℚ` the raw quotient equals this inverse limit (DLB Lemme 4.4).
- `TauCeti.DefiniteQuaternionCompleted.functions` (constructor): `C(X(U^p), M)` with the right-translation action of `D_p^× × (𝔸_F^∞)^×`, for a topological O-module M.
- `TauCeti.DefiniteQuaternionCompleted.withCentralCharacter` (constructor): `S_ψ(U^p, M) ⊂ C(X(U^p), M)`, the submodule of ψ-equivariant functions, closed for Hausdorff M with continuous scalar action.
- `TauCeti.DefiniteQuaternionCompleted.completedCohomology` (constructor): `S_ψ(U^p) = lim_n S_ψ(U^p, O/ϖ^n)` with the p-adic topology, and `S_ψ(U^p)_E = E ⊗ S_ψ(U^p)`.
- `TauCeti.DefiniteQuaternionCompleted.completedHomology` (constructor): `M_ψ(U^p) = S_ψ(U^p, E/O)^∨` as a compact `O[[K_p]]`-module with central character `ψ^{-1}`.
- `TauCeti.DefiniteQuaternionCompleted.invariants` (characterisation): `S_ψ(U^p, A)^{U_p} = S_ψ(U^pU_p, A)` for `U_p ⊂ K_p` open.
- `TauCeti.DefiniteQuaternionCompleted.schikhofDual` (equivalence): `S_ψ(U^p) ≅ Hom^cont_O(M_ψ(U^p), O)` and, under the stated divisibility hypotheses, `M_ψ(U^p) ≅ Hom_O^cont(S_ψ(U^p), O)` (continuous O-dual).
- `TauCeti.DefiniteQuaternionCompleted.twist` (relation): For a continuous character θ of `(𝔸_F^∞)^×/N(U^p)F^×_{≫0}`, `f ↦ (θ∘N_{D/F})·f` is an isomorphism `S_ψ(U^p) ≅ S_{ψθ^2}(U^p)` intertwining `T_v` with `θ(Frob_v)T_v`.
- `TauCeti.DefiniteQuaternionCompleted.equivCC` (compatibility): Identification with the CompletedCohomologyPartII Layer 2 completed degree-zero object of the finite double-coset tower.

**Checks.**

- For F=ℚ, p=2 and the finite odd mod-4 idele character ψ, rational −1 forces O-valued forms to vanish, while constant E/O-valued elements killed by 2 survive. Thus M_ψ is nonzero and torsion, and the converse integral duality requires the divisibility hypotheses.
- For M=𝔽₃ with indiscrete topology and an odd quadratic character, the equivariant submodule is {0} inside a nonzero indiscrete function space and is not closed. The Hausdorff hypothesis is essential.

- `TauCeti.DefiniteQuaternionCompleted.finiteLevel_computation` (computation): If ψ is trivial on `F^×`, `U^pU_p` is sufficiently small and ψ is trivial on `U^pU_p ∩ (𝔸_F^∞)^×`, then `S_ψ(U^pU_p, A) ≅ ⊕_{i∈I} A` over the finite set `I = D^×∖(D ⊗ 𝔸_F^∞)^×/U^pU_p(𝔸_F^∞)^×` (Pan (3), p. 17, whose quotient by `F^×` uses this triviality); for a coarse level the summand at `t_i` is the invariants of the finite stabiliser. Without `ψ|_{F^×}=1` the summand at `t_i` is the submodule of A on which every `z ∈ F^×` acts trivially through ψ; for the odd mod-4 character over `ℚ` it is `A[2]`, zero for `A = ℤ₂`.
- `TauCeti.DefiniteQuaternionCompleted.trivial_coefficients_degenerate` (degenerate): For `M = 0` the space `C(X(U^p), M)` is zero; for `M = O` and ψ trivial the constant functions are `D_p^×-invariant`, and for a continuous character χ of the norm group the functions `χ∘N_{D/F}` span a line on which `D_p^× acts` through `χ∘N_{D/F}`; on the empty set (no double cosets) every function space is zero.
- `TauCeti.DefiniteQuaternionCompleted.invariants_compatibility` (compatibility): The `U_p`-invariants of `S_ψ(U^p, O/ϖ^n)` are the finite-level quaternionic forms `S_ψ(U^pU_p, O/ϖ^n)` of HilbertModularVarietiesAndShimuraCurves R18.3.
- `TauCeti.DefiniteQuaternionCompleted.not_locally_constant` (non-example): For trivial (more generally smooth compatible) ψ, continuous O-valued functions are the completion of locally constant ψ-functions; for an infinite-image restriction of ψ to every open subgroup of the p-adic centre, all smooth ψ-vectors vanish. Thus the integral object must be defined by `lim_n` of torsion-level functions, rather than by asserting density of integral smooth ψ-functions for every continuous ψ.

PAN, Definition 3.5.2 and Theorem 3.5.5: `M_ψ(U^p)_m` is the global object whose block component is compared with Paškūnas’s projective envelope. DLB, Théorème 5.4 and §13: `C^0(X)[𝔭] ≅ Π(𝔭)^{⊕r}` is the zero-dimensional local–global compatibility. TUNG-2, §4.6: `M_ψ(U^p)_m` is patched into `M̃_∞`. CDN, Proposition 4.11: Scholze’s functor is applied to `S_{ψ,λ,m}`. GL2ModularityLifting §§9.1–9.3 and 10.1–10.6 (through Layers 4–5): Tung’s dyadic and Pan’s residually reducible arguments work on this module.

A proof proceeds as follows.

1. The finite double coset sets `X(U^pU_p)` and their stabilisers are HilbertModularVarietiesAndShimuraCurves R18.3 (definite class set); `X̂(U^p) = lim_{U_p} X(U^pU_p)` is profinite. For general F this does not prove that the raw quotient is Hausdorff; the finite-level construction avoids that assertion.
2. `S_ψ(U^p, A)` for discrete torsion A is the CompletedCohomologyPartII Layer 1 fixed-exponent colimit of the degree-zero tower; `S_ψ(U^p)` is its CompletedCohomologyPartII Layer 2 coefficient limit; these are the CompletedCohomologyPartII carriers of the finite discrete arithmetic tower, as for the definite unitary groups in §8.5 (definite unitary degree zero).
3. The identifications `S_ψ(U^p) ≅ lim_n S_ψ(U^p, O/ϖ^n) ≅ Hom^cont(M_ψ(U^p), O)` hold by Pontryagin duality; the converse `M_ψ(U^p) ≅ Hom_O^cont(S_ψ(U^p), O)` additionally uses O-divisibility of the torsion forms, equivalently O-torsion-freeness of their compact dual, and Schikhof duality (CompletedCohomologyPartII §3.1 (continuous dual conventions), Pan Remark 3.2.3). HilbertModularVarietiesAndShimuraCurves R18.3 (definite class set) states the finite class set in Khare–Wintenberger’s setting (F of even degree, D split at the finite places considered, quotient by the centre); the same finiteness for Pan’s D (any definite D split above p, no central quotient) is the compactness of `D^×∖(D ⊗ 𝔸_F^∞)^× modulo` the centre for an anisotropic group, with the centre handled by the finiteness of `F^×∖(𝔸_F^∞)^×/(U ∩ (𝔸_F^∞)^×)` times its connected component.
4. For Hausdorff coefficients with continuous scalar action, the ψ-isotypic part is closed as an intersection of closed evaluation equalizers; twisting by `θ∘N_{D/F}` gives `S_ψ(U^p) ≅ S_{ψθ^2}(U^p)` (Pan 3.2.7).

**Checks.**

- For `D = B̄` over `ℚ` and `K^p = ∏_{ℓ≠p} K_ℓ` with one `K_{ℓ_0}` torsion-free, the right G-action on X has finitely many `GL_2(ℤ_p)`-orbits (§1.7).
- The `U_p`-invariants of `S_ψ(U^p, A)` are `S_ψ(U^pU_p, A)` (Pan Remark 3.2.3).

*Needs:* HilbertModularVarietiesAndShimuraCurves R18.3 (definite class set); CompletedCohomologyPartII §1.1 (fixed exponent smooth colimit); CompletedCohomologyPartII §2.1 (coefficient limit completion); CompletedCohomologyPartII §3.1 (continuous dual conventions); `mathlib:ContinuousMap`; `mathlib:LocallyConstant`; `mathlib:QuaternionAlgebra`; `mathlib:IsDedekindDomain.FiniteAdeleRing.`

PAN, §3 (setting), p. 17; §3.1.1, pp. 17–18; Definition 3.2.2, Remark 3.2.3, 3.2.7, pp. 19–20: The definite quaternion algebra over a totally real field in which p splits completely, the spaces `S_{τ,ψ}(U, A)` of continuous functions with central character, the completed cohomology `S_ψ(U^p)` and completed homology `M_ψ(U^p)` with their dualities, and twisting by characters of the reduced norm.

PAN, §3.7.1–3.7.2, p. 37: The variant `S_{ψ,ξ}` with a smooth character ξ of the tame level, deduced from the untwisted case through the kernel of ξ.

DLB, §4.1, Définition 4.3, p. 20: For B̄ over `ℚ` split at p and ramified at ∞: `X = B̄^*(ℚ)∖B̄^*(𝔸_f)/K^p` is the projective limit of the finite sets `X(K_p)`, with a right action of `G = GL_2(ℚ_p)`, and `C^0(X)` is the space of p-adic automorphic forms.

TUNG-2, §4.1, Lemma 4.1.1, p. 18: Tung uses the same `S_ψ(U^p, E/O)` and `M_ψ(U^p)` for a definite quaternion algebra over a totally real field in which 2 splits completely.

The discrete two-point permutation action has continuous translations. Translation on continuous functions is defined for any commutative ring O, topological O-module M with continuous scalar multiplications, space X and group D with continuous translations on X. It sends f to `x ↦ f(g⁻¹x)` as an O-linear map; prove the identity, multiplication and evaluation-at-`gx` formulas. For a homomorphism `ι:Z→D` and `ψ:Z→Oˣ`, the central-character submodule is defined by `f(ι(z)x)=ψ(z)f(x)`. It needs no commutation assumption merely to define that submodule; preservation by D-translation additionally requires the image of ι to be central. Prove the membership criterion, linear closure and, with this centrality hypothesis, translation stability. Without any centrality hypothesis, translation by `ι(z)` acts on the submodule by the scalar `ψ(z)⁻¹`. For Hausdorff M the submodule is closed, as an intersection of evaluation equalizers.

**Checks.**

- For `X=D` with left multiplication, `(translate g f)(gx)=f(x)`; using `f(gx)` instead reverses multiplication when g and h do not commute.
- For a two-point regular action of a cyclic group of order two, translation of the indicator of one point is the indicator of the other; a constant translation operator fails this test.
- If `z∈F^×` is a rational central scalar, left `D^×-invariance` gives `f(gz)=f(g)`. Thus `ψ(z)≠1` forces all E-valued forms to vanish. Nonzero finite-level rank formulas require this rational-centre compatibility as well as the stated compatibility on `U∩centre`.
- For `ψ=1`, the central-character submodule is precisely the centre-invariant functions. For a point fixed by z with `ψ(z)−1` invertible in E, the value is zero; the nonzero constant function is excluded. Under inverse translation, such functions have central eigenvalue `ψ⁻¹`.

### 1.7 Structure of the definite quaternionic tower


In the setting of §1.6: (a) the finite-level double-coset set `X(U^pU_p)` is finite for each compact open `U_p`. For `F = ℚ`, writing the finitely many `D^×`-orbits away from p with stabilisers `Γ_i ⊂ GL_2(ℚ_p)`, these `Γ_i` are discrete cocompact and `X_raw(U^p) ≅ ⊔_i Γ_i∖GL_2(ℚ_p)` is a compact p-adic analytic manifold with locally analytic action (DLB Lemme 4.4). This raw-quotient manifold statement is restricted to `F = ℚ`. (b) For `F = ℚ` and a tame component `K_{ℓ_0}` torsion-free, `GL_2(ℤ_p)` acts freely with finitely many orbits; hence `C(X,M) ≅ C(GL_2(ℤ_p),M)^{⊕s}`. (c) For general F, under Pan’s central-character compatibility, with `U^pK_p` sufficiently small in the sense of (3.1.2) and ψ trivial on `N_{D/F}(U^p)`, `S_ψ(U^p,E/O)` is injective among smooth `K_p`-representations with the prescribed central character; its Pontryagin dual is finitely generated over `O[[K_p]]` and projective in the corresponding compact category. `S_ψ(U^p)_E` is a topological direct summand of `C_ψ(K_p,E)^{⊕d}`. (d) The torsion module is admissible for `D_p^×`; its localised summands remain admissible and injective on `K_p` under the same smallness hypotheses.

For the Pan branch assume p odd; the dyadic projectivity branch uses Tung-2 Corollary 4.2.2 with its separate hypotheses. The general-F finite class set is required in the form used by Pan §3.1, not just the narrower even-degree supplier. The central-quotient adapter of CompletedCohomologyPartII Layer 8 retains the closure of rational units. Neither discreteness of `D^× in` finite adeles nor a free `K_p`-action is inferred over a general totally real field. (b) needs a torsion-free tame component. (c) needs all groups `(t_i^{-1}D^×t_i ∩ U(𝔸_F^∞)^×)/F^× trivial`, the central-character compatibility of Pan §3.1, and `ψ|N_{D/F}(U^p)=1` as required by Proposition 3.2.4. Shrink `U^p` to meet both the smallness and norm-character conditions. The localisation assertion retains these conditions. Finiteness of `X(U^p)/K_p` uses strong approximation for the reduced-norm-one group and finiteness of the class set; no claim is made for an indefinite quaternion algebra.

A proof proceeds as follows.

1. (a): use the definite finite class set for the finite-level assertion. Over `ℚ`, DLB Lemme 4.4 proves the discrete-cocompact stabiliser description. Over general F, use Pan 3.1.2–3.1.3 for the quotient by the centre; global units prevent the `ℚ` argument from establishing discreteness of the raw stabilisers.
2. (b): a nontrivial stabiliser of a point of X in `GL_2(ℤ_p)` would be a finite-order element of `D^× lying` in a conjugate of `K_{ℓ_0}`, which is torsion-free; finitely many orbits by (a); choose a section on each orbit (DLB Lemma 13.1).
3. (c): assume `U^pK_p` sufficiently small and `ψ|N_{D/F}(U^p)=1`. For a finite torsion smooth `K_p`-module `M`, `S_{M,ψ}(U^pK_p, O) ≅ Hom_{O[K_p]}(M^∨, S_ψ(U^p, E/O))` (Pan Lemma 3.2.5); the left side is exact in M at sufficiently small level by Pan Corollary 3.1.3, giving injectivity on finite modules, and Mittag-Leffler gives it in general (Pan Proposition 3.2.4); dualise and use admissibility for finite generation and the direct-summand statement (Pan Corollary 3.2.6; Tung-2 Corollary 4.2.2).
4. (d): (`S_ψ(U^p`, `E/O))^{U_p} = S_ψ(U^pU_p, E/O`) is cofinitely generated, giving admissibility; localisation is a direct summand, and injectivity passes to summands (CDN Proposition 4.7(a), citing Paškūnas).

**Checks.**

- For a compact free action with finitely many orbits, the regular-orbit comparison is a continuous O-linear equivalence intertwining inverse translation on every summand; an arbitrary linear change of basis on a two-point orbit need not intertwine.
- For empty X the regular-orbit comparison has zero summands.

- For `F = ℚ`, B̄ of discriminant 2 and `p = 3`, (b) holds with `K^p` maximal away from 2 and principal-congruence and torsion-free at an auxiliary prime `ℓ_0 ≥ 5`.
- Non-example: without a torsion-free component the `GL_2(ℤ_p)`-action on X can have nontrivial finite stabilisers, and C(X, M) is then only a sum of induced modules from those stabilisers.

*Needs:* §1.6; HilbertModularVarietiesAndShimuraCurves R18.3 (definite class set); HilbertModularVarietiesAndShimuraCurves R18.3 (neatness base change); CompletedCohomologyPartII §5.3 (smooth dual admissibility); `mathlib:Module.Projective`; `mathlib:CompactSpace`; CompletedCohomologyPartII §8.1 (arithmetic shimura central quotient).

DLB, Lemme 4.4, p. 21; Lemme 13.1, p. 69: X is a finite disjoint union of `Γ_i∖G` with `Γ_i` discrete cocompact, a compact p-adic analytic manifold; `GL_2(ℤ_p)` acts freely with finitely many orbits, so `C^0(X, M) ≅ C^0(GL_2(ℤ_p), M)^{⊕s}`.

PAN, Corollary 3.1.3, p. 18; Proposition 3.2.4, Lemma 3.2.5, p. 19; Corollary 3.2.6, p. 20: Exactness of quaternionic forms at sufficiently small level, injectivity of `S_ψ(U^p, E/O)` among smooth `K_p`-modules with central character, projectivity and finite generation of `M_ψ(U^p)`, and the direct-summand embedding of `S_ψ(U^p)_E` into `C_ψ(K_p, E)^{⊕d}`.

TUNG-2, Lemma 4.1.1, p. 18; Corollary 4.2.2, p. 19: Local admissibility of `S_ψ(U^p, E/O)` and projectivity of `M_ψ(U^p)` in the category of pseudo-compact modules, for the 2-adic setting.

CDN, Proposition 4.7, p. 49: `S_ψ(U^p, L/O)_m` is nonzero, admissible and injective in the smooth `K_p`-representations with central character `ψ_p`.

### Examples

For a neat modular tower and an irreducible residual ideal, the boundary term vanishes and mod-ϖ `K_p`-invariants recover the finite-level localised cohomology. Without localisation, the degree-zero determinant representation and Eisenstein cusp terms remain; the vanishing statement cannot be extended to the entire tower. On the definite `ℚ` quaternionic tower with a torsion-free tame component, each compact-group orbit is a copy of `K_p`, so its continuous functions give one regular representation. The empty orbit set gives zero summands.

### Dependencies

CompletedCohomologyPartII Layers 0–8 and ArithmeticLocallySymmetricSpaces ALS.6 supply the towers, limits, duality and descent. ModularCurvesPartII §§14.1–14.11 supplies coefficient systems, boundary and integral comparisons; §1.4 includes the dyadic boundary extension specified in the contracts. The finite-level HilbertModularVarietiesAndShimuraCurves R18.3–R18.4 interfaces are extended to the general definite class-set adapter and Shimura `H⁰` vanishing in §§1.5–1.7. Use Mathlib’s continuous maps, absolute Galois groups and quaternion algebras.

## Layer 2: classical specialisations and locally algebraic vectors


Classical cohomology with algebraic coefficients is recovered from completed cohomology in degree one, and only there: the Hochschild–Serre spectral sequence of CompletedCohomologyPartII Layer 6, fed with Emerton's computation of the Lie-algebra Ext groups of the explicit `Ĥ⁰` and the vanishing of `Ĥ²`, identifies `H¹` with coefficients in `V_W` with the W̌-equivariant locally analytic vectors, and summing over W gives Emerton's description of the locally algebraic vectors. Density of algebraic vectors (Mahler) then shows that classical eigensystems are dense. The newform comparison fixes the Hecke normalisation against Mathlib's cusp forms through ModularCurvesPartII's weight-two Shimura isomorphism, and the required example — the newform of level 11 — is given below. Nakamura's Lemmas 2.9–2.11 give the dual statement for completed Borel–Moore homology, which Nakamura’s zeta morphisms consume. For the definite quaternion algebra the comparison is elementary (functions on finite sets), and the type-specialised modules `σ° ⊗ M_ψ(U^p)` are the finite-level modules of Tung's Lemma 5.3.2.
The global Serre-weight set and good-weight predicate are defined separately from the local predicted weights. The weight upper bound, good-weight derivative and away-from-p genericity theorem retain their small-weight, multiplicity-one and Ihara supplier inputs.

### 2.1 Locally algebraic vectors of completed cohomology


For `* ∈ {∅, c}` there is a natural `G_ℚ × GL_2(𝔸_f)`-equivariant isomorphism `⊕_{k≥2, n∈ℤ} H^1_*(V_k)_E ⊗_E (Sym^{k−2}E^2)^∨ ⊗_E E(n) ≅ (Ĥ^1_{*,E})_{l.alg}`, where `(Ĥ^1_{*,E})_{l.alg}` is the subspace of locally `GL_2(ℚ_p)-algebraic` vectors, `H^1_*(V_k)_E = colim_{K_f} H^1_*(Y(K_f), V_k)` is the cohomology of the tower with coefficients in the local system `V_k` attached to `Sym^{k−2}` of the standard representation, E(1) is the line on which `G_ℚ × GL_2(𝔸_f)` acts by `ε ⊗` (ε∘det), and `GL_2(𝔸_f)` acts on `(Sym^{k−2}E^2)^∨` through `GL_2(ℚ_p)`. Its isotypic pieces come from the following degree statements, for an irreducible algebraic representation W of `GL_2(ℚ_p)` with dual W̌: (i) `Ext^i_{gl_2}(W̌`, `Ĥ^0_{la}`) vanishes except for `i ∈` {0, 3}, and both survivors vanish unless W is one-dimensional; (ii) `H^0(V_W) ≅ Hom_{gl_2}(W̌, Ĥ^0_{la})` and `H^1(V_W) ≅ Hom_{gl_2}(W̌, Ĥ^1_{la})`, and `Ext^1_{gl_2}(W̌`, `Ĥ^1_{la}) ≅ Ext^3_{gl_2}(W̌`, `Ĥ^0_{la}`); (iii) for compact supports `H^1_c(V_W) ≅ Hom_{gl_2}(W̌, Ĥ^1_{c,la})` and `H^2_c(V_W) ≅ Ext^1_{gl_2}(W̌`, `Ĥ^1_{c,la}`). Consequently, for a cuspidal newform f of weight k defined over E, `V_f ⊗_E π(V_f) ⊗_E (Sym^{k−2}E^2)^∨` embeds `G_ℚ × GL_2(𝔸_f)-equivariantly` into `Ĥ^1_{*,E}`.

The comparison holds only in cohomological degree one; it uses the explicit `Ĥ^0`, the vanishing `Ĥ^n = 0` for `n ≥ 2` and `Ĥ^2_c = 0` (§1.3). A formal interchange of invariants and inverse limits is not used. Locally algebraic means: the orbit map of the vector is locally a polynomial in the matrix entries and `det^{−1}` on a compact open subgroup of `GL_2(ℚ_p)`; this is stronger than locally analytic. `(Sym^{k−2}E^2 ⊗ det^n)_{k≥2,n∈ℤ}` is a complete set of irreducible algebraic representations of `GL_2` over E.

A proof proceeds as follows.

1. CompletedCohomologyPartII §6.1 (hochschild serre descent to finite level) gives the continuous Hochschild–Serre spectral sequence `H^i_cts(U, Ĥ^j ⊗ W)` ⇒ `H^{i+j}(Y_U, V_W)`; passing to locally analytic vectors and Lie-algebra cohomology turns it into `Ext^i_{gl_2}(W̌`, `Ĥ^j_{la}`) ⇒ `H^{i+j}(V_W)` (EM06 Corollary 2.2.18). §6.7 (analytic classical comparison) warns that the underived locally analytic vectors need justification: here the `Ĥ^j` are admissible Banach representations, on which the functor of locally analytic vectors is exact and has no higher derived functors (Schneider–Teitelbaum; Emerton’s locally analytic vectors memoir), so the underived and derived forms agree in this case.
2. Proposition 4.3.1 of EM06: `Ĥ^0` restricted to `Z(ℚ_p) × SL_2(ℚ_p)` is the tensor product of its restriction to the centre with the trivial `SL_2`-representation; a Künneth argument and vanishing of positive z-Ext for `C(ℤ_p^×, E)` give `Ext^i_{gl_2}(W̌`, `Ĥ^0_{la}) ≅ Hom_z(E(χ^{-1}), Ĥ^0_{la}) ⊗ H^i(sl_2, W`); Whitehead’s lemmas give (i) (EM06 Corollary 4.3.2).
3. Feed (i) and the vanishing of `H^n(V_W)` for `n > 1` into the spectral sequence to get (ii) (EM06 (4.3.3)–(4.3.5)); `Ĥ^2_c = 0` gives (iii) (EM06 (4.3.7)–(4.3.8)).
4. Sum (ii)/(iii) over the irreducible `W = Sym^{k−2} ⊗ det^n` and identify `Hom_{gl_2}(W̌, −) ⊗` W̌ with the W̌-isotypic locally algebraic vectors; the Tate twist E(n) records `det^n` (EM-PAMQ Theorem 7.4.2).
5. For a newform f, `H^1_*(V_k)_E` contains `V_f ⊗ π(V_f) G_ℚ × GL_2(𝔸_f)-equivariantly` (EM-PAMQ Theorem 2.5.1): the Galois factor is the rank-two realisation of AutomorphicGaloisRepresentations §1.5 (newform rank two realisation) and the `GL_2(𝔸_f)-factor` is identified with `π(V_f)` by local–global compatibility away from p (AutomorphicGaloisRepresentations §4.3) and at p (Saito, §§4.5–4.6); ModularCurvesPartII §14.1 supplies `V_k` on the neat cofinal levels `Y_1(N)`, `N ≥ 5`, which suffice for the tower. The Manin–Drinfeld splitting of `H^1_c → H^1_par` allows either support (EM-PAMQ Corollary 7.4.3).

**Checks.**

- Weight two: the `K_p-invariant` locally algebraic vectors of algebraic weight `W = 1` recover `H^1(Y(K_pK^p), E)`, the cohomology carrying weight-two forms.
- For W one-dimensional, `Ext^1_{gl_2}(W̌`, `Ĥ^1_{la}) ≅ Ext^3_{gl_2}(W̌`, `Ĥ^0_{la}`) can be nonzero, so the degree-one comparison is exact only in the Hom term; the theorem does not claim vanishing of higher Ext for trivial W.

*Needs:* §1.1; §1.3; CompletedCohomologyPartII §6.1 (hochschild serre descent to finite level); CompletedCohomologyPartII §6.7 (analytic classical comparison); CompletedCohomologyPartII §6.4 (algebraic coefficient untwisting); CompletedCohomologyPartII §6.5 (classical evaluation map); ModularCurvesPartII §14.1 (relative coefficient system); AutomorphicGaloisRepresentations §1.5 (newform rank two realisation); AutomorphicGaloisRepresentations §1.2 (parabolic realisation premotive); AutomorphicGaloisRepresentations §4.3 (hecke versus langlands normalization and local global compatibility); AutomorphicGaloisRepresentations §§4.5–4.6 (potential semistability and compatibility at the coefficient prime).

EM06, Proposition 4.3.1 and Corollary 4.3.2, pp. 52–53; (4.3.3)–(4.3.5), (4.3.7)–(4.3.8), p. 53: Ext groups of algebraic representations with values in the locally analytic vectors of `Ĥ^0` are computed by Lie-algebra cohomology of `sl_2`, which kills all but degrees 0 and 3; the Hochschild–Serre spectral sequence then identifies `H^1` with coefficients in `V_W` with the W̌-equivariant locally analytic vectors in degree one, and similarly with compact supports.

EM-PAMQ, Definition 7.4.1, Theorem 7.4.2, Corollary 7.4.3, pp. 69–70: The locally algebraic vectors of `Ĥ^1_{*,E}` are the direct sum over `k ≥ 2` and n of `H^1_*(V_k)_E ⊗ (Sym^{k−2})^∨ ⊗ E(n)`; a cuspidal newform contributes `V_f ⊗ π(V_f) ⊗ (Sym^{k−2})^∨`.

EM11, Proof of Proposition 5.3.13, p. 51; proof of Corollary 5.4.5, p. 55: Emerton’s local–global paper uses [38, Thm. 7.4.2] (`=` EM-PAMQ Theorem 7.4.2) to describe the locally algebraic vectors at classical points.

### 2.2 Density of algebraic and classical vectors


(a) The `GL_2(ℤ_p)-algebraic` vectors of `Ĥ^1(K^p)_E` are dense, as are those of any closed G-stable topological direct summand. (b) In the non-Eisenstein summand, the E[G]-span of these `fixed-GL_2(ℤ_p)-algebraic` vectors is the sum of the locally algebraic parts at crystalline classical points (classical cuspidal forms of conductor prime to p). Consequently that sum is dense. This does not identify the span with the contributions of all classical forms ramified at p; their smooth local factors need not have `GL_2(ℤ_p)-fixed` vectors. (c) For `F = ℚ`, `GL_2(ℤ_p)-algebraic` vectors are dense in a topological direct summand of C(X,E). In Pan’s general-F setting, assume ψ is algebraic on `O_{F_v}^×` at a selected v | p and locally algebraic at the other p-adic places. Vectors algebraic on `GL_2(O_{F_v})` and locally algebraic at the remaining places are dense in `S_ψ(U^p)_E`.

Density is for the Banach topology of `Ĥ^1(K^p)_E` (resp. of `C^0(X)`, `S_ψ(U^p)_E`). Part (b) is stated after non-Eisenstein localisation and uses crystalline classical points. For (c), the central character must admit the indicated algebraic weights at every place above p, not just at v.

A proof proceeds as follows.

1. Reduce to a neat level: averaging over `K^p/K^{p′}` projects `Ĥ^1(K^{p′})_E` onto `Ĥ^1(K^p)_E` (EM11 Remark 5.4.2).
2. Since `Y(GL_2(ℤ_p)K^p)` is homotopic to a finite one-dimensional complex, `Ĥ^1(K^p)_E` is a quotient of `C(GL_2(ℤ_p), E)^s` compatibly with algebraic vectors (EM06 Theorem 2.1.5); in the localised case §1.4(d) makes it a direct summand of `C(GL_2(ℤ_p), E)^s` directly (EM11 Proposition 5.4.1).
3. Use `mathlib:PadicInt.dense_span_mahler` on `ℤ_p` with coefficients in E. Coordinatewise approximation on finite residue grids gives density of multivariable polynomials on `ℤ_p^4`; extend continuous functions from the clopen subset `GL_2(ℤ_p)` by zero and restrict the approximations. Polynomial matrix coefficients are algebraic vectors, and density passes through the equivariant quotients or summands used above.
4. (b): EM11 Corollary 5.4.5 decomposes the G-span of the fixed-compact algebraic vectors over crystalline classical points, using the classical comparison and semisimplicity. The distinction between fixed-compact algebraic and locally algebraic vectors retains the prime-to-p conductor restriction.
5. (c) is the same argument with §1.7(b) in place of the topology of the modular curve (DLB Lemme 13.2), and in Pan’s generality through the isomorphism `S_{(k,w),ψ}(U^pU_p, E) ≅ Hom_{U_p}(W^*_{(k,w)}, S_ψ(U^p)_E)` (Pan Proposition 3.2.9).

**Checks.**

- Katz’s density of classical modular forms in p-adic modular forms is the analogue (EM11 Remark 5.4.3).
- Smooth weight-two classes over all p-power levels are already dense by the completion definition. The stronger assertion tested here is density of vectors algebraic for one fixed `GL_2(ℤ_p)`; its G-span uses crystalline classical points, rather than all classical eigensystems.

*Needs:* §1.1; §1.4; §1.7; §2.1; `mathlib:ContinuousMap`; `mathlib:Subalgebra.topologicalClosure`; `mathlib:PadicInt.dense_span_mahler.`

EM11, Proposition 5.4.1 and Remark 5.4.2, pp. 54–55: `GL_2(ℤ_p)-algebraic` vectors are dense in `Ĥ^1(K_{Σ_0})_{E,ρ̄}`, and even without localising, by Mahler expansions and the realisation of `Ĥ^1` as a quotient (or summand) of a finite sum of `C(GL_2(ℤ_p), E)`.

EM11, Corollary 5.4.5 and its proof, p. 55: The G-span of `fixed-GL_2(ℤ_p)-algebraic` vectors decomposes over the crystalline classical points and is dense in the non-Eisenstein summand.

DLB, Lemme 13.2, p. 69: `GL_2(ℤ_p)-algebraic` vectors are dense in any topological direct factor of `C^0(X)`, by Lemme 13.1 and Mahler’s theorem.

PAN, 3.2.8, Proposition 3.2.9 and its proof, pp. 20–21: The general-F density statement uses ψ algebraic at the chosen place and locally algebraic at all other places above p.

EM06, Theorem 2.1.5, p. 22: The completed cohomology of a tower of finite complexes is computed by a finite complex of C(H, E)-modules.

### 2.3 Global Serre weights and good weights


For a modular absolutely irreducible residual representation ρ̄ and `K = GL_2(ℤ_p)`, `W_gl(ρ̄)` is the set of Serre weights V for which `Hom_K(V,H^1_{k,ρ̄,Σ})` is nonzero. This is equivalent to nonzero `Hom_K(V,H^1_{k,ρ̄,Σ}[m])`. Write a Serre weight as `(Sym^r k²)^dual ⊗ det^s`, with `0 ≤ r ≤ p−1` and `0 ≤ s ≤ p−2`. An occurring weight is good if `r < p−1`, or if `r = p−1` and `det^s` does not belong to `W_gl(ρ̄)`. The local representation-valued weight set and compact-Hecke module are §0.5; AlgebraicModularFormsAndSerreWeights R15.4 supplies the numerical minimal-weight recipe and its normalization; this section defines global occurrence and its good-weight predicate.

The cohomology is the non-Eisenstein mod-ϖ tower with its smooth K-action; m is the residual maximal ideal of `T_{ρ̄,Σ}`. The representation ρ̄ is absolutely irreducible and modular. These definitions require neither local non-scalarity nor a weight-part converse.

Use the following named interfaces:

- `TauCeti.ModularCompletedCohomology.globalSerreWeights` (constructor): The set `W_gl(ρ̄)` defined by nonzero K-equivariant maps into `H^1_{k,ρ̄,Σ}`.
- `TauCeti.ModularCompletedCohomology.mem_globalSerreWeights_iff_m_torsion` (characterisation): `V ∈ W_gl(ρ̄)` if and only if `Hom_K(V,H^1_{k,ρ̄,Σ}[m]) ≠ 0`.
- `TauCeti.ModularCompletedCohomology.isGoodWeight` (constructor): For `V ∈ W_gl(ρ̄)`, the predicate `r < p−1` or (r `= p−1` and `det^s ∉ W_gl(ρ̄)`).

**Checks.**

- `TauCeti.ModularCompletedCohomology.goodWeight_interior` (computation): Every occurring weight with `r < p−1` is good, regardless of whether `det^s` occurs.
- `TauCeti.ModularCompletedCohomology.goodWeight_boundary` (non-example): An occurring weight with `r = p−1` is not good when `det^s` also occurs; the boundary condition cannot be omitted.
- If the `r=p−1` weight occurs and `det^s` does not, it is good. A predicate that simply discards every boundary weight fails this case. If `W_gl` is empty there are no good weights, including when a predicted local weight set is nonempty.
- `TauCeti.ModularCompletedCohomology.globalWeight_m_torsion` (compatibility): Testing occurrence in the whole m-power-torsion tower or in its m-torsion gives the same weight set, rather than requiring the whole Hom space to be killed by m.

§2.4: Separates genericity for every occurring weight from the derivative formula, which needs a good weight. §6.3: Distinguishes actual global occurrence from membership in the predicted local weight set.

A proof proceeds as follows.

1. Define occurrence using §0.5’s Serre-weight carrier and the mod-ϖ arithmetic tower.
2. Every vector of the relevant Hom module is killed by a power of m; a nonzero such module has nonzero m-socle, giving the equivalent occurrence test (EM11 Remark 5.7.2, p. 63).
3. Define goodness by the two explicit cases of EM11 Definition 5.7.5, p. 64. No assertion of `W_gl = W(ρ̄_p)` enters the definition.

**Checks.**

- A predicted local Serre weight with no global occurrence is not in `W_gl` by definition; only a separate weight-part theorem supplies the converse inclusion.

*Needs:* §1.4; §0.5 (localSerreWeights and its Hecke-module comparison).

EM11, Definitions 5.7.1 and 5.7.5, Remark 5.7.2, pp. 63–64: Global occurrence, its equivalent m-torsion test and the good-weight predicate.

### 2.4 Serre-weight bounds and genericity in mod-p cohomology


For an absolutely irreducible modular ρ̄ unramified outside Σ, use `W_gl(ρ̄)` and good weights as defined in §2.3. Write `V = (Sym^r k^2)^dual ⊗ det^s`, `0 ≤ r ≤ p−1` and `0 ≤ s ≤ p−2`. Call V good if `r < p−1`, or `r = p−1` and `det^s` does not also occur globally. Then (1) `W_gl(ρ̄) ⊂ W(ρ̄_p)`. If `ρ̄_p` is non-scalar, (2) for every good V in `W_gl`, the away-from-p top derivative of the Hecke-socle part of `Hom_K(V,H^1_{k,ρ̄,Σ}[m])` is ρ̄ `⊗ soc_H(V) m(V,ρ̄_p)`, in EM11’s Hecke-module notation; (3) for every V in `W_gl`, `Hom_K(V,H^1_{k,ρ̄,Σ}[m])` is generic as `a G_{Σ_0}`-representation. These are the three assertions of EM11 Theorem 5.7.7. Their precise small-weight reduction and multiplicity-one/Ihara inputs are the small-weight and good-weight supplier specifications above; neither the upper bound (1) nor the good-weight qualification can be replaced by a full weight-part converse.

`K = GL_2(ℤ_p)`; `W(ρ̄_p)` and the Hecke module `m(V,ρ̄_p)` use EM11 §5.7’s conventions. The non-scalar condition is needed for (2)–(3), not for the inclusion (1). The good-weight condition removes an overlapping determinant weight at `r = p−1`. Import the local Serre-weight Hecke algebra `H(V) = End_G(c-Ind_K^G V) ≅ k[T,Z,Z^{-1}]` and the module `m(V,ρ̄_p)` with the cohomological convention of EM11 Definitions 3.5.2–3.5.4: for absolutely irreducible `ρ̄_p` it is one-dimensional with `T = 0` and `Z = det(ρ̄_p)(p)`; for reducible `ρ̄_p` and `V = (Sym^r k²)^dual ⊗ det^s` it is `Hom_{I_p}(ε̄^s,ρ̄_p)`, T acts by geometric Frobenius and Z by `det(ρ̄_p)(p)`. Here evaluation at p uses local reciprocity, not a choice of an element named p in the Galois group. This compact-Hecke module and its socle comparison are the construction targets of §0.5.

A proof proceeds as follows.

1. Lift a global Serre-weight occurrence to characteristic zero using localised K-injectivity; the classical comparison and a Hecke-eigenvalue lift produce a form of weight at most `p+1`. Its small-weight mod-p local description gives (1) and the Hecke eigensystem constraint. This is the small-weight local description of the supplier contracts; a minimal-weight assertion does not supply it.
2. For a good weight, the classical mod-p multiplicity-one theorem identifies the relevant Hecke socle and Whittaker derivative, giving (2). This is the specified coefficient multiplicity-one input, not a routine finite-dimensional computation.
3. For (3), the Ihara argument rules out finite-dimensional `GL_2(ℚ_ℓ)-subobjects` at each `ℓ ∈ Σ_0` after non-Eisenstein localisation, forcing genericity. Use ModularCurvesPartII §§15.6–15.10 with the coefficient/tower Ihara extension specified above.

**Checks.**

- At `r = p−1`, occurrence of `det^s` makes the corresponding weight non-good; dropping this condition incorrectly applies the multiplicity formula to the overlapping weight.
- The upper-bound statement permits a missing predicted weight. Its converse requires the full weight-part input separately used by the globalisation argument.
- Genericity is required for every occurring V under non-scalarity, while the explicit derivative formula is only asserted for good V.

*Needs:* §1.4; §2.1; §0.5 (localSerreWeights and its Hecke-module comparison); ModularCurvesPartII §15.6–15.10 (enhanced ihara); §0.2; §2.3.

EM11, §3.5, Definitions 3.5.1–3.5.4 and Lemma 3.5.5, pp. 31–32; §5.7, Definitions 5.7.1 and 5.7.5, Remarks 5.7.2–5.7.6, Theorem 5.7.7 and proof, pp. 63–66: Global weight occurrence, good weights, the local-weight upper bound, good-weight Hecke-socle derivative, and genericity of the away-from-p representation.

### 2.5 Classical eigensystems and newforms in completed cohomology


Let `T(Σ) = O[T_ℓ`, `S_ℓ]_{ℓ∉Σ}` be the abstract spherical Hecke algebra and λ: `T(Σ) → E′ a` system of Hecke eigenvalues over a finite extension E′/E. Then: (a) the λ-part of `(Ĥ^1(K^p)_{E′})_{l.alg}` is nonzero if and only if λ, up to the cyclotomic twist of §2.1, is the eigensystem of a classical eigenform of weight `k ≥ 2` and tame level `K^p` (cuspidal or Eisenstein); (b) for a cuspidal newform f of weight k and conductor N prime to p, with `λ_f` its eigensystem, `Ĥ^1(K_1(N)^p)_{E′}[λ_f]_{l.alg} ≅ V_f ⊗ Sym^{k−2}(E′^2)^∨ ⊗ π_p(V_f)` as `G_ℚ × GL_2(ℚ_p)`-representations, where `π_p(V_f)` is the local component at p of the automorphic representation of f; (c) under the identification of weight-two cusp forms with `H^1` of the modular curve (ModularCurvesPartII §14.5 (weight two shimura isomorphism)), the Hecke operator `T_ℓ` on `Ĥ^1` restricts to the classical `T_ℓ` on Mathlib’s CuspForm space at level `Γ_1(N)`, with the normalisation of ModularCurvesPartII §§10.4 and 14.5 (`T_ℓ` the double coset of `diag(ℓ, 1)` after Emerton’s transpose-inverse convention); (d) every eigensystem λ with `Ĥ^1(K^p)_{E′}[λ] ≠ 0` is promodular in the sense of EM-PAMQ Definition 7.3.15, and attached to it is a two-dimensional odd continuous `G_ℚ`-representation over E′ unramified outside Σ, unique up to semisimplification.

The Hecke normalisation is that of ModularCurvesPartII §§10.4 and 14.5 and Emerton lg §2 (the actions of [16] twisted by `g ↦ (g^{-1})^t`); geometric Frobenius at ℓ has characteristic polynomial `X^2 − T_ℓX + ℓS_ℓ` on the Galois factor. In (b), `π_p(V_f)` is the generic smooth representation of `GL_2(ℚ_p)` attached to f; p ∤ N is used only to identify the `K_p-type`.

A proof proceeds as follows.

1. (a) and (b) are §2.1 combined with the decomposition of `H^1_*(V_k)_E` into Hecke eigenspaces, and multiplicity one for newforms with Eichler–Shimura (EM-PAMQ Corollary 7.4.3, Remark 7.3.14; EM11 proof of Theorem 3.3.22 in §7.4).
2. (c) is the weight-two Shimura isomorphism of ModularCurvesPartII §14.5 (weight two shimura isomorphism) and the Hecke compatibility of ModularCurvesPartII §§10.3–10.4, transported to the completed tower by §1.2(b).
3. (d): Remark 7.3.14 of EM-PAMQ shows eigensystems occurring in `Ĥ^1` are promodular; Proposition 7.3.17 constructs the Galois representation from the pseudo-representation on the product of the `T(K^p)/I_f`, using that `∩_f I_f = 0` by density of `H^1` in `Ĥ^1`; oddness follows from oddness of each `V_f`.

**Checks.**

- Worked example: for the weight-two newform f of level 11 and `p = 5` (good ordinary), `Ĥ^1(K_1(11)^p)_E[λ_f]_{l.alg} ≅ V_f ⊗ π_p(V_f)` with `π_p(V_f)` the unramified principal series whose Satake parameters are the roots of `X^2 − a_5(f)X + 5`, `a_5(f) = 1`, and the Hecke operator `T_ℓ` acts on it by `a_ℓ(f)` for ℓ ∤ 55 in the normalisation of ModularCurvesPartII §10.4.
- Non-example: an eigensystem of a weight-one form does not occur in the locally algebraic vectors, although it occurs in `Ĥ^1` as a promodular eigensystem (EM-PAMQ Remark 7.3.14).

*Needs:* §1.1; §1.2; §2.1; ModularCurvesPartII §14.5 (weight two shimura isomorphism); ModularCurvesPartII §§10.3–10.4 (analytic comparison of correspondences); AutomorphicGaloisRepresentations §1.5 (lambda adic representation of a weight k eigenform); AutomorphicGaloisRepresentations §4.3 (hecke versus langlands normalization and local global compatibility); IntegralHeckeAndGaloisDeterminants IHG.3 (rank-two modular normalization); `mathlib:CuspForm`; `mathlib:ModularForm.`

EM-PAMQ, Definitions 7.3.1–7.3.5, Remark 7.3.14, Definition 7.3.15, Proposition 7.3.17, Remark 7.3.18, pp. 65–69: Systems of Hecke eigenvalues, Eisenstein systems, promodularity, and the existence and oddness of the Galois representation attached to a promodular eigensystem.

EM-PAMQ, Corollary 7.4.3, p. 70: A cuspidal newform contributes `V_f ⊗ π(V_f) ⊗ (Sym^{k−2})^∨` to `Ĥ^1`.

EM11, §7.4, pp. 97–98: At a classical point of conductor N, `Ĥ^1(K_1^p(N))[𝔭]_{l.alg} ≅ ρ(𝔭) ⊗ Sym^{a−b−1} ⊗ det^b ⊗ π_p(V)`, by [38, Thm. 7.4.2].

### 2.6 Completed homology with coefficients recovers classical cohomology


Let X(K_pK^p) be the compactification of Y(K_pK^p) and C(K_pK^p)=X(K_pK^p)∖Y(K_pK^p) its cusp set. Define `H̃^{BM}_1(K^p) = lim_{K_p} H_1(X(K_pK^p)(ℂ), C(K_pK^p)(ℂ); O)` under covering pushforwards be completed Borel–Moore homology at tame level `K^p`, a compact `O[[GL_2(ℤ_p)]]`-module with Hecke operators `T′_ℓ`, `S′_ℓ`. (a) For every compact `O[[GL_2(ℤ_p)]]`-module `M` there is a canonical Hecke-equivariant isomorphism `M ⊗̂_O H̃^{BM}_1(K^p) ≅ H̃^{BM}_1(K^p, 𝒱_M)` of compact `O[[GL_2(ℤ_p)]]`-modules, where `𝒱_M` is the induced pro-local system. (b) For an algebraic representation W of `GL_2/ℚ_p` over E, regarded as a right `O[[K_p]]`-module through v·g `= g^{-1}v`, and any open `K_p ⊂ GL_2(ℤ_p)`, there is a canonical E-linear isomorphism `W ⊗_{O[[K_p]]} H̃^{BM}_1(K^p) ≅ H^1(K^pK_p, 𝒱_W)(1)`, compatible with Hecke operators, change of `K_p`, coefficient change `W → W′` and the trace maps. (c) For a smooth representation τ of `GL_2(ℤ_p)` on a finite free O-module and W as above, (τ `⊗ W`) `⊗_{O[[K_p]]} H̃^{BM}_1(K^p) ≅ H^1(K^pK_p, 𝒱_{τ⊗W})(1)` for every open `K_p`, by Hochschild–Serre after choosing a smaller open normal subgroup acting trivially on τ. No integral isomorphism and no integral self-duality of symmetric powers is asserted.

(b) and (c) are rational statements (after inverting p); the integral map exists but is not claimed to be an isomorphism. Borel–Moore homology is relative to the cusps; `H̃^{BM}_1(K^p)` is dual to `Ĥ^1_c(K^p)` by §1.3 and Poincaré duality (Nakamura Lemma 2.4).

A proof proceeds as follows.

1. (a): write `M = lim M_i` with `M_i` of finite length; for `K_p` acting trivially on `M_i`, `M_i ⊗ H_1(K^pK_p) ≅ H_1(K^pK_p, 𝒱_{M_i})` using the vanishing of ordinary `H²` of the non-compact curve with these coefficients; pass to limits (NAK Lemma 2.9).
2. (b): apply (a) to `a K_p-stable` lattice `W₀`. Dualise the compact-support coefficient comparison with `W₀*`, obtaining the closed `K_p`-coinvariants of completed homology as the O-dual of the `K_p`-invariants of completed compact-support cohomology. After inverting p, §2.1 identifies those invariants with `H¹_c(K^pK_p,𝒱_{W*})`; Poincaré duality gives `H¹(K^pK_p,𝒱_W)(1)`. This is Nakamura Lemma 2.10, pp. 29–30. No vanishing of finite-level Borel–Moore `H₂` is used.
3. (c): tensor with τ and use Hochschild–Serre for the finite quotient through which `GL_2(ℤ_p)` acts on τ (NAK Lemma 2.11).

**Checks.**

- The cusp set lies in X∖Y, so the relative pair is (X,C); the pair (Y,C) does not exist. For Y compact the empty boundary recovers ordinary homology.

- For W trivial and `K_p = GL_2(ℤ_p)`, (b) gives O-coinvariants of `H̃^{BM}_1(K^p) ⊗ E ≅ H^1(Y(GL_2(ℤ_p)K^p), E)(1)`.
- With `W = Sym^{k−2}(ℤ_p^2)^*`, (b) gives the map `Sym^{k−2}(ℤ_p^2)^* ⊗_{ℤ_p[[K_m]]} H̃^{BM}_1(K^p(N_0))(1) → H^1(Y(N), V^*_k)(2)` used for Kato’s zeta elements (NAK §2.3); it is an isomorphism only after inverting p.

*Needs:* §1.1; §1.3; CompletedCohomologyPartII §3.3 (completed homology and borel moore); CompletedCohomologyPartII §3.7 (duality between completed homology and completed cohomology); CompletedCohomologyPartII §6.3 (homological hyper-Tor descent); ModularCurvesPartII §14.11 (parabolic duality); ModularCurvesPartII §14.1 (relative coefficient system).

NAK, Lemma 2.4, p. 22; Lemmas 2.9–2.11, pp. 28–30: Completed Borel–Moore homology is the dual of compactly supported completed cohomology; its completed tensor product with a compact `O[[GL_2(ℤ_p)]]`-module is homology with coefficients; with an algebraic representation W over E it recovers `H^1(K^pK_p, 𝒱_W)(1)`, and with `τ ⊗ W` by Hochschild–Serre.

EM06, (4.3.7), p. 53: The compactly supported comparison `H^1_c(V_W) ≅ Hom_{gl_2}(W̌, Ĥ^1_{c,la})`, dual to Nakamura’s Lemma 2.10.

### 2.7 Classical and p-adic quaternionic forms


In the setting of §1.6, let W be an irreducible algebraic representation of `D_p^× = ∏_{v|p}GL_2(F_v)` over E (a tensor product of `Sym^{k_v−2} ⊗ det^{w_v}` through the embeddings) and `U_p ⊂ K_p` open. (a) `Hom_{U_p}(W^*, C(X(U^p), E)) ≅ A_{U_p}(W) := {f: X(U^p) → W continuous with f(xu) = u^{-1}f(x)}`, the space of p-adic automorphic forms of weight W and level `U^pU_p`, by sending φ to the unique function f satisfying ℓ(`f(x)`) `=` φ(ℓ)(x) for every `ℓ ∈ W*`, with inverse `f ↦` (ℓ `↦` (x `↦` ℓ(`f(x)`))); with central character ψ algebraic of the matching weight the same holds for `S_ψ`, giving `S_{W,ψ}(U^pU_p, E) ≅ Hom_{U_p}(W^*, S_ψ(U^p)_E)` Hecke-equivariantly. (b) For `F = ℚ` and a fixed ι: `ℚ̄_p ≅ C`, `A_{K_p}(W) ⊗_{E,ι} C ≅ Hom_{B̄^*(R)}(W_∞^*, Aut(K^pK_p))`, where `Aut(K^pK_p)` is the space of smooth functions on `B̄^*(ℚ)∖B̄^*(A)/K^pK_p` and `W_∞ = W ⊗_ι C` viewed as a representation of `B̄^*(R)`. (c) Consequently `Hom_{K_p}(W, C^0(X)) ⊗_{E,ι} C ≅ ⊕_π π_f^{K^pK_p}`, the sum over automorphic representations `π = π_∞ ⊗ π_f` of `B̄^*(A)` with `π_∞ ≅ W_∞`, and G-equivariantly `C^0(X)_{l.alg} ⊗_{E,ι} C ≅ ⊕_{W} ⊕_{π_∞ ≅ W_∞} W_∞ ⊗ π_f^{K^p}`; the infinite-dimensional π correspond by global Jacquet–Langlands to cuspidal representations of `GL_2(A)` discrete series at the ramified places of B̄.

(b)–(c) are stated for `F = ℚ`, where DLB work; for general F the same holds with the archimedean comparison of HilbertModularVarietiesAndShimuraCurves R18.3 (definite jl), which is stated in Khare–Wintenberger’s even-degree, parallel-weight setting; R18.3/quaternion-weight likewise covers parallel weights `W_k = ⊗ Sym^{k−2}`. Non-parallel weights `⊗_v Sym^{k_v−2} ⊗ det^{w_v}` and B̄ over `ℚ` ramified at a finite prime use the same constructions; use the general definite arithmetic adapter above for that extension. Sign and dual conventions: W versus `W^*` follows DLB (their Lemme 4.7 is obtained from 4.5–4.6 by replacing W with `W^*`). The last display of DLB Lemme 4.7 prints `π_f^{K_p}` where `π_f^{K^pK_p}` (in the `K_p-algebraic` form) or `π_f^{K^p}` (in the G-equivariant form) is meant; retain the tame level in both formulas.

A proof proceeds as follows.

1. (a): `Hom_{U_p}(W^*, C(X, E)) ≅` (W `⊗ C(X, E))^{U_p} ≅ C(X, W)^{U_p}`, and `U_p-invariance` of a W-valued function is `f(xu) = u^{-1}f(x)` (DLB Lemme 4.5); the central-character version is Pan’s isomorphism 3.2.10.
2. (b): send `f ∈ A_{K_p}(W)` to `φ_f(ℓ)(g) = ℓ(g_∞^{-1}·(g_p·f(g^∞) ⊗` 1)); DLB give the map `f ↦ φ_f` explicitly and leave its bijectivity as a standard exercise: the inverse evaluates φ at adelic points with trivial archimedean component, and left `B̄^*(ℚ)-invariance` on both sides matches because `B̄^*(ℚ)` acts on W through `B̄^*(ℚ_p)` and on `W_∞` through `B̄^*(R)` compatibly with ι (DLB Lemme 4.6, following Taylor §1).
3. (c): replace W by `W^*` in (a)–(b) and decompose `Aut(K^pK_p)` under `B̄^*(A)` (DLB Lemme 4.7); Jacquet–Langlands is GL2AutomorphicRepresentationsAndTransfer R17.3 (global jl).

**Checks.**

- For X=K with its regular left action, every weighted form satisfies `f(k)=ρ(k)f(1)`. Evaluation at the identity determines the form, while a nontrivial weight does not give constant functions.

- For W trivial and π a weight-two quaternionic automorphic representation, `π_f^{K^pK_p}` occurs in the `K_p`-invariants of `C^0(X)_{l.alg} ⊗ C`.
- Non-example: one-dimensional automorphic representations `χ∘N_{B̄/ℚ}` of `B̄^*(A)` occur in `C^0(X)` (constant functions on fibres of the norm) but have no Jacquet–Langlands partner; they are Eisenstein for the Hecke algebra.

*Needs:* §1.6; HilbertModularVarietiesAndShimuraCurves R18.3 (quaternion weight); HilbertModularVarietiesAndShimuraCurves R18.3 (definite jl); GL2AutomorphicRepresentationsAndTransfer R17.3 (global jl); GL2AutomorphicRepresentationsAndTransfer R17.3 (definite infinity).

DLB, Lemmes 4.5, 4.6, 4.7, pp. 21–22: p-adic automorphic forms of weight W are the `K_p-homomorphisms` from `W^*` into `C^0(X)`; after ι they are classical automorphic forms of weight `W_∞`; the `K_p-algebraic` vectors decompose over automorphic representations with `π_∞ ≅ W_∞`.

PAN, 3.2.10, p. 22 (used in the proof of Theorem 3.5.5, pp. 29–30): For a definite quaternion algebra over a totally real field, `S_{(k,w),ψ}(U^pU_p, E) ≅ Hom_{U_p}(W^*_{(k,w)}, S_ψ(U^p)_E)`, Hecke-equivariantly.

For the weighted-function comparison, allow any complete nontrivially normed field E, any space X with a group K acting by continuous translations, and a finite-dimensional Hausdorff topological E-representation W. Define weighted forms by `f(kx)=ρ(k)f(x)` and equivariant dual maps as the submodule of linear maps `φ:W*→C(X,E)` satisfying `φ(ℓ∘ρ(k⁻¹))=k·φ(ℓ)`, where K acts on continuous functions by inverse translation. These match (a) after turning its right action into a left action by inversion. Prove the membership, evaluation and weight-change lemmas, and an E-linear equivalence characterised by the pairing `ℓ(f(x))=φ(ℓ)(x)` for all ℓ and x. Finite-dimensionality gives the continuity of the reconstructed W-valued function; an algebraic infinite-dimensional dual is not a substitute.

**Checks.**

- For the trivial one-dimensional weight, the weighted-form space is `C(X,E)^K`, not all of C(X,E). On a transitive two-point K-set only constant functions satisfy the condition.
- If k fixes x and its action on W has no fixed vector, `f(x)=0`. In a one-dimensional nontrivial scalar weight a nonzero constant function therefore fails the definition.
- For a scalar weight t, the dual action is `t⁻¹`. The equivariant map satisfies `φ(ℓ∘ρ(k⁻¹))(kx)=φ(ℓ)(x)`; using ρ(k) instead gives a factor `t²` and fails for `t²≠1`.
- For `X=K`, the weighted function `f(x)=ρ(x)w` and `φ(ℓ)(x)=ℓ(ρ(x)w)` correspond. Evaluation at the identity recovers w; the zero map corresponds exactly to the zero form.

### 2.8 Type-specialised quaternionic modules


In the setting of §1.6, let σ be a continuous representation of `K_p` on a finite free O-module σ° (a locally algebraic type: `σ ⊗ E = ⊗_{v|p} σ_v` with each `σ_v ≅ σ(h_v, τ_v)` or `σ^{cr}(h_v, τ_v)`, an algebraic representation of highest weight `λ_alg,v` tensored with a smooth `K_v-type` attached to an inertial type `τ_v`) on which `(𝔸_F^∞)^× ∩ K_p` acts through ψ. Put `S_{ψ,σ}(U, A) = Hom_{U_p}(σ, S_ψ(U^p, A))` and, for a maximal ideal m of the Hecke algebra, the type-specialised module `M(σ°) = σ° ⊗_{O[[K_p]]} M_ψ(U^p)_m`. Here h_v is the Hodge type associated with λ_alg,v by the dual convention of §5.2: for GL₂ at v|p it is `(1−λ_alg,v,2, −λ_alg,v,1)` with HT(ε)=−1. The compact module M has its left `K_p`-action; the first tensor factor is a right module by w·k `= σ(k⁻¹)w`, extended continuously to `O[[K_p]]`. This fixes the side convention over the noncommutative Iwasawa algebra. Then (Schikhof duality and Frobenius reciprocity) `M(σ°)^d ≅ Hom^cont_{O[[K_p]]}(σ°, M_ψ(U^p)_m^d) ≅ S_{ψ,σ°}(U^pK_p, O)_m`; when `U^pK_p` is sufficiently small M(σ°) is finite free over O, its formation is exact in σ°, and M(σ°)[1/p] is dual to the space of classical quaternionic forms of weight and type σ. The Hecke algebra `T^S_{ψ,σ}(U^pK_p)_m` acting faithfully on `S_{ψ,σ}(U^pK_p, O)_m` is a finite reduced O-algebra and a quotient of the big Hecke algebra of §3.7. These type-module and faithful-image constructions allow Eisenstein m.

`U^pK_p` sufficiently small (Pan Corollary 3.1.3), with compatible rational central character, for the exactness and freeness assertions. The proof through injectivity additionally retains `ψ|N_{D/F}(U^p)=1` from §1.7(c); alternatively use the finite-coset decomposition directly. An incompatible central character can give a zero space and does not satisfy the stated nonzero rank formula. The additional representation-deformation-ring quotient is the separate non-Eisenstein theorem below; the type-module construction does not require reconstruction of a Hecke-valued Galois representation.

Use the following named interfaces:

- `TauCeti.DefiniteQuaternionCompleted.typed` (constructor): `S_{ψ,σ}(U, A) = Hom_{U_p}(σ, S_ψ(U^p, A))` for `a K_p-type σ` with compatible central character.
- `TauCeti.DefiniteQuaternionCompleted.typeSpecialised` (constructor): `M(σ°) = σ° ⊗_{O[[K_p]]} M_ψ(U^p)_m`.
- `TauCeti.DefiniteQuaternionCompleted.typeSpecialised_dual` (equivalence): `M(σ°)^d ≅ S_{ψ,σ°}(U^pK_p, O)_m`, Hecke-equivariantly (Schikhof duality and Frobenius reciprocity).
- `TauCeti.DefiniteQuaternionCompleted.typeSpecialised_exact` (functoriality): `σ° ↦ M(σ°)` is exact on finite free `K_p-types` at sufficiently small tame level.
- `TauCeti.DefiniteQuaternionCompleted.typeSpecialised_free` (characterisation): M(σ°) is finite free over O when `U^pK_p` is sufficiently small.
- `TauCeti.DefiniteQuaternionCompleted.typeHeckeAlgebra` (data): `T^S_{ψ,σ}(U^pK_p)_m`, finite reduced over O, the faithful image of the Hecke algebra in `End(S_{ψ,σ°}(U^pK_p, O)_m)` for any maximal ideal m.

**Checks.**

- `TauCeti.DefiniteQuaternionCompleted.typeSpecialised_trivial` (degenerate): For `σ° = O` with trivial action and ψ trivial on the central subgroup of `K_p`, `M(σ°) = O ⊗_{O[[K_p]]} M_ψ(U^p)_m` is the `K_p`-coinvariants, dual to `S_ψ(U^pK_p, O)_m`.
- `TauCeti.DefiniteQuaternionCompleted.typeSpecialised_rank` (computation): At sufficiently small level, `rank_O M(σ°) =` (number of double cosets in `D^×∖(D ⊗ 𝔸_F^∞)^×/U^pK_p(𝔸_F^∞)^×`) · `rank_O σ°` before localisation, with the rational-centre and type-character compatibility of §1.6.
- `TauCeti.DefiniteQuaternionCompleted.typeSpecialised_compatibility` (compatibility): For `σ = W` an algebraic representation, `M(σ°)[1/p]^*` is the space `S_{W,ψ}(U^pK_p, E)` of §2.7(a).
- If k acts on a scalar type by t and on a scalar summand of M by u, balancing gives `(t⁻¹−u)(w⊗m)=0`. After passing to E, the summand survives exactly when `u=t⁻¹`, equivalently when the dual automorphic space has type t. Replacing the right action by σ(k) would select `u=t` and fail this test when `t²≠1`.
- `TauCeti.DefiniteQuaternionCompleted.typeSpecialised_not_patched` (non-example): M(σ°) is a finite O-module at a fixed tame level; it is not the patched module `M_∞(σ°)` of Layer 5, which is finite over `R_∞(σ)` but of positive relative dimension over O.

Under the non-Eisenstein global deformation hypotheses below, TUNG-2, Lemma 5.3.2 identifies condition (3), finiteness of `R^S_ψ(σ)` and faithfulness of M(σ)[1/p], with the full-support condition (1). GL2ModularityLifting §§9.1–9.3 (typed component specialisation): The typed component argument identifies the nonzero fibre with the finite-level algebraic σ-space (input CC1). PAN, §4.4: Completed homology with auxiliary levels is specialised to types at Taylor–Wiles levels.

A proof proceeds as follows.

1. `M(σ°)^d ≅ Hom^cont_{O[[K_p]]}(σ°, M^d)` by Schikhof duality and `≅ Hom_{G_p}(c-Ind σ°, M^d)` by Frobenius reciprocity (TUNG-2 §5.2.1, CEGGPS Lemma 4.14); `M_ψ(U^p)^d = S_ψ(U^p)`, so `M(σ°)^d = Hom_{K_p}(σ°, S_ψ(U^p)) = S_{ψ,σ°}(U^pK_p, O)`.
2. Exactness and freeness: `S_ψ(U^p, E/O)` is injective among smooth `K_p`-modules with central character (§1.7(c)), so `Hom_{K_p}(−, S_ψ(U^p, E/O))` is exact; finite level is a finite sum of copies of σ°'s invariants under trivial stabilisers.
3. Classicality after inverting p is §2.7(a) applied to the algebraic part of σ together with the smooth type.
4. The Hecke algebra `T^S_{ψ,σ}` is finite free over O and reduced since `S_{ψ,σ}(U, E)` is semisimple for the Hecke action; it is a quotient of the completed Hecke algebra by restriction (§3.7).

**Checks.**

- For σ the trivial type and m non-Eisenstein, M(σ°)[1/p] is dual to the weight-two quaternionic forms of level `U^pK_p` localised at m.
- CC1 (GL2ModularityLifting supplier contract): for non-Eisenstein m and the compatible global deformation problem below, the algebraic quaternionic module in Tung’s Lemma 5.3.2(3) is M(σ°)[1/p] with its `R^S_ψ(σ)`-action. Faithfulness over this deformation ring is the additional full-support condition of Layer 5, not a consequence of faithfulness over the Hecke image.

**Typed deformation-ring quotient.** Prove `TauCeti.DefiniteQuaternionCompleted.typeDeformation_surjective`: assume m is non-Eisenstein, fix its absolutely irreducible residual representation `ρ̄_m`, and fix a global deformation problem unramified outside S whose determinant and local conditions agree with the Hecke-valued representation of §3.2(c). Write `R^S_ψ(σ)` for that problem’s typed representation deformation ring in the chosen convention. Then `R^S_ψ(σ) → T^S_{ψ,σ}(U^pK_p)_m` is a continuous surjection inducing the Hecke-valued representation on the typed space. The Pan presentation has determinant `ψε⁻¹` and the Hodge types h_v above; the Tung presentation has determinant `ψ_T ε` and the transported types and weights of §5.2. Transport the representation, residual representation, types and Hecke operators through `panTungGaloisNormalization` of §3.2(c) before comparing the two presentations; the same ψ or σ is not presumed to label both.

Use §§3.2(c) and 3.7 before this theorem. Retain finite-level local–global compatibility at every v | p (classical, through the Bernstein centre, with the crystalline monodromy-zero condition when required), and compatibility with the specified local conditions away from p. This gives factorisation through the typed quotient; the Frobenius trace and determinant Hecke generators give surjectivity. The finite-level type compatibility is also the input to §5.2’s patched comparison. Sources: TUNG-2 §3.1, pp. 11–12, Proposition 4.2.5, p. 19, and §5.2.2, Proposition 5.2.2(1)–(2), pp. 26–27; §3.2(c)’s Pan/Tung normalisation bridge.

**Checks.**

- At a non-Eisenstein classical point of type σ the composite to its coefficient field is the deformation of `ρ̄_m` attached to that point, with the chosen fixed determinant and local types.
- At an Eisenstein ideal, trivial-type constant quaternionic forms can give a nonzero type module and faithful Hecke image, with residual trace `1 + ε̄` up to the convention and character twist of §3.7. This does not satisfy the absolutely irreducible residual hypothesis and supplies no representation-deformation-ring quotient by this theorem.
- An incompatible local type gives a zero typed space and zero faithful image; the surjection then has zero target and implies no full-support or faithfulness assertion for a nonzero deformation ring.
- Specialising the determinant gives `ψε⁻¹` in Pan’s convention and `ψ_T ε` in Tung’s; changing Frobenius alone does not transport either the residual representation or the typed deformation problem.

*Needs:* §1.6; §1.7; §2.7; §§3.2(c), 3.7 (for the deformation-ring quotient); HilbertModularVarietiesAndShimuraCurves R18.3 (quaternion weight); LocalGaloisDeformationRings §3.1 (hodge and galois types); GlobalGaloisDeformations R04.3 (global deformation problem and fixed determinant); AutomorphicGaloisRepresentations §§4.4–4.7 (finite-level local–global compatibility); CompletedCohomologyPartII §3.14 (coefficient module duality); `mathlib:TensorProduct`; `mathlib:Module.Free.`

TUNG-2, §4.1, definition of `S_{ψ,σ}(U, A)`, p. 18; §5.2.1–5.2.2, pp. 26–27; Lemma 5.3.2(3), p. 28: Type-specialised spaces `S_{ψ,σ}(U, A) = Hom_{U_p}(σ, S_ψ(U^p, A))`, the module `σ° ⊗_{O[[K_p]]} M` with its Hecke action via Schikhof duality and Frobenius reciprocity, and, in the non-Eisenstein global deformation setting, condition (3): `R^S_ψ(σ)` finite over O with M(σ)[1/p] faithful.

CEGGPS, Lemma 4.14 and Remark 4.16, pp. 60–61: For the patched module, `M_∞(σ°) ≅ lim_n Hom^cont_{O[[K]]}(M_∞, (σ°/ϖ^n)^∨)^∨`, the type-specialised module, and its comparison with finite-level automorphic forms of type σ.

PAN, Corollary 3.1.3, p. 18: At sufficiently small level the functor of quaternionic forms with coefficients is exact.

### Examples

At weight two the algebraic factor is trivial and the comparison recovers classical `H¹`. In weight three it is the dual of the standard two-dimensional representation; replacing it by the standard representation changes a scalar t to `t⁻¹`. At `p=5` the level-11 form has polynomial `X²−X+5` as computed below. In characteristic p, the upper bound on global Serre weights is weaker than a full weight-part converse, and the `r=p−1` overlap must be removed to apply the good-weight multiplicity formula.

### Dependencies

Layer 1 gives the localised injectivity and vanishing needed for descent. CompletedCohomologyPartII Layers 3 and 6–7 supply duality and coefficient comparisons; ModularCurvesPartII §§14.1, 14.4–14.5, 14.9–14.11 and 15.6–15.10 supply coefficient systems, comparison, boundary, freeness, duality and Ihara; the coefficient/tower multiplicity-one extension is a target here. AutomorphicGaloisRepresentations §§1.1–1.5, 4.3–4.7 and 6.8–6.10 supply classical Galois factors, local compatibility and Hecke determinants; the small-weight local description is a target of the supplier contracts. AlgebraicModularFormsAndSerreWeights R15.4 supplies the numerical recipe and §0.5 the local weight set and Hecke module. HilbertModularVarietiesAndShimuraCurves R18.3 and GL2AutomorphicRepresentationsAndTransfer R17.3 supply the weighted quaternionic comparison.

## Layer 3: hecke and deformation actions


The completed Hecke algebra of the modular tower is Emerton's inverse limit of the faithful degree-one cohomological images. Its compatible-sections construction uses CompletedCohomologyPartII Layer 8 with that explicitly specified image diagram, and its residual projectors agree with the derived construction on the surviving labels. It is localised from `T(K^p)` at an allowable ρ̄ to the complete local noetherian `T_{ρ̄,Σ}`. The Galois determinant over `T(K^p)` is the limit of the finite-level geometric determinants of AutomorphicGaloisRepresentations §6.8, and for absolutely irreducible ρ̄ it comes from a representation `ρ^m_Σ` (Carayol). The universal deformation ring surjects onto `T_{ρ̄,Σ}`; Eichler–Shimura in families factors the Galois action out of completed cohomology, `Ĥ¹_{O,ρ̄,Σ} ≅ ρ^m_Σ ⊗ U_Σ`; crystalline classical points are Zariski dense. The commuting action of G on everything is `T_{ρ̄,Σ}`-linear and ϖ-adically admissible. For the definite quaternion algebra the big Hecke algebra `T_ψ(U^p)` carries only a pseudo-representation in general, and in Pan's residually reducible setting the pseudo-deformation ring surjects onto its Eisenstein localisation; pro-modular primes are those containing the kernel.
### 3.1 Completed Hecke algebra of the modular tower


Fix a tame level `K^p` and let `T(K_pK^p)` be the O-subalgebra of `End_{G_ℚ}(H^1(K_pK^p)_E)` generated by `T_ℓ`, `S_ℓ` for `ℓ ≠ p` unramified in `K^p`; for `K_p′ ⊂ K_p` restriction gives surjections `T(K_p′K^p) → T(K_pK^p)`. Put `T(K^p) = lim_{K_p} T(K_pK^p)` with the projective-limit topology (each `T(K_pK^p)` with its ϖ-adic topology). This uses CompletedCohomologyPartII Layer 8’s compatible-sections construction on the specified finite degree-one cohomological images (and their coefficient quotients), rather than its default derived-image diagram. The arithmetic comparison `heckeAlgebra_cohomologicalImage` identifies this ring with the faithful Hecke action on the completed degree-one tower. It asserts compatibility of the finite-level actions and pullbacks, continuity on the completed lattice, and faithfulness there; it does not identify the derived Hecke ring with this quotient. The ring has these properties: it is topologically generated by `T_ℓ`, `S_ℓ`; it acts faithfully on `Ĥ^1(K^p)_O` and `Ĥ^1(K^p)_E`; it is reduced, commutative, compact, and the product of finitely many complete local O-algebras `T(K^p)_m`, in bijection with the Galois-conjugacy classes of mod-ϖ eigensystems of modular forms of tame level `K^p`, initially with the finite-image profinite topology; for `K^{p′} ⊂ K^p` there is a continuous map `T(K^{p′}) → T(K^p)` compatible with the closed embedding `Ĥ^1(K^p)_E → Ĥ^1(K^{p′})_E`. For ρ̄: `G_ℚ → GL_2(k)` absolutely irreducible, modular and unramified outside `Σ = Σ_0 ∪ {p}`, a compact open `K_{Σ_0} ⊂ G_{Σ_0}` is allowable if `T(K_{Σ_0}) = T(K_{Σ_0}K_0^Σ)` has a maximal ideal m with residue field k and `T_ℓ` ≡ `tr ρ̄(Frob_ℓ)`, `ℓS_ℓ` ≡ `det ρ̄(Frob_ℓ)` mod m (ℓ `∉` Σ); `T(K_{Σ_0})_ρ̄ = T(K_{Σ_0})_m` is a direct factor; for allowable `K′ ⊂ K` the map `T(K′)_ρ̄ → T(K)_ρ̄` is a surjection of profinite local O-algebras; after §3.3 it is a surjection of complete local Noetherian rings, an isomorphism for K sufficiently small; and `T_{ρ̄,Σ} = lim_{K_{Σ_0}} T(K_{Σ_0})_ρ̄` is initially a profinite local O-algebra with residue field k, topologically generated by the `T_ℓ`. Its Noetherianity and maximal-ideal-adic topology are conclusions of §3.3.

The full G-action belongs to the p-level tower, not to an individual finite-level `H¹`. The Hecke algebra is generated by the operators at primes `ℓ ≠ p` unramified in `K^p`; `U_ℓ` at bad primes is adjoined only where a statement says so (Emerton’s `T(K_{Σ_0})^*_ρ̄` in the proof of Theorem 6.2.4). Emerton states that any sufficiently small `K_{Σ_0}` is allowable for modular ρ̄; with ρ̄ assumed modular this uses only that ρ̄ arises at some level divisible by primes in Σ, which for `p > 2` is the weak-to-strong Serre theorem (EM11 Remark 5.2.3); the dependence on Serre’s conjecture enters only if ‘modular’ is replaced by ‘odd’.

Use the following named interfaces:

- `TauCeti.ModularCompletedCohomology.heckeAlgebra` (constructor): `T(K^p) = lim_{K_p} T(K_pK^p)`, using the existing compatible-sections carrier on the finite degree-one cohomological image diagram.
- `TauCeti.ModularCompletedCohomology.heckeAlgebra_cohomologicalImage` (comparison): For the modular tower with its finite-level integral Hecke actions, compatible pullbacks and reduction maps of §§1.1–1.2, compatible operators extend continuously to the completed degree-one lattice; this identifies the inverse limit of these cohomological images with its faithful completed action. The derived ring maps to cohomological images, but this comparison asserts no injectivity for that map.
- `TauCeti.ModularCompletedCohomology.heckeAlgebra_faithful` (characterisation): `T(K^p)` acts faithfully on `Ĥ^1(K^p)_O` and `Ĥ^1(K^p)_E`.
- `TauCeti.ModularCompletedCohomology.heckeAlgebra_productLocal` (structure): `T(K^p) ≅ ∏_m T(K^p)_m` over its finitely many maximal ideals, each factor complete local; `T(K^p)` is reduced and compact.
- `TauCeti.ModularCompletedCohomology.heckeAlgebra_dense` (characterisation): The O-subalgebra generated by the `T_ℓ`, `S_ℓ` is dense in `T(K^p)`.
- `TauCeti.ModularCompletedCohomology.heckeAlgebra_tameMap` (functoriality): For `K^{p′} ⊂ K^p`, a continuous map `T(K^{p′}) → T(K^p)` sending `T_ℓ`, `S_ℓ` to `T_ℓ`, `S_ℓ` and compatible with the closed embedding of `Ĥ^1(K^p)_E`.
- `TauCeti.ModularCompletedCohomology.IsAllowableLevel` (other): A level `K_{Σ_0}` is allowable for ρ̄ if `T(K_{Σ_0})` has a maximal ideal with residue field k matching tr ρ̄ and det ρ̄ at `Frob_ℓ`, `ℓ ∉ Σ`.
- `TauCeti.ModularCompletedCohomology.residualHeckeAlgebra` (constructor): `T_{ρ̄,Σ} = lim` over allowable `K_{Σ_0}` of `T(K_{Σ_0})_ρ̄`.
- `TauCeti.ModularCompletedCohomology.residualHeckeAlgebra_eventuallyConst` (relation): For allowable `K′ ⊂ K`, `T(K′)_ρ̄ → T(K)_ρ̄` is surjective, and an isomorphism once K is contained in the congruence subgroup of level `N_{Σ_0}`.

**Checks.**

- `TauCeti.ModularCompletedCohomology.heckeAlgebra_weightTwo` (computation): At tame level `K_0(11)^p` with `p = 3` and m the non-Eisenstein ideal of the newform of level 11, the image of `T(K^p)_m` in `End(H^1(Y_0(11)(C), ℤ_3)_m)` is `ℤ_3` with `T_ℓ ↦ a_ℓ(f)`.
- `TauCeti.ModularCompletedCohomology.heckeAlgebra_compatibility` (compatibility): Evaluation at any p-level sends a compatible Hecke tuple to its operator on `H¹` at that level. Two tuples inducing the same completed action have equal coordinates, by injectivity of the finite-level pullbacks and density of the p-level colimit. This tests the cohomological image diagram used in `heckeAlgebra_cohomologicalImage`.
- A quotient `k[η]/(η²) → k` has a nilpotent kernel and the same residual maximal ideal, yet η is nonzero in the source. Thus CompletedCohomologyPartII Layer 8’s derived-to-cohomological residual comparison alone cannot give a ring isomorphism, nor identify a further single-degree quotient.
- `TauCeti.ModularCompletedCohomology.heckeAlgebra_noMaximal_degenerate` (degenerate): If ρ̄ does not occur at any level `K_{Σ_0}`, no level is allowable and the limit defining `T_{ρ̄,Σ}` is over the empty system; Emerton’s definition presupposes ρ̄ modular.
- `TauCeti.ModularCompletedCohomology.heckeAlgebra_not_finite` (non-example): `T_{ρ̄,Σ}` is not finite over O: classical points of infinitely many distinct weights occur in `Spec T_{ρ̄,Σ}[1/p]` and are Zariski dense (§3.6), so `T_{ρ̄,Σ}[1/p]` has infinitely many maximal ideals, unlike each finite-level `T(K_pK_{Σ_0})_ρ̄`.

EM11, §5.2–5.3 and §6: `T_{ρ̄,Σ}` is the coefficient ring of `ρ^m_Σ`, `π^m_Σ` and the multiplicity module `X(θ)`. PAN-I, §6.1.1: Pan’s big Hecke algebra `T(K^p)` with its Galois determinant. NAK, §2.1.2: Nakamura’s zeta morphisms are `T_{ρ̄,Σ}`-linear. GL2ModularityLifting §§10.1–10.6 (through Layer 3): Pan’s completed Hecke quotient (input CC2).

A proof proceeds as follows.

1. Form the compatible-sections ring of the finite degree-one Hecke images in EM11 Definition 5.2.1, p. 46. Each compatible tuple acts on the p-level colimit through its coordinates and preserves the integral lattice. Continuity extends the action to the completion. A tuple acting as zero on the completion acts as zero at every finite level, so all its coordinates vanish. The resulting weak-closure description is EM11 footnote 12. CompletedCohomologyPartII Layer 8 supplies this limit construction and residual projectors for the specified diagram; its nilpotent derived-to-all-cohomology comparison is used only for residual labels before the additional degree-one quotient. Labels killed by that quotient are discarded.
2. Semilocality and the product decomposition use CompletedCohomologyPartII Layer 8 on the finite Artinian image factors, giving their inverse-limit topology without Noetherianity. Reducedness follows from normality for the Petersson pairing at finite characteristic-zero levels (ModularCurvesPartII §§14.6–14.7, 14.15). The maximal-ideal-adic topology is deduced only after §3.3 constructs the deformation/pseudodeformation surjection.
3. Lemma 5.2.4 of EM11: surjectivity because the image is closed and contains the topological generators `T_ℓ`; eventual isomorphism because the prime-to-p conductor of every modular lift of ρ̄ unramified outside Σ divides a fixed `N_{Σ_0}` (Carayol, Livné), so both algebras are the same quotient of `R_{ρ̄,Σ}` (see §3.3).
4. After the finite-factor reconstruction of §3.2 and the compact surjection of §3.3, conclude Noetherianity and maximal-ideal-adic completeness; then apply eventual constancy (EM11 Definition 5.2.5).

**Checks.**

- For `K^p = K_1(N)^p` and m attached to a residually irreducible newform of level N and weight 2, `T(K^p)_m` surjects onto the weight-two Hecke algebra `T(K_1(N))_m` acting on `H^1(Y_1(N), O)_m`.
- For ρ̄ the mod 3 representation of the newform of level 11, the level `K_0(11)` away from {3, 11} is allowable.

*Needs:* CompletedCohomologyPartII §8.10 (completed hecke algebra); CompletedCohomologyPartII §8.11 (completed semilocal product); CompletedCohomologyPartII §8.12 (residual hecke projector); CompletedCohomologyPartII §8.15 (derived cohomological residual comparison); §1.1; §1.2; ModularCurvesPartII §14.15 (integral Hecke realization); ModularCurvesPartII §14.7 (hecke twisted self adjoint); ModularCurvesPartII §14.6 (cup product petersson); IntegralHeckeAndGaloisDeterminants IHG.0–IHG.1; `mathlib:RingCat.sectionsSubring`; `mathlib:IsLocalRing`; `mathlib:IsNoetherianRing.`

EM11, §5.2, Definition 5.2.1 and footnote 12, p. 46; Definitions 5.2.2, 5.2.5, Remark 5.2.3, Lemma 5.2.4, pp. 47–48: The completed Hecke algebra `T(K^p)` and its properties (faithful, reduced, compact, a finite product of complete local algebras); allowable levels for ρ̄, the local factors `T(K_{Σ_0})_ρ̄` and their limit `T_{ρ̄,Σ}`, a complete local noetherian O-algebra.

NAK, §2.1.2, pp. 16–17: Nakamura’s `T(K_{Σ_0})`, allowable levels and `T_{ρ̄,Σ}`, as consumed by the zeta morphisms.

PAN, Proposition 3.3.6 and Corollary 3.3.7, p. 24: For a pro-p level the completed Hecke algebra has the same maximal ideals as the finite-level one (Gee–Newton Lemma 2.1.14), hence is semilocal and a product of its localisations.

### 3.2 Hecke-valued Galois determinant and representation


(a) For every tame level `K^p` there is a unique continuous two-dimensional determinant `D_{K^p}`: `O[G_{ℚ,Σ(K^p)}] → T(K^p)` (in the sense of Chenevier) with characteristic polynomial `X^2 − T_ℓX + ℓS_ℓ` at `Frob_ℓ` for `ℓ ∉ Σ(K^p)` (geometric Frobenius), compatible with `T(K^{p′}) → T(K^p)`; its specialisation at λ: `T(K^p) → ℚ̄_p` is the determinant of a semisimple odd `ρ_λ`: `G_{ℚ,Σ} → GL_2(ℚ̄_p)` with `det ρ_λ(Frob_ℓ) = ℓλ(S_ℓ)` and `tr ρ_λ(Frob_ℓ) = λ(T_ℓ)`. (b) If ρ̄ is absolutely irreducible and `K_{Σ_0}` is allowable, there is a unique deformation `ρ(K_{Σ_0})`: `G_ℚ → GL_2(T(K_{Σ_0})_ρ̄)` of ρ̄, unramified outside Σ, with `tr ρ(K_{Σ_0})(Frob_ℓ) = T_ℓ` and `det ρ(K_{Σ_0})(Frob_ℓ) = ℓS_ℓ`; passing to the limit gives `ρ^m_Σ`: `G_ℚ → GL_2(T_{ρ̄,Σ})`, which equals `ρ(K_{Σ_0})` for `K_{Σ_0}` small. For 𝔭 `∈ Spec T_{ρ̄,Σ}`, ρ(𝔭)° `= ρ^m_Σ/𝔭ρ^m_Σ` is `a G_ℚ-stable` lattice, free of rank two over `T_{ρ̄,Σ}/𝔭`, and `ρ(𝔭) = κ(𝔭) ⊗ ρ^m_Σ`. (c) The analogous objects exist for the definite quaternionic Hecke algebra (§3.7): a pseudo-representation `T_ψ`: `G_{F,S} → T_ψ(U^p)` with determinant `ψε^{-1}`, and for absolutely irreducible residual trace a lifting of that same pseudo-representation with the same determinant `ψε^{-1}`. Separately, in Tung’s convention a central character `ψ_T` gives a Hecke representation with determinant `ψ_T ε`. These conventions are kept separate until a duality and Hecke/reciprocity dictionary is supplied; merely changing Frobenius does not identify the two representations.

Absolute irreducibility of ρ̄ is required in (b) and in the lifting of (c); for residually reducible ρ̄ only the determinant (pseudo-representation) exists over T, and §3.8 treats it. At modular classical points, `V_f` is the geometric/cohomological representation of AutomorphicGaloisRepresentations §1.5, so the geometric Frobenius polynomial is `X^2 − a_ℓX + χ(ℓ)ℓ^{k−1}`. Its dual gives the arithmetic representation of AutomorphicGaloisRepresentations §1.5. In this convention the determinant is `ℓS_ℓ`, as also fixed by the residual condition of EM11 Definition 5.2.2 and Nakamura §2.1.2, p. 17. For quaternionic representations distinguish Pan’s determinant `ψε^{-1}` from Tung’s determinant `ψ_T ε`, including the Colmez twist of Pan Remark 3.5.3.

Use the following named interfaces:

- `TauCeti.ModularCompletedCohomology.heckeDeterminant` (constructor): The continuous two-dimensional determinant `D_{K^p}` on `O[G_{ℚ,Σ(K^p)}]` valued in `T(K^p)`.
- `TauCeti.ModularCompletedCohomology.heckeDeterminant_charpoly` (simp): The characteristic polynomial of `D_{K^p}` at `Frob_ℓ` is `X^2 − T_ℓX + ℓS_ℓ` for `ℓ ∉ Σ(K^p)`.
- `TauCeti.ModularCompletedCohomology.heckeDeterminant_tame` (functoriality): `D_{K^{p′}}` pushed along `T(K^{p′}) → T(K^p)` is `D_{K^p}` restricted to `G_{ℚ,Σ(K^p)}`.
- `TauCeti.ModularCompletedCohomology.heckeRepresentation` (constructor): `ρ^m_Σ`: `G_ℚ → GL_2(T_{ρ̄,Σ})` for absolutely irreducible ρ̄, unique up to conjugation.
- `TauCeti.ModularCompletedCohomology.heckeRepresentation_trace` (simp): `tr ρ^m_Σ(Frob_ℓ) = T_ℓ` and `det ρ^m_Σ(Frob_ℓ) = ℓS_ℓ` for `ℓ ∉ Σ`.
- `TauCeti.ModularCompletedCohomology.heckeRepresentation_reduction` (compatibility): `ρ^m_Σ` mod `m_{T} ≅ ρ̄`.
- `TauCeti.ModularCompletedCohomology.specialisation` (constructor): ρ(𝔭)° `= ρ^m_Σ/𝔭` and `ρ(𝔭) = κ(𝔭) ⊗ ρ^m_Σ` for 𝔭 `∈ Spec T_{ρ̄,Σ}`.
- `TauCeti.ModularCompletedCohomology.specialisation_classical` (compatibility): At a classical point attached to a newform f, `ρ(𝔭) ≅ V_f`.

**Checks.**

- `TauCeti.ModularCompletedCohomology.heckeRepresentation_det` (computation): At a weight-two point f with nebentypus χ, `det V_f(Frob_ℓ) =` ℓχ(ℓ), and in weight k it is `χ(ℓ)ℓ^{k−1}`. Thus neither the missing factor ℓ nor a weight-independent cyclotomic-times-finite-order formula for the universal determinant passes specialisation.
- `TauCeti.ModularCompletedCohomology.heckeRepresentation_compatibility` (compatibility): Composing `ρ^m_Σ` with `T_{ρ̄,Σ} → T(K_pK_{Σ_0})_ρ̄` gives the representation reconstructed from the finite integral cohomological Hecke determinant (AutomorphicGaloisRepresentations §§6.8–6.9). This comparison does not impose the fixed cyclotomic determinant or semistable hypotheses of AutomorphicGaloisRepresentations §6.6’s separate classical type-Σ Hecke representation target.
- `TauCeti.ModularCompletedCohomology.heckeDeterminant_factor` (degenerate): Pushing `D_{K^p}` along the projection `T(K^p) → T(K^p)_m` onto one local factor gives the determinant whose characteristic polynomials are the images of `X² − T_ℓX + ℓS_ℓ`, and the other factors are killed; at a factor with reducible residual determinant no representation over `T(K^p)_m` is asserted. The ring `T(K^p)` itself is never zero: it acts faithfully on `Ĥ^1(K^p)_O`, which contains the nonzero `H^1(Y(K_pK^p), O)` for small `K_p`.
- `TauCeti.ModularCompletedCohomology.heckeRepresentation_reducible_nonexample` (non-example): For a residually reducible maximal ideal the trace `D(Frob_ℓ) = T_ℓ` need not come from a representation over `T_m`; requiring one would exclude Pan’s Eisenstein case.

EM11, §6.1: `ρ^m_Σ|G_{ℚ_p}` determines the deformation `π^m_Σ` of π̄ through Kisin’s equivalence, and `ρ^m_Σ|G_{ℚ_ℓ}` the family `π_{Σ_0}(ρ^m_Σ)`. EM11, Proposition 5.5.3: `Ĥ^1_{O,ρ̄,Σ} ≅ ρ^m_Σ ⊗ U_Σ`. PAN-I, §6.1.1: The determinant `D_S` over `T(K^p)` and the representations `ρ_λ` at its points. GL2ModularityLifting §§9.1–9.3 (through Layer 3): Tung’s Hecke-valued representation with determinant `ψ_T ε` (input CC2), kept separate from Pan’s `ψε^{-1}` normalisation.

A proof proceeds as follows.

1. (a): at each finite level `T(K_pK^p)` acts on `H^1` and the geometric Hecke determinant of AutomorphicGaloisRepresentations §6.8 (geometric hecke determinant) gives a determinant over `T(K_pK^p)` with the stated characteristic polynomials. Assemble the compatible finite coefficient quotients by IntegralHeckeAndGaloisDeterminants §4.2 (compatible inverse-limit interpolation), using only §3.1’s profinite cohomological Hecke ring and its finite Artinian image quotients. Continuity uses a common finite Galois quotient at each finite coefficient level. IntegralHeckeAndGaloisDeterminants IHG.0’s continuous-determinant-dense criterion gives uniqueness; it is not the inverse-limit existence theorem. No tensor product is commuted with an inverse limit.
2. Specialisation: a determinant over ℚ̄_p is the determinant of a unique semisimple representation (IntegralHeckeAndGaloisDeterminants §1.2’s algebraically closed reconstruction); oddness from the classical points (EM-PAMQ Proposition 7.3.17).
3. (b): over each finite Artinian local image quotient of `T(K_pK_{Σ_0})_ρ̄` with absolutely irreducible residual determinant, reconstruct a representation, unique up to strict conjugacy; choose compatible bases before taking the inverse limit (Carayol; IntegralHeckeAndGaloisDeterminants §1.3’s Henselian irreducible reconstruction and ArithmeticGaloisRepresentations §5.10 (GaloisRep.carayol_conj_of_trace_eq)); pass to the limit (EM11 discussion before Lemma 5.2.4 and Definition 5.2.7; AutomorphicGaloisRepresentations §6.9 (determinants and representability over a hecke algebra)).
4. (c): Pan 3.3.5 constructs a pseudo-representation with determinant `ψε^{-1}`. The irreducible-residual reconstruction of IntegralHeckeAndGaloisDeterminants §1.3 gives a representation with that same determinant. Tung-2 Proposition 4.2.5 separately constructs the `ψ_T` ε-normalised representation. Their actions cannot be identified without a character, dual and Hecke-operator dictionary; prove `panTungGaloisNormalization` before transporting either action.

**Checks.**

- At a classical point 𝔭 attached to a newform f, `ρ(𝔭) ≅ V_f` in the normalisation of §2.5.
- Non-example: for ρ̄ `= 1 ⊕` ε̄ there is no `GL_2(T_m)-valued` representation with the given traces in general; only the determinant exists.

*Needs:* §3.1 (profinite construction and finite Artinian factors only); AutomorphicGaloisRepresentations §6.8 (geometric hecke determinant); AutomorphicGaloisRepresentations §6.9 (determinants and representability over a hecke algebra); AutomorphicGaloisRepresentations §6.10 (hecke algebra representation quaternionic); IntegralHeckeAndGaloisDeterminants IHG.0–IHG.1 (laws and reconstruction); IntegralHeckeAndGaloisDeterminants §4.2 (compatible inverse-limit interpolation); ArithmeticGaloisRepresentations §5.10 (GaloisRep.carayol_conj_of_trace_eq); `mathlib:Matrix.GeneralLinearGroup`; `mathlib:Field.absoluteGaloisGroup.`

EM11, §5.2 before Lemma 5.2.4, p. 47; Definitions 5.2.7 and 5.2.9, pp. 48–49: Construction of the deformation `ρ(K_{Σ_0})` of ρ̄ over `T(K_{Σ_0})_ρ̄` as a limit of Carayol’s finite-level deformations, the representation `ρ^m_Σ` over `T_{ρ̄,Σ}`, and the specialisations ρ(𝔭)°, ρ(𝔭).

PAN, 3.3.5, p. 24: A two-dimensional pseudo-representation of `G_{F,S}` valued in the definite quaternionic big Hecke algebra, with determinant `ψε^{-1}`.

TUNG-2, Lemma 4.2.4 and Proposition 4.2.5, pp. 19–20: Semilocality of the quaternionic big Hecke algebra and the lifting `ρ_m` to `GL_2(T^S_ψ(U^p)_m)` for non-Eisenstein m, of the prescribed type with determinant ψε.

DLB, Définition 5.2 and §5.1 after Définition 5.3, pp. 25–26: Representations associated with a Hecke morphism, modular residual representations, and `r^m = lim r^m(K_p)` over the localised quaternionic Hecke algebra A by Carayol’s theorem.

CDN, Before Proposition 4.12, p. 51: ρ̄ deforms to `ρ_m` over `T(U^p)_m` with characteristic polynomial `X^2 − T_vX + N(v)S_v` at `Frob_v` (Scholze, Proposition 5.7).

### 3.3 The deformation-to-Hecke surjection


(a) Let ρ̄ be absolutely irreducible and modular, unramified outside Σ, and `R_{ρ̄,Σ}` the universal deformation ring of ρ̄ for deformations unramified outside Σ (and ∞). There is a unique local surjection `φ_Σ`: `R_{ρ̄,Σ} → T_{ρ̄,Σ}` with `φ_Σ(tr ρ^u(Frob_ℓ)) = T_ℓ` and `φ_Σ(ℓ^{-1} det ρ^u(Frob_ℓ)) = S_ℓ` for `ℓ ∉ Σ`; it is the limit of compatible surjections `φ(K_{Σ_0})`: `R_{ρ̄,Σ} → T(K_{Σ_0})_ρ̄`, and `ρ^m_Σ` is the pushforward of `ρ^u`. (b) For a residual pseudo-representation t̄ `= 1 +` χ̄ of `G_{F,S}` (F totally real, Pan §4.1) let `R^{ps}` be the universal two-dimensional pseudo-deformation ring of t̄ with determinant χ; the pseudo-representation `T_m` of §3.2(c) induces a surjection `R^{ps} → T_m`, which factors through the quotient `R^{ps,{ξ_v}}` imposing `T_m|_{I_{F_v}} = ξ_v + ξ_v^{-1}` at `v ∈ S∖Σ_p`.

`R_{ρ̄,Σ}` parametrises deformations over complete local noetherian O-algebras with residue field k; it exists since ρ̄ is absolutely irreducible. In (b) the factorisation through `R^{ps,{ξ_v}}` uses classical local–global compatibility at `v ∉ Σ_p` at finite levels, after twisting to a finite-order central character.

A proof proceeds as follows.

1. (a): apply LocalGaloisDeformationRings §F.2.5 to the compatible representations over the finite Artinian local image factors constructed in §3.2. Their universal maps are compatible, independently of basis by strict conjugacy. Trace/determinant generation makes them surjective. Compactness of the universal ring gives a surjection to the inverse limit: the fibres over any compatible tuple are nonempty closed sets with the finite intersection property. This constructs `φ(K_{Σ_0})` and `φ_Σ` before using Noetherianity of their targets (EM11 (5.2.6)).
2. (b): use LocalGaloisDeformationRings §F.2.11 at each finite Artinian local image factor, with the determinant laws of IntegralHeckeAndGaloisDeterminants IHG.0–IHG.1; the same compactness argument gives `R^{ps}↠T_m`. Trace generation gives surjectivity (Pan 4.1.3).
3. The factorisation through `R^{ps,{ξ_v}}` is classical local–global compatibility at `v ∈ S∖Σ_p` for quaternionic forms at finite level (AutomorphicGaloisRepresentations §4.4 (all hilbert local global compatibility)), passed to the limit, after twisting ψ to finite order (Pan 4.1.3, referring to 3.3.3).

The quotient of a complete Noetherian local universal ring is Noetherian. A continuous surjection from a compact ring to the Hausdorff profinite target is a quotient map; closed ideals and the finite residue field identify the quotient topology with the maximal-ideal-adic topology. This proves `TauCeti.ModularCompletedCohomology.residualHeckeAlgebra_localNoetherian`: `T_{ρ̄,Σ}` is complete local Noetherian with residue field k. Apply the same argument with R^ps to the remaining residual factors of §3.1 and the quaternionic ring of §3.7.

**Checks.**

- A profinite local ring need not be Noetherian: the square-zero ring `k⊕∏_{i≥1}kεᵢ`, with `(∏kεᵢ)²=0` and the product topology is an inverse limit of finite Artinian local rings with an infinite-dimensional cotangent space. The universal-ring surjection supplies the extra finiteness.
- Under Böckle’s hypotheses `φ_Σ` is an isomorphism (§6.2).
- At a classical point 𝔭 of `T_{ρ̄,Σ}` the composite `R_{ρ̄,Σ} → κ(𝔭)` classifies ρ(𝔭).

*Needs:* §3.2; §3.1; LocalGaloisDeformationRings §F.2.5 (universal deformation ring); LocalGaloisDeformationRings §§F.2.4–F.2.5 (chosen continuous universal lift); LocalGaloisDeformationRings §§F.1.9–F.1.10, F.2.8, F.2.11 (continuous determinant deformations); IntegralHeckeAndGaloisDeterminants IHG.0–IHG.1; AutomorphicGaloisRepresentations §4.4 (all hilbert local global compatibility).

EM11, §5.2 after Remark 5.2.3, p. 47; (5.2.6) and the paragraph after Definition 5.2.5, p. 48: The universal deformation ring `R_{ρ̄,Σ}` is topologically generated by traces of Frobenius; `φ(K_{Σ_0})` is surjective; passing to the limit gives `φ_Σ`: `R_{ρ̄,Σ} → T_{ρ̄,Σ}`.

NAK, §2.1.2, p. 17: Nakamura records the surjection `φ_Σ`: `R_{ρ̄,Σ} → T_{ρ̄,Σ}`.

PAN, 4.1.3, p. 38: The natural pseudo-representation over `T_m` with determinant χ, the universal pseudo-deformation ring `R^{ps}`, the surjection `R^{ps} → T_m` and its factorisation through `R^{ps,{ξ_v}}` by classical local–global compatibility at `v ∈ S∖Σ_p`.

### 3.4 The ρ̄-part of completed cohomology and its commuting actions


Let ρ̄ be absolutely irreducible and modular and, for `A ∈` {O, E} and allowable `K_{Σ_0}`, `Ĥ^1(K_{Σ_0})_{A,ρ̄} = T(K_{Σ_0})_ρ̄ ⊗_{T(K_{Σ_0})} Ĥ^1(K_{Σ_0})_A` (a direct summand, equal to the m-adic completion for `A = O`) and `Ĥ^1_{A,ρ̄,Σ} = colim_{K_{Σ_0}} Ĥ^1(K_{Σ_0})_{A,ρ̄}`, `a G_ℚ × G × G_{Σ_0}-stable` direct summand of `Ĥ^1_{A,Σ}` on which these actions are `T_{ρ̄,Σ}`-linear and commute. Then: (a) `Ĥ^1(K_{Σ_0})_{O,ρ̄}/ϖ^s ≅ H^1(K_{Σ_0})_{O/ϖ^s,ρ̄}` and `Ĥ^1_{O,ρ̄,Σ}/ϖ^s ≅ H^1_{O/ϖ^s,ρ̄,Σ}`; (b) `Ĥ^1(K_{Σ_0})_{O,ρ̄}` is a ϖ-adically admissible G-representation over `T_{ρ̄,Σ}` (every element of `Ĥ^1_{O,ρ̄,Σ}/ϖ^i` is killed by a power of the maximal ideal); (c) `Ĥ^1(K_{Σ_0})_{A,ρ̄} ≅ (Ĥ^1_{A,ρ̄,Σ})^{K_{Σ_0}}`, and for `K_p` compact open with `K_pK_{Σ_0}K_0^Σ` neat (or ρ̄ not induced from `ℚ(√−1)`, `ℚ(√−3)`), `H^1(K_pK_{Σ_0}K_0^Σ)_{A,ρ̄} ≅ (Ĥ^1(K_{Σ_0})_{A,ρ̄})^{K_p}`; (d) `H^1_{O/ϖ^s,ρ̄,Σ}` is an admissible smooth `G × G_{Σ_0}`-representation over `O/ϖ^s`; (e) `(Ĥ^1_{E,ρ̄,Σ})^{K_p}` is finitely generated over `E[G_{Σ_0}]` and `(H^1_{k,ρ̄,Σ})^{K_p}` over `k[G_{Σ_0}]`.

ρ̄ absolutely irreducible and modular; Σ ∋ p contains the primes where ρ̄ ramifies. (e) uses that the prime-to-p conductors of modular lifts unramified outside Σ are bounded (Carayol, Livné) and that the p-part of the conductor is bounded by `K_p`.

A proof proceeds as follows.

1. The ρ̄-part is the residual summand of CompletedCohomologyPartII §8.13 (completed residual localisation) at the label m, identified with Emerton’s `T(K_{Σ_0})_ρ̄ ⊗ (−)` by §3.1; localisation commutes with the limits (§8.14 (localisation limit support dual compatibility)), giving (a) from (5.1.2) (EM11 (5.3.3)–(5.3.4)).
2. (b): a direct summand of a ϖ-adically admissible representation is admissible, and the m-power torsion statement follows from (a) (EM11 Lemma 5.3.5).
3. (c): rational part from EM06 Proposition 2.2.13 and (4.3.4) (EM11 Lemma 5.3.6); integral part is §1.4(b) (EM11 Lemma 5.3.8, Remark 5.3.10).
4. (d) from (c) and finiteness at fixed level (EM11 Proposition 5.3.11); (e) from boundedness of conductors, finiteness of classical lifts of bounded conductor in weight two, and §2.1 (EM11 Proposition 5.3.13, Corollary 5.3.14).

**Checks.**

- For a two-factor cohomological Hecke ring `T=T₁×T₂` and a module `H=H₁⊕H₂` with the corresponding action, localisation at a residual ideal of `T₁` gives `H₁`, and the projector (1,0) kills `H₂`. Localising at the other factor instead gives `H₂`; neither operation is the identity on H in general.
- If `H₁=0` in this model, the first residual summand is zero even when `H₂≠0`. Conversely if T is already local, its only residual projector is 1 and the summand is H. These cases distinguish localisation from taking m-torsion.
- For `K_p = GL_2(ℤ_p)`, (c) recovers `H^1(GL_2(ℤ_p)K_{Σ_0}K_0^Σ)_{O,ρ̄}`, the weight-two level-prime-to-p cohomology localised at ρ̄.

*Needs:* §3.1; §1.4; §2.1; CompletedCohomologyPartII §8.13 (completed residual localisation); CompletedCohomologyPartII §8.14 (localisation limit support dual compatibility); `mathlib:Module.Finite.`

EM11, Definitions 5.3.1–5.3.2 and (5.3.3)–(5.3.4), p. 49; Lemmas 5.3.5–5.3.6, pp. 49–50; Proposition 5.3.11, Proposition 5.3.13, Corollary 5.3.14, pp. 51–52: The ρ̄-part of completed cohomology at allowable levels and in the limit, its reduction mod `ϖ^s`, ϖ-adic admissibility over `T_{ρ̄,Σ}`, recovery of finite levels as invariants, admissibility of the torsion objects, and finite generation over the group ring of `G_{Σ_0}`.

### 3.5 Galois factorisation of completed cohomology


Let ρ̄ be absolutely irreducible and modular, `U_Σ = Hom_{T_{ρ̄,Σ}[G_ℚ]}(ρ^m_Σ, Ĥ^1_{O,ρ̄,Σ})` with its `G × G_{Σ_0}`-action. (a) The evaluation map `ρ^m_Σ ⊗_{T_{ρ̄,Σ}} U_Σ → Ĥ^1_{O,ρ̄,Σ}` is `a T_{ρ̄,Σ}[G_ℚ × G × G_{Σ_0}]`-linear isomorphism, and reducing mod ϖ and taking m-torsion gives ρ̄ `⊗_k (U_Σ/ϖ)[m] ≅ H^1_{k,ρ̄,Σ}[m]`. (b) (Eichler–Shimura in families) Let ρ: `G_ℚ → GL_2(E)` be continuous, absolutely irreducible, unramified outside Σ, `K_{Σ_0} ⊂ G_{Σ_0}` compact open and 𝔭 the ideal of `T(K_{Σ_0})[1/p]` generated by `T_ℓ − tr ρ(Frob_ℓ)`, `ℓ ∉ Σ`. Then `Hom_{E[G_ℚ]}(ρ, Ĥ^1(K_{Σ_0})_E[𝔭]) = Hom_{E[G_ℚ]}(ρ, Ĥ^1(K_{Σ_0})_E)`; in particular if `Hom_{E[G_ℚ]}(ρ, Ĥ^1_{E,Σ}) ≠ 0` then ρ is promodular, and for every closed point 𝔭 `∈ Spec T_{ρ̄,Σ}[1/p]` the inclusions `Hom(ρ(𝔭), Ĥ^1_{E,ρ̄,Σ}[𝔭]) ⊂ Hom(ρ(𝔭), Ĥ^1_{E,ρ̄,Σ}) ⊂ Hom(ρ(𝔭), Ĥ^1_{E,Σ})` are equalities. (c) In Pan’s formulation, let λ: `T(K^p) → E` be an eigensystem with absolutely irreducible `ρ_λ`. Then `panGaloisFactorisation` is the evaluation isomorphism `ρ_λ(−1) ⊗_E Hom_{E[G_ℚ]}(ρ_λ(−1), Ĥ¹(K^p)_E) ≅ Ĥ¹(K^p)_E[λ]`, equivariant for `G_ℚ × G`. Coefficient extension gives the corresponding `ℚ̄_p` formulation.

(a) needs ρ̄ absolutely irreducible; (b) needs ρ absolutely irreducible but no residual hypothesis. In (c), Pan defines `tr ρ_λ(Frob_ℓ)=ℓ⁻¹λ(T_ℓ)` and `det ρ_λ(Frob_ℓ)=ℓ⁻¹λ(S_ℓ)`. Since `ε(Frob_ℓ)=ℓ⁻¹`, the twist `ρ_λ(−1)` has trace `λ(T_ℓ)` and determinant `ℓλ(S_ℓ)`, matching the Eichler–Shimura polynomial on `H¹`. These formulas fix the conversion explicitly (PAN-I §6.1.1, pp. 67–68; PAN-II §7.1.4, pp. 116–117).

A proof proceeds as follows.

1. (a): the invariants of both sides at an allowable `K_{Σ_0}` are the finite-level spaces (§3.4(c)); after inverting p the map has dense image because at classical points the locally algebraic vectors are sums of copies of ρ(𝔭) (§2.1) and these are dense (§2.2); both sides are admissible, so the image is closed (Schneider–Teitelbaum), hence surjective; injectivity mod ϖ on m-torsion holds since ρ̄ `⊗ Hom(ρ̄, −) → (−)` is injective for absolutely irreducible ρ̄; conclude by EM11 Lemma 3.1.6 (EM11 Proposition 5.5.3, Corollary 5.5.9; the finite-level analogue is Carayol’s Theorem 4).
2. (b): `Frob_ℓ ↦ ℓS_ℓ` extends to a continuous character of `G_{ℚ,Σ}`. Subtracting the Cayley–Hamilton polynomial of `ρ(Frob_ℓ)` from the Eichler–Shimura polynomial on `H^1` gives `ρ(Frob_ℓ)(v) ⊗ (T_ℓ − tr ρ(Frob_ℓ))u = v ⊗ (ℓS_ℓ − det ρ(Frob_ℓ))u` on `ρ ⊗ U`. At non-scalar `ρ(Frob_ℓ)` both factors vanish, and Chebotarev extends to all `ℓ ∉ Σ` (EM11 Proposition 6.1.12, Remark 6.1.15, Corollary 6.1.16). This is the sign determined by `X²−TX+D`: the two deviations lie on opposite sides of the equality.
3. For (c), (b) puts every multiplicity map in the λ-part. The converse assertion that the entire λ-part is isotypic uses the Eichler–Shimura relation and the Boston–Lenstra–Ribet theorem for the absolutely irreducible factor `ρ_λ(−1)`; it is an additional step, not a consequence of the Hom-space equality alone (PAN-I §6.1.1, pp. 67–68; PAN-II §7.1.4, p. 117).

**Checks.**

- For `ρ = V_f` attached to a newform f of tame level `K_{Σ_0}`, `Hom(V_f, Ĥ^1(K_{Σ_0})_E)` is the `𝔭_f-part` and is nonzero.
- If the target cohomology eigenspace is zero, its multiplicity space is zero and evaluation is the isomorphism `0 → 0`; absolute irreducibility alone does not assert nonvanishing.
- For Pan’s two eigenvalues α,β at geometric Frobenius, twisting by `(−1)` multiplies both by ℓ: their sum changes from `ℓ⁻¹λ(T_ℓ)` to `λ(T_ℓ)`, and their product from `ℓ⁻¹λ(S_ℓ)` to `ℓλ(S_ℓ)`. Omitting the twist fails both tests.
- For a Frobenius matrix `diag(1,2)`, write `T=3+x` and `D=2+y`. Substitution into `X²−TX+D` gives `diag(y−x,y−2x)`; hence the deviation identity is `ρ·x=1·y`, and its two coordinates force `x=y=0`. This pins the subtraction sign independently of the displayed relation in EM11 (6.1.14).
- Non-example: for reducible `ρ = ψ_1 ⊕ ψ_2` the absolutely irreducible isotypy theorem does not apply; the Eichler–Shimura argument cannot use a nonscalar matrix on every nonzero constituent.

*Needs:* §3.4; §3.2; §2.1; §2.2; CompletedCohomologyPartII §5.4 (banach admissibility); AutomorphicGaloisRepresentations §1.1 (geometric construction and the eichler congruence relation).

EM11, §5.5, (5.5.1)–(5.5.2), Proposition 5.5.3, Corollary 5.5.9, Remarks 5.5.10–5.5.11, pp. 56–58: The Galois action factors out of the ρ̄-part: `Ĥ^1_{O,ρ̄,Σ} ≅ ρ^m_Σ ⊗ U_Σ`, proved by density at classical points, closedness of images of admissible maps, and injectivity mod ϖ on m-torsion.

EM11, Proposition 6.1.12 and its proof, p. 68; Remark 6.1.15 and Corollary 6.1.16, p. 69: For absolutely irreducible ρ, every `G_ℚ-map` from ρ into `Ĥ^1(K_{Σ_0})_E` lands in the 𝔭-eigenspace (Eichler–Shimura relations); nonvanishing forces promodularity.

PAN-I, §6.1.1, pp. 67–68; PAN-II, §7.1.4, pp. 116–117: The normalized determinant, the cohomological `(−1)` twist, Hom-space equality and the additional absolutely irreducible isotypy argument.

### 3.5a Jacquet eigenvarieties and allowable deformations

Let ρ̄ be absolutely irreducible and modular. A closed point 𝔭 `∈ Spec T_{ρ̄,Σ}[1/p]` is classical if its eigensystem is that of a classical cuspform of weight `k ≥ 2`; `C ⊂ Spec T_{ρ̄,Σ}[1/p]` is the set of classical points whose Galois representations are crystalline at p, and `C(K_{Σ_0})` its analogue at level `K_{Σ_0}`. A closed point is allowable if it is classical and `ρ(𝔭)|G_{ℚ_p}` is crystabelline, absolutely irreducible and not exceptional (not a twist of a crystalline representation whose Frobenius polynomial has a double root).

Import eigencurve charts, coherent eigensymbols, finite-slope eigenforms and classicality from PadicFamilies §§2.4–2.10. For the localized modular completed cohomology, construct `jacquetEigenvariety` A(K^p)_ρ̄ from J_B of its locally analytic vectors: its coherent finite-slope sheaf on weight/Hecke charts, torus characters, Hecke eigenspaces, chart gluing and tame-level maps. Prove `jacquetEigenvariety_comparison` with the supplied eigencurve and finite-slope eigenforms, keeping the character twists and generalized eigenspaces of EM-PAMQ §§7.5.1–7.5.8. Under the neatness, residual irreducibility and regular-representation hypotheses of §1.4(d), prove `jacquetEigenvariety_dimension`: equidimensionality of dimension two for the full torus-character space, with no embedded primes and every nonzero local section supported in dimension two; the usual one-dimensional eigencurve is recovered after fixing the central twist (EM11 §7.2, pp. 94–95).

Prove `allowablePoint_deformation`: each point of C is a limit, in these supplied finite-slope charts with the appropriate twists, of classical crystabelline points with absolutely irreducible local Galois representation and distinct crystalline Frobenius roots (EM11 Lemma 5.4.9, pp. 55–56). This precedes §3.6(c); the Jacquet-spectrum/eigenform comparison precedes §6.1.

**Checks.**

- A double-root crystalline point can lie in the closure of allowable points but is itself excluded from allowability.
- Fixing a central twist removes one dimension; confusing the full two-dimensional Jacquet spectrum with the eigencurve fails this test.
- Generalized Hecke eigenspaces retain nilpotent Hecke action; replacing the coherent sheaf by a set of eigenvalues loses it.
- A classical Steinberg point is not crystalline and is outside the starting set of the allowable-deformation statement.

*Needs:* §0.1 (Jacquet functor); §1.4(d); §§2.1–2.2; §2.5; §§3.1–3.2 (Hecke/Galois actions); PadicFamilies §§2.4–2.10.

### 3.6 Classical points and their Zariski density


Let ρ̄ be absolutely irreducible and modular, with the classical points, the crystalline classical points C and `C(K_{Σ_0})`, and the allowable points of §3.5a. Then: (a) `⊕_{𝔭∈C(K_{Σ_0})} Ĥ^1(K_{Σ_0})_{E,ρ̄}[𝔭]_{l.alg}` is dense in `Ĥ^1(K_{Σ_0})_{E,ρ̄}`, and `⊕_{𝔭∈C} Ĥ^1_{E,ρ̄,Σ}[𝔭]_{l.alg}` is dense in `Ĥ^1_{E,ρ̄,Σ}`; (b) C is Zariski dense in `Spec T_{ρ̄,Σ}`; (c) the allowable points are Zariski dense in `Spec T(K_{Σ_0})_ρ̄` and in `Spec T_{ρ̄,Σ}`; (d) for each compact open `K_p`, `T_{ρ̄,Σ} → T(K_pK_{Σ_0}K_0^Σ)_ρ̄` is surjective and the classical points of weight two and level `K_p` are the closed points of `Spec T(K_pK_{Σ_0})_ρ̄[1/p]`.

Absolutely irreducible modular ρ̄. (c) uses §3.5a’s `allowablePoint_deformation`, proved on the PadicFamilies §§2.4–2.10 eigencurve charts, to deform a non-allowable classical point to allowable ones; the identification of classical points with prime-to-p conductor and crystalline points is Saito’s theorem.

A proof proceeds as follows.

1. (a): by §2.2 the `GL_2(ℤ_p)-algebraic` vectors are dense; their E[G]-span is the sum of the locally algebraic parts at classical points of prime-to-p conductor, which by Saito’s theorem are exactly `C(K_{Σ_0})` (EM11 Corollary 5.4.5).
2. (b): an element `t ∈ ∩_{𝔭∈C}` 𝔭 kills a dense subspace, hence `Ĥ^1_{E,ρ̄,Σ}`, and `T_{ρ̄,Σ}` acts faithfully, so `t = 0` (EM11 Corollary 5.4.6).
3. (c): every point of `C(K_{Σ_0})` is a limit of allowable points along the eigencurve; combine with (b) and the eventual isomorphism `T(K_{Σ_0})_ρ̄ ≅ T_{ρ̄,Σ}` (EM11 Definition 5.4.7, Lemma 5.4.9).
4. (d) is the surjectivity of §3.1 onto each finite level and §2.5.

**Checks.**

- The point of the weight-two newform of level 11 at `p = 3` is classical and crystalline (good reduction at 3), hence in C.
- Non-example: a classical point of weight 2 with Steinberg local component at p is classical but not in C.
- A crystalline Frobenius polynomial `(X−α)(X−β)` with `α≠β` has no double root, whereas `(X−α)²` does, whether its matrix is scalar or a Jordan block. Thus the exceptional test concerns the polynomial, not just failure of diagonalisation. A crystabelline classical point with reducible local Galois representation also fails the separate absolute-irreducibility requirement for allowability.

*Needs:* §2.2; §2.5; §3.4; §3.1; §3.5a (allowablePoint_deformation); PadicFamilies §§2.4–2.10; AutomorphicGaloisRepresentations §§4.5–4.6 (potential semistability and compatibility at the coefficient prime); `mathlib:PrimeSpectrum.zeroLocus.`

EM11, Definitions 5.2.8, 5.4.4, 5.4.7; Corollaries 5.4.5–5.4.6; Remark 5.4.8; Lemma 5.4.9, pp. 48, 55–56: Classical, crystalline and allowable closed points of `Spec T_{ρ̄,Σ}[1/p]`; density of the locally algebraic eigenspaces at crystalline classical points; Zariski density of C and of the allowable points.

EM11, Definition 3.3.18, p. 27: A representation is exceptional if it is a twist of a crystalline representation whose Frobenius on the Dieudonné module has a double root.

### 3.7 Hecke algebra of the definite quaternionic tower


In the setting of §1.6, fix a finite set S of places containing those above p, the infinite places and those where `U^p` or D ramify, and let `T_S^{univ} = O[T_v`, `S_v]_{v∉S} (T_v`, `S_v` the double cosets of `diag(ϖ_v`, 1) and `diag(ϖ_v`, `ϖ_v`)). The big Hecke algebra is `T_ψ(U^p) = lim_{(n,U_p)} T_ψ(U^pU_p, O/ϖ^n)`, the limit over pairs with ψ ≡ 1 mod `ϖ^n` on `U_p ∩ O_{F,p}^×`, of the images of `T_S^{univ}` in `End(S_ψ(U^pU_p, O/ϖ^n))`; equivalently, for `F = ℚ` without central character, `T̃_Σ = lim_{K_p} T̃_Σ(K_p)` is the weak closure of the image of `T_S^{univ}` in `End^cont_O(C^0(X, O))`, each `T̃_Σ(K_p)` being finite free over O. It acts faithfully on the torsion tower and `M_ψ(U^p)`; under §1.6’s rational-centre compatibility and divisibility hypotheses it also acts faithfully on `S_ψ(U^p)`, commuting with `D_p^×`; it is independent of S; for `U_p` pro-p the map `T_ψ(U^p) → T_ψ(U^pU_p, k)` is a bijection on maximal ideals, so `T_ψ(U^p) ≅ ∏_{i=1}^r T_ψ(U^p)_{m_i}` with each factor `m_i-adically` complete and separated, and `S_ψ(U^p) ≅ ⊕_i S_ψ(U^p)_{m_i}`. A continuous r: `G_{ℚ,Σ} → GL_2(R)` is associated with a continuous φ: `T̃_Σ → R` if `det(X − r(Frob_ℓ)) = X^2 − φ(T_ℓ)X + ℓφ(S_ℓ)` for all `ℓ ∉ Σ`, and r̄: `G_{ℚ,Σ} → GL_2(k)` is modular of tame level `K^p` if it is associated with `T̃_Σ → T̃_Σ/m` for a maximal ideal m with residue field k (DLB Définition 5.2). For m with residual representation absolutely irreducible on `G_{ℚ_p}` (DLB’s hypothesis), `A = T̃_{Σ,m}` is a flat local noetherian reduced O-algebra with residue field k, a direct factor of `T̃_Σ`, and for `a T̃_Σ`-module `M`, `M_m = A ⊗_{T̃_Σ} M` is a direct factor of M (DLB Définition 5.3).

D definite, split above p; p splits completely in F. DLB use A flat, local, noetherian and reduced; noetherianity for Layer 4 follows from the surjection of a universal (pseudo)deformation ring onto A (§3.3 in the quaternionic form).

Use the following named interfaces:

- `TauCeti.DefiniteQuaternionCompleted.heckeAlgebra` (constructor): `T_ψ(U^p) = lim_{(n,U_p)} T_ψ(U^pU_p, O/ϖ^n)`, acting faithfully on the torsion tower and its dual, and on `S_ψ(U^p)` under §1.6’s compatibility/divisibility hypotheses.
- `TauCeti.DefiniteQuaternionCompleted.heckeAlgebra_weakClosure` (characterisation): For `F = ℚ` and no central character, `T̃_Σ` is the weak closure of the image of `T_S^{univ}` in `End^cont_O(C^0(X, O))`.
- `TauCeti.DefiniteQuaternionCompleted.heckeAlgebra_semilocal` (structure): `T_ψ(U^p) ≅ ∏_i T_ψ(U^p)_{m_i}`, and `S_ψ(U^p) ≅ ⊕_i S_ψ(U^p)_{m_i}`.
- `TauCeti.DefiniteQuaternionCompleted.heckeAlgebra_maxIdeal_bijection` (characterisation): For `U_p` pro-p, `T_ψ(U^p) → T_ψ(U^pU_p, k)` is a bijection on maximal ideals.
- `TauCeti.DefiniteQuaternionCompleted.heckeAlgebra_independent` (relation): `T_ψ(U^p)` does not depend on the finite set S.
- `TauCeti.DefiniteQuaternionCompleted.heckeAlgebra_commutes` (compatibility): `T_ψ(U^p)` commutes with the `D_p^×`-action.
- `TauCeti.DefiniteQuaternionCompleted.localHeckeAlgebra` (constructor): `A = T̃_{Σ,m}`, a direct factor of `T̃_Σ`, flat local noetherian reduced with residue field k, when `ρ̄_m|G_{ℚ_p}` is absolutely irreducible.

**Checks.**

- The odd mod-4 character at p=2 of §1.6 can leave nonzero torsion forms with zero integral completion. Faithfulness on the torsion tower then does not imply faithfulness on that completion.

- `TauCeti.DefiniteQuaternionCompleted.heckeAlgebra_finiteLevel` (computation): `T̃_Σ(K_p)` is finite free over O of rank at most the O-rank of `C(X(K_p), O) = number` of points of `X(K_p)`.
- `TauCeti.DefiniteQuaternionCompleted.heckeAlgebra_eisenstein` (characterisation): On the functions factoring through the reduced norm, `T_v` acts by `1 + N(v)` times the norm character; the corresponding maximal ideal is Eisenstein (residual `1 ⊕` ε̄ up to twist).
- `TauCeti.DefiniteQuaternionCompleted.heckeAlgebra_compatibility` (compatibility): `T_ψ(U^p)` is the compatible-sections ring of the faithful degree-zero images of the quaternionic tower. Here the finite complexes are concentrated in degree zero, so the degree-zero image diagram agrees with the derived one; the argument does not apply unchanged to a tower with cohomology in several degrees.
- `TauCeti.DefiniteQuaternionCompleted.heckeAlgebra_not_finite_level` (non-example): `T_ψ(U^p)_m` is not a finite O-algebra in general (its components have dimension at least `1 +` 2[F : `ℚ`], Pan Theorem 3.6.1), while each `T_ψ(U^pU_p, O)_m` is.

PAN, Theorem 3.5.5 and Corollary 3.5.10: `T_ψ(U^p)_m` acts on the block multiplicity module m and is finite over the local pseudo-deformation ring. DLB, Théorème 5.4 and §13: A acts on `C^0(X)_m`, and Π(𝔭) is attached to `r(𝔭)|G_{ℚ_p}` for 𝔭 `∈` MaxSpec A[1/p]. TUNG-2, §4.2–4.6: at non-Eisenstein m, `T^S_ψ(U^p)_m` receives the compatible global representation deformation ring and is patched. GL2ModularityLifting §§10.1–10.6 (nice prime): Pan’s nice primes are primes of `T_m` (input CC2).

A proof proceeds as follows.

1. The big Hecke algebra is the CompletedCohomologyPartII §8.10 (completed hecke algebra) of the finite discrete tower of §1.6; the finite images are commutative finite O-algebras (R18.3).
2. Semilocality: a maximal ideal of the Artinian ring `T_ψ(U^pU_p′, O/ϖ^n)` has a nonzero eigenspace on which the p-group `U_p/U_p′` has a fixed vector, so it is a maximal ideal at level `U_p` mod ϖ; Artinian rings are products of their localisations; pass to the limit (Pan Proposition 3.3.6, Corollary 3.3.7; Gee–Newton Lemma 2.1.14; §8.11 (completed semilocal product)). The `m_i-adic` completeness and separatedness of each factor is Pan’s Corollary 3.3.7(1), proved from the Artinian decomposition at each finite level; CompletedCohomologyPartII Layer 8 alone asserts only the finite-image topology.
3. Independence of S: twisting by a character reduces to finite-order ψ, where the pseudo-representation over `T_ψ(U, O/ϖ^n)` is classical (Pan 3.3.3).
4. For DLB’s A: reducedness from semisimplicity of the finite-level Hecke action on S(U, E), flatness since `A ⊂ End(C^0(X, O)_m)` is torsion-free, noetherianity from the surjection of the deformation ring of r̄ (absolutely irreducible) onto A.

**Checks.**

- For `F = ℚ`, B̄ of discriminant 2, `p = 3` and `K^p = ∏_{ℓ≠3} K_ℓ` with `K_2` the units of the maximal order and `K_ℓ = K_0(ℓ^{v_ℓ(M)})` for `ℓ ∤ 6`, the reduced norm of `K^pGL_2(ℤ_3)` is onto `Ẑ^×`, so the only functions on `X(GL_2(ℤ_3))` factoring through the norm are the constants, with `T_ℓ ↦ 1+ℓ`. Then `T̃_Σ(GL_2(ℤ_3))[1/3]` is the product of this Eisenstein factor E and, through Jacquet–Langlands (GL2AutomorphicRepresentationsAndTransfer R17.3), the 2-new weight-two cuspidal Hecke algebra of level `Γ_0(2M)` tensored with E; integrally it is an order in that product, and the factors can be congruent. For `M = 1`, `X(GL_2(ℤ_3))` is one point, `T̃_Σ(GL_2(ℤ_3)) = O` with `T_ℓ = 1+ℓ`, and `S_2(Γ_0(2)) = 0`, so the Jacquet–Langlands factor is zero; identifying the whole algebra with a cuspidal Hecke algebra fails this test.
- Non-example: without the closure, the image of `T_S^{univ}` in `End(C^0(X, O))` is not complete and does not contain the idempotents of its maximal ideals.

*Needs:* §1.6; CompletedCohomologyPartII §8.10 (completed hecke algebra); CompletedCohomologyPartII §8.11 (completed semilocal product); HilbertModularVarietiesAndShimuraCurves R18.3 (residual hecke ideal); HilbertModularVarietiesAndShimuraCurves R18.3 (split hecke normalisation); LocalGaloisDeformationRings §F.2.5 (universal deformation ring); `mathlib:Subalgebra.topologicalClosure`; `mathlib:IsReduced.`

PAN, Definition 3.3.4, 3.3.5, Proposition 3.3.6, Corollary 3.3.7, p. 24: The definite quaternionic big Hecke algebra `T_ψ(U^p)` as a limit of finite-level Hecke algebras, faithful on `S_ψ(U^p)`, with a pseudo-representation, semilocal with product decomposition.

DLB, §5.1, p. 25; Définition 5.3, p. 25: The spherical Hecke algebras at `ℓ ∉ Σ`, `T_Σ`, `T̃_Σ(K_p)` free of finite type over O, `T̃_Σ` the weak closure in `End^cont(C^0(X, O))`, compact reduced commutative; A the m-adic completion, flat local noetherian reduced, a direct factor.

TUNG-2, Lemma 4.2.4, p. 19: `T^S_ψ(U^p)` is profinite with finitely many maximal ideals, J-adically complete, and the product of its localisations.

### 3.8 Eisenstein localisation and pro-modular primes


Fix Pan’s §4.1 data: p odd; F totally real of even degree in which p splits completely; S ⊇ `Σ_p` finite with N(v) ≡ 1 mod p for `v ∈ S∖Σ_p`; χ: `G_{F,S} → O^× totally` odd, unramified outside p, with `χ(Frob_v)` ≡ 1 mod ϖ for `v ∈ S∖Σ_p`; characters `ξ_v` of p-power order of the tame inertia at `v ∈ S∖Σ_p`; ψ, `U^p` and a character ξ of `U^p` as in Pan §3.7 (the variant with p-power tame characters). Assume (Pan’s Assumption in §4.1) that `T_v −` (1 `+ χ(Frob_v)`) for `v ∉ S` and ϖ generate a maximal ideal m of the variant Hecke algebra `T = T_{ψ,ξ}(U^p)` (the Eisenstein maximal ideal), and write `T_m` for the localisation. Then: (a) there is a natural two-dimensional pseudo-representation `T_m`: `G_{F,S} → T_m` lifting `1 +` χ̄ with determinant χ and `Frob_v ↦ T_v` (v `∉` S); (b) the universal map `R^{ps} → T_m` from the universal pseudo-deformation ring of `1 +` χ̄ with determinant χ is surjective and factors through `R^{ps,{ξ_v}}`; (c) a prime `q ∈ Spec R^{ps,{ξ_v}}` is pro-modular if it is the contraction of a prime of `T_m`, equivalently if `ker(R^{ps,{ξ_v}} → T_m) ⊆ q`; the pro-modular primes form the closed subset `V(ker)` of `Spec R^{ps,{ξ_v}}`, so they are closed under specialisation; (d) for `q ∈ Spec T_m`, ρ(q): `G_{F,S} → GL_2(k(q))` denotes the semisimple representation with trace `T_m` mod q; (e) `T_m ≠ 0`, i.e. m is a proper maximal ideal, whenever the Eisenstein maximal ideal exists for the ordinary quotient (the ordinary Eisenstein seed contract, Pan Proposition 5.6.1). This is a different carrier from the ordinary pro-modular primes of OrdinaryAutomorphicFormsAndModularityLifting §4.1.

Pan’s §4.1 standing assumptions; `p = 3` needs the additional local exclusion `χ̄|G_{F_v} ≠ ω^{±1}` wherever Theorem 4.1.7 is used. The definite quaternion algebra is split at all finite places when [F : `ℚ`] is even, which Pan arranges by base change. Use the ordinary Eisenstein seed contract (Pan Proposition 5.6.1, from Skinner–Wiles Proposition 3.18 and Eisenstein congruences under `ord_ϖ L_p(F`, `−1`, χ̃ω) `>` 0). The generators need not define a proper ideal without this input.

Use the following named interfaces:

- `TauCeti.DefiniteQuaternionCompleted.eisensteinIdeal` (constructor): The ideal of `T_{ψ,ξ}(U^p)` generated by ϖ and `T_v −` (1 `+ χ(Frob_v)`), `v ∉ S`.
- `TauCeti.DefiniteQuaternionCompleted.eisensteinPseudoRep` (constructor): The pseudo-representation `T_m`: `G_{F,S} → T_m` with determinant χ lifting `1 +` χ̄.
- `TauCeti.DefiniteQuaternionCompleted.psToHecke` (data): The surjection `R^{ps,{ξ_v}} → T_m`.
- `TauCeti.DefiniteQuaternionCompleted.IsProModular` (other): `q ∈ Spec R^{ps,{ξ_v}}` is pro-modular iff `ker(R^{ps,{ξ_v}} → T_m) ⊆ q`.
- `TauCeti.DefiniteQuaternionCompleted.IsProModular.of_le` (relation): Pro-modularity passes to larger primes (closure under specialisation).
- `TauCeti.DefiniteQuaternionCompleted.semisimpleAtPrime` (constructor): ρ(q): `G_{F,S} → GL_2(k(q))`, the semisimple representation with trace `T_m` mod q.

**Checks.**

- `TauCeti.DefiniteQuaternionCompleted.IsProModular_maximal` (computation): The maximal ideal of `R^{ps,{ξ_v}}` is pro-modular when `T_m ≠ 0` (it contracts from m).
- `TauCeti.DefiniteQuaternionCompleted.IsProModular_kernel` (computation): A prime equal to the kernel of `R^{ps,{ξ_v}} → T_m` is pro-modular; it is the generic point of the closed image.
- `TauCeti.DefiniteQuaternionCompleted.IsProModular_zero_hecke` (degenerate): If `T_m = 0` the kernel is the unit ideal and no prime is pro-modular.
- `TauCeti.DefiniteQuaternionCompleted.IsProModular_compatibility` (compatibility): q is pro-modular iff q lies in the image of `Spec T_m → Spec R^{ps,{ξ_v}}` (Mathlib’s comap of the surjection).
- `TauCeti.DefiniteQuaternionCompleted.IsProModular_not_ordinary` (non-example): The ordinary pro-modular primes of OrdinaryAutomorphicFormsAndModularityLifting §4.1 (pro modular prime) live on a different ring (an ordinary representation deformation ring) and are not identified with these.

PAN, Theorem 4.1.7 and Corollary 4.1.8: The nilpotence of the kernel at a nice prime shows the component through it is pro-modular. GL2ModularityLifting §§10.1–10.6 (nice prime) and §§10.1–10.6 (nice-prime component bridge): Pan’s pro-modular primes as containment of the kernel, closed under specialisation (input CC2). GL2ModularityLifting §§10.1–10.6 (potentially nice base change): After solvable base change the determinant-fixed problem has a nonzero completed Hecke quotient.

A proof proceeds as follows.

1. (a) is §3.2(c) for the variant algebra `T_{ψ,ξ}(U^p)` (Pan 3.7.2 deduces the variant from the untwisted case through the kernel of ξ).
2. (b) is §3.3(b).
3. (c) is the definition of pro-modularity (Pan 4.1.3, last paragraph) recast as membership in the closed set `V(ker(R^{ps,{ξ_v}} → T_m))`; closure under specialisation is closedness.
4. (d): over the field of the fibre, reconstruct the semisimple representation using IntegralHeckeAndGaloisDeterminants §1.2, with its coefficient-descent hypotheses (Pan 4.1.3).

**Checks.**

- Pro-modularity is stable under specialisation: if q is pro-modular and `q ⊆ q′` then q′ is pro-modular.
- Non-example: a prime of `R^{ps}` not containing the kernel, e.g. a characteristic-zero point whose pseudo-representation is not congruent to an automorphic one at the level, is not pro-modular even if its residual pseudo-representation is `1 +` χ̄.

*Needs:* §3.7; §3.3; §3.2; IntegralHeckeAndGaloisDeterminants IHG.0–IHG.1; `mathlib:PrimeSpectrum.zeroLocus`; `mathlib:RingHom.ker.`

PAN, §4.1, Assumption and 4.1.3, pp. 37–38: Pan’s setup for the residually reducible case: the Eisenstein maximal ideal of the variant Hecke algebra, the pseudo-representation `T_m` with determinant χ, the surjection `R^{ps} → T_m` factoring through `R^{ps,{ξ_v}}`, and the definition of pro-modular primes.

PAN, §3.7.1–3.7.2, p. 37: The variant completed homology `M_{ψ,ξ}(U^p)` and Hecke algebra `T_{ψ,ξ}(U^p)` with p-power tame characters, needed for Taylor’s Ihara avoidance.

PAN, Proposition 5.6.1 and Remark 5.6.2, p. 86: Existence of the Eisenstein maximal ideal of the ordinary Hecke algebra under a p-adic L-value condition, generalising Skinner–Wiles Proposition 3.18.

For arbitrary commutative O-algebras T, the Eisenstein ideal generated by the image of ϖ and the elements `T_v−(1+χ_v)` is meaningful independently of properness. Prove containment of every generator and its universal kernel criterion. For a ring map φ, kernel containment `ker φ ≤ q` is preserved under specialisation. For surjective φ, this predicate identifies the pro-modular primes with the contractions `Set.range (PrimeSpectrum.comap φ)`, using Mathlib’s `range_comap_of_surjective`.

**Checks.**

- In `T=k` with `ϖ=0` and `T_v=1+χ_v`, the Eisenstein ideal is zero. If one trace differs from `1+χ_v` by a unit it is the unit ideal, so no Eisenstein maximal ideal exists.
- If the set of v is empty the ideal is (ϖ), not zero in O. Thus the coefficient generator cannot be omitted.
- For `φ:R↠R/I` the pro-modular primes are exactly `V(I)`. For `I=R` there are none; for `I=0` every prime is pro-modular.
- Surjectivity matters for the image interpretation: `ℤ→ℚ` has zero kernel, so (2) contains it, but no prime of `ℚ` contracts to (2). Specialisation closure is valid for the kernel-containment predicate even without surjectivity.

### Examples

At a weight-two point with trivial nebentypus, `S_ℓ=1` but `det(Frob_ℓ)=ℓ`; omitting ℓ already fails at `ℓ=2`. For a zero Hecke quotient there are no pro-modular primes. For a nonzero quotient R/I they form `V(I)` and are closed under specialisation. These ring-theoretic facts do not prove that an Eisenstein seed exists.

### Dependencies

Layers 1–2 give the arithmetic carriers and classical points. CompletedCohomologyPartII Layer 8 supplies the completed Hecke algebra and residual projector. PadicFamilies §§2.4–2.10 supplies the eigencurve charts of §3.5a. IntegralHeckeAndGaloisDeterminants IHG.0–IHG.1 and §4.2 supply determinant laws, field/Henselian reconstruction and continuous interpolation. LocalGaloisDeformationRings §§F.1.9–F.1.10, F.2.8 and F.2.11 supply the deformation/determinant comparison and continuous pseudodeformation representing interfaces; AutomorphicGaloisRepresentations §6.8 supplies the finite-level arithmetic determinants. Use the same determinant-law carrier from IntegralHeckeAndGaloisDeterminants IHG.0 in these deformation interfaces. OrdinaryAutomorphicFormsAndModularityLifting §2.4 supplies the exact ordinary Eisenstein seed contract. The Pan block dimension comparison is used only through its specification above.

## Layer 4: p-adic local–global compatibility


Kisin’s deformation comparison supplies the local family at p in its stated range. Away from p the co-Whittaker family W and its smooth O-dual Π are different objects: derivative and arbitrary-coefficient endomorphism statements apply to W. The coadmissible multiplicity module `X(θ)` uses Π. Its cotorsion-free part is a submodule.

The canonical refined isomorphism uses scalar local residual endomorphisms. For split distinct characters the checked proof gives the weaker θ-family isomorphism. This suffices for the corresponding branch of Theorem 1.2.1, but does not identify θ with the canonical family. The evaluation proof uses the explicit mod-p weight/genericity input and tensor cancellation with a nonzero factor and an injective saturated composite. Use the coadmissibility and integral mod-p family contracts above for these steps.

Dospinescu–Le Bras give the definite quaternionic comparison over `ℚ` using dense classical crystalline points and an evaluation map. Pan’s general totally real comparison uses block multiplicity modules and a finite central pseudo-deformation map, with no general integral centre isomorphism asserted. The Scholze-functor comparison remains conditional on its designated owner. The Banach comparisons are separate from the locally algebraic comparisons.

### 4.1 Local Langlands families over the completed Hecke algebra


Let ρ̄ be absolutely irreducible and modular and let `ρ̄_p` satisfy EM11 Assumption 3.3.1. Write `T = T_{ρ̄,Σ}`. (a) Kisin’s fully faithful functor gives the admissible orthonormalizable T-family `π^m_Σ` deforming Colmez’s π̄ with `MF(π^m_Σ) ≅ ρ^m_Σ|G_{ℚ_p}` and central character `det(ρ^m_Σ|G_{ℚ_p})ε`. Its closed characteristic-zero fibres are `B(ρ(𝔭)|G_{ℚ_p})`. (b) For `ℓ ∈ Σ_0`, denote the torsion-free smooth co-Whittaker T-family by `W_ℓ`; its minimal-prime fibres are the generic contragredient local Langlands representations. Put `W_{Σ_0} = (⊗_{ℓ∈Σ_0} W_ℓ)_{T-torsion-free}` and `Π_{Σ_0} = W_{Σ_0}^{smooth O-dual}`. Thus W is Nakamura’s `π^m_{Σ_0}`, while Π is Nakamura’s `π̃^m_{Σ_0}` and Emerton’s `π_{Σ_0}(ρ^m_Σ)`, a coadmissible module. SmoothRepresentationsOfLocalGroups §SR.5.2 constructs the family over a reduced, p-torsion-free complete local Noetherian coefficient ring with algebraically closed residue field; `awayFamily_descent` below descends it to T, whose residue field k is finite, keeping the prescribed generic minimal-prime fibres. Prove the additional integral smooth-dual mod-ϖ m-torsion compatibility specified above; it does not follow by dualising arbitrary base change. Subject to that exact compatibility, for `p > 2`, `(Π_{Σ_0}/ϖ)[m] ≅ ⊗_ℓ π(ρ̄|G_{ℚ_ℓ})`; the `p = 2` statement retains Remark 6.1.3’s weaker formulation. (c) `Φ_{Σ_0}(W_{Σ_0}) ≅ T` and `End_{T[G_{Σ_0}]}(M ⊗_T W_{Σ_0}) ≅ End_T(M)` for every T-module M (`awayFamily_product` below). These assertions concern W, not Π.

Assumption 3.3.1 on `ρ̄_p` is needed for Colmez’s π̄ and Kisin’s equivalence; when `End(ρ̄_p) ≠ k`, Def(π̄) is not representable and `π^m_Σ` is defined through the subfunctor `Def^*(π̄)` ↪ `Def(ρ̄_p)`. In (b) the residue characteristic of the coefficients is `p ≠ ℓ`; the `p = 2` mod-p statement is weaker (EM11 Remark 6.1.3: an embedding, an isomorphism when `ρ̄|G_{ℚ_ℓ}` is non-scalar). `ρ^m_Σ|G_{ℚ_p}` lies in `Def^{crys}(ρ̄_p)` because crystalline points are Zariski dense (§3.6); this is what makes Kisin’s equivalence applicable.

Use the following named interfaces:

- `TauCeti.LocalGlobalCompatibility.colmezResidual` (data): π̄, the admissible smooth k[G]-representation with `MF(π̄) ≅ ρ̄_p` (imported from §0.2).
- `TauCeti.LocalGlobalCompatibility.localFamilyAtP` (constructor): `π^m_Σ`, the deformation of π̄ over `T_{ρ̄,Σ}` with `MF(π^m_Σ) ≅ ρ^m_Σ|G_{ℚ_p}` and central character `det(ρ^m_Σ|G_{ℚ_p})ε`.
- `TauCeti.LocalGlobalCompatibility.localFamilyAtP_fibre` (compatibility): `κ(𝔭) ⊗ π^m_Σ ≅ B(ρ(𝔭)|G_{ℚ_p})` at closed points 𝔭 of `Spec T_{ρ̄,Σ}[1/p]`.
- `TauCeti.LocalGlobalCompatibility.localFamilyAtP_unique` (extensionality): `π^m_Σ` is unique up to isomorphism among deformations of π̄ with the given MF and central character.
- `TauCeti.LocalGlobalCompatibility.localFamilyAway` (constructor): `W_ℓ`, `W_{Σ_0} = (⊗ W_ℓ)_{T-torsion-free}`, and `Π_{Σ_0} = W_{Σ_0}^{smooth O-dual}`; the latter is Emerton’s coadmissible `π_{Σ_0}(ρ^m_Σ)`.
- `TauCeti.LocalGlobalCompatibility.localFamilyAway_minimalPrime` (characterisation): At a minimal prime a, `κ(a) ⊗_T W_ℓ` is the generic contragredient local Langlands representation of `ρ^m_Σ|G_{ℚ_ℓ} ⊗ κ(a)`.
- `TauCeti.LocalGlobalCompatibility.localFamilyAway_modp` (compatibility): Under the integral smooth-dual comparison specified above, for `p > 2`, `(Π_{Σ_0}/ϖ)[m] ≅ ⊗_ℓ π(ρ̄|G_{ℚ_ℓ})`.
- `TauCeti.LocalGlobalCompatibility.localFamilyAway_endomorphisms` (relation): For the co-Whittaker module `W_{Σ_0}`, `End_{T[G_{Σ_0}]}(M ⊗_T W_{Σ_0}) ≅ End_T(M)`.

**Checks.**

- `TauCeti.LocalGlobalCompatibility.localFamilyAway_empty` (degenerate): For `Σ_0 =` ∅, `W_{Σ_0} = T` with trivial group action, whereas `Π_{Σ_0}` is the continuous O-dual `T′ = Hom_{O-cont}(T,O)`, with T given its maximal-ideal-adic topology. A definition identifying both families with T fails this test.
- `TauCeti.LocalGlobalCompatibility.localFamilyAtP_residue` (computation): `π^m_Σ/m_T ≅ π̄`; for `ρ̄_p` absolutely irreducible, π̄ is a supersingular irreducible representation and `π^m_Σ` is topologically irreducible at every closed point with `ρ(𝔭)|G_{ℚ_p}` irreducible.
- `TauCeti.LocalGlobalCompatibility.localFamilyAway_compatibility` (compatibility): `W_ℓ` is the descent by `awayFamily_descent` of the torsion-free co-Whittaker family that SmoothRepresentationsOfLocalGroups §SR.5.2 supplies over `T^{nr}`; `Π_ℓ` is its smooth O-dual. Their derivative and base-change APIs are applied on the W side.
- `TauCeti.LocalGlobalCompatibility.localFamilyAtP_not_classical` (non-example): π(𝔭) is a Banach representation, not the smooth local Langlands representation `π_p(ρ(𝔭))`; its locally algebraic vectors recover the latter only for de Rham ρ(𝔭) with distinct weights.

EM11, Conjecture 6.1.6 and Theorem 6.2.13: `ρ^m_Σ ⊗ π^m_Σ ⊗̃ π_{Σ_0}(ρ^m_Σ)` is the source of the refined local–global isomorphism. NAK, Theorem 2.2 and Corollary 2.5: The same three families give the dual description of completed Borel–Moore homology. §4.3: θ ranges over deformations of π̄ such as `π^m_Σ`.

A proof proceeds as follows.

1. (a): apply §0.4 (kisin deformation comparison) to `ρ^m_Σ|G_{ℚ_p}`. Its fully faithful crystalline deformation comparison under Assumption 3.3.1 is the precise supplier; crystalline density places the Hecke representation in that subfunctor. The general complete-local coefficient category is imported from CompletedCohomologyPartII Layer 3.
2. `π(𝔭) = B(ρ(𝔭)|G_{ℚ_p})` at closed points is the definition of B in the deformation-theoretic correspondence (EM11 Definition 6.1.1, Remark 3.3.19).
3. (b): apply `awayFamily_descent` to each `ρ^m_Σ|G_{ℚ_ℓ}`; tensor and take the torsion-free quotient to obtain W, then form its smooth O-dual Π. EM11 Theorem 4.4.1 characterises Π. For the mod-p formula use only the additional integral smooth-dual compatibility for Theorem 6.1.2; an arbitrary dual base change does not supply this compatibility.
4. (c): for one prime the free rank-one derivative and arbitrary-coefficient endomorphism theorem are SmoothRepresentationsOfLocalGroups §§SR.5.1, SR.5.3 (NAK Lemma B.10); for the product over `Σ_0` apply `awayFamily_product`. No such formula is asserted for `M ⊗ Π`.

The two away-from-p extension targets are the following.

- `awayFamily_descent`: let T be complete local, reduced, p-torsion-free and Noetherian with finite residue field k, and `ρ: G_{ℚ_ℓ} → GL₂(T)` continuous with `ℓ ≠ p`. Put `T^{nr} = T ⊗̂_{W(k)} W(k̄)`, again complete local, reduced, p-torsion-free and Noetherian, with residue field k̄. SR.5.2 gives the torsion-free co-Whittaker family of `ρ ⊗ T^{nr}`. For `σ ∈ Gal(k̄/k)` acting on `T^{nr}` through `W(k̄)`, the σ-conjugate family has the σ-conjugate minimal-prime fibres, so the uniqueness statement of SR.5.2 gives an isomorphism with the family itself; since co-Whittaker endomorphisms are scalars, it is unique once its action on the free rank-one top derivative is required to be σ. These isomorphisms form a continuous semilinear descent datum. Descend it on the compact-open invariants, which are finite `T^{nr}`-modules, to a torsion-free co-Whittaker T-family `W_ℓ` with generic contragredient minimal-prime fibres. It is unique up to isomorphism (EM11 Theorem 4.4.1, pp. 42–43; NAK Theorem B.11 and Remark B.12, arXiv p. 95, citing Emerton–Helm Theorem 6.2.1; existence over `W(k̄)`-algebras is Helm–Moss Corollary 7.7).
- `awayFamily_product`: for a Noetherian `ℤ_p`-algebra A, call a smooth `A[G_{Σ_0}]`-module V co-Whittaker if it is admissible, `Φ_{Σ_0}(V) = Φ_{ℓ_1}∘⋯∘Φ_{ℓ_d}(V)` is free of rank one over A, and for every prime 𝔭 of A the smooth `κ(𝔭)`-dual of `V ⊗_A κ(𝔭)` is essentially absolutely irreducible generic. Prove that `W_{Σ_0} = (⊗_{ℓ∈Σ_0} W_ℓ)_{T-tf}` is co-Whittaker with `Φ_{Σ_0}(W_{Σ_0}) ≅ T`, and that `f ↦ f ⊗ id_V` is an isomorphism `End_A(M) → End_{A[G_{Σ_0}]}(M ⊗_A V)` for every co-Whittaker V and every A-module M. Prove the latter by the Schwartz-function argument of SR.5.3 for the product mirabolic `∏_{ℓ∈Σ_0} P_ℓ`, by induction on `#Σ_0` (NAK, proof of Lemma 2.6, arXiv pp. 25–26, and Lemma B.10, arXiv pp. 93–94).

**Checks.**

- For `T = O`, `awayFamily_descent` gives the O-lattice of EM11 Proposition 4.4.3, p. 43: its generic fibre is the contragredient of the generic representation attached to `ρ ⊗ E`.
- Twisting ρ by an unramified character with values in `T^×` twists the descended family by the corresponding character of det, as it twists every minimal-prime fibre.
- Base change of the descended `W_ℓ` along `T → T^{nr}` recovers the SR.5.2 family of `ρ ⊗ T^{nr}` itself, not a σ-conjugate of it; SR.5.2 applied directly to T, with its finite residue field, is outside that construction's hypotheses.
- For `Σ_0 = ∅`, `G_{Σ_0}` is trivial, `Φ_∅` is the identity, `W_∅ = T`, and the endomorphism statement is `End_T(M) = End_T(M)`; for `#Σ_0 = 1` it is SR.5.3.
- Taking the T-torsion-free quotient does not change `Φ_{Σ_0}`: Φ is exact and the T-torsion of T is zero, so `Φ_{Σ_0}(⊗_ℓ W_ℓ) ≅ T` already.
- For `M = T/I`, `End_{T[G_{Σ_0}]}(W_{Σ_0}/IW_{Σ_0}) = T/I`; the corresponding statement for the smooth dual Π is not asserted.

**Checks.**

- At a closed point 𝔭 attached to a newform f of weight k with `ρ(𝔭)|G_{ℚ_p}` crystalline, absolutely irreducible and not exceptional, π(𝔭) is the universal unitary completion of `π_p(V_f) ⊗ (Sym^{k−2}E²)^∨` in §2.1’s cohomological normalisation (Berger–Breuil); after `globalAlgebraicNormalization` this is EM11 Theorem 3.3.22’s `Sym^{a−b−1} ⊗ det^{b+1} ⊗ π_p`. Using `Sym^{k−2}` instead changes the action of small scalars u from `u^{2−k}` to `u^{k−2}`, which no smooth factor can absorb when k>2.
- Non-example: for `ρ̄_p a` twist of a non-split extension of ε̄ by 1 (excluded by Assumption 3.3.1), the expected `B(V)` is longer than the Colmez correspondence predicts (EM11 Remark 6.1.23), so the family in (a) is not defined.

*Needs:* §3.2; §3.6; SmoothRepresentationsOfLocalGroups §§SR.5.1–SR.5.3; CompletedCohomologyPartII §3.13 (orthonormalizable and profree modules); `mathlib:Module.Flat`; LocalGaloisDeformationRings §3.7.2 (MontrealFunctor); §0.2 (montreal on irreducibles); §0.4 (kisin deformation comparison).

EM11, Assumption 3.3.1, Theorem 3.3.2, p. 24; Theorem 3.3.13, p. 26; Remark 3.3.19, p. 27: Colmez’s π̄ attached to `ρ̄_p`, Kisin’s deformation-theoretic equivalence between crystalline deformations of π̄ and of `ρ̄_p`, and the compatibility of B with the explicit correspondence.

EM11, §6.1 opening paragraphs, Definition 6.1.1, Theorem 6.1.2 and Remark 6.1.3, pp. 66–67: The deformation `π^m_Σ` of π̄ over `T_{ρ̄,Σ}` with `MF(π^m_Σ) ≅ ρ^m_Σ|G_{ℚ_p}`, its fibres π(𝔭), the family `π_{Σ_0}(ρ^m_Σ)` and its mod ϖ m-torsion for `p > 2`.

EM11, Theorem 4.4.1, Definition 4.4.2, Proposition 4.4.3, pp. 42–44: Uniqueness and properties of the coadmissible family `π_{Σ_0}(ρ)` attached to a Galois representation over a reduced complete local ring (Emerton–Helm).

NAK, §2.2, pp. 19–20: Under `ρ̄_p` ≇ `χ ⊗` (1 ∗; 0 ε), `p ≥ 3` and `End(ρ̄_p) = F`: the deformation `π^m_p` of `π̄_p` with `MF(π^m_p) ≅ ρ^m|G_{ℚ_p}`, the co-Whittaker `π^m_ℓ`, `π^m_{Σ_0}` as maximal torsion-free quotient, and `Φ_{Σ_0}(π^m_{Σ_0}) ≅ T_{ρ̄,Σ}`.

### 4.2 Fibres of the away-from-p family (Mazur’s principle in families)


Under the hypotheses of §4.1, for every closed point 𝔭 `∈ Spec T_{ρ̄,Σ}[1/p]` there is an isomorphism `π_{Σ_0}(ρ^m_Σ)[𝔭] ≅ π_{Σ_0}(ρ(𝔭)°)`, hence `E ⊗_O π_{Σ_0}(ρ^m_Σ)[𝔭] ≅ ⊗_{ℓ∈Σ_0} π_ℓ(ρ(𝔭)|G_{ℚ_ℓ})` (Emerton’s Conjecture 6.1.4, proved as his Theorem 6.2.4). Equivalently: if `Σ_0^{ng} ⊂ Σ_0` is the set of ℓ at which ρ(𝔭) is a non-generic principal series and χ makes `χ ⊗ ρ(𝔭)` unramified on `Σ_0^{ng}`, then `χ ⊗ ρ(𝔭)` is promodular of tame level divisible only by primes in `Σ_0 ∖ Σ_0^{ng}`.

The proof removes one prime `ℓ ∈ Σ_0^{ng}` at a time and uses that `ρ(𝔭)(Frob_ℓ)` has eigenvalue ratio `ℓ^{±1}`, so is not scalar. It uses the semistable model of `X(K_pK_{Σ_0}K_0^Σ)` at ℓ, the Néron model of its Jacobian, and the Eisenstein property of the component group (Ribet), after localising at the non-Eisenstein m.

A proof proceeds as follows.

1. Reduce to removing one ℓ with ρ(𝔭) unramified non-generic principal series at ℓ, at Iwahori level `J_ℓ` (EM11 Remark 6.1.5 and proof of Theorem 6.2.4).
2. Adjoin `U_ℓ` to get `T(K_{Σ_0})^*_ρ̄` (finite over `T(K_{Σ_0})_ρ̄`); refine the embedding ρ(𝔭) ↪ `Ĥ^1(K_{Σ_0})_{E,ρ̄}[𝔭]` (from §4.3, Emerton Remark 6.4.3) to a prime `𝔭^*` over 𝔭, landing in the inertia invariants.
3. Construct the ℓ-new/ℓ-old exact sequence of the inertia invariants, with `Frob_ℓ` acting by `U_ℓ` on the new part and the old part `≅ two` copies of the level-without-ℓ cohomology, from the Néron model sequences (6.2.9)–(6.2.11): the component group Φ is Eisenstein (Ribet), so localising at m kills it, and `Frob_ℓ` acts on `(O ⊗_{ℤ_p} T[pʳ])_m` by `ℓ^{-1}U_ℓ` (EM11 (6.2.7)–(6.2.11)); the semistable model at ℓ is ModularCurvesPartII §11.5 and the Néron-model and character-group sequences are ModularCurvesPartII §§17.4–17.7; the Eisenstein property of the Hecke action on Φ (Ribet 1995, Corollary p. 140) and the action of `Frob_ℓ` by `ℓ^{-1}U_ℓ` on torus p-power torsion (Ribet 1990, Proposition 3.8) are the arithmetic extension targets above, with the Eisenstein component-group and bad-reduction torus identities required in addition to the sequences and the good-reduction Eichler–Shimura relation.
4. Since `ρ(𝔭)(Frob_ℓ)` is not scalar, the embedding does not factor through the new part, so the old part at `𝔭^*` is nonzero, giving promodularity at level prime to ℓ (Mazur’s principle, EM11 Remark 6.2.12).

**Checks.**

- For the split multiplicative J₀(11), X*(T)=ℤ has Frobenius 1 and U₁₁=1, while geometric Frobenius on T[pʳ] is 11⁻¹; the dual and Tate twist account for the difference.

- For ρ(𝔭) unramified at every `ℓ ∈ Σ_0` with `ρ(𝔭)(Frob_ℓ)` of eigenvalue ratio `≠ ℓ^{±1}`, `Σ_0^{ng} =` ∅ and the statement reduces to the existence of the family.
- Under `p > 2`, `ρ̄|G_{ℚ(ζ_p)}` absolutely irreducible and ρ̄ p-distinguished, the theorem also follows from Theorem 1.2.3 (EM11 Remark 6.2.12), but that route uses Serre’s conjecture; the Mazur-principle proof does not.

*Needs:* §4.1; §4.3; §3.5; ModularCurvesPartII §17.4–17.7 (modular monodromy); ModularCurvesPartII §17.4–17.7 (character degeneracy sequences); ModularCurvesPartII §17.2 (special fibre eichler shimura); ModularCurvesPartII §11.5 (one factor mixed level model).

EM11, Conjecture 6.1.4 and Remark 6.1.5, p. 67; Theorem 6.2.4 and its proof with (6.2.5)–(6.2.11), pp. 72–75; Remark 6.2.12, p. 75: The fibres of `π_{Σ_0}(ρ^m_Σ)` at closed points are the expected local representations; the proof is a p-adic form of Mazur’s principle using the Néron model of the Jacobian at a semistable prime and the Eisenstein component group.

### 4.3 The multiplicity module `X(θ)`


Under the hypotheses of §4.1, let θ be a deformation of π̄ over `T_{ρ̄,Σ}` (an admissible G-representation on an orthonormalizable `T_{ρ̄,Σ}`-module) such that `θ(𝔭) ≅ π(𝔭)` at every allowable closed point (Emerton’s Assumption 6.3.1; `θ = π^m_Σ` qualifies, and `θ ≅ π^m_Σ` when `End_G(π̄) = k`). Define `X(θ) = Hom_{T_{ρ̄,Σ}[G_ℚ×G]-cont}(ρ^m_Σ ⊗_{T_{ρ̄,Σ}} θ, Ĥ^1_{O,ρ̄,Σ})`, continuity for the m-adic topology on the source and the inductive-limit topology on the target, with the `T_{ρ̄,Σ}`-linear action of `G_{Σ_0}` induced from `Ĥ^1_{O,ρ̄,Σ}`. For a coadmissible `T_{ρ̄,Σ}[G_{Σ_0}]`-submodule `Y ⊂ X(θ)` the evaluation map `ev_Y`: `ρ^m_Σ ⊗ θ ⊗̃ Y → Ĥ^1_{O,ρ̄,Σ}` uses Emerton’s completed tensor product `⊗̃` (Definition C.43: `⊗̃ = colim_H` of ϖ-adically completed tensor products with the H-invariants, `H ⊂ G_{Σ_0}` open). Then `X(θ)` is a smooth, cofinitely generated and coadmissible representation of `G_{Σ_0}` over `T_{ρ̄,Σ}` (Definitions C.23, C.32); `X(θ)_{ctf}` denotes its maximal cotorsion-free submodule (Definition C.37) and closures and saturations are in the sense of Definitions C.6 and C.28. For 𝔭 closed, `E ⊗ X(θ)[𝔭] ≠ 0`, giving a nonzero `G_ℚ × G`-map `ρ(𝔭) ⊗ π(𝔭) → Ĥ^1_{E,ρ̄,Σ}[𝔭]` (Emerton’s Remark 6.4.3).

θ must satisfy Assumption 6.3.1 (fibres π(𝔭) at allowable points); then `θ(𝔭)^{ss} ≅ π(𝔭)^{ss}` at every closed point. In the fibre identity replace θ(𝔭) by π(𝔭) only at allowable points or with a supplied isomorphism; the separate nonzero canonical map follows by taking θ=π^m_Σ (Emerton Lemma 6.3.3). Coadmissibility is Emerton’s notion for smooth representations of `G_{Σ_0}` over the complete local ring `T_{ρ̄,Σ}` (Appendix C); it is not the Schneider–Teitelbaum notion for locally analytic representations.

Use the following named interfaces:

- `TauCeti.LocalGlobalCompatibility.multiplicityModule` (constructor): `X(θ) = Hom_{T[G_ℚ×G]-cont}(ρ^m_Σ ⊗_T θ, Ĥ^1_{O,ρ̄,Σ})` with its smooth `G_{Σ_0}`-action.
- `TauCeti.LocalGlobalCompatibility.multiplicityModule_coadmissible` (characterisation): `X(θ)` is a cofinitely generated coadmissible smooth `T_{ρ̄,Σ}[G_{Σ_0}]`-module.
- `TauCeti.LocalGlobalCompatibility.multiplicityModule_invariants` (simp): `X(θ)^{K_{Σ_0}} = Hom_{T[G_ℚ×G]-cont}(ρ^m ⊗ θ, Ĥ^1(K_{Σ_0})_{O,ρ̄})` for allowable `K_{Σ_0}`.
- `TauCeti.LocalGlobalCompatibility.evaluation` (data): `ev_Y`: `ρ^m_Σ ⊗ θ ⊗̃ Y → Ĥ^1_{O,ρ̄,Σ}` for a coadmissible submodule Y.
- `TauCeti.LocalGlobalCompatibility.cotorsionFreeSubmodule` (constructor): `X(θ)_{ctf}`, the maximal cotorsion-free submodule.
- `TauCeti.LocalGlobalCompatibility.multiplicityModule_fibre` (compatibility): `E ⊗_O X(θ)[𝔭] ≅ Hom^cont_{κ(𝔭)[G_ℚ×G]}(ρ(𝔭) ⊗_{κ(𝔭)} θ(𝔭), Ĥ^1_{E,ρ̄,Σ}[𝔭])` and is nonzero for closed 𝔭.
- `TauCeti.LocalGlobalCompatibility.completedTensor` (constructor): Emerton’s `⊗̃` of an orthonormalizable admissible G-representation over T with a coadmissible `G_{Σ_0}`-representation.

**Checks.**

- For arbitrary θ, the closed fibre formula retains θ(𝔭); equality of semisimplifications is not an isomorphism. At an allowable point the supplied isomorphism with π(𝔭) permits substitution.

- `TauCeti.LocalGlobalCompatibility.multiplicityModule_nonzero` (computation): For every closed point 𝔭 of `Spec T_{ρ̄,Σ}[1/p]`, `X(π^m_Σ)[𝔭] ⊗ E ≠ 0`.
- `TauCeti.LocalGlobalCompatibility.multiplicityModule_zero_target` (degenerate): If `Ĥ^1_{O,ρ̄,Σ}` were replaced by 0, `X(θ) = 0` and ev is the zero map; the definition is additive in the target.
- `TauCeti.LocalGlobalCompatibility.multiplicityModule_compatibility` (compatibility): Under §3.5, `X(θ) ≅ Hom_{T[G]-cont}(θ, U_Σ)`.

EM11, Theorems 6.4.9, 6.4.16, 6.4.20 and Corollary 6.4.13: The refined local–global compatibility is the statement that `ev_{X(θ)_{ctf}}` is an isomorphism with `X(θ)_{ctf} ≅ π_{Σ_0}(ρ^m_Σ)`. EM11, Theorem 6.2.1 and Remark 7.4.2: The nonzero map `ρ(𝔭) ⊗ π(𝔭) → Ĥ^1[𝔭]` at every closed point is the input of Theorem 1.2.1(1) and of the global proof of Theorem 3.3.22. §4.2: The embedding of ρ(𝔭) into `Ĥ^1(K_{Σ_0})_{E,ρ̄}[𝔭]` starts Mazur’s principle.

A proof proceeds as follows.

1. Smoothness: every continuous map factors through `Ĥ^1(K_{Σ_0})_{O,ρ̄}` for some allowable `K_{Σ_0}`, using `Ĥ^1(K_{Σ_0})_{O,ρ̄} = Ĥ^1(K_{Σ_0})_{E,ρ̄} ∩ Ĥ^1_{O,ρ̄,Σ}` and admissibility (EM11 proof of Theorem 6.3.12, from §3.4).
2. Cofinite generation and coadmissibility: the `K_{Σ_0}`-invariants `X(θ)^{K_{Σ_0}} = Hom(ρ^m ⊗ θ, Ĥ^1(K_{Σ_0})_{O,ρ̄})` are cofinitely generated over `T_{ρ̄,Σ}` because `Ĥ^1(K_{Σ_0})_{O,ρ̄}` is ϖ-adically admissible over `T_{ρ̄,Σ}` and θ is admissible (EM11 Theorem 6.3.12, (6.3.7)).
3. Nonvanishing at closed points: `X(θ)` satisfies condition 4 of Emerton’s Proposition 6.4.2; Proposition C.36 gives `E ⊗ X(θ)[𝔭] ≠ 0` (EM11 Remark 6.4.3).
4. The completed tensor product, closure, saturation and cotorsion-free notions are those of EM11 Appendix C, whose algebraic background (orthonormalizable and pro-free modules, Appendix B) is CompletedCohomologyPartII §§3.13, 3.15 (orthonormalizable coefficient modules and mixed completed tensor products).

**Checks.**

- For `Σ_0 =` ∅, the predicted cotorsion-free multiplicity submodule is `T′ = Hom_{O-cont}(T,O)`, the coadmissible dual of `W_∅ = T`, rather than T itself.
- At a closed point 𝔭, `X(θ)[𝔭] ⊗ E ≅ Hom^cont_{κ(𝔭)[G_ℚ×G]}(ρ(𝔭) ⊗_{κ(𝔭)} θ(𝔭), Ĥ^1_{E,ρ̄,Σ}[𝔭])` (EM11 (6.3.10)).

*Needs:* §4.1; §3.4; §3.5; CompletedCohomologyPartII §3.13 (orthonormalizable and profree modules); CompletedCohomologyPartII §3.15 (mixed completed tensor); CompletedCohomologyPartII §3.16 (mixed tensor dual comparison); `mathlib:ContinuousLinearMap`; §2.4.

EM11, Assumption 6.3.1, Remark 6.3.2, Lemma 6.3.3, Definition 6.3.4, Theorem 6.3.12 and its proof, pp. 76–78: The multiplicity module `X(θ)` of continuous `T_{ρ̄,Σ}[G_ℚ ×` G]-maps from `ρ^m_Σ ⊗ θ` into `Ĥ^1_{O,ρ̄,Σ}`, its smoothness and coadmissibility as `a G_{Σ_0}`-representation over `T_{ρ̄,Σ}`.

EM11, Proposition 6.4.2, Remark 6.4.3, Definitions 6.4.1 and 6.4.4, pp. 81–83: Evaluation maps from coadmissible submodules, `X(θ)_{ctf}`, and the nonzero map `ρ(𝔭) ⊗ π(𝔭) → Ĥ^1_{E,ρ̄,Σ}[𝔭]` at every closed point.

EM11, Appendix C, Definitions C.6, C.23, C.28, C.32, C.37, C.43, Proposition C.36, pp. 103–115: Saturation, coadmissible and cofinitely generated smooth representations over a complete local ring, closures, cotorsion-free submodules and the completed tensor product `⊗̃`.

Algebraic multiplicity evaluation uses `Representation.IntertwiningMap` directly and sends `v⊗f` to `f(v)`, for any field E and two E-linear representations of a group G. Prove its injectivity for finite-dimensional V under irreducibility (no nonzero proper invariant submodule) and `End_G(V)=E`. Injectivity fails for trivial actions on `V=E²` and `H=E`, as the Check below shows. The arithmetic setting has continuous actions and its separate complete-local tensor comparison; the algebraic statement does not supply that topology.

**Checks.**

- For `H=V` and `f=id`, evaluation of `v⊗id` is v. For `H=0` or `V=0` the map is the unique injection from zero, without a nonvanishing claim.
- With trivial G and `V=E²`, evaluation is not injective: for independent basis vectors `e₁,e₂` and the coordinate forms `ℓ₁,ℓ₂` in `Hom(V,E)`, the nonzero tensor `e₁⊗ℓ₂` maps to zero. Thus irreducibility cannot be omitted.
- Nonzero tensor cancellation is essential: with `A=O`, `V=0`, `Y=O` and `X=0`, the tensor of `Y→X` is an isomorphism, but `Y→X` is not. For saturation, take `V=O`, `Y=ϖO⊂X=O` and `W=0`. The composite has saturated zero image, but X/Y has ϖ-torsion; the composite must also be injective.

### 4.4 Emerton’s refined local–global compatibility


Let ρ̄ be modular and absolutely irreducible, with `ρ̄_p` satisfying Assumption 3.3.1 and p-distinguished. Prove the following two conclusions: (i) if `End(ρ̄_p) = k`, there is a T-linear `G_ℚ × G × G_{Σ_0}`-equivariant isomorphism `ρ^m_Σ ⊗_T π^m_Σ ⊗̃_T Π_{Σ_0} ≅ Ĥ^1_{O,ρ̄,Σ}`, with `X(π^m_Σ)_{ctf} ≅ Π_{Σ_0}` (EM11 Theorem 6.4.16 and Corollary 6.4.13); (ii) if `ρ̄_p` is a sum of distinct characters, Theorem 6.4.20 constructs some deformation θ with the required closed fibres and proves `ρ^m_Σ ⊗_T θ ⊗̃_T Π_{Σ_0} ≅ Ĥ^1_{O,ρ̄,Σ}`, with `X(θ)_{ctf} ≅ Π_{Σ_0}`. Part (ii), Conjecture 6.1.9, suffices for Theorem 1.2.1(2); it does not identify θ with the canonical `π^m_Σ`. The canonical conclusion in case (ii) is conditional on an additional isomorphism `θ ≅ π^m_Σ` compatible with the local deformation. In Nakamura’s `p ≥ 3`, `End(ρ̄_p) = k` setting, part (i) reads `ρ^m ⊗ π^m_p ⊗̃ π̃^m_{Σ_0} ≅ Ĥ^1_{ρ̄,Σ}`, where `π̃^m_{Σ_0} = Π_{Σ_0}`.

Assumption 3.3.1 and p-distinguishedness are retained. Scalar endomorphisms give the canonical family in (i). For split distinct characters, only the θ-family form (ii) is used; no representability argument identifies it with `π^m_Σ`. The converse direction of Corollary 6.4.13 (ev an isomorphism ⇒ (6.4.14)) needs `ρ̄_p` non-scalar (Assumption 5.7.3), which p-distinguishedness implies. This theorem uses no globalisation by Serre’s conjecture beyond the hypothesis that ρ̄ is modular.

A proof proceeds as follows.

1. Use the evaluation criterion of Theorem 6.4.9: faithfulness of a coadmissible Y and mod-ϖ m-torsion injectivity of `ev_Y` imply `ev_Y` is an isomorphism and `Y = X(θ)_{ctf}`. Density of allowable fibres supplies surjectivity (Theorem 6.4.7). The tensor lemmas are used with nonzero `ρ^m_Σ ⊗ θ`; C.52 additionally requires the composite embedding to be injective with saturated image. The zero tensor factor and a non-injective composite do not satisfy these hypotheses.
2. For `End(ρ̄_p) = k`, Theorem 6.4.16 reduces injectivity to the maps out of π̄ using Lemma 6.4.15. An irreducible socle alone does not prove every nonzero map injective: the Serre-weight upper bound and genericity in Theorem 5.7.7 exclude the possible quotient images, as in the proof on p. 88. These are explicit inputs of the new §2.4 node.
3. Distinct characters (Theorem 6.4.20, §6.5): at allowable points with `κ(𝔭) = E`, ρ(𝔭)° `⊗` π(𝔭)° `≅ F_{Σ_0}(M(𝔭)_O)` (Proposition 6.5.2), built into a deformation θ of π̄ by gluing over allowable ideals (Definitions 6.4.4, 6.5.6; Propositions 6.5.11, 6.5.13); conclude Conjecture 6.1.9.
4. Corollary 6.4.13 identifies `X(θ)_{ctf}` with `Π_{Σ_0}` under non-scalarity. Remark 6.1.11 identifies θ with `π^m_Σ` only when the deformation functor is representable, in particular in the scalar-endomorphism case. For split distinct characters retain θ unless an identification with the canonical deformation is supplied.
5. Nakamura’s form is the same statement with `π_{Σ_0}(ρ^m_Σ)` written as the contragredient of the maximal torsion-free quotient of `⊗ π̃^m_ℓ` (NAK Theorem 2.2).

**Checks.**

- For `ρ̄_p` absolutely irreducible (so `End(ρ̄_p) = k` and ρ̄ p-distinguished), `Ĥ^1_{O,ρ̄,Σ} ≅ ρ^m ⊗ π^m ⊗̃ π_{Σ_0}(ρ^m)`, and at every closed point 𝔭, `Ĥ^1_{E,ρ̄,Σ}[𝔭] ≅ ρ(𝔭) ⊗ B(ρ(𝔭)|G_{ℚ_p}) ⊗ π_{Σ_0}(ρ(𝔭))`.
- Non-example: for `ρ̄_p ≅ χ ⊗ χ` (scalar) the theorem is not proved; Emerton expects a mod p multiplicity two phenomenon there (Remark 6.1.22).

*Needs:* §4.3; §4.1 (awayFamily_descent, awayFamily_product); §4.2; §3.6; §3.5; §0.3; §0.4 (kisin deformation comparison); SmoothRepresentationsOfLocalGroups §§SR.5.1–SR.5.3; §2.4.

EM11, Conjectures 6.1.6 and 6.1.9, Remark 6.1.11, p. 67–68; Theorem 6.2.13, p. 75: The two refined conjectures differ by canonical `π^m` versus an unspecified θ. Use the θ conclusion of Theorem 6.4.20 for split distinct characters; the canonical conclusion additionally requires an identification with the canonical deformation.

EM11, Theorems 6.4.7, 6.4.9, 6.4.11, Corollary 6.4.13, Lemma 6.4.15, Theorems 6.4.16 and 6.4.20, pp. 84–89; §6.5, Proposition 6.5.2, pp. 89–94: The evaluation-map criterion, the identification of `X(θ)_{ctf}`, and the proofs in the trivial-endomorphism and distinct-character cases.

NAK, Theorem 2.2, p. 20: Emerton’s refined local–global compatibility in the form `ρ^m ⊗ π^m_p ⊗̃ π̃^m_{Σ_0} ≅ Ĥ^1_{ρ̄,Σ}`, under (a) `ρ̄_p` ≇ `χ ⊗` (1 ∗; 0 ε), (b) `p ≥ 3`, (c) `End(ρ̄_p) = F`.

### 4.5 Emerton’s local–global compatibility theorem


Let V be a continuous, irreducible, promodular two-dimensional representation of `G_ℚ` over E, unramified outside a finite set of primes, with residual representation V̄. Assume (a) V̄ is absolutely irreducible and (b) `V̄|G_{ℚ_p}` ≇ `χ ⊗` (1 ∗; 0 ε̄) for every k-valued character χ of `G_{ℚ_p}` (∗ zero or not). Then: (1) for some finite set Σ of primes containing p and the primes where V ramifies, there is a nonzero `GL_2(ℚ_p) × GL_2(𝔸_f^Σ)`-equivariant map `B(V|G_{ℚ_p}) ⊗ (⊗′_{ℓ∉Σ} π_ℓ(V)) → Hom_{E[G_ℚ]}(V, Ĥ^1_E)`, and if `V|G_{ℚ_p}` is neither the direct sum of two characters nor an extension of a character by itself, every such map is an embedding; (2) if V̄ is p-distinguished (`V̄|G_{ℚ_p}` ≇ `χ ⊗` (1 ∗; 0 1)), there is `a GL_2(𝔸_f)`-equivariant isomorphism `B(V|G_{ℚ_p}) ⊗ (⊗′_{ℓ≠p} π_ℓ(V)) ≅ Hom_{E[G_ℚ]}(V, Ĥ^1_E)`. Here `π_ℓ(V)` is the modified local Langlands representation (Tate normalisation, replaced by its generic constituent ordering when the classical representation is not generic) and B is the p-adic local Langlands correspondence. In the situation of (2) the structure of the summand of `Ĥ^1_E` (and of its unit ball) localised at V̄ is given by §4.4.

V must be promodular; the theorem itself does not invoke Serre’s conjecture. The two residual hypotheses are distinct: (b) for (1), the stronger p-distinguishedness for (2); the embedding clause of (1) has its own hypothesis on V (not V̄). (1) is only `GL_2(ℚ_p) × GL_2(𝔸_f^Σ)`-equivariant, for an unspecified finite Σ; only (2) gives full `GL_2(𝔸_f)-equivariance`. Emerton’s Remark 1.1.2: the unrestricted conjecture is expected to fail when `V|G_{ℚ_p}` is a twist of an extension of the cyclotomic character by the trivial character (B must then be longer, Remark 6.1.23); hypothesis (b) excludes the residual shape of that case.

A proof proceeds as follows.

1. V corresponds to a closed point 𝔭 `∈ Spec T_{ρ̄,Σ}[1/p]` with ρ̄ `= V̄` (promodularity and Σ large).
2. Nonzero map: Remark 6.4.3 (§4.3) gives `ρ(𝔭) ⊗ π(𝔭) → Ĥ^1_{E,ρ̄,Σ}[𝔭]` nonzero, and `π(𝔭) = B(V|G_{ℚ_p})` (EM11 Theorem 6.2.1).
3. Embedding: if `V|G_{ℚ_p}` is irreducible, B is topologically irreducible (Proposition 3.3.24, from §0.3); otherwise `V|G_{ℚ_p}` is a non-split extension of distinct characters and B is a non-split extension described in Propositions 3.4.2/3.4.5; a non-injective map factors through its parabolic-induction quotient (using §1.1’s absence of one-dimensional subrepresentations (EM11 Lemma 5.1.3): `Ĥ^1_E` has no one-dimensional G-subrepresentations), and the adjunction `Hom_G(Ind_{B̄}^G U,Π) ≅ Hom_T(U,Ord_B Π)` of §0.1, with `Ind_B^G χ ≅ Ind_{B̄}^G χ^w` for unnormalised induction and the same Weyl-conjugation of characters in the EM11 ordinary-parts comparison, plus the abelian Galois action on `Ord_B(Ĥ^1)/Ord_B(Ĥ^1)^{ab,S}` (Corollary 5.6.13) shows such maps vanish (EM11 Proposition 6.2.2; the ordinary-parts functor and its adjunction are supplied by §0.1).
4. Pass from `Hom(V, Ĥ^1_{E,ρ̄,Σ}[𝔭])` to `Hom(V, Ĥ^1_E)` by §3.5(b) and add the unramified places by the argument of EM-PAMQ Proposition 7.8.7 (EM11 proof of Theorem 1.2.1, pp. 75–76).
5. (2): Theorem 6.2.4 (§4.2) and Theorem 6.2.13 (§4.4) give Conjectures 6.1.4 and 6.1.9, and Proposition 6.1.17 with Lemma 6.1.19 deduces Conjecture 1.1.1 for V.

**Checks.**

- For `V = V_f` attached to a newform of weight `k ≥ 2` and level prime to p with V̄ absolutely irreducible and `V̄|G_{ℚ_p}` absolutely irreducible, (2) gives `Hom(V_f, Ĥ^1_E) ≅ B(V_f|G_{ℚ_p}) ⊗ ⊗′_{ℓ≠p} π_ℓ(V_f)`.
- Non-example: if `V|G_{ℚ_p} = χ ⊕ χ′` is a sum of two characters, (1) only gives a nonzero map; injectivity can fail because B is then a sum of two principal series whose map may kill one summand.

*Needs:* §4.4; §4.2; §4.3; §3.5; §1.1; §0.1; §0.3.

EM11, Theorem 1.2.1, pp. 3–4: The main theorem with its two residual hypotheses, the nonzero (resp. injective) map in (1) and the isomorphism in (2) under p-distinguishedness.

EM11, Theorem 6.2.1, Proposition 6.2.2, pp. 71–72; proof of Theorem 1.2.1, pp. 75–76; Proposition 6.1.17 and Lemma 6.1.19, pp. 69–70: Nonzero map from Remark 6.4.3, the closed-embedding criterion via ordinary parts and Lemma 5.1.3, and the deduction of Conjecture 1.1.1 from Conjectures 6.1.4 and 6.1.9.

EM11, Remark 1.1.2, p. 2; Remark 6.1.23, pp. 70–71: The expected failure of the conjecture as stated when `V|G_{ℚ_p}` is a twist of an extension of ε by 1.

### 4.6 Mod p local–global compatibility and Serre’s adelic reformulation


Let `H^1_k = colim_{K_f} H^1_ét(Y(K_f)_{ℚ̄}, k)` with its `G_ℚ × GL_2(𝔸_f)`-action, and let ρ̄: `G_ℚ → GL_2(k)` be absolutely irreducible and modular. Suppose `p > 2` and `ρ̄|G_{ℚ_p}` ≇ `χ ⊗` (1 ∗; 0 1) and ≇ `χ ⊗` (1 ∗; 0 ε̄) for every k-valued χ. Then there is a k-linear `GL_2(𝔸_f)`-equivariant isomorphism π̄ `⊗_k (⊗′_{ℓ≠p} π(ρ̄|G_{ℚ_ℓ})) ≅ Hom_{k[G_ℚ]}(ρ̄, H^1_k)`, where π̄ is attached to `ρ̄|G_{ℚ_p}` by the mod p local Langlands correspondence and `π(ρ̄|G_{ℚ_ℓ})` by the mod p local Langlands correspondence for `GL_2(ℚ_ℓ)` in families (Emerton–Helm); equivalently ρ̄ `⊗ π̄ ⊗ ⊗′_{ℓ≠p} π(ρ̄|G_{ℚ_ℓ}) ≅ H^1_{k,ρ̄}[m]`. Taking invariants under compact open subgroups recovers classical mod p multiplicity one results; the `GL_2(ℤ_p)-socle` of π̄ recovers Serre’s weights and the conductor of the away-from-p factor Serre’s level, answering Serre’s question 3.4(2) for these ρ̄.

`p > 2` is required: the `p = 2` statement is expected but unproved because the mod 2 local Langlands correspondence in families at `ℓ ≠ 2` is incompletely understood (Emerton Remarks 1.2.7, 6.1.3, 6.1.21). The two excluded local shapes are those of Theorem 1.2.3(c); Emerton conjectures the first removable for `p > 3` (Remark 1.2.9). The hypothesis ‘modular’ is used as stated; its replacement by ‘odd’ uses the full Serre conjecture (Khare–Wintenberger, Kisin), a globalisation dependence recorded in §6.5.

A proof proceeds as follows.

1. Theorem 6.2.13 (§4.4) gives Conjecture 6.1.9 for every `Σ_0` (p-distinguishedness is the first exclusion).
2. Reduce (6.1.10) mod ϖ, take m-torsion, use Lemma C.45 and the mod p fibre of `π_{Σ_0}(ρ^m_Σ)` for `p > 2` (§4.1(b)) to get ρ̄ `⊗ π̄ ⊗ π_{Σ_0}(ρ̄) ≅ H^1_{k,ρ̄,Σ}[m]`; pass to the limit over `Σ_0` (EM11 Proposition 6.1.20, proof of Theorem 1.2.6).
3. The proof uses only the more straightforward classical multiplicity one theorems, not level lowering at p, companion forms, or the harder part of Wiles’s Theorem 2.1(ii) (EM11 Remarks 1.2.8, 6.2.15).

**Checks.**

- For `ρ̄|G_{ℚ_p}` absolutely irreducible, π̄ is supersingular and its `GL_2(ℤ_p)-socle` is the set of Serre weights `W(ρ̄)`, so taking `GL_2(ℤ_p)K^p`-invariants twisted by a Serre weight σ shows `Hom_{GL_2(ℤ_p)}(σ, H^1_{k,ρ̄}[m]) ≠ 0` exactly for `σ ∈ W(ρ̄)`.
- For `ρ̄|G_{ℚ_p}` scalar (excluded) Emerton predicts multiplicity two (Remark 6.1.22).

*Needs:* §4.4; §4.1; §0.2; §0.5 (localSerreWeights and its Hecke-module comparison); §2.4.

EM11, Theorem 1.2.6 and Remarks 1.2.7–1.2.10, pp. 5–6: The mod p local–global isomorphism for `H^1_k`, its expected `p = 2` analogue, its relation to classical multiplicity one, and the recovery of Serre’s weight and level.

EM11, Proposition 6.1.20, Remarks 6.1.21–6.1.22, p. 70; proof of Theorem 1.2.6 and Remark 6.2.15, p. 76: Derivation from Conjecture 6.1.9 by reduction mod ϖ, and the list of classical results not used.

SERRE87, §3.4, question (2), p. 198: Serre asks whether his conjecture admits a reformulation in terms of mod p representations of the adelic `GL_2`; the theorem answers this for the ρ̄ it covers.

### 4.7 Dual local–global compatibility for completed homology


Assume (a) `ρ̄_p` ≇ `χ ⊗` (1 ∗; 0 ε), (b) `p ≥ 3`, (c) `End_k(ρ̄_p) = k`, ρ̄ odd absolutely irreducible unramified outside `Σ ∪ {∞}`. Let `H̃^{BM}_{1,ρ̄,Σ}` be the ρ̄-part of completed Borel–Moore homology at levels `K_{Σ_0}` (the Pontryagin–Schikhof dual of `Ĥ^1_{c,ρ̄,Σ} ≅ Ĥ^1_{ρ̄,Σ}`). Then: (1) there is `a T_{ρ̄,Σ}[G_ℚ × G_Σ]`-linear topological isomorphism `H̃^{BM}_{1,ρ̄,Σ} ≅ (π^m_p)^* ⊗_{T} (ρ^m)^* ⊗_T π^m_{Σ_0}`; (2) for A complete local noetherian, deformations ρ of `ρ̄_p` and π of `π̄_p` over A and a co-Whittaker `A[G_{Σ_0}]`-module `V` in the sense of `awayFamily_product`, `End^cont_{A[G_{ℚ_p}×G_Σ]}(π^* ⊗_A ρ^* ⊗_A V) = A`; hence `End^cont_{T[G_ℚ×G_Σ]}(H̃^{BM}_{1,ρ̄,Σ}) = End^cont_{T[G_{ℚ_p}×G_Σ]}(H̃^{BM}_{1,ρ̄,Σ}) = T_{ρ̄,Σ}` and the isomorphism of (1) is unique up to `T_{ρ̄,Σ}^×`; (3) under the stronger (a)′ `ρ̄_p` ≇ `χ ⊗` (1 ∗; `0 ε^{±1}`), (b)′ `p ≥ 5` and (c), with `R_p` the universal deformation ring of `ρ̄_p` and P̃ the projective envelope of the dual of the socle of `π̄_p (R_p ≅ End(P̃)`), `H̃^{BM}_{1,ρ̄,Σ} ≅` (P̃ `⊗̂_{R_p} (ρ^m)^*) ⊗_T π^m_{Σ_0}`.

Nakamura’s hypotheses (a)–(c), resp. (a)′–(b)′–(c); `End(ρ̄_p) = k` makes `Def(π̄_p)` representable and `π^m_p` the pullback of the universal deformation. The duals are continuous T-linear duals; coadmissible modules (Nakamura Appendix B.2.4) are used for `π^m_{Σ_0}`.

A proof proceeds as follows.

1. (1): dualise §4.4 in Nakamura’s form, using the identification `H̃^{BM}_{1,ρ̄,Σ} ≅ (Ĥ^1_{c,ρ̄,Σ})^d ≅ (Ĥ^1_{ρ̄,Σ})^d` (NAK Lemma 2.4 and §2.1.4) and Nakamura’s Lemma B.16 on duals of completed tensor products with coadmissible modules (NAK Corollary 2.5); the tame-level duality is CompletedCohomologyPartII §3.9 (tame level borel moore duality).
2. (2): by `awayFamily_product` (§4.1), the extension to `G_{Σ_0}` of Lemma B.10 (endomorphisms of co-Whittaker modules after coefficient tensoring, SmoothRepresentationsOfLocalGroups §SR.5.3), reduce to `End(π^* ⊗ ρ^*) = A`, which follows from `End(ρ̄_p) = k`, `End(π̄_p) = k` (Emerton Remark 3.3.14) and Schikhof duality (NAK Lemma 2.6, Corollary 2.7).
3. (3): `π^m_p = π_p ⊗_{R_p} T` with `π_p` universal, so `(π^m_p)^* ≅ π_p^* ⊗̂_{R_p} T`, and `π_p^* ≅ P̃` by Nakamura’s Proposition B.26 (Paškūnas’s theory, supplied by §0.4) (NAK Corollary 2.8).

**Checks.**

- Nakamura’s zeta morphisms are `T_{ρ̄,Σ}[G_ℚ × G_Σ]`-linear maps out of `H̃^{BM}_{1,ρ̄,Σ}`; by (2) they are determined by their values after composing with the isomorphism of (1).
- Non-example: for `ρ̄_p` with `End(ρ̄_p) ≠ k` (e.g. `ρ̄_p` split with distinct characters), (2) fails: `End(π^* ⊗ ρ^*)` contains the idempotents of the two summands.

*Needs:* §4.4; §4.1 (awayFamily_descent, awayFamily_product); §2.6; §1.4; CompletedCohomologyPartII §3.9 (tame level borel moore duality); CompletedCohomologyPartII §3.8 (tame level completed modules); SmoothRepresentationsOfLocalGroups §§SR.5.1–SR.5.3; §0.4; §0.4 (dual of universal deformation); §0.4 (removing projective envelope).

NAK, Corollary 2.5, Lemma 2.6, p. 25; Corollary 2.7, Corollary 2.8 and its proof, p. 26: The dual local–global isomorphism for completed Borel–Moore homology, the computation of its endomorphisms as `T_{ρ̄,Σ}` (so the isomorphism is unique up to units), and its description through Paškūnas’s projective envelope P̃ under the stronger hypotheses.

### 4.8 The multiplicity module of the definite quaternionic tower


In the setting of §1.6 for `F = ℚ` and B̄ split at p, let r̄: `G_{ℚ,Σ} → GL_2(k)` be modular of tame level `K^p` with `r̄|G_{ℚ_p}` absolutely irreducible, `m ⊂ T̃_Σ` the corresponding maximal ideal and `A = T̃_{Σ,m}` (§3.7). Let `Π^{univ}` be the orthonormalizable admissible A[G]-module with continuous G-action such that `Π^{univ} ⊗_A k(𝔭) ≅ Π(𝔭)` for every 𝔭 `∈` MaxSpec A[1/p] (local Langlands in families for absolutely irreducible `r̄_p`), and π̄ `= Π^{univ}/mΠ^{univ}`, a smooth irreducible k-representation. Define `M = Hom^cont_{A[G]}(Π^{univ}, C^0(X, O)_m)`, with the m-adic topology on `Π^{univ}` and the subspace topology on `C^0(X, O)_m`, and its Schikhof dual `M^* = Hom_O(M, O)` with the topology of pointwise convergence. Then M is O-flat, separated and complete for the p-adic topology, `M = Hom^cont_O(M^*, O)`; `M^*` is a finitely generated A-module; for 𝔭 `∈` MaxSpec A[1/p], M[𝔭][1/p] `= k(𝔭) ⊗_{A/𝔭}` M[𝔭] `≅ Hom^cont_G(Π(𝔭), C^0(X)[𝔭]) ≅ Hom^cont_{A[G]}(Π(𝔭), C^0(X)_m)` is finite-dimensional, dual to `M^* ⊗_A k(𝔭)`, and nonzero iff 𝔭 `∈` Supp `M^*[1/p]`.

`r̄|G_{ℚ_p}` absolutely irreducible (DLB’s Hypothèse); this makes π̄ irreducible and `Π^{univ}` exist as stated. `Π^{univ}` is a local object supplied by §0.4 (the deformation of π̄ over the universal deformation ring of `r̄_p`, base-changed to A).

Use the following named interfaces:

- `TauCeti.DefiniteQuaternionCompleted.multiplicityModule` (constructor): `M = Hom^cont_{A[G]}(Π^{univ}, C^0(X, O)_m)`.
- `TauCeti.DefiniteQuaternionCompleted.multiplicityDual` (constructor): `M^* = Hom_O(M, O)` with the topology of pointwise convergence; `M = Hom^cont_O(M^*, O)`.
- `TauCeti.DefiniteQuaternionCompleted.multiplicityDual_finite` (characterisation): `M^*` is a finitely generated A-module.
- `TauCeti.DefiniteQuaternionCompleted.multiplicityModule_fibre` (simp): M[𝔭][1/p] `≅ Hom^cont_G(Π(𝔭), C^0(X)[𝔭])` for 𝔭 `∈` MaxSpec A[1/p].
- `TauCeti.DefiniteQuaternionCompleted.multiplicityModule_support` (characterisation): M[𝔭][1/p] `≠ 0` iff 𝔭 `∈` Supp `M^*[1/p]`.
- `TauCeti.DefiniteQuaternionCompleted.multiplicityEvaluation` (data): The evaluation map `Π^{univ} ⊗̂_A M → C^0(X, O)_m`.

**Checks.**

- `TauCeti.DefiniteQuaternionCompleted.multiplicityModule_flat` (characterisation): M is O-torsion-free and p-adically separated and complete.
- `TauCeti.DefiniteQuaternionCompleted.multiplicityDual_mod_m` (computation): `dim_k M^*/mM^* = dim_k` (M/ϖM)[m] `≤ dim_k LC(X(K_p)`, k) for `K_p` fixing a vector of π̄.
- `TauCeti.DefiniteQuaternionCompleted.multiplicityModule_zero_degenerate` (degenerate): If `C^0(X, O)_m = 0` then `M = M^* = 0` and Supp `M^*` is empty.
- `TauCeti.DefiniteQuaternionCompleted.multiplicityModule_compatibility` (compatibility): M is the quaternionic analogue of Emerton’s `X(θ)`: Hom of the universal family into the localised completed module, with T replaced by A.

DLB, Théorème 5.4 and its proof: The evaluation map (`Π^{univ} ⊗̂_A` M)[1/p] `→ C^0(X)_m` is shown to be an isomorphism. DLB, Proposition 13.5: Nonvanishing of M[𝔭][1/p] at every closed point is the weak local–global statement.

A proof proceeds as follows.

1. M is O-flat and p-adically complete since `C^0(X, O)_m` is (closed subspace of continuous O-valued functions); Schikhof duality gives `M = Hom^cont(M^*, O)` (DLB Définition 13.3).
2. Fibres: `Π^{univ} ⊗_A k(𝔭) ≅ Π(𝔭)` gives Remark 13.4 directly.
3. Finite generation: `M^*` is compact, so by topological Nakayama it suffices that `M^*/mM^*` is finite-dimensional; its dual (M/ϖM)[m] embeds in `Hom_{k[G]}(π̄, LC(X, k)_m) ⊂ LC(X(K_p)`, k) for `K_p` fixing a nonzero vector of π̄, a finite-dimensional space since `X(K_p)` is finite (DLB Lemme 13.6).
4. Finite-dimensionality and the support criterion follow from finite generation and Nakayama (DLB Lemme 13.7).

**Checks.**

- At a classical crystalline point 𝔭 (Lemma 13.9), M[𝔭] `⊗ k(𝔭) ≠ 0`.
- `M^*` is finitely generated over A but not in general free; its support in Spec A[1/p] is closed.

*Needs:* §1.6; §3.7; §1.7; §0.4; LocalGaloisDeformationRings §3.7.1 (GL2Block.projectiveEnvelope and E_B); CompletedCohomologyPartII §3.13 (orthonormalizable and profree modules); CompletedCohomologyPartII §3.14 (coefficient module duality); `mathlib:Module.support`; `mathlib:Module.Finite.`

DLB, §13, paragraph before Définition 13.3, Définition 13.3, Remarque 13.4, p. 69; Lemmes 13.6–13.7, p. 70: The family `Π^{univ}` over A, π̄ `= Π^{univ}/m` irreducible, the module M of continuous A[G]-maps from `Π^{univ}` into `C^0(X, O)_m` with its Schikhof dual `M^*`, the fibre isomorphisms, finite generation of `M^*` and the support criterion.

### 4.9 Local–global compatibility for a definite quaternion algebra


In the setting of §4.8 (F `= ℚ`, B̄ definite and split at p, r̄ modular with `r̄|G_{ℚ_p}` absolutely irreducible): (1) for every maximal ideal 𝔭 of A[1/p], `Hom^cont_G(Π(𝔭), C^0(X)[𝔭]) ≠ 0` (weak local–global compatibility, DLB Proposition 13.5); (2) the evaluation map (`Π^{univ} ⊗̂_A` M)[1/p] `→ C^0(X)_m` (ϖ-adically completed tensor product) is an isomorphism; (3) for every maximal ideal 𝔭 of A[1/p], `C^0(X)[𝔭] ≅ Π(𝔭)^{⊕r}` as G-representations, for some integer `r > 0` (Emerton’s local–global compatibility for B̄, DLB Theorem 5.4). The proof passes through the family C of classical crystalline points: σ automorphic on `B̄^*(A)`, unramified outside Σ, with `σ_f^{K^p} ≠ 0`, `σ_p^{GL_2(ℤ_p)} ≠ 0` and `r̄_σ = r̄`, giving `𝔭_σ`; C is Zariski dense in Spec A[1/p], and for 𝔭 `∈ C` the locally algebraic vectors LP(X)[𝔭] lie in the image of `Π(𝔭) ⊗ Hom^cont_G(Π(𝔭), C^0(X)[𝔭])`.

`r̄|G_{ℚ_p}` absolutely irreducible; the argument is Emerton’s, simplified by this hypothesis (DLB §5.1). The local inputs are Berger–Breuil in its non-exceptional range and `crystallineNonspecialCompletion` (CDP Theorem 3.23(a), including the exceptional crystalline case at every p): for the crystalline absolutely irreducible ρ at a point of C, with weights `a < b` and spherical irreducible principal series `σ_p`, Π(𝔭) is the universal unitary completion of `σ_p ⊗ Sym^{b−a−1}E² ⊗ det^a`. The other local input is the existence of `Π^{univ}`; both are supplied by §§0.3–0.4. Emerton’s functional-analytic lemmas on completed tensor products with admissible orthonormalizable A[G]-modules are used as DLB use them (separatedness, closed image, m-torsion of reductions, 𝔭-parts).

A proof proceeds as follows.

1. (1): by Lemma 13.7 it suffices that Supp `M^*[1/p]` is Zariski dense; C is Zariski dense (A[1/p] acts faithfully on `C^0(X)_m`, `GL_2(ℤ_p)-algebraic` vectors are dense (§2.2(c)) and lie in `Σ_{𝔭∈C} C^0(X)_m[𝔭]` by §2.7) (DLB Lemme 13.8); for every 𝔭 `∈ C`, §0.3’s `crystallineNonspecialCompletion` (Berger–Breuil in the non-exceptional case and CDP Theorem 3.23(a) in full) gives `Hom^cont_G(Π(𝔭), C^0(X)[𝔭]) = Hom_G(σ_p ⊗ W, LP(X)[𝔭]) ≠ 0` and the image statement (DLB Lemme 13.9).
2. (2) injectivity: `Π^{univ} ⊗̂ M` is ϖ-adically separated (Emerton [33] Lemma 3.1.16), so test mod ϖ; on m-torsion, Emerton’s Lemma B.6 identifies the source with (M/ϖ)[m] `⊗ π̄`, which embeds in π̄ `⊗` Hom(π̄, LC(X, k)[m]) `→ LC(X, k)[m]`, injective as π̄ is smooth irreducible; every element of the reduction is killed by a power of m (DLB proof of Théorème 5.4).
3. (2) surjectivity: `M^*` finitely generated and `Π^{univ}` admissible orthonormalizable give a closed image (Emerton Proposition 3.1.3 with Lemma 3.1.16); the image contains LP(X)[𝔭] for 𝔭 `∈ C`, whose sum is dense.
4. (3): take 𝔭-parts of (2) with Emerton’s Lemma 3.1.17: `C^0(X)[𝔭] ≅ Hom_A(A/𝔭, M) ⊗̂ Π^{univ}[1/p] ≅ Π(𝔭) ⊗` M[𝔭][1/p], and `r = dim` M[𝔭][1/p] `> 0` by (1).

**Checks.**

- For 𝔭 `= 𝔭_σ ∈ C` with `σ_p` unramified principal series and `r(𝔭)|G_{ℚ_p}` crystalline irreducible, `r ≥ dim_E (σ_f^p)^{K^p} = dim_E σ_f^{K^pGL_2(ℤ_p)}`. The space `σ_f^{K^p} = σ_p ⊗ (σ_f^p)^{K^p}` itself is infinite-dimensional, since K^p has no component at p, so it cannot bound the finite multiplicity r.
- At a point of C with an exceptional double-root crystalline parameter, the spherical irreducible principal series still lies in CDP’s nonspecial branch; `crystallineNonspecialCompletion` gives the same Hom extension and image statement, including at p=2, without removing the point from C.
- Non-example: without `r̄|G_{ℚ_p}` absolutely irreducible, `Π^{univ}` as stated need not exist and `C^0(X)[𝔭]` can have constituents not isomorphic to Π(𝔭).

*Needs:* §4.8; §2.2; §2.7; §3.7; §0.3; §0.4; LocalGaloisDeformationRings §3.7.1 (GL2Block.projectiveEnvelope); CompletedCohomologyPartII §3.15 (mixed completed tensor); CompletedCohomologyPartII §3.16 (mixed tensor dual comparison); GL2AutomorphicRepresentationsAndTransfer R17.3 (global jl).

DLB, §5.1, Théorème 5.4, p. 26; §13, Proposition 13.5, Lemmes 13.8–13.9, pp. 70–71; proof of Théorème 5.4, pp. 72–73: Emerton’s local–global compatibility for the definite quaternion algebra B̄ split at p: `C^0(X)[𝔭] ≅ Π(𝔭)^{⊕r}`, proved through the weak statement at a Zariski-dense set of classical crystalline points, §0.3’s completion theorem (Berger–Breuil and CDP Theorem 3.23(a), §3.3.4, pp. 24–26), and the evaluation isomorphism (`Π^{univ} ⊗̂` M)[1/p] `≅ C^0(X)_m`.

EM11, Proposition 3.1.3, Lemmas 3.1.16–3.1.17, pp. 14–18; Lemma B.6, p. 100: The functional-analytic facts on admissible orthonormalizable A[G]-modules that DLB cite as [33].

### 4.10 The block multiplicity module


In Pan’s §3 setting (p odd, F totally real, p splitting completely, D definite and split above p, so `D_p^× = ∏_{v|p}GL_2(ℚ_p)`), let m be a maximal ideal of `T_ψ(U^p)` with residual pseudo-representation `ρ̄_m`, and `B_m = ⊗_{v|p} B_{m,v}` the block of the category `C_{D_p^×,ψ}(O)` of compact `O[[K_p]]`-modules with compatible `D_p^×`-action and central character ψ attached to `(ρ̄_m|G_{F_v})_{v|p}` (with the cyclotomic twist of Remark 3.5.3). Let `P_{B_m}` be the projective envelope of the direct sum of the irreducible objects of the block (a projective generator of its compact block category), `E_{B_m} = End(P_{B_m})` and `R_p^{ps,ψε^{-1}} = ⊗̂_{v|p} R_v^{ps,ψε^{-1}}` the completed tensor product of the universal two-dimensional pseudo-deformation rings with determinant `ψε^{-1}`. Define `m := Hom_{C_{D_p^×,ψ}(O)}(P_{B_m}, M_ψ(U^p)_m)`. It carries two actions of `R_p^{ps,ψε^{-1}}`: `τ_Gal`, through `T_ψ(U^p)_m` acting on `M_ψ(U^p)_m` and the restrictions of the Hecke pseudo-representation to the decomposition groups at v | p; and `τ_Aut`, through the finite central homomorphism `R_p^{ps,ψε^{-1}} → E_{B_m}` of Pan Corollary 3.4.12, with the `ε^{-1}` twist in 3.5.4 acting on `P_{B_m}`. When `M_ψ(U^p)_m` lies in the block `B_m`, `M_ψ(U^p)_m ≅ m ⊗̂_{E_{B_m}} P_{B_m}`.

Blocks and projective envelopes are Paškūnas’s theory for `GL_2(ℚ_p)` (Pan §3.4), supplied for each factor by LocalGaloisDeformationRings §3.7.1 and for the product block by §0.4; `p = 3` has a block (containing δ∘det) excluded in Theorem 3.5.5. The normalisation of Colmez’s functor in Paškūnas’s papers introduces the cyclotomic twist between `ρ̄_m|G_{F_v}` and the block (Pan Remark 3.5.3).

Use the following named interfaces:

- `TauCeti.DefiniteQuaternionCompleted.block` (data): `B_m = ⊗_{v|p} B_{m,v}`, the block of `C_{D_p^×,ψ}(O)` attached to `(ρ̄_m|G_{F_v})_v` with Pan’s cyclotomic twist.
- `TauCeti.DefiniteQuaternionCompleted.blockMultiplicity` (constructor): `m = Hom_{C_{D_p^×,ψ}(O)}(P_{B_m}, M_ψ(U^p)_m)`.
- `TauCeti.DefiniteQuaternionCompleted.galoisAction` (data): `τ_Gal`: `R_p^{ps,ψε^{-1}} → End(m)` through `T_ψ(U^p)_m`.
- `TauCeti.DefiniteQuaternionCompleted.automorphicAction` (data): `τ_Aut`: `R_p^{ps,ψε^{-1}} → End(m)` through the centre of `E_{B_m}`.
- `TauCeti.DefiniteQuaternionCompleted.blockMultiplicity_reconstruct` (characterisation): If `M_ψ(U^p)_m` lies in `B_m`, `m ⊗̂_{E_{B_m}} P_{B_m} ≅ M_ψ(U^p)_m`.

**Checks.**

- `TauCeti.DefiniteQuaternionCompleted.blockMultiplicity_zero` (degenerate): If `M_ψ(U^p)_m` has no constituent in `B_m` then `m = 0`.
- `TauCeti.DefiniteQuaternionCompleted.blockMultiplicity_supersingular` (computation): If each `ρ̄_m|G_{F_v}` is absolutely irreducible, `E_{B_m} = R_p^{ps}` and `τ_Aut` is the structure map of m as an `E_{B_m}`-module.
- `TauCeti.DefiniteQuaternionCompleted.blockMultiplicity_compatibility` (compatibility): On the block component, evaluation from `Hom(P_{B_m},M) ⊗̂_{E_{B_m}} P_{B_m}` recovers M. If M belongs to a disjoint block, the Hom module is zero. This tests the choice of a projective generator of the whole block rather than one arbitrary projective object.
- `TauCeti.DefiniteQuaternionCompleted.blockMultiplicity_not_hecke` (non-example): `τ_Gal` and `τ_Aut` are a priori different maps; equating them is the content of Pan’s Theorem 3.5.5, not part of the definition.

PAN, Theorem 3.5.5: Local–global compatibility is the equality `τ_Gal = τ_Aut` on m. PAN, Corollary 3.5.10 and §4.7: m is finite faithful over `T_ψ(U^p)_m` and is the module patched at a one-dimensional prime. GL2ModularityLifting §§10.1–10.6 (through Layer 4): The block multiplicity module, finite and faithful over the completed Hecke algebra (input CC3).

A proof proceeds as follows.

1. Import each local block’s projective generator from LocalGaloisDeformationRings §3.7.1 and its central pseudo-deformation map from §3.8 there; §0.4 forms the product block. Pan Lemmas 3.4.10–3.4.11 and Corollary 3.4.12 construct the product-block projective generator and show the completed tensor product of pseudo-deformation rings maps finitely into its centre. They do not assert that this product map is an isomorphism; Remark 3.4.13 explicitly leaves an integral centre identification open in one case.
2. `M_ψ(U^p)_m` is a compact `O[[K_p]]`-module with central character `ψ^{-1}` (§1.7(c)) and a compatible `D_p^×`-action, so it is an object of `C_{D_p^×,ψ}(O)`; Hom from `P_{B_m}` is exact on the `B_m-component`.
3. `τ_Gal`: `T_ψ(U^p)_m` acts on `M_ψ(U^p)_m` commuting with `D_p^×`, hence on m; the Hecke pseudo-representation restricted to `G_{F_v}` gives `R_v^{ps} → T_ψ(U^p)_m` (Pan 3.3 last paragraph). `τ_Aut`: the centre of `E_{B_m}` acts on `P_{B_m}`, hence on m (Pan 3.5.4).

**Checks.**

- For `ρ̄_m|G_{F_v}` absolutely irreducible at every v | p, each `B_{m,v}` contains a single supersingular representation and `E_{B_m}` is commutative, equal to `R_p^{ps}`.
- m/mm is finite-dimensional over k (Pan Corollary 3.5.11 proof).

*Needs:* §1.6; §1.7; §3.7; §3.2; LocalGaloisDeformationRings §3.7.1 (GL2Block); LocalGaloisDeformationRings §3.8 (WDTypeRing.blockIdentification); §0.4 (product blocks); IntegralHeckeAndGaloisDeterminants IHG.0–IHG.1.

PAN, §3.4, Theorems 3.4.5–3.4.6, Lemmas 3.4.10–3.4.11, Corollary 3.4.12, pp. 26–28: Paškūnas’s blocks, projective envelopes and their endomorphism rings for `GL_2(ℚ_p)`, and the product version for `D_p^× =` ∏ `GL_2(ℚ_p)` with a finite central map from `R_p^{ps}`; no general integral centre isomorphism is asserted.

PAN, 3.5.1, Definition 3.5.2, Remark 3.5.3, 3.5.4, p. 29: The block `B_m` attached to m, the module `m = Hom(P_{B_m}, M_ψ(U^p)_m)`, and the two actions `τ_Gal` and `τ_Aut` of `R_p^{ps}`.

### 4.11 Pan’s semisimple local–global compatibility


In the setting of §4.10 with p odd, if `p = 3` assume δ∘det `∉ B_{m,v}` for every v | p. Then: (1) `M_ψ(U^p)_m` lies in the block `B_m`; (2) the two actions `τ_Gal` and `τ_Aut` of `R_p^{ps,ψε^{-1}}` on m coincide (Pan’s Theorem 3.5.5); (3) m is a faithful, finitely generated `T_ψ(U^p)_m`-module and `T_ψ(U^p)_m` is a finite `R_p^{ps,ψε^{-1}}-algebra` (Corollary 3.5.10); (4) `S_ψ(U^p, k)[m]` is `a D_p^×`-representation of finite length (Corollary 3.5.11); (5) if 𝔭 is a maximal ideal of `T_ψ(U^p)_m[1/p]` such that for every v | p, `ρ(𝔭)|G_{F_v}` is absolutely irreducible and de Rham with distinct Hodge–Tate weights (ρ(𝔭) the semisimple representation with trace the Hecke pseudo-representation mod 𝔭), then 𝔭 is the pullback of a maximal ideal of a classical Hecke algebra `T_{(k,w),ψ}(U^pU_p)[1/p]` for some weight (k, w) and `U_p ⊂ K_p`, i.e. comes from a classical automorphic representation of (D `⊗ 𝔸_F^∞)^×` and, by Jacquet–Langlands, from a regular algebraic cuspidal automorphic representation of `GL_2(𝔸_F)` (Corollary 3.5.12); (6) every irreducible component of `T_ψ(U^p)_m` has characteristic zero and dimension at least `1 +` 2[F : `ℚ`] (Theorem 3.6.1).

Pan’s §3 hypotheses; the `p = 3` exclusion concerns the block containing δ∘det. The proof relies on the semisimplicity of the Hecke action at finite levels and compares the two actions only on classical crystalline points; it does not need `ρ̄_m` irreducible (it covers the residually reducible case). (5) uses the absolute irreducibility of ρ(𝔭) at every place above p; Paškūnas’s Theorem 1.10 (all irreducible subquotients of the specialisation are isomorphic) is the local input.

A proof proceeds as follows.

1. (1)–(2) follow Emerton: by the density result (§2.2(c), Pan Proposition 3.2.9) it suffices to compare the actions at classical crystalline points, where §0.3’s `crystallineNonspecialCompletion` (Berger–Breuil and CDP Theorem 3.23(a)) and classical local–global compatibility at p identify them (Pan proof of Theorem 3.5.5, Lemmas 3.5.6–3.5.9; local inputs from §§0.3–0.4).
2. (3): faithfulness from (1); finite generation over `E_{B_m}` by Paškūnas’s Proposition 4.17 (`S_ψ(U^p`, E/O) is admissible), `E_{B_m}` finite over `R_p^{ps}`, and `τ_Gal = τ_Aut` factors through `T_ψ(U^p)_m` (Pan Corollary 3.5.10).
3. (4): m/mm is finite-dimensional, hence of finite length over `E_{B_m}` (Pan Corollary 3.5.11).
4. (5): for `𝔭_v` the pullback to `R_v^{ps}`, all irreducible subquotients of `Hom^cont(P_{B_m,v}/𝔭_vP_{B_m,v}, E)` are isomorphic to one `Π_v` (Paškūnas), whose locally algebraic vectors are nonzero for de Rham with distinct weights (Colmez); a nonzero map into `S_ψ(U^p)_E[𝔭]` produces locally algebraic vectors, which are classical by §2.7 (Pan proof of Corollary 3.5.12); Jacquet–Langlands is GL2AutomorphicRepresentationsAndTransfer R17.3 (global jl).
5. For (6), use Pan’s Gelfand–Kirillov dimension argument: Lemma 3.6.4 identifies the associated graded Iwasawa algebra with a polynomial ring in `3[F:ℚ]` variables; Lemmas 3.6.9–3.6.11 control Artin–Rees, exact sequences and a central non-zero-divisor; Proposition 3.6.12 bounds the dimension of the block tensor product, and Lemma 3.6.14 bounds the special fibre. This uses the `panBlockDimension` supplier contract above; finite commutative support lemmas do not supply it.

**Checks.**

- For `F = ℚ` (where Pan’s even-degree assumption is dropped in §3) and m non-Eisenstein with `ρ̄_m|G_{ℚ_p}` absolutely irreducible, (2) recovers the `R_p-linearity` of DLB’s local–global compatibility (§4.9).
- Part (5) does not apply when a local Galois representation is reducible. Some such points are classical; reducibility alone is not a counterexample to classicality.

*Needs:* §4.10; panBlockDimension (supplier contract); CompletedCohomologyPartII §§5.1, 5.5; §2.2; §2.7; §2.8; §0.3; LocalGaloisDeformationRings §3.7.1 (GL2Block); LocalGaloisDeformationRings §3.8 (WDTypeRing.blockIdentification); §0.4 (product blocks); GL2AutomorphicRepresentationsAndTransfer R17.3 (global jl); AutomorphicGaloisRepresentations §4.7 (skinner full hilbert coefficient prime); `mathlib:ringKrullDim.`

PAN, Theorem 3.5.5 and its proof, Lemmas 3.5.6–3.5.9, pp. 29–32; Corollaries 3.5.10–3.5.12, pp. 32–33: Local–global compatibility for the definite quaternionic completed homology: it lies in the block and the Galois and automorphic actions of `R_p^{ps}` agree; finiteness and faithfulness of m; finite length of the m-torsion; classicality of de Rham points absolutely irreducible at every place above p.

PAN, Theorem 3.6.1, Proposition 3.6.12, pp. 34–36: Lower bound `1 +` 2[F : `ℚ`] for the dimension of every irreducible component of the localised big Hecke algebra.

### 4.12 Scholze’s functor and the completed cohomology of Shimura curves


In the setting of §1.5 (`E_0` totally real of even degree with p split, `D_0` definite split at all finite places, D with invariants exchanged at 𝔭 and `∞_0`, a globalising π as in CDN Proposition 4.5), let `S_{ψ,λ,m} = Hom_{U^p_𝔭}(λ, S_ψ(U^p, L/O))_m` be the λ-typical, m-localised definite quaternionic module of `D_0` (§1.6), an admissible `GL₂(ℚ_p)`-representation in the block of `r̄^{ss}` whose restriction to `K = GL₂(ℤ_p)` is injective in the smooth fixed-central-character category (CDN Propositions 4.7–4.8). (1) There is a natural isomorphism of `T_S^{univ}[G_{ℚ_p} × D_𝔭^×]`-modules `S^1(S_{ψ,λ,m}) ≅ Ĥ^1_{ψ,λ,m}`, where `S^1` is Scholze’s functor from smooth admissible `GL_2(ℚ_p)`-representations to `D_𝔭^× × G_{ℚ_p}`-representations (the degree-one cohomology of the Lubin–Tate tower’s pro-étale torsor over `P^1`, with coefficients in the sheaf attached to the representation) (Paškūnas, On some consequences of a theorem of J. Ludwig, Lemma 6.2, p. 28, after Scholze). (2) ρ̄ deforms to `ρ_m`: `G_{E_0,S} → GL_2(T(U^p)_m)` with characteristic polynomial `X^2 − T_vX + N(v)S_v` at `Frob_v` (v `∉` S), and with `N = Hom_{T(U^p)_m[G_{E_0,S}]}(ρ_m, Ĥ^1_{ψ,λ}(U^p, O)_m)` the evaluation map `ρ_m ⊗_{T(U^p)_m} N → Ĥ^1_{ψ,λ}(U^p, O)_m` is an isomorphism (Carayol–Scholze isotypy). Together these turn a local question on `S^1(π)` into a question on completed cohomology.

Scholze’s functor Sⁱ on admissible O-torsion modules, including its filtered-colimit comparison and finiteness, is supplied by §0.6; the arithmetic comparison uses them without assuming any global application of that comparison. The Shimura curve here is attached to D, ramified at 𝔭; the definite algebra `D_0` is split at 𝔭, and the two are related by the exchange of invariants at 𝔭 and `∞_0` (fixed isomorphism (4.6) away from `p∞_0`). ρ̄ absolutely irreducible (`SL_2(k) ⊂` Im `ρ̄_π ⊂ GL_2(k)` by the globalisation of CDN Proposition 4.5).

A proof proceeds as follows.

1. (1) is Scholze’s comparison of the completed cohomology of the Shimura curve for D with `S^1` applied to the completed degree-zero module of `D_0` in Paškūnas’s λ-typical, ψ-isotypic, m-localised form (CDN Proposition 4.11, citing [55, Lemma 6.2]); the definite-side module is §1.6 with §1.7(d). On the Shimura side use §1.5’s all-p-level colimit before taking `Hom_{U^p_𝔭}(λ,−)`; use §0.6’s torsion-colimit comparison on the `L/O`-valued definite module.
2. (2): the deformation `ρ_m` is §3.2(c) for the Shimura-curve Hecke algebra; isotypy combines Scholze’s Propositions 5.3, 5.4 and 5.8 (CDN Proposition 4.12), with the finite-level Eichler–Shimura relation for Shimura curves, which is Carayol’s construction of the Galois representations on their cohomology (AutomorphicGaloisRepresentations §§3.1, 3.7 (carayol sigma lambda construction)), the eigenspace decomposition being HilbertModularVarietiesAndShimuraCurves R18.4 (cohomological eigenspaces).
3. The duality `(Ĥ^1_{ψ,λ,m})^∨ ≅ Ĥ^1_{ψ,λ}(U^p, O)_m^d` of §1.5 transports (1) to the integral completed cohomology.

**Checks.**

- Injectivity of `S_{ψ,λ,m}|K` supplies the compact-group input; it is not a claim of injectivity in its G-block. The comparison uses every `S_{ψ,λ,m}[ϖʲ]` and their union, without a bounded torsion exponent.
- CDN use (1)–(2) to show that `S^1(π)` for a supersingular π has `G_{ℚ_p}`-action through ρ̄-isotypic pieces (their §4.1.5).
- Non-example: replacing `S_{ψ,λ,m}` by the modular-curve object of §1.1 is wrong: Scholze’s functor relates the definite algebra split at p to the Shimura curve ramified at p, not the modular curve to itself.

*Needs:* §0.6; §1.5; §1.6; §1.7; §3.2; HilbertModularVarietiesAndShimuraCurves R18.4 (cohomological eigenspaces); AutomorphicGaloisRepresentations §§3.1, 3.7 (carayol sigma lambda construction); AutomorphicGaloisRepresentations §4.4 (all hilbert local global compatibility).

CDN, Propositions 4.7–4.8 and Remark 4.9, p. 49; Proposition 4.11, Proposition 4.12, p. 51: `S_{ψ,λ,m}` is admissible in the G-block of `r̄^{ss}` and its restriction to K is injective with fixed central character; Paškūnas’s Lemma 6.2 (after Scholze) gives `S^1(S_{ψ,λ,m}) ≅ Ĥ^1_{ψ,λ,m}`; ρ̄ deforms to `ρ_m` over `T(U^p)_m` and `Ĥ^1_{ψ,λ}(U^p, O)_m ≅ ρ_m ⊗ N`.

CDN, §3.1, Théorème 3.1, pp. 40–41: Recollection of Scholze’s functor `S^i` and his finiteness theorem.

### Examples

When `End(ρ̄_p)=k`, the refined tensor comparison uses the canonical local family. A split sum of two distinct characters has a two-dimensional diagonal endomorphism algebra, so representability cannot identify the θ-family by the same argument. For `Σ₀` empty the away factor is T′ on the dual side. In the Scholze comparison, the definite algebra is split at p and the Shimura-curve algebra is ramified there; using the same algebra on both sides fails the exchange-of-invariants construction.

### Dependencies

Layers 1–3 supply the completed towers, classical density, Hecke representation and Galois factorisation. §§0.1–0.4 supply the exact admissible-category, ordinary-parts, Berger–Breuil and CDP crystalline completion, Kisin and product-block inputs, including their small-prime extensions; LocalGaloisDeformationRings §§3.7.1–3.7.2 and 3.8 supply the single `GL₂(ℚ_p)` blocks, envelopes, centres and the Montréal functor. SmoothRepresentationsOfLocalGroups §§SR.5.1–SR.5.3 supplies W over `T^{nr}` and for one prime; `awayFamily_descent`, `awayFamily_product` and the integral smooth-dual comparison specified above complete it. The coadmissible tensor cancellation and component-group and toric Frobenius extensions are the targets specified above, built on CompletedCohomologyPartII Layer 3 and ModularCurvesPartII §§17.4–17.7 respectively. The geometric functor is constructed in §0.6. The globalisation and normalisation supplier specifications retain their stated ranges.

## Layer 5: patched completed modules and support


The patched module `M_∞` of Caraiani–Emerton–Gee–Geraghty–Paškūnas–Shin is constructed once, for `GL_n(F)` with p ∤ 2n, from a definite unitary globalisation; it is finite projective over `S_∞[[K]]`, carries `a GL_n(F)`-action commuting with the patched deformation ring, recovers completed cohomology modulo the augmentation ideal, and yields admissible Banach representations `V(r) = Π_∞[𝔪_y]`. Type-specialised patched modules are Cohen–Macaulay of rank one on the generic fibre and supported on unions of components, with Hecke algebras of types acting through the Bernstein centre. Emerton–Paškūnas show the support of `M_∞` is a union of components — not, in general, full support — and Tung proves full support on every component for `GL₂(ℚ_p)` at odd p and at `p = 2`, via the p-adic local Langlands correspondence on non-ordinary components and an ordinary `R = T` theorem on ordinary ones; the Breuil–Mézard identities follow. On the quaternionic side completed homology itself is patched (Tung, Pan), and Pan's patching at a one-dimensional nice prime proves that the pseudo-deformation-to-Hecke map has nilpotent kernel there.
Full projected support over the local framed ring is distinct from full support over the patched ring. The latter retains auxiliary-component coverage; faithfulness also retains reducedness. The dyadic ordinary-component input requires an extension of the present odd-p supplier.

### 5.1 The patched module M∞


Let `F/ℚ_p` be finite, `n ≥ 1` with p ∤ 2n, and r̄: `G_F → GL_n(k)` continuous admitting a potentially crystalline, potentially diagonalisable lift of regular weight (automatic after extending scalars if `n = 2` or r̄ is semisimple). Choose a suitable globalisation as in the supplier contract, including residual image `GL_n(k′)` with `#k′>3n` and the stated base change (`F̃/F̃^+` CM with each place v | p of `F̃^+` split and `F̃^+_v ≅ F`, ρ̄: `G_{F̃^+} → 𝒢_n(k)` automorphic, irreducible on `G_{F̃}`, with adequate image on `G_{F̃(ζ_p)}`, restricting to r̄ at chosen ṽ | p), a definite unitary group G̃ over `F̃^+`, a tame level `U^p` with the types and auxiliary-place Hecke projector chosen as in CEGGPS §§2.3–2.6 to force multiplicity one (proof of Theorem 4.35, p. 74), the localised completed cohomology `S̃_{ξ,τ}(U^p, O)_m` of G̃ with fixed types ξ, τ away from p, and Taylor–Wiles data `Q_N`. With `R^loc = R^□_{r̄} ⊗̂ ⊗̂_{v ∈ S∖{p}} R^{ξ,τ}_{ṽ}` (the framed local ring at p unrestricted), `R_∞ = R^loc[[x_1`, …, `x_{q−[F̃^+:ℚ]n(n−1)/2}`]], `S_∞ = O[[z_1`, …, `z_{n^2#T}`, `y_1`, …, `y_q`]], `K = GL_n(O_F)` and `G = GL_n(F)`, the patching construction produces a compact O-module `M_∞` with commuting actions of `R_∞` and G (and of `S_∞` through a map `S_∞ → R_∞`), such that: (1) `M_∞` is finitely generated and projective over `S_∞[[K]]`, hence finitely generated over `R_∞[[K]]`; (2) with `a = (z_i`, `y_j) ⊂ S_∞`, there is a G-equivariant isomorphism `M_∞/aM_∞ ≅ S̃_{ξ,τ}(U^p, O)^d_m` compatible with the `R^loc`-action; (3) for the uniformizer algebra `Λ ≅ O[[S]]` defined below, `M_∞` is projective among pseudo-compact `Λ[[K]]`-modules; for every continuous O-algebra map `x_Z: Λ_Z → O`, `M_∞ ⊗̂_{Λ_Z,x_Z} O` is a nonzero projective object of `C_ξ(O)`, the category of profinite augmented ZK-representations with compact central character `ξ(c)=x_Z(c)` for `c ∈ Z`. Put `Π_∞ = Hom^cont_O(M_∞, E)` with the maximum norm, a unitary Banach representation of G with an `R_∞`-action; for y: `R_∞ → O` extending a point x of `R^□_{r̄}`, `V(r_x) = (M_∞ ⊗_{R_∞,y} O)^d[1/p] = Π_∞[𝔪_y]` is an admissible unitary Banach representation of G. For `n = 2` and `F = ℚ_p` this is the patched module of Tung’s odd-p work and of Emerton–Paškūnas.

Use CEGGPS §4.22’s central parameter `ζ̄ = (ε̄^{n(n−1)/2} det r̄) ∘ Art_F`, with reciprocity as in that source. Let `Λ_Z` be the completion of `O[Z]` at the ideal generated by ϖ and `c − [ζ̄(c)]` for `c ∈ Z`, where brackets denote Teichmüller lifts. Choose a uniformizer `ϖ_F` of F, put `z = diag(ϖ_F,…,ϖ_F)`, `μ = ζ̄(z)` and `S = z − [μ]`. Define `Λ` as the closure of `O[S]` in `Λ_Z`, so `Λ ≅ O[[S]]`; it contains only the uniformizer direction. The central action is transported with the compact dual convention of CEGGPS §§4.22–4.26: specialization at `x_Z` has compact character ξ, and its contragredient smooth Pontryagin dual has character `ξ⁻¹`. The actions of `Z ∩ K` from the coefficient algebra and from K describe the same central action; they are not independent scalar variables on `M_∞`.

p ∤ 2n; r̄ has a potentially diagonalisable regular-weight potentially crystalline lift (CEGGPS §2.1, Lemma 2.2). `M_∞` depends on the global choices (globalisation, `U^p`, `Q_N`, ultrafilter or diagonal subsequence); `V(r)` is not known to be independent of them or nonzero in general (CEGGPS Remark 2.14). The globalisation uses Emerton–Gee Corollary A.7 and potential automorphy (BLGGT); these are globalisation inputs audited in §6.5.

Use the following named interfaces:

- `TauCeti.PatchedCompletedModule.patchedModule` (constructor): `M_∞`, a compact O-module with commuting actions of `R_∞` and `G = GL_n(F)`, and an `S_∞[[K]]`-module structure through `S_∞ → R_∞`.
- `TauCeti.PatchedCompletedModule.patchedModule_projective` (characterisation): `M_∞` is finitely generated projective over `S_∞[[K]]`, hence finitely generated over `R_∞[[K]]`.
- `TauCeti.PatchedCompletedModule.patchedModule_augmentation` (compatibility): `M_∞/aM_∞ ≅ S̃_{ξ,τ}(U^p, O)^d_m`, G-equivariantly and compatibly with the `R^loc`-action.
- `TauCeti.PatchedCompletedModule.patchedModule_pseudocompactProjective` (characterisation): with `Λ = closure(O[z − [μ]]) ≅ O[[S]]` as above, `M_∞` is projective among pseudo-compact `Λ[[K]]`-modules; for each continuous O-algebra map `x_Z: Λ_Z → O`, its completed central specialization is a nonzero projective object of `C_ξ(O)`, with compact character ξ and smooth-dual character `ξ⁻¹`.
- `TauCeti.PatchedCompletedModule.patchedBanach` (constructor): `Π_∞ = Hom^cont_O(M_∞, E)` with its `R_∞`-action and unitary G-action.
- `TauCeti.PatchedCompletedModule.fibreBanach` (constructor): `V(r_x) = Π_∞[𝔪_y] = (M_∞ ⊗_{R_∞,y} O)^d[1/p]` for y: `R_∞ → O` over x.
- `TauCeti.PatchedCompletedModule.fibreBanach_admissible` (characterisation): `V(r_x)` is an admissible unitary Banach representation of G.

**Checks.**

- For `n=1`, `F=ℚ_p` and odd p, choose compatible finite-character factors. The full `Λ_Z[[K]]` is `O[[s,t,u]]`, where t and u are the two pro-p unit directions. After aligning the compact actions, `t−u` annihilates `M_∞`. This nonzero element of a power-series domain acts injectively on every product of free modules and each direct summand, so no nonzero pseudo-compact projective can satisfy that relation. With an inverse-action adapter the relation is `(1+t)(1+u)−1`, with the same obstruction. Projectivity therefore uses the uniformizer-only Λ.
- A continuous `x_Z: Λ_Z → O` specializes every central direction and gives character ξ on the compact quotient and `ξ⁻¹` on its smooth dual. Specializing Λ alone fixes only z and does not prescribe the character on `Z ∩ K`.
- `TauCeti.PatchedCompletedModule.patchedModule_zero_dual` (degenerate): The continuous O-dual of the zero compact module is the zero Banach representation. A claimed nonzero `V(r_x)` requires the support argument, not merely this dual construction.
- `TauCeti.PatchedCompletedModule.patchedModule_augmentation_compatibility` (compatibility): Reducing `M_∞` modulo a recovers the Pontryagin–Schikhof dual of the localised completed cohomology of the definite unitary group (CEGGPS Corollary 2.11).
- `TauCeti.PatchedCompletedModule.patchedModule_mod_varpi` (computation): `M_∞/(ϖ, 𝔪_{R_∞})` is a finitely generated k[[K]]-module whose Pontryagin dual is an admissible smooth G-representation over k.
- `TauCeti.PatchedCompletedModule.patchedModule_not_completed_cohomology` (non-example): Only `M_∞/aM_∞` is identified with the completed cohomology dual. The construction retains the commuting `S_∞[[K]]` and `R_∞` actions before quotienting; finite generation over `R_∞[[K]]` does not assert an `R_∞-rank` or an identification with that quotient.

TUNG-P3, §§3–4: The support of `M_∞(σ)` meets every component of the potentially semistable ring, giving Breuil–Mézard for odd p (input CC4). EP, §6: Support of `M_∞` in `Spec R_∞` is a union of irreducible components. DING, §4.1: `Π_∞` and the patched eigenvariety built from `J_B(Π_∞^{R_∞-an})`; its construction and the geometry used for support are targets of §5.2a. GL2ModularityLifting §8.7 (through Layer 5): Tung’s odd-prime Breuil–Mézard input and the de Rham lifting theorem (input CC4).

A proof proceeds as follows.

1. Globalise r̄ (EG14 Corollary A.7) and set up the definite unitary group, its algebraic modular forms and Hecke algebras (§0.7 (definite unitary group, algebraic modular forms and Hecke algebra)) and the polarized global deformation problem with its universal ring `R^{univ}_S` and Taylor–Wiles primes (GlobalGaloisDeformations G7 (polarized deformation problem), G7/polarized-representability, G7/enormous-taylor-wiles-primes); the local framed rings are LocalGaloisDeformationRings §1.1 (local lifting ring) (CEGGPS §§2.1–2.6).
2. Define `M_{1,Q_N}` as the Pontryagin dual of the projected localised forms at level `U_1(Q_N)_{2N}` with `O/ϖ^N` coefficients; each is a finite projective `(O/ϖ^N)[Δ_{Q_N}][Γ_{2N}]`-module with partial G-actions `α_N`: `M_{1,Q_N} → Ind^{G_N}_{KZ}((M_{1,Q_N})_{K_N})` (CEGGPS §2.8, Remark 2.9).
3. Patch by the Taylor–Wiles–Kisin method (DeformationAndDerivedPatchingAlgebra §§5.4, 8.4 (patched module), §5.4 (patched ring action), §5.3 (patching extraction)): pass to the limit along a compatible subsystem to get `M_∞` with `R_∞-` and `S_∞[[K]]`-actions and `α_∞`: `M_∞ → Ind^G_{KZ} M_∞`; Proposition 2.10 shows `M_∞` is finite projective over `S_∞[[K]]` (splitting a surjection from `S_∞[[K]]^r` using projectivity at each finite level), `α_∞` is injective with G-stable image, giving the G-action.
4. (2) is the limit of the level-N isomorphisms ψ (CEGGPS Corollary 2.11), whose G-equivariance uses the analogue of Proposition 2.10 for completed cohomology (the degree-zero identification of CompletedCohomologyPartII §8.5 (definite unitary degree zero), stated there for LLHLM’s definite `GL_3`; its extension to the rank-n definite unitary groups of CHT/Thorne type is the §8.5 extension of the supplier contracts); (3) is Proposition 4.23 for `Λ ≅ O[[S]]` (pro-free over `Λ[[P]]` for a pro-p Sylow P), followed by Corollary 4.26 for specialization over the full `Λ_Z` in `C_ξ(O)`.
5. Admissibility of `V(r)`: let `ȳ: R_∞ → O → k` be the residue composite of y. Since `ker ȳ` induces an open ideal of `S_∞` and `M_∞` is finite over `S_∞[[K]]`, `(M_∞ ⊗_{R_∞,ȳ} k)_{K_N}` is finite-dimensional over k; hence the unit ball of `V(r_x)` has admissible reduction and `V(r_x)` is admissible (CEGGPS Proposition 2.13 and its proof, p. 34, where the residue field is written 𝔽). The kernel of the O-point y itself is not open: it contains no power of ϖ.

**Checks.**

- The augmentation quotient recovers the global completed cohomology dual. Even for `n = 1`, the global choices can introduce multiplicity; no free rank-one `R_∞`-module assertion follows from the construction.
- For `n = 2`, `F = ℚ_p` and `r_x` absolutely irreducible, the local–global compatibility of §5.4 identifies `V̌(Π_y)` with `r_x^{⊕n_y}`.

*Needs:* §0.7; GlobalGaloisDeformations G7 (polarized deformation problem); GlobalGaloisDeformations G7 (polarized representability); GlobalGaloisDeformations G7 (enormous taylor wiles primes); LocalGaloisDeformationRings §1.1 (local lifting ring); DeformationAndDerivedPatchingAlgebra §§5.4, 8.4 (patched module); DeformationAndDerivedPatchingAlgebra §5.4 (patched ring action); DeformationAndDerivedPatchingAlgebra §5.3 (patching extraction); CompletedCohomologyPartII §8.5 (definite unitary degree zero); CompletedCohomologyPartII §3.17 (definite degree zero dual interface); `mathlib:Module.Projective`; `mathlib:MvPowerSeries.`

CEGGPS, §2.1, Lemma 2.2, pp. 15–17; §2.8 and Remark 2.9, pp. 24–26; definitions of `R_∞` and `S_∞`, p. 27: The globalisation of r̄, the finite-level modules `M_{1,Q_N}` with partial G-actions, and the patching rings `R_∞ = R^loc[[x]]` and `S_∞ =` O[[z, y]].

CEGGPS, Proposition 2.10, p. 30; Corollary 2.11, p. 33; §2.12 and Proposition 2.13, Remark 2.14, pp. 33–34: `M_∞` is finitely generated projective over `S_∞[[K]]` with a G-action; `M_∞/aM_∞` recovers the dual of localised completed cohomology; `V(r)` is admissible unitary.

CEGGPS, §4.22, pp. 67–68, Proposition 4.23 and Corollary 4.26, pp. 68–70: the full central algebra `Λ_Z` contains the uniformizer algebra `Λ ≅ O[[S]]`; `M_∞` is projective over `Λ[[K]]`, and its specialization over `Λ_Z` is a nonzero projective object of `C_ξ(O)`.

DING, §4.1, p. 63: `Π_∞ := Hom^cont(M_∞, E)` with the maximum norm is a unitary Banach representation of `GL_n(K)` with an action of `R_∞ ≅ R^□_ρ̄ ⊗̂ R^℘_∞`.

TUNG-P3, §3, Definition 3.2 and the definition of `Π_∞`, `Π_y`, pp. 9–10: For `n = 2`, `F = ℚ_p`: `Π_y = Π_∞[𝔪_y]` is admissible unitary (CEGGPS Proposition 2.13); the support of `M_∞(σ)` defines the automorphic components.

### 5.2 Type-specialised patched modules and their support


In the setting of §5.1, for a K-stable O-lattice σ° in a locally algebraic type `σ = σ^{(cr)}(h, τ)` (algebraic of highest weight λ_alg tensored with the K-type attached to an inertial type τ by the inertial local Langlands correspondence), define `typedPatchedModule` by `M_∞(σ°) = (Hom^cont_{O[[K]]}(M_∞`, `(σ°)^d))^d ≅ lim_n Hom^cont_{O[[K]]}(M_∞, (σ°/ϖ^n)^∨)^∨`. Let `R_∞(σ)′ = R_∞ ⊗̂_{R^□_{r̄}} R^□_{r̄}(σ)` (potentially crystalline ring of type σ) and define `faithfulTypeRing`, denoted `R_∞(σ)`, to be the quotient acting faithfully on `M_∞(σ°)`. Its defining API identifies its kernel with `Ann(M_∞(σ°))` and gives the faithful induced action. Then: (1) `R_∞(σ)` is a reduced O-torsion-free quotient of `R_∞(σ)′`; (2) `M_∞(σ°)` is finitely generated over `R_∞(σ)` and Cohen–Macaulay, `M_∞(σ°)[1/p]` is locally free of rank one over `R_∞(σ)[1/p]` (in the potentially crystalline case; over the regular locus of the support in Tung’s potentially semistable variant), and the topology is the m-adic one; (3) the support of `M_∞(σ°)` in `Spec R_∞(σ)′` is a union of irreducible components (its automorphic components); (4) the Hecke algebra `H(σ) = End_G(c-Ind^G_K σ)` acts on `M_∞(σ°)[1/p]` through the map `H(σ) → R^□_{r̄}(σ)[1/p]` interpolating the Bernstein-centre local Langlands correspondence (local–global compatibility at p); (5) if x is a closed point of `Spec R_∞(σ)[1/p]` with `π_sm(r_x)` generic, then `V(r_x)_{l.alg} ≅ π_sm(r_x) ⊗ π_alg(r_x)`, the Breuil–Schneider representation.

Keep algebraic highest weight λ_alg distinct from Hodge type h. CEGGPS, p. 14, sets `π_alg(r)=L_ξ⊗E` with `ξ_i=−a_{n+1−i}` for r regular of weight a, whose Hodge–Tate weights are `a_i+n−i` (p. 13). Hence at each embedding for GLₙ, `h_i=−λ_alg,n+1−i+n−i` with HT(ε)=−1. For GL₂ over ℚ_p, λ_alg=(a,b) corresponds to h=(1−b,−a). Thus (0,0) gives Barsotti–Tate h=(1,0), det gives h=(0,−1), and the standard representation, algebraic (1,0), gives h=(1,−1). Tung writes λ=(a,b) for Hodge–Tate weights with HT(ε)=1 and `σ(λ)=Sym^{a−b−1}E²⊗det^b`, of algebraic highest weight (a−1,b); in the convention here that σ has h=(1−b,1−a), so Tung’s representations of type σ are the twists by ε of those of Hodge type h, and his typed rings are transported along this twist. σ potentially crystalline `(σ^{cr})` in CEGGPS; Tung’s and Pyvovarov’s potentially semistable variants σ(λ, τ) give the same statements with ‘regular locus of the support’ in (2). Genericity of `π_sm(r_x)` is needed in (5). The rank-one and single-copy conclusions retain §5.1’s multiplicity-one datum; for other tame levels keep the actual automorphic multiplicity in both conclusions.

A proof proceeds as follows.

1. `M_∞(σ°)` is finite projective (free) over `S_∞`, being a direct summand of `Hom(S_∞[[K]]^r, (σ°)^d)^d` (CEGGPS proof of Lemma 4.18); the comparison with completed homology modulo a is §2.8’ unitary analogue (CEGGPS Lemma 4.14, Remark 4.16).
2. (1)–(3): classical local–global compatibility at ṽ | p at finite auxiliary levels shows the `R_∞`-action factors through `R_∞(σ)′`; Cohen–Macaulayness from freeness over `S_∞` and dim `R_∞(σ) = dim S_∞`; support a union of components by depth (DeformationAndDerivedPatchingAlgebra §6.1 (supported on components); CEGGPS Lemmas 4.17–4.18).
3. (4) is CEGGPS Theorem 4.1 and Theorem 4.19 (the map η: `H(σ) → R^□(σ)[1/p]` of Theorem 4.1, with its integrality Lemma 4.17(2)), using Bernstein-centre local Langlands (CEGGPS §3, SmoothRepresentationsOfLocalGroups §§SR.3, SR.5.1 integral Bernstein blocks).
4. (5): x is a smooth point of `Spec R_∞(σ)`, so `M_∞(σ°)` is locally free of rank one there; Propositions 4.33–4.34 compute `V(r_x)_{l.alg} ≅ π ⊗ π_alg(r_x)` with π in the Bernstein component Ω and identify π with `π_sm(r_x)` when generic (CEGGPS Theorem 4.35).

**Checks.**

- At an unramified tame GL₂ place, replacing maximal compact level by Iwahori gives two invariants in a generic unramified principal series. The rank-one/single-copy conclusions require the multiplicity-one level and projector of §5.1.
- Algebraic highest weight (1,0) is the two-dimensional standard representation, with nontrivial diag(u,1) action; it is not the trivial algebraic factor.
- For σ_alg = det, λ_alg=(1,1) gives h=(0,−1): the Barsotti–Tate Hodge type (1,0) twisted by ε, since HT(ε)=−1. The undualised formula `λ_alg+(1,0)` would give (2,1) and fails this test.

- For trivial algebraic highest weight `λ_alg=(0,0)` and trivial inertial type, with corresponding Hodge type `h=(1,0)` in the convention HT(ε)=−1 (Barsotti–Tate), `R^□(σ)` is the crystalline Barsotti–Tate ring and `M_∞(σ°)` is the classical patched module of Kisin’s method.
- For the type-specialisation functor on compact modules, the regular model `M=S_∞[[K]]` gives `M(σ°)≅S_∞⊗_Oσ°` (with the right-action convention of §2.8). Thus its `S_∞-rank` is `rank_Oσ°`, not that rank times an index of K. This tests the functor, independently of the arithmetic quotient theorem.
- Replacing a lattice σ° by ϖσ° gives an isomorphic integral type module via multiplication by ϖ, hence the same rational typed module and the same faithful acting quotient `R_∞(σ)`.
- On the zero compact module the typed functor gives zero for every type, and the faithful image ring is the zero ring. The nonzero rank-one arithmetic conclusion therefore requires a point of the support, not merely a point of `R_∞(σ)′`.
- Non-example: support on a union of components is not full support; Cohen–Macaulayness alone does not give support on every component (DeformationAndDerivedPatchingAlgebra §6.1).

*Needs:* §5.1; §2.8; LocalGaloisDeformationRings §3.4 (pst deformation ring); LocalGaloisDeformationRings §3.9 (pcris generic smooth); LocalGaloisDeformationRings §3.1 (hodge and galois types); DeformationAndDerivedPatchingAlgebra §6.1 (supported on components); DeformationAndDerivedPatchingAlgebra §3.1 (free of maximal depth regular local); DeformationAndDerivedPatchingAlgebra §3.12 (degree indexed multiplicity); SmoothRepresentationsOfLocalGroups §§SR.5.1–SR.5.3.

CEGGPS, Theorem 4.1, p. 51; Lemma 4.14, Remark 4.16, Lemma 4.17, Lemma 4.18, Theorem 4.19, pp. 60–66: The patched modules `M_∞(σ°)`, the reduced quotient `R_∞(σ)`, Cohen–Macaulayness and rank-one local freeness, support a union of irreducible components, and compatibility of the Hecke algebra H(σ) with the Bernstein-centre map to the potentially crystalline ring.

CEGGPS, Propositions 4.33–4.34 and Theorem 4.35, pp. 72–74: Locally algebraic vectors of `V(r_x)` are `π_sm(r_x) ⊗ π_alg(r_x)` for generic `π_sm(r_x)`.

TUNG-2, Proposition 5.2.2, p. 27: The same statements for the quaternionic patched module in Tung’s 2-adic setting, with potentially semistable types.

### 5.2a Patched Jacquet and trianguline geometry

**Patched eigenvariety and component comparison.** In §5.1’s CEGGPS setting, for every finite `F/ℚ_p` and rank n in that setting, construct `R_∞`-locally analytic vectors of `Π_∞` and Emerton’s locally analytic Jacquet functor for `GLₙ(F)`, extending §0.1’s rank-two construction. The analytic vectors use a presentation `O[[ℤ_pˢ]] → R_∞` and the joint action of `ℤ_pˢ × GLₙ(F)`; prove independence of the presentation and the coadmissible dual and fibre comparisons. With `Y = (Spf R_∞)^rig` and T the diagonal torus, construct the coherent sheaf on `Y × T̂` whose global sections are the strong dual of `J_B(Π_∞^{R_∞-an})`, and let `X_∞` be its support. Its fibre at `(y,δ)` is dual to the δ-eigenspace of `J_B(Π_∞[𝔪_y]^{an})`. Sources: BHS §§3.1–3.3, Definition 3.2 and Proposition 3.7; EP §6, pp. 26–28.

Construct the framed trianguline variety `X_tri(r̄)` as the reduced closure of the regular triangulation locus in `X^□_{r̄} × T̂`. Use PhiGammaModulesAndIwasawaCohomology §§1.1–1.2, 7.1 and 7.5’s affinoid relative Robba rings, module category, Galois realization, character modules and saturated triangulations, with their coefficient-change comparisons. The flags have finite-projective successive quotients and graded pieces `R(δ_i) ⊗ L_i` for coefficient line bundles `L_i`. In BHS’s reciprocity convention the regular locus excludes ratios `δ_i/δ_j` of the forms `x ↦ ∏_τ τ(x)^(−m_τ)` and `x ↦ |x|_F ∏_τ τ(x)^(1+m_τ)`, for `i≠j` and nonnegative integers `m_τ`. Prove representability of the regular triangulation space of saturated flags on these carriers, construct the reduced closure, and compare its local deformation functors with LocalGaloisDeformationRings §1.23 through §0.4’s finite-local specialization (BHS §2.2). Prove the smoothness and dimension statements on the regular triangulation locus. Form `X_∞^tri` by adjoining the auxiliary deformation factors and patching discs, transporting its torus parameters by the automorphism of BHS §2.3 that matches Jacquet characters with Galois triangulation parameters. Prove `X_∞ ⊂ X_∞^tri`, with `X_∞` reduced and a union of irreducible components, and Zariski density of strongly classical points of `X_∞`. Here strongly classical means that δ has dominant algebraic restriction to the compact torus and the corresponding locally algebraic principal-series constituent is the unique irreducible subquotient of the modulus-adjusted locally analytic induction admitting a group-invariant norm (BHS Definition 3.17). Retain §5.1’s globalisation, adequacy, local-type, projectivity and coefficient-field hypotheses. Sources: BHS Definition 2.4, Theorem 2.6, §§3.5–3.6, Theorems 3.19 and 3.21; EP Theorem 6.6 and proof of Theorem 6.12, pp. 27–29. PadicFamilies’ modular eigencurve does not replace this arbitrary-rank construction.

**Checks.**

- In rank one, the triangulation is the module itself; the parameter records its character, and the patching discs and auxiliary factors remain present.
- Over `A=E[ε]/(ε²)`, the relative realization is LocalGaloisDeformationRings §0.4’s finite-local realization: multiplication by ε on the trivial A-representation remains nonzero before reduction, including in the deformation-functor comparison.
- The injective stable map `tR ⊂ R` has a nonprojective quotient and does not define a saturated step in the imported triangulation data.
- A zero Jacquet eigenspace gives a zero coherent-sheaf fibre. The projection of `X_∞` records the actual patched module, rather than every point of the unrestricted local deformation space.
- A point in the closure of the regular triangulation locus need not have its displayed δ as a parameter of a saturated triangulation. Retain the closure and the separate regular locus (BHS Remark 2.5).
- For `GL₂/ℚ_p`, the parameter automorphism gives the character dictionary of BHS §2.3; replacing it by the identity changes the Jacquet eigenspace being compared.

**Benign points and tangent spanning.** Transport BHS’s Hodge–Tate convention by §5.2. For a regular labelled Hodge type h, let `R_∞^h` be the reduced O-flat crystalline quotient. Define benign points by distinct eigenvalues of the linearised crystalline Frobenius, noncriticality of every refinement and exclusion of eigenvalue ratios `p^f` and `p^(−f)`, where f is the residue degree of F. Prove that each component of `(Spf R_∞^h)^rig` has a nonempty Zariski-open benign locus. At a benign point z, prove smoothness of `X_∞^tri` at every point over z and that the images of their tangent spaces span `T_{Y,z}`. For z in the support of an algebraic typed module, prove that every such refinement lies in `X_∞`, using §5.2’s locally algebraic comparison and the generic unramified smooth factor. Combine this with strongly classical density to prove that the closure of the union of algebraic typed supports is a nonempty union of components of Y. This is the geometric input to §5.3, in arbitrary rank and over every finite F in §5.1’s range (EP Definitions 6.7–6.8, Proposition 6.9, Theorem 6.10, Lemma 6.11 and Theorem 6.12, pp. 27–29).

**Checks.**

- For a benign rank-two crystalline point both orderings of the Frobenius eigenvalues contribute refinement tangent spaces; a single chosen refinement does not supply the tangent-spanning conclusion.
- Repeated eigenvalues, a critical refinement, or an eigenvalue ratio `p^f` fail the benign hypotheses; regular Hodge–Tate weights alone do not suffice.
- Every component of a nonempty regular crystalline typed support contains benign points, while the zero typed module contributes no points to the union.

*Needs:* §0.1; §5.1; §5.2; PhiGammaModulesAndIwasawaCohomology §§1.1–1.2, 7.1, 7.5 (affinoid relative rings, module category, Galois realization, character modules, saturated triangulations and coefficient change); LocalGaloisDeformationRings §§0.4, 1.23 (finite-local specialization and trianguline deformation functors).

### 5.3 Support of the patched module (Emerton–Paškūnas)


In the CEGGPS setting: (1) define the `R_∞` support of `M_∞` to be `V(Ann_{R_∞} M_∞)`; EP Lemma 6.2 justifies this support convention for modules finite over `R_∞[[K]]`, and EP Theorem 6.3 makes it a union of irreducible components of `Spec R_∞`. (2) The closure of crystalline points in its rigid support is a union of components (EP Theorem 6.5). (3) If the unrestricted local framed ring `R^□_{r̄}` is irreducible, the image of that support in `Spec R^□_{r̄}` is everything (EP Remark 6.4, Corollary 5.5). Full support over `R_∞` additionally requires that every auxiliary component is met; irreducibility of `R^□_{r̄}` alone does not imply it. If `R_∞` itself is irreducible and `M_∞` is nonzero, (1) gives full `R_∞` support. Full support means the annihilator is nil; for a Noetherian ring it is nilpotent, and for a reduced ring it is zero. (4) For `n = 2`, `F = ℚ_p` and every odd p, Tung Proposition 3.9 proves faithfulness of `R_∞^ψ` on `V̌(M_∞^ψ)`. Its proof uses irreducibility and reducedness of the unrestricted local framed ring (including the exceptional nonsmooth cases) and the chosen irreducible auxiliary factors. No residual exclusions are imposed on Proposition 3.9 itself.

For a finitely generated A[[K]]-module, `Supp_A` is `V(annihilator)`; generators over A[[K]] generate an A-submodule with the same support (EP Lemma 6.2). For (4), keep the all-odd-p irreducibility and reducedness input of Tung Proposition 3.9. Formal smoothness is only a sufficient special case. Auxiliary local components must be chosen as in that construction; the EP union-of-components theorem alone does not prove faithfulness.

The algebra used for the finite span is the equality `Ann_R(span_R S)=Ann_R(M)` for a commutative ring R acting on M, a ring B acting R-linearly, and a subset S with B-span equal to M. The actions must commute; without that hypothesis, an element killing S need not kill its B-span. The case `M=0` is allowed. Checks are the regular module with `S={1}`, a quotient R/I with `S={1 mod I}` giving annihilator I, and the empty generating set for the zero module giving the unit ideal.

A proof proceeds as follows.

1. (1): algebraic representations of K capture every projective object (EP Proposition 3.1), so the support of `M_∞` is the closure of the union of supports of the `M_∞(ξ)` for algebraic ξ; each is reduced (CEGGPS Lemma 4.17), and by (2) the support of `M_∞[1/p]` is a union of components; p-torsion-freeness passes this to `Spec R_∞` (EP Theorem 6.3).
2. (2) uses §5.2a’s patched Jacquet space, component comparison, strongly classical density, benign-point density and tangent spanning. At a benign point of a typed support every refinement lies on `X_∞`; its tangent images fill the tangent space of Y. EP Theorems 6.12 and 6.5 then give the asserted union of components.
3. (3): EP Remark 6.4 concludes full projected support over `R^□_{r̄}`. To conclude full `R_∞` support, supply irreducibility of the entire patched ring or coverage of each auxiliary component. Then `V(Ann M_∞) = Spec R_∞` implies `Ann M_∞` is nil, Noetherianity makes it nilpotent, and reducedness implies `Ann M_∞ = 0`. The finite-module support criterion is applied only to the finite span of Iwasawa generators (EP Lemma 6.2) or to typed modules.
4. (4): Tung Proposition 3.9 combines EP support, irreducibility and reducedness of `R^□_{r̄}` for every odd p, and the chosen auxiliary factors. Split off the central determinant variables `R_∞ ≅ R_∞^ψ ⊗̂ Λ_Z`; Theorem 3.7 and Corollary 3.8 identify the Colmez Cayley–Hamilton action and preserve faithfulness.

**Checks.**

- The scalar span of `1` in `R/I` has annihilator I, and the empty span in the zero module has the unit ideal as annihilator (EP Lemma 6.2, p. 26).

- If `p ≥ 5`, r̄ is absolutely irreducible and its framed ring is formally smooth, the projected support in `Spec R^□_{r̄}` is full. Full support of the patched ring still retains the auxiliary-component condition; reducedness is needed to deduce faithfulness from it.
- Theorem 6.3 gives support on a union of components, so Tung’s Proposition 3.9 keeps its irreducibility, reducedness and density inputs.

*Needs:* §5.1; §5.2; §5.2a; LocalGaloisDeformationRings §1.1 (local lifting ring); DeformationAndDerivedPatchingAlgebra §6.1 (supported on components); LocalGaloisDeformationRings §3.7.2 (MontrealFunctor); `mathlib:Module.annihilator`; `mathlib:PrimeSpectrum.zeroLocus.`

EP, Definition 6.1, Lemma 6.2, Theorem 6.3, Remark 6.4, Theorem 6.5, pp. 25–26, and Theorems 6.6–6.12, pp. 27–29; Theorem 1.8, p. 3: The support of `M_∞` in `Spec R_∞` is a union of irreducible components, via density of crystalline points in the support; full support follows when the framed ring is irreducible.

TUNG-P3, Propositions 3.4–3.5, Theorem 3.7, Corollary 3.8, Proposition 3.9, pp. 10–12: For `GL_2(ℚ_p)`: `M_∞^ψ` carries an arithmetic action, `V̌(M_∞^ψ)` is finitely generated over `R_∞^ψ`, and `R_∞^ψ` acts faithfully on `V̌(M_∞^ψ)` when `Spec R^□_{r̄}` is irreducible and reduced.

### 5.4 Full support of patched modules for GL₂(ℚ_p), p odd (Tung)


Let `p > 2`, `F = ℚ_p`, `n = 2` in §5.1, and fix a determinant ψ. (1) For every closed point `y ∈ Spec R_∞[1/p]` whose Galois representation `r_x` is absolutely irreducible, `V̌(Π_y) ≅ r_x^{⊕n_y}` for some `n_y ≥ 1`, where V̌ is Colmez’s functor in Paškūnas’s normalisation and `Π_y = Π_∞[𝔪_y]` ; separately Corollary 3.10 gives `Π_y ≠ 0` for every closed characteristic-zero y, including reducible `r_x`. Hence `M_∞(σ°)[1/p]` is supported on every component of the ambient `R_∞(σ)′[1/p]` that is non-ordinary at p, for every locally algebraic type σ (Tung Theorem 4.1). (2) If moreover `r_x` is potentially semistable with `π_sm(r_x)` generic, then `V̌(Π_y) ≅ r_x`, so `n_y = 1` on an open dense set of closed points (Corollary 4.3). (3) For `σ = σ(λ, τ)` or `σ^{cr}(λ, τ)`, every irreducible component of `R^□_{r̄}(σ)[1/p]` is automorphic (meets the support of `M_∞(σ°)`), except possibly the semistable non-crystalline component when r̄ `≅` (ω ∗; 0 1) `⊗ χ`, `λ =` (a `+ 1`, a) and `τ = η ⊕ η` (Proposition 4.4). (4) Breuil–Mézard: for each smooth irreducible k-representation σ̄ of `GL_2(ℤ_p)` there is a four-dimensional cycle `C_σ̄(r̄)` of `R^{□,ψ}_{r̄}`, independent of λ and τ, with `Z(R^{□,ψ}_{r̄}(λ`, τ)/ϖ) `= Σ_σ̄ m_σ̄(λ`, τ) `C_σ̄(r̄)` and the analogous identity for the potentially crystalline rings (Theorem 1.2); consequently every component of `R^□_{r̄}(σ)[1/p]` is automorphic, the exception of (3) included (Corollary 4.6, through Emerton–Gee’s Theorem 5.5.2). (5) Global consequence (Theorem 4.7): for F a totally real field in which p splits completely and ρ: `G_{F,S} → GL_2(O)` continuous with ρ̄ modular, `ρ̄|G_{F(ζ_p)}` absolutely irreducible and `ρ|G_{F_v}` potentially semistable with distinct Hodge–Tate weights for each v | p, ρ comes up to twist from a Hilbert modular form.

`p > 2`. (5) assumes ρ̄ modular (residual modularity); the globalisations inside the proofs (Tung Lemmas 4.3.3–4.3.4 in the dyadic paper, CEGGPS’s potential automorphy, Barnet-Lamb–Gee–Geraghty Theorem A.4.1 on the reducible locus) are audited for independence from Serre’s conjecture in §6.5. Barnet-Lamb–Gee–Geraghty’s Theorem A.4.1 assumes a potentially automorphic residual seed (retained in §6.5). The local consequence (4) is a statement about local deformation rings proved through global patching; consumers cite it from this node (it stays downstream of the local inputs of Layer 0).

A proof proceeds as follows.

1. (1): `V̌(M_∞)` is finitely generated over `R_∞` (Tung Corollary 3.8) and `R_∞` acts faithfully (§5.3(4)); for absolutely irreducible `r_x` the action of `R_∞[[G_{ℚ_p}]] ⊗ κ(y)` on `V̌(Π_y)` factors through the Cayley–Hamilton quotient `g^2 − tr r_x(g) g + det r_x(g)` (Theorem 3.7), so `V̌(Π_y) ≅ r_x^{⊕n_y}` by Boston–Lenstra–Ribet, and `n_y ≥ 1` since `V̌(Π_y) ≠ 0` (Corollary 3.10) (TUNG-P3 Theorem 4.1); Colmez’s functor and Paškūnas’s theory are supplied by LocalGaloisDeformationRings §§3.7.1–3.7.2 with the adapters of §0.2 and §0.4.
2. (2): an absolutely irreducible subrepresentation Π of `Π_y` has no `SL_2(ℚ_p)`-invariants (Lemma 4.2), so V̌(Π) `≅ r_x`, and a multiplicity computation through Paškūnas’s category gives `V̌(Π_y) ≅ r_x` (TUNG-P3 Corollary 4.3).
3. (3): by (1) only the components in the reducible locus remain; their points are extensions of de Rham characters, treated through Barnet-Lamb–Gee–Geraghty Theorem A.4.1 except in the stated semistable case (TUNG-P3 Proposition 4.4).
4. (4): from (3) and the Paškūnas/Emerton–Gee equivalence between automorphy of all components and the cycle identities, applied type by type (TUNG-P3 Theorem 1.2), then Emerton–Gee’s Theorem 5.5.2 for the remaining component (Corollary 4.6).
5. (5): the Taylor–Wiles–Kisin argument of Kisin’s Theorem 2.2.18 and Hu–Tan’s Theorem 6.3 with all components automorphic (TUNG-P3 Theorem 4.7).

**Checks.**

- For R=k[x,y]/(xy) and M=R/(x), the faithful image R/(x) has full module support, but the ambient component V(y) is missed. Component coverage must be tested in the ambient typed ring.

- For r̄ absolutely irreducible and σ crystalline of weight (`k−1`, 0) with `2 ≤ k ≤ p`, (3) recovers the automorphy of every component of the crystalline ring; formal smoothness is an additional local property only in the range of the relevant Fontaine–Laffaille smoothness theorem.
- Non-example: (3) does not follow from a union-of-components support statement alone; it uses the p-adic local Langlands input of (1).

*Needs:* §5.3; §5.2; §5.1; LocalGaloisDeformationRings §3.7.2 (MontrealFunctor); §0.3 (cdp correspondence); §0.4; LocalGaloisDeformationRings §3.7.1 (GL2Block.projectiveEnvelope); LocalGaloisDeformationRings §3.4 (pst deformation ring); LocalGaloisDeformationRings §3.9 (pst generic fibre); DeformationAndDerivedPatchingAlgebra §§6.1, 6.4 (nearly faithful and component support conclusions); DeformationAndDerivedPatchingAlgebra §6.7 (cycle specialization multiplicity).

TUNG-P3, Theorem 1.2, p. 4; Corollary 3.8, Corollary 3.10, pp. 11–12; Theorem 4.1, Lemma 4.2, Corollary 4.3, pp. 12–13; Proposition 4.4, Corollary 4.6, Theorem 4.7, pp. 14–16: For `p > 2`: `V̌(Π_y) ≅ r_x^{⊕n_y}` at absolutely irreducible points (`n_y = 1` at generic potentially semistable points); automorphy of every component of the potentially semistable rings except one semistable case, then of all of them after the Breuil–Mézard identities; and the totally real automorphy theorem under residual modularity.

### 5.5 Patched completed homology of a definite quaternion algebra


In the setting of §1.6 (F totally real, p split, D definite and split above p) with a non-Eisenstein maximal ideal m of `T^S_ψ(U^p)`, a global deformation problem S for `ρ̄_m` (local conditions `D_{v,ψ}` at v | p, odd conditions at real places, Steinberg conditions at Σ, an auxiliary place `v_1`) and Taylor–Wiles data (`Q_N`, `{α_v}`), the patching of the completed homology modules `M_ψ(U^p_{Q_N})_m` produces: a pseudo-compact `O_∞[[K_p]]`-module `M̃_∞` with compatible `G_p = ∏_{v|p}GL_2(F_v)`-action, a patched deformation ring `R̃_∞` (a power series ring over `R^loc = ⊗̂_{v∈S} R_v`) acting on it, and an ideal `a ⊂ O_∞ = O[[y_1`, …, `y_q`]] (with framing variables) such that `M̃_∞/aM̃_∞ ≅ M_ψ(U^p)_m G_p-` and `R^S_ψ-equivariantly`. For an open ideal J and `U_p ⊂ K_p` the specialisations `O_∞/J ⊗ M̃_∞` recover patched finite-level modules; `M̃_∞` is projective in the category of pseudo-compact `O_∞[[K_p]]`-modules with central character. Pan’s variant at a one-dimensional prime patches the localisation at a prime q of the pseudo-deformation ring instead (patched completed homology, Pan Definition 4.5.6).

Tung’s 2-adic setting: 2 splits completely in F, `v_1` chosen so that `U^pU_p` is sufficiently small; Pan’s residually irreducible §8: `p > 2`, F with p completely split. This is the quaternionic analogue of §5.1 (definite quaternion algebra instead of definite unitary group); the general patching formalism is DeformationAndDerivedPatchingAlgebra Layers 5 and 8.

Use the following named interfaces:

- `TauCeti.PatchedCompletedModule.quaternionicPatched` (constructor): `M̃_∞`, a pseudo-compact `O_∞[[K_p]]`-module with compatible `G_p`-action and an `R̃_∞`-action.
- `TauCeti.PatchedCompletedModule.quaternionicPatched_augmentation` (compatibility): `M̃_∞/aM̃_∞ ≅ M_ψ(U^p)_m`, `G_p-` and Hecke-equivariantly.
- `TauCeti.PatchedCompletedModule.quaternionicPatched_projective` (characterisation): `M̃_∞` is projective among pseudo-compact `O_∞[[K_p]]`-modules with the fixed central character.
- `TauCeti.PatchedCompletedModule.quaternionicPatched_finiteLevel` (simp): `O_∞/J ⊗_{O_∞[[U_p]]} M̃_∞` recovers the patched finite-level module at level `U_p` and open ideal J.
- `TauCeti.PatchedCompletedModule.quaternionicPatched_typed` (constructor): `M̃_∞(σ°) = σ° ⊗_{O[[K_p]]} M̃_∞` for a locally algebraic type σ.

**Checks.**

- `TauCeti.PatchedCompletedModule.quaternionicPatched_augmentation_test` (compatibility): Setting all patching variables to zero recovers `M_ψ(U^p)_m`.
- `TauCeti.PatchedCompletedModule.quaternionicPatched_trivial_type` (computation): If the central character is trivial on the centre of `K_p` and the finite level is sufficiently small, the trivial-type augmentation `M̃_∞(1)/a` is the dual of `S_ψ(U^pK_p,O)_m`, finite free over O. A trivial type incompatible with the fixed central character does not give this assertion.
- `TauCeti.PatchedCompletedModule.quaternionicPatched_no_TW_degenerate` (degenerate): Setting `q = 0` removes Taylor–Wiles variables but may leave framing variables: `O_∞` need not be O. Only if all framing and patching variables are absent is `a = 0` and the augmentation identity identifies `M̃_∞` with the unpatched completed homology.

TUNG-2, §§5–8: The support of `M̃_∞(σ°)` meets every component of `R̃_∞(σ)`, giving Breuil–Mézard at `p = 2` and Theorem 8.0.1. PAN, §4.6–4.8 and §8.4: Full support of the patched completed homology at a nice prime, resp. in the residually irreducible case. GL2ModularityLifting §§9.1–9.3 (typed component specialisation): Tung’s dyadic patched modules (input CC4).

A proof proceeds as follows.

1. Completed homology at auxiliary levels: `M_ψ(U^p_{Q_N})` is flat over `O[Δ_{Q_N}]` and its `Δ_{Q_N}`-coinvariants recover `M_ψ(U^p)` (Pan Lemma 4.4.2, Corollary 4.4.3; Tung-2 §4.5).
2. Taylor–Wiles primes for the quaternionic problem (Tung-2 Lemma 4.4.1; Pan §4.3 at a one-dimensional prime) from GlobalGaloisDeformations R04.5.
3. Patch by ultraproducts or compatible subsequences (DeformationAndDerivedPatchingAlgebra §§5.4, 8.4 (patched module), §5.4 (patched ring action)) to get `M̃_∞`, `R̃_∞` and a with `M̃_∞/aM̃_∞ ≅ M_ψ(U^p)_m` (Tung-2 Propositions 4.6.5–4.6.6; Pan Definition 4.5.6, Proposition 4.5.8; Pan §8.3).
4. Projectivity: each finite-level module is projective over `O/ϖ^n[Δ][K_p/U_p]` by §1.7(c), and projectivity passes to the patched limit (Tung-2 Corollary 4.2.2 and §4.6).

**Checks.**

- Specialising `M̃_∞` at the augmentation ideal and at a locally algebraic type σ gives the type-specialised module of §2.8.
- Gee–Newton’s patched complex (CompletedCohomologyPartII §4.7 (patched perfect model import)) is the higher-degree analogue; in degree zero the complex is the module `M̃_∞`.

*Needs:* §1.6; §1.7; §3.7; §3.2; GlobalGaloisDeformations R04.5 (taylor wiles datum); GlobalGaloisDeformations R04.5 (odd taylor wiles primes); GlobalGaloisDeformations R04.5 (dyadic taylor wiles primes); GlobalGaloisDeformations R04.3 (global framed ring); GlobalGaloisDeformations R04.3 (local to global presentation); LocalGaloisDeformationRings §1.1 (local lifting ring); DeformationAndDerivedPatchingAlgebra §§5.4, 8.4 (patched module); DeformationAndDerivedPatchingAlgebra §5.4 (patched ring action); CompletedCohomologyPartII §4.7 (patched perfect model import).

TUNG-2, §4.2, Definition 4.2.1, Corollary 4.2.2, Lemma 4.2.4, Proposition 4.2.5, pp. 18–20; Lemma 4.4.1, p. 21; Propositions 4.6.5–4.6.6, pp. 25–26: Completed homology `M_ψ(U^p)` of the definite quaternionic tower, its projectivity, the big Hecke algebra and `ρ_m`, Taylor–Wiles data, and the patched module `M̃_∞` with `M̃_∞/a ≅ M_ψ(U^p)_m`.

PAN, §4.4, Lemma 4.4.2, Corollary 4.4.3; §4.5, Definition 4.5.6, Proposition 4.5.8, pp. 52–59; §8.2–8.3, pp. 126–129: Completed homology with auxiliary levels, patched completed homology at a one-dimensional prime, and patching of completed homology in the residually irreducible case.

### 5.5a One-place partial type and component specialisation

**Partial quaternionic patched module.** In §5.5’s dyadic setting fix `𝔭|2`, write `K^𝔭 = ∏_{v|2,v≠𝔭} GL₂(O_{F_v})`, and choose at each `v≠𝔭` a compatible locally algebraic type σ_v, a lattice σ_v° and an irreducible component C_v of its potentially semistable or crystalline deformation ring. Write `σ^𝔭,° = ⊗_{v≠𝔭} σ_v°`, `R^away = (⊗̂_{v|2,v≠𝔭} R_v^{□,ψ}) ⊗̂ (⊗̂_{v∈S,v∤2} R_v)`, and let `R^away(σ^𝔭)` and `R^away(C^𝔭)` replace the other dyadic factors by their typed rings and their reduced O-flat component quotients respectively; retain the same other local conditions. Coefficients contain the types and make the chosen components geometrically irreducible. Define the compact partial module `P′_{∞,𝔭} = σ^𝔭,° ⊗̂_{O[[K^𝔭]]} M̃_∞` with §2.8’s right-action convention, acting ring `A′_{∞,𝔭} = R̃_∞ ⊗̂_{R^away} R^away(σ^𝔭)`, and component quotient `P_{∞,𝔭} = P′_{∞,𝔭} ⊗̂_{R^away(σ^𝔭)} R^away(C^𝔭)` over `A_{∞,𝔭} = A′_{∞,𝔭} ⊗̂_{R^away(σ^𝔭)} R^away(C^𝔭)`. The remaining group action is `GL₂(F_𝔭)=GL₂(ℚ₂)`. Prove projectivity and finite generation over the one-place compact group algebra for P′, admissibility of its Banach fibres and membership of P in Paškūnas’s category `C(O)` with its fixed central character. Sources: TUNG-2 §6.1, Proposition 6.1.2, p. 30, and Lemma 6.3.1, p. 32.

For a type σ_𝔭 at the remaining place, prove `P′_{∞,𝔭}(σ_𝔭°) ≅ M̃_∞(σ_𝔭° ⊗ σ^𝔭,°)` and the corresponding component-quotient comparison for P. For a closed characteristic-zero point y of `A_{∞,𝔭}`, define `Π_{𝔭,y}` as the admissible Banach fibre of the continuous O-dual of P′ at the image of y in `Spec A′_{∞,𝔭}[1/2]`, with the finite coefficient extension at y; equivalently it is the fibre obtained from P. Its local Galois representation is obtained through `R_𝔭^{□,ψ} → A_{∞,𝔭}`. Assume explicitly `P_{∞,𝔭}[1/2]≠0` for the support and Montréal conclusions of §5.6. An automorphic lift lying on every selected C_v with the prescribed other local conditions supplies this hypothesis (TUNG-2 Remark 6.1.1, p. 30). Restriction of the original product representation to one factor does not supply this constructor.

**Checks.**

- If 𝔭 is the only place above 2, the other-place tensor is empty and the partial type operation leaves the patched module unchanged.
- If the selected other-place components have zero rational partial module, the nonzero hypothesis fails and no nonzero Banach or Montréal fibre is asserted.
- Applying the final type σ_𝔭 recovers the fully typed module on the same chosen components; specializing at all of `K_p` first would discard the one-place action.

**Dyadic support of the partial module.** Under `P_{∞,𝔭}[1/2]≠0`, construct the determinant-character twist and patched Jacquet space of TUNG-2 §6.2 on these one-place carriers. Use the universal deformation of the trivial character and the sign component determined by ψ at −1, with both actions of the character ring and their specialisation to the trivial character retained. Prove projectivity after the twist, the trianguline component comparison and principal-series-type density, extending §5.2a to this dyadic setup. Prove auxiliary-place component coverage from nonzero fully typed support by the solvable-base-change argument of TUNG-2 Proposition 5.4.1, p. 29. Combine this with the two character-ring actions and finite generation to prove that `A_{∞,𝔭}[1/2]` acts nearly faithfully on `V̌(P_{∞,𝔭})[1/2]`. Prove that this compact Montréal module is finite over `A_{∞,𝔭}` and that its Galois action satisfies the Cayley–Hamilton relations of the universal local representation. These are the inputs for nonzero fibres and Theorem 6.3.7 (TUNG-2 Propositions 6.2.1–6.2.4, Corollary 6.2.5, pp. 31–32, and Propositions 6.3.2–6.3.5, pp. 32–33).

**Checks.**

- The trivial character specialisation recovers the fixed-determinant partial module with its selected components and fixed central character.
- Near faithfulness means a nilpotent annihilator here; it does not assert zero annihilator without reducedness of the acting ring.
- An auxiliary component must be reached by Proposition 5.4.1; density within one component alone cannot give coverage of every auxiliary component.

*Needs:* §5.5; §2.8; §5.2a; §0.4; LocalGaloisDeformationRings §3.7.2 (MontrealFunctor); LocalGaloisDeformationRings §3.8 (dyadic block identification).

### 5.6 Full support at p = 2 (Tung)


In the setting of §5.5 with `p = 2` splitting completely in `F (F_v ≅ ℚ_2` for v | 2), ρ̄ modular with non-solvable image, totally odd fixed determinant ψε, odd deformation conditions at the real places, Steinberg conditions at Σ and the auxiliary place `v_1`: (1) (Lemma 5.3.2) for a locally algebraic type σ the following are equivalent: (a) the support of the unpatched module M(σ°)[1/2] meets every irreducible component of `Spec R^loc(σ)[1/2]`; (b) `M̃_∞(σ°)[1/2]` is a faithful `R̃_∞(σ)[1/2]`-module, locally free of rank one over the regular locus of its support; (c) `R^S_ψ(σ)` is a finite O-algebra and M(σ)[1/2] is a faithful `R^S_ψ(σ)[1/2]`-module (M(σ) the type-specialised finite-level module of §2.8); (d)–(e) the Hilbert–Samuel multiplicity, resp. cycle, of `R̃_∞^{inv}(σ)/ϖ` equals `Σ_a m_a μ′_a(ρ̄)`, resp. `Σ_a m_a Z′_a(ρ̄)`, over Serre weights a with multiplicities `m_a` in σ̄; (2) for each place 𝔭 and each choice of the other-place types and components in §5.5a with `P_{∞,𝔭}[1/2]≠0`, every closed characteristic-zero point y of `A_{∞,𝔭}` has `V̌(Π_{𝔭,y})≠0` (Corollary 6.3.6), and if `r_x` is absolutely irreducible then `V̌(Π_{𝔭,y}) ≅ r_x^{⊕n_y}` for `n_y≥1` (Theorem 6.3.7). With the other components fixed in this way, `M̃_∞(σ°)[1/2]` is supported on every non-ordinary component of `R̃_∞(σ)[1/2]`; (3) (Theorem 7.3.1) ordinary components are reached by an ordinary `R = T` theorem constructing automorphic ordinary lifts; (4) (Theorem 8.0.1) for every locally algebraic type σ, the support of `M̃_∞(σ°)[1/2]` meets every irreducible component of `R̃_∞(σ)[1/2]`; consequently the 2-adic Breuil–Mézard conjecture holds for every ρ̄: `G_{ℚ_2} → GL_2(k)` (Corollary 8.0.2, the local consequence of this support theorem), new when ρ̄ `≅` (χ ∗; 0 χ).

Here `R̃_∞(σ) = R̃_∞ ⊗̂_{R^loc} R^loc(σ)` is the ambient typed quaternionic patching ring with the fixed determinant and auxiliary conditions, before quotienting by the annihilator of `M̃_∞(σ°)` (TUNG-2 §5.1). Its faithful image is a separate quotient. Every component-coverage and faithfulness assertion in this section refers to this ambient ring.

`p = 2` splits completely in F; ρ̄ automorphic with non-solvable image; the conditions at real places are the odd deformation conditions; the globalisation of a given local ρ̄ (Tung-2 Lemma 4.3.3) cites Calegari Proposition 3.2, Snowden Proposition 8.2.1 and the dyadic construction of Khare–Wintenberger II Theorem 6.1, and Lemma 4.3.4 cites Paškūnas Lemma 3.29 and KW II Lemma 3.5 — audited in §6.5. The equivalences in (1) are analogues of Paškūnas’s Proposition 3.17 and Emerton–Gee’s Lemma 5.5.1; (d)–(e) use the Hilbert–Samuel and cycle formalism of DeformationAndDerivedPatchingAlgebra §§3.12 and 6.7. The ordinary-component part (3) is conditional on the dyadic ordinary `R = T` extension specified above; its exact source is Tung-2 §7, not the odd-p statement of OrdinaryAutomorphicFormsAndModularityLifting §2.2.

A proof proceeds as follows.

1. (1): standard comparison of support, faithfulness and multiplicities for Cohen–Macaulay patched modules of rank one (TUNG-2 Lemma 5.3.2, after Kisin Lemma 2.2.11, Gee–Kisin Lemma 4.3.9, Emerton–Gee Lemma 5.5.1, Paškūnas Proposition 3.17; DeformationAndDerivedPatchingAlgebra §6.7 (cycle specialization multiplicity)).
2. (2): form §5.5a’s partial module and component quotient, retain its nonzero rational hypothesis, and apply its one-place category and nearly faithful Montréal comparison. Corollary 6.3.6 gives nonzero fibres; the Cayley–Hamilton action and absolute irreducibility give Theorem 6.3.7. Apply the last type at 𝔭 through the full-type comparison of §5.5a to obtain the non-ordinary component assertion.
3. (3): Tung Theorem 7.3.1 supplies the ordinary dyadic component argument, using Propositions 7.1.6, 7.2.1 and Corollaries 7.2.2–7.2.3. The odd-p quaternionic nearly ordinary Hecke theorem of OrdinaryAutomorphicFormsAndModularityLifting §2.2 does not supply this `p = 2` input. Apply the exact ordinary dyadic supplier specification above.
4. (4): start with components `C′_v` reached by an existing automorphic lift of ρ̄, chosen ordinary of weight zero at reducible residual places as in TUNG-2 Theorem 8.0.1. Given target components C_v, fix all other places on their currently reached components; the automorphic point makes the resulting partial module nonzero by Remark 6.1.1. Replace the component at 𝔭 by C_𝔭 using (2) if non-ordinary and (3) if ordinary. The full-type comparison produces a new automorphic point with the unchanged other components. Repeat at each place above 2, carrying that nonzero witness to the next partial module. Proposition 5.4.1 covers the auxiliary place. This reaches the prescribed component of the ambient typed ring; (1) and Theorem 5.3.3 give the cycle identity (Corollary 8.0.2).

**Checks.**

- Replacing the ambient typed quaternionic ring by its faithful image makes the support assertion automatic; the component V(y) in the k[x,y]/(xy), R/(x) model still witnesses the lost conclusion.

- For `ρ̄|G_{ℚ_2} ≅` (χ ∗; 0 χ), Corollary 8.0.2 is new (not covered by Paškūnas 2016).
- Non-example: (2) alone gives only the non-ordinary components; ordinary components need (3).

*Needs:* §5.5; §5.5a; §2.8; §5.2; LocalGaloisDeformationRings §3.7.2 (MontrealFunctor); §0.3 (cdp correspondence); §0.4; LocalGaloisDeformationRings §3.8 (WDTypeRing.blockIdentification); DeformationAndDerivedPatchingAlgebra §6.7 (cycle specialization multiplicity); DeformationAndDerivedPatchingAlgebra §3.1 (free of maximal depth regular local); DeformationAndDerivedPatchingAlgebra §3.12 (degree indexed multiplicity); LocalGaloisDeformationRings §3.4 (pst deformation ring); OrdinaryAutomorphicFormsAndModularityLifting §2.2 (quaternionic nearly ordinary hecke algebra); OrdinaryAutomorphicFormsAndModularityLifting §3.14 (integral hecke galois representation).

TUNG-2, Lemma 5.3.2, p. 28; Theorem 5.3.3, p. 29; Proposition 5.4.1, p. 29; Corollary 6.3.6, Theorem 6.3.7, p. 33; Theorem 7.3.1, p. 37; Theorem 8.0.1, Corollary 8.0.2, p. 38: Equivalent forms of full support, the non-ordinary components through 2-adic local Langlands, ordinary components through an ordinary `R = T` theorem, and full support on every component for `p = 2`, giving Breuil–Mézard for `G_{ℚ_2}`.

### 5.7 Pan’s patching at a nice prime


In the setting of §3.8 (p odd, F of even degree with p split, residual pseudo-representation `1 +` χ̄ with χ totally odd, the Eisenstein maximal ideal m of the variant Hecke algebra `T_m`), a prime `q ⊂ T_m` is nice if it satisfies `PanNicePrime` of GL2ModularityLifting §10.1, imported with its contraction to `R^{ps,{ξ_v}}`: (i) `p ∈ q` and dim `T_m/q = 1`; (ii) with A the normalisation of `T_m/q` in k(q), there is a lattice ρ(q)°: `G_{F,S} → GL_2(A)` with ρ(q)° `⊗ k(q) ≅ ρ(q)` irreducible; (iii) its reduction mod `m_A` is a non-split extension (∗ ∗; 0 ∗) of the two residual characters; (iv) if ρ(q) is induced from a character of `G_L` for a quadratic L/F then `L ∩ F(ζ_p) = F`; (v) for every `v ∈ S∖Σ_p`, `ρ(q)°|G_{F_v}` is the constant lift of its reduction. Here `T_m` is the Hecke quotient of §3.8; it supplies the Hecke-quotient input CC2 that GL2ModularityLifting §10.1 assumes. If `p = 3` assume `χ̄|G_{F_v} ≠ ω^{±1}` for v | p. Then for a nice q with `q^{ps} = q ∩ R^{ps,{ξ_v}}`, the surjection `(R^{ps,{ξ_v}})_{q^{ps}} → T_q` has nilpotent kernel (Pan’s Theorem 4.1.7). Consequently (Corollary 4.1.8): if 𝔭 is a maximal ideal of `R^{ps,{ξ_v}}[1/p]` with `ρ(𝔭)|G_{F_v}` irreducible and de Rham with distinct Hodge–Tate weights for every v | p, and some irreducible component of `R^{ps,{ξ_v}}` contains both 𝔭 and a nice prime, then ρ(𝔭) arises from a regular algebraic cuspidal automorphic representation of `GL_2(𝔸_F)`.

The predicate and its API (`PanNicePrime.lattice`, `PanNicePrime.iff`) are those of GL2ModularityLifting §10.1; this section proves Pan’s theorems for it. `p = 3` needs `χ̄|G_{F_v} ≠ ω^{±1}`; the ordinary/residual analysis that produces nice primes on a component (Pan §§5–7) belongs to the consumer GL2ModularityLifting §§10.1–10.6.

A proof proceeds as follows.

1. Local and global framed deformation rings at q (Pan §4.2: completions at the constant lift at `v ∈ S∖Σ_p` are the usual local deformation rings, by condition (v)), Taylor–Wiles primes at a one-dimensional prime (Pan §4.3, Proposition 4.3.2, Lemmas 4.3.4–4.3.11, using condition (iv) and the irreducible lattice ρ(q)°; GlobalGaloisDeformations R04.5 treats an absolutely irreducible residual representation and does not cover this case, so the construction is part of this node’s proof), completed homology with auxiliary levels (§4.4).
2. Patch the completed homology and the deformation rings at q (Pan §§4.5–4.6, §5.5 in Pan’s variant; patched pseudo-deformation and representation rings, Definition 4.6.3, Proposition 4.6.16).
3. Apply Paškūnas’s theory and the local–global compatibility of §4.11 to the patched block multiplicity module `m_∞` (Pan §4.7, Proposition 4.7.7): it is finitely generated over the localised patched ring and of the expected dimension, by the dimension bound Theorem 3.6.1.
4. Full support first uses the case of nontrivial tame characters `ξ_v`: Proposition 4.2.4 and Lemma 4.2.6 make the relevant completed local patched ring irreducible, and Lemma 4.8.2 gives the dimension needed for full support of `m_∞`; Lemma 4.8.5 descends to T. For arbitrary `ξ_v`, choose nontrivial `ξ′_v` congruent modulo ϖ and use the compatibility of patched reductions with the characteristic-zero minimal-prime transfer in Corollary 4.8.4. This character-changing argument (Pan pp. 69–70) is essential; equidimensionality and a dimension bound alone give only some components.
5. Corollary 4.1.8 combines the theorem (the component through q lies in the closed image of `Spec T_m`, so 𝔭 is pro-modular) with classicality, §4.11(5).

**Checks.**

- Corollary 4.1.8 is the input of GL2ModularityLifting §§10.1–10.6 (nice prime component bridge) (input CC4).
- Non-example: for a one-dimensional prime with ρ(q)° residually split (condition (iii) fails), Pan’s local analysis at the constant lift does not apply.

*Needs:* §3.8; §4.11; §4.10; §5.5; GL2ModularityLifting §10.1 (PanNicePrime); LocalGaloisDeformationRings §8.5 (ordinary pcris lifts reducible); DeformationAndDerivedPatchingAlgebra §§6.1, 6.4 (nearly faithful and component support conclusions); IntegralHeckeAndGaloisDeterminants IHG.0–IHG.1; `mathlib:IsNilpotent`; `mathlib:RingHom.ker.`

PAN, Definition 4.1.4, Remarks 4.1.5–4.1.6, Theorem 4.1.7, Corollary 4.1.8, p. 39: Nice primes of `T_m`, nilpotence of the kernel of `(R^{ps,{ξ_v}})_{q^{ps}} → T_q` at a nice prime, and automorphy of de Rham points on a component through a nice prime.

PAN, §§4.2–4.8, Proposition 4.2.4, Definition 4.5.6, Proposition 4.6.16, Proposition 4.7.7, Lemmas 4.8.2–4.8.5, pp. 40–70: Patching at a one-dimensional prime: local and global deformation rings, Taylor–Wiles primes, patched completed homology, patched rings, the application of Paškūnas’s theory and the full-support argument.

### 5.8 Pan’s patching in the residually irreducible case


Let `p > 2`, F totally real with p split completely, and ρ: `G_F → GL_2(O)` continuous irreducible with (1) finitely many ramified places, (2) `ρ̄|G_{F(ζ_p)}` absolutely irreducible, (3) `ρ|G_{F_v}` absolutely irreducible and de Rham with distinct Hodge–Tate weights for every v | p, and if `p = 3`, `ρ̄|G_{F_v}` not of the form (η ∗; 0 ηω) or (ηω ∗; 0 η), (4) `det ρ(c) = −1` for every complex conjugation c, (5) ρ̄ arises from a regular algebraic cuspidal automorphic representation `π_0` of `GL_2(𝔸_F)`. Then ρ arises from a regular algebraic cuspidal automorphic representation of `GL_2(𝔸_F)` (Pan’s Theorem 8.0.1). The proof shows that the patched completed homology `m_∞` has full support on `Spec R^v_∞` (Proposition 8.4.9) and hence the kernel of `R^{(ξ_v)} → T_m` is nilpotent (Corollary 8.4.10). When `F = ℚ`, hypothesis (5) follows from Serre’s conjecture (Khare–Wintenberger), which gives Pan’s unconditional Theorem 1.0.4 (Remark 8.0.4); that route is a full-Serre consequence and is excluded from any independent proof of Serre’s conjecture.

Hypothesis (5), residual modularity, is retained; replacing it by Serre’s conjecture for `F = ℚ` (Remark 8.0.4) uses the full Serre theorem. Tung’s thesis removes Pan’s extra `p = 3` restriction (Pan Remark 8.0.2); retain Pan’s stated restriction here.

A proof proceeds as follows.

1. Standard reductions by solvable base change: unipotent inertia away from p, N(v) ≡ 1 mod p at ramified v ∤ p with ρ̄ trivial there, [F : `ℚ`] even, `π_0` unramified outside p (Pan 8.0.5).
2. Galois deformation rings and completed homology with auxiliary levels (Pan §§8.1–8.2), patching (§8.3, §5.5).
3. Apply Paškūnas’s theory and local–global compatibility (§4.11) to the patched block module: full support (Proposition 8.4.9) and nilpotent kernel (Corollary 8.4.10) (Pan §8.4).
4. Conclude with classicality of points absolutely irreducible and de Rham at every v | p (§4.11(5)) and Jacquet–Langlands.

**Checks.**

- Applied with `F = ℚ` and ρ̄ residually modular by hypothesis, the theorem is the residually irreducible Fontaine–Mazur theorem in the form GL2ModularityLifting §§10.1–10.6 (pan residually irreducible fontaine mazur) consumes (input CC4).
- Non-example: dropping (5) and invoking Theorem 1.0.4 instead is not admissible in an independent proof of Serre’s conjecture.

*Needs:* §5.5; §4.11; §4.10; GlobalGaloisDeformations R04.3 (global framed ring); GlobalGaloisDeformations R04.3 (local to global presentation); GlobalGaloisDeformations R04.4 (restriction ring map); GlobalGaloisDeformations R04.4 (enlarging ramification); GL2AutomorphicRepresentationsAndTransfer R17.3 (global jl); DeformationAndDerivedPatchingAlgebra §6.1 (nearly faithful iff support eq univ).

PAN, Theorem 8.0.1, p. 124; Remarks 8.0.2–8.0.4 and 8.0.5, p. 125; Proposition 8.4.9, Corollary 8.4.10, p. 132: Fontaine–Mazur in the residually irreducible case under residual modularity, via full support of patched completed homology; Remark 8.0.4 records that for `F = ℚ` residual modularity follows from Khare–Wintenberger.

PAN, Theorem 1.0.4, p. 5: The unconditional consequence for `F = ℚ` obtained through Serre’s conjecture.

### Examples

Over `R=k[x,y]/(xy)`, `M=R/(x)` has support `V(x)`, one irreducible component, and annihilator `(x)≠0`. Thus a union of components is not full support. Over `R=k[ε]/(ε²)`, `M=R/(ε)` has full support but annihilator `(ε)≠0`; reducedness is essential for faithfulness. At a wrong inertial type a finite-level typed space is zero and cannot be a faithful module for a nonzero deformation ring. These examples distinguish the support, type and coefficient hypotheses in the patching theorems.

### Dependencies

Layers 1–4 supply the finite-level modules and arithmetic compatibility. DeformationAndDerivedPatchingAlgebra Layers 3, 5, 6 and 8 supply abstract patching, cycles and component support; GlobalGaloisDeformations R04.5 supplies the irreducible-residual Taylor–Wiles construction. LocalGaloisDeformationRings §§1.1, 3.4 supply unrestricted and typed local rings with the irreducibility/reducedness assumptions stated here. PhiGammaModulesAndIwasawaCohomology §§1.1–1.2, 7.1 and 7.5 supply the affinoid Robba carriers and triangulation data used by §5.2a; representability and the patched Jacquet, component, density and tangent comparisons are targets here. The rank-n definite unitary construction is §0.7; its degree-zero adapter extends CompletedCohomologyPartII §8.5 as specified above. §§0.2–0.4 supply the all-odd-prime and dyadic local inputs. The ordinary `p=2` component theorem is the precise extension of OrdinaryAutomorphicFormsAndModularityLifting §2.2 above. Nice-prime Taylor–Wiles data with residually reducible trace are constructed in §5.7 rather than inferred from the irreducible-residual contract.

## Layer 6: exports and source independence


This layer states the global consequences and the contracts. Promodularity (Theorem 1.2.3) and its Fontaine–Mazur and Kisin consequences are recorded with their dependence on Serre's conjecture made explicit; Böckle's `R = T` identifies the completed Hecke algebra with the deformation ring under his hypotheses; the potentially crystalline non-crystabelline case of Emerton's Theorem 3.3.22 is proved by realising the local representation in completed cohomology; Dospinescu–Le Bras globalise a supercuspidal representation on a definite quaternion algebra through a CM form. The dependency statements below distinguish the globalisations needed by each result and the exact comparisons consumed by the lifting theorems.
The global locally algebraic formula requires the full auxiliary CM weight-occurrence input and the determinant-exponent comparison of §6.3. Both CM branches require the prescribed Hecke-character existence theorem of their transfer supplier. Independence from Serre’s theorem is asserted only relative to the explicitly stated globalisation hypotheses in §6.5.

### 6.1 Promodularity and the Fontaine–Mazur and Kisin consequences


(Corollary 1.2.2) Let V be promodular, continuous, irreducible, two-dimensional over E, unramified outside finitely many primes, with V̄ absolutely irreducible and `V̄|G_{ℚ_p}` ≇ `χ ⊗` (1 ∗; 0 ε̄). (1) If `V|G_{ℚ_p}` is trianguline, V is a twist of the Galois representation of an overconvergent p-adic cuspidal eigenform of finite slope. (2) If `V|G_{ℚ_p}` is de Rham with distinct Hodge–Tate weights and is not the direct sum of two characters with isomorphic reductions, V is a twist of the Galois representation of a classical cuspidal eigenform of weight `k ≥ 2`. (Theorem 1.2.3, Böckle, Diamond–Flach–Guo, Khare–Wintenberger, Kisin) If V is continuous, irreducible, odd, two-dimensional over E, unramified outside a finite Σ, and (a) `p > 2`, (b) `V̄|G_{ℚ(ζ_p)}` is absolutely irreducible, (c) `V̄|G_{ℚ_p}` ≇ `χ ⊗` (1 ∗; 0 1) and ≇ `χ ⊗` (1 ∗; 0 ε̄) for every k-valued χ, then V is promodular of tame level divisible only by the primes in `Σ∖{p}`. (Theorem 1.2.4) Under (a)–(c), the conclusions of Corollary 1.2.2 hold without assuming promodularity: Kisin’s conjecture in the trianguline case and the Fontaine–Mazur conjecture in the de Rham case.

Corollary 1.2.2 uses the promodularity hypothesis; Theorem 1.2.3 supplies it, but its proof uses Serre’s conjecture (Khare–Wintenberger, Kisin) to know that V̄ is modular (EM11 §7.3), so Theorem 1.2.4 inherits that dependence (§6.5). Corollary 1.2.2(2) has an extra hypothesis absent from Theorem 1.2.4; under (c) a sum of two characters with isomorphic reductions has `V̄|G_{ℚ_p} a` twist of `1 ⊕ 1`, which (c) excludes (a deduction, not stated in the source). Kisin’s parallel result replaces (c) by `V̄|G_{ℚ_p}` ≇ `χ ⊗` (ε̄ ∗; 0 1) (Emerton Remark 1.2.5); the two are different statements. Conclusions are up to twist; (1) relies on the proof of EM-PAMQ Theorem 7.5.8, which is only sketched there, and Emerton replaces it by an equidimensionality argument (EM11 §7.2).

A proof proceeds as follows.

1. Corollary 1.2.2(2) (EM11 Theorem 7.1.1): if `V|G_{ℚ_p}` is not a direct sum of characters, the distinct Hodge–Tate weights exclude a self-extension, so Theorem 1.2.1(1) gives an embedding of `B(V|G_{ℚ_p})` tensored with its away-from-p factor. If `V|G_{ℚ_p} = χ₁ ⊕ χ₂`, the corollary requires distinct reductions of χ₁ and χ₂. This gives p-distinguishedness, so use the isomorphism of Theorem 1.2.1(2). In either case fix a nonzero vector in the away-from-p factor to obtain a G-equivariant embedding `B(V|G_{ℚ_p}) → Hom(V, Ĥ^1_E)`. By Colmez (EM11 Theorem 3.3.21, supplied by §0.3) `B(V|G_{ℚ_p})_{l.alg} ≠ 0`, so `Hom(V, (Ĥ^1_E)_{l.alg}) ≠ 0` and §2.1 gives a classical form.
2. Corollary 1.2.2(1) (EM11 Theorem 7.2.1): pass to locally analytic Jacquet modules `J_B`; for trianguline V each Jordan–Hölder factor of `B(V)^{an}` has nonzero Jacquet module, so the eigensystem of V appears in `Spec A(K^p)_ρ̄`, which is equidimensional of dimension two by §3.5a’s `jacquetEigenvariety_dimension` under §1.4(d), and identified with finite-slope eigenforms by `jacquetEigenvariety_comparison`; hence V is a twist of a finite-slope overconvergent eigenform (the Jacquet functor is supplied by §0.1).
3. Theorem 1.2.3 (EM11 §7.3): Serre’s conjecture gives V̄ modular; Böckle’s Corollary 3.8 handles `V̄|G_{ℚ_p}` absolutely reducible and the finite flat case; Diamond–Flach–Guo’s extensions of Wiles–Taylor–Wiles–Diamond and Ramakrishna to arbitrary absolutely irreducible `V̄|G_{ℚ_p}` give the rest; the p-adic Langlands correspondence plays no role.
4. Theorem 1.2.4 combines Theorem 1.2.3 with Corollary 1.2.2.

**Checks.**

- For `V = V_f ⊗ ψ` with f classical and ψ a finite-order character, all hypotheses can be checked and the conclusion recovers f up to twist.
- For a split local representation `χ₁ ⊕ χ₂` with distinct Hodge–Tate weights and distinct reductions, classicality uses Theorem 1.2.1(2). Part (1)’s embedding clause does not apply to this split representation.
- A local self-extension of χ has χ’s Hodge–Tate weight twice; it cannot enter the distinct-weight nonsplit branch. A split sum with isomorphic reductions fails the corollary’s separate split-case hypothesis.
- Non-example: for `p = 2` Theorem 1.2.3 is not available, so Theorem 1.2.4 gives nothing at `p = 2`.

*Needs:* §4.5; §2.1; §1.4; §6.2; §0.1; §0.3; §3.5a (Jacquet spectrum and finite-slope comparison); PadicFamilies §§2.4–2.10.

EM11, Corollary 1.2.2, Theorems 1.2.3–1.2.4, Remark 1.2.5, pp. 4–5: The Fontaine–Mazur and Kisin consequences for promodular V, the promodularity theorem with hypotheses (a)–(c), and their combination.

EM11, Theorems 7.1.1 and 7.2.1 with proofs, pp. 94–95; §7.3, pp. 95–96: Proofs of the two parts of Corollary 1.2.2 from Theorem 1.2.1, Colmez’s non-vanishing of locally algebraic vectors and Jacquet modules; the proof of Theorem 1.2.3 from Serre’s conjecture, Böckle and Diamond–Flach–Guo.

### 6.2 Böckle’s R = T for the completed Hecke algebra


Let ρ̄: `G_ℚ → GL_2(k)` be absolutely irreducible, odd and modular, unramified outside `Σ = Σ_0 ∪ {p}`. Assume (1) `p ≥ 3`, (2) `ρ̄|G_{ℚ(ζ_p)}` absolutely irreducible, (3) `ρ̄|G_{ℚ_p}` is neither `χ ⊗` (1 ∗; 0 1) nor `χ ⊗` (1 ∗; 0 ε̄) for any k-valued χ. Then the surjection `φ_Σ`: `R_{ρ̄,Σ} → T_{ρ̄,Σ}` of §3.3 is an isomorphism. In particular every deformation of ρ̄ unramified outside Σ is promodular, and `T_{ρ̄,Σ}` is a complete intersection of relative dimension three over O when `R_{ρ̄,Σ}` is unobstructed.

ρ̄ modular is a hypothesis; replacing it by ρ̄ odd uses Serre’s conjecture (Khare–Wintenberger, Kisin). The relative-dimension remark holds only in the unobstructed case (`H^2(G_{ℚ,Σ}`, ad ρ̄) `=` 0); it is not used elsewhere.

A proof proceeds as follows.

1. Use Böckle’s Corollary 3.8 when `ρ̄|G_{ℚ_p}` is reducible. His Assumption 2.1, p. 3, retains residual modularity, irreducibility over the quadratic cyclotomic subfield and the specified local alternatives; Theorem 3.7 also excludes the cyclotomic ratio in the reducible case. Corollary 3.8 gives density, Corollary 3.5 gives reducedness and Theorem 3.9 gives `R=T` (BOE, pp. 9–10). For irreducible local restriction which is finite flat up to twist, the argument combines finite-flat global `R=T` (Wiles, Taylor–Wiles and Diamond) with Ramakrishna’s formal smoothness of the fixed-determinant finite-flat local ring of relative dimension one. For arbitrary irreducible local restriction, choose a twist with Fontaine–Laffaille indices `0,k−1`, where `2≤k≤p`, and use Diamond–Flach–Guo Theorem 3.6 and Corollary 2.3 in place of those two ingredients (EM11 §7.3, pp. 95–96). The density input concerns the corresponding classical points across these weights, rather than only weight-two finite-flat points. The `k=p` endpoint is the extension of the DFG argument described by EM11 p. 96; it is not obtained by omitting the ramified-crystalline-short and residual-image hypotheses of DFG Theorem 3.6. The resulting reduced deformation ring and density theorem are the exact supplier input of Nakamura Theorem 2.1.
2. Apply that deformation-theoretic density theorem on `Spec R_{ρ̄,Σ}`: every classical point in its dense family factors through `φ_Σ`, so `ker φ_Σ` lies in their intersection. Reducedness makes this intersection zero. Density in the Hecke quotient from §3.6 alone would not prove injectivity; density on the deformation side and its reducedness are both required.

**Checks.**

- Nakamura uses this to transfer his zeta morphisms from `T_{ρ̄,Σ}` to `R_{ρ̄,Σ}` (his Theorem 1.1).
- Non-example: for `ρ̄|G_{ℚ_p} ≅ χ ⊗ (1 ∗; 0 ε̄)` the theorem is not asserted; this is the case excluded by Emerton’s Remark 1.1.2 and Assumption 3.3.1.
- For the surjection `k[x]→k` sending x to zero, both rings are reduced and the sole point of Spec k is dense there, but the kernel (x) is nonzero. This rejects a density argument using only the target ring. Conversely `k[η]/(η²)→k` has the same underlying spectrum, yet the nonzero nilpotent kernel shows why reducedness of the source cannot be omitted.

*Needs:* §3.3; §3.6; LocalGaloisDeformationRings §F.2.5 (universal deformation ring); GlobalGaloisDeformations R04.3 (global framed ring); GlobalGaloisDeformations R04.3 (local to global presentation); LocalGaloisDeformationRings §8.3 (export fontaine laffaille irreducible).

NAK, Theorem 2.1 and its proof, pp. 17–18: Under `p ≥ 3`, `ρ̄|G_{ℚ(ζ_p)}` absolutely irreducible and the two local exclusions, `φ_Σ`: `R_{ρ̄,Σ} → T_{ρ̄,Σ}` is an isomorphism (Böckle Corollary 3.8 and the proof of Emerton’s Theorem 1.2.3).

EM11, §7.3, pp. 95–96: The proof of Theorem 1.2.3 through Böckle’s deformation-theoretic method and Diamond–Flach–Guo.

### 6.3 Locally algebraic vectors of `B(V)` by a global argument


Let `V_E` be a continuous two-dimensional representation of `G_{ℚ_p}` over E, de Rham with distinct Hodge–Tate weights `a > b`, and either absolutely irreducible or in the domain of EM11 Definition 3.3.15 on which §0.3 constructs B. After establishing the normalisation comparison specified below, the target is `B(V_E)_{l.alg} ≅ Sym^{a−b−1}E^2 ⊗ det^{b+1} ⊗ π_p(V_E)`, G-equivariantly, where `π_p(V_E)` is the smooth representation attached by classical local Langlands to the Weil–Deligne representation of `V_E` (Emerton’s Theorem 3.3.22). For `V_E` crystabelline or a twist of semistable this is Colmez’s Theorem VI.6.50; for `V_E` potentially crystalline but not crystabelline Emerton’s proof is global: realise a representation `V′_E` with the same Weil–Deligne representation and Hodge–Tate weights (up to unramified twist and extension of scalars) as a classical eigenform’s local component at p, with the prescribed type σ, and compare the locally algebraic vectors of `Ĥ^1(K_1^p(N))_{E,ρ̄,Σ}[𝔭]` computed by EM-PAMQ Theorem 7.4.2 with those of `ρ(𝔭) ⊗ B(ρ(𝔭)|G_{ℚ_p})` given by Theorem 1.2.1. Only a nonzero `G_ℚ × G`-map `ρ(𝔭) ⊗ B(ρ(𝔭)|G_{ℚ_p}) → Ĥ^1[𝔭]` is needed (Emerton’s Remark 7.4.2). Potentially crystalline, non-crystabelline `V_E` are absolutely irreducible: a reducible de Rham `V_E` is an extension of de Rham characters, which become crystalline over an abelian extension L, and potential crystallinity then makes inertia of L act unipotently and through a finite quotient on the Weil–Deligne representation, hence trivially. So the global argument stays inside the domain.

The global proof is placed here, after Layer 4, and is exported to consumers of Kisin’s Hypothesis (1.2.6) (input LL3 of GL2ModularityLifting); §0.3 states Colmez’s local cases without using this global result. Colmez’s non-vanishing `B(V_E)_{l.alg} ≠ 0` (Theorem VI.6.18) and the irreducibility of B for irreducible `V_E` (Emerton Proposition 3.3.24) are local inputs (§0.3). The global realisation uses an auxiliary modular ρ̄ with `ρ̄|G_{ℚ_p}` irreducible (the reduction of the induction of a Grössencharacter of an imaginary quadratic field in which p is inert) having a chosen Serre weight W, and the weight part of Serre’s conjecture for that ρ̄ (Emerton Remark 5.7.4 notes this is its only use in the paper); it does not invoke Khare–Wintenberger for the representation under study. The displayed locally algebraic formula follows EM11 Theorem 3.3.22, p. 28. Its §7.4 proof on pp. 97–98 uses `det^b` with the same weight letters, whereas the theorem has `det^{b+1}`. Prove `globalAlgebraicNormalization` before identifying the global comparison with this displayed twist. The auxiliary CM-induced residual representation requires R17.5’s prescribed Hecke-character existence theorem, with its S-unit character-extension hypotheses.

A proof proceeds as follows.

1. By Colmez (Theorem VI.6.42) `B(V_E)_{l.alg}` depends only on `π_p(V_E)` and the weights, so it suffices to treat one `V′_E` with the same `π_p` and weights; `π_p(V_E)` is cuspidal since `V_E` is potentially crystalline and not crystabelline (EM11 §7.4, p. 97).
2. Choose a minimal type σ of `π_p(V_E)` and a lattice `τ_0` in the algebraic-type tensor product used in §7.4; choose a constituent Serre weight W of `τ_0/ϖ`. The auxiliary CM-induced modular ρ̄ has irreducible local restriction and W in its Serre-weight set. The full weight-part input used in EM11 Remark 5.7.4 and p. 97 then gives occurrence of W in the localised cohomology. Lift using Layer 1’s injectivity and choose a characteristic-zero Hecke point where `Hom_K(τ,Ĥ^1_E)[𝔭]` is nonzero. Use the full auxiliary CM weight-occurrence contract above; a minimal-weight theorem alone does not assert this occurrence.
3. The nonzero τ-type vectors make 𝔭 classical; §0.3 (henniart types) identifies its smooth local factor up to unramified twist. This uses GL2AutomorphicRepresentationsAndTransfer §R16.2.9 through §0.3’s scalar-extension/convention adapter.
4. The classical comparison computes the locally algebraic cohomology at that point. The nonzero map of Remark 6.4.3 is injective because B is topologically irreducible; local nonvanishing then identifies its locally algebraic factor with the classical one. To export the exact formula in the statement, first resolve the `det^b` versus `det^{b+1}` normalisation comparison using the fixed dual, Hodge–Tate and local-Langlands conventions.

**Checks.**

- For `V_E = V_f|G_{ℚ_p}` with f of weight k and level prime to p, `B(V_E)_{l.alg} ≅ (Sym^{k−2}E²)^∨ ⊗ π_p(V_f)` in §2.1’s normalisation, the Breuil–Schneider representation; at k=4 small scalars act on it by `u^{−2}`, not by the `u²` of `Sym²`.
- Non-example: for `V_E` de Rham with equal Hodge–Tate weights, `B(V_E)_{l.alg} = 0` (Colmez’s converse); the theorem needs distinct weights.
- For `p > 2`, `V_E = 1 ⊕ ε` is de Rham with distinct weights, but its residual characters differ, so every stable lattice splits with reduction `1 ⊕ ε̄`, which Assumption 3.3.1 excludes; as `V_E` is also reducible, B is not constructed there and the formula is not asserted.

*Needs:* §4.3; §2.5; §2.1; §3.6; §1.4; §0.3 (locally algebraic vectors); §0.3 (henniart types).

EM11, Theorems 3.3.21–3.3.22 and Remark 3.3.23, pp. 27–28; §7.4 with (7.4.1) and Remark 7.4.2, pp. 96–98: `B(V_E)_{l.alg} ≅ Sym^{a−b−1} ⊗ det^{b+1} ⊗ π_p(V_E)` for de Rham `V_E` with distinct weights; Colmez proves the crystabelline and semistable cases and Emerton the remaining potentially crystalline case by the global comparison.

### 6.4 Globalising a supercuspidal π on a definite quaternion algebra


Let π be an irreducible supercuspidal smooth representation of `GL_2(ℚ_p)` over L (with trivial central character on a fixed uniformiser up to twist), B̄ the definite quaternion algebra over `ℚ` of discriminant ℓ (ℓ `≠ p`, ramified at ℓ and ∞), and Σ, `K^p` as in §1.6. Then there is a quaternionic modular form f of weight 2 for `B̄^*` such that, with π(f) its automorphic representation, `π(f)_p ≅ π ⊗` (ξ∘det) for an unramified character ξ, and `r̄_f`: `G_ℚ → GL_2(F̄_p)` is absolutely irreducible on `G_{ℚ_p}` (Dospinescu–Le Bras Theorem 5.5). The proof uses: (Lemma 5.6) for a minimal `GL_2(ℤ_p)-type σ` of π, `a GL_2(ℤ_p)-stable` lattice `σ_0` and a Serre weight W in the socle of `σ̄_0`, there is a quaternionic form g whose residual `r̄_p` is absolutely irreducible with W in the `GL_2(ℤ_p)-socle` of the mod p local Langlands π̄ of `r̄_p`, obtained as the Jacquet–Langlands transfer of the weight-two CM form attached to a Hecke character of an imaginary quadratic F in which p and ℓ are inert; and (Hecke) the automorphic induction of a Hecke character χ of F with `χ_∞(z) = z^{-1}`, not factoring through the norm, is a weight-two cusp form whose component at an inert prime is the local automorphic induction and whose p-adic Galois representation is the induction of the Galois character of χ.

The CM form is constructed from a Hecke character with prescribed reduction at p and supercuspidal local induction at ℓ; this globalisation uses class field theory and automorphic induction only, not Serre’s conjecture. DLB’s proof of Lemma 5.6 prints `η̄_p` where the condition is on the Galois character attached to χ (the Galois-character convention); the node uses the corrected condition. Require the local–global character-extension theorem of R17.5/prescribed-local-induction with the infinity type, residual inert-p character and regular inert-ℓ character specified here.

A proof proceeds as follows.

1. Reduce to `W = Sym^r F_p^2` (0 `≤ r ≤ p −` 1); by the explicit mod p local Langlands correspondence it suffices that `r̄_p ≅ Ind_{ℚ_{p^2}}^{ℚ_p} ω_2^{r+1}` up to unramified twist (supplied by §0.2).
2. Choose F imaginary quadratic with p and ℓ inert and a Hecke character χ with `χ_∞(z) = z^{-1}`, Galois character reducing to `ω_2^{r+1}` at p up to unramified twist, and `χ_ℓ` with supercuspidal local induction; its automorphic induction is a weight-two cusp form (GL2AutomorphicRepresentationsAndTransfer R17.5 (prescribed local induction), applied over `ℚ` with the prescribed place p, `L_p = ℚ_{p^2}`, and with `v = ℓ` where `L/ℚ` is not split and `ξ_ℓ` does not factor through the norm, so the component at ℓ is supercuspidal), discrete series at ℓ, which transfers to `B̄^*` by global Jacquet–Langlands (R17.3/global-jl) (DLB Lemme 5.6).
3. From g, use §4.9 (or its weak form Proposition 13.5), exactness of `Hom_{GL_2(ℤ_p)}(−, C^0(X(K^p), O/ϖ^n)_m)` (§1.7(b)) and Henniart’s unicity of types to produce f with `π(f)_p ≅ π ⊗` ξ∘det (DLB Théorème 5.5 and its proof, after Emerton and the proof of Théorème 5.1 in Breuil’s Bourbaki exposé 1031).
4. GL2AutomorphicRepresentationsAndTransfer R17.3 (supercuspidal globalization) concerns a different CDN setting and is not used. The `ℚ` weight-two CM route instead uses /prescribed-local-induction with the specified character-extension hypotheses.

**Checks.**

- For π the supercuspidal of conductor `p^2` attached to a regular character of `ℚ_{p^2}^×`, a tame inert-p character with the chosen residual Serre weight provides the local datum for Lemma 5.6; a global χ still requires the prescribed character-extension hypotheses. The auxiliary CM form need not already have π as its p-component.
- Non-example: for π a principal series the theorem is not needed; a global form with given principal series at p exists by Hida/eigencurve arguments and has reducible `r̄_p` in general.

*Needs:* §4.9; §1.7; §2.7; GL2AutomorphicRepresentationsAndTransfer R17.5 (prescribed local induction); GL2AutomorphicRepresentationsAndTransfer R17.3 (global jl); §0.2 (montreal on irreducibles).

DLB, Théorème 5.5 and its proof with Lemme 5.6, pp. 26–27: A weight-two quaternionic form with p-component π up to unramified twist and residual representation absolutely irreducible at p, built from a CM form with a prescribed Serre weight and Emerton’s local–global compatibility for B̄.

### 6.5 Residual modularity and globalisation hypotheses


The local–global and support results have the following distinct dependencies on globalisation and on the full Serre theorem (Khare–Wintenberger, Kisin): (i) Theorem 1.2.1 and Corollary 1.2.2 (§4.5, §6.1) assume V promodular and ρ̄ modular; they invoke no globalisation beyond that hypothesis, and Theorem 6.2.4 is proved by Mazur’s principle, not by Theorem 1.2.3; (ii) Emerton’s Remark 5.2.3 (allowable levels at the Artin conductor) cites the proof of Serre’s conjecture but, for `p > 2`, only needs the earlier weak-to-strong Serre theorem; (iii) Theorem 1.2.3 (promodularity) and hence Theorem 1.2.4 use Serre’s conjecture explicitly (EM11 §7.3) — excluded from any independent proof of Serre; (iv) Theorem 1.2.6’s hypothesis ‘modular (equivalently odd)’ — the equivalence is Serre’s conjecture; with ‘modular’ as hypothesis it is independent; (v) Emerton’s §7.4 (§6.3) uses an auxiliary CM-induced modular ρ̄ and the weight part of Serre’s conjecture for it (EM11 p. 97, Remark 5.7.4), not Khare–Wintenberger for the representation studied; (vi) Dospinescu–Le Bras Theorem 5.5 uses CM forms and Jacquet–Langlands only; (vii) CEGGPS’s patched module, also used in Tung’s odd-p paper, cites Emerton–Gee Corollary A.7 and Proposition A.2 (potential-automorphy globalisation). Independence from Serre’s theorem is relative to the automorphic-adequate globalisation hypothesis specified above; (viii) Tung’s 2-adic paper: Lemma 4.3.3 globalises r̄ through Calegari Proposition 3.2 (Moret-Bailly), Snowden Proposition 8.2.1 and, at `p = 2`, Khare–Wintenberger II Theorem 6.1’s construction (dyadic Hilbert–Blumenthal abelian varieties); Lemma 4.3.4 cites Paškūnas Lemma 3.29 (which keeps a given-automorphic hypothesis) and KW II Lemma 3.5; (ix) Barnet-Lamb–Gee–Geraghty Theorem A.4.1 (reducible locus) assumes a potentially automorphic residual seed in addition to adequacy and potentially diagonalisable regular local lifts; (x) Emerton–Paškūnas Theorem 6.3 gives support on a union of components, not full support, so Tung’s Proposition 3.9 keeps its irreducibility, reducedness and density inputs; (xi) Pan’s Theorem 8.0.1 keeps residual modularity as hypothesis (5), while his Theorem 1.0.4 (via Remark 8.0.4) and Emerton’s §7.3 are full-Serre consequences and are excluded; (xii) Pan’s residually reducible Theorem 4.1.7 needs no residual modularity. The CEGGPS and dyadic branches use their exact globalisation supplier specifications above. To deduce a theorem independently of Serre’s theorem, establish those specifications without invoking Serre; no such independence follows merely from their conclusions. The CM branches also require R17.5’s prescribed Hecke-character existence theorem.

These implications are relative to the stated globalisation inputs. Promodularity and residual modularity can instead be independently established hypotheses.

A proof proceeds as follows.

1. With residual modularity as a hypothesis, the local–global theorems of §4.5 apply directly. Replacing that hypothesis by oddness uses the full Serre theorem; it changes the dependency of the resulting implication.
2. Emerton: §7.3 opens by invoking Serre’s conjecture for V̄; §6.2’s proofs use only the modular-ρ̄ hypothesis and Mazur’s principle; §7.4 uses completed cohomology at an allowable level.
3. Tung/CEGGPS/BLGG/EP/Pan: use the globalisation theorems and residual automorphy hypotheses enumerated in the statement. Their independence from a proposed application is an additional hypothesis of that application.
4. These implications give the arithmetic inputs to the lifting-side dependency comparison of GL2ModularityLifting §12.4.

**Checks.**

- Applied to an argument claiming to reprove Serre’s conjecture: it may use §4.5’s Theorem 1.2.1 and §6.1’s Corollary 1.2.2 with independently established promodularity, Pan’s Theorem 4.1.7, Tung’s full support (relative to independent proofs of its stated globalisation hypotheses), but not Theorem 1.2.3, Theorem 1.2.4, the ‘odd’ form of Theorem 1.2.6, Pan’s Theorem 1.0.4, or Emerton’s §7.3.
- The audit is consumed by GL2ModularityLifting §12.4 (globalisation dependency audit) (inputs CC5).

*Needs:* §4.5; §4.2; §4.6; §6.1; §6.3; §6.4; §5.1; §5.4; §5.6; §5.3; §5.7; §5.8.

EM11, Theorems 1.2.1, 1.2.3, 1.2.6 and Remark 5.2.3, pp. 3–5, 47; §7.3, pp. 95–96; §7.4, pp. 96–98: Which results assume promodularity or modularity of ρ̄, and where Serre’s conjecture is invoked (§7.3 for promodularity; the ‘equivalently odd’ form of Theorem 1.2.6).

TUNG-2, Lemmas 4.3.3–4.3.4, p. 21: The suitable globalisation of a local residual representation through Calegari, Snowden and KW II at `p = 2`, and the automorphy of the globalisation through Paškūnas Lemma 3.29 and KW II Lemma 3.5.

CEGGPS, §2.1 and Lemma 2.2, pp. 15–17: The globalisation of r̄ via Emerton–Gee Corollary A.7, with automorphic, adequate, unramified-away-from-p properties.

EP, Theorem 6.3 and Remark 6.4, p. 26: Support on a union of irreducible components, with full support only when the framed ring is irreducible.

PAN, Theorem 8.0.1 and Remarks 8.0.2–8.0.4, pp. 124–125: Residual modularity as hypothesis (5), and its replacement by Khare–Wintenberger for `F = ℚ`.

DLB, Proof of Théorème 5.5 and Lemme 5.6, pp. 26–27: The globalisation through a CM form and Jacquet–Langlands.

### 6.6 Consequences for the GL₂ lifting theorems and other consumers


The exact statements this roadmap exports, by consumer branch: (CC1) type-specialised quaternionic modules for arbitrary m, their typed representation-deformation-ring action at non-Eisenstein m with the compatible fixed-determinant problem (§2.8), and faithfulness over that ring under §5.6’s full-support hypotheses, with Pan’s classicality (§4.11(5)); (CC2) Pan’s completed Hecke quotient, determinant-fixed pseudo-character with p-power tame characters, pro-modular primes as kernel containment closed under specialisation (§3.8), Tung’s Hecke-valued representation with determinant ψε (§3.2(c)); (CC3) Pan’s Theorem 3.5.5, Corollaries 3.5.10 and 3.5.12 (§4.11); (CC4) the CEGGPS patched module with projectivity (§5.1), Emerton–Paškūnas support and faithfulness (§5.3), Tung’s full support at odd p (§5.4) and at `p = 2` with Lemma 5.3.2’s equivalences and Theorem 8.0.1 (§5.6), Pan’s Theorem 4.1.7 with §§4.2–4.8 (§5.7) and §8 with its residual-modularity hypothesis (§5.8); the globalisation audit (§6.5). Branches of GL2ModularityLifting §§8.7–10.6 (conditional on CC1–CC5): odd-prime residually modular de Rham lifting (Kisin/Emerton, then Paškūnas `p ≥ 5` with `End ρ̄_p = k`, Hu–Tan for split non-scalar `ρ̄_p`, Tung for all odd p including `p =` 3) uses CC4–CC5 with the purely local Paškūnas/Hu–Tan statements as separate hypotheses of that consumer; the Tung cycle statements proved here are consumed directly from Layer 5; the dyadic branch (Kisin’s 2-adic BT, Paškūnas 2016, Tung `p =` 2) uses CC1, CC4, CC5; Pan’s `p ≥ 5` residually reducible branch uses CC2–CC4; Pan’s residually irreducible branch uses CC3–CC5. Other consumers: Kato-type zeta elements (§2.6, Lemma 2.10 form); Pan’s locally analytic vectors (§1.1 with §1.3; §3.1, §3.2, §3.5; §4.5 and §3.6 for the dense classical vectors with semisimple Hecke action; §6.1 for Emerton’s Theorem 1.2.3).

Every export keeps the hypotheses of its source theorem; no unqualified ‘p-adic local–global compatibility theorem’ is exported. The purely local Paškūnas/Hu–Tan statements are separate hypotheses of downstream applications; they are not inputs to the support theorems here. Tung’s Breuil–Mézard identities obtained by global patching are exported directly from Layer 5, and this comparison uses the local inputs of Layer 0. The global proof of the locally algebraic formula requires the specified weight-occurrence and normalisation comparisons.

A proof proceeds as follows.

1. Compose each comparison with the maps needed by GL2ModularityLifting §8.7, §§9.1–9.3, §12.4, Kato-type zeta elements and Pan’s locally analytic vectors, preserving the displayed prime, coefficient, determinant and residual hypotheses.
2. Check that no exported statement drops a hypothesis of its source (p `= 3` exclusions, residual modularity, local irreducibility, `End ρ̄_p = k`).

**Checks.**

- For GL2ModularityLifting’s inputs CC1–CC5, the comparisons below specify precisely which hypotheses must be checked.
- The zeta-element comparison uses §2.6(b) after inverting p; no integral isomorphism is required.

*Needs:* §2.8; §3.8; §4.11; §5.1; §5.3; §5.4; §5.6; §5.7; §5.8; §6.5; §2.6; §4.5; §6.3.

EM11, §1.2, pp. 3–6: The hypothesis tables of Emerton’s main results, which the export table preserves.

TUNG-P3, Theorem 1.2 and Theorem 4.7, pp. 4, 16: The odd-prime Breuil–Mézard and automorphy statements and their hypotheses.

TUNG-2, Theorem 8.0.1, Corollary 8.0.2, Theorem 8.0.3, p. 38: The dyadic statements and their hypotheses.

PAN, Theorems 1.0.2, 4.1.7, 8.0.1, pp. 3, 39, 124: Pan’s residually reducible and irreducible statements and their hypotheses.


### Examples

Starting with a residual representation known to be modular, the Banach embedding and classicality implications can be used with independently proved promodularity. Replacing modularity by oddness over `ℚ` uses Serre’s theorem. Pan’s residually reducible nice-prime statement does not require a residual-modularity hypothesis, whereas Pan’s residually irreducible automorphy theorem keeps it. These distinctions persist when all the local rings and types are otherwise identical.

### Dependencies

Layers 1–5 supply the comparison and support statements. The exact deformation-density contract is Böckle’s Corollary 3.8 with the Diamond–Flach–Guo extension, as used by Nakamura Theorem 2.1 and Emerton §7.3. GL2AutomorphicRepresentationsAndTransfer R17.5 supplies prescribed local CM induction and its Hecke-character existence theorem. The full auxiliary CM weight-occurrence input and `globalAlgebraicNormalization` are required for §6.3’s displayed twist. Local nonvanishing, Jacquet modules and types come from §§0.1–0.3. The globalisations listed in §6.5 retain their residual automorphy and independence hypotheses; downstream lifting theorems are consumers, not prerequisites.

## Worked examples

For the unique weight-two newform of level 11, the elliptic curve `y²+y=x³−x²−10x−20` has five points over `F₅`, so `a₅=5+1−5=1`. At `p=5` the spherical polynomial is `X²−X+5`. Its roots have valuations 0 and 1, so the form is ordinary. The locally algebraic factor in §2.5 is `V_f⊗π_p(V_f)`, with no symmetric power because `k−2=0`. This checks the finite-level, completed and locally algebraic Hecke normalisations. It makes no assertion of residual irreducibility at 5; the curve has rational 5-torsion, so this is not an example for an irreducible-residual Banach theorem.

For a weight-k point with nebentypus χ, the determinant at geometric Frobenius is `χ(ℓ)ℓ^{k−1}`; in weight two it is χ(ℓ)ℓ. At `ℓ=2` for the level-11 form, `a₂=−2` and `χ=1`, giving `X²+2X+2`. The reciprocal arithmetic-Frobenius action on the same representation has polynomial `X²+X+1/2`; the dual representation restores `X²+2X+2` at arithmetic Frobenius. This distinguishes changing Frobenius from dualising the Galois representation.

For `Σ₀` empty, the tensor product of co-Whittaker families is T, while its coadmissible smooth O-dual is `T′=Hom_O^cont(T,O)`, not T unless a specified perfect duality identifies them. The nonzero-map, injective-map and isomorphism branches in §4.5 retain their separate residual assumptions even in this case.

For Pan’s and Tung’s determinants at one place, `ψε⁻¹` and `ψ_Tε` can only agree as fixed determinants if `ψ_T=ψε⁻²` under a specified reciprocity identification. This equality of determinant characters does not by itself identify the representations or their `T_v` operators. Likewise the algebraic characters `det^b` and `det^(b+1)` differ on `diag(u,1)` by u: for `u=2` in `ℚ_pˣ` the ratio is 2, also when `p=2`. The normalisation bridge of §6.3 must account for that factor.

## Downstream consumers

GL2ModularityLifting uses the typed finite-level comparison of §2.8, the Hecke and pseudo-deformation maps of Layer 3, Pan’s block comparison in §4.11, and the odd-prime, dyadic and nice-prime support statements of Layer 5. Its proof must check each result’s prime, determinant, residual modularity and local irreducibility hypotheses and the globalisation dependence of §6.5. Kato-type zeta elements use the rational coefficient comparison of §2.6, with the indicated extra Tate twist; they need no integral isomorphism. Pan’s locally analytic vectors use the actual completed modular tower of Layer 1, the Hecke determinant and Galois factorisation of Layer 3, the crystalline density statement and the applicable branches of Layer 4; its use of §6.1’s promodularity theorem retains dependence on Serre’s theorem. The arithmetic applications of Scholze’s functor use §4.12.

## References

- D. Helm, *Whittaker models and the integral Bernstein center for GLₙ*, arXiv:1210.1789, §§3, 6–7. [Source](https://arxiv.org/abs/1210.1789).
- D. Helm, *The Bernstein center of the category of smooth W(k)[GLₙ(F)]-modules*, arXiv:1201.1874, §§3, 10–12. [Source](https://arxiv.org/abs/1201.1874).
- D. Helm and G. Moss, *Converse theorems and the local Langlands correspondence in families*, arXiv:1610.03277, Theorem 7.5 and Corollary 7.7. [Source](https://arxiv.org/abs/1610.03277).
- G. Chenevier, *The p-adic analytic space of pseudocharacters of a profinite group and pseudorepresentations over arbitrary rings*, arXiv:0809.0415, §§1–3. [Source](https://arxiv.org/abs/0809.0415).
- P. Colmez, G. Dospinescu and V. Paškūnas, *The p-adic local Langlands correspondence for GL₂(ℚ_p)*, Theorem 1.1 and §3.3.4, Theorem 3.23(a), pp. 24–26 (arXiv). [Source](https://arxiv.org/abs/1310.2235).
- P. Colmez, *Représentations de GL₂(ℚ_p) et (φ,Γ)-modules*, Astérisque 330 (2010), 281–509, Théorème 0.17 and Remarque 0.18. [Author version](https://webusers.imj-prg.fr/~pierre.colmez/kirilov.pdf).
- K. A. Ribet, *Irreducible Galois representations arising from component groups of Jacobians*, in *Elliptic curves, modular forms, and Fermat’s last theorem* (1995), 131–147, Corollary p. 140.
- K. A. Ribet, *On modular representations of Gal(ℚ̄/ℚ) arising from modular forms*, Invent. Math. 100 (1990), 431–476, Proposition 3.8.
- L. Berger and C. Breuil, *Sur quelques représentations potentiellement cristallines de GL₂(ℚ_p)*, Astérisque 330 (2010), 155–211; arXiv:math/0601545v1, Définition 4.2.4, Théorème 4.3.1, p. 38, Corollaires 5.3.1–5.3.3, p. 52. [Specified version](https://arxiv.org/abs/math/0601545v1).
- V. Paškūnas, *The image of Colmez’s Montreal functor*, Publ. Math. IHÉS 118 (2013), 1–191; arXiv:1005.2008v3, Theorem 1.10, p. 6, Proposition 4.17, p. 38, Corollary B.5, p. 153. [Specified version](https://arxiv.org/abs/1005.2008v3).
- V. Paškūnas, *On some consequences of a theorem of J. Ludwig*, J. Inst. Math. Jussieu 21 (2022), 1067–1106; arXiv:1804.07567v3, Lemma 6.2, p. 28. [Specified version](https://arxiv.org/abs/1804.07567v3).
- B. Edixhoven, *The weight in Serre’s conjectures on modular forms*, Invent. Math. 109 (1992), 563–594 — Theorems 2.5 and 2.6, author DVI pp. 5–6, and §6, pp. 16–22. [Author version](https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.dvi).
- B. H. Gross, *A tameness criterion for Galois representations associated to modular forms (mod p)*, Duke Math. J. 61 (1990), 445–517.
- D. Le, B. V. Le Hung, B. Levin and S. Morra, *Serre weights and Breuil’s lattice conjecture in dimension three*, Forum Math. Pi 8 (2020), e5 — cited as LLHLM, §5.3, pp. 121–123. [Author version](https://math.rice.edu/~bl70/LLHLMlattices.pdf).
- C. Skinner and A. Wiles, *Residually reducible representations and modular forms*, Publ. Math. IHÉS 89 (1999), 5–126, Proposition 3.18.
- C. Breuil, *Correspondance de Langlands p-adique, compatibilité local-global et applications*, Séminaire Bourbaki exposé 1031, Astérisque 348 (2012), 119–147, proof of Théorème 5.1.
- T. Gee and J. Newton, *Patching and the completed homology of locally symmetric spaces*, J. Inst. Math. Jussieu 21 (2022), 395–458; arXiv:1609.06965, Lemma 2.1.14. [Specified version](https://arxiv.org/abs/1609.06965).
- Y. Hu and F. Tan, *The Breuil–Mézard conjecture for non-scalar split residual representations*, Ann. Sci. Éc. Norm. Supér. (4) 48 (2015), 1383–1421, Theorem 6.3.
- M. Kisin, *The Fontaine–Mazur conjecture for GL₂*, J. Amer. Math. Soc. 22 (2009), 641–690, Theorem 2.2.18.
- M. Emerton, *Ordinary parts of admissible representations of p-adic reductive groups I. Definition and first properties*, Astérisque 331 (2010), 355–402; revised author version of 19 January 2010, Theorem 4.4.6, p. 36. [Specified version](https://math.uchicago.edu/~emerton/pdffiles/ord-one.pdf).
- M. Emerton and D. Helm, *The local Langlands correspondence for GLₙ in families*, Ann. Sci. Éc. Norm. Supér. (4) 47 (2014), 655–722, Theorem 6.2.1.
- G. Böckle, *Deformation rings for some mod 3 Galois representations of the absolute Galois group of ℚ₃*, Astérisque 330 (2010), 529–542, Theorems 4.2 and 5.2.

- M. Emerton, *Local-global compatibility in the p-adic Langlands programme for GL₂/ℚ*, unpublished manuscript, draft of 23 March 2011 (author's page, lg.pdf) — cited as EM11; the backbone of Layers 1–4 and 6. [Specified version](https://math.uchicago.edu/~emerton/pdffiles/lg.pdf).
- M. Emerton, *A local-global compatibility conjecture in the p-adic Langlands programme for GL₂/ℚ*, Pure Appl. Math. Q. 2 (2006); author draft of 19 August 2009 — cited as EM-PAMQ, §7.2–7.4. [Specified version](https://math.uchicago.edu/~emerton/pdffiles/coates.pdf).
- M. Emerton, *On the interpolation of systems of eigenvalues attached to automorphic Hecke eigenforms*, Invent. Math. 164 (2006); author draft — cited as EM06, §§2.1–2.2 and 4.3. [Specified version](https://math.uchicago.edu/~emerton/pdffiles/interpolate.pdf).
- F. Calegari and M. Emerton, *Completed cohomology — a survey* (2012), §1.1. [Specified version](https://math.uchicago.edu/~emerton/pdffiles/survey.pdf).
- K. Nakamura, *Zeta morphisms for rank two universal deformations*, Invent. Math. 234 (2023); arXiv:2006.13647v2, §2. [Specified version](https://arxiv.org/abs/2006.13647v2).
- G. Dospinescu and A.-C. Le Bras, *Revêtements du demi-plan de Drinfeld et correspondance de Langlands p-adique*, Ann. of Math. 186 (2017); arXiv:1509.00606v2, §§4.1, 5.1, 13. [Specified version](https://arxiv.org/abs/1509.00606v2).
- P. Colmez, G. Dospinescu and W. Nizioł, *Factorisation de la cohomologie étale p-adique de la tour de Drinfeld*, Forum Math. Pi 11 (2023); arXiv:2204.11214v2, §4.1. [Specified version](https://arxiv.org/abs/2204.11214v2).
- Y. Ding, *p-adic Hodge parameters in the crystabelline representations of GLₙ*, Publ. Math. IHÉS 142 (2025); arXiv:2407.21237v2, §4.1. [Specified version](https://arxiv.org/abs/2407.21237v2).
- A. Caraiani, M. Emerton, T. Gee, D. Geraghty, V. Paškūnas and S. W. Shin, *Patching and the p-adic local Langlands correspondence*, Camb. J. Math. 4 (2016); arXiv:1310.0831v5, §§2, 4. [Specified version](https://arxiv.org/abs/1310.0831v5).
- C. Breuil, E. Hellmann and B. Schraen, *Une interprétation modulaire de la variété trianguline*, Math. Ann. 367 (2017), 1587–1645 — cited as BHS, §§2–3, especially Theorems 3.19 and 3.21. [Author version](https://math.univ-lyon1.fr/homes-www/schraen/BHS1final.pdf).
- M. Emerton and V. Paškūnas, *On the density of supercuspidal points of fixed regular weight in local deformation rings and global Hecke algebras*, J. Éc. polytech. Math. 7 (2020); arXiv:1809.06598v3, §6. [Specified version](https://arxiv.org/abs/1809.06598v3).
- L. Pan, *On locally analytic vectors of the completed cohomology of modular curves*, Forum Math. Pi 10 (2022), e7 — cited as PAN-I, §6.1.1, pp. 67–68. [Specified version](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/923CD328775CD10902CA75F9D265D1B8/S2050508622000014a.pdf/on_locally_analytic_vectors_of_the_completed_cohomology_of_modular_curves.pdf).
- L. Pan, *On locally analytic vectors of the completed cohomology of modular curves II*, arXiv:2209.06366v1 — cited as PAN-II, §7.1.4, pp. 116–117. [Specified version](https://arxiv.org/abs/2209.06366v1).
- L. Pan, *The Fontaine–Mazur conjecture in the residually reducible case*, J. Amer. Math. Soc. 35 (2022); arXiv:1901.07166v2, §§3–4, 8. [Specified version](https://arxiv.org/abs/1901.07166v2).
- S.-N. Tung, *On the automorphy of 2-dimensional potentially semi-stable deformation rings of `G_{ℚ_p}`*, Algebra Number Theory 15 (2021); arXiv:1803.07451v4. [Specified version](https://arxiv.org/abs/1803.07451v4).
- S.-N. Tung, *On the modularity of 2-adic potentially semi-stable deformation rings*, Math. Z. 298 (2021); arXiv:1908.06174v3. [Specified version](https://arxiv.org/abs/1908.06174v3).
- P. Scholze, *On the p-adic cohomology of the Lubin–Tate tower* — cited as SCH, §§3–4, pp. 10–20, and proof of Proposition 7.7, p. 29. [Author version](https://people.mpim-bonn.mpg.de/scholze/pAdicCohomLT.pdf).
- F. Diamond, M. Flach and L. Guo, *The Tamagawa number conjecture of adjoint motives of modular forms*, Ann. Sci. Éc. Norm. Supér. 37 (2004), 663–727 — cited as DFG, Corollary 2.3, p. 698, and Theorem 3.6, p. 723. [Published version](https://www.numdam.org/article/ASENS_2004_4_37_5_663_0.pdf).
- C. Khare and J.-P. Wintenberger, *Serre’s modularity conjecture (II)*, author version — cited as KW II, Lemma 3.5, p. 22, and Theorem 6.1 with its construction, pp. 53–56. [Specified version](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf).
- M. Emerton and T. Gee, *A geometric perspective on the Breuil–Mézard conjecture*, Appendix A, Proposition A.2 and Corollary A.7, pp. 32–35. [Author version](https://www.math.uchicago.edu/~emerton/pdffiles/refinedbm.pdf).
- G. Böckle, *On the density of modular points in universal deformation spaces*, author revision of 13 March 2001 — cited as BOE, Assumption 2.1, p. 3, Corollary 3.5, p. 9, Corollary 3.8 and Theorem 3.9, p. 10. [Specified version](https://web.iwr.uni-heidelberg.de/fileadmin/groups/arithgeo/templates/data/Gebhard_Boeckle/DensityAJMCorr.pdf).
- F. Calegari, *Even Galois representations and the Fontaine–Mazur conjecture II*, arXiv:1012.4819v2, Proposition 3.2, pp. 5–6. [Specified version](https://arxiv.org/abs/1012.4819v2).
- A. Snowden, *On two dimensional weight two odd representations of totally real fields*, arXiv:0905.4266v1, Propositions 8.2.1–8.2.2, p. 26. [Specified version](https://arxiv.org/abs/0905.4266v1).
- V. Paškūnas, *On 2-dimensional 2-adic Galois representations of local and global fields*, arXiv:1509.00332v2, Lemma 3.29, p. 43. [Specified version](https://arxiv.org/abs/1509.00332v2).
- T. Barnet-Lamb, T. Gee and D. Geraghty, *Serre weights for rank two unitary groups*, Appendix A, Theorem A.4.1, pp. 36–37. [Author version](https://www.ma.imperial.ac.uk/~tsg/Index_files/U2.pdf).
- J.-P. Serre, *Sur les représentations modulaires de degré 2 de Gal(ℚ̄/ℚ)*, Duke Math. J. 54 (1987), §3.4. [Specified version](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf).


Page numbers refer to the versions specified here. All theorem formulations above use these normalisations, with comparison targets explicitly stated where the source drafts use differing conventions.
