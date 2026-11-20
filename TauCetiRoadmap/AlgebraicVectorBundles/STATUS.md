<!--tauceti-status:v1 {"roadmap":"AlgebraicVectorBundles","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"stalks of pullback along ringed-space morphisms and strong monoidal pullback on all module sheaves","state":"untouched"},{"id":"Layer 2","remaining":"exactness of flat pullback on all module sheaves and flat base change of internal Hom into an arbitrary target","state":"untouched"},{"id":"Layer 3","remaining":"stalks and pullback of powers on all modules, the determinant of an extension with its split-case sign, Picard additivity, graded-line comparison","state":"partial"},{"id":"Layer 4","remaining":"weight grading of affine schemes with an action of the affine line, the general morphism correspondence, and the recognition theorem","state":"partial"}],"readme_sha":"a2fcac57c18335ecd470286b8d0d29ee4574bb58837a8866b7c310aade6932f6","roadmap":"AlgebraicVectorBundles","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: AlgebraicVectorBundles

This file documents the status of the AlgebraicVectorBundles roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The foundations the earlier roadmap asked for are background. These include the sheaf, relative-Spec and linear-scheme layers, `QCoh(X)ᵒᵖ ≃ LinearSch(X)`, and geometric vector bundles. Of the four current layers, Layer 3 has its sheaf exterior multiplication and Layer 4 has an affine special case of its morphism correspondence. Layers 1 and 2 have not begun.

### Named results

- **Linear schemes are dual to quasi-coherent sheaves** — `linearSpec F = Spec_X Sym F` and the degree-one functor are quasi-inverse between `QCoh(X)ᵒᵖ` and affine `X`-schemes whose grading is freely generated in degree one ([`linearSpecEquiv`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/VectorBundle/LinearScheme.html#TauCeti.AlgebraicGeometry.linearSpecEquiv)).
- **Points of a vector bundle are sections** — morphisms `T → Spec_X Sym(E^∨)` over `X` are sections of `q^* E`, naturally in `E` and `T` ([`totalSpaceHomIso`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/VectorBundle/TotalSpace/FunctorOfPoints.html#TauCeti.AlgebraicGeometry.totalSpaceHomIso)). The total space also carries the scalar action of `𝔸¹_X`, and base change of the bundle keeps its grading.
- **Dualizable means finite locally free** — on any scheme, a quasi-coherent sheaf has a dual in `QCoh(X)` exactly when it is finite locally free ([`nonempty_hasLeftDual_iff_isFiniteLocallyFree`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/VectorBundle/Dual/Dualizable.html#TauCeti.AlgebraicGeometry.QuasicoherentSheaf.nonempty_hasLeftDual_iff_isFiniteLocallyFree)).
- **Polynomial operations commute with pullback on quasi-coherent sheaves** — on schemes, symmetric and exterior powers commute with pullback along every morphism ([`isIso_pullbackSymmetricPowerComparison_app`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Modules/SymmetricPower/Pullback/Quasicoherent.html#TauCeti.AlgebraicGeometry.isIso_pullbackSymmetricPowerComparison_app)), and so does the determinant ([`pullbackDetIso`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/VectorBundle/Determinant/Pullback.html#TauCeti.AlgebraicGeometry.FiniteLocallyFreeSheaf.pullbackDetIso)).
- **Linear morphisms of linear spectra over an affine base** — over `Spec R`, a morphism `Spec(Sym F) → Spec(Sym F′)` commutes with the action of the affine line exactly when it is induced by a unique map `F′ → F` ([`isModHom_iff_exists_relativeSpec_map`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/RelativeSpec/SymmetricAlgebra/Recognition.html#TauCeti.AlgebraicGeometry.isModHom_iff_exists_relativeSpec_map)).

### Notable definitions and infrastructure

- **Exterior multiplication of module sheaves** — the sheafified wedge product `∧ⁱ M ⊗ ∧ʲ M → ∧ⁱ⁺ʲ M` ([`exteriorPowerMul`](https://taucetiproject.org/docs/TauCeti/Algebra/Category/ModuleCat/Sheaf/ExteriorPower/Mul.html#SheafOfModules.exteriorPowerMul)). It is natural, associative, unital, and graded commutative with sign `(−1)^(ij)`. It is the multiplication from which the determinant of an extension is to be built.
- **The free determinant comparison** — for `0 → M → N → P → 0` with `M` and `P` finite free over any commutative ring, `∧ᵃ M ⊗ ∧ᶜ P ≅ ∧ᵃ⁺ᶜ N`, independent of bases and lifts ([`shortExactEquivOfBasis`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/ExteriorPower/FreeShortExact.html#TauCeti.exteriorPower.shortExactEquivOfBasis)). It is the local piece the sheaf isomorphism `γ` must glue.
- **The determinant at locally constant rank** — `det E` is `∧ⁿ E` over the clopen locus of rank `n` ([`det`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/VectorBundle/Determinant/LocallyConstantRank.html#TauCeti.AlgebraicGeometry.FiniteLocallyFreeSheaf.det)). This is the object whose behaviour on short exact sequences Layer 3 must establish.

### Roadmap coverage

Layers 1 and 2 are untouched. There is no stalk formula for a pulled-back module, no `pullback_tensor_isIso`, no exactness of flat pullback on all module sheaves, and no `isIso_pullbackIhomComparison_app_of_flat`. Their quasi-coherent special cases remain background. Layer 3 is partial. The exterior multiplication of §3.2 is done. Still missing are the stalks of powers and `symmetricPower_pullback_isIso`/`exteriorPower_pullback_isIso` on all modules (§3.1), the gluing of `γ`, the direct-sum sign and `mk_determinantObj_of_shortExact` (§3.2), and the graded-line comparison (§3.3). Layer 4 is partial in a narrow sense. The correspondence between action-preserving and grading-preserving morphisms is proved only between linear spectra over an affine base. Not begun are the weight grading of a general affine scheme with an `𝔸¹_X`-action and the recognition theorem.

## The frontier

- **The determinant of an extension (Layer 3)** — glue the free comparison into `γ : det E′ ⊗ det E″ ≅ det E` using the new exterior multiplication. Then prove naturality, filtration associativity, pullback compatibility, the split case with sign `(−1)^(rank E · rank F)`, and `mk_determinantObj_of_shortExact` in the Picard group.
- **Stalks of a pulled-back module (Layer 1)** — `(f^* G)_y ≅ 𝒪_{Y,y} ⊗ G_{f(y)}` for a morphism of ringed spaces. Layer 1's strong monoidal pullback, Layer 2's exactness and flat-Hom statements, and Layer 3's power comparisons on all modules all route through it.
- **Strong monoidal pullback on all module sheaves (Layer 1)** — invertibility of the oplax comparison `δ` with no quasi-coherence hypothesis, checked on stalks, together with its identity and composition coherences.
- **Weight grading and recognition (Layer 4)** — grade the functions of an affine scheme with an `𝔸¹_X`-action by weight, extend the morphism correspondence beyond linear spectra over an affine base, and prove that module schemes whose weight-graded algebra is free in degree one are exactly the linear schemes.
- **Flat pullback into arbitrary targets (Layer 2)** — exactness on all module sheaves, finite presentation of pullback along ringed-space morphisms, and flat base change of internal Hom into a non-quasi-coherent target. The graded-line comparison of §3.3 separately waits on PadicMeasuresIwasawaAlgebras §5.1.
