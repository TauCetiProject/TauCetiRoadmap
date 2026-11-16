# Roadmap: weighted perimeter, Gaussian isoperimetry and clusters

**Summary.** Build weighted perimeter theory on a finite-dimensional real inner product space for every positive density `e^{−W}` with `W` of class `C¹`, and use it to prove the Gaussian isoperimetric theorem in the language of clusters. The weighted layer defines weighted variation and perimeter by duality with test vector fields, identifies them with the `e^{−W}`-weighted Hausdorff measure of the reduced boundary supplied by Euclidean De Giorgi theory, and proves invariance, lower semicontinuity, compactness, a weighted Gauss–Green formula and weighted coarea formulas. On it rest `q`-clusters, their interface decomposition, isoperimetric profiles and the existence of minimizing clusters for every probability density. For the standard Gaussian measure `γ` the roadmap constructs the model simplicial clusters, proves that their measure map is a diffeomorphism onto the open simplex and that the model profile satisfies the matrix differential equation `∇²I_m = −L_{A}^{−1}`, develops Ehrhard symmetrisation of sets of finite Gaussian perimeter, and proves that half-spaces are, up to null sets, the unique minimizers of Gaussian perimeter at prescribed measure in every dimension. The end theorems are this single-bubble theorem with its equality case and its two-cell cluster form, the Borell–Sudakov–Tsirelson enlargement inequality for every Gaussian measure on a Euclidean space, Bobkov's functional inequality, sharp concentration of Lipschitz functions about a median, and Ehrhard's inequality for convex sets.

The README is definitive. [Suggested.lean](Suggested.lean) states the headline theorems against the pinned Mathlib and Tau Ceti: `gaussian_isoperimetric` (§7.3), `isoperimetricProfile_two_eq` and `Cluster.perimeter_eq_iff_halfSpaces` (§7.4), `borell_sudakov_tsirelson` and `borell_sudakov_tsirelson_multivariateGaussian` (§8.1), `gaussian_minkowskiContent_ge` (§8.2), `bobkov_inequality` (§8.3), `gaussian_concentration_median` (§8.4), `gaussian_max_concentration` (§8.5), `ehrhard_inequality_convex` and `convex_closedGaussianSymmetral` (§9.5), with the deep results of the weighted, cluster and model layers: `weightedVariation_eq_lintegral_variationMeasure` and `weightedPerimeter_eq_lintegral_reducedBoundary` (§2.2), `integral_weightedDivergence_eq_integral_reducedBoundary` (§2.5), `weightedVariation_eq_lintegral_weightedPerimeter` (§2.6), `exists_cluster_perimeter_eq_isoperimetricProfile` (§3.5), `modelMeasureMap_diffeomorph` (§4.3), `modelProfile_hessian` (§4.6), `isoperimetricProfile_le_modelProfile` (§4.7) and `gaussianPerimeter_gaussianSymmetral_le` (§6.6).

## Scope and ownership

This roadmap owns: the weighted variation and weighted perimeter of a positive `C¹` density and their basic theory (Layer 2); clusters, interfaces, isoperimetric profiles and existence of minimizing clusters for such densities (Layer 3); the Gaussian isoperimetric function, its tail bounds and the two splitting identities of §1.3 (Layer 1); the canonical and general simplicial clusters, their measure map and the model profile (Layer 4); one-dimensional Gaussian isoperimetry (Layer 5); Gaussian symmetrals of measurable sets and Ehrhard symmetrisation of sets of finite Gaussian perimeter (Layer 6); the Gaussian isoperimetric theorem with its equality case (Layer 7); its integrated, Minkowski-content, functional and concentration forms (Layer 8); Gaussian symmetrals of closed sets and Ehrhard's inequality for convex sets (Layer 9). Tau Ceti's `TauCeti.perimeter μ Ω U` takes a measure parameter but pairs `χ_U` with the ordinary divergence; for `μ = γ` it is not the Gaussian perimeter of Layer 2 (§2.1, third Check).

Already in the library and used, not stated again: the standard Gaussian measure `ProbabilityTheory.stdGaussian` on every finite-dimensional real inner product space, its invariance under linear isometry equivalences and its orthonormal-basis description, the multivariate Gaussian laws `ProbabilityTheory.multivariateGaussian`, the one-dimensional laws `ProbabilityTheory.gaussianReal` with density `ProbabilityTheory.gaussianPDFReal` and distribution function `ProbabilityTheory.cdf` (Mathlib); the density `e^{−W}` of the standard Gaussian on every finite-dimensional real inner product space, the law of its orthogonal projections onto a subspace and onto a family of orthogonal subspaces, the affine subspace `m + range S` carrying `multivariateGaussian m S` for positive semidefinite `S`, the error-function form and strict monotonicity of the Gaussian distribution function, the quantile function of a law on `ℝ` and its two inverse laws with the distribution function (Tau Ceti: `TauCeti.Probability.stdGaussian_eq_withDensity_norm`, `Submodule.map_orthogonalProjectionOnto_stdGaussian`, `TauCeti.Probability.map_orthogonalProjectionOnto_stdGaussian_pi`, `TauCeti.Probability.ae_mem_affineRange_multivariateGaussian`, `TauCeti.Probability.cdf_gaussianReal_zero_one`, `TauCeti.Probability.strictMono_cdf_gaussianReal`, `MeasureTheory.Measure.quantile`, `MeasureTheory.Measure.cdf_quantile`, `MeasureTheory.Measure.quantile_cdf`). The normalized Euclidean Hausdorff measure `MeasureTheory.Measure.euclideanHausdorffMeasure` with its isometry invariance and its agreement with volume on affine subspaces is Mathlib's. Tau Ceti's Euclidean theory of variation and perimeter is used as it stands: total variation and perimeter by duality, the variation measure and its polar decomposition, lower semicontinuity, local compactness, the BV Poincaré inequality on balls, the scalar coarea formula on open and Borel sets, the reduced boundary, outer normal and Gauss–Green formula against the perimeter measure, the essential boundary and the inclusion of the reduced boundary in it, the perimeter of a half-space, the finiteness of the perimeter of bounded convex sets, the absolutely continuous part of the derivative, the one-dimensional variation bound and the surface measure of spheres; the exact declarations are in the supplier contracts.

Stated by other roadmaps and imported by section, for the parts the pinned libraries lack: De Giorgi's structure theorem identifying the perimeter measure with `μHE[n−1]` on the reduced boundary, the blow-up and density one-half at reduced-boundary points, the comparison of essential and reduced boundary and the finite-perimeter boundary criterion (GeometricMeasureTheory G5); the surface comparison on Lipschitz domains (GeometricMeasureTheory G6); the coarea formula for Lipschitz functions with weights, the tangential area formula on rectifiable sets and graph surface measure for locally Lipschitz graphs (GeometricMeasureTheory G2); the Euclidean finite-perimeter slicing theorem along lines with its reduced-boundary and normal comparison (Isoperimetry I4). Steiner symmetrisation and the Euclidean Brunn–Minkowski inequality are Isoperimetry I1–I2's and are not used here. The Prékopa–Leindler inequality with its preservation under log-concave densities is Tau Ceti's (`MeasureTheory.Measure.HasPrekopaLeindler`, `TauCeti.hasPrekopaLeindler_volume`, `MeasureTheory.Measure.HasPrekopaLeindler.withDensity`); it enters only the Check of §9.5 that compares Ehrhard's inequality with the Gaussian Brunn–Minkowski bound. The essential-convexity theorem of Isoperimetry I4 (a set of positive finite volume whose almost every line section in every direction is an interval up to a null set agrees almost everywhere with a convex set, its density-one points) is imported for §7.2 and not stated again. The Gaussian logarithmic Sobolev and Poincaré inequalities and Herbst's mean-centred concentration stay with RandomMatrices 2.2; the median-centred concentration of Layer 8 has the sharp constant from isoperimetry and is a different statement.

This roadmap stops at the two-cell case of the Gaussian multi-bubble theorem. With the definitions of Layers 3–4 the general theorem of Milman and Neeman is expressible without further data: for `n ≥ 1`, `2 ≤ q ≤ n + 1` and every `v ∈ Δ^{(q−1)}`, `I^{(q−1)}(v) = I_m^{(q−1)}(v)`, and for `v ∈ int Δ^{(q−1)}` every minimizing `q`-cluster is equivalent to a simplicial cluster (MilmanNeeman2022 Theorems 1.1–1.2, line 98–102, and Section 11, line 2606–2640). This roadmap proves the case `q = 2` (§7.4) and the inequality `I^{(q−1)} ≤ I_m^{(q−1)}` for `2 ≤ q ≤ n + 1` (§4.7). The reverse inequality for `q ≥ 3` needs the regularity of minimizing clusters (Milman–Neeman Theorem 4.1 (ii)–(v), line 923–931, resting on Almgren's interface regularity and the singular-set theorems of Taylor, White and Colombo–Edelen–Spolaor), curvature integrability near quadruple points, and the second-variation formula and inward fields of Milman–Neeman Sections 5–10; that regularity theory and the proof for `3 ≤ q ≤ n + 1` form GaussianIsoperimetryAndClusters, Part II, which takes Layers 3–4 and §7.4 of this roadmap as its base.

Not part of this roadmap: infinite-dimensional Gaussian measures and Cameron–Martin spaces; quantitative stability of the Gaussian isoperimetric inequality (Cianchi–Fusco–Maggi–Pratelli Theorems 1.1–1.2); Ehrhard's inequality for arbitrary Borel sets; the Ornstein–Uhlenbeck semigroup. Weighted perimeter is not developed for densities that are only measurable or vanish somewhere.

## Conventions

Throughout, `E` is a finite-dimensional real inner product space of dimension `n` with its Borel σ-algebra and `volume`. Results are stated intrinsically on `E` and are transported along linear isometry equivalences; no coordinate model replaces `E`. The case `n = 0` is excluded wherever `μHE[n − 1]` appears, because natural subtraction would turn it into the counting measure `μHE[0]`, and wherever a statement needs a non-atomic measure (§3.5, §7.4); a statement with no such hypothesis, such as §7.3 and Layer 8, also holds for `n = 0`, where `γ` is the Dirac mass at the origin and every perimeter vanishes, the only vector field being `0`. A set is Lebesgue measurable when it is `NullMeasurableSet` for `volume`; every perimeter statement depends only on the indicator up to a `volume`-null set, and Borel representatives are used where a theorem concerns Borel sets.

A weight is a function `W : E → ℝ` of class `C¹`. Its measure is `μ = e^{−W} · volume` (`weightedMeasure W`), its codimension-one measure is `μ^{n−1} = e^{−W} · μHE[n−1]`, and the weighted divergence of a `C¹` vector field `X` is `div_μ X = div X − ⟨∇W, X⟩`, so that `div(e^{−W} X) = e^{−W} div_μ X`. Here `div X` is the trace of the derivative of `X`. Perimeters and variations take values in `[0, ∞]`; a real-valued form is used only after finiteness is proved. Milman–Neeman assume a `C^∞` density and Borel cells throughout their Sections 3–4 (MilmanNeeman2022 line 697–701); the statements of Layers 2–3 are for `C¹` weights and Lebesgue-measurable sets, by the routes given, and a locator into those sections cites the source's statement in its own setting.

The standard Gaussian measure is `γ = stdGaussian E`. It equals `e^{−W} · volume` for the Gaussian weight `W(x) = ‖x‖²/2 + (n/2) log(2π)` (`gaussianWeight E`), so `∇W(x) = x` and `div_γ X = div X − ⟨x, X⟩`; its codimension-one measure is `γ^{n−1} = e^{−W} · μHE[n−1]`. On the line, `φ = gaussianPDFReal 0 1` is the density `(2π)^{−1/2} e^{−t²/2}` and `Φ = cdf (gaussianReal 0 1)` is the lower distribution function `Φ(t) = γ¹((−∞, t])`. On `(0, 1)`, `Φ⁻¹` is the quantile of `gaussianReal 0 1`. The Gaussian isoperimetric function is `I(v) = φ(Φ⁻¹(v))` for `0 < v < 1` and `I(0) = I(1) = 0`. Wherever `Φ⁻¹` would have to take an infinite value, a statement is written in Φ-form: "for every real `a` with `Φ(a) ≤ γ(A)`" replaces "with `a = Φ⁻¹(γ(A))`".

The perimeter normalization is Milman–Neeman's: the Gaussian perimeter of a half-space at distance `s` from the origin is `φ(s)`. The formulas of Cianchi–Fusco–Maggi–Pratelli are cited from their cvgmt preprint, and whatever this README says they print refers to that version. Cianchi–Fusco–Maggi–Pratelli weight `μHE[n−1]` by `(2π)^{−(n−1)/2} e^{−‖x‖²/2}` instead and use the upper tail `1 − Φ` as their `Φ`; their perimeter and their isoperimetric function are `√(2π)` times ours, and every inequality homogeneous in perimeter transfers unchanged. Their sup-formula (2.5) integrates against the probability measure and is therefore already in this normalization. Their formulas that also contain the derivative of the section measure `v_E(z) = γ¹(E_z)`, a ratio of probabilities that does not scale, are not homogeneous: they are consistent with each other and transfer unchanged only when that derivative is read as the derivative of `√(2π) v_E`. With `v_E` as they define it, (4.7) is weaker than §6.3 by the factor `√(2π)`, (4.8), (4.14) and (4.6) lack that factor on the gradient (§6.3, §6.4), and (4.10) fails (§6.5); every statement below is in this roadmap's normalization.

The outward measure-theoretic normal `ν_U` follows GeometricMeasureTheory: `Dχ_U = −ν_U |Dχ_U|` and `|Dχ_U| = μHE[n−1]` restricted to the reduced boundary `∂*U`.

A Gaussian symmetral replaces a section by a sublevel half-space: a section of Gaussian measure `v` with `0 < v < 1` becomes `{⟨y, u⟩ < Φ⁻¹(v)}`. The rule is written `{Φ(⟨y, u⟩) < v}` for every `v ∈ [0, 1]`, so that `v = 0` gives the empty set and `v = 1` the whole section; no quantile is evaluated at `0` or `1`.

For `q ≥ 1`, `Δ^{(q−1)} = {v ∈ ℝ^q : v_i ≥ 0, Σ v_i = 1}` is the probability simplex, `int Δ^{(q−1)}` its relative interior, and `E^{(q−1)} = {x ∈ ℝ^q : Σ x_i = 0}` (`simplexTangent q`) its tangent space with the Euclidean structure of `EuclideanSpace ℝ (Fin q)`. For nonnegative numbers `A = (A_ij)_{i<j}`, the interface operator is `L_A = Σ_{i<j} A_ij (e_i − e_j)(e_i − e_j)ᵀ` (`interfaceOperator q A`, a linear map of `EuclideanSpace ℝ (Fin q)` reading only the entries with `i < j`); as a quadratic form on `E^{(q−1)}` it is `⟨a, L_A a⟩ = Σ_{i<j} A_ij (a_i − a_j)²`. Gradients and Hessians of functions on `int Δ^{(q−1)}` are tensors on `E^{(q−1)}`. The identification of `Δ^{(1)}` with `[0, 1]` by `v ↦ v_1` contracts distances by `√2`.

**Checks.**

- The half-space `{x : ⟨x, ν⟩ > 1}` with `‖ν‖ = 1` has `γ = 1 − Φ(1) = 0.158655` and Gaussian perimeter `φ(1) = 0.241971` here, against `e^{−1/2} = 0.606531` in Cianchi–Fusco–Maggi–Pratelli; the ratio is `2.506628 = √(2π)`. A statement mixing the two normalizations would misstate `I(0.158655) = 0.241971`.
- On `ℝ`, `U = (−∞, s)` has `Dχ_U = −δ_s`, so `ν_U(s) = +1`, and for every `C¹` compactly supported `X` the weighted Gauss–Green identity reads `∫_{−∞}^{s} (X′ − tX) φ dt = X(s) φ(s)`, which is `⟨X, ν_U⟩ φ(s)`. An inner normal would give `−X(s) φ(s)`.
- The sublevel convention fixes `{⟨x, e⟩ < a}` under symmetrisation in direction `e`: its sections have measure `Φ(a)` and the sublevel half-line of that measure is `(−∞, a)`. For `0 < v < 1`, keeping the threshold and flipping the side gives `(Φ⁻¹(v), ∞)`, of measure `1 − v`, which for `v = Φ(1)` is `0.158655` instead of `0.841345`.
- For `q = 2`, `L_A` acts on `E^{(1)} = ℝ (e_1 − e_2)/√2` as multiplication by `2A_12`, and `⟨a, L_A a⟩ = A_12 (a_1 − a_2)²`.
- The Gaussian weight on `ℝ` has `W(0) = ½ log(2π) = 0.918939` and `e^{−W(0)} = φ(0) = 0.398942`; on `ℝ²`, `e^{−W(0)} = (2π)^{−1} = 0.159155`. The weight `‖x‖²/2` without the constant gives `e^{−W} · volume` the total mass `(2π)^{n/2}`, `2.506628` on `ℝ`, so the constant is what makes `e^{−W} · volume` the probability measure `γ`.
- On the zero space the Gaussian weight is `0`, since `‖0‖ = 0` and `n = 0`, so `e^{−W} · volume` is `volume`, the unit mass at the origin, which is `γ` there; the constant `½ log(2π)` of `n = 1` would give the mass `0.398942`. Adding a real `c` to any weight multiplies `e^{−W} · volume` by `e^{−c}`, and the weight `0` gives `volume`.
- For `q = 3` and `A_12 = A_13 = A_23 = A`, `L_A = A(3 Id − 𝟙𝟙ᵀ)`: it kills `(1, 1, 1)` and acts on the plane `E^{(2)}` as `3A`, which is `0.598413 Id` for the tripod areas `A = 0.199471` of §4.1. Summing over all ordered pairs `i ≠ j` would double `L_A`, giving `4A_12` instead of `2A_12` for `q = 2`; `L_A` reads only the entries with `i < j`, so changing `A_21` changes nothing.
- `E^{(q−1)}` has dimension `q − 1`: it is `{0}` for `q = 1`, the line `ℝ (1, −1)` for `q = 2`, and for `q = 3` the plane spanned by `(1, −1, 0)` and `(1, 1, −2)`, which does not contain `(1, 1, 1)`.

## Exact supplier contracts

### From Mathlib

- `ProbabilityTheory.stdGaussian` (Mathlib/Probability/Distributions/Gaussian/Multivariate.lean:65) is defined on every finite-dimensional real inner product space as the image of the product of standard normal laws under an orthonormal basis; it is a probability measure (instance at line 71). `ProbabilityTheory.stdGaussian_map` (line 126) gives its invariance under every linear isometry equivalence `E ≃ₗᵢ[ℝ] F`, and `ProbabilityTheory.stdGaussian_eq_map_pi_orthonormalBasis` (line 144) its description in any orthonormal basis. Nothing about densities, perimeters or products of subspaces is included.
- `ProbabilityTheory.multivariateGaussian` (same file, line 166) is the image of `stdGaussian (EuclideanSpace ℝ ι)` under `x ↦ m + toEuclideanCLM (CFC.sqrt S) x` for every square matrix `S`, with `Matrix.toEuclideanCLM` the matrix acting on `EuclideanSpace ℝ ι` and `CFC.sqrt` the continuous-functional-calculus square root for the order of positive semidefinite matrices; for `S` not positive semidefinite `CFC.sqrt S = 0` and the law is the Dirac mass at `m` (`ProbabilityTheory.multivariateGaussian_of_not_posSemidef`, line 170). Layer 8 uses exactly this definition.
- `ProbabilityTheory.gaussianPDFReal` (Mathlib/Probability/Distributions/Gaussian/Real.lean:47), `ProbabilityTheory.gaussianReal` (line 220), `ProbabilityTheory.gaussianReal_map_neg` (line 358) and `ProbabilityTheory.cdf` (Mathlib/Probability/CDF.lean:56) give `φ`, the standard normal law, its symmetry and `Φ`.
- `MeasureTheory.Measure.euclideanHausdorffMeasure` (Mathlib/Geometry/Euclidean/Volume/Measure.lean:68), written `μHE[d]`, with `AffineSubspace.euclideanHausdorffMeasure_coe_image` (line 226), `EuclideanGeometry.measurePreserving_vaddConst` (line 212) and `Submodule.measurePreserving_measurableEquivProd` (line 287), which identifies `volume` on `E` with the product of the volumes of a subspace and its orthogonal complement.
- `LinearMap.normDet` (Mathlib/Analysis/InnerProductSpace/NormDet.lean:69), the Jacobian of a linear map between inner product spaces, used for the tangential Jacobian of a projection.
- `geometric_hahn_banach_open_open` (Mathlib/Analysis/LocallyConvex/Separation.lean:135): two disjoint open convex sets are strictly separated by a continuous linear functional; `geometric_hahn_banach_open_point` (same file, line 124): an open convex set and a point outside it are strictly separated by a continuous linear functional.
- `Convex.openSegment_interior_closure_subset_interior` (Mathlib/Analysis/Convex/Topology.lean:142): for a convex set, the open segment from an interior point to a point of the closure lies in the interior.
- `Metric.infDist` (Mathlib/Topology/MetricSpace/HausdorffDistance.lean:464), the distance from a point to a set, which is `0` for the empty set (`Metric.infDist_empty`, line 478), and `Metric.lipschitz_infDist_pt` (line 551): it is `1`-Lipschitz in the point. §8.3 uses it for nonempty closed sets only.
- `Metric.thickening` (Mathlib/Topology/MetricSpace/Thickening.lean:53), the open set of points at distance `< δ`, which is empty for `δ ≤ 0`; `Metric.self_subset_thickening` (line 309): for `δ > 0` it contains the set; `Metric.thickening_subset_cthickening` (line 267); `Metric.thickening_closure` (line 376): a set and its closure have the same open thickenings; `Metric.cthickening` (line 181), the closed set at distance `≤ δ`, with `Metric.cthickening_zero` (line 226) equal to the closure.
- `isOpenMap_of_hasStrictFDerivAt_equiv` (Mathlib/Analysis/Calculus/InverseFunctionTheorem/FDeriv.lean:205): a map with invertible strict derivative everywhere is open.
- `LipschitzWith.ae_differentiableAt` (Mathlib/Analysis/Calculus/Rademacher.lean:386), `norm_fderiv_le_of_lipschitz` (Mathlib/Analysis/Calculus/FDeriv/Basic.lean:949), `Monotone.ae_differentiableAt` (Mathlib/Analysis/Calculus/Monotone.lean:213) and `MonotoneOn.intervalIntegral_deriv_mem_uIcc` (Mathlib/MeasureTheory/Integral/IntervalIntegral/DerivIntegrable.lean:101), which bounds the integral of the derivative of a monotone function by its increment.
- `Convex.nullMeasurableSet` (Mathlib/Analysis/Convex/Measure.lean:89): a convex set is null-measurable for every additive Haar measure.
- `MeasureTheory.NullMeasurableSet` (Mathlib/MeasureTheory/Measure/NullMeasurable.lean:91): a set that agrees with a measurable set up to a null set of the given measure, `volume` by default; it is the Lebesgue measurability of the Conventions.
- `MeasureTheory.Measure.prod` (Mathlib/MeasureTheory/Measure/Prod.lean:172) and `MeasureTheory.Measure.pi` (Mathlib/MeasureTheory/Constructions/Pi.lean:211), the binary and the finite product of measures; `MeasureTheory.measurePreserving_piFinTwo` (same file, line 850): for σ-finite measures on two spaces indexed by `Fin 2`, `MeasurableEquiv.piFinTwo` carries their product over `Fin 2` to their binary product. §1.3 reindexes the joint projection law with it.
- `Besicovitch.ae_tendsto_measure_inter_div` (Mathlib/MeasureTheory/Covering/Besicovitch.lean:1104): for a locally finite measure on a second-countable metric space with the Besicovitch covering property, which every finite-dimensional real normed space has (Mathlib/MeasureTheory/Covering/BesicovitchVectorSpace.lean:500), and for an arbitrary set `s`, almost every point of `s` is a density point of `s`, the density being taken over closed balls whose radius tends to `0`. It gives the Lebesgue points of §5.1 and the density-one points of §7.2.
- `TestFunction` (Mathlib/Analysis/Distribution/TestFunction.lean:67), written `𝓓(Ω, F)` (line 80): the smooth functions `E → F` with compact support inside the open set `Ω`. The test vector fields of §2.1 are `𝓓(Ω, E)`; nothing about weights is included.
- `Submodule.starProjection` (Mathlib/Analysis/InnerProductSpace/Projection/Basic.lean:131): the orthogonal projection onto a subspace `F` with an orthogonal projection, which every subspace of a finite-dimensional `E` has, as an endomorphism of `E`; `x − P_F x` is the component of `x` in `F^⊥`, through which the symmetrals of §6.1 and §9.1 read the section of a set over a point of `F^⊥`.
- `ContDiffBump` (Mathlib/Analysis/Calculus/BumpFunction/Basic.lean:70): smooth bump functions about a point with prescribed inner and outer radii, smooth on every inner product space, and their normalization to integral `1`, `ContDiffBump.normed` (Mathlib/Analysis/Calculus/BumpFunction/Normed.lean:35); §2.1 and §6.5 use them as mollifiers. `HasCompactSupport.hasFDerivAt_convolution_left` (Mathlib/Analysis/Calculus/ContDiff/Convolution.lean:92): the convolution of a compactly supported `C¹` kernel with a locally integrable function is differentiable everywhere, its derivative being the convolution of the kernel's derivative with the function.

### From Tau Ceti

Tau Ceti at the pin contains the Euclidean theory of total variation and perimeter defined by duality against a measure parameter, with the variation measure, the polar decomposition, the reduced boundary and the scalar coarea formula. It contains no weighted divergence, no weighted perimeter and no Gaussian isoperimetric statement: `TauCeti.perimeter γ Ω U` is the supremum of `∫_U div X dγ`, with the ordinary divergence, and is not `P_γ(U; Ω)` (§2.1, third Check). Every Euclidean declaration below is used with `volume`, an additive Haar measure.

Gaussian laws and quantiles.

- `TauCeti.Probability.stdGaussian_eq_withDensity_norm` (TauCeti/Probability/Distributions/Gaussian/Density.lean:178): on every finite-dimensional real inner product space `E` with its Borel σ-algebra, `stdGaussian E` is `volume` with density `(2π)^{−dim E/2} exp(−‖x‖²/2)`, which is `e^{−W}` for the `W` of the Conventions.
- `Submodule.map_orthogonalProjectionOnto_stdGaussian` (TauCeti/Probability/Distributions/Gaussian/Projection.lean:47): the orthogonal projection onto a subspace `K` carries `stdGaussian E` to `stdGaussian K`. `TauCeti.Probability.map_orthogonalProjectionOnto_stdGaussian_pi` (same file, line 94): for a finite family of pairwise orthogonal subspaces `K_i`, the joint law of the projections `x ↦ (P_{K_i} x)_i` is `Measure.pi (i ↦ stdGaussian (K i))`. Neither states the addition map `F × F^⊥ → E` or a binary product measure, which §1.3 derives.
- `TauCeti.Probability.ae_mem_affineRange_multivariateGaussian` (TauCeti/Probability/Distributions/Gaussian/Density.lean:256): for positive semidefinite `S`, `multivariateGaussian m S`-almost every point lies in the affine subspace `m + range S`; `Matrix.PosSemidef.range_toEuclideanLin_sqrt` (TauCeti/Analysis/Matrix/Sqrt.lean:86): for positive semidefinite `S`, `CFC.sqrt S` and `S` have the same range as Euclidean linear maps. §8.1 uses them to put the law `γ_{m,S}` on `m + range K`, `K = CFC.sqrt S`.
- `TauCeti.Probability.cdf_gaussianReal_zero_one` (TauCeti/Probability/Distributions/Gaussian/Cdf.lean:148): `Φ(x) = (1 + erf(x/√2))/2`, with `TauCeti.Real.continuous_erf` (TauCeti/Analysis/SpecialFunctions/Erf.lean:115). `TauCeti.Probability.strictMono_cdf_gaussianReal` (Cdf.lean:219), `TauCeti.Probability.cdf_gaussianReal_pos` (line 205) and `TauCeti.Probability.cdf_gaussianReal_lt_one` (line 212), for nonzero variance: `Φ` is strictly increasing with values in `(0, 1)`. `TauCeti.Probability.hasDerivAt_cdf_gaussianReal` (Cdf.lean:226): for nonzero variance the distribution function has the Gaussian density as its derivative at every point, so `Φ′ = φ`.
- `MeasureTheory.Measure.quantile` (TauCeti/Probability/Quantile.lean:164): the infimum of the points where the distribution function reaches a level `t`. Its value is the junk `0` for `t ≤ 0` (`MeasureTheory.Measure.quantile_of_nonpos`, line 209) and for `t > 1` (`MeasureTheory.Measure.quantile_of_one_lt`, line 216). At `t = 1` it is the least point of full cumulative mass when there is one and `0` otherwise: `2` for the Dirac mass at `2`, whose level-one set is `[2, ∞)`, and `0` for `gaussianReal 0 1`, whose distribution function stays below `1`. Hence `I` is defined separately at `0` and `1`, and no statement below evaluates `Φ⁻¹` at `0` or `1`.
- `MeasureTheory.Measure.cdf_quantile` (Quantile.lean:340): if the distribution function of `μ` is continuous and `0 < t < 1`, it takes the value `t` at the quantile. `MeasureTheory.Measure.quantile_cdf` (line 359): if the distribution function is strictly increasing on the points where its value lies in `(0, 1)`, and its value at `x` lies in `(0, 1)`, the quantile at that value is `x`. For `gaussianReal 0 1` they give `Φ(Φ⁻¹(v)) = v` for `0 < v < 1` and `Φ⁻¹(Φ(s)) = s` for every real `s`.
- `TauCeti.Probability.quantile_gaussianReal_zero_one` (TauCeti/Probability/Distributions/Gaussian/Quantile.lean:72): for `0 < u < 1` the quantile of `gaussianReal 0 1` is `√2 erfInv(2u − 1)`, where `Real.erfInv` (TauCeti/Analysis/SpecialFunctions/Erf.lean:250) inverts the error function on `(−1, 1)` and is `0` outside it; `Real.hasDerivAt_erfInv` (same file, line 376): at every `y ∈ (−1, 1)` the inverse error function has derivative `(√π/2) e^{erfInv(y)²}`. Together they make `Φ⁻¹` differentiable on `(0, 1)`.

Euclidean variation and perimeter.

- `TestFunction.divergenceCLM` (TauCeti/Analysis/Distribution/TestFunction/Divergence.lean:58): the divergence `div X = tr(DX)` of a test vector field `X ∈ 𝓓(Ω, E)` as a continuous linear map `𝓓(Ω, E) → 𝓓(Ω, ℝ)`; `TestFunction.divergenceCLM_apply` (line 63) evaluates it as the trace of the derivative.
- `TauCeti.totalVariationOn` (TauCeti/Analysis/BoundedVariation/TotalVariation.lean:100): `|Du|(Ω)`, the supremum of `∫ u div X dμ` over test fields `X ∈ 𝓓(Ω, E)` with `‖X‖ ≤ 1`; `TauCeti.totalVariationOn_le_liminf` (line 375): lower semicontinuity under `L¹_loc(Ω)` convergence.
- `TauCeti.perimeter` (TauCeti/Analysis/BoundedVariation/Perimeter.lean:64): the total variation of the indicator; `TauCeti.perimeter_congr_ae` (line 83): locality, a null modification inside `Ω` does not change `P(U; Ω)`; `TauCeti.perimeter_mono` (line 87): `P(U; Ω′) ≤ P(U; Ω)` for open `Ω′ ⊆ Ω`; `TauCeti.perimeter_compl` (line 109).
- `Convex.perimeter_lt_top` (TauCeti/Analysis/BoundedVariation/Convex.lean:507): for an additive Haar measure, a bounded convex set has finite perimeter in the whole space. §2.3 uses it for the cuts `C ∩ B` of an open convex set by balls.
- `TauCeti.ae_perimeter_inter_ball_le` (TauCeti/Analysis/BoundedVariation/CutByBall.lean:228): for an additive Haar measure, a null-measurable `U` and a centre `x_0`, for almost every radius `R`, `P(U ∩ ball(x_0, R)) ≤ P(U; ball(x_0, R)) + m′(R)`, where `m(ρ) = |U ∩ ball(x_0, ρ)|` and `m′(R)` is the real derivative; neither finite perimeter nor finite measure of `U` is assumed.
- `TauCeti.variationMeasure` (TauCeti/Analysis/BoundedVariation/VariationMeasure.lean:136): for `u` locally integrable on `Ω` with locally finite variation, the regular Borel measure `|Du|` on `Ω` whose value on every open `U ⊆ Ω` is `TauCeti.totalVariationOn volume U u` (`TauCeti.variationMeasure_preimage_coe`, line 150), and `0` otherwise; `TauCeti.variationMeasure_eq_comap_inclusion` (line 230): for an open `V ⊆ Ω` the variation measure on `V` is the pullback of the one on `Ω` along the inclusion. `TauCeti.polarDensity` (TauCeti/Analysis/BoundedVariation/PolarDecomposition.lean:260) with `TauCeti.integral_divergenceCLM_mul_eq_neg_integral_inner_polarDensity` (line 284) and `TauCeti.ae_norm_polarDensity_eq_one` (line 303): `Du = σ_u |Du|` with `‖σ_u‖ = 1` `|Du|`-almost everywhere; `TauCeti.integral_lineDeriv_mul_eq_neg_integral_mul_inner_polarDensity` (line 292): for the same `u`, a scalar test function `ψ ∈ 𝓓(Ω, ℝ)` and a vector `w`, `∫ ∂_w ψ · u = −∫ ψ ⟨w, σ_u⟩ d|Du|`; `TauCeti.ae_eq_polarDensity` (line 319): a locally integrable field satisfying the same integration-by-parts identity agrees with `σ_u` `|Du|`-almost everywhere.
- `TauCeti.reducedBoundary` and `TauCeti.outerNormal` (TauCeti/Analysis/BoundedVariation/ReducedBoundary.lean:95 and 106), with `Dχ_U = −ν_U |Dχ_U|`, the convention of this roadmap; `TauCeti.reducedBoundary_congr_ae` (line 404) and `TauCeti.outerNormal_congr_ae` (line 418): sets equal almost everywhere on `Ω` have the same reduced boundary and outer normal in `Ω`; `TauCeti.integral_trace_fderiv_mul_indicator_eq_integral_inner_outerNormal` (line 271): for `U` of locally finite perimeter in `Ω` and a `C¹` field `X` with compact support in `Ω`, `∫_U div X = ∫ ⟨X, ν_U⟩ d|Dχ_U|`, the perimeter measure not yet identified with a Hausdorff measure.
- `TauCeti.essentialBoundary` and `TauCeti.essentialInterior` (TauCeti/MeasureTheory/Covering/EssentialBoundary.lean:143 and 132): the points where `U` has neither density `0` nor density `1`, written `∂^M U`, and the points of density one; `TauCeti.essentialBoundary_subset_frontier` (line 345). `TauCeti.reducedBoundary_subset_essentialBoundary` (TauCeti/Analysis/BoundedVariation/LowerDensityEstimates.lean:281): for `n ≥ 2` and an additive Haar measure, `∂*U ⊆ ∂^M U`; the converse up to a `μHE[n−1]`-null set is GeometricMeasureTheory G5's.
- `TauCeti.perimeter_setOf_inner_lt` (TauCeti/Analysis/BoundedVariation/Hyperplane.lean:61): for a unit vector `ν`, a real `c` and an open `Ω`, the Euclidean perimeter of `{⟨x, ν⟩ < c}` in `Ω` is `μHE[n−1](Ω ∩ {⟨x, ν⟩ = c})`. §2.3 uses it to compute the weighted perimeter of half-spaces without De Giorgi's theorem.
- `TauCeti.acDerivativeDensity` (TauCeti/Analysis/BoundedVariation/LebesgueDecomposition.lean:55): for `u` locally integrable on `Ω` and a reference measure `ν` on `Ω`, the density `(d|Du|/dν) σ_u` of the absolutely continuous part of `Du`; `TauCeti.withDensity_enorm_acDerivativeDensity_add_singularPart` (line 93): for `u` of locally finite variation and σ-finite `ν`, `|Du|` is `‖acDerivativeDensity‖ · ν` plus the singular part of `|Du|`; `TauCeti.ae_eq_acDerivativeDensity` (line 165): a locally integrable `g` with `Du = g ν + τ ξ` for a measure `ξ` singular to `ν` agrees with it `ν`-almost everywhere. §6.3 takes `∇v_U` to be this density for `ν = volume` on `e^⊥`.
- `TauCeti.exists_subseq_tendsto_measure_symmDiff_inter_of_perimeter_le` (TauCeti/Analysis/BoundedVariation/Compactness.lean:223): a sequence of sets with locally bounded perimeter in `Ω` has a subsequence converging locally in measure in `Ω`.
- `TauCeti.setLIntegral_enorm_sub_setAverage_le_mul_totalVariationOn_of_eq_ball` (TauCeti/Analysis/BoundedVariation/Poincare.lean:251): the BV Poincaré inequality on a ball of radius `R`, with constant `2^{n+1} R`.
- `TauCeti.totalVariationOn_eq_lintegral_perimeter` (TauCeti/Analysis/BoundedVariation/Coarea.lean:392): `|Du|(Ω) = ∫ P({u > t}; Ω) dt` for `u` locally integrable on `Ω`; `TauCeti.variationMeasure_apply_eq_lintegral` (line 546) and `TauCeti.lintegral_variationMeasure_eq_lintegral_lintegral` (line 558): for `u` of locally finite variation, `|Du|(B) = ∫ |Dχ_{u > t}|(B) dt` for measurable `B ⊆ Ω` and `∫ f d|Du| = ∫ ∫ f d|Dχ_{u > t}| dt` for nonnegative `f`; `TauCeti.measurable_perimeter_setOf_lt` (line 335): measurability in `t`.
- `TauCeti.Real.ofReal_sum_abs_sub_le_totalVariationOn` (TauCeti/Analysis/BoundedVariation/Real.lean:185): on the line, for Lebesgue points `x_0 ≤ ⋯ ≤ x_m` of `u` with `[x_0, x_m] ⊆ Ω` and Lebesgue values `v_i`, `Σ |v_{i+1} − v_i| ≤ |Du|(Ω)`.
- `TauCeti.euclideanHausdorffMeasure_sphere` (TauCeti/Geometry/Euclidean/Volume/Sphere.lean:367): `μHE[n−1](sphere c r) = n ω_n r^{n−1}` for `r > 0`.

Prékopa–Leindler.

- `MeasureTheory.Measure.HasPrekopaLeindler` (TauCeti/MeasureTheory/Integral/PrekopaLeindler.lean:108): the Prékopa–Leindler property of a measure at a weight `θ`, stated on measurable representatives; `TauCeti.hasPrekopaLeindler_volume` (line 372): `volume` on every finite-dimensional real inner product space has it for `0 ≤ θ ≤ 1`; `MeasureTheory.Measure.HasPrekopaLeindler.withDensity` (line 218): a measurable log-concave density preserves it. Only the Check of §9.5 comparing Ehrhard's inequality with the Gaussian Brunn–Minkowski bound uses them.

### From TauCetiRoadmap.GeometricMeasureTheory

These are the inputs the pinned libraries lack.

- G2: the coarea formula for Lipschitz `f : E → ℝ` with nonnegative Borel weights and `μHE[n−1]` on fibres (Tau Ceti's `MeasureTheory.lintegral_euclideanHausdorffMeasure_inter_preimage_eq_lintegral_normDet_adjoint_fderiv` (TauCeti/MeasureTheory/Function/Coarea/Basic.lean:445) needs a surjective derivative at every point and has no weight); the tangential area formula for Lipschitz maps on countably `(n−1)`-rectifiable sets; graph surface measure `√(1 + ‖Dφ‖²)` for locally Lipschitz graphs over open sets.
- G5: De Giorgi's theorem `|Dχ_U| = μHE[n−1] ⌊ ∂*U` with blow-up to the half-space `{⟨y, ν_U(x)⟩ < 0}` at `μHE[n−1]`-a.e. `x ∈ ∂*U`, so that such points have density `1/2`; the essential boundary differs from the reduced boundary by a `μHE[n−1]`-null set; the converse criterion that a measurable set whose essential boundary has locally finite `μHE[n−1]` measure has locally finite perimeter.
- G6: `|Dχ_U| = μHE[n−1] ⌊ ∂U` for bounded Lipschitz domains.

### From TauCetiRoadmap.Isoperimetry

- I4, essential convexity: a Lebesgue-measurable `V ⊆ E` with `0 < |V| < ∞` such that, in every unit direction `e`, for `volume`-a.e. `z ∈ e^⊥` the section `{t : z + te ∈ V}` agrees a.e. with a possibly empty interval, agrees a.e. with a convex set, namely its set of density-one points. Nothing about sets of infinite volume is assumed: §7.2 applies it to the cut sets `H ∩ ball(0, R)`.
- I4: the finite-perimeter slicing theorem along lines, for the standing sets of I4's structural targets. For Lebesgue-measurable `V ⊆ E` with `0 < |V| < ∞` and `P(V) < ∞`, `n ≥ 2`, and a unit vector `e`, for `volume`-a.e. `z ∈ e^⊥` the section `V_z = {t : z + te ∈ V}` has finite perimeter in `ℝ`, its reduced boundary is `{t : z + te ∈ ∂*V}`, and `⟨ν_V(z + te), e⟩ ≠ 0` at each such point. The measure-preserving identification of `e^⊥ × ℝ` with `E` comes with it. Nothing about Gaussian weights is assumed, and nothing is assumed about sets of infinite volume or only locally finite perimeter: §6.2 reaches those by cutting with balls. Tau Ceti's `TauCeti.lintegral_perimeter_lineSection_le` and `TauCeti.ae_perimeter_lineSection_lt_top` (TauCeti/Analysis/BoundedVariation/Slicing.lean:190 and 199) are only the integrated inequality and the almost-everywhere finiteness of section perimeters for sets of finite volume and finite perimeter, without the reduced-boundary comparison.

No supplier contract is missing: every input above is a stated target of its roadmap.

## How to read the build

Layer 1 fixes the one-dimensional Gaussian functions and the product structure of `γ`. Layer 2 builds weighted perimeter for a general positive `C¹` density on top of Tau Ceti's Euclidean variation, perimeter and variation measure and GeometricMeasureTheory's De Giorgi theorem; the Gaussian weight appears only in the explicit perimeters of §2.3, the translation formula of §2.5 and the invariances of §2.7. Layer 3 builds clusters and the existence theorem for every probability density. Layer 4, which needs only Layers 1–3 and the weighted Gauss–Green formula, constructs the model simplicial clusters and their profile; it does not depend on any isoperimetric inequality. Layers 5–7 prove the Gaussian isoperimetric theorem with equality: the one-dimensional case, then Ehrhard symmetrisation of sets of finite Gaussian perimeter, then the structure of the minimizers that §3.5 provides: half-line sections, convexity of the density-one representative, and separation by a hyperplane. Layer 8 derives the integrated, functional and concentration forms from Layer 7. Layer 9 develops the closed-set Gaussian symmetrisation of Ehrhard and proves Ehrhard's inequality for convex sets; it uses Layer 8's enlargement inequality only on the line. GeometricMeasureTheory G5 enters at §2.2 and G6 at §2.3; every later layer, Layer 5 included, reaches G5 through §2.2, while Layer 1, §2.1, §2.4, §5.2, §6.1, §9.1 and §9.2 use neither, directly or through the sections they need. Every section lists its inputs in its *Needs:* line.

## Layer 1: the standard Gaussian on the line and on Euclidean spaces

### 1.1 The Gaussian isoperimetric function

Define the Gaussian isoperimetric function `I : ℝ → ℝ` (`gaussianIsoperimetricProfile`) by `I(v) = φ(Φ⁻¹(v))` for `0 < v < 1` and `I(v) = 0` otherwise, where `Φ⁻¹(v)` is the quantile of `gaussianReal 0 1` at level `v` (MilmanNeeman2022 line 182–185; Ledoux1999 line 214–217; CianchiFuscoMaggiPratelli2011 line 55–57 in their normalization). It is the perimeter of a half-space of Gaussian measure `v` (§2.3) and the right-hand side of every isoperimetric inequality below.

- For every real `s`, `I(Φ(s)) = φ(s)`.
- `I(1 − v) = I(v)` for every `v`.
- `I` is continuous on `[0, 1]`, strictly positive on `(0, 1)`, zero at `0` and `1`, and attains its maximum `φ(0) = (2π)^{−1/2}` only at `1/2`.
- `I` is `C^∞` on `(0, 1)` with `I′(v) = −Φ⁻¹(v)` and `I″(v) = −1/I(v)`; hence `I` is strictly concave on `[0, 1]` and locally Lipschitz on `(0, 1)` (MilmanNeeman2022 equation (1.1), line 186–187).

A route: `Φ` is continuous by the error-function formula and strictly increasing with values in `(0, 1)`, so `MeasureTheory.Measure.cdf_quantile` and `MeasureTheory.Measure.quantile_cdf`, applied to `gaussianReal 0 1`, make the quantile the two-sided inverse of `Φ` on `(0, 1)` (`Φ(Φ⁻¹(v)) = v` for `0 < v < 1`, `Φ⁻¹(Φ(s)) = s` for real `s`), which gives `I(Φ(s)) = φ(s)`. For the derivatives, the closed form `Φ⁻¹(v) = √2 erfInv(2v − 1)` makes `Φ⁻¹` differentiable on `(0, 1)`, and the chain rule applied to `Φ(Φ⁻¹(v)) = v` with `Φ′ = φ` gives `(Φ⁻¹)′ = 1/φ(Φ⁻¹) = 1/I`; with `φ′(t) = −t φ(t)` this gives `I′ = −Φ⁻¹` and `I″ = −1/I`. *Needs:* Mathlib `ProbabilityTheory.gaussianPDFReal`, `ProbabilityTheory.cdf`; Tau Ceti `TauCeti.Probability.cdf_gaussianReal_zero_one`, `TauCeti.Real.continuous_erf`, `TauCeti.Probability.strictMono_cdf_gaussianReal`, `TauCeti.Probability.cdf_gaussianReal_pos`, `TauCeti.Probability.cdf_gaussianReal_lt_one`, `TauCeti.Probability.hasDerivAt_cdf_gaussianReal`, `MeasureTheory.Measure.quantile`, `MeasureTheory.Measure.cdf_quantile`, `MeasureTheory.Measure.quantile_cdf`, `TauCeti.Probability.quantile_gaussianReal_zero_one`, `Real.hasDerivAt_erfInv`.

**Checks.**

- `I(1/2) = φ(0) = 0.398942`, `I(1 − Φ(1)) = φ(1) = 0.241971` and `I(1/3) = I(2/3) = 0.363600`, with `Φ⁻¹(1/3) = −0.430727`.
- At the endpoints `I(0) = I(1) = 0`; applying `φ` to the quantile of `gaussianReal 0 1` at level `0` or `1`, which is `0` at both, would give `0.398942` instead, so the separate definition at `0` and `1` is forced.
- The second difference of `I` at `0.3` is `−2.876104`, equal to `−1/I(0.3)`, and `I′(0.3) = 0.524401 = −Φ⁻¹(0.3)`. The profile in the other normalization, `√(2π) I`, satisfies `(√(2π) I)″ = −2π/(√(2π) I)`, so the differential equation pins the normalization.

### 1.2 Gaussian tails

Prove that `1 − Φ(r) < φ(r)/r` for every `r > 0` (CianchiFuscoMaggiPratelli2011 Lemma 3.4, inequality (3.2), line 295–299, in their normalization) and `1 − Φ(r) ≤ ½ e^{−r²/2}` for every `r ≥ 0`, with equality in the second only at `r = 0`; the second sharpens by the factor `½` the tail bound `1 − Φ(r) ≤ e^{−r²/2}` of Ledoux1999 inequality (1.6), line 225–226, and is proved here. A route: the first follows from `∫_r^∞ φ < ∫_r^∞ (t/r) φ(t) dt = φ(r)/r`; for the second, `r ↦ e^{r²/2}(1 − Φ(r))` has derivative `e^{r²/2}(r(1 − Φ(r)) − φ(r)) < 0` by the first and value `1/2` at `0`. *Needs:* §1.1; Tau Ceti `TauCeti.Probability.hasDerivAt_cdf_gaussianReal` (`Φ′ = φ`).

**Checks.**

- At `r = 1`: `1 − Φ(1) = 0.158655`, `φ(1) = 0.241971`, `½ e^{−1/2} = 0.303265`. At `r = 2`: `0.022750` against `½ e^{−2} = 0.067668`.
- At `r = 0` both sides of the second bound are `1/2`, so a constant `1/4` in place of `1/2` fails; the bound `e^{−r²/2}` without the factor `1/2` holds but is not the one stated.

### 1.3 Orthogonal splitting

For a subspace `F ⊆ E`, write `γ_F = stdGaussian F`. Prove that the addition map `F × F^⊥ → E`, `(y, z) ↦ y + z`, carries the product measure `γ_F ⊗ γ_{F^⊥}` to `γ_E`, and that `γ_E({x : ⟨x, ν⟩ < s}) = Φ(s)` for every unit vector `ν` and real `s` (MilmanNeeman2022 line 481–483 and equation (2.1), line 490–497; Ledoux1993 line 251–252). The law of the projection onto `F` alone, the joint law of the projections onto finitely many orthogonal subspaces, and the density `γ_E = e^{−W} · volume` are Tau Ceti's and are used as they stand; the first statement differs from the joint-projection law in being the binary product on `F × F^⊥` pushed forward by addition, which is the form that Fubini over `F^⊥` and the cylinders of §2.7 use. A route: `x ↦ (P_F x, P_{F^⊥} x)` is the inverse of the addition map, and its law is the binary product by `TauCeti.Probability.map_orthogonalProjectionOnto_stdGaussian_pi` for the two-member family `(F, F^⊥)` indexed by `Fin 2`, reindexed from `Measure.pi` to `Measure.prod` by `MeasureTheory.measurePreserving_piFinTwo`; for the half-space, project onto `ℝν` by `Submodule.map_orthogonalProjectionOnto_stdGaussian` and write `stdGaussian (ℝν)` as the image of `gaussianReal 0 1` under `t ↦ tν` by `ProbabilityTheory.stdGaussian_eq_map_pi_orthonormalBasis` for the one-element orthonormal basis `(ν)`, so that `⟨x, ν⟩` has law `gaussianReal 0 1` under `γ_E`. *Needs:* Tau Ceti `TauCeti.Probability.map_orthogonalProjectionOnto_stdGaussian_pi`, `Submodule.map_orthogonalProjectionOnto_stdGaussian`; Mathlib `ProbabilityTheory.stdGaussian_eq_map_pi_orthonormalBasis`, `MeasureTheory.measurePreserving_piFinTwo`.

**Checks.**

- In `ℝ²` with `F = ℝ (e_1 + e_2)/√2`, the coordinate `(x_1 + x_2)/√2` has law `gaussianReal 0 1`, so `γ({x_1 + x_2 < √2}) = Φ(1) = 0.841345`.
- For `q ≥ 2`, on `E^{(q−1)}`, `√(q/(q−1)) x_i` and `(x_i − x_j)/√2` (`i ≠ j`) have law `gaussianReal 0 1`, because the projection of `e_i` to `E^{(q−1)}` has squared norm `(q − 1)/q` and `e_i − e_j` has norm `√2`. For `q = 3` this gives `γ({x_i ≥ 1}) = 1 − Φ(√1.5) = 0.110336`; the reciprocal factor `√((q−1)/q)` would give `0.207108`. At `q = 1`, `E^{(0)} = {0}` and `x_1 = 0` has variance `0`, not `1`, and the factor `q/(q − 1)` divides by zero: the statement is not made there.
- `F = {0}` and `F = E` give the trivial identities `γ_E = δ_0 ⊗ γ_E` and `γ_E ⊗ δ_0` under the identifications `{0} × E ≅ E ≅ E × {0}`. By Tau Ceti's density theorem the density at the origin of `ℝ²` is `(2π)^{−1} = 0.159155`; omitting the factor `(2π)^{−n/2}` gives total mass `2π`.

### Examples

The half-space `{x_1 < 0}` in any `E` has measure `1/2`, and the half-space `{x_1 < 1}` has measure `Φ(1) = 0.841345`; their perimeters, computed in §2.3, are `I(1/2)` and `I(Φ(1))`.

### Dependencies

Mathlib Gaussian laws and product measures; Tau Ceti's Gaussian density, projection laws, error function and its inverse, the derivative of the Gaussian distribution function, the quantile with its inverse laws and its closed form.

## Layer 2: weighted variation and perimeter

Throughout this layer `W` is a weight in the sense of the Conventions, with no further assumption unless a statement says so.

### 2.1 Weighted variation and weighted perimeter

For an open set `Ω ⊆ E` and `u ∈ L¹_loc(Ω)`, define the weighted variation `V_μ(u; Ω) ∈ [0, ∞]` (`weightedVariation W Ω u`) as the supremum of `∫_Ω u div_μ X dμ` over smooth vector fields `X : E → E` with compact support in `Ω` and `‖X‖ ≤ 1` pointwise, that is over the test vector fields `X ∈ 𝓓(Ω, E)` with `div X` Tau Ceti's `TestFunction.divergenceCLM X`. The weighted perimeter of a Lebesgue-measurable set `U` in `Ω` is `P_μ(U; Ω) = V_μ(χ_U; Ω)` (`weightedPerimeter W Ω U`), and `P_μ(U) = P_μ(U; E)`; for the Gaussian weight `P_γ(U) = P_γ(U; E)` is `gaussianPerimeter U` (MilmanNeeman2022 line 30–31 and 753–754; CianchiFuscoMaggiPratelli2011 equation (2.5), line 200–208).

- Density-bounded form: `V_μ(u; Ω)` equals the supremum of `∫_Ω u div Y dx` over `C¹` fields `Y` compactly supported in `Ω` with `‖Y‖ ≤ e^{−W}` pointwise, and also over smooth such fields.
- `V_μ(u; Ω)` depends only on the class of `u` up to null sets; `P_μ(U; Ω) = P_μ(E ∖ U; Ω)`; `P_μ(∅; Ω) = P_μ(E; Ω) = 0`.
- If `Ω ⊆ Ω′` then `V_μ(u; Ω) ≤ V_μ(u; Ω′)`; `V_μ(u + u′; Ω) ≤ V_μ(u; Ω) + V_μ(u′; Ω)` and `V_μ(c u; Ω) = |c| V_μ(u; Ω)` for real `c`.
- For a real constant `c`, the weight `W + c` multiplies `V_μ` by `e^{−c}`; the weight `0`, for which `μ = volume`, gives Tau Ceti's Euclidean variation `TauCeti.totalVariationOn volume Ω u` and perimeter `TauCeti.perimeter volume Ω U`.
- If `Ω′` is open with compact closure in `Ω`, then `(min_{cl Ω′} e^{−W}) |Du|(Ω′) ≤ V_μ(u; Ω′) ≤ (max_{cl Ω′} e^{−W}) |Du|(Ω′)`, with `|Du|(Ω′) = TauCeti.totalVariationOn volume Ω′ u`; in particular `V_μ(u; Ω) < ∞` implies `u ∈ BV_loc(Ω)`.

A route for the density-bounded form: `div(e^{−W} X) = e^{−W} div_μ X`, and density-bounded `C¹` fields convolved with a smooth bump and multiplied by `1 − δ` stay density-bounded on a compact support, by uniform continuity of `e^{−W}` there. *Needs:* Conventions; Tau Ceti `TestFunction.divergenceCLM`, `TauCeti.totalVariationOn`, `TauCeti.perimeter`; Mathlib `TestFunction`, `ContDiffBump`.

**Checks.**

- For the weight `0` on `ℝ`, `P((0, ∞)) = 1` and `P((0, 1)) = 2`; on `ℝ²` a half-plane has Euclidean perimeter `∞`, while its Gaussian perimeter is finite (§2.3).
- For `γ` on `ℝ²`, `P_γ(ball(0, 1)) = e^{−1/2} = 0.606531`, and for the half-plane `{x_1 > 1}`, `0.241971` (§2.3).
- The plausible wrong definition `sup ∫_U div X dμ`, without the term `−⟨∇W, X⟩`, is Tau Ceti's `TauCeti.perimeter μ Ω U` with the measure `μ` in place of `volume`. It assigns to `U = ℝ` under `γ` the value `sup ∫ t X(t) dγ = ∫ |t| dγ = 0.797885` instead of `0`, and is not complement invariant; Tau Ceti's complement and whole-space laws for `TauCeti.perimeter` assume an additive Haar measure, which `γ` is not.

### 2.2 Weighted variation is the weighted variation measure

Prove that for `u ∈ BV_loc(Ω)`, that is, `u` locally integrable on `Ω` with locally finite Euclidean variation (every compact subset of `Ω` has an open neighbourhood on which `TauCeti.totalVariationOn volume` of `u` is finite), `V_μ(u; Ω) = ∫_Ω e^{−W} d|Du|`, where `|Du| = TauCeti.variationMeasure volume Ω u` (`weightedVariation_eq_lintegral_variationMeasure`). Applied to every open `Ω′ ⊆ Ω`, on which the variation measure is the restriction of the one on `Ω` (`TauCeti.variationMeasure_eq_comap_inclusion`), this shows that `V_μ(u; ·)` extends to the Borel measure `e^{−W} |Du|` on `Ω`, which defines `V_μ(u; B)` and `P_μ(U; B)` for Borel `B ⊆ Ω`. Prove that for `n ≥ 1`, if `U` is Lebesgue measurable and `P_μ(U; Ω) < ∞`, or more generally `U` has locally finite perimeter in `Ω`, then `P_μ(U; Ω) = μ^{n−1}(∂*U) = μ^{n−1}(∂^M U ∩ Ω)`, with `∂*U = TauCeti.reducedBoundary volume Ω U` and `∂^M U = TauCeti.essentialBoundary volume U` (`weightedPerimeter_eq_lintegral_reducedBoundary`), and hence `P_μ(U; B) = μ^{n−1}(∂*U ∩ B) = μ^{n−1}(∂^M U ∩ B)` for every Borel `B ⊆ Ω` (MilmanNeeman2022 line 755–757; CianchiFuscoMaggiPratelli2011 equations (2.3)–(2.5), line 174–208; Maggi2012 Theorem 15.9, cited by locator). A route: the upper bound is the polar decomposition `Du = σ_u |Du|` with `‖σ_u‖ = 1` `|Du|`-a.e.; the lower bound approximates `−e^{−W} σ_u` in `L¹(|Du|)` on compacts by smooth fields of norm at most `e^{−W}`, using the regularity of `|Du|`; the boundary formulas are De Giorgi's theorem, with `ν_U = TauCeti.outerNormal`, and the comparison of essential and reduced boundary. *Needs:* §2.1; Tau Ceti `TauCeti.variationMeasure`, `TauCeti.variationMeasure_preimage_coe`, `TauCeti.variationMeasure_eq_comap_inclusion`, `TauCeti.polarDensity`, `TauCeti.integral_divergenceCLM_mul_eq_neg_integral_inner_polarDensity`, `TauCeti.ae_norm_polarDensity_eq_one`, `TauCeti.reducedBoundary`, `TauCeti.outerNormal`, `TauCeti.essentialBoundary`; GeometricMeasureTheory G5 (De Giorgi's theorem, essential versus reduced boundary).

**Checks.**

- `U = (−1, 1) ⊂ ℝ`: `|Dχ_U| = δ_{−1} + δ_1`, so `P_γ(U) = 2 φ(1) = 0.483941`, with `γ(U) = 0.682689` and `I(0.682689) = 0.356343`.
- In `ℝ²`, removing the origin from `ball(0, 1)`, or adding the null set `ℚ² ∖ ball(0, 1)`, which is dense outside the ball, leaves `P_γ = 0.606531`, though the topological frontier gains the origin, respectively becomes `ℝ² ∖ ball(0, 1)`: in the second case the closure is `ℝ²` while the open ball stays interior, so the origin is not a frontier point and `(2, 0)` is.

### 2.3 Frontier bound, convex sets and explicit perimeters

Prove that for every Lebesgue-measurable `U` and open `Ω`, `P_μ(U; Ω) ≤ μ^{n−1}(∂^M U ∩ Ω) ≤ μ^{n−1}(frontier U ∩ Ω)` in `[0, ∞]`. Prove that for every open convex set `C`, bounded or not, and for every bounded Lipschitz domain `C`, `P_μ(C; Ω) = μ^{n−1}(∂C ∩ Ω)`. For the Gaussian weight prove `P_γ({x : ⟨x, ν⟩ < s}) = φ(s)` for every unit `ν` and real `s`, and `P_γ(ball(0, r)) = (2π)^{−n/2} e^{−r²/2} n ω_n r^{n−1}` for `r > 0`, where `ω_n = volume(ball(0, 1))` (MilmanNeeman2022 line 32–33; CianchiFuscoMaggiPratelli2011 line 48–56 and 182–184). A route: if `U` does not have locally finite perimeter in `Ω`, the boundary criterion gives a compact `K ⊆ Ω` with `μHE[n−1](∂^M U ∩ K) = ∞`, and `e^{−W}` is bounded below on `K`; otherwise apply §2.2 and `∂^M U ⊆ frontier U`. For an open convex `C`: if `C` is `∅` or `E`, which covers `n = 0`, both sides vanish. Otherwise, for every ball `B` the set `C ∩ B` is bounded and convex, so it has finite Euclidean perimeter (`Convex.perimeter_lt_top`), and `P(C; B) = P(C ∩ B; B) ≤ P(C ∩ B)` by locality and monotonicity in the open set (`TauCeti.perimeter_congr_ae`, `TauCeti.perimeter_mono`); hence `C` has locally finite perimeter. Moreover `∂^M C = ∂C`. A point `x ∈ ∂C` lies outside the open set `C`, so a continuous linear functional `f` with `f < f(x)` on `C` (`geometric_hahn_banach_open_point`) confines `C` to a half-space whose boundary passes through `x`, and a density of `C` at `x`, if it exists, is at most `1/2`. For a ball `ball(c, ρ) ⊆ C`, the open segments from `x` to the points of that ball lie in `C` (`Convex.openSegment_interior_closure_subset_interior`), and the cone they fill takes up a fixed positive proportion of every small closed ball about `x`, so such a density is positive. The other inclusion is `TauCeti.essentialBoundary_subset_frontier`. The second statement of §2.2 then gives `P_μ(C; Ω) = μ^{n−1}(∂^M C ∩ Ω) = μ^{n−1}(∂C ∩ Ω)`. For a bounded Lipschitz domain `C`, GeometricMeasureTheory G6 gives `|Dχ_C| = μHE[n−1] ⌊ ∂C`, and the first statement of §2.2 integrates `e^{−W}` against it. For a half-space, `TauCeti.perimeter_setOf_inner_lt` on every open set identifies its perimeter measure with `μHE[n−1]` on the hyperplane `{⟨x, ν⟩ = s}`, so the first statement of §2.2 alone gives `P_μ = ∫_{⟨x, ν⟩ = s} e^{−W} dμHE[n−1]`; there `μHE[n−1]` is the image of `volume` on `ν^⊥` and `e^{−W}(sν + y) = φ(s) e^{−W_{ν^⊥}}(y)` by the explicit density of `γ`. *Needs:* §2.2; Tau Ceti `TauCeti.essentialBoundary_subset_frontier`, `TauCeti.perimeter_setOf_inner_lt`, `TauCeti.perimeter_congr_ae`, `TauCeti.perimeter_mono`, `Convex.perimeter_lt_top`, `TauCeti.euclideanHausdorffMeasure_sphere`, `TauCeti.Probability.stdGaussian_eq_withDensity_norm`; GeometricMeasureTheory G5 (boundary criterion), G6 (bounded Lipschitz domains only); Mathlib `geometric_hahn_banach_open_point`, `Convex.openSegment_interior_closure_subset_interior`, `AffineSubspace.euclideanHausdorffMeasure_coe_image`, `EuclideanGeometry.measurePreserving_vaddConst`.

**Checks.**

- `n = 1`, `r = 1`: the ball formula with `ω_1 = 2` gives `2 φ(1) = 0.483941`, agreeing with §2.2.
- `n = 2`, `r = 1`: `P_γ = e^{−1/2} = 0.606531` and `γ = 1 − e^{−1/2} = 0.393469`, while `I(0.393469) = 0.384633`; a ball is not a minimizer.
- The half-space through the origin has `P_γ = φ(0) = I(1/2)`; `{x_1 < 1}` has `φ(1) = 0.241971`, so Gaussian perimeter is not translation invariant.
- For a ball with a null dense set added outside it the frontier bound is `∞` and strict.
- The open quadrant `C = {x_1 > 0, x_2 > 0}` in `ℝ²` is convex and unbounded. At the corner its density is `1/4`, positive as the cone bound requires and at most `1/2` as the half-space bound requires, so the corner lies in `∂^M C = ∂C`. Each boundary half-line has `γ^1`-measure `∫_0^∞ (2π)^{−1} e^{−t²/2} dt = 0.199471`, so `P_γ(C) = 0.398942`, above `I(1/4) = φ(−0.674490) = 0.317777`. The points of density `1/2` form `∂C` without the corner: reading `∂^M` as density `1/2` would break the set identity `∂^M C = ∂C` at this `μHE[1]`-null point, though not the value.
- Openness is needed: the closed segment `[0, 1] × {0}` in `ℝ²` is convex and null, so `P_γ = 0`, while its frontier is the segment itself, of `γ^1`-measure `φ(0)(Φ(1) − 1/2) = 0.136177`.

### 2.4 Lower semicontinuity and compactness

Prove that `u_k → u` in `L¹_loc(Ω)` implies `V_μ(u; Ω) ≤ liminf V_μ(u_k; Ω)`. Prove that if `μ(E) < ∞`, every sequence of Lebesgue-measurable sets `U_k` with `sup_k P_μ(U_k) < ∞` has a subsequence whose indicators converge in `L¹(μ)` to the indicator of a Lebesgue-measurable set `U`, and then `P_μ(U) ≤ liminf P_μ(U_k)` (CianchiFuscoMaggiPratelli2011 line 209–213; MilmanNeeman2022 line 939–947; Maggi2012 Proposition 12.15 and Theorem 12.26, cited by locator). A route: each functional `u ↦ ∫ u div_μ X dμ` is continuous for `L¹_loc` convergence, so their supremum is lower semicontinuous. For compactness, §2.1 bounds the Euclidean perimeters in every ball, `TauCeti.exists_subseq_tendsto_measure_symmDiff_inter_of_perimeter_le` gives a subsequence converging locally in measure, that is, with indicators converging in `L¹_loc`, and `∫_{‖x‖ > R} |χ_{U_k} − χ_U| dμ ≤ μ({‖x‖ > R})` upgrades it to `L¹(μ)`. *Needs:* §2.1; Tau Ceti `TauCeti.exists_subseq_tendsto_measure_symmDiff_inter_of_perimeter_le`.

**Checks.**

- Under `γ`, `U_k = {x_1 < k}` has `P_γ(U_k) = φ(k) → 0` and converges to `E` in `L¹(γ)`, with `P_γ(E) = 0`.
- For the weight `0` on `ℝ`, `U_k = (k, k + 1)` has perimeter `2` and converges to `∅` in `L¹_loc` but not in `L¹`: finite total mass is needed for compactness in `L¹(μ)`.
- `U_k = (−1, 1) ∪ (1 + 1/k, 2)` converges to `(−1, 2)`; `P_γ(U_k) → 3 φ(1) + φ(2) = 0.779903` while `P_γ((−1, 2)) = φ(1) + φ(2) = 0.295962`, so the inequality can be strict.

### 2.5 Weighted Gauss–Green formula

Prove that for `n ≥ 1`, an open `Ω`, a set `U` of locally finite perimeter in `Ω` and a `C¹` field `X` with compact support in `Ω`, `∫_U div_μ X dμ = ∫_{∂*U} ⟨X, ν_U⟩ dμ^{n−1}`, with `ν_U = TauCeti.outerNormal volume Ω U` (`integral_weightedDivergence_eq_integral_reducedBoundary`). Prove the same identity when `μ(E) < ∞`, `P_μ(U) < ∞`, `X` is `C¹`, bounded with bounded derivative, and `⟨∇W, X⟩ ∈ L¹(μ)`. Deduce for the Gaussian weight that if `P_γ(U) < ∞` and `w ∈ E`, then `t ↦ γ(U + t w)` is differentiable at `0` with derivative `∫_{∂*U} ⟨w, ν_U⟩ dγ^{n−1}` (MilmanNeeman2022 equations (3.1) and (3.3), line 705–708 and 758–761; Maggi2012 Theorem 15.9, cited by locator). A route: apply Tau Ceti's Gauss–Green formula `TauCeti.integral_trace_fderiv_mul_indicator_eq_integral_inner_outerNormal` to the compactly supported `C¹` field `e^{−W} X` and identify the perimeter measure `|Dχ_U|` with `μHE[n−1] ⌊ ∂*U` by De Giorgi's theorem; for bounded fields, multiply by `χ(x/R)` for a cutoff `χ` and pass to the limit by dominated convergence on both sides; for the translation derivative, differentiate `∫_U e^{−W(x + tw)} dx` under the integral and apply the bounded-field identity to the constant field `w`, whose Gaussian divergence `−⟨x, w⟩` is `γ`-integrable. *Needs:* §1.3, §2.2; Tau Ceti `TauCeti.integral_trace_fderiv_mul_indicator_eq_integral_inner_outerNormal`, `TauCeti.Probability.stdGaussian_eq_withDensity_norm`; GeometricMeasureTheory G5 (De Giorgi's theorem).

**Checks.**

- `n = 1`, `U = (−∞, s)`: both sides equal `X(s) φ(s)` (Conventions).
- `U = {x_1 < s}`, `w = e_1`: `γ(U + t e_1) = Φ(s + t)` has derivative `φ(s)` at `0`, and the boundary integral is `⟨e_1, e_1⟩ φ(s) = φ(s)`; an inner normal would give `−φ(s)`.
- `U = E` has empty reduced boundary: for the bounded field `e_1`, `∫ div_γ e_1 dγ = −∫ x_1 dγ = 0`.

### 2.6 Weighted coarea formulas

Prove: (a) for Lipschitz `f : E → ℝ` and Borel `g : E → [0, ∞]`, `∫ g ‖∇f‖ dμ = ∫_ℝ ∫_{f⁻¹(t)} g dμ^{n−1} dt`; (b) for every `u ∈ L¹_loc(Ω)`, `V_μ(u; Ω) = ∫_ℝ P_μ({u > t}; Ω) dt` in `[0, ∞]` (`weightedVariation_eq_lintegral_weightedPerimeter`), and for `u ∈ BV_loc(Ω)` the identity holds with `Ω` replaced by any Borel subset (Maggi2012 Sections 13.1 and 18.1; GeometricMeasureTheory G2 states the unweighted Lipschitz form and Tau Ceti proves the unweighted BV form). A route: (a) is G2's coarea formula with weight `g e^{−W}`; (b) integrates `e^{−W}` against the identity `∫ f d|Du| = ∫_ℝ ∫ f d|Dχ_{u > t}| dt` of `TauCeti.lintegral_variationMeasure_eq_lintegral_lintegral` and uses §2.2 on both sides, and if `u ∉ BV_loc(Ω)` both sides are infinite by the local comparison of §2.1 and `TauCeti.totalVariationOn_eq_lintegral_perimeter`. *Needs:* §2.1, §2.2; GeometricMeasureTheory G2 (coarea); Tau Ceti `TauCeti.lintegral_variationMeasure_eq_lintegral_lintegral`, `TauCeti.totalVariationOn_eq_lintegral_perimeter`, `TauCeti.measurable_perimeter_setOf_lt`.

**Checks.**

- `f(x) = ‖x‖` on `ℝ²`, `g = 1`, `μ = γ`: the left side is `1` and the right side `∫_0^∞ (2π)^{−1} e^{−r²/2} 2πr dr = 1.000000`.
- `u = χ_U` gives `V_μ(χ_U) = ∫_0^1 P_μ(U) dt = P_μ(U)`.
- `u(t) = t` on `ℝ` with `γ`: `∫ φ d|Du| = 1` and `∫_ℝ P_γ((s, ∞)) ds = ∫ φ(s) ds = 1`.

### 2.7 Gaussian invariance and cylinders

Prove that for a linear isometry equivalence `T : E ≃ E′`, `P_{γ_{E′}}(T(U)) = P_{γ_E}(U)` and `γ_{E′}(T(U)) = γ_E(U)`. Prove that for a subspace `F` and a Lebesgue-measurable `U ⊆ F`, the cylinder `U ⊕ F^⊥ = {y + z : y ∈ U, z ∈ F^⊥}` satisfies `γ_E(U ⊕ F^⊥) = γ_F(U)` and `P_{γ_E}(U ⊕ F^⊥) = P_{γ_F}(U)` (MilmanNeeman2022 line 481–483 and 554–556). A route: transport test fields along `T`; for cylinders, split `γ_E = γ_F ⊗ γ_{F^⊥}` (§1.3), integrate the `F^⊥`-component of a field out by Gaussian integration by parts on `F^⊥` (§2.5 with `U = F^⊥`), and bound the remaining term by the `γ_{F^⊥}`-average of the `F`-component, which is a smooth compactly supported field on `F` of norm at most one; fields on `F` extended by cutoffs in `F^⊥` give the reverse inequality. *Needs:* §1.3, §2.1, §2.5; Mathlib `ProbabilityTheory.stdGaussian_map`.

**Checks.**

- `F = ℝ e_1 ⊂ ℝ²`, `U = (−∞, s)`: the cylinder is `{x_1 < s}`, with perimeter `φ(s)` on both sides.
- `F = {0}`: `U` is `∅` or `{0}`, the cylinder is `∅` or `E`, and both perimeters vanish.
- Translating `{x_1 < 0}` by `e_1` changes the perimeter from `0.398942` to `0.241971`, so no translation invariance is claimed.

### Examples

A half-space of Gaussian measure `v` has Gaussian perimeter `I(v)` (§2.3 with §1.1). The interval `(−1, 1)` has `γ = 0.682689` and `P_γ = 0.483941`.

### Dependencies

Layer 1; Tau Ceti's Euclidean variation, perimeter, variation measure, polar decomposition, reduced boundary, Gauss–Green formula, compactness, coarea formula, finite perimeter of bounded convex sets, sphere measure and Gaussian density; GeometricMeasureTheory G2, G5 and G6; Mathlib Hausdorff measure on affine subspaces, smooth bump functions, the separation of an open convex set from a point and segments in convex sets.

## Layer 3: clusters and their interfaces

The weight `W` is arbitrary in §§3.1–3.2; from §3.3 on, `μ(E) = 1`.

### 3.1 Clusters

For `q ≥ 1`, a `q`-cluster for `μ` (`Cluster W q`) is a `q`-tuple `Ω = (Ω_1, …, Ω_q)` of Lebesgue-measurable cells that are pairwise disjoint, satisfy `μ(E ∖ ⋃_i Ω_i) = 0`, equivalently `volume(E ∖ ⋃_i Ω_i) = 0` since `e^{−W} > 0`, and have `P_μ(Ω_i) < ∞` for each `i`; cells may be empty or disconnected. Its total perimeter is `P_μ(Ω) = ½ Σ_i P_μ(Ω_i)` (`Cluster.perimeter`), and when `μ(E) = 1` its measure vector is `μ(Ω) = (μ(Ω_1), …, μ(Ω_q)) ∈ Δ^{(q−1)}`. Two clusters are equivalent when corresponding cells agree up to null sets (MilmanNeeman2022 line 57–67 and 697–702, for `q ≥ 2`; Maggi2012 Part IV synopsis, line 716–725). The one-cell clusters are admitted so that the profile of §3.4 is an infimum for every `q ≥ 1`: up to equivalence the only `1`-cluster is `(E)`, of total perimeter `½ P_μ(E) = 0`. There are no `0`-clusters, since `volume(E) > 0`.

- Equivalent clusters have the same total perimeter and the same measure vector.
- Permuting the cells of a cluster gives a cluster with the same total perimeter and permuted measure vector.
- For `q ≥ 3`, replacing two cells `Ω_i, Ω_j` by `Ω_i ∪ Ω_j` gives a `(q − 1)`-cluster whose total perimeter is at most that of `Ω`: `χ_{Ω_i ∪ Ω_j} = χ_{Ω_i} + χ_{Ω_j}`, so subadditivity of `V_μ` (§2.1) gives `P_μ(Ω_i ∪ Ω_j) ≤ P_μ(Ω_i) + P_μ(Ω_j) < ∞`. The exact decrement is in §3.2.
- For `q = 2`, `P_μ(Ω) = P_μ(Ω_1) = P_μ(Ω_2)` (MilmanNeeman2022 line 68–70), by complement invariance and null invariance.
- A linear isometry of `E` carries `γ`-clusters to `γ`-clusters with the same total perimeter (§2.7).

*Needs:* §2.1, §2.7.

**Checks.**

- Under `γ` on `ℝ`, the cells `(−∞, a), (a, b), (b, ∞)` with `a < b` form a `3`-cluster of total perimeter `½(φ(a) + (φ(a) + φ(b)) + φ(b)) = φ(a) + φ(b)`; the sum without the factor `½` double-counts every interface.
- The pair `({x_1 < s}, {x_1 > s})` is a `2`-cluster of total perimeter `φ(s)`, and `(E, ∅)` is a `2`-cluster of total perimeter `0` with measure vector `(1, 0)`.
- Non-example: `(⋃_{k ≥ 1} (1/(2k+1), 1/(2k)), complement)` in `ℝ` is not a cluster, because the first cell has infinitely many boundary points in `(0, 1)` and infinite perimeter; overlapping cells such as `((−∞, 1), (0, ∞))` are excluded by disjointness.
- The `1`-cluster `(E)` has total perimeter `0` and measure vector `(1)`; `({x_1 < 0})` is not a `1`-cluster, since it leaves the half-space `{x_1 ≥ 0}` of positive measure uncovered.

### 3.2 The interface decomposition

For a `q`-cluster `Ω` and `i ≠ j`, the interface is `Σ_ij = ∂*Ω_i ∩ ∂*Ω_j` and its weighted area is `A_ij = μ^{n−1}(Σ_ij)`. Prove that for every `S ⊆ {1, …, q}`, `μHE[n−1]`-almost every point of `∂*(⋃_{i ∈ S} Ω_i)` lies in `Σ_ij` for some `i ∈ S`, `j ∉ S`; that `μHE[n−1]`-almost every point of `∂*Ω_i` lies in exactly one `Σ_ij`; that `P_μ(Ω_i) = Σ_{j ≠ i} A_ij`, `P_μ(⋃_{i ∈ S} Ω_i) = Σ_{i ∈ S, j ∉ S} A_ij` and `P_μ(Ω) = Σ_{i<j} A_ij`; that the closure of `∂*Ω_i` equals the closure of `⋃_{j ≠ i} Σ_ij`; that equivalent clusters have the same interfaces; and that for `q ≥ 3` the `(q − 1)`-cluster of §3.1 obtained by merging `Ω_i` and `Ω_j` has total perimeter exactly `P_μ(Ω) − A_ij` (MilmanNeeman2022 equations (3.4)–(3.6), line 769–784; Maggi2012 Exercise 29.7, cited by locator). The closure form replaces the literal set equality `∂*Ω_i = ⋃_{j ≠ i} Σ_ij`, which fails (Checks). A route: by G5, `μHE[n−1]`-almost every point `x` has density `0`, `1/2` or `1` for each cell and lies in `∂*Ω_k` exactly when that density is `1/2`; densities of disjoint cells add and sum to `1`; at a point of `∂*(⋃_S Ω_i)` the density of the union is `1/2`, which forces exactly one `i ∈ S` and exactly one `j ∉ S` of density `1/2`. Three cells of density `1/2` at one point are impossible, which gives uniqueness. For the closures, `|Dχ_{Ω_i}| = μHE[n−1] ⌊ ∂*Ω_i` has support the closure of `∂*Ω_i`, and the two measures agree. Interfaces of equivalent clusters agree because the reduced boundary depends only on the class of a set up to null sets. For the merged cluster, the interfaces between unmerged cells are the same sets as before, and the interface of the merged cell with an unmerged cell `Ω_k` has area `A_ik + A_jk`, by comparing `P_μ(Ω_k) = Σ_{l ≠ k} A_kl` in the two clusters; so the sum of its interface areas is `Σ_{k<l} A_kl − A_ij`. *Needs:* §2.2, §3.1; Tau Ceti `TauCeti.reducedBoundary_congr_ae`; GeometricMeasureTheory G5 (density one-half on the reduced boundary, essential versus reduced boundary).

**Checks.**

- For `q = 2`, `Σ_12 = ∂*Ω_1 = ∂*Ω_2` up to null sets, `A_12 = P_μ(Ω_1)` and `P_μ(Ω) = A_12`.
- For the three intervals of §3.1, `Σ_12 = {a}`, `Σ_23 = {b}`, `Σ_13 = ∅`, so `A_12 = φ(a)`, `A_23 = φ(b)`, `A_13 = 0`, and `Σ_{i<j} A_ij = φ(a) + φ(b)` agrees with §3.1.
- Merging: with `a = 0`, `b = 1`, merging the first two intervals gives the `2`-cluster `((−∞, 0) ∪ (0, 1), (1, ∞))`, equivalent to `((−∞, 1), (1, ∞))`, of total perimeter `φ(1) = 0.241971`, which is `(φ(0) + φ(1)) − A_12 = 0.640913 − 0.398942`; subtracting `A_23 = φ(1)` instead would give `0.398942`, and the merged cluster's interface area with the third cell is `A_13 + A_23 = 0 + 0.241971`.
- Negative control for the set equality: in `ℝ²` let `Ω_1 = {x_2 < 0}`, `Ω_2 = ⋃_{k ≥ 0} {x : x_2 > 0, 2^{−2k−1} ≤ ‖x‖ < 2^{−2k}}` and `Ω_3 = {x_2 > 0} ∖ Ω_2`. The boundary of each half-annulus has total Gauss–Green vector `0` and length `2^{−2k}(3π/2 + 1)`, so the ratio defining the normal of `Ω_2` at the origin does not tend to a unit vector; the origin lies in `∂*Ω_1` but in neither `∂*Ω_2` nor `∂*Ω_3`. It is a single, `μHE[1]`-null point, consistent with the almost-everywhere statements.

### 3.3 The interface quadratic form

Prove that if `μ(E) = 1` and `μ(Ω) ∈ int Δ^{(q−1)}`, the graph on `{1, …, q}` with an edge `{i, j}` whenever `A_ij > 0` is connected, and `L_A` is positive definite on `E^{(q−1)}` (MilmanNeeman2022 Lemma 3.4, line 892–905). A route: a component `S` of the graph would give `U = ⋃_{i ∈ S} Ω_i` with `0 < μ(U) < 1` and `P_μ(U) = 0` by §3.2; zero perimeter makes `χ_U` locally of zero variation, hence constant on every ball by the BV Poincaré inequality, hence `U` null or conull. Milman–Neeman use the Gaussian isoperimetric inequality instead; this route holds for every weight. *Needs:* §2.1 (comparison of weighted and Euclidean variation on relatively compact open sets), §3.2; Tau Ceti `TauCeti.setLIntegral_enorm_sub_setAverage_le_mul_totalVariationOn_of_eq_ball` (BV Poincaré on balls).

**Checks.**

- For the three intervals, edges `{1,2}` and `{2,3}` connect the graph, and `⟨a, L_A a⟩ = φ(a)(a_1 − a_2)² + φ(b)(a_2 − a_3)²` vanishes on `E^{(2)}` only at `a = 0`.
- At a boundary point of the simplex the conclusion fails: the cluster `(E, ∅, ∅)` has `A = 0` and `L_A = 0`.

### 3.4 Isoperimetric profiles and minimizing clusters

For `μ(E) = 1`, `q ≥ 1` and `v ∈ Δ^{(q−1)}`, define the isoperimetric profile `I_μ^{(q−1)}(v) = inf {P_μ(Ω) : Ω a q-cluster with μ(Ω) = v}` in `[0, ∞]` (`isoperimetricProfile W q v`); a cluster is `μ`-minimizing when it attains the profile at its own measure vector. Write `I^{(q−1)}` for `I_γ^{(q−1)}` (MilmanNeeman2022 line 169–170 and 909–910). For `q = 1` the cluster `(E)` of §3.1 gives `I_μ^{(0)}(1) = 0`, in particular `I^{(0)}(1) = 0`, the value the padding bullet below uses with `|J| = 1`.

- For `n ≥ 1`, `I_μ^{(q−1)}(v) < ∞` for every `v`: concentric annuli `{r_{i−1} ≤ ‖x‖ < r_i}` with radii chosen by continuity of `r ↦ μ(ball(0, r))` form a cluster with measure vector `v`, and spheres have finite weighted area because `e^{−W}` is continuous.
- `I_μ^{(q−1)}` is invariant under simultaneous permutation of the coordinates of `v`; at a vertex of the simplex it is `0`.
- Padding with empty cells: `I_μ^{(q−1)}(v) ≤ I_μ^{(|J|−1)}(v_J)` when `v` vanishes outside `J`, where `v_J` keeps the coordinates in `J`.
- For `q = 2`, `I_μ^{(1)}(v_1, 1 − v_1) = inf {P_μ(U) : μ(U) = v_1}`.

*Needs:* §2.3, §3.1; Tau Ceti `TauCeti.euclideanHausdorffMeasure_sphere` (for the annuli).

**Checks.**

- At the vertex `(1, 0)`, the cluster `(E, ∅)` shows `I_μ^{(1)}(1, 0) = 0`, which agrees with the padding bound `I_μ^{(1)}(1, 0) ≤ I_μ^{(0)}(1) = 0` for `J = {1}`; a definition of clusters requiring `q ≥ 2` would leave no `1`-clusters and make `I_μ^{(0)}(1)` the infimum over the empty set, `∞`, and the padding bound vacuous at vertices.
- For the smooth positive probability density `ρ(x, y) = c (1 + y²) exp(−x²(1 + y²)⁴)` on `ℝ²`, with `c` normalizing, the line `{x = 0}` has infinite weighted length, so the only half-plane `{x < t}` of measure `1/2` has infinite perimeter; balls give a finite-perimeter set of measure `1/2`, and so does the symmetric slab `{|x| < a}` of measure `1/2`, since `a > 0` and a line `{x = t}` with `t ≠ 0` has finite weighted length. Half-planes `{x < t}` alone would not prove finiteness of the profile.
- For `γ` and `q = 2`, Layer 7 gives `I^{(1)}(1/2, 1/2) = 0.398942`; the ball of measure `0.393469` in `ℝ²` gives the upper bound `I^{(1)}(0.393469, 0.606531) ≤ 0.606531`, consistent with the value `0.384633`.

### 3.5 Existence of minimizing clusters

Prove that if `n ≥ 1` and `μ(E) = 1`, then for every `q ≥ 1` and `v ∈ Δ^{(q−1)}` there is a `μ`-minimizing `q`-cluster `Ω` with `μ(Ω) = v`, so `P_μ(Ω) = I_μ^{(q−1)}(v)` (`exists_cluster_perimeter_eq_isoperimetricProfile`; MilmanNeeman2022 Theorem 4.1 (i), line 918–922, for `q ≥ 2` and `W ∈ C^∞`, with its proof at line 939–956; the route below uses smoothness of `W` only through the lower semicontinuity and compactness of §2.4, which hold for `C¹` weights). For `q = 1` the cluster is `(E)`. A route: take a minimizing sequence, bound each cell's perimeter by twice the total, extract `L¹(μ)`-convergent cells by §2.4, observe that the limit indicators are a.e. disjoint and sum to `1` a.e. so that a null modification is a cluster, get the measures from `L¹(μ)` convergence, and conclude by lower semicontinuity and `Σ liminf ≤ liminf Σ`. *Needs:* §2.4, §3.1, §3.4.

**Checks.**

- `q = 2`, `μ = γ`, `v = (1/2, 1/2)`: a minimizer exists, and Layer 7 identifies it as a half-space through the origin, with perimeter `0.398942`.
- For the weight `0` on `ℝ`, whose mass is infinite, the sets `(k, k + 1)` of measure `1` and perimeter `2` form a minimizing sequence with no `L¹`-convergent subsequence; the infimum is attained there only by translation invariance, so the route genuinely uses `μ(E) = 1`.
- `n = 0` is excluded: on the zero space `volume` is the unit mass at the origin, every cell is `∅` or `{0}` up to a null set, so for `q = 2` only the vertices `(1, 0)` and `(0, 1)` are measure vectors of clusters, and for `v = (1/2, 1/2)` there is no cluster at all and the profile is the empty infimum `∞`.

### Examples

Under `γ` on `ℝ`, the cluster `((−∞, a), (a, b), (b, ∞))` has interface areas `φ(a), 0, φ(b)` and total perimeter `φ(a) + φ(b)`.

### Dependencies

Layer 2; Tau Ceti's reduced boundary, BV Poincaré inequality and sphere measure; GeometricMeasureTheory G5.

## Layer 4: model simplicial clusters and the model profile

From here on `μ = γ`. The cluster number satisfies `2 ≤ q ≤ n + 1` whenever a simplicial cluster in `E` is involved; the canonical model lives in `E^{(q−1)}` for every `q ≥ 2`. The one-point space `E^{(0)}` enters only through the value `I_m^{(0)}(1) = 0` of §4.4.

### 4.1 The canonical model cluster

For `q ≥ 2`, on `E^{(q−1)}` with its standard Gaussian `γ_{q−1} = stdGaussian (simplexTangent q)` and `γ_{q−1}^{q−2} = e^{−W} μHE[q−2]`, `W` the Gaussian weight of `E^{(q−1)}`, define the model cells `Ω^m_i = {x ∈ E^{(q−1)} : x_i > x_j for all j ≠ i}` (`modelCell q i`), which are the interiors of `{x : max_j x_j = x_i}`; the translated model cluster `x + Ω^m = (x + Ω^m_1, …, x + Ω^m_q)` for `x ∈ E^{(q−1)}`; the model interfaces `Σ^m_ij = {x : x_i = x_j ≥ x_k for all k}`; and the model interface areas `A^m_ij(x) = γ_{q−1}^{q−2}(x + Σ^m_ij)` (`modelInterfaceArea q i j x`, used only for `i ≠ j`) (MilmanNeeman2022 line 499–505).

- `x + Ω^m` is a `γ_{q−1}`-cluster whose cells are open convex polyhedral cones with apex `x`; its interfaces in the sense of §3.2 are the closed faces `x + Σ^m_ij` up to `μHE[q−2]`-null sets (the closed faces also contain the lower-dimensional strata where three or more cells meet), with constant normal `n_ij = (e_j − e_i)/√2` pointing from cell `i` to cell `j`.
- `A^m_ij(x) > 0` for all `i ≠ j` and `x`, and `P_γ(x + Ω^m) = Σ_{i<j} A^m_ij(x)`.
- Every codimension-two face `F_ijk = {x_i = x_j = x_k ≥ x_l for all l}` lies on exactly the three interfaces `Σ^m_ij, Σ^m_jk, Σ^m_ki`; the outward conormal of `Σ^m_ij` along `F_ijk` within the hyperplane `{x_i = x_j}` is `η_{ij,k} = (2e_k − e_i − e_j)/√6`, and `η_{ij,k} + η_{jk,i} + η_{ki,j} = 0`.
- Writing `x + Σ^m_ij = ⟨n_ij, x⟩ n_ij + (π_ij x + Σ^m_ij)` with `π_ij` the orthogonal projection onto `n_ij^⊥ ∩ E^{(q−1)}`, `A^m_ij(x) = φ(⟨n_ij, x⟩) γ_{n_ij^⊥}(π_ij x + Σ^m_ij)`.

*Needs:* §1.3, §2.3, §3.2.

**Checks.**

- `q = 2`: `E^{(1)} = ℝ u` with `u = (e_1 − e_2)/√2`; for `x = t u`, `x + Ω^m_1 = {s u : s > t}` has measure `Φ(−t)` and `A^m_12(tu) = φ(t)`.
- `q = 3`, `x = 0`: each `Σ^m_ij` is a ray from the origin, so `A^m_ij(0) = ∫_0^∞ (2π)^{−1} e^{−s²/2} ds = 1/(2√(2π)) = 0.199471` and `P_γ(Ω^m) = 0.598413`; the cells have measure `1/3` each.
- The conormals for `(i, j, k) = (1, 2, 3)` are `(−1, −1, 2)/√6`, `(2, −1, −1)/√6` and `(−1, 2, −1)/√6`, summing to `0` and meeting at `120°`; for a non-equidistant triple of centres the bisectors do not meet at equal angles and the sum is nonzero.
- Negative control for literal equality of closed faces and interfaces: for `q = 3` and `x = 0` the origin lies on all three closed faces `Σ^m_12, Σ^m_23, Σ^m_13`, but on no reduced-boundary interface of §3.2. Each cell is a `120°` sector of density `1/3` at the origin, not `1/2`, and its averaged normal `Dχ(B_r)/|Dχ|(B_r)` is the mean of the two edge normals, which meet at `60°`, of norm `cos 30° = √3/2 < 1`. The difference is the `μHE[1]`-null set `{0}`, so both readings give the areas `0.199471`.
- Negative control for `q = 1`: `E^{(0)} = {0}` carries the Dirac mass `δ_0`, the standard Gaussian of the zero space; the one-cell tuple `({0})` is the trivial `1`-cluster of §3.1, of total perimeter `0`, and there are no interfaces. With natural subtraction the weight `e^{−W} μHE[q − 2]` would read `e^{−W} μHE[0]`, the counting measure, a junk value; interface areas are defined and used for `q ≥ 2` only, and for `q = 1` there is no pair `i < j` at which they would be read.

### 4.2 Simplicial clusters in a Euclidean space

For `2 ≤ q ≤ n + 1` and points `p_1, …, p_q ∈ E` with `‖p_i − p_j‖` equal to one positive number for all `i ≠ j`, the simplicial cluster with these centres has cells `Ω_i = {y ∈ E : ‖y − p_i‖ < ‖y − p_j‖ for all j ≠ i}`, the interiors of the Voronoi cells (MilmanNeeman2022 line 76–82).

- Every simplicial cluster is the image `ι(x + Ω^m) ⊕ (range ι)^⊥`, cell by cell, for some linear isometric embedding `ι : E^{(q−1)} → E` and some `x ∈ E^{(q−1)}`; conversely every such image is simplicial. The point `ι(x)` is the projection of the circumcentre of the centres onto `range ι`.
- The cells of a simplicial cluster are open convex polyhedral cones with common apex the circumcentre `c`, and the cluster is unchanged when every centre `p_i` is replaced by `c + λ(p_i − c)` for a real `λ > 0`: the condition `‖y − p_i‖ < ‖y − p_j‖` reads `⟨y − c, p_j − p_i⟩ < 0`, which is invariant under multiplying `p_j − p_i` by `λ > 0`.
- A simplicial cluster is a `γ`-cluster, and `γ(Ω_i) = γ_{q−1}(x + Ω^m_i)`, `P_γ(Ω) = P_γ(x + Ω^m)` (§2.7).

*Needs:* §2.7, §4.1; Mathlib `ProbabilityTheory.stdGaussian_map`.

**Checks.**

- `q = 2`: two centres give the complementary open half-spaces bounded by the bisecting hyperplane, a pair of measure vector `(Φ(s), 1 − Φ(s))` and perimeter `φ(s)`, `s` the signed distance of the hyperplane from the origin.
- `q = 3` in `ℝ²` with an equilateral triangle centred at the origin: three `120°` sectors, each of measure `1/3`, total perimeter `0.598413`.
- Non-example: the collinear centres `0, 1, 2` in `ℝ` give the Voronoi cells `(−∞, 1/2), (1/2, 3/2), (3/2, ∞)`, a `3`-cluster, but not a simplicial one: the centres are not equidistant, and `q = 3 > n + 1`.
- Scaling factor: the centres `−1, 1` in `ℝ` have circumcentre `0` and first cell `(−∞, 0)`; after scaling by `λ` the first-cell condition `‖y + λ‖ < ‖y − λ‖` is `4λy < 0`. For `λ = 2` it is `8y < 0`, the same cell; for `λ = −1` it is `−4y < 0`, the cell `(0, ∞)`, so the cells are exchanged; for `λ = 0` it is `0 < 0`, both centres coincide and both cells are empty. The restriction `λ > 0` is needed.

### 4.3 The measure map

Prove that for `q ≥ 2` the measure map `Ψ : E^{(q−1)} → ℝ^q`, `Ψ(x) = γ_{q−1}(x + Ω^m)` (`modelMeasureMap q`), is `C^∞`, injective, with image `int Δ^{(q−1)}`, and that its derivative at every `x` is the linear map `−L_{A^m(x)}/√2` of `E^{(q−1)}`, which is invertible because every model interface area `A^m_ij(x)` with `i ≠ j` is positive (§4.1), so that `⟨a, L_{A^m(x)} a⟩ = Σ_{i<j} A^m_ij(x) (a_i − a_j)²` vanishes on `E^{(q−1)}` only at `a = 0`; hence `Ψ` is a diffeomorphism of `E^{(q−1)}` onto `int Δ^{(q−1)}` (`modelMeasureMap_diffeomorph`, which states injectivity, the image, smoothness, the derivative and the positivity of the areas; MilmanNeeman2022 Lemma 2.1, line 506–543). A route: smoothness by differentiating `∫_{Ω^m_i} e^{−W(x + y)} dy`; the derivative from the translation formula of §2.5, `∂_w Ψ_i(x) = Σ_{j ≠ i} ⟨w, n_ij⟩ A^m_ij(x) = −(L_{A^m(x)} w)_i/√2`; invertibility from `A^m_ij > 0`. For injectivity, given `y ≠ x` take `i` maximizing `(y − x)_i`; then `y + Ω^m_i ⊊ x + Ω^m_i` and the difference contains an open set, so `Ψ_i(y) < Ψ_i(x)`. (Milman–Neeman assert `y ∈ x + Ω^m_i` for some `i`, which fails when the maximal coordinate of `y − x` is attained twice; the maximal-coordinate argument covers ties.) For surjectivity, `Ψ` is open (inverse function theorem) and proper onto `int Δ^{(q−1)}`: if `x_k` is unbounded then `max_i x_{k,i} → ∞` along a subsequence, and `x + Ω^m_i ⊆ {z : z_i ≥ x_i}` gives `Ψ_i(x_k) ≤ 1 − Φ(√(q/(q−1)) x_{k,i}) → 0`. So the image is open and closed in the connected set `int Δ^{(q−1)}`. Milman–Neeman's invariance-of-domain step is not needed. *Needs:* §1.2, §1.3, §2.5, §4.1; Tau Ceti `TauCeti.Probability.stdGaussian_eq_withDensity_norm`; Mathlib `isOpenMap_of_hasStrictFDerivAt_equiv`.

**Checks.**

- `q = 2`, `x = t u`: `Ψ_1(tu) = Φ(−t)` has derivative `−φ(t) = −0.312254` at `t = 0.7` (numerical difference quotient `−0.312254`), while `−(L_A u)_1/√2 = −√2 φ(t) · (1/√2) = −φ(t)`; the sign `+L_A/√2` would give `+φ(t)`.
- `q = 3`, `x = 0`: `L_{A^m(0)} = 3A Id` on `E^{(2)}` with `A = 0.199471`, so `DΨ(0) = −0.423142 Id`; `Ψ(0) = (1/3, 1/3, 1/3)`.
- Ties: for `y − x = (1, 1, −2)` no open cell contains `y − x`, and the maximal-coordinate argument with `i = 1` still gives `Ψ_1(y) < Ψ_1(x)`.
- Invertibility of the derivative is a separate conclusion: `t ↦ t³` on `ℝ` is smooth, injective and onto an open set, with derivative `0` at `0`. For `q = 2` the derivative of `Ψ` along `u` is `−(L_A u)_1/√2 = −φ(t) ≠ 0`, because `A^m_12(tu) = φ(t) > 0`; were an area `0` for `q = 3`, say `A_13 = 0` with `A_12, A_23 > 0`, `L_A` would still be injective on `E^{(2)}`, but with `A_12 = A_13 = 0` it would kill `(2, −1, −1)`.

### 4.4 The model profile and its transport

For `q ≥ 1` define the model profile `I_m^{(q−1)} : int Δ^{(q−1)} → ℝ` by `I_m^{(q−1)}(v) = P_γ(Ψ⁻¹(v) + Ω^m) = Σ_{i<j} A^m_ij(Ψ⁻¹(v))` (MilmanNeeman2022 Definition 2.2, line 548–553, for `q ≥ 2`). For `q = 1`, `E^{(0)} = {0}`, `Ψ(0) = (1)` and the sum is empty, so `I_m^{(0)}(1) = 0`, the perimeter of the trivial `1`-cluster; the face identity of §4.5 uses this value at vertices. `modelProfile q v` is this function on the open simplex, extended by `0` to the rest of `ℝ^q`; the continuous extension of §4.5 to the closed simplex is a different function on the boundary, and `I_m^{(q−1)}` on the closed simplex means that extension. Prove that for `2 ≤ q ≤ n + 1`, every simplicial `q`-cluster in `E` with measure vector `v ∈ int Δ^{(q−1)}` has total perimeter `I_m^{(q−1)}(v)`, and that for every such `v` a simplicial cluster with measure vector `v` exists (MilmanNeeman2022 line 554–556). *Needs:* §4.2, §4.3.

- `I_m^{(q−1)}` is invariant under permuting coordinates, and `I_m^{(1)}(v) = I(v_1)` on `int Δ^{(1)}`.
- For `q ≥ 2`, `I_m^{(q−1)}(v) > 0` on `int Δ^{(q−1)}`.

**Checks.**

- `q = 2`: for `v_1 = Φ(−t)`, `I_m^{(1)}(v) = φ(t) = I(v_1)`; at `v = (1/2, 1/2)` the value is `0.398942`.
- `q = 3`: `I_m^{(2)}(1/3, 1/3, 1/3) = 0.598413`, larger than the single-bubble value `I(1/3) = 0.363600`, as it must be since `(Ω_1, Ω_2 ∪ Ω_3)` is a `2`-cluster of smaller perimeter.
- Negative control for `q = 1`: in its relative topology `int Δ^{(0)} = Δ^{(0)} = {(1)}` and `I_m^{(0)}(1) = 0`, so positivity would read `0 > 0`; it is claimed only for `q ≥ 2`. The face value `I_m^{(2)}(1, 0, 0) = I_m^{(0)}(1) = 0` and the two-cell value `I_m^{(1)}(1/2, 1/2) = 0.398942 > 0` are unaffected.
- Evaluating the interface sum at the point `v − (1/q, …, 1/q)` instead of at `Ψ⁻¹(v)` is a plausible wrong definition: for `q = 2` and `v = (Φ(1), 1 − Φ(1))` it gives `φ(0.482734) = 0.355065`, whereas `I_m^{(1)}(v) = φ(1) = 0.241971`.

### 4.5 Boundary behaviour of the model profile

Prove that `I_m^{(q−1)}` is `C^∞` on `int Δ^{(q−1)}`, extends continuously to `Δ^{(q−1)}`, and that the extension satisfies `I_m^{(q−1)}(v) = I_m^{(|J|−1)}(v_J)` whenever `v` lies in the face `Δ_J = {v : v_i > 0 exactly for i ∈ J}`, `0 < |J| < q` (MilmanNeeman2022 Lemma 2.3, line 558–564, with its proof at line 577–659). A route: smoothness from §4.3 and the factorization of `A^m_ij` in §4.1; for the boundary, by permutation invariance (§4.4) take `J = {1, …, k}`, let `v_m ∈ int Δ^{(q−1)}` tend to `v ∈ Δ_J`, put `x_m = Ψ⁻¹(v_m)`, and let `y_m` be the orthogonal projection of `x_m` onto the copy of `E^{(k−1)}` in `E^{(q−1)}` formed by the vectors supported on `J`. For `i ∈ J` the cell `x_m + Ω^m_i` lies in the cylinder over the cell `y_m + Ω^{(k)}_i` of the canonical `k`-cell model, a cylinder of measure `Ψ^{(k)}_i(y_m)` by §1.3. So `v_{m,i} ≤ Ψ^{(k)}_i(y_m)` for `i ∈ J`, where the left sides sum to a limit `1` and the right sides to exactly `1`; hence `Ψ^{(k)}(y_m) → v_J`, and for `k ≥ 2` §4.3 gives `y_m → (Ψ^{(k)})⁻¹(v_J)` (for `k = 1`, `y_m = 0`). Next, `x_{m,l} − x_{m,i} → ∞` for `i ∈ J` and `l ∉ J`. Otherwise, along a subsequence some such difference stays bounded above; take `l` minimizing `x_{m,l}` over `l ∉ J`, the same `l` for every `m` after passing to a further subsequence. The coordinates of `x_m` in `J` differ boundedly because `y_m` converges, so `x_{m,l} ≤ x_{m,j} + C` for every `j`. Then `x_m + Ω^m_l` contains the fixed set `{z : z_l > z_j + C for all j ≠ l}`, of positive measure, against `v_{m,l} → 0`. Now let `x_m + Σ^m_ij` be an interface with an index outside `J`. It lies either in a hyperplane `{z_i − z_j = c_m}` with `|c_m| → ∞`, which has area `φ(c_m/√2)` (§2.3), or, when both indices lie outside `J`, in a hyperplane `{z_i − z_j = c_m}` cut by a half-space `{z_i − z_l ≥ d_m}` with `l ∈ J` and `d_m → ∞`. On the hyperplane `{z_i − z_j = c}`, the coordinate difference `z_i − z_l` (`l ≠ i, j`) is Gaussian with mean `c/2` and variance `3/2` (§1.3), so the cut piece has area at most `φ(c/√2) (1 − Φ((d − c/2)/√1.5))`; with `d = d_m → ∞` this tends to `0` whatever `c` is (§1.2). An interface `x_m + Σ^m_ij` with `i, j ∈ J` lies in the cylinder over `y_m + Σ^{(k)}_ij`, whose area is `A^{(k)}_ij(y_m)` by §1.3. The two differ by pieces `{z_i − z_j = c_m, z_l − z_i ≥ d_m}` with `l ∉ J`, `c_m` bounded and `d_m → ∞`, and these have vanishing area by the same bound. Summing, `I_m^{(q−1)}(v_m) → I_m^{(k−1)}(v_J)` along every such sequence, which defines the continuous extension; for `k = 1` no pair lies in `J` and the limit is `0`. *Needs:* §1.2, §1.3, §2.3, §4.1, §4.3, §4.4.

**Checks.**

- `I_m^{(2)}(1/2, 1/2, 0) = I_m^{(1)}(1/2, 1/2) = 0.398942`. Along `v_m → (1/2, 1/2, 0)` the projections `y_m` tend to `(Ψ^{(2)})⁻¹(1/2, 1/2) = 0`, so `A^m_12(x_m) → A^{(2)}_12(0) = φ(0) = 0.398942`, while `A^m_13, A^m_23 → 0`.
- At a vertex, `I_m^{(q−1)}(e_i) = I_m^{(0)}(1) = 0`.
- `I_m^{(1)}` extends by `0` at `(1, 0)` and `(0, 1)`, matching `I(0) = I(1) = 0`; extending by `φ(0)` would contradict continuity.

### 4.6 The differential identities of the model profile

Prove that for `q ≥ 2`, on `int Δ^{(q−1)}`, `∇I_m^{(q−1)} = Ψ⁻¹/√2` and `∇²I_m^{(q−1)} = −(L_{A^m} ∘ Ψ⁻¹)⁻¹` as tensors on `E^{(q−1)}` (`modelProfile_hessian`, which writes both at `v = Ψ(x)` through `g(w) = I_m(Ψ(x) + w)` on `E^{(q−1)}`: `Dg(0) = ⟨x, ·⟩/√2`, and the second derivative `H` of `g` at `0` satisfies `H(L_{A^m(x)} u, b) = −⟨u, b⟩` for all `u, b ∈ E^{(q−1)}`, which determines `H` because `L_{A^m(x)}` is invertible on `E^{(q−1)}`), and consequently `−tr[(∇²I_m^{(q−1)})⁻¹] = 2 I_m^{(q−1)}` (MilmanNeeman2022 Proposition 2.4, line 669–695, and equations (1.3)–(1.4), line 200–207). A route: from the factorization of §4.1, `∂_w A^m_ij(x) = −⟨w, n_ij⟩⟨n_ij, x⟩ A^m_ij(x) + φ(⟨n_ij, x⟩) ∂_{π_ij w} γ_{n_ij^⊥}(π_ij x + Σ^m_ij)`; by the translation formula of §2.5 inside the hyperplane, the second term is a sum of integrals over the faces `x + F_ijk` against the conormals `η_{ij,k}`, and these cancel in `Σ_{i<j}` by the balancing identity of §4.1. Hence `∇_w Σ_{i<j} A^m_ij(x) = −½ ⟨w, L_{A^m(x)} x⟩`; compose with `D(Ψ⁻¹) = −√2 (L_{A^m} ∘ Ψ⁻¹)⁻¹` from §4.3 and differentiate once more. The trace identity uses `tr_{E^{(q−1)}} (e_i − e_j)(e_i − e_j)ᵀ = 2`. *Needs:* §2.5, §4.1, §4.3, §4.4.

**Checks.**

- `q = 2` in the coordinate `v_1`: `∇I_m^{(1)}` along `u` is `I′(v_1)/√2 = −Φ⁻¹(v_1)/√2`, and `Ψ⁻¹(v)/√2 = (−Φ⁻¹(v_1)/√2) u`; the second derivative along `u` is `I″(v_1)/2 = −1/(2 I(v_1)) = −1/(2 A_12)`, matching `−L_A⁻¹`.
- `q = 3` at `v = (1/3, 1/3, 1/3)`: `∇I_m = 0`, `∇²I_m = −1.671086 Id` on `E^{(2)}`, and `−tr[(∇²I_m)⁻¹] = 1.196827 = 2 × 0.598413`.
- For `q = 3` and `x = 0` each interface is a ray with apex `0`, and the boundary term of `Σ^m_ij` is `(2π)^{−1} ⟨w, η_{ij,k}⟩` with `(2π)^{−1} = 0.159155`; the three terms cancel. Keeping one of them would give a nonzero gradient at the symmetric point `(1/3, 1/3, 1/3)`, where permutation symmetry forces `∇I_m = 0`.

### 4.7 The easy inequality

Prove that for `1 ≤ q ≤ n + 1` and every `v ∈ int Δ^{(q−1)}`, `I^{(q−1)}(v) ≤ I_m^{(q−1)}(v)` (`isoperimetricProfile_le_modelProfile`, where `modelProfile` is the model profile on the open simplex), and that the inequality holds at every `v ∈ Δ^{(q−1)}` for the continuous extension of §4.5 (MilmanNeeman2022 line 660–666). For `q = 1` both sides are `0` at `(1)` (§3.4, §4.4). A route: in the interior, for `q ≥ 2`, a simplicial cluster of §4.4 with measure vector `v` is a competitor of total perimeter `I_m^{(q−1)}(v)`; on a face `Δ_J`, pad the simplicial `|J|`-cluster with empty cells and use §4.5; at a vertex use `(E, ∅, …)`. *Needs:* §3.4, §4.4, §4.5.

**Checks.**

- `q = 2`, `v = (1/2, 1/2)`: `I^{(1)} ≤ 0.398942`, an equality by Layer 7.
- `q = 3`, `v = (1/3, 1/3, 1/3)`, `n ≥ 2`: `I^{(2)}(v) ≤ 0.598413`.
- For `n < q − 1` no simplicial `q`-cluster exists in `E` and the statement is not claimed: in `ℝ`, `q = 3`, the three-interval cluster with measures `(1/3, 1/3, 1/3)` has perimeter `2 φ(Φ⁻¹(1/3)) = 0.727200`, above `0.598413`. For `n = 0` and `q = 2` the bound fails outright: no `2`-cluster has measure vector `(1/2, 1/2)` (§3.5, Checks), so `I^{(1)}(1/2, 1/2) = ∞ > 0.398942`.
- The interior statement cannot be read on the boundary with the model profile extended by `0` off `int Δ^{(q−1)}` (§4.4): at `(1/2, 1/2, 0)`, for `n ≥ 2`, the profile is `I^{(2)}(1/2, 1/2, 0) = I(1/2) = 0.398942` (a null third cell adds no perimeter, and the other two are complementary up to a null set), against the extended value `0`; the continuous extension of §4.5 gives `0.398942`, an equality.

### Examples

The tripod cluster in `ℝ²` with measure vector `(1/3, 1/3, 1/3)` has interface areas `0.199471` each, total perimeter `0.598413`, `DΨ = −0.423142 Id` and `∇²I_m = −1.671086 Id` at its parameter `0`.

### Dependencies

Layers 1–3; Tau Ceti's Gaussian density; GeometricMeasureTheory G5 and G6 through §2.3 and §2.5; Mathlib's inverse function theorem.

## Layer 5: Gaussian isoperimetry on the line

### 5.1 Sets of locally finite perimeter on the line

Prove that if `J ⊆ ℝ` is an open interval and `U ⊆ ℝ` is Lebesgue measurable with locally finite perimeter in `J`, then `T = ∂^M U ∩ J` is a locally finite subset of `J`, equals `∂*U ∩ J`, and `U ∩ J` agrees a.e. with a union of open intervals whose endpoints in `J` are exactly the points of `T`; consequently `P_μ(U; B) = Σ_{t ∈ T ∩ B} e^{−W(t)}` for every weight `W` on `ℝ` and Borel `B ⊆ J` (CianchiFuscoMaggiPratelli2011 line 245–248). A route: almost every point is a Lebesgue point of `χ_U` with value `0` or `1`, and every neighbourhood of a point of `T` contains Lebesgue points of both values; for a compact subinterval `K` of an open `J′` with compact closure in `J`, `TauCeti.Real.ofReal_sum_abs_sub_le_totalVariationOn` bounds the number of alternations between the values `0` and `1` along `K` by the finite variation of `χ_U` on `J′`, so `T ∩ K` is finite and `χ_U` is a.e. constant on each gap of `T`; the derivative measure of such a step function is the signed sum of unit masses at its jumps. *Needs:* §2.2; Tau Ceti `TauCeti.Real.ofReal_sum_abs_sub_le_totalVariationOn`, `TauCeti.essentialBoundary`; Mathlib `Besicovitch.ae_tendsto_measure_inter_div`.

**Checks.**

- `U = (0, 1) ∪ (1, 2)`: the point `1` has density one, so `T = {0, 2}` and `P_γ(U) = φ(0) + φ(2) = 0.452933`, not `φ(0) + 2φ(1) + φ(2)`.
- `U = ℚ` is null: `T = ∅` and `P_γ(U) = 0`, although its frontier is `ℝ`.
- `U = ⋃_{k ≥ 1} (1/(2k+1), 1/(2k))` has locally finite perimeter in `(0, ∞)` but not in any interval containing `0`, where `T` accumulates.

### 5.2 Shifting intervals

Prove that for `−∞ < a < b < ∞` with `a + b ≥ 0` and every `a < a′ < b′ ≤ ∞` with `γ¹((a′, b′)) = γ¹((a, b))`, `φ(a′) + φ(b′) < φ(a) + φ(b)`, with `φ(∞) = 0`; symmetrically for `a + b ≤ 0` and left shifts (CianchiFuscoMaggiPratelli2011 Definition 3.2 and Lemma 3.3, line 226–232). A route: along the shift `b′` is a function of `a′` with `db′/da′ = φ(a′)/φ(b′)`, so `d(φ(a′) + φ(b′))/da′ = −φ(a′)(a′ + b′) < 0` because `a′ + b′ > a + b ≥ 0`. *Needs:* §1.1; Tau Ceti `TauCeti.Probability.hasDerivAt_cdf_gaussianReal` (`Φ′ = φ`).

**Checks.**

- `(0, 1)` has `γ¹ = 0.341345` and perimeter `0.640913`; its right shift to a half-line is `(0.408796, ∞)` with perimeter `0.366963 = I(0.341345)`.
- Negative control: `(−1, 0)` has `a + b < 0`, and its right shifts `(−0.9, 0.063724)` and `(−0.5, 0.385003)` have perimeters `0.664218` and `0.722510`, both larger than `0.640913`.

### 5.3 The one-dimensional theorem with equality

Prove that every Lebesgue-measurable `U ⊆ ℝ` satisfies `P_γ(U) ≥ I(γ¹(U))`, with equality if and only if `γ¹(U) ∈ {0, 1}` or `U` agrees a.e. with `(−∞, s)` or `(s, ∞)` for some real `s` (CianchiFuscoMaggiPratelli2011 Proposition 3.1, line 220–223, with its proof at line 233–293). A route: by §5.1 assume `P_γ(U) < ∞` and `U` a locally finite union of intervals. The truncation `U ∩ (−R, R)` has finitely many components, perimeter at most `P_γ(U) + 2φ(R)` and measure tending to `γ¹(U)`, so continuity of `I` reduces the inequality to finite unions, which follows by induction on the number of bounded components using §5.2, complement invariance and `I(1 − v) = I(v)`. For equality, if `0 < γ¹(U) < 1` and `U` is not a.e. a half-line, then `U` or its complement has a bounded component, and one shift of §5.2 produces a set of the same measure and strictly smaller perimeter, to which the inequality applies. *Needs:* §1.1, §2.2, §5.1, §5.2.

**Checks.**

- `(−∞, −0.430727)` and `(0.430727, ∞)` have measure `1/3` and perimeter `0.363600 = I(1/3)`.
- `(−1, 1)` and its complement have perimeter `0.483941`, measures `0.682689` and `0.317311`, and `I` of either is `0.356343`.
- `(−∞, 0) ∪ ℚ` has perimeter `φ(0) = I(1/2)`: equality holds up to null sets, so the characterization cannot be stated for literal half-lines.

### Examples

The intervals `(0, 1)`, `(−1, 1)` and `(−∞, s)` have perimeters `0.640913`, `0.483941` and `φ(s)` against `I` values `0.366963`, `0.356343` and `φ(s)`.

### Dependencies

Layers 1–2; Tau Ceti's one-dimensional variation bound, essential boundary and derivative of the Gaussian distribution function; Mathlib's Lebesgue density theorem.

## Layer 6: Gaussian symmetrisation of sets of finite Gaussian perimeter

### 6.1 Gaussian symmetrals

For a subspace `F ⊆ E` of dimension `k ≥ 1`, a unit vector `u ∈ F` and a Lebesgue-measurable `U ⊆ E`, write `U_x = {y ∈ F : x + y ∈ U}` for `x ∈ F^⊥` and `v_U(x) = γ_F(U_x)`, and define the Gaussian symmetral `S_{F,u}(U) = {x + y : x ∈ F^⊥, y ∈ F, Φ(⟨y, u⟩) < v_U(x)}` (`gaussianSymmetral F u U`, which reads the section over `x − P_F x` through `Submodule.starProjection` and writes `⟨x, u⟩ = ⟨P_F x, u⟩` since `u ∈ F`). For `F = ℝ e` and `u = e` it is the Ehrhard symmetral `S_e(U) = {z + te : z ∈ e^⊥, Φ(t) < v_U(z)}`, with `v_U(z) = γ¹({t : z + te ∈ U})` (CianchiFuscoMaggiPratelli2011 line 543–552, in the mirrored superlevel convention with their upper-tail `Φ`; Ehrhard1983 Définition 1.1, line 117–129, for open and closed sets and also in the mirrored superlevel convention: with his `T = F^⊥`, his `S(T, u)` is `S_{F,−u}` on open sets).

- `S_{F,u}(U)` is Lebesgue measurable, `v_{S_{F,u}(U)} = v_U` almost everywhere on `F^⊥`, and `γ(S_{F,u}(U)) = γ(U)`.
- If `U ⊆ U′` then `S_{F,u}(U) ⊆ S_{F,u}(U′)`; sets equal up to a null set have symmetrals equal up to a null set; `S_{F,u}` is idempotent.
- For a linear isometry `T` of `E` with `T(F) = F` and `T(u) = u`, `S_{F,u}(T(U)) = T(S_{F,u}(U))`.
- Half-spaces `{⟨x, u⟩ < a}` are fixed, `S_{F,u}(∅) = ∅` and `S_{F,u}(E) = E`. If `γ(U) = 0` then `S_{F,u}(U)` is null, and if `γ(U) = 1` then `E ∖ S_{F,u}(U)` is null; that is, `S_{F,u}(U)` equals `∅`, respectively `E`, up to a null set. The literal equality `S_{F,u}(U) = ∅`, respectively `E`, holds when every section `U_x` is `γ_F`-null, respectively of full `γ_F`-measure.

A route: Fubini along the splitting of §1.3, and the identity `γ_F({y : Φ(⟨y, u⟩) < v}) = v` for `v ∈ [0, 1]`. *Needs:* §1.1, §1.3.

**Checks.**

- `{⟨x, e⟩ < a}` has sections of measure `Φ(a)` and is fixed by `S_e`. The superlevel rule, which replaces a section of measure `v` by the upper half-line of measure `v`, sends it to the reflected half-space `{⟨x, e⟩ > −a}`: a different set of the same measure `Φ(a)`, `0.841345` at `a = 1`, so the rule fails literal fixedness. Keeping the threshold `a` and flipping the side instead gives `{⟨x, e⟩ > a}`, of the wrong measure `1 − Φ(a) = 0.158655` at `a = 1`.
- For `U = ball(0, 1) ⊂ ℝ²` and `e = e_2`, `v_U(z) = 2Φ(√(1 − z²)) − 1` for `|z| < 1` and `0` otherwise; `γ(S_e(U)) = 0.393469 = γ(U)`, and the section of `S_e(U)` over `z = 0` is `(−∞, 0.475233)`.
- `S_e` of the null set `ℚ e` is `∅`, and of its complement is `E`: every section of `ℚ e` is `γ¹`-null and every section of its complement has full measure.
- Negative control for literal null images: in `ℝ²` with `F = ℝ e_2` and `u = e_2`, the vertical line `U = ℝ e_2` has `γ(U) = 0`, but `v_U(0) = 1` and `v_U(z) = 0` for `z ≠ 0`, so `S_{F,u}(U) = U ≠ ∅`; its complement is conull and is fixed, `S_{F,u}(E ∖ U) = E ∖ U ≠ E`. Both differences, `S_{F,u}(U) ∖ ∅` and `E ∖ S_{F,u}(E ∖ U)`, are the null line, as the almost-everywhere statement allows.

### 6.2 Slicing the reduced boundary

Prove that for `U` of locally finite perimeter in `E`, `n ≥ 2`, a unit vector `e` and Borel `g : E → [0, ∞]`, `∫_{∂*U} g |⟨ν_U, e⟩| dμHE[n−1] = ∫_{e^⊥} Σ_{t : z + te ∈ ∂*U} g(z + te) dz`. Combine it with the slicing theorem: for a.e. `z ∈ e^⊥`, `U_z` has locally finite perimeter, `∂*(U_z) = ∂^M(U_z) = {t : z + te ∈ ∂*U}`, and `⟨ν_U, e⟩ ≠ 0` there; the projection of `{x ∈ ∂*U : ⟨ν_U(x), e⟩ = 0}` to `e^⊥` is null. Call `z` good for `U` when these conclusions hold (CianchiFuscoMaggiPratelli2011 Theorem 4.2 and equation (4.1), line 527–542; Maggi2012 Sections 18.2–18.3; AmbrosioFuscoPallara2000 Theorem 3.108, cited by locator). A route: apply the tangential area formula to the orthogonal projection onto `e^⊥` on the countably rectifiable set `∂*U`, whose approximate tangent plane is `ν_U^⊥` almost everywhere; the tangential Jacobian of the projection on `ν^⊥` is `|⟨ν, e⟩|`; use §5.1 for `∂* = ∂^M` on the line. Isoperimetry I4 states the slicing theorem only for sets of positive finite volume and finite perimeter, so it is applied to the cut sets `U_R = U ∩ ball(0, R)`. If `|U| = 0`, then `∂*U = ∅` (`TauCeti.reducedBoundary_congr_ae`) and almost every section is null, so the conclusions hold trivially; otherwise `|U_R| > 0` for large `R`, and `|U_R| < ∞` always. For almost every `R`, `P(U_R) ≤ P(U; ball(0, R)) + m′(R) < ∞` by Tau Ceti's `TauCeti.ae_perimeter_inter_ball_le`, the first term being finite because `U` has locally finite perimeter and `closedBall(0, R)` is compact; choose such radii `R_k → ∞`. For an open `B ⊆ E` and a set of locally finite perimeter, the reduced boundary in `E` intersected with `B` is the reduced boundary in `B`, with the same outer normal: the variation measure on `B` is the restriction of the one on `E` (`TauCeti.variationMeasure_eq_comap_inclusion`), the restricted polar density satisfies the identity that characterises the polar density on `B` (`TauCeti.ae_eq_polarDensity`), and small closed balls about a point of `B` lie in `B`. As `U` and `U_{R_k}` agree on `B_k = ball(0, R_k)`, `TauCeti.reducedBoundary_congr_ae` and `TauCeti.outerNormal_congr_ae` give `∂*U ∩ B_k = ∂*U_{R_k} ∩ B_k` with `ν_U = ν_{U_{R_k}}` there. Take `z` outside the countable union of the exceptional sets of I4 for the `U_{R_k}`. For `ρ > 0` and `R_k² > ‖z‖² + ρ²`, the sections `U_z` and `(U_{R_k})_z` agree on `(−ρ, ρ)`, since `‖z + te‖² = ‖z‖² + t²`; the same locality on the line, with `B = (−ρ, ρ)`, shows that `U_z` has finite perimeter in `(−ρ, ρ)`, that its reduced boundary there is `{t : |t| < ρ, z + te ∈ ∂*U}`, and that `⟨ν_U(z + te), e⟩ ≠ 0` at those points; letting `ρ → ∞` gives the conclusions for `U_z` on the whole line. *Needs:* §5.1; GeometricMeasureTheory G2 (tangential area formula), G5 (De Giorgi's theorem); Isoperimetry I4 (slicing theorem); Tau Ceti `TauCeti.ae_perimeter_inter_ball_le`, `TauCeti.variationMeasure_eq_comap_inclusion`, `TauCeti.ae_eq_polarDensity`, `TauCeti.reducedBoundary_congr_ae`, `TauCeti.outerNormal_congr_ae` (cutting by balls); Mathlib `LinearMap.normDet`.

**Checks.**

- `U = {x_2 < m x_1}` in `ℝ²`, `e = e_2`, `g` the indicator of `{0 ≤ x_1 ≤ 1}`: the boundary segment has length `√(1 + m²)` and `|⟨ν_U, e_2⟩| = 1/√(1 + m²)`, so both sides equal `1`. With the reciprocal Jacobian the left side would be `1 + m² = 2` at `m = 1`.
- A vertical boundary `{x_1 = s}` has `⟨ν_U, e_2⟩ = 0`; the left side vanishes and the boundary projects to a single point of `e^⊥`.
- Cutting by balls: the half-plane `U = {x_1 < 0}` in `ℝ²` has infinite volume and infinite Euclidean perimeter, so Isoperimetry I4 does not apply to it directly. With `e = e_1` and `z = s e_2`, the cut set `U_R = U ∩ ball(0, R)` has volume `πR²/2` and perimeter `πR + 2R`; for `|s| < R` its section is `(−√(R² − s²), 0)`, with reduced boundary `{−√(R² − s²), 0}`. Only `0` lies in `|t| < √(R² − s²)`, where it is the reduced boundary `{0}` of the section `(−∞, 0)` of `U`, with `⟨ν_U, e_1⟩ = 1`; reading the slicing conclusion of `U_R` on the whole line would add the point `−√(R² − s²)`, which comes from the circle `‖x‖ = R`, not from `∂*U`.

### 6.3 The section-measure function

Prove that for `P_γ(U) < ∞`, `n ≥ 2` and a unit vector `e`, `v_U ∈ BV_loc(e^⊥)`, and for every Borel `B ⊆ e^⊥`, `∫_B e^{−W_{e^⊥}} d|Dv_U| ≤ P_γ(U; B ⊕ ℝ e)`, where `e^{−W_{e^⊥}}` is the density of `γ_{e^⊥}`. Write `∇v_U` for the density of the absolutely continuous part of `Dv_U` with respect to `volume` on `e^⊥`, Tau Ceti's `TauCeti.acDerivativeDensity` of `v_U` on `e^⊥` against `volume`, a locally integrable function determined up to a null set, and `g_U(z) = −Σ_{t : z + te ∈ ∂*U} φ(t) ν_U^⊥(z + te)/|⟨ν_U(z + te), e⟩|` for good `z` at which the series converges absolutely, where `ν^⊥` is the component in `e^⊥`; this holds for almost every `z`, since §6.2 with `g = e^{−W} ‖ν_U^⊥‖/|⟨ν_U, e⟩|` bounds `∫ e^{−W_{e^⊥}}(z) Σ_t φ(t) ‖ν_U^⊥‖/|⟨ν_U, e⟩| dz` by `P_γ(U)`. Prove that `∇v_U(z) = g_U(z)` for `volume`-almost every `z ∈ e^⊥`, that is, the absolutely continuous part of `Dv_U` is `g_U · volume`, and that its singular part is carried by the null projection of `{⟨ν_U, e⟩ = 0}` (CianchiFuscoMaggiPratelli2011 Lemma 4.4, equations (4.7)–(4.8), line 605–618, where (4.7) as printed is weaker than the bound here by the factor `√(2π)`, and (4.8) is asserted only for almost every good point, with the inner normal and unnormalized section weights; see the Conventions). The identity is one of densities: at a good `z` where `v_U` is differentiable its derivative need not equal `g_U(z)` (fourth Check). A route: for a smooth compactly supported field `Y` on `e^⊥`, the field `X(z + te) = Y(z)` has `div_γ X = div_{γ_{e^⊥}} Y`; Fubini gives `∫_U div_γ X dγ = ∫ v_U div_{γ_{e^⊥}} Y dγ_{e^⊥}`, and the bounded-field Gauss–Green identity of §2.5 equates it to `∫_{∂*U} ⟨Y, ν_U⟩ dγ^{n−1}`. This yields the variation bound and, through §2.1, `BV_loc`; §6.2 splits the boundary integral into its absolutely continuous and singular parts, and the uniqueness of the absolutely continuous density (`TauCeti.ae_eq_acDerivativeDensity`) identifies `∇v_U` with `g_U`. *Needs:* §1.3, §2.1, §2.5, §6.2; Tau Ceti `TauCeti.Probability.stdGaussian_eq_withDensity_norm` (the density of `γ_{e^⊥}`), `TauCeti.acDerivativeDensity`, `TauCeti.ae_eq_acDerivativeDensity`.

**Checks.**

- `U = {x_2 < a + b x_1}` in `ℝ²`, `e = e_2`: `v_U(z) = Φ(a + bz)` and `v_U′(z) = b φ(a + bz)`; with `ν_U = (−b, 1)/√(1 + b²)` the formula gives `−φ(a + bz) · (−b)` as well. The inner normal gives the opposite sign.
- For the same `U` with `a = b = 1` and `B = e^⊥`, the variation bound reads `φ(1/√2)/√2 = 0.219696 ≤ φ(1/√2) = 0.310697`.
- Weighting the sections by `e^{−t²/2}` without `(2π)^{−1/2}`, as Cianchi–Fusco–Maggi–Pratelli print it, would give `√(2π) b φ(a + bz)`, contradicting `v_U = Φ(a + bz)`.
- Negative control for a pointwise reading, with escaping tails: in `ℝ²` with `e = e_2`, let `h(z) = max(−1/4, min(z, 1/4))`, `Q` the inverse of `Φ` on `(0, 1)`, and let `U_z` be `(Q(−h(z)), 0)` for `z < 0`, `(−∞, 0)` for `z = 0`, and `(−∞, 0) ∪ (Q(1 − h(z)), ∞)` for `z > 0`. Then `v_U = 1/2 + h`, `P_γ(U) ≤ 2φ(0) + γ¹((−1/4, 1/4)) = 0.995297`, and near every point `(0, t)` the set `U` is the lower half-plane, so `z = 0` is good with the single boundary point `t = 0`, `ν_U = e`, and `g_U(0) = 0`, while `v_U′(0) = 1`. For `0 < |z| < 1/4` the tail boundary gives `g_U(z) = 1 = v_U′(z)`, and for `|z| > 1/4` both are `0`: the identity holds off the null set `{0, ±1/4}`, as the almost-everywhere statement allows.

### 6.4 A lower bound by sections

For `z ∈ e^⊥` let `p_U(z) = Σ_{t ∈ ∂^M(U_z)} φ(t)`, the Gaussian perimeter of the section. Prove that for `P_γ(U) < ∞`, `n ≥ 2` and every Borel `B ⊆ e^⊥` consisting of good points, `P_γ(U; B ⊕ ℝ e) ≥ ∫_B √(p_U(z)² + ‖∇v_U(z)‖²) dγ_{e^⊥}(z)`, with equality when `U ∩ (B ⊕ ℝ e) = S_e(U) ∩ (B ⊕ ℝ e)` (CianchiFuscoMaggiPratelli2011 Lemma 4.6, inequality (4.14), line 781–828, whose proof takes the gradient of `v_E` from (4.8) and so carries the factor `√(2π)` of the Conventions; read with the gradient of `γ¹(E_z)` itself, its equality case fails, first Check). A route: §6.2 with `g = e^{−W}/|⟨ν_U, e⟩|` and the factorization `e^{−W}(z + te) = e^{−W_{e^⊥}}(z) φ(t)` express the boundary measure over good points as `∫_B Σ_t φ(t) √(1 + ‖ν^⊥‖²/⟨ν, e⟩²) dγ_{e^⊥}`; Jensen's inequality for `w ↦ √(1 + ‖w‖²)` with weights `φ(t)/p_U(z)` and the almost-everywhere identity `∇v_U = g_U` of §6.3, used under the integral, give the bound, and a symmetral has one boundary point on each good section. *Needs:* §1.3, §5.1, §6.2, §6.3; Tau Ceti `TauCeti.Probability.stdGaussian_eq_withDensity_norm` (the factorization of the density).

**Checks.**

- The tilted half-plane `{x_2 < 1 + x_1}` is its own symmetral; both sides equal `φ(1/√2) = 0.310697`, the right side as `√2 ∫ φ(1 + z) φ(z) dz`. In Cianchi–Fusco–Maggi–Pratelli's normalization its perimeter is `e^{−1/4} = 0.778801` and the section perimeter is `e^{−(1+z)²/2}`: with the gradient of (4.8), `√(2π) φ(1 + z)`, the right side of (4.14) is `√(4π) · 0.219696 = 0.778801`, an equality, while with the gradient `φ(1 + z)` of `v_U = Φ(1 + z)` it is `√(2π + 1) · 0.219696 = 0.592901`, and equality would fail for this symmetral.
- The slab `{|x_2| < 1}` gives equality `2φ(1) = 0.483941` on both sides although it is not a symmetral, so the equality condition is sufficient but not necessary.

### 6.5 An upper bound for the symmetral

Prove that for `P_γ(U) < ∞`, `n ≥ 2` and every Borel `B ⊆ e^⊥`, `P_γ(S_e(U); B ⊕ ℝ e) ≤ ∫_B e^{−W_{e^⊥}} d|Dv_U| + ∫_B I(v_U(z)) dγ_{e^⊥}(z)`; in particular `S_e(U)` has finite Gaussian perimeter, at most `2 P_γ(U)` (CianchiFuscoMaggiPratelli2011 Lemma 4.5, inequality (4.10), line 624–631, with its proof at line 633–779; (4.10) is printed with their surface-normalized perimeter on the left and in the section term but with the variation term unscaled, so it lacks the factor `√(2π)` on that term and fails as printed, second Check; the inequality here is the one their proof gives when every term is taken against the probability measure). A route: reduce to bounded open `B` and a test field `X` supported in `B ⊕ ℝ e`. The `e`-component contributes exactly `∫ X_e(z, Φ⁻¹(v_U(z))) I(v_U(z)) dγ_{e^⊥}` by Fubini, the integrand being taken as `0` where `v_U(z) ∈ {0, 1}`, since then the section of `S_e(U)` is empty or the whole line and `I(v_U(z)) = 0`. For the `e^⊥`-components, `H(z, s) = ∫_{{t : Φ(t) < s}} X^⊥(z + te) φ(t) dt` is `0` at `s = 0` and `∫_ℝ X^⊥(z + te) φ(t) dt` at `s = 1`, and is smooth on `e^⊥ × [0, 1]` with `∂_s H(z, s) = X^⊥(z + Φ⁻¹(s) e)` for `0 < s < 1`, which vanishes for `s` near `0` and `1` because `X` has compact support; for a smooth `v` with values in `[0, 1]` the chain rule bounds the contribution of `{Φ(t) < v(z)}` by `∫ ‖∇v‖ dγ_{e^⊥}`; apply this to the mollifications `v_ε = ρ_ε ∗ v_U`, with `ρ_ε` the normalized smooth bump of outer radius `ε` on `e^⊥`, and pass to the limit. The contribution converges: it is `∫ G(z, v(z)) dγ_{e^⊥}(z)` with `G(z, s)` the Gaussian divergence of `H(·, s)` at `z`, which is bounded, compactly supported in `z` and Lipschitz in `s`, and `v_ε → v_U` in `L¹_loc` (§6.3 gives `v_U ∈ BV_loc(e^⊥)`). For the bound, `‖∇v_ε(z)‖ ≤ ∫ ρ_ε(z − y) d|Dv_U|(y)` at every `z`: the derivative of the convolution gives `∂_w v_ε(z) = ∫ (∂_w ρ_ε)(z − y) v_U(y) dy`, and the directional polar decomposition, applied to the test function `y ↦ ρ_ε(z − y)`, whose derivative along `w` is `−(∂_w ρ_ε)(z − y)`, rewrites it as `∫ ρ_ε(z − y) ⟨w, σ(y)⟩ d|Dv_U|(y)` with `‖σ‖ = 1` `|Dv_U|`-almost everywhere. By Tonelli and the uniform continuity of `e^{−W_{e^⊥}}` on compacts, `limsup_{ε → 0} ∫_K e^{−W_{e^⊥}} ‖∇v_ε‖ dz ≤ ∫_{K′} e^{−W_{e^⊥}} d|Dv_U|` for every compact `K` and every compact neighbourhood `K′` of `K`. Cianchi–Fusco–Maggi–Pratelli use strict approximation and Reshetnyak continuity instead. For the bound by `2 P_γ(U)` take `B = e^⊥`: the first term is at most `P_γ(U)` by the variation bound of §6.3. For the second, at every good `z` (§6.2) the section `U_z` has Gaussian perimeter `Σ_{t : z + te ∈ ∂*U} φ(t)` by §5.1, which is at least `I(v_U(z))` by §5.3; integrating against `γ_{e^⊥}`, the factorization `e^{−W}(z + te) = e^{−W_{e^⊥}}(z) φ(t)` and §6.2 with `g = e^{−W}` give `∫ I(v_U) dγ_{e^⊥} ≤ ∫_{∂*U} |⟨ν_U, e⟩| dγ^{n−1} ≤ P_γ(U)`. *Needs:* §1.1, §1.3, §2.1, §2.2, §5.1, §5.3, §6.1, §6.2, §6.3; Tau Ceti `TauCeti.Probability.stdGaussian_eq_withDensity_norm` (the factorization of the density), `TauCeti.integral_lineDeriv_mul_eq_neg_integral_mul_inner_polarDensity`, `TauCeti.ae_norm_polarDensity_eq_one` (the pointwise mollification bound); Mathlib `ContDiffBump.normed`, `HasCompactSupport.hasFDerivAt_convolution_left`.

**Checks.**

- For `{x_2 < a}` the bound is `0 + φ(a) = P_γ`, an equality; dropping the term `∫ I(v_U)` would give `0 < φ(a)`.
- For `{x_2 < 1 + x_1}` the bound is `0.219696 + 0.219696 = 0.439391`, larger than the true `0.310697`: the sum bound is weaker than the square-root formula of §6.4. Each term is at most `P_γ(U) = 0.310697`, so the sum is below `2 P_γ(U) = 0.621393`. In Cianchi–Fusco–Maggi–Pratelli's normalization the same half-plane has perimeter `e^{−1/4} = 0.778801`, section term `√(2π) · 0.219696 = 0.550695` and unscaled variation term `0.219696`: (4.10) as printed claims `0.778801 ≤ 0.770391`, which fails, and it holds once the variation term carries `√(2π)`, `0.778801 ≤ 1.101391`; dividing by `√(2π)` gives the bound here, `0.310697 ≤ 0.439391`.
- For `U = ball(0, 1) ⊂ ℝ²` and `e = e_2` the first term is `2e^{−1/2}/π = 0.386129`; in the second, `∫ I(v_U) dγ_{e^⊥} = 0.252249` is strictly below `∫ Σ_t φ(t) dγ_{e^⊥} = 0.386129`, because the interval sections are not half-lines (at `z = 0`, `I(0.682689) = 0.356343 < 2φ(1) = 0.483941`, §5.3). The bound `0.638378` lies between the symmetral's perimeter `0.517483` (§6.6) and `2 P_γ(U) = 1.213061`.

### 6.6 Ehrhard symmetrisation decreases Gaussian perimeter

Prove that for `n ≥ 1`, a unit vector `e`, a Lebesgue-measurable `U` with `P_γ(U) < ∞` and every Borel `B ⊆ e^⊥`, `P_γ(S_e(U); B ⊕ ℝ e) ≤ P_γ(U; B ⊕ ℝ e)`; in particular `P_γ(S_e(U)) ≤ P_γ(U)`, which holds for every Lebesgue-measurable `U`, trivially when `P_γ(U) = ∞` (`gaussianPerimeter_gaussianSymmetral_le`, with `S_e(U)` written as `gaussianSymmetral (ℝ ∙ e) e U`; CianchiFuscoMaggiPratelli2011 Theorem 4.3, inequality (4.3), line 583–588, with its proof at line 833–846, for `n ≥ 2`). A route: for `n = 1`, `e^⊥ = {0}` and `S_e(U)` is `{te : Φ(t) < γ(U)}`, a half-line of measure `γ(U)`, or `∅` or `E` when `γ(U) ∈ {0, 1}`, so the inequality is §5.3. For `n ≥ 2`, on points good for both `U` and `S_e(U)`, chain §6.4 for `U`, the one-dimensional inequality `p_U ≥ I(v_U) = p_{S_e(U)}` of §5.3, `v_{S_e(U)} = v_U`, and the equality case of §6.4 for `S_e(U)`; the remaining points form a null set, where §6.5 and §6.3 apply. *Needs:* §5.3, §6.1, §6.3, §6.4, §6.5.

**Checks.**

- `U = ball(0, 1) ⊂ ℝ²`, `e = e_2`: `P_γ(S_e(U)) = ∫_{−1}^{1} √(I(v_U)² + v_U′²) φ(z) dz = 0.517483`, between `I(0.393469) = 0.384633` and `P_γ(U) = 0.606531`.
- A half-plane `{⟨x, ν⟩ < s}` with `⟨ν, e⟩ < 0` has upper half-line sections; its symmetral is the reflected half-plane `{⟨x, ν − 2⟨ν, e⟩e⟩ < s}`, of the same perimeter `φ(s)`.
- `n = 1`, `U = (−1, 1)`: `γ(U) = 0.682689`, `S_e(U) = (−∞, 0.475233)` with perimeter `φ(0.475233) = I(0.682689) = 0.356343 ≤ P_γ(U) = 0.483941`; the superlevel rule would give `(−0.475233, ∞)`, the same perimeter but not a sublevel set.
- Infinite perimeter: `n = 1`, `U = ⋃_{k ≥ 1} (1/(2k+1), 1/(2k))` has `P_γ(U) = Σ_k (φ(1/(2k)) + φ(1/(2k+1))) = ∞` and `γ(U) = Σ_k (Φ(1/(2k)) − Φ(1/(2k+1))) = 0.116140`; its symmetral `(−∞, −1.194508)` has perimeter `I(0.116140) = 0.195467`, and the global inequality `0.195467 ≤ ∞` holds with no finiteness hypothesis.

### Examples

For the unit disc in `ℝ²`, symmetrisation along `e_2` keeps the measure `0.393469` and lowers the Gaussian perimeter from `0.606531` to `0.517483`.

### Dependencies

Layers 1, 2 and 5; Tau Ceti's Gaussian density, its cut-by-ball perimeter estimate, and the restriction and locality of its variation measure, polar density (with its directional form), reduced boundary and outer normal; Mathlib's smooth bump functions and the derivative of a convolution; GeometricMeasureTheory G2, G5; Isoperimetry I4.

## Layer 7: the Gaussian isoperimetric theorem

### 7.1 Minimizers have half-line sections

Let `n ≥ 2`, `0 < r < 1` and `H` a Lebesgue-measurable set with `γ(H) = r` and `P_γ(H) = I^{(1)}(r, 1 − r)`, which exists by §3.5. Prove that for every unit vector `e` and a.e. `z ∈ e^⊥`, the section `H_z` is null, conull, or agrees a.e. with a half-line `(−∞, c)` or `(c, ∞)` (CianchiFuscoMaggiPratelli2011 Section 4.2, Steps I–II, line 889–912). A route: minimality and §6.6 give `P_γ(H; B ⊕ ℝ e) = P_γ(S_e(H); B ⊕ ℝ e)` for every Borel `B`; on good points the chain of §6.6 is then an equality, so `p_H = I(v_H)` almost everywhere, and the equality case of §5.3 applies. *Needs:* §3.5, §5.3, §6.1 (`γ(S_e(H)) = γ(H)`, so that `S_e(H)` is a competitor), §6.2 (good points), §6.4 (the lower bound by sections and its equality case), §6.6.

**Checks.**

- A half-space `{⟨x, ν⟩ < s}` with `γ = r` satisfies the conclusion in every direction.
- The disc of measure `0.393469` has the section `(−1, 1)` over `z = 0`, with two boundary points, so it is not a minimizer (its perimeter `0.606531` exceeds `0.384633`).

### 7.2 Minimizers are convex

For `H` as in §7.1, prove that the set `H^{(1)} = TauCeti.essentialInterior volume H` of points of density one of `H` is open and convex, and that the same holds for `E ∖ H` (CianchiFuscoMaggiPratelli2011 Section 4.2, Steps III–IV, line 913–966). A route through Isoperimetry I4: for `R > 0` the cut set `H_R = H ∩ ball(0, R)` has finite volume, and positive volume once `R` is large, since `γ(H) = r > 0`. In every direction `e`, by §7.1, almost every section of `H` is, up to a null set, empty, a line or a half-line, so almost every section of `H_R`, its intersection with the interval `{t : ‖z + te‖ < R}`, is an interval up to a null set; the essential-convexity theorem of I4 makes the density-one set `H_R^{(1)}` convex. As `ball(0, R)` is open, `H^{(1)} ∩ ball(0, R) = H_R^{(1)} ∩ ball(0, R)` is convex, and `H^{(1)}`, the increasing union of these sets, is convex. A convex set all of whose points have density one is open, and `E ∖ H` is a minimizer for `1 − r` by complement invariance. A direct route, which repeats I4's tube estimate in the form needed here: given `x_1 ≠ x_2` in `H^{(1)}`, let `e` be the unit vector along `x_2 − x_1` and, for `ρ > 0`, let `C_ρ(x)` be the cylinder of points `x + z + te` with `z ∈ e^⊥`, `‖z‖ < ρ` and `|t| < ρ`, which contains `ball(x, ρ)` and lies in `ball(x, √2 ρ)`. Given `ε > 0`, density one gives `|C_ρ(x_i) ∖ H| ≤ ε |C_ρ(x_i)|` for `i = 1, 2` and all small `ρ`. By Fubini, the base points in the `(n − 1)`-ball of radius `ρ` about the common projection of `x_1` and `x_2` to `e^⊥` whose section in direction `e` meets `H` in a null set inside `C_ρ(x_1)` or inside `C_ρ(x_2)` fill a proportion at most `2ε` of that ball. Every other section meets `H` in positive length inside both cylinders; by §7.1 it is, up to a null set, a half-line or the whole line, so it contains the stretch between the two cylinders up to a null set. Hence for each point `y` of the open segment between `x_1` and `x_2` and every small `ρ` at most half the distance from `y` to each endpoint, `|C_ρ(y) ∖ H| ≤ 2ε |C_ρ(y)|`; as `ε` is arbitrary and cylinders are comparable with balls, `y ∈ H^{(1)}`. Density one at a point does not make almost every nearby section meet `H` (Checks), so the argument uses only this proportion bound. *Needs:* §2.1, §7.1; Tau Ceti `TauCeti.essentialInterior`; Isoperimetry I4 (essential convexity) for the first route; Mathlib `Besicovitch.ae_tendsto_measure_inter_div` (Mathlib/MeasureTheory/Covering/Besicovitch.lean:1104) for the direct route.

**Checks.**

- For `H = {x_1 < s}`, `H^{(1)} = H` and `(E ∖ H)^{(1)} = {x_1 > s}`, two disjoint open convex sets whose union has full measure.
- For `H = {x_1 < 0} ∪ ℚ²`, `H^{(1)} = {x_1 < 0}`: the density-one representative removes null additions, which `H` itself does not.
- Negative control for the route: in `ℝ²` let `U` be the complement of the disjoint vertical strips `{|x_1 − 2^{−k}| < 4^{−k}}`, `k ≥ 2`. They meet `ball(x, ρ)` in area at most `(256/27) ρ³` for every `x` on the `x_2`-axis (a fraction `0.032981` of the ball at `ρ = 1/16`), so every such point has density one in `U`; yet over the base interval `(−ρ, ρ)` with `ρ = 2^{−m}`, `m ≥ 2`, the vertical sections that miss `U` entirely fill the proportion `(5/6) ρ`, `0.208333` at `ρ = 1/4` and `0.052083` at `ρ = 1/16`. This is positive for every `ρ`, so density one on the axis does not make almost every nearby vertical section meet `U`, and it tends to `0`, as the proportion bound of the route allows.

### 7.3 The theorem with equality

Prove that for every `n ≥ 0` and every Lebesgue-measurable `U ⊆ E`, `P_γ(U) ≥ I(γ(U))` (`gaussian_isoperimetric`), equivalently `P_γ(U) ≥ φ(a)` for every real `a` with `γ(U) = Φ(a)`; and that equality holds if and only if `γ(U) ∈ {0, 1}` or `U` agrees a.e. with `{x : ⟨x, ν⟩ < s}` for some unit vector `ν` and real `s` (CianchiFuscoMaggiPratelli2011 Theorem 4.1, line 508–509, and Proposition 3.1; MilmanNeeman2022 line 47–52 and 83–84; Ledoux1999 inequality (1.4), line 212–219; SudakovTsirelson1974 Theorem 1 and Borell1975 Theorem 3.1, line 85–99, for the inequality; CarlenKerce2001 Theorem 1 for uniqueness, cited by locator). A route: for `n = 0`, `γ` is the Dirac mass, so `γ(U) ∈ {0, 1}` and `P_γ(U) = 0 = I(γ(U))`. `n = 1` is §5.3. For `n ≥ 2`, let `H` be a minimizer of §3.5; by §7.2 the open convex sets `H^{(1)}` and `(E ∖ H)^{(1)}` are disjoint and their union has full measure, so a strict separating functional makes `H` a.e. a half-space, and `I^{(1)}(r, 1 − r) = I(r)` by §2.3; every `U` attaining equality is itself a minimizer and the same argument applies. *Needs:* §2.3, §3.5, §5.3, §7.2; Mathlib `geometric_hahn_banach_open_open`.

**Checks.**

- The disc in `ℝ²`: `0.606531 > 0.384633`; the slab `{|x_1| < 1}`: `0.483941 > I(0.682689) = 0.356343`.
- `U = ∅` attains equality with `γ(U) = 0` but is not a half-space, so the disjunct `γ(U) ∈ {0, 1}` is needed.
- The Φ-form avoids `Φ⁻¹(0)`: for `γ(U) = 0` no real `a` satisfies `γ(U) = Φ(a)`, and the statement is vacuous rather than a claim about a junk value.

### 7.4 The two-cell cluster form

Prove that for `n ≥ 1` and `v ∈ Δ^{(1)}`, `I^{(1)}(v) = I_m^{(1)}(v) = I(v_1)` (`isoperimetricProfile_two_eq`), the model profile being extended to the endpoints by §4.5; and that for `v ∈ int Δ^{(1)}`, that is for a `2`-cluster `Ω` both of whose cells have positive measure, `Ω` is minimizing, equivalently `P_γ(Ω) = I(γ(Ω_1))`, if and only if it is equivalent to a simplicial `2`-cluster, that is, `Ω_1` and `Ω_2` agree a.e. with `{⟨x, ν⟩ < s}` and `{⟨x, ν⟩ > s}` for a unit vector `ν` and a real `s` (`Cluster.perimeter_eq_iff_halfSpaces`; MilmanNeeman2022 Theorems 1.1–1.2 for `q = 2`, line 98–102, and line 83–84). *Needs:* §3.1, §4.2, §4.4, §4.5, §7.3.

**Checks.**

- `v = (1/2, 1/2)`: `I^{(1)}(v) = 0.398942`, attained by `({x_1 < 0}, {x_1 > 0})`.
- `v = (1, 0)`: `I^{(1)}(v) = 0 = I(1)`, attained by `(E, ∅)`, which is not simplicial; uniqueness is claimed only in the interior.
- `n = 0` is excluded: on the zero space there is no `2`-cluster with measure vector `(1/2, 1/2)` (§3.5, Checks), so the profile there is `∞`, not `I(1/2) = 0.398942`.

### Examples

In every dimension, the sets of Gaussian measure `1/3` with least Gaussian perimeter are the half-spaces at distance `0.430727` from the origin, of perimeter `0.363600`.

### Dependencies

Layers 2–6; Tau Ceti's essential interior; Isoperimetry I4 (essential convexity); Mathlib's separation theorem and Lebesgue density theorem.

## Layer 8: integrated, functional and concentration forms

### 8.1 The Borell–Sudakov–Tsirelson inequality

Prove that for every set `A ⊆ E`, its Gaussian measure being the outer measure when `A` is not measurable, every real `a` with `Φ(a) ≤ γ(A)` and every `r > 0`, `γ(A + r · ball(0, 1)) ≥ Φ(a + r)`, where `A + r · ball(0, 1)` is the open set `Metric.thickening r A` (`borell_sudakov_tsirelson`); hence `γ(Metric.cthickening r A) ≥ Φ(a + r)` for every `r ≥ 0`, and for Borel `A` the inner measure of `A + r · closedBall(0, 1)`, which contains the open thickening, is at least `Φ(a + r)`. Equality holds for the half-spaces `{⟨x, ν⟩ < a}`. Prove the same for every Gaussian law on a Euclidean space: for a finite type `ι`, `m ∈ EuclideanSpace ℝ ι`, any square matrix `S`, `γ_{m,S} = multivariateGaussian m S` and `K = CFC.sqrt S`, if `A ⊆ EuclideanSpace ℝ ι` is any set with `Φ(a) ≤ γ_{m,S}(A)` and `r > 0` then `γ_{m,S}(A + r K(ball(0, 1))) ≥ Φ(a + r)` (`borell_sudakov_tsirelson_multivariateGaussian`), both sides being outer measures when the sets are not measurable. For `γ`: Borell1975 Theorem 3.1, line 85–99, stated there with inner measure; Ledoux1993 Théorème 3, line 238–256; Ledoux1999 inequality (1.5), line 220–224; Ehrhard1983 Théorème 2.4, line 356–359, for Borel sets and the Euclidean ball; SudakovTsirelson1974 Theorem 1, cited by locator. For `γ_{m,S}`: Ledoux1999 inequality (1.7), line 239–247, for centred laws with the ellipsoid `K(ball(0, 1))`, the mean `m` being a translation. A route: for `n = 0`, `γ` is the Dirac mass at the origin and `Φ(a) > 0`, so `Φ(a) ≤ γ(A)` forces `A = E = {0}`, and `Metric.thickening r E = E` has measure `1 ≥ Φ(a + r)`; let `n ≥ 1`. Then `f(s) = γ(Metric.thickening s A)` is nondecreasing; the distance `d_A` is `1`-Lipschitz, so `‖∇d_A‖ ≤ 1` almost everywhere and the coarea formula of §2.6 gives `f(s) − f(s′) ≥ ∫_{s′}^{s} γ^{n−1}({d_A = τ}) dτ` for `0 < s′ < s`. The frontier of `Metric.thickening τ A` lies in `{d_A = τ}`, so §2.3 and §7.3 give `γ^{n−1}({d_A = τ}) ≥ I(f(τ))`. Then `G = Φ⁻¹ ∘ f` is nondecreasing with `G′ ≥ 1` almost everywhere where `0 < f < 1`, and the increment of a monotone function dominates the integral of its derivative, so `G(s) ≥ G(s′) + s − s′`; let `s′ ↓ 0`. An arbitrary `A` reduces to its closure, which has the same open thickenings (`Metric.thickening_closure`) and at least the outer measure of `A`. For `γ_{m,S}`, the affine subspace `L = m + range K` carries the law: for `S` not positive semidefinite `K = 0` and the law is `δ_m`, and otherwise `TauCeti.Probability.ae_mem_affineRange_multivariateGaussian` puts the law on `m + range S`, which is `L` by `Matrix.PosSemidef.range_toEuclideanLin_sqrt`. So `γ_{m,S}(A) = γ_{m,S}(A ∩ L)`; `K` is invertible on `range K = (ker K)^⊥` and `K(ball(0, 1)) = K(ball(0, 1) ∩ range K)` is open in `range K`, so `(A ∩ L) + r K(ball(0, 1)) = C + r K(ball(0, 1))` for the closed set `C = closure(A ∩ L) ⊆ L`. With `T(x) = m + K x`, apply the first statement to the closed set `T⁻¹(C)`, of `γ`-measure `γ_{m,S}(C) ≥ Φ(a)`, and use `T(Metric.thickening r (T⁻¹(C))) ⊆ C + r K(ball(0, 1))` and `(T_* γ)(X) ≥ γ(T⁻¹(X))` for every set `X`. *Needs:* §1.1, §2.3, §2.6, §7.3; Mathlib `Metric.thickening`, `Metric.thickening_closure`, `Metric.cthickening`, `Metric.cthickening_zero`, `norm_fderiv_le_of_lipschitz`, `LipschitzWith.ae_differentiableAt`, `Monotone.ae_differentiableAt`, `MonotoneOn.intervalIntegral_deriv_mem_uIcc`, `ProbabilityTheory.multivariateGaussian`, `ProbabilityTheory.multivariateGaussian_of_not_posSemidef`; Tau Ceti `TauCeti.Probability.ae_mem_affineRange_multivariateGaussian`, `Matrix.PosSemidef.range_toEuclideanLin_sqrt`.

**Checks.**

- `A = {x_1 < a}`: `A + r · ball(0, 1) = {x_1 < a + r}` and both sides equal `Φ(a + r)`.
- `A = ball(0, 1) ⊂ ℝ²`, `r = 1`: `a = Φ⁻¹(1 − e^{−1/2}) = −0.270288`, and `γ(ball(0, 2)) = 1 − e^{−2} = 0.864665 ≥ Φ(0.729712) = 0.767217`.
- `Metric.thickening 0 A = ∅`, so the open form needs `r > 0`; the closed form at `r = 0` is `γ(closure A) ≥ Φ(a)`.
- For `S` not positive semidefinite, or `S = 0`, Mathlib's law is `δ_m` and `K = 0`; the statement reduces to `δ_m(A) ≥ Φ(a + r)`, true because `Φ(a) ≤ δ_m(A)` forces `m ∈ A`.
- Non-measurable and null additions: `A = {x_1 < 0} ∪ ℚ²` in `ℝ²` has `γ(A) = 1/2`, so `a = 0`, and its open `r`-thickening is `ℝ²`, of measure `1 ≥ Φ(r)`; the closure argument sees `closure A = ℝ²`. In the degenerate law `S = diag(1, 0)` on `ℝ²` with `m = 0`, `L` is the first axis, `K(ball(0, 1))` is the open segment `(−1, 1) × {0}`, and for `A = (−∞, 0] × {1}`, which misses `L`, both `γ_{m,S}(A)` and `γ_{m,S}(A + r K(ball(0, 1)))` vanish, so no `a` is admissible; for `A = (−∞, 0] × {0}` the enlargement is `(−∞, r) × {0}`, of measure `Φ(r)`, an equality at `a = 0`.

### 8.2 The Minkowski-content form

Prove that for every set `A ⊆ E`, its Gaussian measure being the outer measure when `A` is not measurable, `liminf_{r ↓ 0} (γ(Metric.thickening r A) − γ(A))/r ≥ I(γ(A))`, the quotient and its lower limit taken in `[0, ∞]` (`gaussian_minkowskiContent_ge`; Ledoux1999 equations (1.3)–(1.4), line 207–219, with the open `r`-neighbourhood of line 211). For `r > 0` the open thickening contains `A` (`Metric.self_subset_thickening`), so the numerator is a true difference; as `Metric.thickening r A ⊆ Metric.cthickening r A` (`Metric.thickening_subset_cthickening`), the same lower bound holds with the closed thickening. A route: when `0 < γ(A) < 1`, §8.1 with `a = Φ⁻¹(γ(A))`, so that `Φ(a) = γ(A)`, gives `γ(Metric.thickening r A) − γ(A) ≥ Φ(a + r) − Φ(a)` for every `r > 0`, and `(Φ(a + r) − Φ(a))/r → φ(a) = I(γ(A))`; when `γ(A) ∈ {0, 1}` the right side is `I(γ(A)) = 0`. *Needs:* §1.1, §8.1; Mathlib `Metric.thickening`, `Metric.self_subset_thickening`, `Metric.thickening_subset_cthickening`.

**Checks.**

- For `{x_1 < a}` the limit is `φ(a) = I(Φ(a))`.
- For `ball(0, 1) ⊂ ℝ²` the derivative of `1 − e^{−(1 + r)²/2}` at `0` is `e^{−1/2} = 0.606531 ≥ 0.384633`.
- For the null set `ℚ²` the open thickenings are `ℝ²`, of measure `1`, so the quotient is `1/r → ∞`: the Minkowski content, unlike perimeter, sees null sets.
- For `A = {x_1 < 0} ∪ ℚ²` the quotient is `(1 − 1/2)/r`, `5`, `50`, `500` at `r = 0.1, 0.01, 0.001`; its lower limit is `∞ ≥ I(1/2) = 0.398942` in `[0, ∞]`. Read in `ℝ`, a lower limit of a function unbounded above has no value, and a junk value `0` would make the statement false for this `A`.
- A non-measurable set: on `ℝ` let `A ⊆ (−∞, 0)` be a Bernstein set, so that both `A` and `(−∞, 0) ∖ A` meet every uncountable closed subset of `(−∞, 0)`. Its inner measure is `0`, its outer measure `γ(A) = 1/2`, its closure `(−∞, 0]` and `Metric.thickening r A = (−∞, r)`; the quotient `(Φ(r) − 1/2)/r` is `0.398278` at `r = 0.1` and `0.398936` at `r = 0.01`, tending to `φ(0) = I(1/2) = 0.398942`, an equality. Read with the inner measure `0` in place of `γ(A)`, the quotient `Φ(r)/r` tends to `∞` and the right side is `I(0) = 0`.

### 8.3 Subgraph sets and Bobkov's inequality

For a continuous `f : E → [0, 1]`, define its subgraph set `A_f = {(x, y) : Φ(y) < f(x)}` in the inner product space `E × ℝ` with the `L²` product norm, of dimension `n + 1`. Prove that `γ_{E×ℝ}(A_f) = ∫ f dγ_E`; that if `f` is locally Lipschitz, the frontier of `A_f` is the graph of `Φ⁻¹ ∘ f` over the open set `{0 < f < 1}` and `γ_{E×ℝ}^{n}(frontier A_f) = ∫ √(I(f)² + ‖∇f‖²) dγ_E`. Prove Bobkov's inequality: for every locally Lipschitz `f : E → [0, 1]`, `I(∫ f dγ) ≤ ∫ √(I(f)² + ‖∇f‖²) dγ`, the right side in `[0, ∞]` and `∇f` the derivative where it exists, which is almost everywhere (`bobkov_inequality`), with equality for the constants and for `f(x) = Φ(α⟨x, ν⟩ + β)`, `α, β` real and `ν` a unit vector. Prove that for a nonempty closed `A ⊆ E` and `r > 0` the function `f_r = max(0, 1 − d_A/r)`, with `d_A = Metric.infDist · A`, is `(1/r)`-Lipschitz with values in `[0, 1]`, that `∫ f_r dγ → γ(A)` and `∫ I(f_r) dγ → 0` as `r ↓ 0`, and that `∫ ‖∇f_r‖ dγ ≤ (γ(Metric.thickening r A) − γ(A))/r`; with Bobkov's inequality these give the Minkowski-content inequality of §8.2 for nonempty closed sets by a second route, through §7.3 and subgraph sets instead of §8.1 (Bobkov1997 Corollary 1, inequality (10), p.209 (page marker line 72), stated there for locally Lipschitz `f` on `ℝ^n`, and for the approximation by `max(0, 1 − d_A/h)` the argument after Corollary 2, p.210 (page marker line 98); Ledoux1999 inequality (1.11) and its equivalence with (1.4), line 296–313; CianchiFuscoMaggiPratelli2011 equations (4.13) and (4.6), line 656–720 and 597–601, for the computation on subgraphs, (4.6) with the gradient of the section measure carrying the factor `√(2π)` of the Conventions; CarlenKerce2001 Theorem 1, cited by locator). A route: the measure by §1.3 and Fubini; the frontier by continuity of `f`; the area formula for the locally Lipschitz graph map `x ↦ (x, Φ⁻¹(f(x)))` on `{0 < f < 1}`, whose Jacobian `√(1 + ‖∇f‖²/I(f)²)` multiplied by the density `e^{−W_E}(x) φ(Φ⁻¹(f(x)))` gives the integrand; then §2.3 and §7.3 in `E × ℝ`. For the approximation: `d_A` is `1`-Lipschitz, and as `A` is closed and nonempty, `f_r` decreases to the indicator of `A` as `r ↓ 0`; dominated convergence, with the continuity of `I` on `[0, 1]` and `I(0) = I(1) = 0`, gives the two limits. At a point outside `{0 < d_A < r}`, that is in `A` or where `d_A ≥ r`, `f_r` attains its maximum `1` or its minimum `0`, so `∇f_r = 0` wherever it exists there, and `‖∇f_r‖ ≤ 1/r` everywhere it exists; as `{0 < d_A < r} = Metric.thickening r A ∖ A` for closed nonempty `A`, the gradient bound follows. With `√(I(f_r)² + ‖∇f_r‖²) ≤ I(f_r) + ‖∇f_r‖`, Bobkov's inequality for `f_r` and the lower limit as `r ↓ 0` give `I(γ(A)) ≤ liminf_{r ↓ 0} (γ(Metric.thickening r A) − γ(A))/r`. *Needs:* §1.1, §1.3, §2.3, §7.3; GeometricMeasureTheory G2 (area formula, graph surface measure); Mathlib `LipschitzWith.ae_differentiableAt`, `norm_fderiv_le_of_lipschitz`, `Metric.infDist`, `Metric.lipschitz_infDist_pt`, `Metric.thickening`.

- `A_f` is open, `A_{f′} ⊆ A_f` when `f′ ≤ f`, `A_0 = ∅` and `A_1 = E × ℝ`.
- For `f` constant `c` with `0 < c < 1`, `A_f = E × (−∞, Φ⁻¹(c))`, a half-space of measure `c`; the endpoint constants give `A_0 = ∅` and `A_1 = E × ℝ`, by the previous bullet, not by this formula.
- `A_f` is the Gaussian symmetral of §6.1 of any set whose sections over `E` have measures `f`.

**Checks.**

- `f(x) = Φ(x)` on `ℝ`: `∫ f dγ = 1/2`, `I(1/2) = 0.398942`, and `∫ √2 φ(x)² dx = 0.398942`; for `Φ(2x)` the right side is again `0.398942`: `A_f` is a half-plane in both cases.
- `f(x) = min(x², 1)` on `ℝ`: `∫ f dγ = 0.516059`, `I(0.516059) = 0.398619`, and the right side is `0.647406`.
- For constant `c` both sides equal `I(c)`; omitting `I(f)²` under the root makes the right side `0` and the inequality false.
- The right side can be infinite: `f(x) = (1 + sin(e^{x²}))/2` on `ℝ` is locally Lipschitz with values in `[0, 1]`, `|f′(x)| = |x| e^{x²} |cos(e^{x²})|`, and `∫ |f′| dγ = ∞` since `e^{x²} φ(x) = (2π)^{−1/2} e^{x²/2}` grows; the inequality holds trivially there, whereas a real-valued integral with the value `0` for non-integrable functions would assert `I(∫ f dγ) ≤ 0`, false since `0 < ∫ f dγ < 1`.
- Approximation of a closed set: for `A = {x_1 ≤ 0}` and `r = 1`, `f_1` is `1` on `A`, `1 − x_1` for `0 < x_1 < 1` and `0` for `x_1 ≥ 1`, so `∫ ‖∇f_1‖ dγ = Φ(1) − 1/2 = 0.341345`, equal to `(γ(Metric.thickening 1 A) − γ(A))/1 = Φ(1) − Φ(0)`, the open thickening being `{x_1 < 1}`; the bound is an equality for half-spaces. For `A = ∅`, `Metric.infDist · ∅ = 0` makes `f_r = 1` and `∫ f_r dγ = 1 ≠ γ(∅) = 0`, so the approximation is claimed for nonempty `A` only, and §8.2 at `∅` reads `0 ≥ I(0) = 0`.
- Endpoint constants: `f = 0` gives `A_f = ∅` of measure `0`, and `f = 1` gives `A_f = E × ℝ` of measure `1`, both equal to `∫ f dγ_E`. The half-space formula read with the quantile of `gaussianReal 0 1`, which is `0` at both levels `0` and `1`, would give `E × (−∞, 0)`, of measure `Φ(0) = 1/2` in both cases.

### 8.4 Concentration of Lipschitz functions

Prove that for `L ≥ 0`, an `L`-Lipschitz `f : E → ℝ` and a real `m` with `γ({f ≤ m}) ≥ 1/2`, `γ({f > m + Lr}) ≤ 1 − Φ(r) ≤ ½ e^{−r²/2}` for every `r ≥ 0` (`gaussian_concentration_median` for the first bound); if moreover `γ({f ≥ m}) ≥ 1/2`, then `γ({|f − m| > Lr}) ≤ 2(1 − Φ(r))` (Ledoux1993 inequality (10), line 257–262; Ledoux1999 inequality (1.6), line 225–226, which states for sets the bound `γ(Metric.thickening r A) ≥ Φ(r)` when `γ(A) ≥ 1/2`, here applied to `A = {f ≤ m}`, and the tail `e^{−r²/2}` without the factor `½`, which §1.2 supplies). A route: `{f ≤ m}` is closed and nonempty, its closed `r`-thickening lies in `{f ≤ m + Lr}` because nearest points exist in `E`, and §8.1 with `a = 0` and §1.2 conclude. *Needs:* §1.2, §8.1.

**Checks.**

- `f(x) = x_1`, `m = 0`, `L = 1`: `γ({f > r}) = 1 − Φ(r)`, an equality; at `r = 2`, `0.022750 ≤ 0.067668`.
- For `f` constant `m` and `r = 0` the non-strict set `{f ≥ m}` has measure `1 > 1/2 = 1 − Φ(0)`; the strict inequality in `{f > m + Lr}` is needed at `r = 0`.
- `f(x) = |x_1|` has median `Φ⁻¹(3/4) = 0.674490` and mean `0.797885`; the theorem concerns the median, RandomMatrices 2.2's Herbst bound the mean.
- `L = 0`: `f` is a constant `c`, `γ({f ≤ m}) ≥ 1/2` forces `c ≤ m`, so `{f > m}` is empty and the first bound holds; with also `γ({f ≥ m}) ≥ 1/2`, `c = m` and `{|f − m| > 0}` is empty. §8.5 with `S = 0` uses exactly this case; a version requiring `L > 0` would not cover it.

### 8.5 Maxima of Gaussian vectors

Prove that for a nonempty finite type `ι`, a square matrix `S`, `σ = max_i √(S_ii)` (with `√t = 0` for `t < 0`) and a real `m` with `γ_{0,S}({x : max_i x_i ≤ m}) ≥ 1/2`, `γ_{0,S}({x : max_i x_i > m + σr}) ≤ 1 − Φ(r)` for every `r ≥ 0` (`gaussian_max_concentration`; Ledoux1999 line 252–263, the derivation of inequality (1.8), which obtains the bound `Φ(r)` for the enlargement of `{max_i x_i ≤ m}` from (1.7) with `a = 0`, for a covariance matrix `M Mᵀ`; inequality (1.8) itself, line 266–271, records only the weaker tail `e^{−r²/2}`, for the supremum of a Gaussian process). A route: for positive semidefinite `S`, `x ↦ max_i (K x)_i` with `K = CFC.sqrt S` is `σ`-Lipschitz because the `i`-th row of `K` has norm `√((K²)_ii) = √(S_ii)`; apply §8.4 to `γ`. For `S` not positive semidefinite the law is `δ_0`, the hypothesis forces `m ≥ 0`, and `{max_i x_i > m + σr}` is `δ_0`-null as `m + σr ≥ 0`. *Needs:* §8.4; Mathlib `ProbabilityTheory.multivariateGaussian`.

**Checks.**

- One coordinate with `S = (1)`: the maximum is standard normal with median `0`, and the bound is an equality.
- Two independent standard normals: `σ = 1`, the median of the maximum is `Φ⁻¹(√(1/2)) = 0.544952`, and `P(max > 2.544952) = 1 − Φ(2.544952)² = 0.010899 ≤ 1 − Φ(2) = 0.022750`.
- `S = 0`: the maximum is `0`, every median is `≥ 0`, and the bound holds with `σ = 0`.
- `S = [[1, 2], [2, 1]]`, not positive semidefinite (eigenvalue `−1`): Mathlib's law is `δ_0`, `σ = 1`, the hypothesis gives `m ≥ 0`, and the left side is `0`.

### Examples

Under `γ` in `ℝ²` the unit disc has measure `0.393469`; its closed `1`-thickening has measure `0.864665`, above the half-space value `0.767217`.

### Dependencies

Layers 1, 2 and 7; GeometricMeasureTheory G2; Mathlib thickenings, the distance to a set, monotone differentiation and multivariate Gaussian laws; Tau Ceti's affine support of a multivariate Gaussian law and the range of a matrix square root.

## Layer 9: Gaussian symmetrisation of closed sets and Ehrhard's inequality

### 9.1 Closed symmetrals

For `F` and `u` as in §6.1 and a closed set `C ⊆ E`, define the closed symmetral `S̄_{F,u}(C) = {x + y : x ∈ F^⊥, y ∈ F, Φ(⟨y, u⟩) ≤ v_C(x)}` (`closedGaussianSymmetral F u C`), with `v_C(x) = γ_F(C_x)` (Ehrhard1983 Définition 1.1, line 117–129, in the mirrored superlevel convention: his half-space `H(u, a) = {⟨x, u⟩ > a}` (line 64–66) is a superlevel set, so with his `T = F^⊥` his `S(T, u)` is `S̄_{F,−u}` on closed sets). The same rule, read for an arbitrary set, appears in §9.5 for every convex `C`.

- For closed `C`, `x ↦ v_C(x)` is upper semicontinuous; for open `O`, `x ↦ v_O(x)` is lower semicontinuous. Hence `S̄_{F,u}(C)` is closed and `S_{F,u}(O)` is open.
- `γ(S̄_{F,u}(C)) = γ(C)`, and `S_{F,u}(C) ⊆ S̄_{F,u}(C)` with a null difference; `S̄_{F,u}` is monotone.
- `S_{F,u}(E ∖ C) = E ∖ S̄_{F,−u}(C)` (Ehrhard1983 Proposition 1.2, line 134–140).
- `S_{F,u}(⋃_j O_j) = ⋃_j S_{F,u}(O_j)` for increasing open `O_j`, and `S̄_{F,u}(⋂_j C_j) = ⋂_j S̄_{F,u}(C_j)` for decreasing closed `C_j`.
- If `F_1 ∩ F_2 = ℝ u` and the orthogonal complements of `ℝ u` in `F_1` and `F_2` are orthogonal, then `S̄_{F_2,u} ∘ S̄_{F_1,u} = S̄_{F_1 + F_2, u}` on closed sets (Ehrhard1983 Lemme 2.2 and Corollaire 2.3, line 329–355).

A route: Fatou's lemma on sections gives the semicontinuity; the composition law follows from Fubini along `F_1 + F_2 = F_1 ⊕ (F_2 ⊖ ℝu)` and the fact that after the first step every `F_1`-section is a sublevel half-space in direction `u`. *Needs:* §1.3, §6.1.

**Checks.**

- `C = closedBall(0, 1) ⊂ ℝ²`, `F = ℝ²`: `S̄_{F,u}(C) = {⟨y, u⟩ ≤ −0.270288}`, a closed half-plane of measure `0.393469`; the strict rule gives the open half-plane, which is not closed.
- In `ℝ³`, `closedBall(0, 1)` has measure `0.198748`; the composite `S̄_{span(e_2, e_3), e_3} ∘ S̄_{span(e_1, e_3), e_3}` and `S̄_{ℝ³, e_3}` both give `{x_3 ≤ −0.846102}`.
- The closed half-space `{⟨x, u⟩ ≤ a}` is fixed by `S̄_{F,u}`, while `S̄_{F,−u}` sends it to the different half-space `{⟨x, u⟩ ≥ −a}` of the same measure `Φ(a)`, `0.841345` at `a = 1`: the direction `u` is part of the data. Ehrhard's superlevel rule replaces each section, of measure `Φ(a)`, by the closed upper half-line of that measure, which is `{⟨y, u⟩ ≥ −a}`: it gives the same set, so his `S(T, u)` matches `S̄_{F,−u}` and not `S̄_{F,u}`.

### 9.2 One-dimensional symmetrisation of convex sets

Prove that `g(a, b) = Φ⁻¹(Φ(b) − Φ(a))` is concave on `{(a, b) ∈ ℝ² : a < b}`, with `g(a, b) → b` as `a → −∞` and `g(a, b) → −a` as `b → ∞`; and that for every unit vector `e` and every closed convex `C ⊆ E`, `S̄_{ℝe, e}(C)` is closed and convex (Ehrhard1983 Lemme 3.3, line 410–438, and Théorème 3.1 for one-dimensional symmetrisations, line 377–439). A route: the sections of `C` along `e` are closed segments or half-lines whose endpoints depend convexly and concavely on the base point; the symmetral replaces the segment `[a, b]` by `(−∞, g(a, b)]`, and `g` is increasing in `b`, decreasing in `a` and concave. *Needs:* §1.1, §9.1.

**Checks.**

- Second derivatives of `g`, obtained by differentiating `∂_a g = −φ(a)/φ(g)` and `∂_b g = φ(b)/φ(g)` once more, at `(−1, 1)`: `∂²_a g = ∂²_b g = −0.459912` and the Hessian determinant is `0.163502 > 0`; at `(0, 2)`, `(−3, −0.5)` and `(0.5, 0.6)` the Hessian is also negative definite (determinants `0.015519`, `0.000142`, `15.648788`).
- `g(−a, a) = Φ⁻¹(2Φ(a) − 1)`, so `g(−1, 1) = Φ⁻¹(2Φ(1) − 1) = 0.475233`, where `2Φ(1) − 1 = 0.682689` to six places.
- `(a, b) ↦ Φ(b) − Φ(a)` itself is not concave (it is convex in `b` for `b < 0`); the transformation by `Φ⁻¹` is what makes concavity hold.

### 9.3 The planar approximation theorem

Let `F` be a `2`-dimensional subspace and `u_0, u_1 ∈ F` orthonormal, and let `u_j` for `j ≥ 2` be the unit vector of `F` orthogonal to `u_{j−1} + u_0` with `⟨u_j, u_0⟩ < 0`; set `f_j = S̄_{ℝu_j, −u_j} ∘ ⋯ ∘ S̄_{ℝu_0, −u_0}`, which in the mirrored convention sends sections to superlevel half-lines as in Ehrhard's paper. Prove that `f_j(C) + ℝ_+ u_0 + ℝ_+ u_j ⊆ f_j(C)` for every closed `C` and every `j`; that for every `ε ∈ (0, 1/2)` there is `R(ε)` such that for every closed `C ⊆ F` with `γ_F(C) ∈ [ε, 1 − ε]` and every `R > R(ε)`, `f_j(C) ∩ closedBall(0, R)` converges in the Hausdorff metric to `S̄_{F, −u_1}(C) ∩ closedBall(0, R)`, uniformly in `C`; and that consequently, for every `2`-dimensional `F`, unit `u ∈ F` and closed convex `C ⊆ E`, `S̄_{F,u}(C)` is convex (Ehrhard1983 Exemple 1.4, Proposition 1.5 and Théorème 1.6, line 212–295, and the case of two-dimensional symmetrisations in the proof of Théorème 3.1, line 440–457). A route: the cone inclusion by induction on `j` from the one-dimensional case of §8.1 applied along each line in direction `u_{j+1}`; the convergence from the cone inclusions, since the cones `ℝ_+ u_0 + ℝ_+ u_j` increase to a half-plane; convexity from §9.2 applied to each `f_j(C)`: for bounded closed convex `C`, replace `C` by `C + D_r` with `D_r` the closed disc of radius `r > 0` in `F`, so that all nonempty `F`-sections have measures in some `[ε, 1 − ε]`, pass to the limit, which preserves convexity, and let `r ↓ 0` by outer continuity; for unbounded `C`, `S̄_{F,u}(C)` is the closure of the increasing union of the convex sets `S̄_{F,u}(C ∩ closedBall(0, R))`. *Needs:* §8.1 for `n = 1`, §9.1, §9.2.

**Checks.**

- The directions are `u_1` at `90°` from `u_0`, `u_2` at `135°`, `u_3` at `157.5°`, increasing to `180°`; the cones `ℝ_+ u_0 + ℝ_+ u_j` increase to the half-plane `{⟨x, u_1⟩ ≥ 0}`.
- A half-plane `{⟨x, u_1⟩ ≥ c}` is fixed by every `f_j` and equals its limit.
- For `C = closedBall(0, 1) ⊂ F = ℝ²` the limit is the closed half-plane `{⟨x, u_1⟩ ≥ 0.270288}`, of measure `0.393469`.

### 9.4 Convexity of closed symmetrals in every dimension

Prove that for every subspace `F` of dimension `k ≥ 1`, unit vector `u ∈ F` and closed convex `C ⊆ E`, `S̄_{F,u}(C)` is convex (Ehrhard1983 Théorème 3.1, line 367–369, which states it for closed convex sets and, for the symmetral `S_{F,u}`, for open convex ones; §9.5 deduces convexity of both symmetrals of every convex set from this closed case). A route: `k = 1` is §9.2 and `k = 2` is §9.3; for `k ≥ 3` choose subspaces `F_1, …, F_{k−1}` of dimension `2` containing `u` whose orthogonal complements of `ℝ u` are mutually orthogonal and span `F ⊖ ℝu`, and write `S̄_{F,u}` as the composite of the `S̄_{F_i,u}` by the composition law of §9.1 (Ehrhard1983 Corollaire 2.3, line 350–355). *Needs:* §9.1, §9.2, §9.3.

**Checks.**

- `C = closedBall(0, 1) ⊂ ℝ³`, `F = ℝ³`: the symmetral `{x_3 ≤ −0.846102}` is convex, and the two-step composite of §9.1 gives the same set.
- Two disjoint closed discs in `ℝ²` with `F = ℝ²` have a half-plane as symmetral: convexity of the symmetral does not imply convexity of the set.

### 9.5 Ehrhard's inequality for convex sets

Prove that for convex `A, B ⊆ E`, `θ ∈ [0, 1]` and reals `a, b` with `Φ(a) ≤ γ(A)` and `Φ(b) ≤ γ(B)`, `γ(θA + (1 − θ)B) ≥ Φ(θa + (1 − θ)b)` (`ehrhard_inequality_convex`); the hypotheses force `γ(A), γ(B) > 0`, so `A` and `B` are nonempty, and the set `θA + (1 − θ)B` is convex, hence null-measurable. Equivalently, when all three measures lie in `(0, 1)`, `Φ⁻¹(γ(θA + (1 − θ)B)) ≥ θ Φ⁻¹(γ(A)) + (1 − θ) Φ⁻¹(γ(B))` (Ehrhard1983 Théorème 3.2, line 374–376, with its proof at line 458–469; Bogachev1998 Chapter 4, cited by locator). A route: for `n = 0`, `γ` is the Dirac mass at the origin, the hypotheses force `A = B = E = {0}`, and `θA + (1 − θ)B = E` has measure `1`; let `n ≥ 1`, so that `E` has a unit vector. For compact convex `A, B`, the convex hull `C` of `A × {0} ∪ B × {1}` in `E × ℝ` has slices `C_t = (1 − t)A + tB` for `t ∈ [0, 1]`; by §9.4 the closed symmetral of `C` along `E × {0}` in a direction of `E` is convex, which says that `t ↦ Φ⁻¹(γ(C_t))` is concave. In general, if `γ(A) = 0` or `γ(B) = 0` the hypothesis cannot hold for real `a` or `b`; otherwise `A` and `B` have nonempty interiors and null frontiers, and compact convex exhaustions of the interiors conclude.

Deduce that for every subspace `F` of dimension `k ≥ 1`, unit vector `u ∈ F` and convex `C ⊆ E`, with no topological assumption, the closed symmetral `S̄_{F,u}(C)` of §9.1 (`convex_closedGaussianSymmetral`) and the symmetral `S_{F,u}(C)` of §6.1 are convex; the sections of `C` are convex, hence `γ_F`-null-measurable. For closed `C` and `S̄_{F,u}`, and for open `C` and `S_{F,u}`, this is Ehrhard1983 Théorème 3.1, line 367–369. A route: for two points `x + y` and `x′ + y′` of `S̄_{F,u}(C)`, with `x, x′ ∈ F^⊥` and `y, y′ ∈ F`, the sections `C_x` and `C_{x′}` are convex subsets of `F` with `Φ(⟨y, u⟩) ≤ γ_F(C_x)` and `Φ(⟨y′, u⟩) ≤ γ_F(C_{x′})`; the inequality above, in `F` with `γ_F`, gives `γ_F(θC_x + (1 − θ)C_{x′}) ≥ Φ(⟨θy + (1 − θ)y′, u⟩)` for `θ ∈ [0, 1]`, and `θC_x + (1 − θ)C_{x′} ⊆ C_{θx + (1 − θ)x′}` because `C` is convex. For the strict rule of `S_{F,u}`, first raise the two levels to reals `s > ⟨y, u⟩` and `s′ > ⟨y′, u⟩` with `Φ(s) ≤ v_C(x)` and `Φ(s′) ≤ v_C(x′)`, which the continuity of `Φ` allows, and use `θ⟨y, u⟩ + (1 − θ)⟨y′, u⟩ < θs + (1 − θ)s′`. *Needs:* §1.3, §6.1, §9.1, §9.4; Mathlib `Convex.nullMeasurableSet`; Tau Ceti `TauCeti.hasPrekopaLeindler_volume`, `MeasureTheory.Measure.HasPrekopaLeindler.withDensity` for the comparison Check only.

**Checks.**

- In `ℝ`, `A = [−1, 1]`, `B = [−3, 3]`, `θ = 1/2`: `Φ⁻¹(γ([−2, 2])) = 1.690143 ≥ ½(0.475233) + ½(2.782175) = 1.628704`.
- For half-spaces `{x_1 ≤ a}`, `{x_1 ≤ b}` the inequality is an equality.
- Gaussian Brunn–Minkowski: since `Φ` is log-concave, the theorem implies `γ(θA + (1 − θ)B) ≥ γ(A)^θ γ(B)^{1−θ}`, the bound that Prékopa–Leindler gives for the log-concave density of `γ` (Tau Ceti's `TauCeti.hasPrekopaLeindler_volume` with `MeasureTheory.Measure.HasPrekopaLeindler.withDensity`, applied to indicators); in the example, `γ([−2, 2]) = 0.954500 ≥ Φ(1.628704) = 0.948312 ≥ (0.682689 · 0.997300)^{1/2} = 0.825134`, so Ehrhard's bound is the stronger one.
- Writing `A + r · closedBall(0, 1) = θ(A/θ) + (1 − θ)(r/(1 − θ)) · closedBall(0, 1)` and letting `θ → 1` recovers Borell's inequality of §8.1 for convex `A`. In `ℝ` with `A = [−1, 1]`, `r = 1`, `θ = 0.9`, the right side is `0.9 · Φ⁻¹(0.733479) + 0.1 · Φ⁻¹(1 − 1.524 · 10^{−23}) = 0.561033 + 0.993113 = 1.554146`, below `Φ⁻¹(γ([−2, 2])) = 1.690143`, and the limit `θ → 1` is `Φ⁻¹(γ([−1, 1])) + 1 = 1.475233`.
- A convex set that is neither open nor closed: in `ℝ²` with `F = ℝe_2` and `u = e_2`, `C = {x_1 > 0} ∪ ({0} × [0, ∞))` has `v_C(x_1) = 1` for `x_1 > 0`, `v_C(0) = 1/2` and `v_C(x_1) = 0` for `x_1 < 0`, so `S̄_{F,u}(C) = {x_1 > 0} ∪ ({0} × (−∞, 0])` and `S_{F,u}(C) = {x_1 > 0} ∪ ({0} × (−∞, 0))`, both convex and neither open nor closed; the points `(0, −5)` and `(1, 100)` of `S̄_{F,u}(C)` have midpoint `(1/2, 47.5)`, where `Φ(47.5) ≤ v_C(1/2) = 1`. A rule reading the sections of `closure C = {x_1 ≥ 0}` would give `{x_1 ≥ 0}` instead.

### Examples

In `ℝ³` the closed unit ball, of Gaussian measure `0.198748`, symmetrises to the closed half-space `{x_3 ≤ −0.846102}`, by one three-dimensional symmetral or by two two-dimensional ones.

### Dependencies

Layers 1, 6 and 8 (the latter only on the line); Mathlib convexity; Tau Ceti's Prékopa–Leindler property, for one Check of §9.5.

## Downstream consumers

- GaussianIsoperimetryAndClusters, Part II, proving the Gaussian double- and multi-bubble theorems for `3 ≤ q ≤ n + 1` (Scope and ownership): it consumes the clusters, interfaces, existence theorem and interface quadratic form of Layer 3, the model profile and its differential identities of Layer 4, and the two-cell case of §7.4 as the base of the induction on `q`.
- RandomMatrices 2.2 (Herbst's mean-centred bound from the logarithmic Sobolev inequality) and BanachSpaceTheory B7 (sphere concentration for Dvoretzky's theorem) obtain their concentration by other routes and do not depend on this roadmap; §§8.4–8.5 supply the sharp median-centred constants for Gaussian measures to any roadmap that needs them.

## References

- [MilmanNeeman2022] Emanuel Milman and Joe Neeman, *The Gaussian double-bubble and multi-bubble conjectures*, Annals of Mathematics 195 (2022), 89–206; arXiv:1805.10961v3. Sections 1–4 and 11.
- [CianchiFuscoMaggiPratelli2011] Andrea Cianchi, Nicola Fusco, Francesco Maggi and Aldo Pratelli, *On the isoperimetric deficit in Gauss space*, American Journal of Mathematics 133 (2011), 131–186; preprint on cvgmt (cvgmt.sns.it, paper 1587), the version read: every section, lemma, equation and line locator refers to it. Sections 2–4.
- [Ehrhard1983] Antoine Ehrhard, *Symétrisation dans l'espace de Gauss*, Mathematica Scandinavica 53 (1983), 281–301. Sections 1–3.
- [Borell1975] Christer Borell, *The Brunn–Minkowski inequality in Gauss space*, Inventiones Mathematicae 30 (1975), 207–216. Theorem 3.1.
- [SudakovTsirelson1974] V. N. Sudakov and B. S. Tsirel'son, *Extremal properties of half-spaces for spherically invariant measures*, Zapiski Nauchnykh Seminarov LOMI 41 (1974), 14–24. Theorem 1, cited by locator.
- [Ledoux1993] Michel Ledoux, *Inégalités isopérimétriques en analyse et probabilités*, Séminaire Bourbaki exposé 773, Astérisque 216 (1993), 343–375. Théorème 3 and inequality (10).
- [Ledoux1999] Michel Ledoux, *Concentration of measure and logarithmic Sobolev inequalities*, Séminaire de Probabilités XXXIII, Lecture Notes in Mathematics 1709 (1999), 120–216. Section 1.2.
- [Bobkov1997] Sergey G. Bobkov, *An isoperimetric inequality on the discrete cube, and an elementary proof of the isoperimetric inequality in Gauss space*, Annals of Probability 25 (1997), 206–214. Corollary 1, inequality (10), p.209, and the approximation argument after Corollary 2, p.210.
- [CarlenKerce2001] Eric A. Carlen and C. Kerce, *On the cases of equality in Bobkov's inequality and Gaussian rearrangement*, Calculus of Variations and PDE 13 (2001), 1–18. Theorem 1, cited by locator.
- [Maggi2012] Francesco Maggi, *Sets of Finite Perimeter and Geometric Variational Problems*, Cambridge University Press (2012). Sections 13.1 and 18.1–18.3 and the Part IV synopsis, read in the author's extract (contents and synopsis); Theorem 15.9, Proposition 12.15, Theorem 12.26 and Exercise 29.7, cited by locator.
- [AmbrosioFuscoPallara2000] Luigi Ambrosio, Nicola Fusco and Diego Pallara, *Functions of Bounded Variation and Free Discontinuity Problems*, Oxford University Press (2000). Theorem 3.108, cited by locator.
- [Bogachev1998] Vladimir I. Bogachev, *Gaussian Measures*, American Mathematical Society (1998). Chapter 4, cited by locator.
