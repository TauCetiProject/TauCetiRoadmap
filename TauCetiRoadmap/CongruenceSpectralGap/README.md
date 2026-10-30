# Roadmap: the congruence spectral gap — automorphic spectral theory and trace distributions, Part II

**Summary.** Build the curvature −1 hyperbolic quotient energy and its positive spectral bottom for every congruence subgroup of SL₂(ℤ), then prove λ′₁≥21/100. The analytic endpoint is the Luo–Rudnick–Sarnak bound |Re μⱼ|≤1/2−1/(m²+1) for unitary cuspidal GLₘ over ℚ with O(m)-spherical real component. Its proof uses the complete even prime-twist first moment, including all ramified self-pair coefficients, an exact Gauss-power identity and the general hyper-Kloosterman estimate. The exceptional GL₂ dictionary and the spherical cuspidal adjoint GL₃ lift turn that bound into 21/100; the mean-zero Rayleigh inequality and constant metric rescaling are the geometric exports (lrs95, Theorems 1.1–1.2, pp.387–390, Proposition 3.1, pp.395–399).

## Scope and ownership

This is Part II of TauCetiRoadmap.AutomorphicSpectralTheory for the congruence gap. The separate AutomorphicSpectralTheoryPartII develops Schwartz multipliers and consumes the congruence gap from this part. The base roadmap supplies automorphic spectral decomposition, trace distributions and its modular spectral realizations (§§0.6–0.7, 1.16a and 4.3–4.8), and owns the finite-place parameter estimate of §7.1a; this part proves the spherical real-place parameter and congruence gap estimates by prime twisting over ℚ. AdelicAlgebraicGroups §5.2 owns the principal-level component sets, their actual rational stabilizers and level maps. This part owns the arbitrary-congruence quotient-measure adapter, complex mean-zero restriction, identification of the positive Rayleigh bottom with the clipped small spectrum, exceptional archimedean and adjoint specialization, Mellin cutoffs, finite-character averages and the LRS contradiction. The Laplacian target below extends the base's Γ₀(N) realization to arbitrary principal levels and intermediate subgroups, and proves agreement on Γ₀(N).

The following objects are supplied once and consumed by section.

- The congruence predicate and finite-index implication, orbit quotient, fundamental-domain measure independence, complex L², partial linear maps, Mellin transforms, gamma factor and finite characters are already in the library; their exact declarations are in the supplier contracts. No replacement carriers or independent orthogonality theorem for all characters are built here.
- TauCetiRoadmap.FuchsianOrbifolds Layers 0–3, Layer 4, item 5, and Layer 6, item 1, owns the effective projective action, elliptic quotient charts, covolume and cusp coordinates. The upstairs volume comparison is already in the library as `UpperHalfPlane.riemannianVolume_eq_volume`.
- TauCetiRoadmap.DifferentialGeometry Layer 12 owns gradients, volume density and Green identities. TauCetiRoadmap.PDE Lane A, items 1 and 6, owns weak derivatives, Sobolev spaces and local Rellich compactness, and its Lane E owns local elliptic regularity. Their supplied local objects are used to prove quotient density and closability.
- TauCetiRoadmap.OperatorTheory/SelfAdjointSpectralTheory SA-C and SA-E01–SA-E13 owns partial-operator adjoints, the unbounded spectral measure and its form bounds from spectral support; TauCetiRoadmap.UnboundedOperators UO-A01–UO-A03 owns the unbounded spectral integral and its functional calculus. TauCetiRoadmap.UnboundedOperators UO-D06 owns closed-form representation and Friedrichs extension; §§0.6–0.7 of TauCetiRoadmap.AutomorphicSpectralTheory owns its automorphic transport. The abstract representation theorem is not a target of this part.
- TauCetiRoadmap.AutomorphicSpectralTheory §§1.16 and 1.16a owns the differential expression and Γ₀(N) operator; §§4.3–4.4, 4.8 and 4.14a owns spectral orthosums, residual spaces, number-field GLₙ residual blocks and modular Eisenstein expansions. The quotient Friedrichs operator at every congruence level is owned here (§0.2); the base supplies only the operator-independent adelic decomposition at principal level, which §0.6 transports to that operator instead of reconstructing generic spectral decomposition.
- TauCetiRoadmap.AutomorphicFormsOnReductiveGroups §§2.5–2.7, 3.1 and 3.4–3.5 owns local parameters, generic unitary classification, classical comparison and representation factorization; its §4.5 owns the Maass cusp forms of a congruence subgroup and their level-one adelic comparison. Cuspidal carriers and their discrete constituent decomposition are stated by TauCetiRoadmap.ArithmeticLocallySymmetricSpaces ALS.F.6. TauCetiRoadmap.GlobalNumberFields Layer 9 owns the unique real shift and unitary part of a Hecke character.
- TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors AL.1–AL.3 owns local and global factors, continuation, functional equations, genericity and the analytic local functional equations. Section 2.0 here proves ramified self-pair positivity and character transport on those canonical factors. TauCetiRoadmap.GL2AutomorphicRepresentationsAndTransfer §R17.4.13, adjoint-lift, owns the Gelbart–Jacquet lift, its local compatibility and self-twist branch, including the highly ramified converse and metaplectic proof inputs of R17.4. No second lift or converse is constructed.
- TauCetiRoadmap.LFunctions Layer 0 owns the analytic L-function data record and its Dirichlet-agreement, continuation, functional-equation and average-coefficient predicates. TauCetiRoadmap.ZerosOfLFunctions Layers 1 and 3 owns the complex Stirling asymptotics of gamma factors and Phragmén–Lindelöf convexity for continued uncompleted L-functions; the nonvanishing of Γ is already in the library. Neither is reproved here.
- TauCetiRoadmap.DeligneWeightsAndPurity §§7.12 and DWP.10 supplies the finite-field trace and weight theory. This part owns the global additive-character sheaf and the raw coefficient-generic all-rank hyper-Kloosterman sum and its numerical Deligne bound (§§4.2a–4.2b), together with its Kloosterman sheaf realization and the Swan-constancy criterion needed for convolution. It is the single owner of the rational-adic curve Euler–Poincaré formula with Swan conductors (§4.2b): finite ℓ-adic coefficient fields and their extension, proper and affine curves, every characteristic and every perfect base, whose algebraically closed case is the geometric formula χ_c(U,L)=rank(L)χ_c(U)−ΣSw_x(L); later roadmaps import it from §4.2b. ArithmeticGaloisRepresentations §§3.1 and 3.7 owns the conductor and Artin–Schreier local calculations; InverseGaloisAndArithmeticFundamentalGroups, Euler characteristic of ℓ-torsion local systems on affine curves, owns the finite-coefficient formula on affine curves over an algebraically closed field of positive characteristic, which §4.2b extends. TauCetiRoadmap.EtaleCohomologyFoundations F.0–F.6 and F.10 supplies the constructible and adic direct-image, base-change, duality and trace carriers; LefschetzPencilsAndVanishingCycles §§0.5–0.8 supplies nearby and vanishing cycles and their inertia-equivariant specialization sequence. Rigid realizations, differential equations and moment motives belong to downstream roadmaps.
- The full Wiener–Ikehara theorem and qualitative prime-ideal theorem are already in the library. TauCetiRoadmap.ArithmeticDirichletSeries Layer 6 supplies Abel summation; TauCetiRoadmap.AnalyticNumberTheoryPartI §3.26 supplies the uniform divisor subpower estimate. Prime counting and divisor bounds are not reproved.

AutomorphicSpectralTheory §1.16 owns the classical two-variable Kloosterman sum over positive integer moduli; §§4.2a–4.2b here own its all-rank, all-finite-field product-fibre generalization and the ℓ-adic convolution construction. The coefficient-generic scalar sum and numerical estimate belong here; rigid realizations and explicit connections belong to the downstream rigid-cohomology roadmaps named under Downstream consumers. Section 4.2a supplies the comparison with the presentation that eliminates the last variable, without using a rigid realization as an input.

The finite-place Luo–Rudnick–Sarnak bound over number fields belongs to TauCetiRoadmap.AutomorphicSpectralTheory §7.1a. This part constructs the even prime-twist moment over ℚ in Layers 2–4 for its real-place endpoint; it consumes no moment construction from §7.1a. The arithmetic applications to progression Kloosterman sums, prime geodesics and higher symmetric-power improvements do not enter this part. Independent conformal-area and modular area/index results belong to consumers.

## Conventions

Fix Γ≤SL₂(ℤ) with `CongruenceSubgroup.IsCongruenceSubgroup Γ`, meaning Γ(N)≤Γ for some natural N≠0. Work with its effective projective image on ℍ and the orbit quotient XΓ. The action kernel is Γ∩{±I}; it is removed before applying a fundamental-domain theorem. In particular Γ(1) and Γ(2) have areas π/3 and 2π. Level N=0 is excluded, and finite index alone is not the congruence hypothesis (Mathlib `CongruenceSubgroup.IsCongruenceSubgroup`; FuchsianOrbifolds Layers 0–3, Layer 4, item 5, and Layer 6, item 1).

The metric is ds²=(dx²+dy²)/y², curvature −1, dA=dxdy/y² and the positive differential expression is Δ=−y²(∂ₓ²+∂ᵧ²). It is the negative of the div-grad Laplacian. Thus Δ1=0 and Δy²=−2y²; the latter is a local expression test, not a claim that y² is a quotient L² vector. At a cusp Δyˢ=s(1−s)yˢ, so s=1/2+it gives 1/4+t². Smoothness at an elliptic point means a smooth invariant lift in its finite quotient chart. Cusps remain complete finite-area ends, with no imposed boundary trace condition (FuchsianOrbifolds Layers 1 and 3; DifferentialGeometry Layer 12; AutomorphicSpectralTheory §1.16a).

Use the native complex L² carrier with almost-everywhere equality and inner product conjugate-linear in the first slot. The closed form is q(u,v)=∫⟨∇u,∇v⟩dμΓ, with real diagonal q[u]=Re q(u,u)=∫(|∂ₓu|²+|∂ᵧu|²)dxdy; inequalities involving q(u,u) mean this real value. In particular q(iu,iu)=q(u,u). Remove the whole complex constant line by the complex integral, so neither 1 nor i is mean zero. The integral bound is |∫u|≤μΓ(XΓ)^(1/2)‖u‖₂. Operators are partial complex-linear maps with their actual domains; a generic partial map does not assert density, closedness or self-adjointness. All geometric spaces are separable complex Hilbert spaces on the second-countable finite-area quotient; finite character sets are small finite types, with no universe enlargement implicit in an average (Mathlib `MeasureTheory.Lp`; teschl, §2.3, pp.70–72 and §4.3, p.119, teschl line 2960 and line 5044).

For the analytic layers π is unitary cuspidal on GLₘ(𝔸ℚ), m≥2, π∞ is O(m)-spherical and L∞(s,π)=∏ⱼΓℝ(s−μⱼ). Put d=m², β₀=2 maxⱼ Re μⱼ∈[0,1), A(s)=∏ⱼ,ₖΓℝ(s−μⱼ−conj μₖ), and G(s)=A(1−s)/A(s) as a meromorphic ratio. Genericity is proved from global Whittaker factorization before generic unitary classification is used. The exceptional GL₂ component initially has only SO(2)-weight zero and may have either common sign parity; its adjoint is O(3)-spherical. For r=1/5 its parameter multiset is {2/5,0,−2/5}, and λ=1/4−r²=21/100 (lrs95, §1 pp.389–390; AutomorphicFormsOnReductiveGroups §2.6; GL2AutomorphicRepresentationsAndTransfer R17.4.13).

The standard conductor fπ and self-pair conductor f are positive integers. Keep them distinct. Since an unramified πq has unramified self-pair, q∤fπ implies q∤f. Thus f, q and fq^d are nonzero in every analytic denominator. A prime twist has q>2, q∤fπ and χ nonprincipal even modulo q, extended by zero on nonunits. At q it is primitive. Set τ(χ)=Σₐχ(a)exp(2πia/q), with the positive exponential. Write εself(s)=τπ f⁻ˢ; then |τπ|=f^(1/2), and τπ f^(−1/2) is the unit root number. Positive real bases use the real logarithm in complex powers. Series start at n=1; no expression uses 0 to a negative or complex power. The Fourier sign witness is τ(1)=−1 for prime q, since Σₐexp(2πia/q)=0. For q=3, exp(2πi/3)=−1/2+i√3/2, fixing the sign even though even-character averages alone cannot distinguish the two exponential conventions (Mathlib `ZMod.stdAddChar`; lrs95, Lemma 2.1 and (3.18)–(3.20)).

Use φ for the smooth cutoff, reserving f for the conductor. Its support is a compact subset of (0,∞), and its normalization is ∫φ(y)dy/y=1, equivalently mellin(φ,0)=1. The inverse Mellin real-line convention has prefactor 1/(2π), since ds=i dt. Under y↦1/y the Mellin parameter changes from s to −s; support [1,2] changes to [1/2,1]. Gamma poles are statements about meromorphic orders, never about a totalized value: Γℝ(0)=0 in Lean but the punctured limit sΓℝ(s)=2 (Mathlib `mellin`, `mellinInv`, `mellin_comp_inv`, `Complex.Gammaℝ_eq_zero_iff` and `Complex.Gammaℝ_residue_zero`; lrs95, (3.6)–(3.7)).

## Exact supplier contracts

### From Mathlib

Consume the following pinned declarations and their stated hypotheses.

- `CongruenceSubgroup.IsCongruenceSubgroup` and `CongruenceSubgroup.IsCongruenceSubgroup.finiteIndex`, in `Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean`: the nonzero-level predicate and its finite-index theorem.
- `MulAction.orbitRel.Quotient`, in `Mathlib/GroupTheory/GroupAction/Defs.lean`, and `MulAction.toPermHom`, in `Mathlib/Algebra/Group/Action/End.lean`: the orbit carrier and effective permutation image. `UpperHalfPlane.volume_def`, in `Mathlib/Analysis/Complex/UpperHalfPlane/Measure.lean`: the density y⁻².
- `MeasureTheory.IsFundamentalDomain.quotientMeasure_eq`, in `Mathlib/MeasureTheory/Group/FundamentalDomain.lean`: equality of the pushforward restricted measures for two fundamental domains of a countable group acting measurably and preserving the measure. This theorem requires actual fundamental domains; it does not make a non-effective action free almost everywhere.
- `MeasureTheory.Lp`, in `Mathlib/MeasureTheory/Function/LpSpace/Basic.lean`, at p=2: the subgroup of almost-everywhere measurable classes with finite Lp norm. It contains neither an independently selected measure nor an operator. `LinearPMap`, in `Mathlib/LinearAlgebra/LinearPMap.lean`, contains a submodule domain and a linear map on it; density and adjoint properties are additional hypotheses.
- `mellin`, `mellinInv`, `mellin_comp_inv`, in `Mathlib/Analysis/MellinTransform.lean`, and `mellinInv_mellin_eq`, in `Mathlib/Analysis/MellinInversion.lean`: inversion at x>0 in a complete complex normed space requires Mellin convergence on the chosen line, vertical integrability of the transform, and continuity at x. The cutoff proof establishes each hypothesis.
- `Complex.Gammaℝ`, `Complex.Gammaℝ_eq_zero_iff`, `Complex.Gammaℝ_residue_zero`, in `Mathlib/Analysis/SpecialFunctions/Gamma/Deligne.lean`: the totalized real gamma factor and its punctured residue convention.
- `DirichletCharacter.sum_characters_eq`, in `Mathlib/NumberTheory/DirichletCharacter/Orthogonality.lean`: full character orthogonality over a nonzero modulus and an integral domain with enough roots of unity. Apply it over ℂ before projecting to even nonprincipal characters. `gaussSum`, in `Mathlib/NumberTheory/GaussSum.lean`, and `ZMod.stdAddChar`, `ZMod.isPrimitive_stdAddChar`, in `Mathlib/Analysis/SpecialFunctions/Complex/CircleAddChar.lean`, fix the raw finite sum and its positive standard additive character.
- `Complex.Gamma_ne_zero` and `Complex.differentiable_one_div_Gamma`, in `Mathlib/Analysis/SpecialFunctions/Gamma/Beta.lean`: Γ does not vanish off the nonpositive integers and 1/Γ is entire, so Γ has no meromorphic zeros.
- `InnerProductSpace.instLaplacian`, in `Mathlib/Analysis/InnerProductSpace/Laplacian.lean`: the Laplacian of a function on a finite-dimensional real inner product space, the trace of its second derivative; on ℂ with its real inner product the orthonormal basis 1, i makes it ∂ₓ²+∂ᵧ². `UpperHalfPlane.SLAction`, in `Mathlib/Analysis/Complex/UpperHalfPlane/MoebiusAction.lean`: the Möbius action of SL₂(ℤ) on ℍ.

### From Tau Ceti

`UpperHalfPlane.riemannianVolume_eq_volume`, in `TauCeti/Analysis/Complex/UpperHalfPlane/PoincareMetric.lean`, compares the actual Poincaré metric volume with the Mathlib measure. `IsSelfAdjoint.isFormalAdjoint` and `LinearPMap.IsFormalAdjoint.im_inner_self_apply`, in `TauCeti/Analysis/InnerProductSpace/LinearPMap/SelfAdjoint.lean`, require the indicated inner-product and completeness hypotheses and give the formal pairing and vanishing imaginary part, not construction of the quotient operator. `TauCeti.PDE.energyFormH1` and `TauCeti.PDE.energyFormH1L0` in `TauCeti/Analysis/PDE/EnergyForm/Sobolev.lean` provide local real Euclidean energies, which are complexified and descended chartwise here.

`TauCeti.LSeries.wienerIkehara`, in `TauCeti/NumberTheory/LSeries/WienerIkehara/SharpCutoff.lean`, requires nonnegative real coefficients, an actual Dirichlet-series sum F on Re s>1 and a continuous extension of F(s)−c/(s−1) to Re s≥1. Its conclusion is x⁻¹Σ₁≤ₙ≤ₓb(n)→c, with the inclusive cutoff. `TauCeti.primeCount_univ_isEquivalent_div_log`, in `TauCeti/NumberTheory/ArithmeticDirichletSeries/Prime/PrimeIdealTheorem.lean`, gives πK(x)∼x/log x for a number field K. At K=ℚ identify prime ideals with rational primes via the norm and apply Abel summation; this gives ΣQ<q≤2Q q∼(3/2)Q²/log Q.

### From TauCetiRoadmap.FuchsianOrbifolds

Layers 0–1 supply the faithful projective action, proper discontinuity, finite elliptic isotropy and quotient charts. Layer 2 supplies measurable domains and covolume independence. Layer 4, item 5, supplies the orbifold area formula, and Layer 6, item 1, supplies the level-one modular polygon and signature; together these give area π/3. Layer 3 supplies cusp coordinates, their actual widths, finitely many ends and compact truncated complements. Use the same orbit carrier before and after passing to the effective image. No coarse-coordinate smooth metric is assumed at elliptic points.

### From TauCetiRoadmap.DifferentialGeometry and TauCetiRoadmap.PDE

DifferentialGeometry Layer 12 supplies gradient, div-grad Laplacian, Riemannian volume and Green identities. PDE Lane A, items 1 and 6, weak derivatives, Sobolev spaces and local Rellich compactness, supplies the local testing and completion facts used in invariant charts. The compact-support real Dirichlet problem is a local input; the quotient's global form domain is obtained by cusp cutoff and chart descent.

### From TauCetiRoadmap.OperatorTheory/SelfAdjointSpectralTheory and TauCetiRoadmap.UnboundedOperators

SelfAdjointSpectralTheory SA-C supplies actual partial-operator domains and adjoints; SA-E01–SA-E13 supplies the unbounded spectral measure, spectral projections and reduced restrictions, and the form bounds from spectral support (SA-E11–SA-E13) behind the spectral Rayleigh comparison. UnboundedOperators UO-A01–UO-A03 supplies the unbounded spectral integral, its exact domains and its functional calculus. UnboundedOperators UO-D06 supplies the densely defined closed semibounded Hermitian form, its injective dense Hilbert-domain inclusion, the unique represented self-adjoint partial operator, square-root domain and form identity, and Friedrichs realization without a compactness hypothesis (teschl, Theorems 2.12–2.13, pp.70–72; teschl line 2914 and line 2960).

The prerequisites of UO-D06 are UnboundedOperators UO-A01–UO-A03, SelfAdjointSpectralTheory SA-E01 with its graph and resolvent interfaces, and VariationalMethods V2.3, the scalar-generic coercive and complexification prefix. The order at the level of targets is V2.3 and UO-A01–UO-A03 before UO-D06; VariationalMethods V5.1 consumes UO-D06 and is not an input here. Section 0.4 proves the quotient form-core comparison from the supplied square-root identity and spectral truncation.

### From TauCetiRoadmap.AutomorphicSpectralTheory

Sections 0.6–0.7 transport supplied self-adjoint calculus and its actual domains to the automorphic realization. Sections 1.16–1.16a supply the positive hyperbolic expression, Γ₀(N) Friedrichs operator, cusp Fourier modes and elliptic-chart regularity. Sections 4.3–4.4 supply the spectral orthosum and residual construction on L²([G]¹), §4.6 the transport of that decomposition under twisting by unitary global characters, §4.14a the number-field GLₙ residual blocks, and §4.8 the level-one modular expansion, noting one family per cusp at higher level. The quotient Friedrichs operator ΔΓ at every congruence level is built in §0.2 here; the contract below asks only for the operator-independent adelic decomposition at principal level, which §0.6 transports to ΔΓ. The displayed one-cusp formula is used only at level one.

Specialize the operator-independent adelic decomposition and residual classification at the chosen finite level. The quotient-measure isometry, Casimir closure and principal-level cusp compactness are targets of §§0.5a–0.5b here; no principal-level compactness assertion is imported from the Γ₀(N) statement.

### From TauCetiRoadmap.AutomorphicFormsOnReductiveGroups and TauCetiRoadmap.ArithmeticLocallySymmetricSpaces

AutomorphicFormsOnReductiveGroups §§2.5–2.7 supplies archimedean Weil parameters, the generic unitary classification, SO(2) and O(2) types and their smooth globalizations; §3.1 supplies classical component comparison, §§3.4–3.5 restricted tensor factorization. ArithmeticLocallySymmetricSpaces ALS.F.6 supplies actual cuspidal automorphic representations, rapid decay, the discrete unitary constituent decomposition and finite multiplicity. The latter theorem is required to extract a constituent from a classical eigenfunction; occurrence does not follow from the representation definition alone. AutomorphicFormsOnReductiveGroups §4.5 supplies `MaassCuspForm(Γ,λ)` for every finite-index congruence subgroup Γ of SL₂(ℤ): smooth Γ-invariant functions on ℍ, square-integrable for dxdy/y², with −y²(∂ₓ²+∂ᵧ²)φ=λφ and zero constant term at every cusp; and `maassClassicalEquiv`, which identifies `MaassCuspForm(SL₂(ℤ),λ)` with the right-PGL₂(ℤ̂)·SO(2)-invariant Laplace λ-eigenspace of the ALS.F.6 cusp space. §3.1's `classicalEquiv` restricts adelic automorphic forms at any compact open level J to the actual rational stabilizers of the components.

The principal-level L² completion and Casimir comparison are constructed in §0.5a from the smooth component comparison, rather than assumed as part of it.

### From TauCetiRoadmap.AdelicAlgebraicGroups

Section 2.2, quotient-measure and Weil integration, supplies homogeneous quotient integration with its Haar normalizations. Section 5.2, Principal congruence level, GL₂ components for O(2) and SO(2), and Riemann-surface structure and change of level for GL₂ quotients, supplies the component homeomorphism, index set (ℤ/N)ˣ, rational stabilizers Γ(N), positive-determinant convention and right translation [x,a]↦[x,ah] as a map X_U→X_(h⁻¹Uh) between levels, for h∈GL₂(𝔸_f). Section 0.5a uses it at a fixed level only for h∈GL₂(ℤ̂), which normalizes K(N), and constructs the additional measure comparison, L² completion and Casimir identification on that supplied geometry.

### From TauCetiRoadmap.SmoothRepresentationsOfLocalGroups

SmoothRepresentationsOfLocalGroups SR.2–SR.3 and SR.5.2, Segments and their two representations, supply normalized induction, tempered support and generalized Steinberg blocks for §2.0; AutomorphicSpectralTheory §7.0b supplies its finite-place unitary-classification prefix, independently of its §7.1a parameter bound.

### From TauCetiRoadmap.GlobalNumberFields

Layer 9, Hecke and ray class characters, supplies `HeckeCharacter.shift` and `HeckeCharacter.unitaryPart`, including uniqueness of the real norm exponent. Layer 10 supplies real and complex character types. For a quadratic extension K/ℚ the norm of a scalar ℚ-idele in K is its ℚ-norm squared; therefore a norm shift σ in an inducing character gives absolute central exponent 2σ. Unitary central character forces σ=0. A purely imaginary exponent belongs to the unitary part.

### From TauCetiRoadmap.GL2AutomorphicRepresentationsAndTransfer

R17.4.13, adjoint-lift, supplies Ad(π)=Sym²(π)⊗ωπ⁻¹, self-duality, trivial central character, its local adjoint parameter, and cuspidality precisely in the absence of a nontrivial character self-twist. Its self-twist branch supplies quadratic automorphic induction and the isobaric decomposition. Import all R17.4 proof prerequisites along with the theorem (gj78, Definition 3.1.3 and Proposition 3.2, pp.485–486, §3.7, p.491, Theorem 9.3 and Remark 9.9, pp.534–541; gj78 line 528, line 538 and line 721).

### From TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors

Use AL.3, Global Whittaker factorization, for local genericity. The named AL.3 sections Rankin–Selberg local L-factor, Nonarchimedean factors under normalized induction, Continuation and the Rankin–Selberg pole criterion, The global Rankin–Selberg functional equation, and Rankin–Selberg nonvanishing on the boundary supply the local product, global continuation, poles, equation and regular boundary factors. AL.1, Canonical archimedean factors, supplies the gamma parameters and normalization. AL.3, Hecke, eigensystem and Rankin–Selberg data, supplies `rsDatum` and `IsNicePinned`: outside the norm-twist pole case, the entire completed pair function, bounded on finite vertical strips, with its functional equation, specified root number and conductor; AL.3, L-function data and derived products, supplies the underlying `LDatum` record, which carries no analytic assertion. These completed bounds are kept distinct from the polynomial strip bounds of the finite function, which come from ZerosOfLFunctions Layer 3.

Section 2.0 constructs the all-prime positivity and analytic local-character adapters from these factors. Section 2.1 constructs the twisted finite-function analytic-data adapter from `rsDatum`, the supplied completed strip bounds and the local calculations; it does not require an extra supplier target.

### From TauCetiRoadmap.LFunctions

Layer 0 supplies `LFunctions.AnalyticLFunctionData` and its predicates `AnalyticLFunctionData.HasDirichletAgreement`, `AnalyticLFunctionData.HasMeromorphicContinuation`, `AnalyticLFunctionData.HasFunctionalEquation` and `AnalyticLFunctionData.HasAverageCoefficientBound`. The record fixes the coefficients, positive integral conductor, gamma shifts, unit root number, completion and polar divisor; the predicates supply the analytic hypotheses consumed by ZerosOfLFunctions.

### From TauCetiRoadmap.ZerosOfLFunctions

Layer 1, items 2–5, supplies the normalized holomorphic log Γ on sectors with its Stirling asymptotic, the vertical-strip asymptotic of log‖Γ(σ+it)‖ uniformly for σ in a compact interval, and, for a gamma factor ∏Γℝ(s+μⱼ)∏Γℂ(s+νₖ) of degree d, the asymptotic log‖γ(σ+it)‖=−(πd/4)|t|+A(σ)log|t|+O(1) as |t|→∞, together with the absence of zeros and the exact poles and pole orders. Applied to A(s) and to A(1−s), whose shifts are −μⱼ−conj μₖ, the two exponential terms cancel, so G(s)=A(1−s)/A(s) grows at most polynomially in |t| on each closed vertical strip outside fixed neighbourhoods of its finitely many poles there. Layer 3, items 1–3, supplies Phragmén–Lindelöf for the pole-cleared continued uncompleted function `continuedL` of an `LFunctions.AnalyticLFunctionData` record with finite-order completion, functional equation against its dual record and average coefficient bound: a bound polynomial in the analytic conductor on every closed strip −δ≤Re s≤1+δ. Bounding the completed function and dividing by its gamma factor does not give this.

### From TauCetiRoadmap.DeligneWeightsAndPurity and TauCetiRoadmap.EtaleCohomologyFoundations

DeligneWeightsAndPurity §§7.12 and DWP.10 supply compact-support weight/trace estimates and their finite-field applications. EtaleCohomologyFoundations F.0–F.6 and F.10.1–F.10.2b supply constructible rational ℓ-adic sheaves, derived compact direct image, base change, the Künneth and trace comparisons and geometric Frobenius. For coefficients use ℓ≠p and a finite extension E of ℚ containing the additive character values, with an ℓ-adic place λ and a specified complex embedding; the trace and weight comparisons retain those embeddings.

Section 4.2b constructs the global rank-one additive-character sheaf by character descent, including its extension-field trace and addition comparisons; weight estimates alone are not a construction of that object.

### From TauCetiRoadmap.ArithmeticGaloisRepresentations, TauCetiRoadmap.InverseGaloisAndArithmeticFundamentalGroups and TauCetiRoadmap.SchemeAndStackFoundations

ArithmeticGaloisRepresentations §3.1, Finite wild image, breaks and the Swan conductor, supplies the break decomposition over completed curve fields, Swan additivity and invariance under coefficient extension. Its §3.7, Artin–Schreier characters, supplies the local character of αᵖ−α=t⁻ᵃ, p∤a: break a and Swan a. InverseGaloisAndArithmeticFundamentalGroups, Euler characteristic of ℓ-torsion local systems on affine curves, supplies the 𝔽_ℓ-coefficient curve formula for affine curves over an algebraically closed field of positive characteristic, and its §IG.0.T1, `VanishingCycles.curveEndomorphismTrace`, supplies the trace formula for endomorphisms of smooth proper geometrically connected curves with isolated fixed points. Section 4.2b extends the formula to rational-adic coefficients, proper curves, characteristic zero and perfect bases, using the Riemann–Hurwitz formula `scheme_riemann_hurwitz` of SchemeAndStackFoundations §3.2, and establishes the family criterion before constructing convolution.

### From TauCetiRoadmap.LefschetzPencilsAndVanishingCycles

Sections 0.5–0.8 supply nearby and vanishing cycles over excellent henselian traits with invertible torsion coefficients, the inertia-equivariant specialization triangle and sequence for proper families, derived coefficient change and integral/rational realization. Apply them to the multiplication family compactified to P¹ over the strict henselization of A¹ at zero, with its extension-by-zero coefficient sheaf.

### From TauCetiRoadmap.ArithmeticDirichletSeries and TauCetiRoadmap.AnalyticNumberTheoryPartI

ArithmeticDirichletSeries Layer 6, Abel and Perron summation, supplies partial summation with inclusive endpoints and differentiable smooth weights. AnalyticNumberTheoryPartI §3.26, Uniform divisor subpower bound, supplies: for every ε>0 there is Cε≥1 such that τ(n)≤Cε n^ε for all n≥1. This has no squarefree or good-prime restriction. Apply it only to the nonzero integers n−1 and n+1 after separating n=1; τ(0) is not used to count divisors of zero.

## How to read the build

Layer 0 constructs the quotient L² adapter and compares its positive spectral bottom with the supplied spectral realization; within it the spectral description precedes the upper bound 1/4 for that bottom. Layer 1 passes exceptional classical eigenfunctions to a cuspidal spherical adjoint. Layers 2–4 develop the all-prime self-pair, its exact twisted equation, cutoff kernels and even prime-twist moment. Layer 5 obtains the parameter inequality by contradiction and uses Layer 1 to obtain the geometric gap, form inequality and metric scaling. Each *Needs* clause separates statement carriers from the route inputs, so an alternative proof has the same mathematical acceptance criterion.

## Layer 0: Congruence quotient and positive spectrum

Construct the measure before the operator. Every quotient object in this layer uses the effective action and invariant elliptic charts. The upper bound 1/4 for the positive bottom is proved in §0.7 from §0.6; the infimum definition and nonnegativity use §§0.2–0.3.

### 0.1 Hyperbolic quotient measure

For the quotient measurable space XΓ=Γ\ℍ, define μΓ as p₍*₎(dA restricted to F), where p:ℍ→XΓ and F is a measurable fundamental domain for the effective projective image. Prove independence of F, and prove 0<μΓ(XΓ)<∞.

A route to the result is as follows. Use the Fuchsian effective action, fundamental domain and covolume contracts; the kernel ±I cannot be retained in the acting group of IsFundamentalDomain. Identify the effective orbit quotient with the raw Γ orbit quotient and transport the quotient measure. Apply the fundamental-domain pushforward equality to show independence. Finite index from IsCongruenceSubgroup.finiteIndex gives positive finite covolume. At level one the Layer 6, item 1, signature has genus zero, one cusp and elliptic orders 2 and 3, so Layer 4, item 5, gives 2π(−2+1+1/2+2/3)=π/3.

The API proves the following facts.

- For any IsFundamentalDomain of the effective permutation image, μΓ is the map of volume restricted to that domain.
- μΓ(XΓ)<∞.

**Checks.**

- For Γ(1), μΓ(XΓ).toReal=π/3. Counting the central kernel twice would give 2π/3.
- μΓ(XΓ)>0 for every allowed Γ. The zero measure fails positivity.
- Two effective measurable fundamental domains have equal hyperbolic area. The areas agree; an arbitrary overlapping domain is not a fundamental domain.
- For Γ(2), μΓ(XΓ).toReal=2π; its effective index is six, rather than the level-one area. A level-independent normalization would give π/3 instead of 2π.

(FuchsianOrbifolds Layers 0 and 2, effective quotient and covolume; Layer 4, item 5, orbifold area formula; Layer 6, item 1, level-one polygon and signature.)

*Needs:* `CongruenceSubgroup.IsCongruenceSubgroup.finiteIndex`; `MulAction.orbitRel.Quotient`; `MulAction.toPermHom`; `UpperHalfPlane.volume_def`; `MeasureTheory.IsFundamentalDomain.quotientMeasure_eq`; FuchsianOrbifolds Layers 0 and 2, Layer 4, item 5, and Layer 6, item 1.

### 0.2 Positive orbifold Laplacian

For every congruence Γ, construct the densely defined nonnegative self-adjoint Friedrichs realization ΔΓ of −y²(∂ₓ²+∂ᵧ²) on HΓ=L²(XΓ,μΓ). Close the energy initially defined on compactly supported orbifold-smooth functions, using invariant smooth lifts in each elliptic chart. Its kernel is exactly the complex constants. This is the arbitrary-congruence extension of the Γ₀(N) operator, with a canonical agreement comparison on that family.

A route to the result is as follows. Import ordinary gradient, volume and Green identity from DifferentialGeometry, and weak derivatives from PDE Lane A; descend through the Fuchsian isometric orbifold charts. Density uses a locally finite partition and cusp truncations. Closability follows by testing a candidate gradient limit against compactly supported vector fields in each chart; finite isotropy averaging preserves the test core. Apply the generic closed-form representation/Friedrichs extension, then the LinearPMap self-adjoint API. For the maximal domain choose N with Γ(N)≤Γ and put N′=3N; then Γ(N′)≤Γ is a torsion-free normal subgroup of finite index, so Γ(N′)\ℍ is a connected complete Riemannian surface. On it prove, by Gaffney's cutoff argument, that the scalar Laplacian d⁎d on compactly supported smooth functions is essentially self-adjoint, so that its closure is the maximal operator, whose domain is the set of L² functions with distributional Laplacian in L². Local elliptic regularity in charts puts the maximal domain in W^(1,2)_loc: a mollifier step passes from L²_loc to W^(1,2)_loc, and PDE Lane E, item 20, continues to W^(2,2)_loc (bms02, Assumption B, p.5, bms02 line 196); the cutoffs χ(d(x,x₀)/R), built from the distance to a base point, are compactly supported by completeness and have gradient at most sup|χ′|/R, so the boundary terms of Green's identity vanish as R→∞ and the maximal operator is symmetric (bms02, §2.1, p.4, and Corollary 2.10 with D=d, p.7; bms02 line 151 and line 245). The finite group Γ/Γ(N′) acts by isometries commuting with d⁎d, and averaging over it maps compactly supported smooth functions onto compactly supported orbifold-smooth functions, so the invariant restriction is essentially self-adjoint too. Its closure is a self-adjoint extension of the initial operator and therefore equals the Friedrichs realization. Cut off constants far into each cusp with energy tending to zero. Zero energy forces local constancy and connectedness forces a single constant. A nonconstant orbifold-smooth bump in a free chart belongs to the initial differential-operator domain and has nonzero Laplacian, by the kernel characterization; this supplies the nontriviality test.

The API proves the following facts.

- The partial complex-linear map equals its adjoint.
- Its operator domain is dense in L².
- For every u in its domain, Re⟨u,Δu⟩≥0.
- For u in the domain, Δu=0 iff u equals a complex constant almost everywhere.
- For Γ=Γ₀(N), N≥1, ΔΓ agrees with `modular_laplacian_realization` of AutomorphicSpectralTheory §1.16a, with equal domains and actions under the measure-preserving identification Γ₀(N)/{±I}\ℍ≅XΓ of §0.1. The action kernel is {±I} since −I∈Γ₀(N); uniqueness of the Friedrichs operator for the identified closed forms proves the comparison.
- Maximal domain: an L² class f lies in the operator domain iff the distributional expression −y²(∂ₓ²+∂ᵧ²) of its Γ-invariant lift, tested against compactly supported smooth functions on ℍ, is the lift of an L² class; ΔΓf is then that class. Equivalently, the expression restricted to compactly supported orbifold-smooth functions is essentially self-adjoint and its closure is ΔΓ.

**Checks.**

- The L² class of the constant 1 is in the domain and Δ1=0. This rejects a cusp boundary condition that excludes constants.
- If Δu≠0 then Re⟨u,Δu⟩>0; the opposite sign convention fails. The negative sign convention makes the nonzero quadratic pairing negative.
- For every allowed Γ there is an operator-domain u with Δu≠0; the zero operator fails. The zero operator fails the nonconstant free-chart bump test.

(teschl, §2.3, Theorems 2.12–2.13, pp.70–72; teschl line 2914 and line 2960; bms02, Corollary 2.10, p.7, bms02 line 245, for the maximal domain.)

*Needs:* §0.1; `MeasureTheory.Lp`; `LinearPMap`; Tau Ceti formal-adjoint pairing; FuchsianOrbifolds Layers 1 and 3; DifferentialGeometry Layer 12; PDE Lane A, item 1, and Lane E; UnboundedOperators UO-D06; AutomorphicSpectralTheory §§0.6–0.7 and 1.16a.

### 0.3 Mean-zero Hilbert subspace

Define HΓ⁰ as the kernel of the continuous complex-linear functional u↦∫XΓu dμΓ. Prove that it is the closed orthogonal complement of the constant line and reduces ΔΓ, including invariance of the actual operator domain and commutation with the spectral projections.

A route to the result is as follows. Use finite measure and Cauchy–Schwarz to bound the integral by μΓ(XΓ)^(1/2)‖u‖₂. Its continuous complex-linear kernel is closed. Constants lie in the operator kernel, so self-adjointness gives ∫Δu=0 for every u in the domain. The spectral calculus restricts to this orthogonal complement.

The API proves the following facts.

- A vector belongs to HΓ⁰ if and only if its complex integral is zero.
- HΓ⁰ is closed in the L² topology.
- Δu belongs to HΓ⁰ for every operator-domain u.

**Checks.**

- The almost-everywhere constant 1 does not belong to the mean-zero subspace. The integral is μΓ(XΓ)≠0.
- The almost-everywhere constant i does not belong; taking only a real mean fails. The integral is iμΓ(XΓ)≠0, detecting use of a real-part mean.
- For every allowed Γ there is a nonzero L² vector in the mean-zero subspace; the zero submodule fails. Subtract the mean of a nonconstant compactly supported bump. A nonconstant bump minus its average remains nonzero, excluding the zero subspace.

(teschl, §4.3, Theorem 4.10, pp.118–119; teschl line 5044.)

*Needs:* §§0.1–0.2; `MeasureTheory.Lp`; finite-measure integration; SelfAdjointSpectralTheory SA-E01–SA-E13; UnboundedOperators UO-A01–UO-A03.

### 0.4 Positive spectral bottom

Define λ′₁(Γ) as inf{Re⟨u,ΔΓu⟩/‖u‖₂² : u∈Dom ΔΓ∩HΓ⁰, u≠0}. Prove that this set is nonempty, bounded below by zero and has the same infimum as the closed-form Rayleigh values. Prove 0≤λ′₁(Γ).

A route to the result is as follows. Dense operator domain and its constant projection give nonzero mean-zero vectors. Nonnegativity gives a lower bound. Use the supplied square-root form identity and spectral calculus on HΓ⁰. For a form-domain u, the bounded spectral truncations u_R=1_[0,R](ΔΓ)u lie in the actual operator domain, remain mean zero and converge to u in the form norm, since the discarded integral of (1+λ)d⟨u,E(λ)u⟩ tends to zero. This proves the operator-domain form-core comparison and equality of the two Rayleigh infima; spectral-support bounds and nonzero projections on intervals approaching the spectral bottom give the spectral infimum as well.

The API proves the following facts.

- Equals the infimum of the explicitly displayed nonzero mean-zero operator-domain Rayleigh values.
- 0≤λ′₁(Γ).
- For nonzero u in the operator domain with complex mean zero, λ′₁(Γ)≤Re⟨u,Δu⟩/‖u‖₂².

**Checks.**

- In the positive-operator model diag(0,21/100,1/4) on ℂ³ with the first coordinate the constants, a unit vector u in the 21/100 eigenspace and 2iu have Rayleigh values (21/100)/1=(21/25)/4=21/100. Dividing by the norm rather than its square would give 21/50 for 2iu.
- For a nonzero mean-zero operator-domain eigenvector u with real eigenvalue λ, if every nonzero mean-zero operator-domain v has Re⟨v,Δv⟩≥λ‖v‖₂², then λ′₁(Γ)=λ. The eigenvector has quotient λ, and the assumed lower bound gives the reverse inequality.
- In the model of the first Check, the Rayleigh infimum over all nonzero vectors is 0, attained on the constant line, while over the mean-zero vectors it is 21/100. A definition that retains the constant line returns 0.

(teschl, §4.3, Theorem 4.10, pp.118–119; teschl line 5044.)

*Needs:* §§0.2–0.3; SelfAdjointSpectralTheory SA-E01–SA-E13; UnboundedOperators UO-A01–UO-A03, UO-D06 and §0.4 spectral truncation.

### 0.5 Clipped eigenvalue convention

For S⊆ℝ define its clipped bottom as inf({1/4}∪S). In geometric use S is the set of eigenvalues in (0,1/4). The inserted threshold makes the empty-set value 1/4. Comparisons with a conditional infimum retain bounded-below hypotheses; a lower comparison supplies such a lower bound itself.

A route to the result is as follows. Use the real conditional complete lattice infimum. In the geometric use the eigenvalues are nonnegative, so the set is nonempty and bounded below. Prove lower and upper comparison APIs with explicit bounded-below hypotheses where the conditional infimum requires them.

The API proves the following facts.

- The clipped bottom of S is the infimum of the nonempty set {1/4}∪S.
- If r∈S and {1/4}∪S is bounded below, its clipped bottom is at most r.
- If c≤1/4 and c≤r for every r∈S, then c is at most the clipped bottom of S.

**Checks.**

- The clipped bottom of ∅ is 1/4. A bare empty infimum would not enforce the threshold.
- The clipped bottom of {21/100} is 21/100. This detects a convention that always returns the threshold.
- The clipped bottom of {1/3} is 1/4, not 1/3. The threshold clips an input lying above it.

(lrs95, Theorem 1.1 p.387 and archimedean discussion pp.389–390.)

*Needs:* real conditional infima; the threshold 1/4.

### 0.5a Principal-level measure, completion and Casimir comparison

For every N≥1 put K(N)={k∈GL₂(ℤ̂):k≡1 mod N}. Construct the component comparison from the right-K(N)·SO(2)-invariant adelic L² space to the Hilbert sum indexed by (ℤ/N)ˣ of L²(XΓ(N),μΓ(N)). Start with the smooth restriction map of AutomorphicFormsOnReductiveGroups §3.1 on the component homeomorphism, index set and stabilizers supplied by AdelicAlgebraicGroups §5.2, in its positive-determinant convention, and prove the quotient integration formula. If the fixed adelic Haar normalization gives c_N μΓ(N) on each component, prove c_N>0 and use restriction multiplied by sqrt(c_N); do not silently identify differently normalized measures. The level-preserving action used here is that of GL₂(ℤ̂)/K(N)≅GL₂(ℤ/N): K(N) is normal in GL₂(ℤ̂), so right translation (R(k)f)(g)=f(gk) by k∈GL₂(ℤ̂) preserves right-K(N)-invariance and is unitary for the fixed Haar measure. Put d=det(k) mod N. On points, [x,a]↦[x,ak] multiplies the component index c∈(ℤ/N)ˣ by d. On functions the support moves the other way: R(k)f is supported on component c exactly when f is supported on component cd, so R(k) carries the summand of functions on component a onto the summand of component ad⁻¹. With P_a the orthogonal projection onto functions supported on component a, R(k)P_a=P_(ad⁻¹)R(k), equivalently P_aR(k)=R(k)P_(ad); each summand map is read through the component identifications fixed by the chosen representatives. The elements with det(k)≡1 mod N fix the identity component; choosing γ∈SL₂(ℤ) with γ≡k mod N, R(k) acts on functions there by φ(z)↦φ(γ⁻¹z), so this stabilizer acts through SL₂(ℤ)/Γ(N)≅SL₂(ℤ/N). An element h∈GL₂(𝔸_f) outside the normalizer of K(N) does not act on this space. Its right translation is the map X_(K(N))→X_(h⁻¹K(N)h), [x,a]↦[x,ah], of AdelicAlgebraicGroups §5.2, and R(h) carries right-h⁻¹K(N)h-invariant functions onto right-K(N)-invariant functions, isometrically for the fixed Haar measure: a comparison between conjugate levels, not an operator on one level. Extend the comparison to an onto complex-linear isometry by density and L² completion. Its source is the full invariant Hilbert space, not just smooth automorphic forms.

Prove on compactly supported smooth vectors that the positive weight-zero Casimir corresponds to −y²(∂ₓ²+∂ᵧ²), with the same scalar normalization on both sides. Section 0.2's essential self-adjointness then identifies the transported closures, their actual domains and their spectral projections. Prove that the isometry identifies the cuspidal λ-eigenspace on the identity component with MaassCuspForm(Γ(N),λ) of AutomorphicFormsOnReductiveGroups §4.5, using local regularity and zero constant terms at every cusp. This extends its level-one adelization theorem through its smooth component comparison (lrs95, §1, pp.389–390, classical/adelic eigenvalue dictionary).

The API proves the following facts.

- The quotient integration formula is an equality of integrals for nonnegative measurable functions; it descends through almost-everywhere equality and fixes the L² norm.
- Smooth compactly supported component functions have dense image, so the extension is onto and its inverse is determined by restriction on that core.
- For k∈GL₂(ℤ̂) the comparison carries R(k) to a unitary operator on the Hilbert sum that carries the summand of component a onto that of component a·det(k)⁻¹, that is R(k)P_a=P_(a·det(k)⁻¹)R(k), and, when det(k)≡1 mod N, acts on the identity summand through SL₂(ℤ)/Γ(N). It intertwines the cuspidal projections, and the closed Casimir with the quotient Laplacian, including equality of actual domains.

**Checks.**

- At N=1 the one component has area π/3. A constant of value 1 on that component has adelic norm squared c_1π/3 and its image has norm squared (sqrt(c_1))²π/3=c_1π/3; restriction without the scalar would fail when c_1≠1.
- At N=3 the two components are indexed by 1 and 2 in (ℤ/3)ˣ. The element k=diag(1,−1)∈GL₂(ℤ̂) has det(k)≡2 mod 3; with representatives 1 and k for the two components, k²=1 gives R(k)(u,0)=(0,u) and R(k)(0,u)=(u,0), all of squared norm ‖u‖². Replacing all components by only the identity component would lose this action.
- At N=5 let k have 5-adic component diag(2,1) and identity components at every other prime, so k∈GL₂(ℤ̂) and d=2, with d⁻¹=3 in (ℤ/5)ˣ. For f the characteristic function of component 1, a nonzero L² vector since the component has finite positive volume, (R(k)f)(g)=1 exactly when c(g)·2≡1 mod 5, that is c(g)=3. So R(k)f lies in the summand of component 3=1·d⁻¹; the point rule a↦ad applied to summands would give component 2. The N=3 check cannot separate the two rules, since 2 is its own inverse modulo 3.
- At N=1 let h be diag(p,1) at one prime p and 1 at every other prime. Then h⁻¹(1 1;0 1)h=(1 p⁻¹;0 1)∉GL₂(ℤ_p), so h does not normalize K(1)=GL₂(ℤ̂). The translate R(h)f of a right-GL₂(ℤ̂)-invariant f is invariant under hGL₂(ℤ̂)h⁻¹, which meets GL₂(ℤ̂) in the matrices whose upper-right entry at p is divisible by p. An action of all of GL₂(𝔸_f) on the fixed-level space would contain R(h); the level-preserving group GL₂(ℤ̂)/K(1) excludes it.
- The local functions 1 and y² give Casimir/Laplacian values 0 and −2y² on both sides. The latter tests the expression on an open chart, without asserting it is a quotient L² vector; the opposite Casimir sign gives +2y² and fails.

*Needs:* §§0.1–0.2; AutomorphicFormsOnReductiveGroups §§3.1 and 4.5; ArithmeticLocallySymmetricSpaces ALS.F.6; FuchsianOrbifolds Layers 0–3; AdelicAlgebraicGroups §§2.2 and 5.2 quotient measures, component geometry and change of level; Mathlib L² completion and isometric extension.

### 0.5b Principal-level cusp compactness

For every N≥1 prove that the restriction of ΔΓ(N) to the closed cuspidal subspace has compact resolvent. Its spectrum is pure point, each eigenspace is finite dimensional, and each bounded real interval contains only finitely many eigenvalues counted with multiplicity. This extends the Γ₀(N) cusp compactness argument to the larger Γ(N) space; compactness on a finite-invariant subspace alone does not imply compactness on the whole space.

A route repeats the cusp Fourier argument with every actual principal-level width w. Zero constant term removes frequency zero, and the frequencies 2πn/w, n≠0, give on y≥R the estimate ∫|u|²dxdy/y²≤(w/(2πR))²∫|∂ₓu|²dxdy. Prove compactness on each truncated quotient using local Rellich compactness in finitely many smooth/finite-isotropy charts, then use this uniform tail estimate at the finitely many cusps to prove compactness of the cuspidal form-domain inclusion. The represented resolvent is compact. Transport through §0.5a to the principal-level adelic cusp space, using the general cuspidal discrete decomposition rather than inferring compactness from multiplicity at one infinitesimal character (AutomorphicSpectralTheory §1.16a, cusp Fourier route; lrs95, §1, pp.389–390).

**Checks.**

- For a width-w frequency sin(2πx/w), the squared frequency is (2π/w)²; at widths 1 and 3 the constants in the tail bound are 1/(4π²R²) and 9/(4π²R²). Ignoring widths fails at principal level three.
- At Γ(2) there are three cusps, so the maximum of three such tail constants controls the sum of the three tails; a one-cusp truncation leaves two uncontrolled ends.
- A zero Fourier mode has ∂ₓu=0 and positive tail mass when nonzero. It violates the displayed tail inequality and is excluded by cuspidality; retaining it would incorrectly imply compact resolvent on the full L² space with continuous spectrum [1/4,∞).

*Needs:* §§0.1–0.2 and 0.5a; FuchsianOrbifolds Layers 1 and 3; PDE Lane A, items 1 and 6, local Sobolev and Rellich compactness; UnboundedOperators UO-D06; AutomorphicSpectralTheory §1.16a cusp Fourier argument; ArithmeticLocallySymmetricSpaces ALS.F.6.

### 0.6 Congruence spectral description

For every congruence Γ, specialize the general adelic decomposition to principal level, use §0.5b for cusp compactness, and transport it to ΔΓ through the classical comparison of §0.5a. The residual weight-zero L² subspace is exactly the constants; the absolutely continuous spectrum is [1/4,∞), with one Eisenstein channel per cusp and its scattering matrix; there is no singular continuous spectrum. Every spectral value in (0,1/4) is a finite-multiplicity eigenvalue whose eigenspace consists of the classes of Maass cusp forms, elements of `MaassCuspForm(Γ,λ)` in the sense of AutomorphicFormsOnReductiveGroups §4.5, and there are finitely many of them.

A route to the result is as follows. Choose N with Γ(N)≤Γ. The comparison of §0.5a identifies the right-K(N)·SO(2)-invariant classes on the identity component with L²(Γ(N)\ℍ) and the positive Casimir operator with Δ on compactly supported smooth vectors. By the maximal-domain identification of §0.2, ΔΓ(N) is the closure of Δ on those vectors, hence the transported self-adjoint Casimir. Restriction to the identity component commutes with the cuspidal, residual and continuous projections, because it is an average of multiplications by τ∘det for characters τ of (ℤ/N)ˣ and these preserve the decomposition (AutomorphicSpectralTheory §4.6). The residual part becomes the constants, since each τ∘det is constant on each component; the continuous part becomes [1/4,∞) with one channel per cusp of Γ(N); the cuspidal part becomes the Maass cusp forms. Finally pass to invariants of the finite group Γ/Γ(N), which acts by isometries commuting with Δ and the three projections: invariant channels correspond to Γ-orbits of cusps of Γ(N), that is, to cusps of Γ, and invariant constants are constants. The residual input must exclude every positive residual value rather than treating it as cuspidal.

**Checks.**

- For Γ(1) there is one cusp and the constant term is (3/π)∫u; its extension to 1 gives (3/π)(π/3)=1.
- For Γ(2) there are three cusps and area 2π; the constant projection of 1 is (1/(2π))(2π)=1 and there are three continuous channels. A single level-one channel fails.
- For s=1/2+it the cusp eigenvalue is 1/4+t²; at t=0 it is 1/4. A hypothetical positive residual eigenvalue 1/5 violates the constants-only residual contract.

(lrs95, Theorem 1.1 p.387 and §1 pp.389–390.)

*Needs:* §0.2; AutomorphicSpectralTheory §§4.3–4.4, 4.6, 4.8 and 4.14a; §0.5b; AutomorphicFormsOnReductiveGroups §§3.1 and 4.5; §0.5a; AutomorphicLFunctionsAndLocalFactors AL.3 boundary regularity.

### 0.7 Rayleigh and clipped spectrum comparison

For SΓ={λ∈ℝ : 0<λ<1/4 and some nonzero u∈Dom ΔΓ satisfies ΔΓu=λu}, prove λ′₁(Γ)=inf({1/4}∪SΓ). A first positive discrete eigenvalue, when it exists, gives min(λ₁,1/4); absence of a value below 1/4 gives 1/4, without choosing a nonexistent eigenfunction.

A route to the result is as follows. Restrict the spectral calculus to constants-perpendicular L². Apply the spectral description: only finitely many positive discrete values occur below the essential threshold. The lowest spectral value gives the Rayleigh infimum; if the set is empty, approximate the essential bottom.

The API also proves λ′₁(Γ)≤1/4: the continuous spectrum of §0.6 begins at 1/4 and supplies mean-zero Weyl sequences.

**Checks.**

- If SΓ=∅, its clipped bottom is 1/4.
- For SΓ={21/100}, the infimum is 21/100; for a model eigenvalue 1/4 alone the open small set is empty and the answer is 1/4.
- The constant eigenvalue 0 is absent from SΓ; inserting it would give zero and contradict the mean-zero restriction.

(teschl, §4.3, Theorem 4.10 p.119; teschl line 5044.)

*Needs:* §§0.3–0.6; SelfAdjointSpectralTheory SA-E01–SA-E13; UnboundedOperators UO-A01–UO-A03, UO-D06 and §0.4 spectral truncation; AutomorphicSpectralTheory §4.8 and §0.5b.

### Examples

At level one the constant projection of u is (3/π)∫u dμ. At level two it is (1/(2π))∫u dμ. Both send 1 to 1, whereas retaining a central multiplicity of two changes the measure and projection normalization. The cusp cutoff χR(y)=χ(y/R), with χ smooth, 0≤χ≤1, χ=1 up to 1 and χ=0 beyond 2, has missing L² mass at most w/R in a cusp of width w and energy (w/R)∫₁²|χ′(t)|²dt; both tend to zero. These explicit values explain why constants enter the energy closure.

### Dependencies

Mathlib congruence, measure, L² and partial-operator APIs; Tau Ceti Poincaré volume, local energy forms and formal adjoints; FuchsianOrbifolds Layers 0–3, Layer 4, item 5, and Layer 6, item 1; DifferentialGeometry Layer 12; PDE Lane A; UnboundedOperators UO-A01–UO-A03 and UO-D06; SelfAdjointSpectralTheory SA-C and SA-E01–SA-E13; AutomorphicSpectralTheory §§0.6–0.7, 1.16a, 4.3–4.8 and 4.14a; AutomorphicFormsOnReductiveGroups §§3.1 and 4.5; ArithmeticLocallySymmetricSpaces ALS.F.6.

## Layer 1: Exceptional GL₂ forms and the adjoint

The geometric eigenspace gives SO(2)-weight zero, not a reflection parity. Pass through the actual cuspidal constituent and local-genericity theorems before applying the unitary classification and the adjoint lift.

### 1.1 Exceptional cuspidal dictionary

For allowed Γ and an eigenvalue 0<λ<1/4, a cuspidal GL₂(Aℚ) unitary representation π occurs after passing to principal level K(N) and decomposing its right-K(N)-invariant cuspidal space. Its archimedean component has SO(2)-weight zero and complementary parameter r∈(0,1/2), with λ=1/4−r². A common sign parity on its two real inducing characters is allowed; π∞ need not be O(2)-spherical.

Assume Γ≤SL₂(ℤ) contains Γ(N) for some N≥1; its effective image acts on ℍ. Metric ds²=(dx²+dy²)/y² has curvature −1; all functions are complex-valued. u is a nonzero positive exceptional eigenfunction.

A route to the result is as follows. Apply AutomorphicLFunctionsAndLocalFactors AL.3/global-whittaker-factorization to the cuspidal GLn representation to obtain genericity of every local component before invoking the generic unitary classification. Cuspidality alone is not a definition of genericity. Use Layer 0 residual classification to identify u as an element of `MaassCuspForm(Γ,λ)` (AutomorphicFormsOnReductiveGroups §4.5). Regard u as Γ(N)-invariant and apply the principal-level comparison of §0.5a, which extends §4.5's level-one comparison through §3.1 at K(N), then extract a cuspidal constituent using ArithmeticLocallySymmetricSpaces ALS.F.6 cuspidal discreteness, not merely the definition of a cuspidal representation. Compute the normalized Casimir on the SO(2)-fixed line using AutomorphicFormsOnReductiveGroups §2.6 real local classification. Write the unitary principal-series characters as sgn^ε|.|^r and sgn^ε|.|^−r after the central norm normalization. Allow both ε=0 and ε=1; the geometric eigenvalue does not force reflection-even parity.

**Checks.**

- At r=1/5, both common parities ε=0,1 give λ=1/4−1/25=21/100. Reflection-even parity cannot be inferred from SO(2)-weight zero.
- At r=0 the eigenvalue is 1/4 and the strict exceptional hypothesis fails; at r=1/2 it is zero and fails again.
- At Γ=Γ(3), passing to the principal-level cover changes no group; taking invariants under any intermediate finite deck subgroup preserves the Casimir eigenvalue. It does not replace the group by Γ₀(3).

(lrs95, §1 pp.389–390, GL₂ eigenvalue and GL₃ lift discussion.)

*Needs:* §0.6; AutomorphicFormsOnReductiveGroups §§2.5–2.7, 3.1 and 4.5; §0.5a; ArithmeticLocallySymmetricSpaces ALS.F.6; AutomorphicLFunctionsAndLocalFactors AL.3 Global Whittaker factorization.

### 1.2 Monomial archimedean temperance

If π is unitary cuspidal on GL₂(Aℚ) and has a nontrivial character self-twist, then π=AIK/ℚ(θ) for a quadratic field K and a unitary Hecke character θ. Its archimedean parameter is tempered. Therefore a weight-zero complementary component with 0<r<1/2 has no nontrivial self-twist.

Assume π is unitary cuspidal; there is a character η≠1 with π⊗η≃π.

A route to the result is as follows. Import the quadratic self-twist and induction branch of the adjoint-lift contract. A global Hecke character’s positive absolute-value part is a common norm power; the central unitarity of its induction forces this power to be zero. At a split real place induction is the pair of unitary real characters. At a complex place unitary Weil induction is tempered (with the resulting principal/discrete type). The nonzero real exponents of a complementary weight-zero π∞ contradict temperance.

**Checks.**

- For real quadratic induction of |·|^(it₁),|·|^(it₂), both real parts are zero; the positive real exponents ±1/5 cannot occur.
- For imaginary quadratic induction of a unitary character (z/|z|)^k|z|ℂ^(it), its Weil parameter is unitary, hence tempered. A discrete-series gamma shift need not have zero real part; temperedness concerns the Weil representation.
- A real shift σ=1 gives absolute central exponent 2σ=2, which violates unitarity; σ=0 gives exponent zero.

(gj78, §3.7 p.491; Theorem 9.3 p.534 and Remark 9.9 p.541; gj78 line 528, line 538 and line 721; GlobalNumberFields Layers 6, 9 and 10, norm-one compactness, unique real shift and infinity types.)

*Needs:* §1.1; GL2AutomorphicRepresentationsAndTransfer R17.4.13, adjoint-lift; GlobalNumberFields Layers 9–10; AutomorphicFormsOnReductiveGroups §2.5.

### 1.3 Exceptional adjoint parameters

For the exceptional π of Layer 1, Ad(π)=Sym²(π)⊗ωπ⁻¹ is a unitary cuspidal GL₃ representation, O(3)-spherical at infinity, with standard archimedean parameters {2r,0,−2r} in the Γℝ(s−μj) convention. The common sign parity disappears. Its GL₃ parameters, not π’s GL₂ parameters, are used in Theorem 1.2.

Assume π and r are supplied by the exceptional dictionary.

A route to the result is as follows. Use the monomial temperance theorem to exclude nontrivial self-twists; import the exact Gelbart–Jacquet adjoint lift and its cuspidality criterion. At infinity compute the trace-zero endomorphism representation of the rank-two parameter. Ratios of the two characters give |.|^2r,1,|.|^−2r; common sign factors cancel. The resulting spherical component has the required standard gamma factor; central-character removal is essential when ωπ is nontrivial.

**Checks.**

- At r=1/5, the ratios have exponents 2/5,0,−2/5.
- Two signs cancel: (sgn|·|^r)/(sgn|·|^(−r))=|·|^(2r), so either parity gives the same spherical adjoint.
- Twisting a parameter by θ multiplies raw Sym² by θ², while multiplying by the inverse determinant cancels θ²; a nontrivial θ² detects omission of ωπ⁻¹.

(lrs95, §1 pp.389–390 and Theorem 1.2 p.389.)

*Needs:* §§1.1–1.2; GL2AutomorphicRepresentationsAndTransfer R17.4.13, adjoint-lift; AutomorphicFormsOnReductiveGroups §§2.5–2.7; AutomorphicLFunctionsAndLocalFactors AL.1 Canonical archimedean factors.

### Examples

For r=1/5 and either common parity the GL₂ exponents are ±1/5 and the adjoint exponents are 2/5,0,−2/5. On trace-zero endomorphisms, the two off-diagonal basis vectors transform by the two character ratios and the diagonal difference by 1. A common norm twist cancels as well as the common sign. On the principal-level-two cover the effective deck group is S₃; in its regular representation the subspace fixed by a transposition has dimension 3, the full invariant subspace dimension 1 and the whole representation dimension 6. These distinct values test passage to actual intermediate-group invariants in a nonabelian example.

### Dependencies

Layer 0; AutomorphicFormsOnReductiveGroups §§2.5–2.7 and 3.1; ArithmeticLocallySymmetricSpaces ALS.F.6; GlobalNumberFields Layers 9–10; GL2AutomorphicRepresentationsAndTransfer R17.4.13; AutomorphicLFunctionsAndLocalFactors AL.1 and AL.3.

## Layer 2: Self-pair factors and forced zeros

No ramified self-pair factor is discarded. The only good-prime restriction selects the twisting conductor q at which π is unramified; all other primes remain in the finite L-function and its coefficients.

### 2.0 Local self-pair positivity and analytic character transport

For every m≥1 and irreducible generic unitary representation σ of GL_m(ℚ_p), prove that the canonical analytic self-pair factor L(s,σ×σ∨), expanded in T=p⁻ˢ, has constant coefficient one and nonnegative real coefficients, including ramified σ. Prove the stronger assertion that its formal logarithm has nonnegative real coefficients. Use normalized induction and compute the essentially square-integrable pair factors from their supercuspidal blocks: a unitary supercuspidal ρ has self-pair factor (1−T^e)⁻¹, where e is the order of its finite unramified self-twist group; inequivalent unramified twist classes contribute no mixed factor. For blocks St(n,ρ) and St(n′,ρ′), prove the product over shifts (n+n′)/2−h, 1≤h≤min(n,n′), of the supercuspidal pair factors. These calculations on the supplied analytic factors are targets here, not an assumption of ramified local Langlands compatibility (rs96, Appendix §5.2, (5.4)–(5.6), manuscript pp.52–53; rs96 line 3181).

Within one twist class let its blocks have lengths nⱼ and complex shifts sⱼ, and put zⱼ=p^(−nⱼ/2−sⱼ), using the unitary classification to pair the shifts correctly. Prove that the coefficient of T^(ea) in its formal logarithm is (1/a)Σₕ≥₁p^(eah)|Σⱼ:nⱼ≥ₕ zⱼ^(ea)|² for a≥1; other degrees are zero. The h-sum is finite. Exponentiation preserves nonnegative coefficients, and multiplication over twist classes and primes proves b(n)≥0 and b(1)=1 for the full global finite self-pair series. Its simple pole at 1, supplied by AL.3, has positive residue: for real s>1 the series is positive, so the nonzero real limit (s−1)L(s) is positive (rs96, (5.10)–(5.14), Lemma 5.1 and its deduction, manuscript pp.53–55; rs96 line 3254, line 3302 and line 3339).

**Checks.**

- A ramified unitary rank-one character paired with its inverse has factor (1−T)⁻¹, with coefficients 1,1,1 in degrees 0,1,2. Deleting ramified factors would give 1,0,0.
- A supercuspidal self-twist order e=2 gives (1−T²)⁻¹: coefficients at degrees 0,1,2 are 1,0,1 and logarithmic coefficients in degrees 1,2 are 0,1. Strict positivity in every degree would be false.
- For a length-two Steinberg block in a twist class with e=1 and zero shift, the factor is ((1−T)(1−p⁻¹T))⁻¹. Its linear coefficient and the displayed logarithmic sum both equal 1+p⁻¹: the h=1,2 summands are p⁻¹ and 1. A spherical-only calculation would miss the shorter-block contribution.
- For a single length-one block with z=p⁻¹/² the degree-a logarithmic coefficient is p^a|p⁻a/²|²/a=1/a. At a=1,2 exponentiation gives coefficients 1 and 1/2+1/2=1, fixing the 1/a normalization.

For the same canonical analytic local factors, prove unramified-character transport at an arbitrary finite place p for every pair of irreducible admissible generic representations σ,σ′ of positive ranks: if η is unramified, substitute η(p)T for T in L(s,σ×σ′), and multiply its epsilon monomial by η(p)^a when that monomial has conductor exponent a and the additive character has conductor zero. This includes ramified σ and σ′. Obtain this by twisting the local integrals and their dual Fourier equation, retaining the Haar and positive Fourier normalizations.

Prove epsilon multiplicativity for irreducible generic normalized principal-series pairs from that analytic functional equation. In the application at q, write the spherical π_q as induction of unramified characters α_i; then (π_q⊗χ_q)×π_q∨ has m² rank-one terms χα_iα_j⁻¹. Apply AL.1's rank-one Tate/Gauss evaluation, with the local component of the global Dirichlet character in the stated positive-Gauss convention: the ij term is τ(χ)q⁻ˢα_i(q)α_j(q)⁻¹. The product of the ratios is one, since each α_i(q) occurs m times in numerator and denominator. Thus L_q=1 and ε_q(s)=τ(χ)^(m²)q^(−m²s). All α_i(q) are nonzero. No ramified analytic/Weil–Deligne comparison is assumed (lrs95, Lemma 2.1, pp.392–394).

**Checks.**

- At m=2 with α_1(q)=a, α_2(q)=b, the four multipliers are 1,a/b,b/a,1, whose product is 1; the exponent is 4 rather than 2.
- At m=1 the local formula is τ(χ)q⁻ˢ. At s=1/2 its norm is sqrt(q)/sqrt(q)=1; at m=2 the norm is q²/q²=1.
- At a ramified place away from q with factor (1−T)⁻¹ and conductor exponent 2, unramified η(p)=−1 gives (1+T)⁻¹ and epsilon multiplier (−1)²=1. The linear coefficient changes from 1 to −1 and the place is retained.

*Needs:* AutomorphicSpectralTheory §7.0b, Unitary and residual-Speh Shintani lift, finite-place unitary-classification prefix only; SmoothRepresentationsOfLocalGroups SR.2–SR.3 for normalized induction and tempered support, and SR.5.2, Segments and their two representations, for the generalized Steinberg blocks; AutomorphicLFunctionsAndLocalFactors AL.3 Rankin–Selberg local L-factor, Nonarchimedean factors under normalized induction, The local Rankin–Selberg functional equation and Continuation and the Rankin–Selberg pole criterion; AL.1 rank-one local functional equation and explicit epsilon factors; formal power series over ℂ and nonnegative real series.

### 2.1 Prime-twist functional equation

Write Lχ(s)=L(s,(π⊗χ)×π̃)=∑n≥1 b(n)χ(n)n⁻ˢ on Re s>1, with self-pair finite coefficients b(n)≥0, b(1)=1 and ∑n≤x b(n)∼cπx for cπ>0. Its completion A(s)Lχ(s), A(s)=∏j,k Γℝ(s−μj−conj μk), extends to an entire function and satisfies the meromorphic identity Lχ(s)=τπ χ(f) τ(χ)^d(fq^d)⁻ˢ G(s)Lχ̄(1−s), where G(s)=A(1−s)/A(s), f is the self-pair conductor and εself(s)=τπ f⁻ˢ. The unit root number is τπ f⁻¹/², not τπ itself. This equation is an identity of meromorphic germs, and is evaluated pointwise only where its factors are regular.

Assume m≥2 and π is unitary cuspidal on GLm(Aℚ). π∞ is O(m)-spherical; L∞(s,π)=∏j Γℝ(s−μj). d=m², β₀=2 maxj Re μj; unitarity gives β₀∈[0,1). χ is a nonprincipal even character of prime conductor q>2, q∤fπ, where fπ is the standard conductor.

A route to the result is as follows. Apply AutomorphicLFunctionsAndLocalFactors AL.3/global-whittaker-factorization to the cuspidal GLn representation to obtain genericity of every local component before invoking the generic unitary classification. Cuspidality alone is not a definition of genericity. Import AutomorphicLFunctionsAndLocalFactors AL.3 global poles, functional equation and strip estimates for this equal-rank pair and the canonical local factors. Prove the all-prime self-pair positivity and character transport by §2.0, before forming the global product. At q, πq is unramified but πq⊗χq is ramified, so no global norm self-twist can hold. The local twisted L factor is 1 and its epsilon factor is τ(χ)^d q⁻ᵈˢ: the m² exponent shifts sum to zero. At p≠q, twisting by the unramified character substitutes χ(p)p⁻ˢ in the local polynomial and multiplies epsilon by χ(p^ap). Even parity leaves the infinite factor unchanged. Multiply these factors. Obtain the positive partial-sum asymptotic from the simple positive self-pair pole and the full Wiener–Ikehara theorem, with boundary continuity of the pole-subtracted finite function deduced from AL.3, Continuation and the Rankin–Selberg pole criterion and Rankin–Selberg nonvanishing on the boundary. Indeed every gamma argument on Re s≥1 has real part at least 1−β₀>0, so A is regular and nonzero there. Dividing the meromorphic completion by A gives a finite function with its sole boundary pole simple at 1; subtracting its residue times (s−1)⁻¹ removes that pole. A self norm-twist with parameter t would shift the central character by |·|^(imt), forcing t=0.

Construct the finite-function analytic-data adapter here: use the twisted canonical `rsDatum` coefficients b(n)χ(n), conductor fq^d, gamma factor A and unit root number τπχ(f)τ(χ)^d(fq^d)^(−1/2). The local ramification at q excludes a global norm self-twist, so the completed function is entire. Its supplied boundedness on every finite vertical strip, together with Stirling and absolute convergence on the two exterior half-planes related by the functional equation, gives finite order (growth at most exp(C(1+|s|)log(2+|s|))). The positive self-pair partial-sum estimate bounds the absolute twisted coefficient average. Verify the predicates of LFunctions Layer 0, then apply ZerosOfLFunctions Layer 3 to the finite function; no extra polynomial-strip theorem is assumed from the factor supplier.

**Checks.**

- For m=2, d=4; at an unramified q with primitive χ the twisted local L-factor is 1 and the conductor power is q⁴, not q².
- The normalized epsilon at s=1/2 has norm |τπ| q^(d/2)(fq^d)^(−1/2)=1; asserting |τπ|=1 when f>1 gives f^(−1/2).
- At p≠q, even if πp is ramified, coefficient b(p^a) is multiplied by χ(p)^a and is retained; a ramified character paired with its inverse can have local factor (1−p⁻ˢ)⁻¹.
- For an odd χ, its real sign changes the infinite factor, so the unchanged A(s) equation does not apply.
- For m=2 and μ=±1/5, the gamma shifts are 2/5,0,0,−2/5, and every pole is a shift minus an even natural number. Their real parts are at most 2/5<1, so dividing by A creates no boundary pole; only the self-pair pole at 1 needs subtraction.

(lrs95, §2.1 pp.391–392 and Lemma 2.1 pp.392–394.)

*Needs:* AutomorphicLFunctionsAndLocalFactors AL.3 Global Whittaker factorization, Rankin–Selberg local factors, induced products, poles, functional equation, boundary nonvanishing and Hecke, eigensystem and Rankin–Selberg data; AL.1 Canonical archimedean factors; §2.0; AutomorphicFormsOnReductiveGroups §2.6; `TauCeti.LSeries.wienerIkehara`.

### 2.2 Archimedean trivial zero

If β₀>0, then Lχ(β₀)=0 for every χ in Layer 2. A(s) has a real pole at β₀ and has no poles on Re s>β₀. The completed twisted function is entire, so the finite function vanishes there to at least the pole order.

Assume m≥2 and π is unitary cuspidal on GLm(Aℚ). π∞ is O(m)-spherical; L∞(s,π)=∏j Γℝ(s−μj). d=m², β₀=2 maxj Re μj; unitarity gives β₀∈[0,1). χ is a nonprincipal even character of prime conductor q>2, q∤fπ, where fπ is the standard conductor. β₀>0.

A route to the result is as follows. Use AutomorphicFormsOnReductiveGroups §2.6 unitarity to identify the multiset with its negative complex conjugate and genericity to give β₀<1. A maximal diagonal pair has argument s−2Re μj, which is zero at β₀. Gamma has no meromorphic zeros; no pole cancels another gamma pole, and none lies to the right. Use entire completion from the prime-twist functional equation and compare meromorphic orders. Interpret poles by germs or punctured limits: the totalized Complex.Gammaℝ value is zero at a pole and cannot be treated as infinite.

**Checks.**

- With real standard exponents {r,−r}, A(s) has shifts {2r,0,0,−2r}; for r=1/5 there is a pole at β₀=2/5.
- At β₀=0 the hypothesis β₀>0 fails and no contradiction is needed.
- At s=0, the totalized Γℝ is zero, while lims→0 sΓℝ(s)=2; meromorphic order −1, rather than that point value, forces finite-function vanishing.

(lrs95, Theorem 1.2 discussion pp.389–390 and proof p.395.)

*Needs:* §2.1; `Complex.Gammaℝ`; `Complex.Gammaℝ_eq_zero_iff`; `Complex.Gammaℝ_residue_zero`; `Complex.Gamma_ne_zero`; `Complex.differentiable_one_div_Gamma`; ZerosOfLFunctions Layer 1, item 5; AutomorphicFormsOnReductiveGroups §2.6.

### Examples

For a spherical rank-two example with parameters r,−r, the self-pair gamma shifts are 2r,0,0,−2r; at r=1/5 the rightmost pole is 2/5. The primitive twist at an unramified prime has degree d=4 in both the Gauss power and the conductor q⁴. A ramified place away from q is transported, not deleted.

### Dependencies

AutomorphicFormsOnReductiveGroups §2.6; AutomorphicLFunctionsAndLocalFactors AL.1–AL.3 for the canonical local and global factors, continuation and functional equations; the local self-pair positivity and analytic character and epsilon transport of §2.0, proved here on those factors; SmoothRepresentationsOfLocalGroups SR.2–SR.3 and SR.5.2 and AutomorphicSpectralTheory §7.0b, finite-place unitary-classification prefix, for §2.0; Mathlib nonvanishing of Γ; ZerosOfLFunctions Layer 1; Tau Ceti Wiener–Ikehara. This layer does not use the final parameter bound.

## Layer 3: Mellin cutoffs and the exact two-kernel identity

Both cutoffs are actual functions with explicitly convergent transforms on their integration lines. The estimates are uniform in q because the gamma ratio and cutoff depend only on the fixed π and β.

### 3.1 Mellin cutoff kernel

For φ:ℝ→ℂ define F₁(φ,x)=∫y>x φ(y)dy/y. For smooth φ with compact support in (0,∞) and x>0, prove F₁(φ,x)=mellinInv(2,s↦mellin(φ,s)/s)(x). The cutoff used in the moment satisfies mellin(φ,0)=1.

A route to the result is as follows. Use mellin and mellinInv conventions; these agree with the vertical complex contour integral after ds=i dt. For Re s>0, apply Fubini to the integral tail and integrate x^(s−1) from 0 to y, obtaining mellin(F₁(φ,·),s)=mellin(φ,s)/s. Compact positive support gives continuity and Mellin convergence of the tail on Re s=2; integration by parts in log y gives integrability of its transform on that line. Apply the mellinInv_mellin_eq with those hypotheses. Below the support the tail is exactly the multiplicative normalization, and above it the tail is zero.

The API proves the following facts.

- For every φ and x, F₁(φ,x)=∫Ioi(x) φ(y)/(y:ℂ)dy.
- For smooth compact positive support and x>0, F₁=mellinInv(2,mellin(φ,s)/s)(x).
- If a>0, φ(y)=0 for y<a, φ(y)/y is integrable on (0,∞), mellin(φ,0)=1 and 0<x≤a, then F₁(φ,x)=1.
- If φ(y)=0 for y>b and b≤x, then F₁(φ,x)=0.

**Checks.**

- For c>0 and φ_c(y)=φ(y/c), F₁(φ_c,x)=F₁(φ,x/c), by the substitution y=ct, which leaves dy/y unchanged. An ordinary dy tail would acquire the extra factor c.
- If φ vanishes below 1, φ/y is integrable on (0,∞) and mellin(φ,0)=1, F₁(φ,1/2)=1. The multiplicative mass is exactly one; ordinary unit dx mass would not imply this.
- If φ vanishes above 2, F₁(φ,3)=0. The integration tail misses the support and is zero.

(lrs95, Equations (3.6)–(3.7), Lemma 3.1 pp.395–396.)

*Needs:* `mellin`; `mellinInv`; `mellinInv_mellin_eq`; smooth compact cutoff estimates.

### 3.2 Dual Mellin kernel

For actual functions φ:ℝ→ℂ and G:ℂ→ℂ define F₂(φ,G,β,x)=mellinInv(2,s↦mellin(φ,−s)G(β−s)/s)(x). In application G is the ratio of §2.1, evaluated on the allowed line; no growth bound is part of the definition.

A route to the result is as follows. Reuse mellinInv for the contour integral, so the sign change mellin(φ,−s) and β−s remain visible. For G=1 use mellin_comp_inv and the first-kernel inversion API. The zero-function and zero-ratio cases follow from the zero integrand.

The API proves the following facts.

- F₂ equals the displayed inverse Mellin transform.
- G=0 gives F₂=0.
- For smooth compact positive-support φ, x>0 and G=1, F₂(φ,1,β,x)=F₁(φ∘inv,x).

**Checks.**

- For smooth compact positive-support φ, x>0 and G(w)=w, the integrand is mellin(φ,−s)(β/s−1), so F₂(φ,G,β,x)=βF₁(φ∘inv,x)−φ(1/x), by `mellin_comp_inv`, §3.1 for φ∘inv and Mellin inversion of φ∘inv. The orientation G(β+s) would give βF₁(φ∘inv,x)+φ(1/x); for φ supported in [3,4] the two differ wherever φ(1/x)≠0, which happens only for x in (1/4,1/3).
- For G=1, a multiplicatively normalized φ supported in [3,4] and x=1/5, F₂=F₁(φ∘inv,1/5)=1, because the reflected support [1/4,1/3] lies above 1/5. Dropping the factor 1/s would give the inverse transform φ(5)=0.
- For smooth compact positive support, G=1 and x=2, F₂=F₁(φ∘inv,2), detecting the sign of the Mellin argument. For a multiplicatively normalized φ supported in [3,4], the reflected support is [1/4,1/3], so the value at x=2 is zero, while the unreflected tail is one.

(lrs95, Equation (3.7), Lemma 3.1 p.396.)

*Needs:* §3.1; `mellin_comp_inv`; `mellinInv`.

### 3.3 Mellin cutoff estimates

For φ smooth with compact support in (0,∞), mellin(φ,0)=1, the Layer 2 gamma ratio G, β with 0<σ=Re β<1 and every ε>0, for each B>0 there is C_B>0 such that |Fᵢ(x)|≤C_B x^(−B) for x≥1 and i=1,2. F₁(x)=1 for sufficiently small positive x. For 0<x≤1, |F₂(x)|≤Cε(1+x^(1−β₀−σ−ε)); constants depend on π,β,φ,ε, not q or Y. Choose ε<1−β₀ when using the dual integral.

Assume m≥2 and π is unitary cuspidal on GLm(Aℚ). π∞ is O(m)-spherical; L∞(s,π)=∏j Γℝ(s−μj). d=m², β₀=2 maxj Re μj; unitarity gives β₀∈[0,1). φ is smooth, compactly supported in (0,∞), mellin(φ,0)=1. 0<Re β<1 and ε>0.

A route to the result is as follows. Integration by parts in log y makes k(s)=mellin(φ,s) entire and rapidly decreasing in vertical strips. Import the vertical-strip asymptotics of ZerosOfLFunctions Layer 1, items 3 and 5, for A(s) and A(1−s), with the gamma parameters of AutomorphicLFunctionsAndLocalFactors AL.1: the factors exp(−πd|t|/4) cancel, so the ratio G has polynomial strip growth away from its poles. Shift to the right for rapid decay, and to the left for near-zero behavior. The gamma-ratio poles have rightmost possible real part σ+β₀−1 and order at most d. The factor 1/s adds one to the order if a gamma pole coincides with zero. Absorb the resulting finite powers of |log x| into x⁻ε; this handles all repeated poles and the zero-pole collision when σ+β₀=1.

**Checks.**

- If σ+β₀=1, the estimate is Cε(1+x^(−ε)); a logarithm at x→0 is permitted, while a constant bound would fail for a collided pole.
- A gamma-ratio pole of order d=4 colliding with 1/s has order at most 5; the logarithm degree is at most 4 and is absorbed in every x^(−ε).
- For σ=1/2, β₀=2/5 and ε′=1/10 the dual-integral powers are x^(−1/2) and x^(−1/2); both integrate to 2 on (0,1).

(lrs95, Lemma 3.1 p.396, contour-shift proof.)

*Needs:* §§2.1 and 3.1–3.2; AutomorphicLFunctionsAndLocalFactors AL.1 Canonical archimedean factors; ZerosOfLFunctions Layer 1, items 3 and 5; `Complex.Gamma_ne_zero`; meromorphic orders and rectangle contour limits.

### 3.4 Approximate functional equation

For the Layer 2 data, smooth compact positive-support φ with mellin(φ,0)=1, 0<Re β<1 and Y>1, Lχ(β)=∑n≥1 b(n)χ(n)n⁻ᵝF₁(n/Y)+τπχ(f)τ(χ)^d(fq^d)⁻ᵝ∑n≥1 b(n)χ̄(n)n^(β−1)F₂(nY/(fq^d)). Both sums converge absolutely.

Assume m≥2 and π is unitary cuspidal on GLm(Aℚ). π∞ is O(m)-spherical; L∞(s,π)=∏j Γℝ(s−μj). d=m², β₀=2 maxj Re μj; unitarity gives β₀∈[0,1). χ is a nonprincipal even character of prime conductor q>2, q∤fπ, where fπ is the standard conductor. 0<Re β<1, Y>1, and the normalized φ of Layer 3.

A route to the result is as follows. Put k(s)=mellin(φ,s) and integrate k(s)Lχ(β+s)Y^s/s on Re s=2, exchange the absolutely convergent series and integral, and identify F₁. Shift to Re s=−1: the sole crossed pole is s=0 because the finite twisted Lχ is entire. Use the polynomial strip bound of ZerosOfLFunctions Layer 3, item 3, for the record of §2.1 finite-function analytic-data adapter, whose `continuedL` is the finite Lχ, together with rapid decay of k, to kill the horizontal contours. Boundedness of the completed Λ alone does not justify this step. Apply the functional equation, replace s by −s and shift the resulting integral to Re s=2 in the pole-free right region. Expanding Lχ̄(1−β+s) gives F₂ with the exact conductor and power of n. Use rapid kernel decay and the positive partial-sum bound from Layer 2 for absolute summability.

**Checks.**

- The choices Y=2 and Y=4 multiply the dual argument nY/(fq^d) by two; placing Y in the denominator would halve it.
- At β=1/2 the primal and dual n-powers are both n^(−1/2), but the characters are χ and χ̄ and the kernels differ.
- For the zero cutoff both kernels and the right side are zero, so the normalization mellin(φ,0)=1 excludes it from this identity.

(lrs95, Lemma 3.2 and its proof pp.396–397.)

*Needs:* §§2.1 and 3.1–3.3; AutomorphicLFunctionsAndLocalFactors AL.3, Hecke, eigensystem and Rankin–Selberg data, and §2.1 finite-function analytic-data adapter; ZerosOfLFunctions Layer 3, items 1–3.

### Examples

A smooth nonnegative nonzero cutoff supported inside [1,2] can be divided by its positive multiplicative integral. Then F₁(1/2)=1 and F₁(3)=0. For G=1 the reflected kernel is the tail of φ∘inv; at x=2 it is zero. The ordinary-integral example φ=1 on [1,2] and zero elsewhere is not smooth but has dx mass 1 and multiplicative mass log 2, showing why ordinary unit mass cannot justify a Mellin residue of one.

### Dependencies

Layer 2; Mathlib Mellin inversion; AutomorphicLFunctionsAndLocalFactors AL.1 gamma parameters, AL.3 Rankin–Selberg data and §2.1 finite-function analytic-data adapter; LFunctions Layer 0; ZerosOfLFunctions Layers 1 and 3; convergent contour calculus.

## Layer 4: Even prime twists and their first moment

The exact character identities precede estimates. First-moment nonvanishing is existence of a nonzero twist; the twisted values are complex and have no asserted positivity.

### 4.1 Even prime-twist average

For an actual family L(q,χ,s) of complex functions and natural fπ,Q define S(L,fπ,Q,β)=ΣQ<q≤2Q, q prime, q∤fπ Σχ≠1, χ(−1)=1 L(q,χ,β). This is a finite sum. Its analytic application uses the particular functions of §2.1, rather than arbitrary functions satisfying an unnamed predicate.

A route to the result is as follows. The index is the finite set of primes in Q<q≤2Q not dividing fπ, together with their even nonprincipal complex Dirichlet characters. Equality of families on these selected values gives equality of sums, and zero selected values give sum zero; these assertions make no analytic hypothesis about the family.

The API proves the following facts.

- Equals the finite sum over primes Q<q≤2Q with q∤fπ and even nonprincipal χ.
- Families equal at every selected (q,χ,β) have equal averages.
- If every selected value is zero then the average is zero.

**Checks.**

- Q=0 gives zero for every family and conductor. The dyadic interval is empty; Q=1 selects q=2 but its nonprincipal character set is empty. A generic conductor value fπ=0 excludes every prime and also gives zero, whereas the analytic conductor is positive.
- For L≡1, fπ=1 and Q=2 the average is zero; q=3 has no even nonprincipal character. The only selected prime is 3, with zero even nonprincipal characters.
- For L≡1, fπ=1 and Q=3 the average is one, coming from q=5. Only q=5 contributes, with exactly one selected character.
- For L≡1, fπ=5 and Q=3 the average is zero, since q=5 is excluded. The selected prime is excluded before summation.

(lrs95, Equation (3.4) and Proposition 3.1 p.395.)

*Needs:* finite complex `DirichletCharacter` carriers; natural dyadic intervals.

### 4.2 Even nonprincipal orthogonality

For prime q>2 and a∈Z/qZ, ∑χ even,χ≠1 χ(a) is 0 if a=0, (q−1)/2−1 if a=±1, and −1 otherwise. For Y>1 and the cutoff φ of §3.1, let the smoothed sum be the sum over these χ of Σn≥1 b(n)χ(n)n⁻ᵝF₁(n/Y), with the coefficient data of §2.1. This sum equals ((q−1)/2)∑n≡±1 mod q b(n)n⁻ᵝF₁(n/Y)−∑(n,q)=1 b(n)n⁻ᵝF₁(n/Y). The principal-character subtraction includes n≡±1.

Assume q>2 is prime; characters are complex Dirichlet characters extended by zero on nonunits.

A route to the result is as follows. Project the full character sum to even characters by (1+χ(−1))/2 and use the sum_characters_eq theorem at a and −a. Subtract the principal character, which is one on every nonzero class and zero at zero. Apply to each coefficient of the finite-support primal kernel.

**Checks.**

- For q=3 the even nonprincipal set is empty, and every class gives zero.
- For q=5 its unique member is the quadratic character: values at a=0,±1,±2 are 0,1,−1, matching the three branches.
- At n=1 and q=5 the coefficient is (5−1)/2−1=1; subtracting the principal character only outside ±1 would give 2.

(lrs95, Equation (3.11) and the principal-character subtraction in (3.12), p.397.)

*Needs:* §3.1; `DirichletCharacter.sum_characters_eq`; finite sum interchange.

### 4.2a Raw hyper-Kloosterman sums over every finite field

For any finite field F, commutative coefficient ring K, additive character ψ:F→K, natural k and unit r∈Fˣ, define `hyperKloosterman` as the sum of ψ(x₁+⋯+xₖ) over k-tuples of units with product r. Use Mathlib `AddChar F K` for ψ, so the trivial additive character is the constant one. The definition is total at k=0: the empty product gives value one at r=1 and zero otherwise. The deep estimate specializes K to ℂ and requires k≥1 and ψ≠1. Its statement includes every finite characteristic, including p=2 and ranks divisible by p.

The API proves the following facts.

- For k=1 the sum is ψ(r); the fibre contains exactly the one tuple (r).
- A field isomorphism transports both the character and the unit-product fibre, leaving the sum unchanged. A unital ring homomorphism K→K′ carries the sum to the sum with the transported character.
- Replacing ψ(x) by ψ(ax), a∈Fˣ, changes the argument r to aᵏr after scaling every coordinate by a.
- The trivial additive character gives the image in K of the integer (|F|−1)^(k−1) for k≥1, by freely choosing the first k−1 units and determining the last. This counts tuples, not a normalized trace.

**Checks.**

- At k=0 the values at r=1 and r≠1 are 1_K and 0_K; a definition that silently uses natural subtraction k−1 in the bound would mishandle this rank.
- Over 𝔽₂, ψ(0)=1 and ψ(1)=−1, every unit tuple has all coordinates one, and the raw sum at r=1 is (−1)ᵏ. Thus ranks 1 and 2 give −1 and 1, without excluding characteristic two.
- Over 𝔽₃ with the positive standard character, the rank-two values at 1 and −1 are −1 and 2. A sheaf trace convention with the factor −1 would reverse them.
- At k=3 over 𝔽₅ with trivial ψ, the value is 16, larger than the nontrivial-character bound 3·5=15; the nontriviality hypothesis is necessary.

(katz-gkm, §4.0, pp.47–48, raw product-fibre sums; katz-gkm line 1845 and line 1871.)

Eliminating the last variable gives the following comparison over every commutative K, including the zero ring: for n≥0, the sum over x:Fin n→Fˣ of ψ(Σᵢxᵢ+r(∏ᵢxᵢ)⁻¹) equals `hyperKloosterman` F (n+1) ψ r. The bijection appends the unit r(∏ᵢxᵢ)⁻¹; its inverse forgets that coordinate. Both composites are identities, since the product constraint determines the last unit and all these denominators are units. For complex coefficients, sqrt(|F|)^n=|F|^(n/2)=|F|^(((n+1)−1)/2), with the exponents read in ℝ and |F|≥2. This identifies both numerical normalizations without a coefficient embedding assumption on the raw sum.

**Checks.**

- For n=0 the eliminated sum and product-fibre sum both equal ψ(r); sqrt(|F|)^0=|F|^0=1.
- At n=1 over 𝔽₃ with the positive standard character, both presentations give −1 at r=1 and 2 at r=−1, and the two rank-two bounds both equal 2√3.
- Over K=ℤ and the trivial additive character, F=𝔽₃ and k=2 give 2, whose image in ℤ/2ℤ is 0. Over the zero ring every sum, including the rank-zero value at 1, is 0=1. A complex-only definition cannot express these coefficient comparisons.

*Needs:* Mathlib finite fields, units, `AddChar`, finite products and finite sums; positive-base real powers.

### 4.2b Kloosterman sheaves and the general Deligne estimate

**Global additive-character sheaf.** For every finite field F of characteristic p, prime ℓ≠p, coefficient number field E containing the character values with specified complex embedding and ℓ-adic place λ, and additive character ψ:F→Eˣ, construct the lisse rank-one Eλ-sheaf Lψ on A¹/F by character descent from the finite étale Lang torsor t↦t−t^|F|. Normalize its fibre at zero by the identity lift of zero. Prove that geometric Frobenius at x over every finite extension F′/F has trace ψ(Tr_F′/F(x)); the choice 1−Frob in the torsor fixes this direction. Equivalently write ψ(x)=ψ₀(Tr_F/𝔽_p(cx)) for c∈F and a fixed nontrivial prime-field character ψ₀, and compare with character descent from t−tᵖ=cx. Include the trivial character c=0; the nontriviality condition c≠0 is needed only for the infinity Swan calculation and the Kloosterman estimate (katz-gkm, §4.3, pp.59–60; katz-gkm line 2266, line 2279 and line 2288).

The API proves the following facts.

- Base extension to F′ identifies Lψ with the sheaf for ψ composed with Tr_F′/F, with the displayed trace over all further finite extensions.
- For regular phases a,b:X→A¹/F, the tensor product a*Lψ⊗b*Lψ is canonically (a+b)*Lψ; the zero trivialization fixes the unit and the comparisons are associative and symmetric. Also Lψ⊗Lψ′=Lψψ′.
- Finite monodromy makes the sheaf pure of weight zero at every specified complex embedding; a dual character gives its dual sheaf. For ψ≠1 its restriction to Gₘ is unramified at zero and has break one and Swan one at infinity, by ArithmeticGaloisRepresentations §3.7.

**Checks.**

- Over 𝔽₃ put ψ(1)=ζ=−1/2+i√3/2. At x=1 the geometric-Frobenius trace is ζ, whereas the inverse sheaf gives ζ²=−1/2−i√3/2; this distinguishes the sign of the Lang torsor. At x=0 the trace and chosen unit are both 1.
- Over 𝔽₉ the trace of 1 to 𝔽₃ is 2, so the same sheaf at x=1 has trace ζ² and norm 1. Using ψ(1)=ζ without the field trace would give the wrong extension law. The phases 1 and 1 give ζ·ζ=ζ², agreeing with the addition comparison.
- For ψ=1 the sheaf is constant, trace 1 and infinity Swan 0; for the nontrivial character over 𝔽₂ the trace at 1 is −1, the tensor square has trace 1 and infinity Swan is 1 before squaring and 0 afterwards. This tests characteristic two and excludes a nontrivial-Swan assertion for the trivial character.

*Needs:* EtaleCohomologyFoundations F.0.2 finite étale descent, F.4.5 rational realization and F.10 geometric Frobenius; SchemeAndStackFoundations §2.11 for the finite étale Artin–Schreier torsor; ArithmeticGaloisRepresentations §3.7 for the local break; DeligneWeightsAndPurity §0.1 for weight zero of roots of unity.

**Curve Euler–Poincaré.** For a smooth geometrically connected curve U over a perfect field k, with smooth proper completion C, a prime ℓ invertible in k and a lisse finite-dimensional Eλ-sheaf L, prove χ_c(U⊗k̄,L)=rank(L)χ_c(U⊗k̄,Eλ)−Σx∈C∖U deg_k(x)·Sw_x(L), where χ_c(U⊗k̄,Eλ)=2−2g(C)−Σx∈C∖U deg_k(x). The sums run over closed boundary points, with their residue degrees over k. In characteristic zero all Swan conductors are zero. Include the proper case U=C and compatibility with extension of the finite ℓ-adic coefficient field. Use the breaks of ArithmeticGaloisRepresentations §3.1. A route has four steps, each a part of this target. First, over k̄ of positive characteristic and on an affine U, start from the 𝔽_ℓ-coefficient formula of InverseGaloisAndArithmeticFundamentalGroups, Euler characteristic of ℓ-torsion local systems on affine curves: an 𝔽_λ-local system is an 𝔽_ℓ-local system of dimension multiplied by [𝔽_λ:𝔽_ℓ], with Swan conductor multiplied by the same degree. Choose a stable lattice in L; RΓ_c of the lattice is a perfect complex over the ring of integers of Eλ, so the Euler characteristic over Eλ equals that of its reduction modulo λ, and the Swan conductor of L equals that of its reduction because wild inertia acts through a finite p-group with p≠ℓ. Second, the proper case: for a nonempty U⊂C remove one closed point x of U, so that U∖{x} is affine; excision gives χ_c(U,L)=χ_c(U∖{x},L)+deg_k(x)·rank(L) geometrically, and L is lisse at x, so x contributes no Swan term. Third, characteristic zero, which the affine supplier target does not cover: for a connected Galois cover V→U with group Q trivialising the reduction of L, evaluate the Brauer character of RΓ_c(V,𝔽_ℓ) at the identity by the Riemann–Hurwitz formula for the smooth completion of V, and at the other ℓ-regular elements by the curve endomorphism trace formula; all ramification is tame, so the Swan modules vanish and the class is χ_c(U) times the free module. Fourth, pass to the geometric curve and group the boundary points into Galois orbits to recover the residue-degree weights (katz-gkm, §§2.0 and 2.3.1, pp.26 and 32; katz-gkm line 1117 and line 1352).

**Checks.**

- The constant rank-r sheaf on Gₘ has χ_c=r(2−0−2)−0=0. On P¹ the same formula gives 2r; omitting the boundary would give the wrong value 2r on Gₘ.
- A nontrivial tame Kummer sheaf on Gₘ has rank one, Swan sum zero and χ_c=0; it has no cohomology. The constant sheaf also has χ_c=0 but H_c¹ and H_c² each have dimension one, so Euler characteristic does not assert concentration.
- For Lψ(xᵃ) on A¹ with a≥1 and p∤a, the infinity Swan is a and χ_c=1−a. At a=1 this is 0, and at a=2 in odd characteristic it is −1; the tame-only formula would give 1 in both cases. Coefficient extension preserves these integers.
- Over 𝔽₃, remove from P¹ the degree-two point x²+1=0 and take Lψ(1/(x²+1)). Each geometric pole is simple, so its Swan is 1: the weighted contribution is 2·1=2 and χ_c=(2−2)−2=−2. After base extension there are two poles and 1+1=2; omitting residue degrees gives the wrong value −1.
- In characteristic zero the constant sheaf on Gₘ still gives χ_c=0 with zero Swan sum. Geometric connectedness matters: P¹ over 𝔽_q² viewed over 𝔽_q is connected but splits into two geometric components, giving χ_c=4 rather than the displayed single-component value 2.

*Needs:* EtaleCohomologyFoundations F.0–F.6, F.4.0 stable lattices and F.10.1–F.10.2b; ArithmeticGaloisRepresentations §3.1 and §3.7 for the Artin–Schreier checks; InverseGaloisAndArithmeticFundamentalGroups, Euler characteristic of ℓ-torsion local systems on affine curves, and §IG.0.T1 curve endomorphism trace; SchemeAndStackFoundations §3.2 Riemann–Hurwitz.

**Swan-constancy criterion.** Let S be an excellent noetherian scheme, ℓ a prime invertible on S, f:C→S a separated smooth morphism of relative dimension one, D⊂C a closed subscheme finite flat over S, j:U=C∖D→C and L a lisse Eλ-sheaf of constant finite rank r on U. Define the conductor function on geometric fibres by a_L(s)=Σx∈D_s̄(Sw_x(L|U_s̄)+r), counting geometric boundary points. On a fibre of residue characteristic zero the Swan conductors are zero and a_L(s)=r·#D_s̄. If a_L is locally constant, prove that (C,j₍!₎L) is universally locally acyclic over S. If f is also proper, prove that every Rⁱ(f∘j)₍!₎L is lisse and its formation commutes with base change. When the geometric boundary cardinality is locally constant, in particular for a finite étale boundary or disjoint sections, constancy of the Swan sum suffices. A route first proves the rational-adic version of the strict-local/trait test for ULA from the strict-local fibre comparisons, constructibility and the torsion criterion. After an excellent henselian-trait pullback T→S, the smooth curve C_T and its punctured open U_T are regular, hence normal. EtaleCohomologyFoundations F.4.5 therefore gives a lisse O_E-lattice on U_T; near a geometric fibre point one can also use its étale-local lattice theorem and F.2.3 source locality. This uses no global lisse lattice on U over S. For each such integral model the geometric wild inertia has finite p-power image, prime to ℓ, so its break multiplicities and Swan conductors survive reduction; ranks and the geometric boundary points are unchanged by the coefficient reduction. The conductor function pulls back to the same fibrewise values under T→S, so its local constancy is retained. Apply the torsion criterion at each reduction and pass by derived adic realization and rationalization to the strict-local comparisons. Independence of lattices up to local isogeny and F.2.3 locality descend those comparisons, also after arbitrary base change, giving ULA over S. This trait-detection and descent step is part of this target, with general rational coefficients. Under properness, F.3 proper base change and F.4.5–F.4.6 rational realization descend the lisse cohomology sheaves and their base-change isomorphisms (laumon-swan, Theorem 2.1.1, Corollary 2.1.2 and Remark 2.1.3, pp.185–187; laumon-swan line 391, line 396, line 413, line 423 and line 432; katz-gkm, proof of Proposition 5.2.1, pp.65–66, katz-gkm line 2469 and line 2486).

**Checks.**

- For the constant rank-one sheaf on A¹×S with compactification P¹×S and boundary ∞×S, including S=Spec ℤ[1/ℓ], the Swan sum is 0 and a_L=1 on every fibre. R²_c is Eλ(−1) of rank one, and the other compact cohomology ranks are zero. With empty boundary on P¹×S, a_L=0, R⁰ and R² each have rank one and R¹=0.
- On the nodal curve S=P¹/(0∼∞), take the rational line with loop multiplier ℓ and pull it back to A¹×S, with empty D. Its conductor is 0 on every fibre. Multiplication sends ℓᵃO_E to ℓᵃ⁺¹O_E≠ℓᵃO_E, so no global stable lattice exists, although the claimed ULA conclusion still applies. On every normal trait pullback a stable lattice exists; the local proof must not glue these into a global lattice on U.
- For Lψ(tx) on A¹_x×A¹_t the infinity Swan is 1 when t≠0 and 0 at t=0. Generic compact cohomology is zero, while the special fibre has dim H_c²=1. The conductor function is 2 generically and 1 at zero; the conclusion fails without its local constancy.
- For the multiplication family in coordinates (x,t), the fibre sheaf Kl_k(x)⊗Lψ(t/x), t≠0, has boundary Swans k and 1. Their Swan sum k+1 and conductor function 3k+1 are independent of t: the respective pairs are (2,4) at k=1 and (3,7) at k=2. The criterion therefore gives lissity on all of Gₘ, in characteristic two as well.
- In odd characteristic, take C=P¹×A¹_t, D defined by x²=t and L constant of rank one on C∖D. The boundary is finite flat, with two geometric points for t≠0 and one for t=0. Every Swan conductor is zero, but a_L changes from 2 to 1 and dim H_c¹ changes from 1 to 0; for a colliding boundary the rank term cannot be dropped.
- Properness is needed for the direct-image conclusion: for C=A¹_x×(A¹_t∖{0})→A¹_t, D empty and L constant of rank one, a_L=0 and the family is universally locally acyclic, but R²f₍!₎L has rank 1 for t≠0 and rank 0 at t=0. The local-acyclicity conclusion itself needs no properness.

*Needs:* EtaleCohomologyFoundations F.2.3 source/target locality, F.3 proper base change, F.4.0 stable lattices, F.4.5 étale-local lattices and the normal-scheme global-lattice theorem, F.4.6 rational-adic base change, and F.10.1–F.10.2b; ArithmeticGaloisRepresentations §3.1; the curve Euler–Poincaré target above for the cohomology-rank checks.

**Kloosterman realization.** For k≥1 and nontrivial ψ over F of characteristic p, construct the Kloosterman sheaf on Gₘ/F as R^(k−1)mult₍!₎(Lψ⊠⋯⊠Lψ), where mult:Gₘᵏ→Gₘ is coordinate multiplication and Lψ is the Artin–Schreier sheaf constructed in this subsection restricted to Gₘ. Coefficients are rationalized Eλ, with ℓ≠p, E containing ψ's values and the specified complex embedding. Prove that the other compact direct-image degrees vanish, that this sheaf is lisse of rank k, tame at zero, totally wild at infinity with Swan conductor one and pure of weight k−1, and that over every finite extension F′/F its geometric-Frobenius trace at r is (−1)^(k−1) times the raw sum for ψ composed with TrF′/F. The source and target of the construction are the rational constructible derived category on Gₘᵏ and that on Gₘ, respectively; the concentration theorem identifies the single lisse cohomology sheaf. The extension comparison specifies the family. One route is induction by multiplicative convolution. After writing ψ through a nontrivial prime-field character and field trace, its local monodromy at infinity is a nontrivial character of an Artin–Schreier extension αᵖ−α=a/t with a≠0; the geometric-Frobenius trace convention is that of the character-descent construction. ArithmeticGaloisRepresentations §3.7 gives its single break one and Swan one; on A¹ it is lisse, hence unramified at zero. For any two lisse finite-rank Eλ-sheaves F,G on Gₘ that are tame at zero and totally wild at infinity, define F*G=R¹mult₍!₎(F⊠G) on Gₘ. Establish the compact/ordinary comparison and duality, concentration of Rmult₍!₎(F⊠G) in degree one, and preservation of these local conditions. The fibre F(x)⊗G(t/x) has Swans rank(F)Sw∞(G) at zero and rank(G)Sw∞(F) at infinity; its H_c⁰ and H_c² vanish. Curve Euler–Poincaré gives rank(F*G)=rank(F)Sw∞(G)+rank(G)Sw∞(F), and the Swan-constancy criterion gives lissity. Compact/ordinary comparison and Künneth give H_c¹(F*G)=H_c¹(F)⊗H_c¹(G), whence the same curve formula gives Sw∞(F*G)=Sw∞(F)Sw∞(G). These are general convolution targets, before specialization to Kl_k and Lψ: their fibre Swans are k and 1, Euler characteristic −(k+1), new rank k+1 and infinity Swan 1·1=1. Purity raises the weight from k−1 to k, and the degree-one trace introduces one minus sign. Prove these general concentration and local-condition steps using compact/ordinary comparison and duality, before specializing their weight consequence (katz-gkm, §4.3 and Theorem 5.1(1)–(8), pp.59–76; katz-gkm line 2266, line 2392, line 2412, line 2424, line 2489 and line 2812).

To prove tameness of the convolution at zero, first work with finite coefficients. A prime-to-p Kummer pullback kills the finite tame inertia of both inputs, so that they extend lisse across zero. The Cartan–Leray spectral sequence for the finite étale Kummer torsor relates the pullback of the original compact direct image to the convolution of these pulled-back inputs; this uses descent, without assuming the Kummer degree is invertible in the coefficient ring. In coordinates (x,t), extend F(1/x)⊗G(tx) by zero to P¹×A¹. Apply the Swan criterion locally to obtain universal local acyclicity away from (∞,0). Over the strict henselization at t=0, the supplied inertia-equivariant specialization sequence then has its only possible vanishing-cycle term at that point. Since F(1/x) is lisse there, this term is F₀ tensored with the vanishing-cycle term for G(tx). Translation identifies the latter family's generic compact cohomology with constant cohomology. The sequence gives a unipotent inertia action, whose wild part is trivial because a finite p-group has no nontrivial unipotent action in characteristic ℓ≠p. Apply the descent spectral sequence, pass through coefficient change and rationalization, and descend the tame pullback. This proves the zero-boundary assertion before it is used to compute the output Swan at infinity (katz-gkm, Proposition 5.2.1 and its proof, Lemma 5.2.1.1 and Proposition 5.2.1.3, pp.67–71; katz-gkm line 2516, line 2528, line 2573, line 2616, line 2626 and line 2665).

Deduce `hyperKloosterman_bound`: for every finite field F, nontrivial `AddChar F ℂ`, k≥1 and r∈Fˣ, the norm of the raw sum is at most k|F|^((k−1)/2). Each eigenvalue has that weight and the trace has k terms. There is no parity, prime-field, or coprimality restriction between p and k. This bound, followed by the exact Gauss identity, is the finite-field input of the moment.

The API proves the following facts.

- Base extension replaces ψ by ψ composed with the field trace and leaves the rank k unchanged.
- The trace comparison uses geometric Frobenius and the sign (−1)^(k−1); the raw finite sum itself has no prefactor.
- Every complex absolute value of each Frobenius eigenvalue over F′ is |F′|^((k−1)/2); triangle inequality gives the displayed bound for that extension as well.

**Checks.**

- At k=1 the sheaf is Lψ on Gₘ, the sign is +1 and both the trace norm and the bound are 1. At infinity αᵖ−α=a/t has break one and Swan one even for p=2; the trivial character instead has Swan zero and is excluded.
- Convolving ranks one and one gives fibre Swans 1,1, χ_c=−2, rank two and output Swan 1; ranks two and one give 2,1, χ_c=−3, rank three and output Swan 1. For Kl₂ and Kl₃ the general formulas give rank 2·1+3·1=5 and Swan 1, whereas multiplying the input ranks would give 6. A tame constant input has Swan zero and is outside the totally-wild hypothesis.
- At k=2,F=𝔽₃,r=1, the raw sum is −1, the sheaf trace is +1 and its norm satisfies 1≤2√3. At r=−1 the raw sum is 2 and the trace is −2.
- At k=2 over 𝔽₂, the raw sum is 1, its trace is −1 and 1≤2√2; excluding p=2 would lose this case.
- At k=0,F=𝔽₂,r=1 the raw sum is 1 but the proposed right side would be zero; the positive-rank binder cannot be omitted.
- Rank and lissity on Gₘ do not force tameness: Lψ(1/t)⊕1 has rank two and Swan at zero 1, whereas Kl₂ has rank two and Swan at zero 0, including p=2 and p=3. The specialization-sequence argument excludes this wild alternative; the rank formula alone does not.

(katz-gkm, Theorem 4.1.1(1)–(2), pp.48–49; katz-gkm line 1892 and line 1902, specialized to all multiplicative characters trivial and all exponents bᵢ=1. These bᵢ are prime to every p, so the rank remains k without any restriction on k.)

*Needs:* §4.2a; the curve Euler–Poincaré and Swan-constancy targets of this subsection; LefschetzPencilsAndVanishingCycles §§0.5–0.8 for nearby cycles, the inertia-equivariant specialization sequence, coefficient change and rational realization; ArithmeticGaloisRepresentations §§3.1 and 3.7; EtaleCohomologyFoundations F.0–F.6 and F.10.1–F.10.2b; DeligneWeightsAndPurity §7.12 and the additive-character sheaf constructed in this subsection; finite-dimensional complex trace and the triangle inequality.

### 4.3 Gauss-power average

For q>2 prime, k≥1, r∈(Z/qZ)×, τ(χ)=gaussSum(χ,stdAddChar), and the unnormalized supplied hyper-Kloosterman sum Klk(r,q) over k units of product r, ∑χ even,χ≠1 χ̄(r)τ(χ)^k=((q−1)/2)(Klk(r,q)+Klk(−r,q))−(−1)^k. Its norm is at most (q−1)k q^((k−1)/2)+1, hence O_k(q^((k+1)/2)).

Assume q>2 is prime; k≥1; r is a nonzero unit.

A route to the result is as follows. Expand the k-th power of the finite Gauss sum. Orthogonality selects tuples whose product is r or −r. Subtract the principal-character Gauss sum τ(1)=−1. Match the unit tuple fiber exactly to the supplied raw unit-fibre hyper-Kloosterman sum. Apply §4.2b’s general Deligne bound for nonzero arguments and the standard nontrivial additive character. Triangle inequality gives the displayed constant; no zero-argument extension or normalized sheaf trace is substituted.

The uniform norm estimate is the headline `gauss_power_even_average_bound` in `Suggested.lean`, for q prime with q>2, k≥1 and r∈(ℤ/qℤ)ˣ, in namespace `TauCetiRoadmap.CongruenceSpectralGap`. Its real power uses (k−1)/2 in ℝ. The prime, parity, positive-rank and unit-argument hypotheses agree exactly with that signature.

**Checks.**

- For q=3,k=1,r=1, Kl₁(1)+Kl₁(−1)=−1 and the right side is −1−(−1)=0, agreeing with the empty character sum.
- For q=3,k=2,r=1, Kl₂(1)=−1 and Kl₂(−1)=2, so the right side is (−1+2)−1=0. The sign of the principal correction is essential.
- For q=5,k=2 the even quadratic Gauss sum is √5; its square times χ(r) is 5 at r=1 and −5 at r=2, and both have norm 5≤8√5+1.
- Rank k=0 is excluded because the norm bound fails there, although the identity persists: at q=7 and r=1 there are two even nonprincipal characters, so the left side is 2, and the right side is 3(1+0)−1=2, while (q−1)·0·q^(−1/2)+1=1<2. Nonunit r is excluded before inversion.

(lrs95, Equations (3.18)–(3.20) p.398.)

*Needs:* §4.2; `gaussSum`; `ZMod.stdAddChar`; `ZMod.isPrimitive_stdAddChar`; §§4.2a–4.2b.

### 4.4 Prime-twist average asymptotic

For fixed π as in Layer 2, β with 0<σ=Re β<1 and every ε>0, as Q→∞ through positive integers, S(Lχ,fπ,Q,β)=(1/2)∑Q<q≤2Q,q prime,q∤fπ q+Oπ,β,ε(Q^(1+(d+1)(1−σ)/2+ε)). The main term is asymptotic to (3/4)Q²/log Q.

Assume m≥2 and π is unitary cuspidal on GLm(Aℚ). π∞ is O(m)-spherical; L∞(s,π)=∏j Γℝ(s−μj). d=m², β₀=2 maxj Re μj; unitarity gives β₀∈[0,1). 0<Re β<1; ε>0; π and β are fixed.

A route to the result is as follows. Choose a multiplicatively normalized smooth compact cutoff and apply the two-kernel identity with Y=Q^((d+1)/2), valid for large Q and satisfying Y/Q→∞ and Y/Q^d→0. Even orthogonality isolates n=1, giving the main term up to O(Q). For n≥2 the number of primes dividing n−1 or n+1 is bounded by τ(n−1)+τ(n+1); use the AnalyticNumberTheoryPartI §3.26 divisor subpower bound, not a false pointwise bound for b(n). Partial summation with ∑n≤x b(n)≪πx gives primal error O(QY^(1−σ+ε)). The subtraction over all coprime n has the same or smaller bound. For the dual term, put r=n/f mod q for q∤n and k=d in the Gauss-power identity; the q|n terms vanish because χ(n)=0. Partial summation bounds the kernel integral by O(Q^(1+(d+1)/2)Y⁻σ); near zero the integrand is bounded by x^(σ−1)+x^(−β₀−ε′), integrable for ε′<1−β₀. Combine the errors and absorb the smoothing exponent into the ε. PNT and Abel summation give the dyadic prime sum ∼(3/2)Q²/log Q; deleting finitely many bad primes changes no asymptotic.

**Checks.**

- For d=4 and σ=9/10 the error exponent is 1+5/20=5/4, strictly below 2.
- For d=9 and σ=4/5 the exponent is 2; at σ=9/10 it is 3/2. This pins the strict boundary used in §4.5.
- The dyadic integral (1/2)∫Q^(2Q)t/log t dt has leading coefficient (1/2)((4−1)/2)=3/4. A coefficient 1/2 is wrong.
- For n=1 separate the main term before counting divisors of n−1=0; every prime divides zero, so the divisor-count argument cannot be used there.

(lrs95, Proposition 3.1 p.395, proof pp.397–399.)

*Needs:* §§2.1, 3.3–3.4 and 4.1–4.3; AnalyticNumberTheoryPartI §3.26; `TauCeti.primeCount_univ_isEquivalent_div_log` at ℚ and rational prime-ideal norm identification; ArithmeticDirichletSeries Layer 6.

### 4.5 Twisted Rankin–Selberg nonvanishing

For fixed π as in Layer 2 and every β with 1−2/(m²+1)<Re β<1, every sufficiently large dyadic prime interval contains q∤fπ and an even nonprincipal χ modulo q for which L(β,(π⊗χ)×π̃)≠0. In particular such conductors are unbounded.

Assume m≥2 and π is unitary cuspidal on GLm(Aℚ). π∞ is O(m)-spherical; L∞(s,π)=∏j Γℝ(s−μj). d=m², β₀=2 maxj Re μj; unitarity gives β₀∈[0,1). 1−2/(m²+1)<Re β<1.

A route to the result is as follows. Choose ε>0 less than 2−[1+(d+1)(1−Re β)/2]. The asymptotic error divided by Q²/log Q tends to zero. Thus the complex average is nonzero for large Q. If every summand were zero its finite sum would vanish, so extract one nonzero term. No positivity of the twisted values is asserted.

**Checks.**

- For m=3 the left boundary is 1−2/10=4/5 and is excluded; β=9/10 lies in the region.
- For m=2 the boundary is 3/5; at equality the main error exponent is 2 and cannot be dominated by Q²/log Q.
- The two complex terms 1+i and −1 have nonzero sum i; extracting one nonzero term is valid without positivity, while existence does not imply every term is nonzero.

(lrs95, Proposition 3.1 and proof of Theorem 1.2 p.395.)

*Needs:* §§4.1 and 4.4; comparison of real powers with Q²/log Q.

### Examples

At q=5 the sole even nonprincipal character is quadratic, so its values on 1 and 2 are 1 and −1, its Gauss sum is √5 and the k=2 average is ±5. At q=3 the even nonprincipal average vanishes. For the dyadic prime family L≡1, Q=3, fπ=1 the average is 1; changing fπ to 5 makes it zero.

### Dependencies

Layers 2–3; Mathlib characters and Gauss sums; ArithmeticGaloisRepresentations §§3.1 and 3.7; InverseGaloisAndArithmeticFundamentalGroups, Euler characteristic of ℓ-torsion local systems on affine curves; EtaleCohomologyFoundations F.0–F.6 and F.10; LefschetzPencilsAndVanishingCycles §§0.5–0.8; DeligneWeightsAndPurity §§7.12 and DWP.10; AnalyticNumberTheoryPartI §3.26; Tau Ceti prime counting; ArithmeticDirichletSeries Layer 6.

## Layer 5: The parameter bound and congruence gap

The contradiction uses the strict nonvanishing region and produces a weak parameter bound. The GL₃ adjoint, including its spherical property and cuspidality, is what yields the geometric constant 21/100.

### 5.1 Luo–Rudnick–Sarnak parameter bound

For m≥2 and unitary cuspidal π of GLm(Aℚ) with O(m)-spherical π∞ and L∞(s,π)=∏j Γℝ(s−μj), every j satisfies |Re μj|≤1/2−1/(m²+1). No general nonspherical or number-field version is asserted.

Assume m≥2 and π is unitary cuspidal on GLm(Aℚ). π∞ is O(m)-spherical; L∞(s,π)=∏j Γℝ(s−μj). d=m², β₀=2 maxj Re μj; unitarity gives β₀∈[0,1).

A route to the result is as follows. Assume β₀>1−2/(m²+1). Generic unitary classification gives β₀<1, so twist-nonvanishing applies at the real point β=β₀. Archimedean trivial zero gives zero for every even prime twist there, contradicting the extracted nonzero twist. Hence β₀≤1−2/(m²+1). The unitary multiset symmetry bounds the negative real parts too. Divide by two and obtain the weak inequality; the boundary is not excluded by the strict nonvanishing region.

**Checks.**

- For m=3, 1/2−1/10=2/5.
- For m=2, 1/2−1/5=3/10, yielding only λ≥1/4−9/100=4/25 directly.
- Equality β₀=1−2/(m²+1) is outside the strict contradiction region; the conclusion is a weak inequality.

(lrs95, Theorem 1.2 p.389 and its proof p.395.)

*Needs:* §§2.2 and 4.5; AutomorphicFormsOnReductiveGroups §2.6 generic unitary classification.

### 5.2 Exceptional eigenvalue arithmetic

For r≥0 with 2r≤2/5, one has r≤1/5 and 1/4−r²≥21/100.

Here r is real, r≥0 and 2r≤2/5; there is no claim for negative r.

A route to the result is as follows. Divide the linear bound by two. Squaring preserves it because both sides are nonnegative; subtract from 1/4.

**Checks.**

- At r=1/5, 2r=2/5 and λ=21/100.
- At r=0, λ=1/4; at r=3/10, λ=4/25 and the hypothesis 2r≤2/5 fails.
- The sign hypothesis r≥0 matters: r=−1 satisfies 2r≤2/5 but gives λ=−3/4.

(lrs95, §1 pp.389–390, deduction of Theorem 1.1 from Theorem 1.2.)

*Needs:* real order, squaring nonnegative reals and rational arithmetic.

### 5.3 Congruence spectral gap

For every congruence subgroup Γ≤SL₂(ℤ), equivalently its effective image in PSL₂(ℤ), λ′₁(Γ)≥21/100 in curvature −1. This includes arbitrary congruence levels and the empty small-spectrum convention.

Assume Γ≤SL₂(ℤ) contains Γ(N) for some N≥1; its effective image acts on ℍ. Metric ds²=(dx²+dy²)/y² has curvature −1; all functions are complex-valued.

A route to the result is as follows. Every 0<λ<1/4 is cuspidal by the congruence spectral description. Apply the exceptional dictionary and the adjoint parameter comparison. The m=3 instance of the spherical parameter bound gives 2r≤2/5. The arithmetic of §5.2 gives λ≥21/100. The continuous threshold 1/4 is also ≥21/100. Use the Rayleigh–clipping comparison and the lower-infimum API to combine these cases without choosing a nonexistent least eigenfunction.

Prove `congruence_eigenvalue_bound`, the same bound in classical eigenfunction form on the native carriers: let Γ≤SL₂(ℤ) satisfy `CongruenceSubgroup.IsCongruenceSubgroup Γ`, let u:ℂ→ℂ be C² on the open upper half-plane, invariant under the Möbius action of every element of Γ on ℍ, bounded on ℍ and not constant on ℍ, and let λ be real with −y²(Δu)(z)=λu(z) at every z∈ℍ, where Δ is Mathlib's Laplacian on the real inner product space ℂ, that is ∂ₓ²+∂ᵧ². Then λ≥21/100 (lrs95, Theorem 1.1 p.387). A route: u descends to a bounded measurable function on XΓ, hence to an L² class since μΓ(XΓ)<∞ (§0.1). Its distributional expression is the class of λu, which lies in L², so by the maximal-domain identification of §0.2 u lies in Dom ΔΓ and ΔΓu=λu. If λ=0, the kernel characterization of §0.2 makes u almost everywhere constant, hence constant on ℍ by continuity, which is excluded. If λ≠0, self-adjointness and ΔΓ1=0 give λ∫u dμΓ=⟨1,ΔΓu⟩=⟨ΔΓ1,u⟩=0, so u lies in HΓ⁰ (§0.3). It is a nonzero class, being continuous and nonzero on an open subset of ℍ, whose image has positive μΓ-measure. The last API fact of §0.4 gives λ=Re⟨u,ΔΓu⟩/‖u‖₂²≥λ′₁(Γ), and the bound above concludes. The boundedness hypothesis loses no small eigenvalue: by §0.6 an eigenvalue in (0,1/4) has an eigenfunction in `MaassCuspForm(Γ,λ)`, which is smooth and, through §0.5a, a cusp form in the sense of ArithmeticLocallySymmetricSpaces ALS.F.6(iii), hence bounded.

**Checks.**

- The rational comparisons are 3/16=75/400, 21/100=84/400 and 1/4=100/400; the improvement is 9/400.
- An empty small spectrum gives λ′₁=1/4≥21/100.
- Level zero does not witness congruence, and a finite-index noncongruence subgroup does not satisfy the theorem hypothesis.
- For the eigenfunction form at Γ=SL₂(ℤ), the constant function 1 satisfies every hypothesis except nonconstancy, and its equation −y²Δ1=λ·1 forces λ=0<21/100; nonconstancy is necessary.
- Boundedness is necessary: the level-one Eisenstein series E(z,3/2)=Σ Im(γz)^(3/2), over Γ∞\SL₂(ℤ), converges absolutely and is invariant, smooth and nonconstant, with −y²ΔE=(3/2)(1−3/2)E=−(3/4)E. It grows like y^(3/2) in the cusp, and −3/4<21/100.
- The sign of the equation is fixed by y^s=(Im z)^s, which is not invariant but tests the convention: Mathlib's Laplacian gives s(s−1)y^(s−2), so −y²Δy^s=s(1−s)y^s, and s=1/2+it gives 1/4+t². With +y² in place of −y² every eigenvalue would change sign: the continuous threshold 1/4 would become −1/4, and no positive lower bound could hold.

(lrs95, Theorem 1.1 p.387; GL₃ reduction pp.389–390; proof of Theorem 1.2 p.395; bms02, Corollary 2.10, p.7, bms02 line 245, for the maximal domain used by the eigenfunction form.)

*Needs:* §§0.6–0.7, 1.1–1.3 and 5.1–5.2. The eigenfunction form also needs §§0.1–0.4, including the maximal domain of §0.2; `CongruenceSubgroup.IsCongruenceSubgroup`; `UpperHalfPlane.SLAction`; `InnerProductSpace.instLaplacian`.

### 5.4 Congruence Rayleigh inequality

For allowed Γ and every u in its closed Dirichlet form domain with ∫u dμΓ=0, q(u,u)≥(21/100)‖u‖₂². On the operator domain this reads Re⟨u,Δu⟩≥(21/100)‖u‖₂². It includes u=0.

Assume Γ≤SL₂(ℤ) contains Γ(N) for some N≥1; its effective image acts on ℍ. Metric ds²=(dx²+dy²)/y² has curvature −1; all functions are complex-valued. u belongs to the closed form domain and has complex mean zero.

A route to the result is as follows. For nonzero operator-domain u, its Rayleigh value is at least the positive spectral bottom and use the congruence gap theorem; zero gives equality. Approximate form-domain vectors in energy norm by the spectral truncations of §0.4. Subtract their constant projections to preserve mean zero and pass to the limit.

**Checks.**

- For u=0 both sides are zero; the inequality includes this vector without division by its norm.
- At a hypothetical normalized equality eigenvector with λ=21/100, both sides are 21/100; replacing it by 2iu makes both sides 21/25.
- For the nonzero constant 1 the energy is zero but (21/100)‖1‖²=(21/100)μΓ(XΓ)>0, so omitting mean zero makes the inequality false.

(lrs95, Theorem 1.1, p.387; teschl, §4.3, Theorem 4.10 and its form-domain version, p.119; teschl line 5044.)

*Needs:* §§0.2–0.4 and 5.3; UnboundedOperators UO-D06 and §0.4 spectral truncation; AutomorphicSpectralTheory §§0.6–0.7.

### 5.5 Curvature rescaling comparison

For κ>0, replace g−1 by gκ=κ⁻¹g−1. Then curvature is −κ, μκ=κ⁻¹μ−1, Δκ=κΔ−1, the Dirichlet energy in dimension two is unchanged, and λ′₁,κ=κλ′₁,−1 with continuous threshold κ/4. Hence λ′₁,κ/κ≥21/100. Multiplying the unscaled inequality by κ gives the corresponding scalar lower bound.

Assume κ>0 and Γ is a congruence subgroup; the metric is a constant rescaling of the specified hyperbolic metric.

A route to the result is as follows. Compute the specialized constant scaling in the imported metric/gradient and volume-density coordinates: the inverse metric multiplies by κ and the two-dimensional volume by κ⁻¹; the Levi-Civita connection is unchanged under constant metric scaling, so sectional curvature multiplies by κ. Transport L² by constant normalization and identify the same closed form and scaled operator. Use the gradient, connection and volume definitions of DifferentialGeometry Layer 12 for this specialized calculation. Both operator/form Rayleigh quotients scale by κ; constants and mean-zero subspaces correspond. Take infima and rescale the threshold.

**Checks.**

- At κ=1 all measure, operator, threshold and gap factors are unchanged.
- At κ=4, μκ=μ/4, Δκ=4Δ, the energy is unchanged, the threshold is 1 and the lower gap is 21/25.
- For a normalized vector of norm squared 1 and energy 21/100, the same function has new norm squared 1/4 and energy 21/100, hence Rayleigh value 21/25.
- κ=0 and κ<0 do not define the stated Riemannian scaling; division by κ requires κ>0.

(lrs95, §1, pp.387–390; teschl, §4.3, Theorem 4.10, p.119; teschl line 5044.)

*Needs:* §§0.1–0.4 and 5.3–5.4; DifferentialGeometry Layer 12; UnboundedOperators UO-D06; AutomorphicSpectralTheory §§0.6–0.7.

### Examples

The exact numerical chain is 3/16<21/100<1/4, with difference 9/400 and 1/4−(1/5)²=21/100. Under curvature −4 the gap is at least 21/25 and its continuous threshold is 1. The independent consumer arithmetic (21/100)(π/3)/(8π)=7/800 uses level-one area but does not assert a conformal-area theorem here.

### Dependencies

Layers 0–4; AutomorphicFormsOnReductiveGroups §2.6; UnboundedOperators UO-D06 and §0.4 spectral truncation; DifferentialGeometry Layer 12 for the constant-scaling calculation; Mathlib's Laplacian and the action of SL₂(ℤ) on ℍ for the eigenfunction form.

## Downstream consumers

Finite-area conformal and area arguments consume the form-domain inequality, with the exact hyperbolic metric, whole complex mean-zero condition and scale factor. Arithmetic applications to congruence covers consume the spectral bound and principal/intermediate-level compatibility. GeometricFreyMazur consumes the normalization-fixed gap together with its independent area and conformal-area inputs. KloostermanMomentsAndPotentialAutomorphy consumes the raw scalar sum and all-rank sheaf realization. The comparison in §4.2a identifies the eliminated-variable sum used by PadicDifferentialEquationsAndRigidCohomology RD.6.95 with `hyperKloosterman` at k=n+1, and identifies its sqrt(|F|)^n normalization with the real power in `hyperKloosterman_bound`. Its rigid realization is independent of the ℓ-adic realization here. EtaleDualityAndPerverseSheaves §5.2 consumes the curve Euler–Poincaré formula of §4.2b in its algebraically closed case, for coefficients in a finite extension Eλ and their extensions; its finite-cover transport and the Leray-sheaf conductor estimates for Betti growth in étale towers are its own. AutomorphicSpectralTheoryPartII consumes the congruence gap for its Schwartz multiplier applications. No area/index or conformal-area comparison is asserted by the spectral estimate alone.

## Worked examples

The definition families, the curve conductor inputs and the Kloosterman sheaf construction have the discriminating checks in their own sections. The final numerical chain and the Gauss examples also fix the two source conventions. The cutoff is normalized by its multiplicative mass, mellin(φ,0)=1, rather than ordinary unit mass. The principal-character subtraction of §4.2 runs over every n coprime to q, including n≡±1; at n=1,q=5 the exact coefficient is 1 rather than 2. These conventions leave Proposition 3.1's main term and the final constant unchanged. The exact formulas and their numerical witnesses determine the normalization.

The unscaled and scaled Rayleigh witnesses must agree: with ‖u‖²=1 and q(u,u)=21/100, the metric g/4 gives ‖u‖²=1/4, the same energy and quotient 21/25. Constants still have zero energy and fail the mean-zero hypothesis. This distinguishes metric scaling from multiplying the measure alone.

## References

- **lrs95.** Wenzhi Luo, Zeev Rudnick and Peter Sarnak, *On Selberg's eigenvalue conjecture*, Geometric and Functional Analysis 5 (1995), 387–401, [published citation](https://doi.org/10.1007/BF01895672). Theorem 1.1 p.387, Theorem 1.2 pp.389–390, Lemma 2.1 pp.392–394, (3.6)–(3.7) and Lemmas 3.1–3.2 pp.395–397, (3.11)–(3.12) p.397, (3.18)–(3.20) p.398 and Proposition 3.1 pp.395–399.
- **rs96.** Zeev Rudnick and Peter Sarnak, *Zeros of principal L-functions and random matrix theory* (1996), [institutional manuscript](https://empslocal.ex.ac.uk/people/staff/mrwatkin/zeta/rudnick-sarnak.pdf), Appendix §5.2, (5.4)–(5.14), Lemma 5.1 and the subsequent nonnegativity deduction, manuscript pp.52–55 (rs96 line 3181, line 3254, line 3302 and line 3339).
- **gj78.** Stephen Gelbart and Hervé Jacquet, *A relation between automorphic representations of GL(2) and GL(3)*, Annales scientifiques de l’École Normale Supérieure 11 (1978), 471–542, [Numdam](https://www.numdam.org/article/ASENS_1978_4_11_4_471_0.pdf). Definition 3.1.3 and Proposition 3.2 pp.485–486; §3.7 p.491; Theorem 9.3 and Remark 9.9 pp.534–541. The local adjoint convention and self-twist branch are located at gj78 line 528, line 538 and line 721.
- **katz-gkm.** Nicholas M. Katz, *Gauss Sums, Kloosterman Sums, and Monodromy Groups*, Annals of Mathematics Studies 116 (1988), [author scan](https://web.math.princeton.edu/~nmk/Katz-GKM.pdf), §2.3.1 p.32 (katz-gkm line 1352), §4.0 pp.47–48 and Theorem 4.1.1 pp.48–49 (katz-gkm line 1845, line 1871 and line 1902); Proposition 5.2.1 and its proof pp.65–71 (katz-gkm line 2460, line 2489, line 2528, line 2616 and line 2665); §5.2.4 p.76 (katz-gkm line 2812 and line 2816).
- **bms02.** Maxim Braverman, Ognjen Milatovic and Mikhail Shubin, *Essential self-adjointness of Schrödinger type operators on manifolds*, Russian Mathematical Surveys 57:4 (2002), 641–692, [arXiv:math/0201231v3](https://arxiv.org/abs/math/0201231v3). §2.1, p.4, minimal and maximal operators (bms02 line 151); Assumption B, p.5 (bms02 line 196); Corollary 2.10, p.7, essential self-adjointness of D⁎D for a complete metric (bms02 line 245); numbering of the arXiv text.
- **teschl.** Gerald Teschl, *Mathematical Methods in Quantum Mechanics*, [author text](https://www.mat.univie.ac.at/~gerald/ftp/book-schroe/schroe.pdf), author-hosted 12 February 2009 edition, GSM 99: §2.3, Theorems 2.12–2.13 pp.70–72 (teschl line 2914 and line 2960); §4.3, Theorem 4.10 and the form-domain observation p.119 (teschl line 5044 and line 5053). The quotient-chart and cusp-cutoff arguments above are specializations requiring their stated geometry, not assertions that this textbook constructs an orbifold Laplacian.
- **laumon-swan.** Gérard Laumon, *Semi-continuité du conducteur de Swan (d’après P. Deligne)*, Astérisque 82–83 (1981), 173–219, [Numdam](https://www.numdam.org/item/AST_1981__82-83__173_0/). Theorem 2.1.1, Corollary 2.1.2 and Remark 2.1.3, pp.185–187 (laumon-swan line 395, line 413, line 423 and line 432).
